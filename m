Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFF0E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/IGQWJxCJpdSKtjbB1MDdTz0Zfevj+IW4rRuBae94gU=; b=EPL9Gy2RoioXP3KuWUxlTziySV
	FuSHcUE7+Jstfaqba7TLEsVrypILdw06o8uDXBXzYuQpgvIdzGPQb7RG8Bd2D4YZJrVlgaAUF/jRk
	VDKZx+Ko7mMmFve/Qf+rU5ah+ooGjq1bbGBaEVvIjx4+FxEgdjReDsoAJLyoE1aMzB8cPZpLEKHW5
	Fgo5WkR9ZaVxbDfXdzSnUhvF14dzE7kCyH/1AuuUJw7kfOC1T7H76gf83b+kESFcQ2YnC0y13Dy1U
	o/Jvf5C/L/Z7DLq05UvmMVdNdEPUpI2gYwHSxMFhgCVxjUpk3EsT/7oplDAPspkE1eGN2JHO5g73j
	XftwlYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImiN-0000000CDhc-1RAL;
	Wed, 04 Dec 2024 10:34:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdi-0000000CCZo-0YIr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 42CC2A40F1A;
	Wed,  4 Dec 2024 10:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3203CC4CEE0;
	Wed,  4 Dec 2024 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308189;
	bh=S2FjuuAJSpqyjxAEkoVpg7C+YRRR25+pprm6Y8jiNRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDMW2LjYbGbaIV76L9vWIgeJ4wImXAyHMB0omokkcDyVb7soo3VZDUfNcAy1zhQpE
	 LcfKEM6mUjP+ewIHTfp7w9GW+q8fScb8OYRlZeITUGTLUNkx6oXjKVre1OQOEDd9Jw
	 lY//Z8c2ABcCAIKoV16iRM5pv6/+8ciD1OOzI1T0VuRVzfDvsTxEHeVlgJ9FjfoRXj
	 NdTxXMrzZSUngS1RTBwFHTV7FIMsZyp+LYm0/HYuudoDxbTcGe6Mcz5frUl93StdtC
	 RDsnfdz4iKPhXzRT0xx+6p+xWhlksbjTh8WhK9rWH/ECoS/6zHlau3oOf62FL8X2XW
	 yyl2mztRpH4QA==
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
Subject: [PATCH 04/15] ARM: deprecate support for ARM1136r0
Date: Wed,  4 Dec 2024 11:28:53 +0100
Message-Id: <20241204102904.1863796-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022950_296958_CD718E65 
X-CRM114-Status: GOOD (  16.03  )
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

This CPU revision remains a special case as it is now incompatible
with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
that one is fairly rare these days, so let's plan to remove all of
them after the 2025 LTS kernel release.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/Kconfig       |  5 ++++-
 arch/arm/mach-omap2/Kconfig     | 15 ++++++++++++---
 arch/arm/mach-versatile/Kconfig |  5 ++++-
 arch/arm/mm/Kconfig             |  2 ++
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index dce9cfc510b7..de9da57f0db4 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -39,12 +39,15 @@ if ARCH_MULTI_V6
 comment "ARM1136 platforms"
 
 config SOC_IMX31
-	bool "i.MX31 support"
+	bool "i.MX31 support (DEPRECATED)"
 	select CPU_ARM1136R0
 	select MXC_AVIC
 	help
 	  This enables support for Freescale i.MX31 processor
 
+	  This SoC is scheduled for removal in early 2026,
+	  since it uses the ARM1136r0 CPU revision.
+
 config SOC_IMX35
 	bool "i.MX35 support"
 	select CPU_ARM1136R1
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index c2b379850f59..3c4e55eb9d1d 100644
--- a/arch/arm/mach-omap2/Kconfig
+++ b/arch/arm/mach-omap2/Kconfig
@@ -207,18 +207,24 @@ comment "OMAP Core Type"
 	depends on ARCH_OMAP2
 
 config SOC_OMAP2420
-	bool "OMAP2420 support"
+	bool "OMAP2420 support (DEPRECATED)"
 	depends on ARCH_OMAP2
 	default y
 	select OMAP_DM_SYSTIMER
 	select OMAP_DM_TIMER
 	select SOC_HAS_OMAP2_SDRC
+	help
+	  This SoC is scheduled for removal in early 2026,
+	  since it uses the ARM1136r0 CPU revision.
 
 config SOC_OMAP2430
-	bool "OMAP2430 support"
+	bool "OMAP2430 support (DEPRECATED)"
 	depends on ARCH_OMAP2
 	default y
 	select SOC_HAS_OMAP2_SDRC
+	help
+	  This SoC is scheduled for removal in early 2026,
+	  since it uses the ARM1136r0 CPU revision.
 
 config SOC_OMAP3430
 	bool "OMAP3430 support"
@@ -249,11 +255,14 @@ config MACH_NOKIA_N810_WIMAX
 	bool
 
 config MACH_NOKIA_N8X0
-	bool "Nokia N800/N810"
+	bool "Nokia N800/N810 (DEPRECATED)"
 	depends on SOC_OMAP2420
 	default y
 	select MACH_NOKIA_N810
 	select MACH_NOKIA_N810_WIMAX
+	help
+	  This machine is scheduled for removal in early 2026,
+	  since it uses the ARM1136r0 CPU revision.
 
 endmenu
 
diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
index de42da7de8c8..ef7c02dd0d8e 100644
--- a/arch/arm/mach-versatile/Kconfig
+++ b/arch/arm/mach-versatile/Kconfig
@@ -110,11 +110,14 @@ config INTEGRATOR_CM1026EJS
 	select CPU_ARM1026
 
 config INTEGRATOR_CM1136JFS
-	bool "Integrator/CM1136JF-S core module"
+	bool "Integrator/CM1136JF-S core module (DEPRECATED)"
 	depends on ARCH_INTEGRATOR_AP
 	depends on ARCH_MULTI_V6
 	depends on !SMP
 	select CPU_ARM1136R0
+	help
+	  This machine is scheduled for removal in early 2026,
+	  since it uses the ARM1136r0 CPU revision.
 
 config ARCH_INTEGRATOR_CP
 	bool "Support Integrator/CP platform"
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index f5c1c6f82892..6c970c81d079 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -410,6 +410,8 @@ config CPU_ARM1136R0
 	help
 	  These early revisions of ARM1136 lack support for the
 	  ARMv6k extensions for multiprocessing.
+	  Support for this revision is scheduled for removal
+	  from the kernel in early 2026.
 
 config CPU_ARM1136R1
 	bool
-- 
2.39.5


