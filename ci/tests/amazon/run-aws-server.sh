#!/bin/bash

# while sleep 9m; do echo -e '\n=====[ Gradle build is still running ]====='; done &

echo "Running localstack docker image..."
docker run -d -e 'SERVICES=cloudwatch,logs,s3,s3api,secretsmanager' -p 4567-4584:4567-4584 -p 8080:8080 --name localstack -e DOCKER_HOST=unix:///var/run/docker.sock localstack/localstack

docker ps | grep "localstack"
retVal=$?
if [ $retVal == 0 ]; then
    echo "localstack docker image is running."
else
    echo "localstack docker image failed to start."
    exit $retVal
fi
