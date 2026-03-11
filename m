Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4301125875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+AkwVqaWf8hy65M6kQXD8z5ogodn290MdxFGjaBkgY=; b=tOawUNmUcpSlWnXbcrM8T72pOW
	6y58boPqoqkFbqldaLJHo/QYaQfydHbAqWVjax+X0GvqjxAtSbcAojg/pBJdefg9ooE6WK9tx7o04
	Ztlz0rvCM21MFeSqCP0fWcn+08fn6bBt8GWAOtQzcWKywGdJaTaJQnkOw3fZBRzhrpv4kBmj0dPvV
	eYJqlV0Cf41kyT9zz8h7hjy9nPWu0+ea2pn+mcgS3YrXFADOejVtUNFxDHhVRfDSJLS1vrkdXjK/y
	4zXNyW2svIPyhKXCdft1qzrjEDLtRa2x1gByHXYXdVaeF2kgfKSRUvUWMxu9707f0hztQghHNghJH
	bz5gnTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PNg-0000000CMgd-3DGs;
	Wed, 11 Mar 2026 19:38:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PNd-0000000CMfw-3OY0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:38:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439b9b190easo182597f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 12:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257883; x=1773862683; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+AkwVqaWf8hy65M6kQXD8z5ogodn290MdxFGjaBkgY=;
        b=BQT5W/EB4M91uiBn4Be/rPtPtprOMm64ETrPr0B7ClaYPPFUb04ayYB8YukjmqBcXd
         AFSM5zeK69WFeT9dxBzFL4rV03BVDLO/dwFbUjWaaKCzwewtdpvOuWLk02XEQqO+5XXg
         3SvXRnOhOqUxvxtw6X9trIxVY7lwp6X3YpLzbRfcB20iz2G/nHxJ7+00jiX93YtWf9gQ
         px2TIk0BsjMhmQHnT12qFW162jNdOPNWejIxw7HCcYow1q5WngxAKZx4IiwXU2hMVT0U
         IPK+qd7Up1HUorQRe/yNkOOtHCbzt6fLjZNN7VoABwo1hiXLR8sTthbqslG/d82NCTjm
         0JBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257883; x=1773862683;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+AkwVqaWf8hy65M6kQXD8z5ogodn290MdxFGjaBkgY=;
        b=gQLDR/Kf3vNQiEv8FQh7eOwZeS60MX3zG7QI3rpD+d97Lm0EOJIz0ls8sdol7c/FY2
         WIOGEoNiDHlY5E38UZDRYMysF78ZP6MxFhXIp1J8gKS8xZpSufTnkA0kHgQE+eao2+ly
         XMfee0bLpI+KhIxjgzQnjLDcKJ5SrgIfBee0XnsWp+wxdpnHpzsTP8w8z2tv7GpnPZXQ
         PgnPZ1TlzyQap4oPS1+lk1HVc8hHjkRB98SqH28MU4Lw9G8AkznKTsM/J0oJ8ff0JC3j
         L9pbb7xAOA202hMYbVqdnQTYmbtgyvUyhcfe4wb3RHKXNuj9Xs3wP8KNJZb9ZjZhexZ+
         +cPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkev5TkvU8GUl2zyj02FaMX6AGkF0O+RwqtnZx420LIrLJAE4UGEWn364mG5TzPcearrX68nsYyT/NuwTGie59@lists.infradead.org
X-Gm-Message-State: AOJu0YxHldcgC9voOD2hoOOIzJbn1SspF3GE5hOO0fzA3SZlQ3tPayTY
	x8oAKnd7eWRb7TZTvunBpxwQ8eu0Ke3Z7ZJSfhbO3NExxAEfqGotDljVVALnOrWbyKtTZxHg83W
	ExSeO
X-Gm-Gg: ATEYQzxNL6WEVqewSYwoiC/74yqb/pviWuCchSmX72EKYfOujg7z00qftUEZw7fZVea
	5Wn9l1K89kei5T22BgQ/tVxUb3CVb25NnpsEI9dwlUKdPywVJUdKACstW9wr1zT9QKQSXazFgO5
	iK10pt6o7NYPlhZHMRMxiGui4QIXPhXii+9TPEwRGnbFYJV2hG6qN9iuj6xYFa8ZmFfr7hbx43g
	cTEEsHda6yJ90FBRvM1ofsdwZMz6NBZdsyUBiyI0hVaZXxRTG7qnxj+2BdPERTlRS1gdjIjI3t/
	eof5C1jSe+nU1HzN4VqCgbZzvfOgvfd3h2gxGSOjMJE23m5nEAfuSBzSFPVb29lrWAGnxpL9RBf
	7N8wPDxKHoW73TLCp46qiGqd9Ulz/BIakMKrsGwQOUzuN7LxbmRpRbIXq8/sz/WSZ57kuELlAK9
	qbV3lMMX/nuzScRMXPoaSRx372YFjS
X-Received: by 2002:a05:6000:1a8f:b0:439:bdd7:425d with SMTP id ffacd0b85a97d-439f8200089mr7617923f8f.23.1773257883423;
        Wed, 11 Mar 2026 12:38:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm1426159f8f.12.2026.03.11.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:02 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:37:59 +0300
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
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v3 0/7] gpio: introduce a gpio driver for SCMI
Message-ID: <cover.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_123805_879750_5F52FC54 
X-CRM114-Status: GOOD (  18.17  )
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

In the review comments, to that patchset we had discussed putting the
gpio section inside the pinctrl section.  The ordering problems are a
bit tricky because you want the pinctrl driver to finish probing before
you start probing the gpio driver.  To me it seems nicer to put the
pinctrl things such as pinmuxing in the pinctrl block and the gpio things
in the gpio block.

I updated Takahiro's patch to work on current kernels.  I've had added a
few other patches to make things work on current kernels.  The most
noteworthy change is that instead of calculating the ngpios, I changed
it so you have to specify the ngpios in the device tree.

I updated the device tree spec file to address review comments.  I
changed the compatible to scmi-pinctrl-gpio.  I also updated the
examples to show how pinmuxing works.  I didn't know how to include all
the potential GPIO configuration options so I set
"additionalProperties: true".  Hopefully, that's okay.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  dt-bindings: gpio: Add bindings for pinctrl based generic gpio driver
  gpio: add pinctrl based generic gpio driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
  arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  70 ++++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 124 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  30 +++++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++--
 include/linux/pinctrl/consumer.h              |   9 ++
 8 files changed, 276 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.51.0


