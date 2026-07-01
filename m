Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlayQOEl2KZTkzmBCwJs/YLxYkgF9FY4O+U8iZIcOt8=; b=PIfAa8pkCeGJ+OwefO3yQw+b+3
	tlOY+KNGrzMMMlFHGX1UJhkRsUBNM7LG+nz5BnCRCpcGvRd+z9+5Dxw3eJhAPAtNgudsNbO/Z2MC1
	wjD1+HE8Yj+7IzspInbnGdJoxbQABv4DRvTQWKAle73neag2+UgWsUXyVaaHtmIEo4cdeFl+qhQ8v
	l+RP33fmNi6XkhBk4/AmMXrSMfs3gsSCBtxbPocsDEUHzZRuXKWZk9K7X/HnlGs3NMfHleAwUnsdz
	xvSuKGDaC+7nGj2hZIgyMS6jpLN2LAQ3jlvSPqmpIQUNlsDTXC4BQo6lbabtus2fLXYFqnxZ0C8kL
	fzTKxdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2R3-000000032Ud-1AUb;
	Wed, 01 Jul 2026 21:25:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2R2-000000032U4-1E9B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E9D5418CC;
	Wed,  1 Jul 2026 21:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E2D1F000E9;
	Wed,  1 Jul 2026 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941131;
	bh=wlayQOEl2KZTkzmBCwJs/YLxYkgF9FY4O+U8iZIcOt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=grs2EkX0EEzX86/S44iVTmiUw/jk2hbNJMEGEJCJVKoaHyA+Iu0aR/4yv7eDkUg5a
	 nIVTHUgGUwgZGrjh5by8y2+zc7Cw3b6kDfiDeyh1GNtvW85cGAYEEYbyXIIsHzl3qK
	 /130aRuLFvtszDMkblUqumfJbzSQ9UU6+r8KRdN7sJpNQr7lF80PJtk3M9/qqsfLCj
	 FPKucqqkU3xftK3SgRunQtOjNkf/J4oTPBwvvI2UUV/KUPAt3fvKzybK0+EMJgHBcQ
	 Q3Af7Be2XVscl5KLq56Y6gULJjv9lcRMuAvjx1DMqG8gOXXZp8uVP2laIpXu5WijXp
	 nJ68BXcB1bX6w==
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
Subject: [PATCH v2 10/19] ARM: mark IWMMXT as deprecated
Date: Wed,  1 Jul 2026 23:23:44 +0200
Message-Id: <20260701212353.2196041-11-arnd@kernel.org>
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

With no remaining users and support getting removed from future compilers,
there seems little point in keeping iwmmxt around much longer.

On the other hand, the iwmmxt support in the kernel rarely gets in the
way, so there is little cost, so set a removal date of early 2027 for
the moment. If anyone is still using this, it can be extended as long
there is binutils support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 1f02183cff13..e2bdf2591c10 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -513,13 +513,21 @@ config PLAT_VERSATILE
 source "arch/arm/mm/Kconfig"
 
 config IWMMXT
-	bool "Enable iWMMXt support"
-	depends on CPU_XSCALE || CPU_XSC3 || CPU_MOHAWK
-	default y if PXA27x || PXA3xx || ARCH_MMP
+	bool "Enable iWMMXt support (DEPRECATED)"
+	depends on PXA27x || PXA3xx || ARCH_MMP
 	help
 	  Enable support for iWMMXt context switching at run time if
 	  running on a CPU that supports it.
 
+	  Machines that actually support this feature are very rare,
+	  and support is deprecated in new gcc-14.  While there were a
+	  few applications that used this in the past, none are known
+	  to still do so.
+
+	  If you use this, please send a patch to remove the
+	  deprecation, otherwise this will be removed in early
+	  2027.
+
 if !MMU
 source "arch/arm/Kconfig-nommu"
 endif
-- 
2.39.5


