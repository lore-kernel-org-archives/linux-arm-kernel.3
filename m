Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13713D72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GtOq1m+WD2HMLvMMLoom6Vbvmzr8+b8ZqOjynGdUdKA=; b=UacOMIOdg6jd6W
	77/O/DVEqhCG7F1YU5rgvo05opvWHHQam8ug93o9xvvqlMI9JZFzh5vze14/goYUL0tGV2E9vFjPX
	Q7K50QYWhiHN7puqLhBHVwdyoyvT1w/7DaxmG/MvHZZODicPQBbqDsGfH19aAeKNontvapqeg6Z3u
	Ey6AkU2uvlYDQUIRKire1v3dy7mHzJ5Kw6yXKDBQzszsXFIECAd7RY/ChRZ0scffbHEmzgqYpmu5W
	89jE1YtZEm0eesWvIHqVskDH0rup/6TGOSmzL43MVN4HVk1WDp8jF2an9bWrNhJABwOVyEFI6AbKL
	5b08erU3pZejhX+ng76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDse-00000008drj-3GEN;
	Fri, 23 Jan 2026 09:55:04 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDsT-00000008dco-28vH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:54:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 55DC8C21AB9;
	Fri, 23 Jan 2026 09:54:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 105426070A;
	Fri, 23 Jan 2026 09:54:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE8A3119A879B;
	Fri, 23 Jan 2026 10:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769162087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=GtOq1m+WD2HMLvMMLoom6Vbvmzr8+b8ZqOjynGdUdKA=;
	b=xgUXQqIKuJKbnfQU+glvqxQ0lC7iQX/b8KXT8yFWPgP9HuVjX7OT+AdxPf89EvPiRPjWCr
	wNh/NarbahLItvR6Yv5sRBQKz1Qn3CAm8M/oYdJJmHl6bd3J1g7LakaxlC20KFNMEqAkbq
	WTKEmCzsHFjAOk7t6JTNs3jO/cT6Ozba6+SphqYh0iWqlfjPwPET58Bt/QGgPFSNCnCxNU
	Te+N0qI3tgpXWFnKbIbKTxSGLUW6CwBF4+j8JyyRtJQH3RtnkfGpZcYelqFmfgWwcVVJHM
	pxD3ulyWYRKIByBosyCAIhRIPBN1buX9MkSr7iGL5iuyl+OgJacq3oCf5iuA7w==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Subject: [PATCH v2 0/5] Add support for AAEON SRG-IMX8PL MCU
Date: Fri, 23 Jan 2026 10:54:29 +0100
Message-Id: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVFc2kC/4XNTQ7CIBCG4as0rB1T6E9aV97DdMHAYEksGKhE0
 /Tu0saNG12+k8zzLSxSsBTZqVhYoGSj9S6HOBRMjdJdCazOzUQpGi44B00JsAYpyTuY1AN0sIk
 CUEldT2hqaZDl73sgY5+7fBlyjzbOPrz2ocS3638zcSih6dFIjlJVpjqj9/PNuqPy0zbyEcRvo
 UXdNqg6Mlx8CcO6rm8eeTeVAgEAAA==
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
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471;
 i=thomas.perrot@bootlin.com; h=from:subject:message-id;
 bh=I+86nw5ss1UyVYYj+1JjJmbO7AEei5pGYiM5ZmQb++w=;
 b=owEB7QES/pANAwAKAZ/ACwVx/grtAcsmYgBpc0VjaDn3S4LIcnCwDpkh3Vnz0ZFtExIlW6SNM
 WlJw+WkwRuJAbMEAAEKAB0WIQSHQHfGpqMKIwOoEiGfwAsFcf4K7QUCaXNFYwAKCRCfwAsFcf4K
 7bErC/9iYV0mVU/N8PkYfbeQlsjzMkmEC3KULGJ2eUV7cxH8hxTOZh8jNjmeJi6iR0b6yPh/ku1
 K0Huat/GPWckP5kQ1kqZmOviPNWg9XxOEVJKCcUCaCjZetkxjCBzB+ofssV32vOJ8fRBPWsKpMs
 cQbfuCNwkrBO1UnYQe0Em7Kt1hSx0pc5BOal6bZF+BsKwfw6f0dnz594gq2gIYdLRdXhwBT6/7M
 RWx1AMhE+Jvk50aaQj2Gf0qEchRpePJPLDgoFq1H151UufKBmILwRiSBUivtTDIC6KjieNOTtOl
 rTnB8EK8+zaDmN5wQu+EbmoRZF/CKhLQuD+VVWJNZhzafA8eGLpdKyIIyOalBseyj16w00I7M+Q
 7zBQKBHsW+2LFjlwk8GpPNl33jt3wTRqZlpoKZ6Uy4XpXXkcDvgZecQXDYo1mWYs2jg3XAp9Vq2
 ogNRxKs16GvP2B6GWYOJuEhDecPY79+EKQ85gzFzoC4fK1dRtKOBuPoYhN5NlUJ2m5GjY=
X-Developer-Key: i=thomas.perrot@bootlin.com; a=openpgp;
 fpr=874077C6A6A30A2303A812219FC00B0571FE0AED
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015453_850139_58CA217E 
X-CRM114-Status: GOOD (  13.81  )
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
      mfd: aaeon: Add SRG-IMX8PL MCU driver
      gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
      watchdog: aaeon: Add watchdog driver for SRG-IMX8PL MCU

 .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         |  56 +++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  10 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-aaeon-mcu.c                      | 238 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |   9 +
 drivers/mfd/Makefile                               |   2 +
 drivers/mfd/aaeon-mcu.c                            | 129 +++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/aaeon_mcu_wdt.c                   | 110 ++++++++++
 include/linux/mfd/aaeon-mcu.h                      |  31 +++
 13 files changed, 609 insertions(+)
---
base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
change-id: 20251211-dev-b4-aaeon-mcu-driver-e0e89ebf4afb

Best regards,
-- 
Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>


