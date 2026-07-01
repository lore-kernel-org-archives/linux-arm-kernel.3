Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75158C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkENCC5g/NhBpV6tRmTx+QkQDEDpYP38mkz+ONI4lI8=; b=QGeXhN+SkPUCGzSfK3dcGwz9Vc
	L+0UAJMxkkqul86uFhSUGg5cjY+wSN5a3FZlec5FYvJFsLcZQuNF9O9R5Fkfes29nyOSZeABMjEnO
	MOeQLKI3j5l9GSexlTAMNIkqJsuu0a4+/nAGUO010Xwb7KlIZvGdPdcsXS0CFI2iO+eA0coYpIUvb
	blUyqZ0gDaj+nDCzJRCGGubHeZepg0bhSxF0YUlmGzjXZfIhOfmivB5KIFeRA9G8cKVF2uutmIBiG
	A7vuA8kd3a7qOZkPB3KE2ZAEQ5L+DCeLOEsw78GTSDPWTrmOzT0xtMVV0UFLwIDOYkHEN6ZxYjt8G
	DTdduMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RR-000000032kV-0Faa;
	Wed, 01 Jul 2026 21:25:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RP-000000032jN-0tXI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F05AD4181A;
	Wed,  1 Jul 2026 21:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21D61F00A3A;
	Wed,  1 Jul 2026 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941154;
	bh=kkENCC5g/NhBpV6tRmTx+QkQDEDpYP38mkz+ONI4lI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nOwKBRXZDBw6aEoGRSr8e8I7Zz6wMkl4Aw9zuWvhU6LkIvQgRMCXqmo0F9eMB6Oo6
	 4k71Tewj0VXxYB04o9u0iKzl16dULe7R/yH+2Ck2RBQrsX0/0BLNhzefvDSOQiE4oR
	 iGMQvDVUNU7tXNyRebwHk+3JJTi3m47kTdNT49cSEKD8G76ALMwJF19U08ExIXm0If
	 cmsu5CGVlpnp7DTwkp+z69qVFD7gRm9CNinZ4RCOIYuvWkukCmnF+v6rjAKWWZXFiJ
	 OowWEriH9XBFY1GCdzFuvL2RWf50JB9riqmpLHXSwrQlBhS7ia3pxcKRa8r7GQSOQG
	 zK2d7O1j2F0Gw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 13/19] ARM: orion5x: mark all board files as deprecated
Date: Wed,  1 Jul 2026 23:23:47 +0200
Message-Id: <20260701212353.2196041-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701212353.2196041-1-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

Conversion of the old orion5x board files to devicetree has
stalled over the past few years, so it seems better to remove
the remaining ones in order to allow  cleaning up the device
drivers.

Debian has previously removed the orion/kirkwood kernel
binary from the armel distro, but building custom kernels
from the Debian source code should keep working, so
removing the board files after the 6.12 release ensures
that this remains possible for the Debian Trixie release,
assuming this will use the 6.12 LTS kernel.

Jeremy Peper still plans to convert the Terastation 2 Pro
to devicetree in the future, but that can be done even
after it is removed.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v5_defconfig |  9 ------
 arch/arm/configs/mvebu_v5_defconfig |  9 ------
 arch/arm/configs/orion5x_defconfig  |  9 ------
 arch/arm/mach-orion5x/Kconfig       | 47 +++++++++++++++++++++++------
 4 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 7eab9fb9ffc4..a0d2fb2fcf9a 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -22,17 +22,8 @@ CONFIG_ARCH_NPCM=y
 CONFIG_ARCH_WPCM450=y
 CONFIG_ARCH_ORION5X=y
 CONFIG_MACH_RD88F5182_DT=y
-CONFIG_MACH_KUROBOX_PRO=y
-CONFIG_MACH_DNS323=y
-CONFIG_MACH_TS209=y
-CONFIG_MACH_TERASTATION_PRO2=y
-CONFIG_MACH_LINKSTATION_PRO=y
 CONFIG_MACH_LINKSTATION_MINI=y
-CONFIG_MACH_TS409=y
-CONFIG_MACH_TS78XX=y
-CONFIG_MACH_MV2120=y
 CONFIG_MACH_D2NET_DT=y
-CONFIG_MACH_NET2BIG=y
 CONFIG_MACH_MSS2_DT=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_VERSATILE=y
diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index 0709a5e66bb5..dbc6c511e70b 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -10,17 +10,8 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_MACH_KIRKWOOD=y
 CONFIG_ARCH_ORION5X=y
 CONFIG_MACH_RD88F5182_DT=y
