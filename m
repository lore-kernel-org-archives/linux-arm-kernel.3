Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83880E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URdjEnqpJlIzxPbUCU8gJ0jbcPSO+6Ktvu7Ig3HiMe4=; b=xtkqwpLSb+9ekC1NxkUQeN9l1t
	KHf7TR0NhrKD7/3M31IPsd4HswK4bpZe3+s9WjutVBfhKnt5oOyLrqZRtLh6AdyECJbSvI8JojntN
	/6elgG6yaXjUcNCRu+APEycVNaJPgayvjNy6Tr22uyyeyd+Yn57o8+7bDvV2OdwzKs5Pt5XSOboMy
	4U1JiTh37uMeZ4gqsIoADk4oPwgBnsOb1BmoAUcLBRE9Yg/Ev9N3t/9tg17vY2M4MMLgzslfQNHRy
	lKlecpMElMiq33L6wR+0r+n+Rb3jHyrmF+iwEQWVc9isSsz5VPwuWZcrV3KylAbWxbAjFl385jb8I
	fGjddRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImhO-0000000CDVb-368L;
	Wed, 04 Dec 2024 10:33:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdd-0000000CCZC-3oFS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:29:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DAB23A40F09;
	Wed,  4 Dec 2024 10:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A4DC4CEE3;
	Wed,  4 Dec 2024 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308184;
	bh=Z8C/SJOGPrii+3rirnKZTIg2TyBH2bjsxXwXRI4COuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BGbXtS48eNdntOOP+Oqh51yWnND0HA0Qm8GlavCAlPA3vEyNpm2hGem6+mu7CeahV
	 +WZmQV2Odn3ubdIK0izoLtcc8fH/96cudDOiE7fMN4kvXLodI2tJmkeYluL2aJSiWG
	 It0BdG0rCUmVD1UnQALK/TSJ3qr6mJd9f5g5hzjDcMGNbqq04x90i0GFmsCKihH1LU
	 vHcDy4bamjf/LgnkB4FgCcqQnnkDM2flqLOGxHuq6EctQYhemMa2IiKZztfJfHbq75
	 5xRsEc+Cj/yJeZpQGEvPHxPcN28SdFDDOdZvzmjBlwy+a8CtZ3Rrfm0EAmxJzJOB6+
	 nZmIA/yxGcy9Q==
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
Subject: [PATCH 03/15] ARM: rework ARM11 CPU selection logic
Date: Wed,  4 Dec 2024 11:28:52 +0100
Message-Id: <20241204102904.1863796-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022946_075210_5039DCA7 
X-CRM114-Status: GOOD (  24.74  )
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

Support for SMP on ARM1136r0 has been broken for a while, and nobody
is working on fixing it. I had a plan to change ARMv6 support to no
longer coexist in a common kernel with ARMv7 CPUs but instead ARMv5 and
below. This would have addressed the problem, but after a recent mailing
list discussion, we concluded that an easier approach is to just forbid
ARM1136r0 CPU support on SMP-enabled kernels.

This mainly affects users of the Nokia N800/N810 tablets using an
OMAP2420 SoC, which is the only commercial product with an ARM1136r0
that is still supported by the kernel.

The other machines that are still in the same hardware catogory are:

 - TI OMAP2420 H4 reference board
 - TI OMAP2430 SDP software development platform
 - Freescale/NXP i.MX31 Lite Development Kit
 - Buglabs i.MX31 Bug 1.x prototype
 - Arm Integrator/AP with CM1136JF-S core module

To my knowledge, none of these have any actual users aside from
reference boards being used more easily test the platforms.

There are also a few ARM1136r1 machines, which implement the
ARMv6K SMP support (barriers, atomics and TLS):

 - Eukrea CPUIMX35 reference platform
 - Freescale/NXP i.MX35 Product Development Kit
 - ARM Integrator/CP/IM-LT3 with ARM1136J Core Tile
 - ARM Realview/EB with ARM1136J Core Tile

Again, these are mainly reference implementations rather than
actual products, but since they support ARMv6K, they should
continue to work correctly in SMP-enabled kernels. For the
ARM Core Tile, I have not found a datasheet but instead use
the revision based on what the respective virtual models
report.

All the other ARMv6 platforms use an ARM1176 with ARMv6K,
VMSAv7 and Trustzone support.

To avoid the broken configuration, annotate the ARM1136 based
machines with specific CPU_ARM1136R0 or CPU_ARM1136R2 symbols
in Kconfig and make the r0 variants depend on !SMP.

Link: https://lore.kernel.org/linux-arm-kernel/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/T/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig.platforms      |  2 +-
 arch/arm/mach-imx/Kconfig       |  3 ++-
 arch/arm/mach-omap2/Kconfig     |  2 +-
 arch/arm/mach-versatile/Kconfig | 10 +++++-----
 arch/arm/mm/Kconfig             | 24 +++++++++++++++++++++++-
 5 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/arch/arm/Kconfig.platforms b/arch/arm/Kconfig.platforms
