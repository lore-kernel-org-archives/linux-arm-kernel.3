Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poxKs3wWC0uOWO62se4SxK9nVbQpyNDuaVwfA5HPjRA=; b=bDqIwbofhnvOp/cAZpMkdj+RkV
	fXK6KhQo6aVwG7IwPfePzij1OmaXXtcwcFbYE+5rsJ5ZcGDcGUKSdnes86tuoP0vEzodKFQf7sy5V
	aedEEdYBujuGDLvFiMqVTLRaA5u9YX1YPxLI02d3JPbo2mjCGwfnb3eYXJhCOFp25duB1bngyteQa
	v6sJuHXYGIE25ybJR0i6ttFJ1sseONASdW/1pf248Mg4J4uhGHZzNeX2u3aNXrbObLvoKbeEANAmJ
	hqFRq3vLi0eD0ocmwt34igqSNiRv8ATx/S6U6E0WaqQ9Kli6QREcyw6zSu3mfjPqwbXGS9RvP8ASS
	f2MZp7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RZ-000000032ou-0lh2;
	Wed, 01 Jul 2026 21:26:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2RX-000000032nz-0F5i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:26:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF9F438B3;
	Wed,  1 Jul 2026 21:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567D41F000E9;
	Wed,  1 Jul 2026 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941162;
	bh=poxKs3wWC0uOWO62se4SxK9nVbQpyNDuaVwfA5HPjRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RTWf1+Er1XsT+8u/oDE4fVu0HSH/ftWvccZWcG3SWgiPRpNB4QTRWL07hG/Tw1YNa
	 r1M6/cIDmBFxjt5FGphzrmZSX9Ymp9A+xvc4FOmcp3h7DDlZ9KC7ahOOYEXv6sOdFy
	 HRh624t2XxldsFa2AeRQNk+8XX3YNolyJbUenmWxTvUP8aPMoxuWdq9gNFX2b/qggx
	 7CA/owN6sKYcM3dYxV5B+pNpKbIWRLqgsJsIzhXflvAmJTwJpfSLHfn68ZyPlWnQV6
	 d0BPAAHn5lKsT6EFKMQP8ucOJjIvCxjG2z2elhgfp4774GVoSjmQRdP2LFMHTGPl9M
	 vqFRPehhlkzTg==
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
Subject: [PATCH v2 14/19] ARM: mark mach-sa1100 as deprecated
Date: Wed,  1 Jul 2026 23:23:48 +0200
Message-Id: <20260701212353.2196041-15-arnd@kernel.org>
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

Most of the old StrongARM1100 machines were removed two years ago as part
of a wider cleanup, the remaining four were left either because someone
showed interest in converting them to devicetree, or because they were
still supported by qemu and therefore useful to keep the platform alive.

None of the devicetree conversion actually happened, and qemu has
marked the platform as deprecated, so do the same in the kernel now.

If anyone is still running one of these four machines and planning
to keep updating their kernels, please speak up now so we can adapt
the plans as needed.

If nobody is found using StrongARM1100 any more, it can be removing
during 2027, leaving 6.12-LTS as the last longterm support kernel
for it.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-sa1100/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index e23700e0d6c8..d50721e39641 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_SA1100
-	bool "SA11x0 Implementations"
+	bool "SA11x0 Implementations (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_MOXART || ARCH_GEMINI)
 	depends on ATAGS
@@ -20,6 +20,9 @@ menuconfig ARCH_SA1100
 	help
 	  Support for StrongARM 11x0 based boards.
 
+	  Support for these machines will go away in 2027,
+	  unless there are any remaining users that speak up.
+
 if ARCH_SA1100
 
 config SA1100_ASSABET
-- 
2.39.5


