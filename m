Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AC5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MX/lz98+0cd/8G1ZQWEULMZs5MfQbqscpnFu2VUjmNo=; b=uO0fSecCmBeDKojFhiGCtTLzxo
	enghXS7eaIjksw/Zo72PT2dZ39wwsDyQEalKI+MJRVLMORey45EzNlGNPnkvNBVunC9+QU9uBmTRk
	cWYxOfq3AxyuhQNT0l/CERhgTEIdJtPBnlYGeKa8O9X43Ukp1q7LbURnzpIR2Edt6owY6SE3xikXG
	FSX1Ry83pG3WbMOABMGD6XNi9JedreJuUcKgH/whpdB1z4VrlL7Pt10rLL1Ld+5TXiscWNhN9UHGW
	wZt0317aA44nOVdMX4zpmzg7GAcNLiByRtBQGjM1lXshCG4LfloqU9Vp0k4pz+4qZ2uZ5DYdToBYi
	KhbOs4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Rv-0000000335u-3F28;
	Wed, 01 Jul 2026 21:26:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Ru-0000000334X-2Vhf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:26:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DC8C600AF;
	Wed,  1 Jul 2026 21:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EBF1F00A3A;
	Wed,  1 Jul 2026 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941185;
	bh=MX/lz98+0cd/8G1ZQWEULMZs5MfQbqscpnFu2VUjmNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lRVMIYgCFASweQy7+uaoWcSNU3Sf3yGcuxtbwpdNpy5gVyt7lTNR740hecqw71Xc1
	 aZ/yrN13O+Ak3HCdLYh4+/GPG5xkdVN0ugTDDm17UxozEnkGV4K/h2upRmImPfjnIe
	 dNNqCVYb6r74x08quxqI2LNGoqGp+72eCoaLK2EKhpc4c1IKxdlMhPI+pNXxDj/fnV
	 /n+1dRVB4BB87i2g20ijCOvMCoPu6krxz2cZDPlv6M0XtgExt5MKZbOBmEHeJgqhCS
	 0Q0yf+c3w9zJWINsNx86YYUtTUMmEVTLJ0bbmFKcUI/8xewoeum90rwQZulQwpR8Xc
	 tRdbHjewuEQXA==
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
Subject: [PATCH v2 17/19] ARM: mark Cortex-M3/M4/M7 based boards as deprecated
Date: Wed,  1 Jul 2026 23:23:51 +0200
Message-Id: <20260701212353.2196041-18-arnd@kernel.org>
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

The Cortex-M3/M4/M7 cores were designed as a replacement for the earlier
ARM7TDMI and ARM9TDMI microarchitectures used in older microcontrollers.

At the moment, Linux can run these cores either when they are integrated
into a larger SoC, or as standalone microcontrollers. While there was
a lot of development work going into Cortex-M support from 2011 to 2016,
this largely stopped when it became clear that Zephyr and other RTOS
had taken over that market. To date, the only Cortex-M based based
microcontroller boards supported upstream are reference implementations.

Schedule these for removal after the next LTS kernel, so if any users
remain that want to update their kernels, they can stay on that
version for a few years before having to maintain the platform support
out of tree.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig            |  8 ++++++--
 arch/arm/mach-at91/Kconfig  |  4 +++-
 arch/arm/mach-imx/Kconfig   |  4 +++-
 arch/arm/mach-stm32/Kconfig | 14 ++++++++------
 4 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e2bdf2591c10..5adccaed7d01 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -471,7 +471,7 @@ source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
 config ARCH_LPC18XX
-	bool "NXP LPC18xx/LPC43xx"
+	bool "NXP LPC18xx/LPC43xx (DEPRECATED)"
 	depends on ARM_SINGLE_ARMV7M
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
@@ -481,8 +481,10 @@ config ARCH_LPC18XX
 	  Support for NXP's LPC18xx Cortex-M3 and LPC43xx Cortex-M4
 	  high performance microcontrollers.
 
+	  This platform is scheduled for removal in early 2027
+
 config ARCH_MPS2
-	bool "ARM MPS2 platform"
+	bool "ARM MPS2 platform (DEPRECATED)"
 	depends on ARM_SINGLE_ARMV7M
 	select ARM_AMBA
 	select CLKSRC_MPS2
@@ -493,6 +495,8 @@ config ARCH_MPS2
 	  Please, note that depends which Application Note is used memory map
 	  for the platform may vary, so adjustment of RAM base might be needed.
 
+	  This platform is scheduled for removal in early 2027
+
 # Definitions to make life easier
 config ARCH_ACORN
 	bool
diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index c5ef27e3cd8f..cb0e3ff8e0ca 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -15,13 +15,15 @@ menuconfig ARCH_AT91
 
 if ARCH_AT91
 config SOC_SAMV7
-	bool "SAM Cortex-M7 family" if ARM_SINGLE_ARMV7M
+	bool "SAM Cortex-M7 family (DEPRECATED)" if ARM_SINGLE_ARMV7M
 	select COMMON_CLK_AT91
 	select PINCTRL_AT91
 	help
 	  Select this if you are using an SoC from Microchip's SAME7, SAMS7 or SAMV7
 	  families.
 
+	  This platform is scheduled for removal in early 2027
+
 config SOC_SAMA5D2
 	bool "SAMA5D2 family"
 	depends on ARCH_MULTI_V7
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index f85a5f8c0a58..3f0521c652cb 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -219,12 +219,14 @@ config SOC_IMX7ULP
 	  This enables support for Freescale i.MX7 Ultra Low Power processor.
 
 config SOC_IMXRT
-	bool "i.MXRT support"
+	bool "i.MXRT support (DEPRECATED)"
 	depends on ARM_SINGLE_ARMV7M
 	select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
 	help
 	  This enables support for Freescale i.MXRT Crossover processor.
 
+	  This platform is scheduled for removal in early 2027
+
 config SOC_VF610
 	bool "Vybrid Family VF610 support"
 	select ARM_GIC if ARCH_MULTI_V7
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 630b992f32b1..4ac3384e397a 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -14,30 +14,32 @@ menuconfig ARCH_STM32
 	select STM32_EXTI if ARM_SINGLE_ARMV7M
 	select STM32_FIREWALL
 	help
-	  Support for STMicroelectronics STM32 processors.
+	  Support for STMicroelectronics STM32MP1 processors using Cortex-A7
+	  cores. Note that support for the earlier Cortex-M based variants
+	  is deprecated and scheduled for removal in early 2027.
 
 if ARCH_STM32
 
 if ARM_SINGLE_ARMV7M
 
 config MACH_STM32F429
-	bool "STMicroelectronics STM32F429"
+	bool "STMicroelectronics STM32F429 (DEPRECATED)"
 	default y
 
 config MACH_STM32F469
-	bool "STMicroelectronics STM32F469"
+	bool "STMicroelectronics STM32F469 (DEPRECATED)"
 	default y
 
 config MACH_STM32F746
-	bool "STMicroelectronics STM32F746"
+	bool "STMicroelectronics STM32F746 (DEPRECATED)"
 	default y
 
 config MACH_STM32F769
-	bool "STMicroelectronics STM32F769"
+	bool "STMicroelectronics STM32F769 (DEPRECATED)"
 	default y
 
 config MACH_STM32H743
-	bool "STMicroelectronics STM32H743"
+	bool "STMicroelectronics STM32H743 (DEPRECATED)"
 	default y
 
 endif # ARMv7-M
-- 
2.39.5


