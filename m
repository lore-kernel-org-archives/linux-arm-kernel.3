Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0FFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 22:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y6iYtEOLzvKNxb4FZ4jikJpSxV66bWAZ5GgiMV3ROgo=; b=vVN7/jJ0qr+Rwh
	xq6lT4SRODOFSGW+S8AjW8MyMkJjcvNpXYNtYDsISg8MgfAsP2FlNjn8zZ521bCpLbNO9fhVh5x4g
	dt5RmZJFzm8EwBrUOCuZzeDaH66P5T4Lf0+fBWZXGBE5sGNKb/2jlsRe4II4eTnRsJhoDkr3PwV3+
	oegDx6lnG0oyBuFZVa+aRG6k7YtYktrk+/eGSkdP8ueLWtH8NRT+ZSw6B8+g7dnuJEANQDV0XEnGW
	jlmTECgIzf7wUu2HM3g98l3nzTmUizfSGuXIrpnh/DNdaje6oQukwgA/YsoCNE+Ge/OM2egxl0U4g
	XUHk4tsq+Zvsgo/79qBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twU1u-00000001puR-3qGe;
	Sun, 23 Mar 2025 22:42:54 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twTyY-00000001p3h-05kY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 22:39:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso650955366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 15:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769564; x=1743374364; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6iYtEOLzvKNxb4FZ4jikJpSxV66bWAZ5GgiMV3ROgo=;
        b=IhiJDK70DIT/XQCnoMTpFfVjwwtcmDqt6MDDZzdF+YTqZcEbPzMe24irS1dbnZrXK2
         mEsXQja1KlmRPHB9Rij13e3g31pRtnSl/WDM8oUbkewQ3JHLCiqKjFxq8BnHKWcRAyfU
         9WF91+yubhlMF0EE6XNbJsKsHfy+RkkEwOnLhheib6nXNqMlRDxwGagGYOddWHByhzPs
         K7uiHqQZJTjctkXh4O3/D9ayPmeHDJtOT/3K13BXPS+DldBy4qkZS/I2Hjv7F5Xhgs7b
         /yggnTtEsnLU0bBat89tRGG4Te8XjEGY2m2mBbueoWOqCh1Uu55fGPFbq8QwXqf3CctO
         nrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769564; x=1743374364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6iYtEOLzvKNxb4FZ4jikJpSxV66bWAZ5GgiMV3ROgo=;
        b=tejMm5S1ZQXjlvYX+2MEgKO3Xk1OEqV6FEz03q5vE2Kvme5dO59zDI8Q+/IniVU+j2
         ReIAm2QjfqamYIdWp6S64M3QQz/7DZJGUZdra24LCL02aM+KnL/VbJJt6p+qerG9hkXL
         es3pymWxQGqcrUdO3kZ6fBSx6FXmoutGlOS1zVMqFQ/8BA39kQqQuve44k9rThX2dEbh
         qcHoF1cHlehcaJfbetXb3t0Vtf7CvFT+x9V+hlSR87f7a144/RMXe63YzEDjmNyvO9MT
         tZcOxjwqyR/NwXUEV2ZFV1rWTcjvSMDcteTXh0855gGBfMDdQ1K5Q7BgaPdNI/syRY5x
         SeBA==
X-Forwarded-Encrypted: i=1; AJvYcCVmqS9NVbLFDCdEMqBl2vNrGo5NFF6t66nDTSUieW7ZxertK3VEppGEPA1knhP6H0S4JFrsqVe7Ou0gwd1eFR83@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2VyNF61ekUQnDAa/DiXaTOzTjNf7opKLuqpZdo825FKdhX1pf
	zpWqvXnEcCvmcJEKDnE9H3gH2W8vkBNPYmnwsBvAhwaoGbjsKrpOH/zzmDGxt+g=
X-Gm-Gg: ASbGnctpDDEAElD8YOnP6WgTZUp5p14bcLoVVddkg609uaft4uemRL7UEOxRRe24IuB
	olRPmYvSSvDjLM2wcod569LNONoewvjghKCdg8CUzEvSsJip0/q4eyVLhwGBLiE50/vF++gHUZ5
	GUHJ3IzOdWHpzUKjieHF+E5+XPVLZ6WkDecCOfV9cQmG+P9M4GD6Sv+6srpRJiaLwtwjJqLK+CZ
	3k9rBfRny2Vbi8DNc2ZjYKlboHrbVmVkX1btDJejsbIU+okJwNdAvorykXvXL20MLy7W4UOZDhE
	/+RtBy4j8aevnr9wb9RRB7P1iWIsKFw667LDrcDFLgfgIs+vuqYMJd4KJDAZbH5ijv6AcQKC7is
	vC8rfXzYqnRCB4Tx9473XDgbzM/ji
