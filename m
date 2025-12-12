Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A346ED43375
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g7M2WmltjUcmzGj5/uGfZjuBIODG+CdCH6JXQJ7UeoE=; b=G+iiPaSvFEjyHb
	b1fLNQPw+l0zfwElqRKZBCAB2c9C9kSxoisMn7lXjnHP3/lLchX8uNwDK2CNiDlJSgwaztEM1iJv8
	kxWsJvgJZ63u0KoamOZg0Icb6XETCWmVVX8T4WknKLMXsh30ELc5s/O7Cvws3qjWCzYq/XgjRR9Vi
	UhE80KUGEXu0wGsUejMqD6RQ0BETiXndY3aJsVPK6UGPlAQp3USlw+MJEiQorvW3fKDpsBjnlhCXs
	RUbQn4jwWKR9+EaN22XXpiWaqjiDN9NXqpiPVjvBCx3Vo9aFbGspxlzr8ZGQsqZ4i1ffoc4GKBRQv
	T/OcSwQEJM8w+BmLA0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmS-00000000DFS-1nxr;
	Fri, 12 Dec 2025 07:41:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmM-00000000DE0-22k2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 05A034E41BA4;
	Fri, 12 Dec 2025 07:41:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCB20606DF;
	Fri, 12 Dec 2025 07:41:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62CF3103C8DF7;
	Fri, 12 Dec 2025 08:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=g7M2WmltjUcmzGj5/uGfZjuBIODG+CdCH6JXQJ7UeoE=;
	b=A49GT3jXx/SFk0ctKOl5iKWY9Gs+U6CHsEBr3l0l6v0llXIjVcQHCeElGP4RMklkYwpahn
	Hegr5yxiML7pPlaqGJURI7ELg/U3yL+cULpeErrVUyMTLUSTRiPtyqYdY4wcbk3+VhiLMN
	53c+OTW1KX9MinSzSc0OT2KqYL15UXNrTY08ZGawhyB9CR9doQwR5KQN1RZM+eDPIOorlr
	U+t2n9xHxpO2e8SHRgM/ZXxfzAB0b045GjMk2SjMO+pyjo7LKLNF2zjXPI8h6ffF55FKfR
	FCY/8E89qbg+0boG50b9kLi+vxlEtZjB3dF/MFdbB9p6Tys/5nrCwweFrCCMPw==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH 0/8] Add support for AAEON SRG-IMX8PL MCU
Date: Fri, 12 Dec 2025 08:41:03 +0100
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/HO2kC/4WNQQ6CMBBFr0Jm7RimQCKuvAdh0ZapTCKtabHRE
 O5u5QIu30v++xskjsIJrtUGkbMkCb4AnSqws/Z3RpkKg6pVR4oIJ85oWtSag8fFvnCKkjki13z
 p2bhWOwNl/Yzs5H2Uh7HwLGkN8XMcZfrZ/81MWGPXG6fJaNu45mZCWB/izzYsMO77/gWo28kLw
 AAAAA==
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_234131_010373_09BF8E10 
X-CRM114-Status: GOOD (  11.37  )
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

This patch series introduces support for the AAEON SRG-IMX8PL embedded
controller (MCU). The MCU is connected via I2C and provides GPIO and
watchdog functionality for the SRG-IMX8PL board.

The series includes:
- Device tree bindings for the MFD, GPIO, and watchdog subsystems
- MFD driver that serves as the core driver for the MCU
- GPIO driver implementing the GPIO functionality
- Watchdog driver for system monitoring
- MAINTAINERS entry for the new drivers

The drivers follow the standard Linux kernel subsystem patterns, with
the MFD driver registering the sub-devices (GPIO and watchdog) which
are then handled by their respective subsystem drivers.

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
Thomas Perrot (Schneider Electric) (8):
      dt-bindings: vendor-prefixes: Add AAEON vendor prefix
      dt-bindings: gpio: Add AAEON embedded controller GPIO binding
      dt-bindings: watchdog: Add AAEON embedded controller watchdog binding
      dt-bindings: mfd: Add AAEON embedded controller binding
      mfd: aaeon: Add SRG-IMX8PL MCU driver
      gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
      watchdog: aaeon: Add watchdog driver for SRG-IMX8PL MCU
      MAINTAINERS: Add entry for AAEON SRG-IMX8PL MCU driver

 .../bindings/gpio/aaeon,srg-imx8pl-gpio.yaml       |  54 +++++
 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         |  58 +++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 .../bindings/watchdog/aaeon,srg-imx8pl-wdt.yaml    |  38 ++++
 MAINTAINERS                                        |   9 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 248 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/aaeon-mcu.c                            | 133 +++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 140 ++++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  30 +++
 14 files changed, 744 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


