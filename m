Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E342C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 21:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOOlnTfLdeQJz5KZc0pbvMZ9NKjblGZAbxQxn1igGQk=; b=xiamIXmGPaiowBy2VDIV71rXkW
	EQL4naMzBp4sAQA2U8m1TMIEzeZnYCVD61KHj9gDnEjtXaNhFTWGuc3MlJkMXnMJbEIJCPuuy0GDp
	GhrfXp5baRoLExNn674oTf++l4ltFyv6lct+JkqCD0nG5A9dY4QAkbSVw6FxQrWIxhhUakjR5oLMW
	LVsDnx0Tso+NNGtQHYwJhoSJ4lAW9Igc61Yb0zqFTRn0cH5Q3t2xrXLFkx2pOj/Kqqbmcq/ny6MlW
	1r7QWQhcpFJi4eU4NzkyI+vB9GRkmSzjUbFno4pPPJRXeYYAc8Qut9I6feoN+2YMZRH/k0fdT4QOL
	vLxOLliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2S2-000000033B3-3tpu;
	Wed, 01 Jul 2026 21:26:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf2S1-000000033AP-3Dr9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 21:26:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8137942A36;
	Wed,  1 Jul 2026 21:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405661F00A3D;
	Wed,  1 Jul 2026 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941193;
	bh=OOOlnTfLdeQJz5KZc0pbvMZ9NKjblGZAbxQxn1igGQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h/my/gat2xn2CRrztx6PRB9yjkMYCfyxNjTyBjRywG7bYRe/eAv0ahiLxFo+QtexN
	 2ToOm/W3a1EEeYV0faDPG0IF2kw/x5skroJDF94g4j7C/L+ANULKfr7/hn5Jl8u323
	 LtDHlhJvkDUB7krcMu4KTur12NHllyDR6L69BW3+1kqHI9B4QDZy/zTqaZcgtgPFLC
	 J8g57gm1+/SEkdgHZRegzrCxdCCdUkWb7aRjexnfPtEHnUYW0hTO4VD8Czg9jbti+8
	 dY4TQUzCEWaGtA6xzzOW06qEoLGkBbnJbC/8T/3ZCEFsDNdyoP1ywbji7oTY4soUCQ
	 +rek29d+FeB9g==
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
Subject: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
Date: Wed,  1 Jul 2026 23:23:52 +0200
Message-Id: <20260701212353.2196041-19-arnd@kernel.org>
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

The Axxia platform was initially upstream by Anders Berg for LSI and
later Avago, but this included only support for I2C and reset drivers,
while most of the interesting bits (network, pci, rapidio, usb, ...) or
the arm64 platform support were never merged.

The downstream kernel was maintained by Intel up to linux-5.15 when
the product line was discontinued. Known users include Nokia and
Ericsson, but both of them use kernels derived from the out-of-tree
drivers rather than the upstream version, and will be able to continue
doing that even when the rudimentary mainline support is gone.

Mark it as deprecated for removal after the next LTS kernel.

Link: https://github.com/axxia/linux-yocto
Cc: Stefan Wiehler <stefan.wiehler@nokia.com>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-axxia/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-axxia/Kconfig b/arch/arm/mach-axxia/Kconfig
index d3eae6037913..f773a66c1402 100644
--- a/arch/arm/mach-axxia/Kconfig
+++ b/arch/arm/mach-axxia/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config ARCH_AXXIA
-	bool "LSI Axxia platforms"
+	bool "LSI Axxia platforms (DEPRECATED)"
 	depends on ARCH_MULTI_V7 && ARM_LPAE
 	select ARM_AMBA
 	select ARM_GIC
@@ -13,3 +13,5 @@ config ARCH_AXXIA
 
 	  The LSI Axxia platforms require a Flattened Device Tree to be passed
 	  to the kernel.
+
+	  This platform is scheduled for removal in early 2027
-- 
2.39.5


