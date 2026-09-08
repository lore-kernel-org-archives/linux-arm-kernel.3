Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E35C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUaWGmquczMvpFg8ray+ieCyx5b2Onx4FFsTtstaZWc=; b=KfzX08w53X1GQL2Hqydnory4Hj
	n41n+G/5bVf0SA71vR/JUynufqIjtfBHjeu2hV/JDESaqkhqyN84k69KppZSUj3SQ0RYkEU0K/mRG
	oWoUDgp8urb5EE0ctsLO7zSdbx1T8fc+MV8Jn+KT0WN3ZKQrKl+z/mRkFBPDhmnDmLegpo0ZXYHWw
	p6ycdb30qNF6mrzN7nyS9RAlV4f722w+RBJaZFS+INeFpFLBgdEyOP7KhxB5O341LgdVHb5BhGw0I
	nYDy5N6koYWHIeep2qC+6wlap/f75k6HX0kHyHMV435LeKB/MD2noYYG9An6tNZJMaSvlMsm9VPhP
	CQp2x8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xmV-00000009UvY-2m8N;
	Tue, 08 Sep 2026 15:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xmO-00000009Utc-2mJO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:30:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6978B436E7;
	Tue,  8 Sep 2026 15:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA481F00A3F;
	Tue,  8 Sep 2026 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788881436;
	bh=TUaWGmquczMvpFg8ray+ieCyx5b2Onx4FFsTtstaZWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bYisMhAMDHoadOZ0kD8KMgKWaWZ77EG/GxWVmmzSyWumC8U4YvkG/Ug1sJiBZsTEs
	 WbibilOkfPuhkrcaf6tHLZVgEuqUG08hpJQTHem6HUiEWg9Q45jNxjxxJ4bbC8PVEp
	 SrmEAEduvlVmGlKR680q+LM4W2CT2G4k9qjJ1oInx0f74c9XzK0gdoPmKGrsHg3Tel
	 y6JW9vCrw9SYpFP3IWL3b8Oto+mIotDgoupmkj/C/QSuIpkRLxe2qpGekhrrWo2boO
	 Q2aA7aLxufPjGubAdUCcAZ1cBoIteFPfB8u5UKhCQpHwZgfET2oqzKB4+ejeZurqBr
	 ldqL2fCgUSpCQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Stefan Agner <stefan@agner.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org
Subject: [PATCH 12/13] ARM: at91: remove samv7 support
Date: Tue,  8 Sep 2026 17:28:02 +0200
Message-ID: <20260908152808.3928630-13-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908152808.3928630-1-arnd@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
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

The Atmel at91 line, now known as Microchip SAM contains both
SoCs using ARM926 and Cortex-A CPUs as well as a number of
microcontrollers. Only a single one of those MCUs currently
has Linux support, and has no known users.

The samv7 platform was deprecated in Linux-7.3LTS, which will
remain supported a while longer after it is gone from mainline.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig.debug      | 10 ----------
 arch/arm/mach-at91/Kconfig  | 11 +----------
 arch/arm/mach-at91/Makefile |  1 -
 arch/arm/mach-at91/samv7.c  | 17 -----------------
 drivers/soc/atmel/soc.c     | 36 ------------------------------------
 5 files changed, 1 insertion(+), 74 deletions(-)
 delete mode 100644 arch/arm/mach-at91/samv7.c

diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 3d5f2e41eef1..b27e581a53d4 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -190,15 +190,6 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on the USART3 port of sama5d4.
 
-	config DEBUG_AT91_SAMV7_USART1
-		bool "Kernel low-level debugging via SAMV7 USART1"
-		select DEBUG_AT91_UART
-		depends on SOC_SAMV7
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to the USART1 port on SAMV7 based
-		  machines.
-
 	config DEBUG_AT91_SAMA7G5_FLEXCOM3
 		bool "Kernel low-level debugging on SAMA7G5 FLEXCOM3"
 		select DEBUG_AT91_UART
@@ -1504,7 +1495,6 @@ config DEBUG_UART_PHYS
 	default 0x3e000000 if DEBUG_BCM_KONA_UART
 	default 0x3f201000 if DEBUG_BCM2836
 	default 0x40010000 if STM32MP1_DEBUG_UART
-	default 0x40028000 if DEBUG_AT91_SAMV7_USART1
 	default 0x40090000 if DEBUG_LPC32XX
 	default 0x40100000 if DEBUG_PXA_UART1
 	default 0x42000000 if DEBUG_GEMINI
diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index cb0e3ff8e0ca..3df1165d159b 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -5,7 +5,7 @@ config ARCH_MICROCHIP
 menuconfig ARCH_AT91
 	bool "AT91/Microchip SoCs"
 	depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