-CONFIG_MACH_KUROBOX_PRO=y
-CONFIG_MACH_DNS323=y
-CONFIG_MACH_TS209=y
-CONFIG_MACH_TERASTATION_PRO2=y
-CONFIG_MACH_LINKSTATION_PRO=y
 CONFIG_MACH_LINKSTATION_MINI=y
-CONFIG_MACH_TS409=y
-CONFIG_MACH_TS78XX=y
-CONFIG_MACH_MV2120=y
 CONFIG_MACH_D2NET_DT=y
-CONFIG_MACH_NET2BIG=y
 CONFIG_MACH_MSS2_DT=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
diff --git a/arch/arm/configs/orion5x_defconfig b/arch/arm/configs/orion5x_defconfig
index d658d5e04e2d..f47a84ac872f 100644
--- a/arch/arm/configs/orion5x_defconfig
+++ b/arch/arm/configs/orion5x_defconfig
@@ -10,16 +10,7 @@ CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_ORION5X=y
 CONFIG_MACH_RD88F5182_DT=y
-CONFIG_MACH_KUROBOX_PRO=y
-CONFIG_MACH_DNS323=y
-CONFIG_MACH_TS209=y
-CONFIG_MACH_TERASTATION_PRO2=y
-CONFIG_MACH_LINKSTATION_PRO=y
 CONFIG_MACH_LINKSTATION_MINI=y
-CONFIG_MACH_TS409=y
-CONFIG_MACH_TS78XX=y
-CONFIG_MACH_MV2120=y
-CONFIG_MACH_NET2BIG=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_VFP=y
diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
index cef19bea6164..c61999d01c80 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -19,7 +19,7 @@ menuconfig ARCH_ORION5X
 if ARCH_ORION5X
 
 config ARCH_ORION5X_DT
-	bool "Marvell Orion5x Flattened Device Tree"
+	def_bool y
 	select ORION_CLK
 	select ORION_IRQCHIP
 	select ORION_TIMER
@@ -38,37 +38,49 @@ config MACH_RD88F5182_DT
 	  Orion-NAS (88F5182) RD2, Flattened Device Tree.
 
 config MACH_KUROBOX_PRO
-	bool "KuroBox Pro"
+	bool "KuroBox Pro (DEPRECATED)"
 	select I2C_BOARDINFO if I2C
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  KuroBox Pro platform.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_DNS323
-	bool "D-Link DNS-323"
+	bool "D-Link DNS-323 (DEPRECATED)"
 	select I2C_BOARDINFO if I2C
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  D-Link DNS-323 platform.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_TS209
-	bool "QNAP TS-109/TS-209"
+	bool "QNAP TS-109/TS-209 (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  QNAP TS-109/TS-209 platform.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_TERASTATION_PRO2
-	bool "Buffalo Terastation Pro II/Live"
+	bool "Buffalo Terastation Pro II/Live (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  Buffalo Terastation Pro II/Live platform.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_LINKSTATION_PRO
-	bool "Buffalo Linkstation Pro/Live"
+	bool "Buffalo Linkstation Pro/Live (DEPRECATED)"
 	depends on ATAGS
 	select I2C_BOARDINFO if I2C
 	help
@@ -76,6 +88,9 @@ config MACH_LINKSTATION_PRO
 	  Buffalo Linkstation Pro/Live platform. Both v1 and
 	  v2 devices are supported.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_LINKSTATION_MINI
 	bool "Buffalo Linkstation Mini (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
@@ -84,26 +99,35 @@ config MACH_LINKSTATION_MINI
 	  Buffalo Linkstation Mini (LS-WSGL) platform.
 
 config MACH_TS409
-	bool "QNAP TS-409"
+	bool "QNAP TS-409 (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  QNAP TS-409 platform.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_TS78XX
-	bool "Technologic Systems TS-78xx"
+	bool "Technologic Systems TS-78xx (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  Technologic Systems TS-78xx platform.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_MV2120
-	bool "HP Media Vault mv2120"
+	bool "HP Media Vault mv2120 (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  HP Media Vault mv2120 or mv5100.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_D2NET_DT
 	bool "LaCie d2 Network / Big Disk Network (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
@@ -112,13 +136,16 @@ config MACH_D2NET_DT
 	  LaCie d2 Network NAS.
 
 config MACH_NET2BIG
-	bool "LaCie 2Big Network"
+	bool "LaCie 2Big Network (DEPRECATED)"
 	depends on ATAGS
 	select I2C_BOARDINFO if I2C
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  LaCie 2Big Network NAS.
 
+	  Support for this machine will go away in early 2027,
+	  unless it gets converted to device tree.
+
 config MACH_MSS2_DT
 	bool "Maxtor Shared Storage II (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
-- 
2.39.5


