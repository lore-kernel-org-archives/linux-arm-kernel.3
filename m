Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B87D6ACF6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GJsG2K/qyWxkx8maHy/IhNjKC6mBJMwLIPF3uPuwRJo=; b=tOP0o0yrEdUg8DACQFjMHKyy92
	pbHr2NxTOtE+fgiOx7R7u8XOQKUbobE8Es9AVYTGJZIoCcJXJfvt9p4DQ4SK8b7Q6qsCCbruUxfUY
	Z3uSmtnrsG01/cP3mx8xSrpb9Uyf4HnBTJO89pe0txHFV28qBOzTc5c9cve4qJkuli3aA7Fkdqyo2
	i/rDiPxMvRQEARnI58oB6aUig4oiPFTjsMtjuVNonAc4aeT8fbJ2v3oON9v+vcpq91GKyCH8CC3LZ
	ny2zeHli+7lJEYx94ZQx2dPKPlnilq3ebO/JkDpUI7IuSSU76RY9Ah50rAPaTLFvo0+s1QwkF5hTz
	xO4EBz2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGLBX-0000000Dfo9-0wIh;
	Wed, 27 Nov 2024 16:46:39 +0000
Received: from mail.fris.de ([2a01:4f8:c2c:390b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL9a-0000000DfCi-3CxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:44:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1C53BFB2F;
	Wed, 27 Nov 2024 17:44:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725869; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=GJsG2K/qyWxkx8maHy/IhNjKC6mBJMwLIPF3uPuwRJo=;
	b=CjlxwcOYmL1v1mau6RhjuYSMW/BXNA+PJ2FSZ8CSUzXYphR82MTOLS8V1n+WwTeoevCH39
	5YmWAuruAuOeqHcmLdGR9vIUjKBbyrAvQEd4gWwgdr8aFcLMeTSmeX7bkcZp78qZ2dthl+
	RND3vkVqcCEprE+n28ohd6EEBlAOikoHSusRYNyOk7Me2KE4rwSCyJ8q739+WhYJRCY/DC
	VNqGB+ERiNspRHXa69DpcUWnEg4tjXWxfNTvT/UWuw3txkN2q+e9Qj3z8fZ5K+UBr8VUvN
	S5OtBZJjYmw2YVOaxM/xVniN9BLz1WynHhHveyS2zlFZqIDM133pkJUjIOAwug==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Bo Liu <liubo03@inspur.com>,
	Fabio Estevam <festevam@gmail.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 00/11] Use correct LDO5 control registers for PCA9450
Date: Wed, 27 Nov 2024 17:42:16 +0100
Message-ID: <20241127164337.613915-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_084439_238617_FB962076 
X-CRM114-Status: GOOD (  18.05  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This is a follow-up of [1].

The main objective of this is to fix the PCA9450 driver to
use the correct control register for the LDO5 regulator.

Currently the control register to use for LDO5 is hardcoded to
LDO5CTRL_H. This is wrong for two reasons:

1. LDO5CTRL_H doesn't contain the bits for enabling/disabling
   the regulator. Only LDO5CTRL_L does.

2. The actual output voltage of the regulator is determined by
   the LDO5CTRL_H only if the SD_VSEL input is HIGH. If it is
   low, then LDO5CTRL_L is used. The driver does not take this
   into account.

This can cause several problems:

1. LDO5 can not be turned on/off and we rely on the bootloader
   to leave it turned on. On the other hand we can't save
   power if LDO5 is unused.

2. There is a potential for corner-cases where switching
   SD_VSEL via USDHC_VSELECT and writing to the (wrong)
   control register can cause wrong output voltage and therfore
   SD card failures (not observed yet).

3. Reading the current voltage of the LDO5 regulator (e. g. via
   sysfs can yield the wrong value as the voltage is read from
   the wrong control register.

At the same time there is now hardware that hardwires SD_VSEL
to a fixed LOW level and therefore relies on switching the
voltage only via a single control register. We add support for
this through an additional property "nxp,sd-vsel-fixed-low" in
the LDO5 node.

Summary of binding changes (patch 1-3):

1. Adjust the bindings to remove the old and abandoned use of
   sd-vsel-gpios property.

2. Adjust the bindings to use sd-vsel-gpios in the LDO5 node to
   retrieve an input that can be used to sample the SD_VSEL
   status.

3. Adjust bindings to allow "nxp,sd-vsel-fixed-low" to be used
   for boards that have SD_VSEL hardwired to low level.

Summary of driver changes (patch 4-7):

1. Remove the old sd-vsel-gpios handling.

2. Use the new sd-vsel-gpios property to determine the correct
   control register for LDO5.

3. Fix the enable register for LDO5.

4. Support hardware with fixed low level of SD_VSEL.

Summary of devicetree changes (patch 8-10):

Implement the changes in the devicetrees for Kontron hardware
(i.MX8MM, i.MX8MP and i.MX93).

Changelog:

v1 -> v2:

* Split binding patch
* Add solution for hardwired SD_VSEL
* Leave regulator core untouched as requested by Mark
* Add devicetree changes for i.MX8MP and i.MX93

[1] https://lore.kernel.org/lkml/20230213155833.1644366-1-frieder@fris.de/

Frieder Schrempf (11):
  Revert "regulator: pca9450: Add sd-vsel GPIO"
  dt-bindings: regulator: pca9450: Add sd-vsel-gpios to read back LDO5
    status
  dt-bindings: regulator: pca9450: Document nxp,sd-vsel-fixed-low
    property for LDO5
  arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
  Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
  regulator: pca9450: Fix control register for LDO5
  regulator: pca9450: Fix enable register for LDO5
  regulator: pca9450: Handle hardware with fixed SD_VSEL for LDO5
  arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
  arm64: dts: imx93-kontron: Fix SD card IO voltage control
  arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal

 .../regulator/nxp,pca9450-regulator.yaml      | 29 ++++--
 .../boot/dts/freescale/imx8mm-kontron-bl.dts  | 10 ++-
 .../dts/freescale/imx8mm-kontron-osm-s.dtsi   |  7 +-
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |  7 +-
 .../boot/dts/freescale/imx8mp-skov-reva.dtsi  |  5 +-
 .../dts/freescale/imx93-kontron-osm-s.dtsi    |  5 +-
 drivers/regulator/pca9450-regulator.c         | 88 ++++++++++++++++---
 7 files changed, 119 insertions(+), 32 deletions(-)

-- 
2.46.1


