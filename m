Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E41FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCSDE72yLPeEDTveWDb74YPcIUXppRyDd4Tf1rTkN7o=; b=s1orvPK8R5Lwivia9DXR402fIP
	f3+yrjazHhx7AGX5inBzHZtBK5WyI7Sl9FvXynPE28/aUrUR2T3oPzKGVZHtB2uyjwkvNQzMRYwJk
	/3rhXCySwIdzUCk6oYb+Ay0qzqw9WfRUuOLzWFoBcH40OcjuQPeTWo7M6EIPg8Ks0FlcduHyxBCMz
	v0qcdo/26xGxC3MRE6dYXY4c21ETHHcUgI4wsZrFpY+ShDIC/5IwONB++ab2m+wH7UkWO/na0nmAs
	DrQfUfQWu4038OcNzrCr4/jbv1tJOpWHmDXp0tH1p9NqpqNgZjDqr5ik1u1gttgSwNPMfVbARy32z
	4UKF579Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2SB-000000033GX-0HQ0;
	Wed, 01 Jul 2026 21:26:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2S9-000000033FU-1d8k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:26:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 28BF6414ED;
	Wed,  1 Jul 2026 21:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF91F1F000E9;
	Wed,  1 Jul 2026 21:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941201;
	bh=yCSDE72yLPeEDTveWDb74YPcIUXppRyDd4Tf1rTkN7o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X6vr5np3/3sRkzW1xoLd+eMNasUx0mupu4uXGWt/s5ij5+cpM7oavnL9k3KQ3k4mA
	 mOn8Yg59W01pG11OKaIOL2eqwbYnPi7cH+NvdJi5XcOcOiO5RX76DuWwR/sLPypDN0
	 b1DnZLMSdfPM5LkpfqyLWFoqpUo3HprhkO/pqzSw+c9G+mUskkJEfvsozZHUeHvBsI
	 xZZygZp/b7R5LgRDZOJ6HyHKxE0Hdl+RfjE4JfcUAyy10s2ieg0qPBDWv/6zbMOhn3
	 zrQBKRgkjv9bdf1n+Q9oy/399aka+hSgaGNXMUmKwCsFDKtuny1NJgeWQA0Fqubkt8
	 iCtZ5457Vov2A==
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
Subject: [PATCH v2 19/19] ARM: mark mv78xx0 support as deprecated
Date: Wed,  1 Jul 2026 23:23:53 +0200
Message-Id: <20260701212353.2196041-20-arnd@kernel.org>
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

Only one machine remains supported and was kept in 2022 for the
Debian_on_Buffalo project that was still using this, with plans to
convert it to devicetree.

The conversion never happened, and Debian_on_Buffalo does not provide
kernels later than linux-6.1, so it is unlikely to still be useful
for a DT conversion in the future.

Mark the platform for deprecation after the next LTS kernel, which
should give any remaining users a few more years of bugfixes.

Link: https://lore.kernel.org/all/20221019150410.3851944-6-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-mv78xx0/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
index 670e6587827e..98b35f5d05ba 100644
--- a/arch/arm/mach-mv78xx0/Kconfig
+++ b/arch/arm/mach-mv78xx0/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_MV78XX0
-	bool "Marvell MV78xx0"
+	bool "Marvell MV78xx0 (DEPRECATED)"
 	depends on ARCH_MULTI_V5
 	depends on CPU_LITTLE_ENDIAN
 	depends on ATAGS
@@ -14,6 +14,8 @@ menuconfig ARCH_MV78XX0
 	  Support for the following Marvell MV78xx0 series SoCs:
 	  MV781x0, MV782x0.
 
+	  This platform is scheduled for removal in early 2027.
+
 if ARCH_MV78XX0
 
 config MACH_TERASTATION_WXL
-- 
2.39.5


