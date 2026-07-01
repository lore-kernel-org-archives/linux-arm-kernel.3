Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598B1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgpcsvqS4lKeX/TSFflfXG7PheS32/tusvELyLUCFYM=; b=nqNF+MX+Vi8/T6L+QrH66go4zp
	zqOMnbc6XVNIwGeBwcoq0WSzLR9It8AMMBCjK90/a6oK/JtsEkku5GKlElmFKdfVVPBvLerBn4oLZ
	Fk/9X4nAAjSQ2lWF8sqMxhQ5sqGI5maPw/dbYAyaQhm78VwRH2I9+258iidISJ23Ms1RuHyOBGMZy
	lOStuKUIewswN0GPXQN1YjXvdglKLB3BU571MBb1SvqnfHGsSRam78AcO7goqgsOAQ2oaI83XD5ys
	CH4NlyQk6LQox8nprXSF1mS6j3q0oop+ssnfgc8PjPm3Cuk1b+GPnCxbHxHfsl8Y12ydyi1FFNATK
	kWg3zJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Qg-000000032EK-3AWB;
	Wed, 01 Jul 2026 21:25:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2Qf-000000032Cq-2One
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:25:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0628B600FF;
	Wed,  1 Jul 2026 21:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B10B1F00A3A;
	Wed,  1 Jul 2026 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941108;
	bh=JgpcsvqS4lKeX/TSFflfXG7PheS32/tusvELyLUCFYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cpwi9iNCpgKvQospHZ4QAiD+mSx+0MUfpFPEFzSHIn7BwQ2ftaLoMJQBZs3y7ZUMP
	 KbG7feh269ey5CZ7I6rB2RrlEHP+jfogHSkmhMmGh3wzXI5ymfEtolO/EbVQP6ULZ8
	 E0edaao/ZWEhA86d+CCIsLyf1Xj5Qyn0N4hmEpfsIFUihpJaYfToMgYizEi6rwiXzZ
	 PUAOtRr44ecwCOMKQKmM8s31wIM8SCI/apFF1UGLqk0/zx5AQ0FSYFooc6dhyRx//H
	 pSW6lMSita/9DlBAPT65QQ5/Lf4yNDcmBVG/gleaHx2gSMnVZLnKVbPKGdVxTmiqi0
	 REZVXtXXZeGyg==
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
Subject: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
Date: Wed,  1 Jul 2026 23:23:41 +0200
Message-Id: <20260701212353.2196041-8-arnd@kernel.org>
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

This configuration option is for the older boot method that preceeded
ATAGS. This was scheduled for removal back in 2001, but the removal
never happened, presumably because nobody cared enough to actually do it,
not because there are any users left.

Add "(DEPRECATED)' to the Kconfig line and update the timeline so we can
remove it next year along with the other options that are not scheduled
for that timeframe.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0033d861e378..48937e70d55a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1401,11 +1401,11 @@ config ATAGS
 	  it is either converted to DT or removed.
 
 config DEPRECATED_PARAM_STRUCT
-	bool "Provide old way to pass kernel parameters"
+	bool "Provide old way to pass kernel parameters (DEPRECATED)"
 	depends on ATAGS
 	help
 	  This was deprecated in 2001 and announced to live on for 5 years.
-	  Some old boot loaders still use this way.
+	  It is now scheduled for removal in early 2027.
 
 # Compressed boot loader in ROM.  Yes, we really want to ask about
 # TEXT and BSS so we preserve their values in the config files.
-- 
2.39.5


