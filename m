Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A1CCD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JTA86PWU30dw1Y+YYODGvyGhuhipY2bt5WDbm8wDJX8=; b=GEFxpXUrA22lZY
	keU4fwmfA8aHKkKXyEdq7/AruRiVlVZcC7AMsXCQXyV2TFhKn+ef26NukMvDFC7e784fOSvyfLiM1
	QflANXNHYSiYD4euVBn728f2vguoxy6a1iHIVSTy/yA+LVzvW84YE7MBkfKpUlCD2xr/L9fTW6WAY
	KDj+LfyFHoE51OddON4hGCNAIfhoYgWgDKrGMrK6Kq7/1OLLK+tamUzGmRbVexyPRMWGsepkhH9OU
	wJjZu12JoocAPsewounNO1Y6BZjMAaog/DbzgyF5I9DNkV9LdwtSW9kKYlJw7vebMe55qTtqjByib
	ku5rdyndDpLiRzFoC8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhu5-00000004oGI-1hsW;
	Wed, 20 May 2026 14:28:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhty-00000004oAx-1Abs;
	Wed, 20 May 2026 14:28:03 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779287278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JTA86PWU30dw1Y+YYODGvyGhuhipY2bt5WDbm8wDJX8=;
	b=4K7RhcJu1hgMu/EFItTBWNKLBVa0wPocp+3B8rq+Sg4gnfBQnLNDYqdr0xOCqKqO6H+1Yu
	CsNyEiMf11WRVH91vgZ+b/GxEc12fVVZNEf/RLl3EfLhFF1uaVnmmlj9edb1GI4XTN/pk3
	M0TcbGHMDiuptKrwSNVC7gJXR+xllbE2YDplznNoEhFNZhsu+QKZfwmOT9A73MgcEggZe/
	J0izHMsWdbGS98areng/0HBK0WeHhORoqL4LTzMs2ZRrUEYe/kicl9y6xTLG6jaZM/2goV
	AZodCML3IW+N5xEtcUTjobo5rMWZEHbWs9Y+71pqyln89TQw26edVFLBb26Xxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779287278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JTA86PWU30dw1Y+YYODGvyGhuhipY2bt5WDbm8wDJX8=;
	b=RUGa+T9DOY8XHMZ5afGmeIFgJTQ4jMUHyB6MaLtIOdxup/pffdaWMbS1jk1ASeAPmR56EC
	DqN65oNQJ7zv+fDg==
Subject: [PATCH v5 0/8] nvmem: Add Raspberry Pi OTP nvmem driver
Date: Wed, 20 May 2026 16:27:52 +0200
Message-Id: <20260520-rpi-otp-driver-v5-0-b26e5908eeac@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOnEDWoC/3XPz07DMAwG8FeZciYocZs/5cR7IA5b7DAj1FZJF
 22a+u4k48BEx/GTP/8sX0WmxJTFy+4qEhXOPI01mKedCMf9+EGSsWYBCqzqlZdpZjkts8TEhZJ
 0JgbSGGJ0KOrSnCjy+Qa+vf/kfDp8Ulia0hpHzsuULreLRbfev3jRUklSgBoPZJXyr188npY0j
 Xx+RhLtQIFfwiizIaARg3aWggPfuUdEd0/YDdFVAobe1rnt7GAeEf09sX2kr0SIHh0Y9B70X2J
 d128790V8iwEAAA==
X-Change-ID: 20260408-rpi-otp-driver-75fce1dcff7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779287277; l=2899;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=riALNKO6Dm+ln9p2xSUt46UpPG2FzEMcnDP1s+JcVxQ=;
 b=KCF1Fi+B+Xvl/0Uk28rfGpuoqyre8w+Ygqx9kc9WwxrJmdfIcN8lpLPbB/oVAQB4mKwUxb7Bt
 qInFKPeZ1UPDrVsO79L4mT+3CJ6psy4029RJGU5sb3XhwoDn71iKMX0
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_072802_461290_871464AF 
X-CRM114-Status: GOOD (  12.15  )
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

Hi,

This series adds support for the Raspberry Pis OTP registers. The
Raspberry Pi has one or more OTP regions. These registers are accessible
through the firmware. Add a driver for it and add updates the devicetree
for the Raspberry Pi 5.

---
Changes in v5:
- Move alignment check to nvmem core
- Use IS_REACHABLE to simplify Kconfig
- use root_only for private driver
- Add driver as module to arch64 defconfig
- Use MODULE_DEVICE_TABLE
- Remove some unused attributes, fix typos, minor fixups
- Link to v4: https://patch.msgid.link/20260508-rpi-otp-driver-v4-0-cf8d725d8821@linutronix.de

Changes in v4:
- Additional patch to drop unnecessary select schema
- fix dt-bindings
- use __counted_by_le
- additional alignment check in read/write callbacks
- Link to v3: https://patch.msgid.link/20260506-rpi-otp-driver-v3-0-294602663695@linutronix.de

Changes in v3:
- dts: add "raspberrypi,bcm2835-firmware" as fallback and fix dt-bindings
- Fix Kconfig depends
- Changed firmware data fields to __le32
- Add MODULE_ALIAS
- Link to v2: https://patch.msgid.link/20260505-rpi-otp-driver-v2-0-e9176ec72837@linutronix.de

Changes in v2:
- register nvmem driver from firmware driver and drop firmware sub nodes
- Use struct_size and __counted_by for dynamic array
- Drop unneeded comment in Kconfig
- Use NVMEM_DEVID_NONE
- Use kzalloc
- Update module description
- Link to v1: https://patch.msgid.link/20260408-rpi-otp-driver-v1-0-e02d1dbe6008@linutronix.de

---
Gregor Herburger (8):
      soc: bcm2835: Use IS_REACHABLE for function declaration
      nvmem: core: Enforce stride and alignment checks for nvmem_device functions
      dt-bindings: raspberrypi,bcm2835-firmware: Add bcm2712-firmware compatible
      nvmem: Add the Raspberry Pi OTP driver
      firmware: raspberrypi: register nvmem driver
      arm64: dts: broadcom: bcm2712: add raspberrypi,bcm2712-firmware compatible
      dt-bindings: raspberrypi,bcm2835-firmware: Drop unnecessary select
      arm64: defconfig: Enable the raspberrypi otp driver as module

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml      |  20 ++--
 .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |   4 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/firmware/raspberrypi.c                     |  59 +++++++++-
 drivers/nvmem/Kconfig                              |  11 ++
 drivers/nvmem/Makefile                             |   1 +
 drivers/nvmem/core.c                               |  12 ++
 drivers/nvmem/raspberrypi-otp.c                    | 130 +++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h         |  17 ++-
 9 files changed, 240 insertions(+), 15 deletions(-)
---
base-commit: f3e6330d7fe42b204af05a2dbc68b379e0ad179e
change-id: 20260408-rpi-otp-driver-75fce1dcff7d

Best regards,
--  
Gregor Herburger <gregor.herburger@linutronix.de>


