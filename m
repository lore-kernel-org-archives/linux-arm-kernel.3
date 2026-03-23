Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA51F483E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=; b=ctQFfnjc/N4l5rPzYSYmdCpVcX
	HRyQ0zFAMKq0eXJPewNAdR3Ad51SMfbdGYN4Q0FEgEVHV6aCO13sM3K3gvSZRM6ZNFpgE0zIKORO5
	aMa6lR/dYbU6cHb+fYMBjPskvKIn1YxtFsChBW8+jdl8dqmh6Gwf0E6FS8D3Xb9FT5XGzdP8WqwN3
	wyodamHBJmqwqyw9BwlUbF2GtTbwBbypEqKVTqCcXSP6lmjDRaT0xkUS+D1I67paqbHj8WxQPJLd4
	2DncCsEuEHcWpCrrV2qLWHpTX9GtF83+0IWP5sJNYndCwLtZD3XDPMiVeuOo9EfO6UbAFo4A2sHhw
	3kbqsQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWZ-0000000HOaG-2VAw;
	Mon, 23 Mar 2026 19:01:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kWV-0000000HOZe-0nCT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:01:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48538c5956bso42133495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292469; x=1774897269; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=;
        b=Inm5N5F8DgpLG1JBI50fdRKGtUYKKAvbOmfYpaSsUnUxF1DqbspKOvEJfmwe0ieE1Z
         Kt+UfEbPB6U5hozc936mAw9lZu+M+RCmPs2b4GFP2pjyTc1ll+ObrTYJveVF1D7qYYg/
         WOrv7M5AJ+75FRG4RS6/QACupwrolgR06CXNSdFMfwKtYBh6D9zjr94GlvRyIIVuVCY/
         y20xQHW3MPeSnh8EnUOvEwA/dcw+Yh44kDDsoMOochaIRVPfpUo/o2OvmjaAj+rywsTe
         kWfvC7PFTrST0gzL8oAvmu42MgIJobe+ai6/4O4e6L4a1w+mIhgxeZQTSwyLWtoWM77C
         EzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292469; x=1774897269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=;
        b=B0d2orcZHEx53j/hatvgoQfVz0AZnYUFYH8hgGNwF8V9TqsAP9sZPu00hA+QbMGOq5
         vqpcW5Kqbk61f/uTs3+xFcRJcCM+/3FvoNNGoLgwuMitQl2JNZN8fpw1iW+WBDrEaPSA
         ch05lnOqxMFKF1vetNOZIvyEvKpAoyy4CS14CqOEvFTZdMLPu4bzQJo1Z4hG/ruyM6/M
         llXNaTx9rFDf0JmLsNUL5iv6P3SLGQ82+z8b38+ah5NZlUbdmQJc3rMXVBQX6SZK4ngR
         yrWcmVZuOol+p1SDam7raCYTcrXaZkUGBsncv0wZsYe5ijYME3sc8Q0ICCQtv964yuq3
         j0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0SQ3+crlNlbR508whkHa1WqBT6/7cEI0FKawqdMMn/CM4pcrBn4jlMkNNE9lZYfL1lNSnf1pCzmrUEl67tL8@lists.infradead.org
X-Gm-Message-State: AOJu0Yza/+tqyt2u3HOOWk2YBP+OGAw9BwGvK3y86t3O0O1P8k0Nl/pA
	i/jOagyK9fyHODWRFAtdmhPeTsM+cvCa9oczCOj6tqPPXWkCMaveTVNzidHjb9JbOOE=
X-Gm-Gg: ATEYQzxzWtKtLQJMRvW5iL6FI8xikFtRXljMCHIfFcwO+lGqk8cXXqxmYCn90hCyOzy
	OVpomnaiXC1LgP68NFN8oINqd0y9q0HMYrCcR+u0lJvBsSFdFVFsIO8g3rVitE46rgt1eGV7u45
	raK/bZtHN47xbuZ1pUZZLhH0ebEmpCQmKrxTcC6gIuV+2wdCUatQhPEo6Z2V6FCbIWvPzAZ+efs
	7ixT5+aFiZqKaCHAeiDD+apk76m2C1ZLwM+0jcmGSqTnBoVca3nYvOPVBZOXX5V8nrOCHDr7Az2
	92a5MgaBRcDlfE0zS3vjHQaRolRZrXdlNJXuB4ZtsC+hhuvLGvQO3T1ieXryBSK6fCdg2xq5uHJ
	uIsDRk2huqVPI3tbQ1bF/0jiVuL0COsAKLjlnuApRXS+jdPiLPJ+fdrGLWyEnuAy7Xxztq0u6zX
	Qq8MvKtRWsFX5GTQNW44nb3QXvRdFw
X-Received: by 2002:a05:600c:4349:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4870f1fc613mr5830435e9.7.1774292468497;
        Mon, 23 Mar 2026 12:01:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f822b83sm1713765e9.4.2026.03.23.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v6 0/7] gpio: introduce a GPIO driver for SCMI
Message-ID: <cover.1774283146.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_120111_243697_3AFCE5F9 
X-CRM114-Status: GOOD (  12.46  )
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

v6: Fix a build error when CONFIG_PINCONF is disabled
    Fix the dt-binding subject and my email address
    Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()

v5: Addresses Andy's cleanups to the driver.
    Adrresses Krzysztof's comments about the dt spec file.
    And almost all the subsystem prefixes were wrong.

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file

v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  gpio: dt-bindings: Add GPIO on top of generic pin control
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
 drivers/pinctrl/pinconf.h                     |   6 ++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++---
 include/linux/pinctrl/consumer.h              |   9 ++
 9 files changed, 255 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.53.0


