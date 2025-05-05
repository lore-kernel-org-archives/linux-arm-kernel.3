Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCA8C3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=; b=Qp5B6fX1p0Ex3kJxlE70zWQSRx
	5g3Q4UcXzQOMCmO/sFrQy3g6Dy+7AxZJLPbLcuhkUobEXL+UVgxdLj5Xu26IuZAhBbsplWS8hgb/w
	MR7Ugcz/XQENOOGaPgOSVei2NWTF183QW+a7OKq1HVX/5OaLDZA7RIU5vPfBdUdLjkutVbwkVbcp4
	GsvLQQe7nEBu4ZnKVAORuDYoATXl5eofbM7SfaTCQIQTSj0FMovGGKXAnJDr0Pnt7Vqk3z689+MLI
	d1EHZcu43MinnObC4U/noQRByvVBkrNMVt4FNxDZG4kfRGfrFL0bUBKj6vDGVYK4DWa/sN2Ba4O+L
	GOTNzvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBu9b-00000007Bdn-32Am;
	Mon, 05 May 2025 11:38:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBu7a-00000007BDv-0z8Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 11:36:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so2726033f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746444988; x=1747049788; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=fB7hGV/RdyzbnUkUy29oZbiRww76aeYSalA8zxpMSRHikUi4Lqdsb6hg8WJoo/ZP84
         23RPmlUvbyhk+jFwAKjWCNVMHfS6Kr05B03pCYtMXwpkcI8NZQFtFGkmp5qXXvvj4F2P
         fVAzIgt5K+h28fzdU84ZNZXK60sIAhlR7kFTtwekALidzNAg07OgGJ+lOgd76B1PLhNp
         ZX0iEHbUq6MsnMIHiP4gphgpzWwuwIG6LFU/yA7ZnWgR5quhmJuLxoX0GRG4JaYIxWDL
         8ZDbe8m1SI6A4pm0T/m3iiGtaNNl0+biksFEY+IADD6RyRI9xN0piN7BZud0Uv92yeg1
         oNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444988; x=1747049788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=Q8TCQ9GDoIEAV6XE1BUEDyc6jLUgISHnFnZzcLXB5KVSr3lYYusn5r2JGJZ04hXoiA
         J2aEc9e7i6A8OUsvBLlg5yPOqTExxtdtuADhJ8gGef8ac+S+2OC2pD89c1AegvoWIaNf
         yWFtYKmEPVLVJyGSLlYooPCLZtieoeErql4qropc/mpE9IXW19QGNw+B2WTWYLfwBOR3
         w/vvL3mp+lI5qBpVRC70DbIfvh/KghY91bSmPyZNzYwgERlt6sHftu5H5vZ9NOM1fhZn
         FPD5rezbtS98gQSuUsVeeKbxGa30RSdXblAGhu7EGtPiPuwwj7cu2uI1+nwpJRxeS0ue
         N61w==
X-Forwarded-Encrypted: i=1; AJvYcCX1kOJZ7RCcuGIs8rHkyg0lavDfy9dws9fnNf8bGiizSeOIpo/McmoTdr5jfE8fKKnlEdWGZGNJcIZX08bo4/MV@lists.infradead.org
X-Gm-Message-State: AOJu0YwWKj8j+tjj28iABYMQMlldFsYpNWKvdWAORzZhAL2XpI4uqhiI
	hawl94enBQDcCasWMNtMnemMK35gYoqQdEpjA8InpVNEvTYc+K6FtMiYUO+l6zc=
X-Gm-Gg: ASbGncu6o6lQwu9NaqQJYc58YFEvZObGyJtdCB9iP1pCE2XiyFO1zKuMVUVgRDhKKDJ
	uwpDWzn0uMS4x1NIysz+VWN0LUqzIqP5cA0eZRQROakHmj6bIu5ht1xdcGIUSEt0zkjQwhHw2Qe
	kpwi+IvM/i4RhnMwW4CzQOY8hUG4ISJ17Na7WJLoNfyxhjsCpSscfaphCjvP7/EdVhl9VrKrtOX
	TOgD/eshyULA+zzEQMhQv4jIx0sXZDeSeXvV+1uhpGAueTmoIFsoeVZO4stBF1zo/T6isPmsQAo
	wA9G1X4gbXsdrbNLDD5rQYnUjMKTemTa4szSY4ihB/yZkQ==
X-Google-Smtp-Source: AGHT+IHX3DPUoK2CBbvL9XMu5PuYfd3Tv12xdlZ7tadSos7vJLC5At+2jHITPcFn3QPH+KLU59woSg==
X-Received: by 2002:a5d:47a8:0:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a09cf3df66mr7016749f8f.55.1746444988093;
        Mon, 05 May 2025 04:36:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae3c1fsm10234470f8f.37.2025.05.05.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:36:27 -0700 (PDT)
Date: Mon, 5 May 2025 14:36:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Girish Pathak <Girish.Pathak@arm.com>, Peng Fan <peng.fan@nxp.com>,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1746443762.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_043630_290332_9A696B66 
X-CRM114-Status: GOOD (  11.75  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds GPIO support to the SCMI pin control driver.
AKASHI Takahiro did some of that work earlier, but we decided to make
this a part of the pinctrl driver instead of a separate GPIO driver.

I'm not really sure how the device tree stuff wires it all in.  I've
been using a mock driver on SCP with virtio to test it.

Dan Carpenter (7):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl: introduce pinctrl_gpio_get_config()
  pinctrl-scmi: implement PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 146 +++++++++-------
 drivers/pinctrl/core.c                  |  35 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 339 insertions(+), 69 deletions(-)

-- 
2.47.2


