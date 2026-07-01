Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A864C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neVVvwQwuyehYBW5/uf+qB8Aaz3ea9KXcSRRGKM52LY=; b=qbKfcfx3l+yolwZ4e5hkBCE4EV
	vrON7Kz459d5vvsYs/kCdDsBbruJm8SxUsYbPnn0JC43FJ0JZtZg4WBKLEC6474DXvsxbNggdMB0j
	YI3cOVBuaGIxttp2HupHZxDyya22fkVSJt+nU+/niSEN6LLWK27KXHKb1F+3D7zvUsiS4amWBMZw3
	HuPqVrBzUhtYE/V6IrI2L5Q1L/PNaD08M5kpNjLbQ97Gp0AX8n4cDJ2N8TzDh1PM5kEEYr+OuUaZQ
	3RS/mjfvGFR5l8XS+KWHNl2yjlA+Dk28v5X7BqiTmj52NZB/JAUYhD5KyTZpMfqOvg8Bm6OahVBxh
	KAJM3bEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2QY-0000000327o-2BO2;
	Wed, 01 Jul 2026 21:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2QX-0000000326l-1Lnc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 114BE4322A;
	Wed,  1 Jul 2026 21:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB70A1F000E9;
	Wed,  1 Jul 2026 21:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941100;
	bh=neVVvwQwuyehYBW5/uf+qB8Aaz3ea9KXcSRRGKM52LY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dW5/IuwaQddtvXG80KYrUmHKUP6uGqbWllc20qiZhcQSpyn0Y8YLsOOWOiZEE5QIQ
	 abMmAy1GaBEqf12EkB0x1DIDu8dHdBT4R4cA4eKPoZ1hxR/6W+tOw6+C9oPqv4jlST
	 Gdm6PEakdLofC5ofqkVAx6q4gj7S+bd0MPqoGRPKjBboa4ocrfH0ICRBCQDRz9zuoW
	 +c56K9NmjofBYOOr1HRrrC4SPaUQSQY2oA8YBc+YVeGOfDbkYJ0b1208q73YMHpI/N
	 kW+twL9QI5NigP8Q3Btg/eHNsJ0+3nJdUZfinEg1hDpeQvVpLHFadt5ccO/4NFK8Rh
	 juwK2RlWFs+OA==
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
Subject: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
Date: Wed,  1 Jul 2026 23:23:40 +0200
Message-Id: <20260701212353.2196041-7-arnd@kernel.org>
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

Following the deprecation of big-endian ARMv8 mode in arch/arm64 in commit
1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN"),
this does the same for ARMv7 (and v6), leaving the code around but
disabled by default: There are no known products that make use of this
mode any more, and it only hangs around for testing that it still works.

At the moment, there are no known bugs with big-endian ARMv7 mode, but
it does break occasionally and require someone to fix it.  By marking
the code as 'depends on BROKEN' now, it will no longer be covered by CI
testing. If any users remain, they can keep patching out the dependency
but are more likely to run into regressions.

The big-endian ARMv5 support (CONFIG_CPU_ENDIAN_BE32) in contrast is
still used on Intel IXP4xx platform, and is the only currently supported
mode there, so this one can still be enabled.

There is no timeline for actually removing the code at this point,
we will likely debate this if we ever remove IXP4xx support on arm,
or big-endian support on ARM64.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 27010b9389ad..048edb011511 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -778,7 +778,8 @@ config CPU_LITTLE_ENDIAN
 	  space builds.
 
 config CPU_BIG_ENDIAN
-	bool "Build big-endian kernel"
+	bool "Build big-endian kernel (DEPRECATED)"
+	depends on ARCH_MULTI_V5 || BROKEN
 	depends on !LD_IS_LLD
 	help
 	  Say Y if you plan on running a kernel in big-endian mode.
-- 
2.39.5


