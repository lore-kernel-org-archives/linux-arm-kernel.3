Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6268FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLx/iEsRuv2uj6cpHmGsY4bubQffaS78ScCm1mMJrGQ=; b=TQYe54BbEr++7PBjR3wkyBO44y
	GROqnYJGH7FS27cGaecjggtnpmc88DAzK1sZLlJ9TWCIIYLmz8ifif7Qw5TEbxwb5mJnw+AvQjTfN
	nQ0aJ9EIyeHoueha724JwDBabx+W6YH+wj0Li+TsVEHF5Z5yeETQj6cCjbQGJK3SHud4WuRx33pou
	XEoPtD3AgZ19vkluDEXqkLk2MQ/j8Qh1EOgldrMsKs/rNb1fwanKXKXYZvndpbsapo1Efnx9WSugF
	Di3s3O7u1pmjq59ryNZAUJimIUEqkHB35Iaq/jRfXJWNI7rbTuUb6CcgVJ/mgrIchWjgJ6q9OCzFO
	FIEEyW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2QJ-000000031yn-0WTc;
	Wed, 01 Jul 2026 21:24:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2QI-000000031yC-2cah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:24:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD932600AA;
	Wed,  1 Jul 2026 21:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD861F000E9;
	Wed,  1 Jul 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941085;
	bh=vLx/iEsRuv2uj6cpHmGsY4bubQffaS78ScCm1mMJrGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fuaa7Rz1gbu989is+E1RaAOW8+RzHNQ5dEpFCPSCCOFAZd2dGsl1aby/TzX4zQmTz
	 4g+TZBXV2KWudX5XgzjttBoUkzmgZ9RyCOQy3Vws+1jrlmbX6HQgvYRnOPTEfcBH0Q
	 LW9bgW1EaJzBX3jvUk1VljCmzVCRQ95tqCrq8QIb7tVL3oHLBvjwNitJZqDmzbLQ9r
	 nutNkaGPr2kw84QAyKVZyA1eEWRH/kHgMkoJki2+ll35I7/4gakRfQ+0U9mWCDs1Cv
	 n23ZoNVlGp7zoaE1HhifWcW2r0wa2LmdOuN0ZMVlAflpyDNp5trTINp9c0sAsVRHVT
	 dqYz6hqlbpfBw==
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
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 04/19] ARM: deprecate support for ARM1136r0
Date: Wed,  1 Jul 2026 23:23:38 +0200
Message-Id: <20260701212353.2196041-5-arnd@kernel.org>
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

This CPU revision remains a special case as it is now incompatible
with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
that one is fairly rare these days, so let's plan to remove all of
them after the 2026 LTS kernel release.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-imx/Kconfig       |  5 ++++-
 arch/arm/mach-omap2/Kconfig     | 15 ++++++++++++---
 arch/arm/mach-versatile/Kconfig |  5 ++++-
 arch/arm/mm/Kconfig             |  2 ++
 4 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
index 041e73ad203a..f85a5f8c0a58 100644
--- a/arch/arm/mach-imx/Kconfig
+++ b/arch/arm/mach-imx/Kconfig
@@ -40,13 +40,16 @@ if ARCH_MULTI_V6
 comment "ARM1136 platforms"
 
 config SOC_IMX31
-	bool "i.MX31 support"
+	bool "i.MX31 support (DEPRECATED)"
 	depends on !SMP
 	select CPU_ARM1136R0
 	select MXC_AVIC
 	help
 	  This enables support for Freescale i.MX31 processor
 
+	  This SoC is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
+
 config SOC_IMX35
 	bool "i.MX35 support"
 	select CPU_ARM1136R1
diff --git a/arch/arm/mach-omap2/Kconfig b/arch/arm/mach-omap2/Kconfig
index 13987ffbba00..79f8afe3a6bf 100644
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
+	  This SoC is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 config SOC_OMAP2430
-	bool "OMAP2430 support"
+	bool "OMAP2430 support (DEPRECATED)"
 	depends on ARCH_OMAP2
 	default y
 	select SOC_HAS_OMAP2_SDRC
+	help
+	  This SoC is scheduled for removal in early 2027,
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
+	  This machine is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 endmenu
 
diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
index de42da7de8c8..1ee9b6608d71 100644
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
+	  This machine is scheduled for removal in early 2027,
+	  since it uses the ARM1136r0 CPU revision.
 
 config ARCH_INTEGRATOR_CP
 	bool "Support Integrator/CP platform"
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index f3d71e89a31f..27010b9389ad 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -410,6 +410,8 @@ config CPU_ARM1136R0
 	help
 	  These early revisions of ARM1136 lack support for the
 	  ARMv6k extensions for multiprocessing.
+	  Support for this revision is scheduled for removal
+	  from the kernel in early 2027.
 
 config CPU_ARM1136R1
 	bool
-- 
2.39.5


