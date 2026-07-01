Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=claxqKdJjDBG4bp86+Kgv1KwKi6DWddvXbYHWowqs7M=; b=WDDsH4dCgGPy3CSgsYCy8LuPZG
	jL9w1Zkti2WN7izfvTt0zz0EkeFikMkXzIkas+TbDk1syxJUvb6fpOl/P7jkGX77kV9wc6knZUGwm
	ZxshixK+cxPMfTLkCXidRxIjxJsySS5aEwHDHkQgs5xZo6lB8hVBVrwAMHLgsDqURaUh9IQya6BBx
	K0+vkVQnN8rFyLS/L0KVUka+d1dYIJ+fSLtzPsDzcPIUxCxzK9w5mczGGJEXddNek4VBUDScWz9I5
	R7L5jWFMjjxHP3YIvCI7XfyyeyYns2c6azj34Y6G/MRr4MhOduDl7PG5xiRUzdqYFlJYY0L+Lox0x
	CDVMxTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Rn-000000032zR-1n6a;
	Wed, 01 Jul 2026 21:26:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Rm-000000032yG-1y95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:26:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B734400E1;
	Wed,  1 Jul 2026 21:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74B81F000E9;
	Wed,  1 Jul 2026 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941178;
	bh=claxqKdJjDBG4bp86+Kgv1KwKi6DWddvXbYHWowqs7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YxgA8TWC2w0t5bEKvxhTKBYvk7Q93vFUa2kdPOexxkZDugTuHJgugP5p6ZsMhC6FM
	 24o3Im+1r0Yth6zWiAgs+B8e4CKfrdO80T/2/lb4m590l/zB55VHHD0jVGsbH4K+zR
	 p8ZMPrE/Rw5/d5am40SxvfXIm6A/FCBicZuUGRr0QIs094BFHaMdZNoRPq9XIHR0j5
	 7FCCqyF6YM+7TrtIvz9+j2vGtL5MPnX0bRhtdpOxQICtrixOL3jeHXSA2l5gxzPv66
	 eHxwpZa6pw6N9T+7yAZCwCSF8e45nan7GNd33X63wLNFH1T5E+sD0WZ5VhicmkAFN+
	 vdA3j3ec7kFzQ==
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
Subject: [PATCH v2 16/19] ARM: mark footbridge as deprecated
Date: Wed,  1 Jul 2026 23:23:50 +0200
Message-Id: <20260701212353.2196041-17-arnd@kernel.org>
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

Along with RiscPC and SA1100, these are the last remaining Intel StrongARM
machines. The Corel NetWinder used to be particular popular in the late
1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
The other machine is the DEC (later Intel) EBSA285 evaluation board that
was made in small numbers in 1997 for software developers.

The footbridge/netwinder platform was the main target for the first Debian
2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
with the EABI based ports as ARMv4 hardware had fallen already out of
use by that time.

Link: http://netwinder.org/
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-footbridge/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-footbridge/Kconfig b/arch/arm/mach-footbridge/Kconfig
index 78189997caa1..96a74d447028 100644
--- a/arch/arm/mach-footbridge/Kconfig
+++ b/arch/arm/mach-footbridge/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_FOOTBRIDGE
-	bool "FootBridge Implementations"
+	bool "FootBridge Implementations (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_MOXART || ARCH_GEMINI || ARCH_SA1100)
 	depends on ATAGS
@@ -12,7 +12,10 @@ menuconfig ARCH_FOOTBRIDGE
 	select NEED_MACH_MEMORY_H
 	help
 	  Support for systems based on the DC21285 companion chip
-	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
+	  ("FootBridge"), used in the EBSA285 and the Rebel NetWinder.
+
+	  Support for these machines will go away in 2027,
+	  unless there are any remaining users that speak up.
 
 if ARCH_FOOTBRIDGE
 
-- 
2.39.5


