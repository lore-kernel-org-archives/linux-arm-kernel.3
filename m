Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8D1C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 13:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZRvLbiHiKLkWNaqlgJsovX/nYtjDcjC8MqvumdDWmcw=; b=FrB1d5mRxb3U1Q
	6wSxK+TxH+tlZ3rinXcNs0f/x1dSf17AECPTjO+YWllwUZL5Kc7/2Am8WoRTMSYUD6PPr6Y5D2BGH
	7GstsNNOivlrJAZNqGGUlGdydJrxfMHHz88IbyRDuj1Qi+K5vfv/KBDqUMCx3VsjrTPbX6hUgqM9e
	5fMkLcUP6CK3GSr9A1Rf4HAEXKU0Y4qqznFXyP7KisK5fdUyCRMHVxJ8hZAkI+PKlpHJjU1Yb3S8S
	l+R05orLRO+ReoH6g7I3ksa6I9LGhx2UHFpXiDdrZzU0l8qFBnMBMXPi0uQe85F3AXq6OWjJIoGc+
	AJbu/STkymgrde2Y+GrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9qw-0000000DRWu-3Kpt;
	Fri, 28 Mar 2025 13:34:30 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9nT-0000000DQbb-1Xvi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:30:56 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abf3d64849dso333245266b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168653; x=1743773453; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRvLbiHiKLkWNaqlgJsovX/nYtjDcjC8MqvumdDWmcw=;
        b=xDpbcDstOhOnoz1BVTnmwUvX1lURvv2paR2ibhu/N+9vBS/sCBSN0976pSAL7myn31
         FE5MwtCp4xoMlYdG7V64AD8cRfrEushisT9uMYrzJ+CI698dLvzUD9rO5KTdiWVZ6aJ2
         aybxTThsRbK5c3rYZf6IXR2IZra/UvJG7MxQDjMJsR/a5xwhtQpSrg3kOVT50Zf/+S3w
         DPnOr58taA/YL9IKrWPspVGwl53I1F3w7A5OVSIW6am5cR1dsIk/V9UTRqfkprHSZM6C
         V+qQHqgEN28gvwXJi29ws9gZK3KUsi7aF17WiMKwS/zzNKeDyYrMSchxjsSCvUVgCpHd
         IJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168653; x=1743773453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRvLbiHiKLkWNaqlgJsovX/nYtjDcjC8MqvumdDWmcw=;
        b=s2rbfEkORDPtk0p5hW83wariRLRE/Gri8koCcjvcS+4jqVYxte08lRMB9x5MpoQhJw
         Ki0yPb6rD5xSYo6mFkThtfuWCAeZl8oT8mG65bSwZxhWEpzIda+5yvRC26cFwzuQ0JOq
         y8Wffj/XnsakKO/kKaz5mgBft/VnOehaLW/WIACv9XSB+Brb45wc43+I7rQhUvnf3nJ9
         APm/f54QPkOJnnxfhoMcvJQjomx8Ub5qQufs1AdxlgzMCBw8K9oq1xaosLWuC0p8wWlT
         pwHdRtS6J+7BSNAfOxTE2jayonmjJX+LO2mwMEv0y6Yih/pUP+vbqTpu7noQ9IWPuFG4
         ZxDg==
X-Forwarded-Encrypted: i=1; AJvYcCV/S+fRs6OE59k1cFfpt0n+GBTLhVZSedtNnnvHj//b/9m96yk/K5Bv+upww2qdIDu90Ul+rCTzQzKrY4nyDoiI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl6ZYw/8VkbPMtkB22YLy/rc3+leVCzv+rz4HmRaSJrv+LP1nD
	e3CbRjFVnnIx9jUKXDPElXsItlRwRpbxWveHwrGJAiwl4pzoKvjiYVwfuZjSzKM=
