Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E37FEC0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfEUwg5jTNsfejQ492YbCXPwCaOXKFYcNuGiUftCfZQ=; b=CRqPF+l+ArN3Yq
	gvbeFuoNJze35fSd85SRXKlfSFHed0uBgtQsl+gyX1YBsoZIcyfkU4IMdXVEE+w0qKs4nKr6XtzDH
	6NBzqQ2FxfNnyqcXc1uW5bkjmcjKSh0f1yq8TQjs/5oZ1kcQsSXybfgfA2bmmfPzKwflsX1sDbpN9
	WQfO8c18lFAyyRt+c0gpS95z4Q7lN9+QSaiFKtVe1Mt0vH0Sg2uadMLLme5bS6UlS0sD18VqUq8nB
	Ox+0yxA1PGGII/0BvgaYgBVE75ziD8ynhLKFcvJV7F+Fgh1B46eGN8AIF3yqTJLyKi323Gs+Uxn2u
	HWMAsVZJakoku99qSGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57N1-000000028vC-2Hjc;
	Tue, 24 Mar 2026 19:24:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57Mx-000000028tK-2FDq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 19:24:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AC1004E427D9;
	Tue, 24 Mar 2026 19:24:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77E85601A0;
	Tue, 24 Mar 2026 19:24:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9A4B1045081D;
	Tue, 24 Mar 2026 20:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774380285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gfEUwg5jTNsfejQ492YbCXPwCaOXKFYcNuGiUftCfZQ=;
	b=iXy0A9LGLz5xvwYoPPdbB0AKGn2j8e2cRCHOidsZHWLo7uubeHbKQhhr6zkQ/YVb3xSeql
	NoF1CxBAaMeCghlOP2/C5ayTOk6qAC+7FDlBRzvdAeoVfeQTfbLJ117hzgtuCH3LJAr5DN
	oNgzUgwEcVJxhTt9TpkPJ+nTt00Xt8tq1Rlbu07y3jN+K9IepMYhzIAdTgNqonwE7RwMOP
	o60y7rcC7+UiQHK0b5rSF+LQpp9Ht0B47JbgUTtnkensCO0tOt4sQXfAF0/7SFmtVJaEd+
	OBh5GD2irzKO/Hd/sGIspIYmC0YM7o3wYNcpehJCN1XfwMqfno2PM1nVlgzu5A==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH v4 0/5] Add support for AAEON SRG-IMX8P MCU
Date: Tue, 24 Mar 2026 20:24:26 +0100
Message-Id: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XO0U7DMAwF0F+Z8oyR7aRl5Yn/mHiIU4dFYg1KR
 zQ09d9JJxCaEOPxWvK592xmLUln87g5m6I1zSlPLbi7jQl7P70opLFlw8gdMRGMWkEceK95gkN
 4h7GkqgUUdTuoROejmPb9VjSm00XePbe8T/Mxl49LUaX1+r9ZCRC6QaIn8cFG+yQ5H1/TdB/yY
 S35Evi20MvYdxK2GomvhHVX5e8tPRLbvyVu0hBdQJQoXZDfkv2RGG9ItknoaXCW8aH34VpaluU
 TZwk5MJYBAAA=
X-Change-ID: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3683;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=2VCYMI2PHE4zLToU2mchgb7NRWmDqF/2sfPT06wNeL4=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpwuT2VeFL8YG55yMXDAMVyI86ap8Mh8+7vuRIf
 EGa+mlK8s6JAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCacLk9gAKCRCfwAsFcf4K
 7fAeDACeAUdO4HdQaqlnv7sKMnjnltBHrv/8P1HOJzhWfjkeaYZUhI0CPaBfQ1TpV3lTeUzGk20
 9WLFDz0fbq+J1lBYU20YBbZvrXgAobIpBPgqb0FA8KNre6GVIJ4Gm3f972S8XW1n6idM86UlNiz
 Tq1i0aIG8JXopIcn6Kmdqzh4DxnPLu2Lpuimvm6QtXKZ+GRw+Ua57h3LTyUSkSwUx7p3YF49pxh
 gratYEYKINDvWh5zBYuTwuGk2ke5OAbkVdLpT7fHrX1r8GbnPMSoPoAyvxZ5JI9Xz4LgUSOlflL
 ByzGtx7MNxCriQ4uoLgbAPubjqTlbcJTBlaEQRn7Uv7PYMe6gy/vEKtLac4j6diRO8MbKN5Kf65
 AQ2qKzYdvS3ks7JvI6nDmha5UT1R9uWAd/dZLn9WKje0zXJTQrQ4cTrJm6faU4OTfKmn/4++Dwj
 aQk0QPImIexKuOkkECf0jgo3k34VglwMdz4ogOAjXNClj1dtZanHD6AcD5VsiK9h5qr6c=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_122451_708345_1F8B43AC 
X-CRM114-Status: GOOD (  16.04  )
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

This patch series introduces support for the AAEON SRG-IMX8P embedded
controller (MCU). The MCU is connected via I2C and provides GPIO and
watchdog functionality for the SRG-IMX8P board.

The series includes:
- Device tree binding for the MFD driver
- MFD driver that serves as the core driver for the MCU
- GPIO driver implementing the GPIO functionality
- Watchdog driver for system monitoring
- MAINTAINERS entry for the new drivers

The drivers follow the standard Linux kernel subsystem patterns, with
the MFD driver registering the sub-devices (GPIO and watchdog) which
are then handled by their respective subsystem drivers.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
Changes in v4:
- mfd: switch to a custom regmap bus; remove aaeon_mcu_i2c_xfer() and the aaeon_mcu_dev struct
- mfd: locking delegated to regmap's built-in mutex; drop explicit mutex
- mfd: remove firmware version reading at probe time
- gpio, watchdog: use regmap_read()/regmap_write() via dev_get_regmap()
- include: replace aaeon_mcu_i2c_xfer() declaration with AAEON_MCU_REG() macro
- dt-bindings: remove unused label from example node
- Link to v3: https://lore.kernel.org/r/20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com

Changes in v3:
- Renamed SRG-IMX8PL to SRG-IMX8P
- dt-bindings: add gpio-controller properties as required
- mfd: move struct aaeon_mcu_dev from header to .c file (private)
- mfd: use guard(mutex) and devm_mutex_init() for cleanup
- mfd: firmware version log changed to dev_dbg()
- mfd: add select MFD_CORE to Kconfig
- Kconfig: add || COMPILE_TEST to all three drivers
- watchdog: add comments explaining hardware timeout and WDOG_HW_RUNNING
- watchdog: remove unused platform_set_drvdata()
- watchdog: add a function to query the status
- Link to v2: https://lore.kernel.org/r/20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com

Changes in v2:
- Fold GPIO and watchdog bindings into MFD binding
- Drop OF_GPIO dependency in GPIO Kconfig
- Use __set_bit/__clear_bit/__assign_bit instead of atomic variants
- Various driver cleanups and improvements
- Link to v1: https://lore.kernel.org/r/20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com

---
Thomas Perrot (Schneider Electric) (5):
      dt-bindings: vendor-prefixes: Add AAEON vendor prefix
      dt-bindings: mfd: Add AAEON embedded controller
      mfd: aaeon: Add SRG-IMX8P MCU driver
      gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
      watchdog: aaeon: Add watchdog driver for SRG-IMX8P MCU

 .../bindings/mfd/aaeon,srg-imx8p-mcu.yaml          |  67 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 221 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/aaeon-mcu.c                            | 155 +++++++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 134 +++++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  20 ++
 13 files changed, 642 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