-		ARCH_MULTI_V7 || ARM_SINGLE_ARMV7M
+		ARCH_MULTI_V7
 	select ARM_CPU_SUSPEND if PM && ARCH_MULTI_V7
 	select COMMON_CLK_AT91
 	select GPIOLIB
@@ -14,15 +14,6 @@ menuconfig ARCH_AT91
 	select ARCH_MICROCHIP
 
 if ARCH_AT91
-config SOC_SAMV7
-	bool "SAM Cortex-M7 family (DEPRECATED)" if ARM_SINGLE_ARMV7M
-	select COMMON_CLK_AT91
-	select PINCTRL_AT91
-	help
-	  Select this if you are using an SoC from Microchip's SAME7, SAMS7 or SAMV7
-	  families.
-
-	  This platform is scheduled for removal in early 2027
 
 config SOC_SAMA5D2
 	bool "SAMA5D2 family"
diff --git a/arch/arm/mach-at91/Makefile b/arch/arm/mach-at91/Makefile
index 7d8a7bc44e65..8c964e182284 100644
--- a/arch/arm/mach-at91/Makefile
+++ b/arch/arm/mach-at91/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_SOC_SAM9X60)	+= sam9x60.o
 obj-$(CONFIG_SOC_SAM9X7)	+= sam9x7.o
 obj-$(CONFIG_SOC_SAMA5)		+= sama5.o sam_secure.o
 obj-$(CONFIG_SOC_SAMA7)		+= sama7.o
-obj-$(CONFIG_SOC_SAMV7)		+= samv7.o
 
 # Power Management
 obj-$(CONFIG_ATMEL_PM)		+= pm.o pm_suspend.o
diff --git a/arch/arm/mach-at91/samv7.c b/arch/arm/mach-at91/samv7.c
deleted file mode 100644
index 22d00005ec09..000000000000
--- a/arch/arm/mach-at91/samv7.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Setup code for SAMv7x
- *
- *  Copyright (C) 2013 Atmel,
- *                2016 Andras Szemzo <szemzo.andras@gmail.com>
- */
-#include <asm/mach/arch.h>
-
-static const char *const samv7_dt_board_compat[] __initconst = {
-	"atmel,samv7",
-	NULL
-};
-
-DT_MACHINE_START(samv7_dt, "Atmel SAMV7")
-	.dt_compat	= samv7_dt_board_compat,
-MACHINE_END
diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index d89f9dcade7d..e276f86326ec 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -210,41 +210,6 @@ static const struct at91_soc socs[] __initconst = {
 		 AT91_CIDR_VERSION_MASK, SAMA5D44_EXID_MATCH,
 		 "sama5d44", "sama5d4"),
 #endif
-#ifdef CONFIG_SOC_SAMV7
-	AT91_SOC(SAME70Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAME70Q21_EXID_MATCH,
-		 "same70q21", "same7"),
-	AT91_SOC(SAME70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAME70Q20_EXID_MATCH,
-		 "same70q20", "same7"),
-	AT91_SOC(SAME70Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAME70Q19_EXID_MATCH,
-		 "same70q19", "same7"),
-	AT91_SOC(SAMS70Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMS70Q21_EXID_MATCH,
-		 "sams70q21", "sams7"),
-	AT91_SOC(SAMS70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMS70Q20_EXID_MATCH,
-		 "sams70q20", "sams7"),
-	AT91_SOC(SAMS70Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMS70Q19_EXID_MATCH,
-		 "sams70q19", "sams7"),
-	AT91_SOC(SAMV71Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV71Q21_EXID_MATCH,
-		 "samv71q21", "samv7"),
-	AT91_SOC(SAMV71Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV71Q20_EXID_MATCH,
-		 "samv71q20", "samv7"),
-	AT91_SOC(SAMV71Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV71Q19_EXID_MATCH,
-		 "samv71q19", "samv7"),
-	AT91_SOC(SAMV70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV70Q20_EXID_MATCH,
-		 "samv70q20", "samv7"),
-	AT91_SOC(SAMV70Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV70Q19_EXID_MATCH,
-		 "samv70q19", "samv7"),
-#endif
 #ifdef CONFIG_SOC_SAMA7
 	AT91_SOC(SAMA7D65_CIDR_MATCH, AT91_CIDR_MASK_SAMA7G5,
 		 AT91_CIDR_VERSION_MASK_SAMA7G5, SAMA7D65_EXID_MATCH,
@@ -396,7 +361,6 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 	{ .compatible = "atmel,at91rm9200", },
 	{ .compatible = "atmel,at91sam9", },
 	{ .compatible = "atmel,sama5", },
-	{ .compatible = "atmel,samv7", },
 	{ .compatible = "microchip,sama7d65", },
 	{ .compatible = "microchip,sama7g5", },
 	{ }
-- 
2.53.0