X-Google-Smtp-Source: AGHT+IEIOL0z5HA/hLP6WtRx6lJP7L04Jhc7tA0I6WD3ChE8RIO8/jUcJg4qby8Yzu9BdJqid0N+FA==
X-Received: by 2002:a17:906:478d:b0:ac3:b12c:b1f2 with SMTP id a640c23a62f3a-ac3f251ac58mr885252666b.35.1742769563641;
        Sun, 23 Mar 2025 15:39:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/34] Samsung S2MPG10 PMIC MFD-based drivers
Date: Sun, 23 Mar 2025 22:39:16 +0000
Message-Id: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJSN4GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3WKj3IJ0QwPd1DTTFMPUpBRjAxNjJaDqgqLUtMwKsEnRsbW1AEr
 g09xZAAAA
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_153926_066818_1E832BC2 
X-CRM114-Status: GOOD (  21.52  )
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

This depends on the Samsung ACPM driver in Linux next, and runtime
depends on some fixes for it:
https://lore.kernel.org/all/20250321-acpm-atomic-v1-0-fb887bde7e61@linaro.org/
https://lore.kernel.org/all/20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org/

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
  * DT bindings (patches 1 ... 2)
  * EXPORT_SYMBOL ACPM's devm_acpm_get_by_phandle() (patch 3)
  * S2M MFD prep for adding S2MPG10 to MFD core (patches 4 ... 11)
  * S2MPG10 core driver (patch 12)
  * S2M MFD cleanup patches (patches 14 ... 25)
  * S2MPG10 clock driver (patch 26)
  * S2M RTC prep for adding S2MPG10 (patch 27 ... 28)
  * S2MPG10 RTC driver (patch 29)
  * S2M RTC cleanup patches (patches 30 ... 33)

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
André Draszik (34):
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10
      dt-bindings: clock: samsung,s2mps11: add s2mpg10
      firmware: exynos-acpm: export devm_acpm_get_by_phandle()
      mfd: sec: drop non-existing forward declarations
      mfd: sec: sort includes alphabetically
      mfd: sec: update includes to add missing and remove superfluous ones
      mfd: sec: move private internal API to internal header
      mfd: sec: fix open parenthesis alignment (of_property_read_bool)
      mfd: sec: slightly rework runtime platform data allocation
      mfd: sec: split into core and transport (i2c) drivers
      defconfigs: rename CONFIG_MFD_SEC_CORE to CONFIG_MFD_SEC_I2C
      mfd: sec: add support for S2MPG10 PMIC
      mfd: sec: merge separate core and irq modules
      mfd: sec: sort struct of_device_id entries and the device type switch
      mfd: sec: use dev_err_probe() where appropriate
      mfd: sec: s2dos05/s2mpu05: use explicit regmap config
      mfd: sec: drop generic regmap config
      mfd: sec: s2dos05: doesn't support interrupts (it seems)
      mfd: sec: don't ignore errors from sec_irq_init()
      mfd: sec: rework platform data and regmap instantiating
      mfd: sec: change device_type to int
      mfd: sec: don't compare against NULL / 0 for errors, use !
      mfd: sec: use sizeof(*var), not sizeof(struct type_of_var)
      mfd: sec: convert to using MFD_CELL macros
      mfd: sec: convert to using REGMAP_IRQ_REG() macros
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
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  34 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/configs/exynos_defconfig                  |   2 +-
 arch/arm/configs/multi_v7_defconfig                |   2 +-
 arch/arm/configs/pxa_defconfig                     |   2 +-
 arch/arm64/configs/defconfig                       |   2 +-
 drivers/clk/clk-s2mps11.c                          |   8 +
 drivers/firmware/samsung/exynos-acpm.c             |   1 +
 drivers/mfd/Kconfig                                |  35 +-
 drivers/mfd/Makefile                               |   5 +-
 drivers/mfd/sec-acpm.c                             | 471 ++++++++++++++++++++
 drivers/mfd/sec-common.c                           | 284 ++++++++++++
 drivers/mfd/sec-core.c                             | 481 ---------------------
 drivers/mfd/sec-core.h                             |  32 ++
 drivers/mfd/sec-i2c.c                              | 259 +++++++++++
 drivers/mfd/sec-irq.c                              | 461 +++++++-------------
 drivers/rtc/rtc-s5m.c                              | 197 ++++++---
 include/linux/mfd/samsung/core.h                   |   7 +-
 include/linux/mfd/samsung/irq.h                    | 103 +++++
 include/linux/mfd/samsung/rtc.h                    |  37 ++
 include/linux/mfd/samsung/s2mpg10.h                | 310 +++++++++++++
 22 files changed, 1872 insertions(+), 865 deletions(-)
---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250321-s2mpg10-ef5d1ebd3043

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