X-Gm-Gg: ASbGncvCpIiepdlUebL6sL97ObJjdEEb4rjDAu2jfYp5rrCCtfL+5Aot3wMHigGpATJ
	wBCLYXJ3KML71leRA8/7T7u4wZJurrTQEYsOdDSMb3/S4oePlyazdiYWpRuHs7kCYqvGyHxCLn5
	k1FYKcy9mxoGi+/ZsxUTlqAGgp1Yj9W4qBL8pg/F23CkBMX0cE3telQ/EJyKaKulT2TW1KMeImy
	Stjk84q5nUdJptBsMCXnPlVbaS8kQPz29f7+UAa+LPUaq/YKgqtjEhzG7SFzHfXhx3Ylxm1VzYZ
	tPKiGzgyP96ozcAOPNX4oojcUxMDtmjh+3PMh/m8W09ZS5if0jy/g4FvhUorAn3P7yo65VP2aMw
	ZpEWKEble4fyevK6pF19UFNXgkRHc
X-Google-Smtp-Source: AGHT+IH1+pjt98yfLPdlHXhG5zwY12ogF7yk18zqK8eCDj7Jf469dISQ7xCv0AXw/+mBhRrdep/+WA==
X-Received: by 2002:a17:907:1c07:b0:ac6:ba91:ca4d with SMTP id a640c23a62f3a-ac6faf04aafmr667626866b.31.1743168652788;
        Fri, 28 Mar 2025 06:30:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Date: Fri, 28 Mar 2025 13:28:46 +0000
Message-Id: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA+k5mcC/z3MQQrCMBCF4auUWRuZTFqirryHdFHNNB3QpiQSl
 JK7Gwu6/B+Pb4XEUTjBqVkhcpYkYa5BuwZu0zB7VuJqAyF1aEirRI/Fa1Q8dk7z1RlsDdT3Enm
 U1yZd+tqTpGeI7w3O+rv+DPM3slaoHB6OrbFIFu35LvMQwz5ED30p5QPJmoiqnwAAAA==
X-Change-ID: 20250321-s2mpg10-ef5d1ebd3043
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063055_421322_EF0BD366 
X-CRM114-Status: GOOD (  24.06  )
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

This series adds initial support for the Samsung S2MPG10 PMIC using the
MFD framework. This is a PMIC for mobile applications and is used on
the Google Pixel 6 and 6 Pro (oriole / raven).

*** dependency note ***

To compile, this depends on the Samsung ACPM driver in Linux next with
the following additional patches:
https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/
https://lore.kernel.org/all/20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org/

*** dependency note end ***

+++ Kconfig update +++

There is a Kconfig symbol update in this series, because the existing
Samsung S2M driver has been split into core and transport (I2C & ACPM)
parts. CONFIG_MFD_SEC_CORE is now truly a core driver, and
the I2C code that was part of it is now enabled via CONFIG_MFD_SEC_I2C.

This was necessary because unlike the other S2M PMICs, S2MPG10 doesn't
talk via I2C, but via the Samsung ACPM firmware.

+++ Kconfig update end +++

This series must be applied in-order, due to interdependencies of some
of the patches. There are also various cleanup patches to the S2M
drivers. I've kept them ordered as:
  * DT bindings (patches 1 ... 3)
  * s2m mfd prep for adding S2MPG10 support (patches 4 ... 7)
  * split S2M mfd driver into s2m-core and s2m-i2c, including the
    kconfig symbol update (patch 8)
  * S2MPG10 core driver (patch 9)
  * s2m mfd driver cleanup patches (patches 10 ... 23)
  * S2MPG10 clock driver (patch 24)
  * s2m RTC prep for adding S2MPG10 (patch 25 ... 26)
  * S2MPG10 RTC driver (patch 27)
  * s2m RTC cleanup patches (patches 28 ... 31)

I realise these are many, but since some prep-work was required to be
able to add S2MPG anyway, I wanted to get the cleanup patches in as
well :-) Let me know if I should postpone them to a later date instead.

The S2MPG10 includes buck converters, various LDOs, power meters, RTC,
clock outputs, and additional GPIOs interfaces.

