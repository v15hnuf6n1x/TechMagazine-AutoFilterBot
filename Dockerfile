FROM python:3.10.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN python -m pip install pymongo==3.6
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /eva
WORKDIR /eva
COPY start.sh /start.sh
CMD ["/bin/bash", "/start.sh"]
