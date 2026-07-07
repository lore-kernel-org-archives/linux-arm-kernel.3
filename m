Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D652DC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SiJF/LaxE7u8kl1QUtYHqEBKfLUiFz6zaObGXEuJ/0I=; b=nOVKzxFC/Cz1Yy
	qr9qH8n2yzpJ6msGvVSAKTctHR1wwXOnLXTvC4QsigoUj/LTD9y+tVFP/eCbkoaQ4gut06kw5hfbf
	ELUKgjOAl4/F2osJfrGoMUdWLgqNvPDR5fLoEk6f/nHPB7RFbmEoTgbWXctifg8EjISvSg0gGe9mA
	lR2JtdFe7SPv7UFs8kA2P82oGdDlk2JWHmTs2hZ2yHUIckpg6gjg4l8ZUwAjPOaktVydLsUPUaSHq
	iEZMvppg8aemQgN6BCHFOG9IOti+p87P8UrLmE7DMLREgUxXaRC14satVhuOnlMqWDHqXNmkw/LMM
	MA9C1kpZ7cp3mBs+5VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6fg-0000000FACm-0Q7V;
	Tue, 07 Jul 2026 14:21:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6fX-0000000FA23-3tiY;
	Tue, 07 Jul 2026 14:21:06 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783434059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SiJF/LaxE7u8kl1QUtYHqEBKfLUiFz6zaObGXEuJ/0I=;
	b=TWiX4y63STDjst3X2KHTyXTuiYZJKsF7dxC212O3kIa6K0Eb5lbR0pmQDSeJNh04QEvJHv
	BNn4fhjwd0cdHB/4I55JwbDMiOnNNcNGlXu92ANpGFhY3lgqxFI4SSKzMyt7T4rmtcBM7c
	QI9MPoe7SoTH3SwHvQ+PubAhzTQpNlPcyNINw4jZuXC3tVt4s2jJEkhu+2ik3rgBoavOhA
	T8+If1NKwOFlrNwT5ndIjlApB7FZe1qIXvT99yfcJLGKIX3u8prS252by0lXwUzfoi66Ru
	2tKuQAJWeilGYgtUrkZQQvpLhl3C7PQFpzk2MoyrhiZ74PGVJsbSiNgtmiz40g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783434059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SiJF/LaxE7u8kl1QUtYHqEBKfLUiFz6zaObGXEuJ/0I=;
	b=DWNyPLoPMl7JzwPK68SBpwpBNe/uWfD4Wx2w7/kOLXmuBXQwqvBkRxZVQBRIoN0m7oj34I
	c17xGSoio7KXRNBw==
Subject: [PATCH v3 0/4] firmware: raspberrypi: Add support for the tryboot
 mode
Date: Tue, 07 Jul 2026 16:20:53 +0200
Message-Id: <20260707-rpi-tryboot-v3-0-fda82fe7ed76@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEULTWoC/12N0Q6CIBhGX6VxHQ1/GURXvUfrQhDzbw0coNM53
 z20tWWXZ/vO+WYSbUAbyeUwk2AHjOhdhvJ4IKat3MNSrDMTYCCYgJKGDmkKk/Y+UQ4KjALNJEi
 SjS7YBsetdrt/OPb6aU1aE+uixZh8mLa7oVh337LYlYeCMsoV04XhhivJri90fQre4XiqLVnrA
 /z4Jdv7kP1GnGuojagqkP/+sixvWMhJPvwAAAA=
X-Change-ID: 20260623-rpi-tryboot-4292c92b0727
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783434058; l=1871;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=vQZW0BtvgCjvpoZIDnlMyeKdpdnD//8TJzvJD8ETpjE=;
 b=j6IxqAqE0/8UXWRMcWV+NAxn8dbFDEh/GPQoSzRNjSJxrACGkP0uVD3BtRJSQHF+tiOmLSL4C
 3rUbqWAfyA3BaBKPtGf4sUDmEJh7Yw7sWguLYzxpAyX985yCbH4E8/+
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_072104_159088_C98168F1 
X-CRM114-Status: GOOD (  10.75  )
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

This adds support for the tryboot mode on Raspberry Pis. As there is no
documentation other than the downstream implementation [0] the
implementation is based on this.

I tested this on Raspberry Pi 5 and therefore I only added the
properties to this devicetree. But afaik this should work on all
Raspberry Pis. I will add it to the correspondings dts if I get some
hardware to test it.

[0] https://github.com/raspberrypi/linux/commit/eb56da0c1925c07e8929ce4c9fe8aeafa7cb8c7b

---
Changes in v3:
- fix use-after-free error by using devm_add_action_or_reset
- ensure endianness of magic byte
- refactor reboot mode registration into separate function
- Link to v2: https://patch.msgid.link/20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de

Changes in v2:
- Remove unnecessary reboot_mode_unregister().
- dt-binding: restrict to mode-{normal,tryboot} and only allow 32bit value.
- Link to v1: https://patch.msgid.link/20260626-rpi-tryboot-v1-0-490b1c4c4970@linutronix.de

---
Gregor Herburger (4):
      firmware: raspberrypi: reorder rpi_firmware_property_tag enum
      dt-bindings: raspberrypi,bcm2835-firmware: Include 'reboot-mode.yaml'
      firmware: raspberrypi: Add reboot mode support
      arm64: dts: broadcom: bcm2712: Add reboot modes to firmware node

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  9 +++++
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  2 ++
 drivers/firmware/Kconfig                           |  2 ++
 drivers/firmware/raspberrypi.c                     | 40 +++++++++++++++++++---
 include/soc/bcm2835/raspberrypi-firmware.h         | 22 ++++++------
 5 files changed, 60 insertions(+), 15 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260623-rpi-tryboot-4292c92b0727

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


