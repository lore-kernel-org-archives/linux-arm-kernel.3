Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3322E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr1VNyO3Lr951QHJDr56v4a9+KnhMSyBPcNhs61GT/I=; b=EEbpf7e7E2+NMMC+qTij6pd+TT
	BLoKMmkl8zs5ZLyTx2MyfL90VUpKaKZDIFrSVtPynGhLWtDTcaL+86clLs2d3Bc0HfDsBK7L/fJyM
	092pYnw1laylqOG+rPaPOtEfm0eyKD4XdUVKUIkHjOlGumYeT7MJZnPA0JnEfdiET9a+WHLELmnXa
	JVJ3yfK7RSNzIQP+N/N8vJ4fvM+w2ir8/rzaLbqsPTXJ2V6nhkLs4QKl3yGgYuwaQgOzRKz3KSv+F
	zEKuIy/3pvmjLz4pIZz6jv9Fj4HqqJZIdxvCY0wgwKEoOd301kCeux/DNzmiyVWG3MDZd8lVpH642
	auLv3I5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImgQ-0000000CDGw-0VqK;
	Wed, 04 Dec 2024 10:32:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdY-0000000CCXT-49Bb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B75FA40F17;
	Wed,  4 Dec 2024 10:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0537BC4CEDD;
	Wed,  4 Dec 2024 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308179;
	bh=0r10L0YCyc4mHIa4LmRwV2eFEw40ha9ErMc2w48Ije4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWS6xxv/D0II+x/uHDJV7zBfhSB+xp/+0+xQ/BEmIWa9fFF62990uvJMieEDHJXcs
	 Nyeolhp8EOa45Xdacjp83BWNh+O1yzDhIAbTFx+39LAEUl7o5tTUjdThuHEgNy2lPK
	 a943Iw2EhFDWSdu+hvpEUF/FiZF+3gS13QZf6SEzE61K40gQxHsd6R3J89512Hghoz
	 e4+PHpEJtpmIr6L1htv/GLv0ZRqajbPALtMlf+O9ZTA5ilOMv76imf/kj66AOfIjj1
	 uqd1/gy5GnP2MuUG6Dx1wWBbGlcSCbVNy17WsprzBzXHYoWYVkRgPbNApr5giK6qHU
	 EFAIH4Di5Hutw==
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
Subject: [PATCH 02/15] ARM: limit OABI support to StrongARM CPUs
Date: Wed,  4 Dec 2024 11:28:51 +0100
Message-Id: <20241204102904.1863796-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022941_172769_D6480321 
X-CRM114-Status: GOOD (  23.65  )
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

As discussed on the mailing lists, there is no way to build OABI userspace
binaries any more since gcc-4.8, and now support is also getting dropped in
binutils, which will make it impossible to build pure OABI kernels at some
point in the future.

I found no evidence of anyone still sing OABI userspace on embedded systems
that keep getting kernel updates, but there are a few desktop-class machines
that date back to the 1990s using Intel StrongARM processors that were
supported by old versions of Debian, Red Hat or the official Corel
Netwinder distribution.

Add a much stricter Kconfig dependency for both native OABI and OABI_COMPAT
enabled kernels, only allowing either of them to be selected when building
a kernel that targets a StrongARM based machine.

Link: https://lore.kernel.org/lkml/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                       | 14 +++++++-------
 arch/arm/configs/am200epdkit_defconfig |  1 -
 arch/arm/configs/axm55xx_defconfig     |  1 -
 arch/arm/configs/footbridge_defconfig  |  2 +-
 arch/arm/configs/neponset_defconfig    |  2 +-
 arch/arm/configs/versatile_defconfig   |  1 -
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f8f127650ace..54f5cc12dea4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1161,8 +1161,7 @@ config ARM_PATCH_IDIV
 	  code to do integer division.
 
 config AEABI
-	bool "Use the ARM EABI to compile the kernel" if !CPU_V7 && \
-		!CPU_V7M && !CPU_V6 && !CPU_V6K && !CC_IS_CLANG
+	bool "Use the ARM EABI to compile the kernel" if CPU_SA110 || CPU_SA1100
 	default y
 	help
 	  The Arm EABI is the default ABI on all modern Linux
@@ -1172,9 +1171,13 @@ config AEABI
 	  Everyone should enable this, as support for OABI user space
 	  was dropped in gcc-4.8 and most distributions after ca. 2013.
 
+	  Support for OABI mode will be removed from the kernel
+	  once Intel StrongARM CPUs are phased out.
+
 config OABI_COMPAT
 	bool "Allow old ABI binaries to run with this kernel (EXPERIMENTAL)"
 	depends on AEABI && !THUMB2_KERNEL
+	depends on CPU_SA110 || CPU_SA1100
 	help
 	  This option preserves the old syscall interface along with the
 	  new (ARM EABI) one. It also provides a compatibility layer to
@@ -1187,11 +1190,8 @@ config OABI_COMPAT
 	  selected, since there is no way yet to sensibly distinguish
 	  between calling conventions during filtering.
 
-	  If you know you'll be using only pure EABI user space then you
-	  can say N here. If this option is not selected and you attempt
-	  to execute a legacy ABI binary then the result will be
-	  UNPREDICTABLE (in fact it can be predicted that it won't work
-	  at all). If in doubt say N.
+	  Support for OABI_COMPAT will be removed from the kernel
+	  once Intel StrongARM CPUs are phased out.
 
 config ARCH_SELECT_MEMORY_MODEL
 	def_bool y
diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index 22397d45f4a0..55c5c08a5f96 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -7,7 +7,6 @@ CONFIG_EXPERT=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_GUMSTIX=y
-# CONFIG_OABI_COMPAT is not set
 CONFIG_CMDLINE="console=ttyS0,115200n8 root=1f01 rootfstype=jffs2"
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 39b06d59d87a..9d14b987ee94 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -38,7 +38,6 @@ CONFIG_PCIE_AXXIA=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_HOTPLUG_CPU=y
-CONFIG_OABI_COMPAT=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
index 589b7b1df8c6..e8bf9847d35d 100644
--- a/arch/arm/configs/footbridge_defconfig
+++ b/arch/arm/configs/footbridge_defconfig
@@ -9,9 +9,9 @@ CONFIG_ARCH_MULTI_V4=y
 CONFIG_ARCH_FOOTBRIDGE=y
 CONFIG_ARCH_EBSA285_HOST=y
 CONFIG_ARCH_NETWINDER=y
+# CONFIG_AEABI is not set
 CONFIG_FPE_NWFPE=y
 CONFIG_FPE_NWFPE_XP=y
-# CONFIG_AEABI is not set
 CONFIG_MODULES=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ACORN_PARTITION=y
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index a8833b2ce335..7a7b6a896f85 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -6,12 +6,12 @@ CONFIG_ARCH_MULTI_V4=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_ASSABET=y
 CONFIG_ASSABET_NEPONSET=y
+# CONFIG_AEABI is not set
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
 CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) load_ramdisk=1 prompt_ramdisk=0 mem=32M noinitrd initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
-# CONFIG_AEABI is not set
 CONFIG_PM=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index 8e89debb5a5b..bb9eb9ccbbde 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_VERSATILE=y
-CONFIG_OABI_COMPAT=y
 CONFIG_CMDLINE="root=1f03 mem=32M"
 CONFIG_FPE_NWFPE=y
 CONFIG_VFP=y
-- 
2.39.5


