Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48890E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUIems59xpozy/l3/xrNOpDZeJ2bcHvlLtMVeMCRcyw=; b=idkrGtWs3TvAVDYufFFXnAasyB
	QvsE7Za0DdKoeyXGeCZF6zTkxOxnsCYVZiF4gYIS0BfSpvxG6aVVHTjnpD8aTVa8z//hCc3lhi723
	BgrVH8p4IAwzn9KsPnRkKh5mi8W1hYfPj7CVDrKBobTIkWhEbyfOoKxqy9jvPAcve1sVeZp3oBW+1
	wNQjCB8inE7NzCJnWOCh5tvsoos9bY7kgDQWJZPXR7n2kDhQTWGOmCulCi32KmHDmGCp/XiYBZ61q
	jfWV9IqIc5rKY/szoOyaWSc7Fzus/XnjBr6GykOAxMO0cINAh/nAZtozaowArqC9ly3kZ8asC3/3I
	BzntnYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImqE-0000000CFVJ-2D1k;
	Wed, 04 Dec 2024 10:42:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImeH-0000000CCiP-2JQl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B6E4A40F0C;
	Wed,  4 Dec 2024 10:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A833C4CEE0;
	Wed,  4 Dec 2024 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308224;
	bh=oclk2RjUWpkTXM4Ts+5VgdtwjHIVQ6ev2N6/KBWfxFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QMkvjYUI3ovit5VIzHqH5WGQ4rYJnIjJGktVOCmd35BIRhREnWqPhm3EdKKo9P372
	 GpdIyWq6IByPILnN8XRTz6T7uHLWTCqW7VAiYF1xHHfa+xDbnOmPI/Uqk0ZvREdl18
	 +tirJmp40B+TpPB3hm7WVCBRNdoMJUmzWJvPCLU3yilzHI7gasQaQIsm1hHQsWLivK
	 HKue15Cmlap8MUDnn+IIXU70sKTCrMHsYvQCjtlM5vSK2MyoRtBtzZsFUXrFG2JlOW
	 IA8jgVlvz9Q1TX8Ehf//CTqNERsso+G8woXVQmKdga08aQXCYR05yPzz4fhw55dbV1
	 3gc+v2e2knxEA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH 12/15] ARM: orion5x: mark all board files as deprecated
Date: Wed,  4 Dec 2024 11:29:01 +0100
Message-Id: <20241204102904.1863796-13-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023025_716230_4E61C3C4 
X-CRM114-Status: GOOD (  17.94  )
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v5_defconfig |  9 ------
 arch/arm/configs/mvebu_v5_defconfig | 10 ------
 arch/arm/configs/orion5x_defconfig  |  9 ------
 arch/arm/mach-orion5x/Kconfig       | 47 +++++++++++++++++++++++------
 4 files changed, 37 insertions(+), 38 deletions(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index e40276a28760..588366672b75 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -23,17 +23,8 @@ CONFIG_ARCH_NPCM=y
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
index b8d20e1d9c5d..b3396964863b 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -10,18 +10,8 @@ CONFIG_ARCH_MVEBU=y
 CONFIG_MACH_KIRKWOOD=y
 CONFIG_ARCH_ORION5X=y
 CONFIG_MACH_RD88F5182_DT=y
-CONFIG_MACH_KUROBOX_PRO=y
-CONFIG_MACH_DNS323=y
-CONFIG_MACH_TS209=y
-CONFIG_MACH_TERASTATION_PRO2=y
-CONFIG_MACH_LINKSTATION_PRO=y
-CONFIG_MACH_LINKSTATION_LSCHL=y
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
index 8e10c53818a3..664d11938143 100644
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
index ee449ca032d2..cf1bf4cd3733 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -18,7 +18,7 @@ menuconfig ARCH_ORION5X
 if ARCH_ORION5X
 
 config ARCH_ORION5X_DT
-	bool "Marvell Orion5x Flattened Device Tree"
+	def_bool y
 	select ORION_CLK
 	select ORION_IRQCHIP
 	select ORION_TIMER
@@ -37,37 +37,49 @@ config MACH_RD88F5182_DT
 	  Orion-NAS (88F5182) RD2, Flattened Device Tree.
 
 config MACH_KUROBOX_PRO
-	bool "KuroBox Pro"
+	bool "KuroBox Pro (DEPRECATED)"
 	select I2C_BOARDINFO if I2C
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  KuroBox Pro platform.
 
+	  Support for this machine will go away in early 2025,
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
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_TS209
-	bool "QNAP TS-109/TS-209"
+	bool "QNAP TS-109/TS-209 (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  QNAP TS-109/TS-209 platform.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_TERASTATION_PRO2
-	bool "Buffalo Terastation Pro II/Live"
+	bool "Buffalo Terastation Pro II/Live (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  Buffalo Terastation Pro II/Live platform.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_LINKSTATION_PRO
-	bool "Buffalo Linkstation Pro/Live"
+	bool "Buffalo Linkstation Pro/Live (DEPRECATED)"
 	depends on ATAGS
 	select I2C_BOARDINFO if I2C
 	help
@@ -75,6 +87,9 @@ config MACH_LINKSTATION_PRO
 	  Buffalo Linkstation Pro/Live platform. Both v1 and
 	  v2 devices are supported.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_LINKSTATION_MINI
 	bool "Buffalo Linkstation Mini (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
@@ -83,26 +98,35 @@ config MACH_LINKSTATION_MINI
 	  Buffalo Linkstation Mini (LS-WSGL) platform.
 
 config MACH_TS409
-	bool "QNAP TS-409"
+	bool "QNAP TS-409 (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  QNAP TS-409 platform.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_TS78XX
-	bool "Technologic Systems TS-78xx"
+	bool "Technologic Systems TS-78xx (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  Technologic Systems TS-78xx platform.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_MV2120
-	bool "HP Media Vault mv2120"
+	bool "HP Media Vault mv2120 (DEPRECATED)"
 	depends on ATAGS
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  HP Media Vault mv2120 or mv5100.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_D2NET_DT
 	bool "LaCie d2 Network / Big Disk Network (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
@@ -111,13 +135,16 @@ config MACH_D2NET_DT
 	  LaCie d2 Network NAS.
 
 config MACH_NET2BIG
-	bool "LaCie 2Big Network"
+	bool "LaCie 2Big Network (DEPRECATED)"
 	depends on ATAGS
 	select I2C_BOARDINFO if I2C
 	help
 	  Say 'Y' here if you want your kernel to support the
 	  LaCie 2Big Network NAS.
 
+	  Support for this machine will go away in early 2025,
+	  unless it gets converted to device tree.
+
 config MACH_MSS2_DT
 	bool "Maxtor Shared Storage II (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
-- 
2.39.5


