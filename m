Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E1DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99rTkGtMEhY28UmP5cIJYBXAGUjxeodjcs2HZAq97+I=; b=S8Z23mqM4sbyvrOQZRCNO3hPGM
	9Wg52WQ8zhB7nl8DGKQ4OaECfYKhJNdlc1ec3LG0Gc/K9uFxQUPmALjS7l/I30KcUPV09QMHOuEeq
	4nZ96A+NZhRZiw6G1hmq/hk0licFn9GCMjqLW2+OrS64rauv2uLzTCh2uu9PoSqSRcOVsn4iqT0Hh
	5Xr78FPxuAD5UGfXhR8LBJ571429nBnAUL6WYde4TqbpbR9yZtxQyMWK6PT/oRUoFfuULOJ0JfrJF
	BHoj+TtWNMGypLsRoU8zTbqxHcoCSTQwd1XV2n3H7hNcMMAjTTeP28MHXhEHpwDFVOzg3VAHnPA8v
	tYh/MN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RB-000000032ac-3D4l;
	Wed, 01 Jul 2026 21:25:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2R9-000000032Zf-3wGs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC03842E3D;
	Wed,  1 Jul 2026 21:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691811F00A3A;
	Wed,  1 Jul 2026 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941139;
	bh=99rTkGtMEhY28UmP5cIJYBXAGUjxeodjcs2HZAq97+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=drMX/zVMUi6s614tuhfwQRqRrQHr6+zq4Y5CybzpIA2njdUcZR+VYgbQICRIUsuVW
	 vtqQsl310YGSy/QMtESwwJkMisKBLCpbg/FSD5DHIVy8NA73wp7EqpgYCMK0/MSi55
	 7zSzytbdEkCy+FheLAH3R/jru4JEgnlpV9Fi56BjSLVoKxD5HxBd4PSZzOlvtacIaS
	 QF6VorAoIbPH2jD72LBHyFDyp6vtothOeXCYxk+1hPiPGvbrGfT8wd6pRvR0YtEvyS
	 QWtQ4qGgmJepkhuR8ecSWbPT3fYTFUNVwawVD70Uf0rYQl7FdHpPPftXks3ZD53T7Y
	 qIQGzxzdGrf8Q==
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
Subject: [PATCH v2 11/19] ARM: mark ARCH_DOVE as deprecated
Date: Wed,  1 Jul 2026 23:23:45 +0200
Message-Id: <20260701212353.2196041-12-arnd@kernel.org>
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

The Marvell Armada 510 (Dove) platform is supported both as devicetree
and atags/boardfile variants, with varying degrees of hardware support.

Russell was the last known user of the board file version, and there
are very few users overall. Unless Russell still needs this variant,
let's remove after the next LTS kernel, leaving the CONFIG_MACH_DOVE
variant with devicetree.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-dove/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
index 996888ffcfe7..f547120e223e 100644
--- a/arch/arm/mach-dove/Kconfig
+++ b/arch/arm/mach-dove/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig ARCH_DOVE
-	bool "Marvell Dove" if ARCH_MULTI_V7
+	bool "Marvell Dove (DEPRECATED)" if ARCH_MULTI_V7
 	depends on ATAGS
 	select CPU_PJ4
 	select GPIOLIB
@@ -11,7 +11,11 @@ menuconfig ARCH_DOVE
 	select PM_GENERIC_DOMAINS if PM
 	select PCI_QUIRKS if PCI
 	help
-	  Support for the Marvell Dove SoC 88AP510
+	  Support for the Marvell Dove SoC 88AP510 using board files.
+
+	  Support for this machine will be removed in early 2027, unless
+	  there is a strong reason to keep it. Users should migrate to
+	  the devicetree-enabled version (CONFIG_MACH_DOVE) instead.
 
 if ARCH_DOVE
 
-- 
2.39.5


