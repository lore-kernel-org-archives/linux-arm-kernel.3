Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629831094468
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vxcTJFOmewD2GhiVVB+6YPckSGMQdPbVx332O/W6xHg=; b=Xe5dMV1bkuBAimn1hu6MUtYZD3
	FONR6dTUtQEPvgCf1IaaOfwAYzbSoB/hFv8UJZI/m6L2p2JtearQv0uYvkE+iVZ9dIntyGgJrPXqq
	0pPt72dXrkIqhqFPGkh0AiuI6svjkmtHq32GlMwiK60aS8TH2KQUaLe4HcjYTqctsLJEjjm21Y4Bk
	shaZRZ7M3NX32K0zob+K7Jjuq39Rhmj3cFAVrBia5So5qDqqcBtPgAqeeCvyAUOzHXp6Xn9rkiozA
	zuS8JRRxaVQykSHZkxXzVn0D7qliEMREarxgyqgCjUExPv8XbdU3g87eIIK1bsfU2ytYctjvFEcbh
	PUpYmCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tKf-0000000EKtm-2JzS;
	Sat, 21 Mar 2026 10:13:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3tKc-0000000EKtG-2hZz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 10:13:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486fe655187so19051935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Mar 2026 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774088000; x=1774692800; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vxcTJFOmewD2GhiVVB+6YPckSGMQdPbVx332O/W6xHg=;
        b=tD9i9mo6jH2L6cwBH9C2BoUMdoGFtwP5kqgYPgiDn8i3n6gln5/tD/ZothB6lRjDBf
         NZ61se/JFgTk8n1xhiw3Da/mpzEMsRb/tChHHmuzZLKeb9dvx6P2DofiLSJOsveSy+j2
         +OU95wX08nkH/pQ026dgr2WWDRfT4qqmv/bnsj7X4vml6zG8bhH1I3UolZxu6Jkm6GxL
         91/Rp0bf9Q8MTncayy/liNT0zFrzVDahPEwZ00657YeKLwilpAjTEiV+bjjsk5roNg9d
         UH3lsPTzv/zA5tCVXt+1jjwto2CaJk1+lI6uNwia1drR944Nj0QVf598vaEOdKmmc2Nx
         psBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774088000; x=1774692800;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxcTJFOmewD2GhiVVB+6YPckSGMQdPbVx332O/W6xHg=;
        b=cz5XATrhRulLSYd7keoqzR4zrCRXIV2gd5YDfdXzP4rcj4TfNCUq2mRCISi631nunp
         DMezieuaBMZeWAex7PPixcnf3lpPq+IVwpdfsw96WufM8usyUoliKSM4NjLaRJpM3/P+
         Z4uqhRSTJlor7EoGHejoZqZ7n2TMEd9aupzdgKDB6szW80g5nPp9AqQbepVRVxzoSK0n
         FsLpwEhyl5rMhW/F2i9qbX7VNJlWBHFid+YWgaBisunWFOVL9qd7LBHDt3pP//z5jglN
         AjFr7npp4afpWA6ZNyr3xDrnBnuFKIiibREEqd1u5tRWtejuD5CB6vunEAelosDGdgGh
         E9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWS/TayDdZBEzgoKOr//stNN40CqXJj2cUA7lzpRyWc2+IbHXqaW4vyIa/Kn/TotJDTo6BbZSk7drldVk3F2Hpc@lists.infradead.org
X-Gm-Message-State: AOJu0YzfRQVrdwnyLD6EYzgsgKYoQASenHR5UVB/umrj4BGZh3o0EtsY
	cJTc1KYqkQ4wEC7Vmk7Zttc978HyAinQxxGP5eyLY3Xh9U4M5XioMTC7ZSsSYqQfkQLXv8x038k
	AGxm/
X-Gm-Gg: ATEYQzysBKiX0d4cdNmr+cjjn1tJHmm9vI8dzQovzQ3NBN63TQW//NfKLYmi9zrht7P
	RmSB6wSwGyhh/bDcCaiw7U2zjqxnjgT+80vgdCfDJuru+EH0r1Xe4Qn4FJmTPemrVsvVxaFzPdJ
	Z+/xKQCJL9kRHeWjRdDROJY5CmdMFThfLU+T6wsVTEY5ycjlR9ToBU0lvAAnzUJmMSWrEO0WwY8
	KB6jmOerp0tB8zd0TWZoG3x6DvzBLgJ+ZnMIaUiDmkCv+DB0qeWdirBkOMCtIuxRWQ3wHfi1ZLk
	lkxpwMXvmYXdrWnUlReAjVSkSFZFnl5KKvkyeRmudSbszjbqAghmEUhb+HuMsmclD0nGP6nNhk8
	jbrLyU0UO9pBAMt9R/w2QNa8DZovLolebhL8klUM+v7i+m5/Cee7AWIihIeIru5ixqs/QrwFu0I
	og350r4Ragrf/99dh+bDZQHTC/INOj
X-Received: by 2002:a05:600c:3490:b0:487:300:d9ca with SMTP id 5b1f17b1804b1-4870300db54mr39007055e9.31.1774088000252;
        Sat, 21 Mar 2026 03:13:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487031790fdsm68147015e9.3.2026.03.21.03.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:13:19 -0700 (PDT)
Date: Sat, 21 Mar 2026 13:13:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v5 0/7] gpio: introduce a gpio driver for SCMI
Message-ID: <cover.1774087290.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_031322_721163_B6EF2315 
X-CRM114-Status: GOOD (  11.12  )
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

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

v5: Addresses Andy's cleanups to the driver.
    Adrresses Krzysztof's comments about the dt spec file.
    And almost all the subsystem prefixes were wrong.

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file

v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  gpio: dt-bindings: Add bindings for pinctrl based generic gpio driver
  gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: scmi: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
  firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  59 ++++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |  13 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 101 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  31 ++++++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++---
 include/linux/pinctrl/consumer.h              |   9 ++
 8 files changed, 249 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.51.0


