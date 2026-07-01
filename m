Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC060C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTJ0R7e1Q47azBR5F9YcK+atCEC47tjq96vRaQRcYFU=; b=3vRVmfvggejxKsFMOaw+z4Bzyb
	t75tENWSYkq0jkyPhUZBhWmasXbRsGU2ChJiiBz6xRLGOOVgN6WnBGnm3s3LEAD2cKgmwoZoVWF+Q
	KTpesIakBS7/idOPc1ORbysnUrYcnZHux2FqzBKVObqBFruqyQR8BIgyxCNKIT4C4cnnqlL9TeEwo
	MdMMRLlMPadfUK8MznAnioUdfSKYCGniikH0C+ZLx7ZkhsTyaxvoAhElKefKxxP8n3NOvdUQoWgOc
	DikeiXdg9DeYXk5A4OA7pPIt6x0SszfFt4RugKBoJN2qELkQ4SPpVnL3w6M1tioACVLA2YdWchk6+
	sEad1zPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Rh-000000032uD-1Bun;
	Wed, 01 Jul 2026 21:26:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Rf-000000032sf-0cXx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:26:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 955C5600B0;
	Wed,  1 Jul 2026 21:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325E91F00A3A;
	Wed,  1 Jul 2026 21:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941170;
	bh=WTJ0R7e1Q47azBR5F9YcK+atCEC47tjq96vRaQRcYFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iSDiCCJ+HfLjkGZv7RW0R2fE7e9auJCiPwCohbdaPdK+sTsqWsR9DD4QYFHkCh3fj
	 oxjPGgmwO9g1sBnn0VsiD7bz336KkC0Z4SXcWAjOjKarEFs1dTVtyJ6NRR5V58kb3s
	 /rrtNdsegXMuHNDkAiNDuo8rx58XbtzJ4MNTBbrEEpJ4Tg1UzmEys8J3og2IUkdhsz
	 3MzUQw+aOYwufXnZNsHQEgseSjZkOVMAGQAJVcgn8HT4h4Hw2phw9f8cf59JhmQNEL
	 CQ4zJk81jklJ6/P+gMdgSGfcKJY3s8Rp+I5qknEbpepsGyX5nqQ70dvF85T11nyBII
	 7uHk72SWFeF6w==
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
Subject: [PATCH v2 15/19] ARM: mark RiscPC as deprecated
Date: Wed,  1 Jul 2026 23:23:49 +0200
Message-Id: <20260701212353.2196041-16-arnd@kernel.org>
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

This platform is the oldest still supported machine, dating back
to the original 1994 ARM610 version.  The only currently supported
configuration uses an ARMv4 StrongARM but still requires building
for ARMv3 because of the board design not supporting 16-bit
data access.

ARMv3 support has been removed in gcc-9, and the gcc-8 release
is already old but still supported for building the kernel.

The only set of machines that lacks support for 16-bit load/store
instructions (Alpha EV5 and older) was recently removed from
the kernel.

Since there is little hope of this being maintainable much
longer, plan to remove it in early 2027 while it is still expected
to mostly work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-rpc/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-rpc/Kconfig b/arch/arm/mach-rpc/Kconfig
index 55f6d829b677..60b3823b690c 100644
--- a/arch/arm/mach-rpc/Kconfig
+++ b/arch/arm/mach-rpc/Kconfig
@@ -1,5 +1,5 @@
 config ARCH_RPC
-	bool "RiscPC"
+	bool "RiscPC (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_FOOTBRIDGE || ARCH_SA1100 || ARCH_MOXART || ARCH_GEMINI)
 	depends on !CC_IS_CLANG && GCC_VERSION < 90100 && GCC_VERSION >= 60000
@@ -19,3 +19,6 @@ config ARCH_RPC
 	help
 	  On the Acorn Risc-PC, Linux can support the internal IDE disk and
 	  CD-ROM interface, serial and parallel port, and the floppy drive.
+
+	  Support for these machines will go away in 2027,
+	  unless there are any remaining users that speak up.
-- 
2.39.5