index 845ab08e20a4..e56d47eadfdf 100644
--- a/arch/arm/Kconfig.platforms
+++ b/arch/arm/Kconfig.platforms
@@ -37,7 +37,7 @@ config ARCH_MULTI_V4_V5
 config ARCH_MULTI_V6
 	bool "ARMv6 based platforms (ARM11)"
 	select ARCH_MULTI_V6_V7
-	select CPU_V6K
+	select CPU_1176
 
 config ARCH_MULTI_V7
 	bool "ARMv7 based platforms (Cortex-A, PJ4, Scorpion, Krait)"
diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index e4fe059cd861..dce9cfc510b7 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -40,13 +40,14 @@ comment "ARM1136 platforms"
 
 config SOC_IMX31
 	bool "i.MX31 support"
-	select CPU_V6
+	select CPU_ARM1136R0
 	select MXC_AVIC
 	help
 	  This enables support for Freescale i.MX31 processor
 
 config SOC_IMX35
 	bool "i.MX35 support"
+	select CPU_ARM1136R1
 	select MXC_AVIC
 	help
 	  This enables support for Freescale i.MX35 processor
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 821727eefd5a..c2b379850f59 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -9,7 +9,7 @@ config ARCH_OMAP2
 	bool "TI OMAP2"
 	depends on ARCH_MULTI_V6
 	select ARCH_OMAP2PLUS
-	select CPU_V6
+	select CPU_ARM1136R0
 	select OMAP_HWMOD
 	select SOC_HAS_OMAP2_SDRC
 
diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
index 513618078440..de42da7de8c8 100644
--- a/arch/arm/mach-versatile/Kconfig
+++ b/arch/arm/mach-versatile/Kconfig
@@ -113,7 +113,8 @@ config INTEGRATOR_CM1136JFS
 	bool "Integrator/CM1136JF-S core module"
 	depends on ARCH_INTEGRATOR_AP
 	depends on ARCH_MULTI_V6
-	select CPU_V6
+	depends on !SMP
+	select CPU_ARM1136R0
 
 config ARCH_INTEGRATOR_CP
 	bool "Support Integrator/CP platform"
@@ -135,7 +136,7 @@ config INTEGRATOR_CTB36
 	bool "Integrator/CTB36 (ARM1136JF-S) core tile"
 	depends on ARCH_INTEGRATOR_CP
 	depends on ARCH_MULTI_V6
-	select CPU_V6
+	select CPU_ARM1136R1
 
 config ARCH_CINTEGRATOR
 	depends on ARCH_INTEGRATOR_CP
@@ -182,7 +183,7 @@ config MACH_REALVIEW_EB
 config REALVIEW_EB_ARM1136
 	bool "Support ARM1136J(F)-S Tile"
 	depends on MACH_REALVIEW_EB && ARCH_MULTI_V6
-	select CPU_V6
+	select CPU_ARM1136R1
 	help
 	  Enable support for the ARM1136 tile fitted to the
 	  Realview(R) Emulation Baseboard platform.
@@ -201,11 +202,10 @@ config REALVIEW_EB_A9MP
 	  Enable support for the Cortex-A9MPCore tile fitted to the
 	  Realview(R) Emulation Baseboard platform.
 
-# ARMv6 CPU without K extensions, but does have the new exclusive ops
 config MACH_REALVIEW_PB1176
 	bool "Support RealView(R) Platform Baseboard for ARM1176JZF-S"
 	depends on ARCH_MULTI_V6
-	select CPU_V6
+	select CPU_ARM1176
 	select HAVE_TCM
 	help
 	  Include support for the ARM(R) RealView(R) Platform Baseboard for
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 2b6f50dd5478..f5c1c6f82892 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -376,6 +376,7 @@ config CPU_PJ4B
 # ARMv6
 config CPU_V6
 	bool
+	depends on !SMP
 	select CPU_32v6
 	select CPU_ABRT_EV6
 	select CPU_CACHE_V6
@@ -386,7 +387,6 @@ config CPU_V6
 	select CPU_PABRT_V6
 	select CPU_THUMB_CAPABLE
 	select CPU_TLB_V6 if MMU
-	select SMP_ON_UP if SMP
 
 # ARMv6k
 config CPU_V6K
@@ -403,6 +403,28 @@ config CPU_V6K
 	select CPU_THUMB_CAPABLE
 	select CPU_TLB_V6 if MMU
 
+config CPU_ARM1136R0
+	bool
+	select CPU_V6
+	depends on !SMP
+	help
+	  These early revisions of ARM1136 lack support for the
+	  ARMv6k extensions for multiprocessing.
+
+config CPU_ARM1136R1
+	bool
+	select CPU_V6K
+	help
+	  Later revisions of ARM1136 add ARMv6k (atomics, barriers
+	  and TLS register) in addition to the features from r0.
+
+config CPU_ARM1176
+	bool
+	select CPU_V6K
+	help
+	  ARM1176 implements ARMv6k, VMSAv7 and Trustzone in
+	  addition to the ARMv6 baseline.
+
 # ARMv7 and ARMv8 architectures
 config CPU_V7
 	bool
-- 
2.39.5