This series adds support in the top-level device driver, and for the
RTC and clock. Importantly, having the RTC driver allows to do a proper
reset of the system. Drivers or driver updates for the other components
will be added in future patches.

This will need a DT update for Oriole / Raven to enable this device. I
will send that out separately.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- Rob:
  - make PMIC node a child of ACPM, and all related changes (binding,
    driver)
- Krzysztof:
  - merge defconfig updates into patch changing the symbols (patch 8)
  - split MODULE_AUTHOR update into a separate patch
  - better alignment fix (patch 11)
  - merge two s2dos05/s2mpu05 related patches into one (patch 14)
- myself:
  - keep PMIC DT parsing in core, not in transport driver
  - several updates in sec-acpm.c, see separate entries in patch 9
  - fix typo in patch 17
  - collect tags
- Link to v1: https://lore.kernel.org/r/20250323-s2mpg10-v1-0-d08943702707@linaro.org

---
André Draszik (32):
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
      mfd: sec: drop non-existing forward declarations
      mfd: sec: sort includes alphabetically
      mfd: sec: update includes to add missing and remove superfluous ones
      mfd: sec: move private internal API to internal header
      mfd: sec: split into core and transport (i2c) drivers
      mfd: sec: add support for S2MPG10 PMIC
      mfd: sec: merge separate core and irq modules
      mfd: sec: fix open parenthesis alignment (multiple)
      mfd: sec: sort struct of_device_id entries and the device type switch
      mfd: sec: use dev_err_probe() where appropriate
      mfd: sec: s2dos05/s2mpu05: use explicit regmap config and drop default
      mfd: sec: s2dos05: doesn't support interrupts (it seems)
      mfd: sec: don't ignore errors from sec_irq_init()
      mfd: sec: rework platform data and regmap instantiating
      mfd: sec: change device_type to int
      mfd: sec: don't compare against NULL / 0 for errors, use !
      mfd: sec: use sizeof(*var), not sizeof(struct type_of_var)
      mfd: sec: convert to using MFD_CELL macros
      mfd: sec: convert to using REGMAP_IRQ_REG() macros
      mfd: sec: add myself as module author
      clk: s2mps11: add support for S2MPG10 PMIC clock
      rtc: s5m: cache value of platform_get_device_id() during probe
      rtc: s5m: prepare for external regmap
      rtc: s5m: add support for S2MPG10 RTC
      rtc: s5m: fix a typo: peding -> pending
      rtc: s5m: switch to devm_device_init_wakeup
      rtc: s5m: replace regmap_update_bits with regmap_clear/set_bits
      rtc: s5m: replace open-coded read/modify/write registers with regmap helpers
      MAINTAINERS: add myself as reviewer for Samsung S2M MFD

 .../devicetree/bindings/clock/samsung,s2mps11.yaml |   1 +
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  17 +
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  28 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/configs/exynos_defconfig                  |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/clk/clk-s2mps11.c                          |   8 +
 drivers/mfd/Kconfig                                |  35 +-
 drivers/mfd/Makefile                               |   5 +-
 drivers/mfd/sec-acpm.c                             | 460 ++++++++++++++++++++
 drivers/mfd/sec-common.c                           | 301 +++++++++++++
 drivers/mfd/sec-core.c                             | 481 ---------------------
 drivers/mfd/sec-core.h                             |  23 +
 drivers/mfd/sec-i2c.c                              | 239 ++++++++++
 drivers/mfd/sec-irq.c                              | 460 +++++++-------------
 drivers/rtc/rtc-s5m.c                              | 197 ++++++---
 include/linux/mfd/samsung/core.h                   |   7 +-
 include/linux/mfd/samsung/irq.h                    | 103 +++++
 include/linux/mfd/samsung/rtc.h                    |  37 ++
 include/linux/mfd/samsung/s2mpg10.h                | 454 +++++++++++++++++++
 22 files changed, 2002 insertions(+), 865 deletions(-)
---
base-commit: f58dd835f82a5dda6c9d3895ee6f15016431fb1f
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


