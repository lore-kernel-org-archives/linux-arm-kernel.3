Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BFFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0AW54px2NeVNkCtE6J7vNcVIckqBSV/cfv9pyETQPw=; b=SJ6o/EBbms7u/RgoZuTFgRczdn
	/tu+7qoPXkyg5tcWlAQf9GypMEAMWNepUZn076CjaNh7GhyJApl0BLN/Pcs1W8P90nTo4XtKAqaBV
	Pzsxu4OQvgVqMMl3kzVvP5eA7363rXFcFlC+y52mQBpHR4dtMtjzYKILnvm+mDF8B1BzZzROsDleO
	GTL05AU/T/qUD0Ug8CBI9vM+WN0haC8AmbbTVyD+OJhvbTVJzgxNJH9Uik/Qk/ORUifF/Gk5QvCU4
	MT2nIAp19JfJhxkIrYfno7dAWEnV23YzimcadIe9sVOt5I2yyvP/evlPGydv8J028qGluz+OCcV9K
	LuZeYy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Qp-000000032KY-05It;
	Wed, 01 Jul 2026 21:25:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Qm-000000032Ik-3lSb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A298F42B44;
	Wed,  1 Jul 2026 21:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391A11F000E9;
	Wed,  1 Jul 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941116;
	bh=V0AW54px2NeVNkCtE6J7vNcVIckqBSV/cfv9pyETQPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iF9QKYavkLZOF/lVBwhFnj51LRYXz2YXLO4dfYrJVkYQDPoTWRSAu3mKVD5ocp7M8
	 Jygbvz1qSDUgaT580hKbH+uTf0c0AWXzzG0DglyJghI5orb+oqmv5CMUIc8fUEotrM
	 ol6EqkdNSenUDH0GhAFKaoO9IlzH3MJa/AGalaSr4kzvASQrRFbDka1Bfdp78egkYO
	 3d8BNYFkUCbVZNKDH5wBpJNXlMVex5gfgXJuvr9lKdCUewkub2PqHZMM3nrKfJ5YfC
	 qlfNW1DsfcYdZHxPNsLTE1q6tE5EBBuV7tqPn8bDOpp8xwFfF27sGLfxxYv0PUstMa
	 AP7KJEd6dPO6g==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/19] ARM: s3c64xx: extend deprecation schedule
Date: Wed,  1 Jul 2026 23:23:42 +0200
Message-Id: <20260701212353.2196041-9-arnd@kernel.org>
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

Mark Brown is still using this machine for regular work, so it should
not be removed as originally scheduled.

Give the platform another year, with the option to extend it further
based on the state of ATAGS support next year.

I expect that we end up removing all of s3c64xx when either Mark has
moved his test setup to other hardware, or when all other ATAGS based
machines are getting removed.

Cc: Mark Brown <broonie@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/Kconfig.s3c64xx | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 3f97fba8e4f5..52cfd9fb2a43 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -23,10 +23,17 @@ menuconfig ARCH_S3C64XX
 	help
 	  Samsung S3C64XX series based systems
 
-	  The platform is deprecated and scheduled for removal. Please reach to
-	  the maintainers of the platform and linux-samsung-soc@vger.kernel.org if
-	  you still use it.
-	  Without such feedback, the platform will be removed after 2024.
+	  The use of ATAGS based board files is on its way out, and
+	  the only remaining S3C64xx machine in the kernel (Wolfson
+	  Cragganmore 6410) relies on this, without any realistic way
+	  to migrate it to devicetree.
+
+	  Support for S3C64XX will be kept until the 2027 LTS kernel
+	  release and may be removed in early 2028.
+
+	  Please reach out to the maintainers of the platform and
+	  linux-samsung-soc@vger.kernel.org if you use any additional
+	  s3c64xx machines based on devicetree.
 
 if ARCH_S3C64XX
 
-- 
2.39.5


