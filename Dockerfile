FROM dependabot/dependabot-core:latest

ARG CODE_DIR=/dependabot-script
USER root
ENV CODE_DIR ${CODE_DIR}
WORKDIR ${CODE_DIR}

COPY --chown=dependabot:dependabot . ${CODE_DIR}
RUN bundle config set --local path "vendor" \
 && bundle install --jobs 4 --retry 3

CMD ["bundle", "exec", "ruby", "./generic-update-script.rb"]
