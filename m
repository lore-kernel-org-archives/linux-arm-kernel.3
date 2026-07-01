Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8B8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhWl/U8KLapLF8jZpCzb0eK4W+iXSV9Vy9h9O8ccSmU=; b=rckJ9POmxMCbW43ApAvUKV35UA
	dNjZn0C4Wh7RqfeLEPhygk4heg4YdsypziUPccxe70biTVjtJ1ze5OnCYYdqYeKMLQO7oX5inxRem
	10JmRTrUXVebBUz4ZgzccK51gJz4YpgDEAVtu48dCOmCp+ga8v9T/8T3w/BX4FzEbNNkWT1iLJf29
	w/B2Bp066Lsre35y5mDKsQGdACPTcok4p5KtiykXSfE4eYs/qh1Ycu6HeGL+xz6tW0RVLmyYrVv8D
	Wn4B2RuDcaylu8U6dLvTVyKbAfu3baoe2Irlc7EAdJSjqXx6fis/oXdbbPoEUg2MXOAK0QHxX1FUI
	wFHuyvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Qw-000000032QD-0Xwz;
	Wed, 01 Jul 2026 21:25:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Qv-000000032Ox-0fXs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9916660103;
	Wed,  1 Jul 2026 21:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07CBB1F00A3D;
	Wed,  1 Jul 2026 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941124;
	bh=dhWl/U8KLapLF8jZpCzb0eK4W+iXSV9Vy9h9O8ccSmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aNimZ8F/YuIc2DVF01SN6cTaO/JeHNh4IT13ON1ElNZ3EBC1sAEZRQ4/fwf7tIndi
	 8MPADAtxyF7Z62PezwydnUnGoWVRE+4CTxNrLP8LpN7iB5EF+rtNfD4kjlGh1vMkBv
	 JKk1dM4DOYd5T5VyazWaRFvaXoB1euiR6UMKWGnnnkZ1a/9V2CdvogcXO1UgFv8LKe
	 xAOjLhzxxk6V4VUBMXAuWGWCzw5byj62N1cSA2NYQXa8c0s7eewb3q8lY46VNJ0G7o
	 NxuQVCLyhfpqc0BEjLyyZbXWwRrBxtcRBxH1nZ6zWXNH3uIU9jUYtjQdkM2c/QXYqQ
	 lKPfgdj7x7YrQ==
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
Subject: [PATCH v2 09/19] ARM: update FPE_NWFPE help text
Date: Wed,  1 Jul 2026 23:23:43 +0200
Message-Id: <20260701212353.2196041-10-arnd@kernel.org>
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

The help text is seriously outdated and predates the introduction of
VFP floating point units that were available as early as some ARM926
based systems.

Change the help text to reflect that this is now a legacy feature
and that it will go away along with OABI support in the future.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 48937e70d55a..1f02183cff13 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1651,16 +1651,16 @@ menu "Floating point emulation"
 comment "At least one emulation must be selected"
 
 config FPE_NWFPE
-	bool "NWFPE math emulation"
+	bool "NWFPE math emulation (DEPRECATED)"
 	depends on (!AEABI || OABI_COMPAT) && !THUMB2_KERNEL
 	help
 	  Say Y to include the NWFPE floating point emulator in the kernel.
-	  This is necessary to run most binaries. Linux does not currently
-	  support floating point hardware so you need to say Y here even if
-	  your machine has an FPA or floating point co-processor podule.
 
-	  You may say N here if you are going to load the Acorn FPEmulator
-	  early in the bootup.
+	  This is only used on OABI userspace binaries, either using a
+	  pure OABI (!CONFIG_AEABI) kernel, or the OABI emulation.
+
+	  Support for NWFPE will be removed in the future when OABI
+	  support is removed.
 
 config FPE_NWFPE_XP
 	bool "Support extended precision"
-- 
2.39.5


