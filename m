Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C020E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOPEeqfKJbk51U+HDngVnSDb/IzftFLM0yOrXKtzhgI=; b=sBnayqMMLra2IJYiCeBrkcQqoi
	x7bhRK4UHZtqFz8aS1UOuxO2WTHHuFolw3O0SNdmekqenG3IwNPScaJXz7Tr2sse0Zg5GBuK5RoW4
	Y4vxlpr0pS26tW2rDzFRcOS9Xuc0B2AIpeOrv6OUCQdsPjvxRtykqOUsSeE1c+/rJIwcjQXQDy3CH
	C5yxZUssiO+Vdd83X7PElQzY8hdrj4iYRzxaYQEIE7lmJXm6tsOfD9Ve85vEGW5K+G1yMph1U7UIa
	0IszMkMOOT0yQhCzaiMDUCW8ct4ghfHa85M6QMj/DskorScALNgcV0mQyzXe21/muqxi+WBjMosek
	2CIjh+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImnJ-0000000CEzj-2ehN;
	Wed, 04 Dec 2024 10:39:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIme4-0000000CCf7-0WiF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41BC0A40F09;
	Wed,  4 Dec 2024 10:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC64C4CEDD;
	Wed,  4 Dec 2024 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308211;
	bh=o9i3NEXM3yLAVapt19Pwv61KGYVGmrYSEnA6hPSma3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SSHuERQ6p80T31BEClJXEmzgpjbOckqnLeLun2JcXJU70vqNaC45bCedi4UdlTHUj
	 j82sWIqRY1MM/ffnuW+p01oSwbjwFPreC9cf9KNvk2+wMqkpFxNk0HuoaHglg3wAME
	 TcVt2f8hWdiShQwwusUpC8O+CosWmgp3sjGpCWHSxCnisho+ztx+gvHK9p/K+eMiU4
	 Dh7SL6G4B5mSIuzqsVmGozUuLiuqxz9da1r1XdlpqtLxgxFM4pUug5o07C1iIPGGn+
	 RBsaQsZUs9dZtC3v76XDLNOgLWfHZV08PcIAMzj1/hbQ9stenMWGocxZB92IS/kBPM
	 x5JPYUaXHNMEA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH 09/15] ARM: mark IWMMXT as deprecated
Date: Wed,  4 Dec 2024 11:28:58 +0100
Message-Id: <20241204102904.1863796-10-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023012_232370_02B1EF23 
X-CRM114-Status: GOOD (  17.18  )
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
way, so there is little cost, so set a removal date of early 2026 for
the moment. If anyone is still using this, it can be extended as long
there is binutils support.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index d92531c3f982..9e8f100ad514 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -509,13 +509,21 @@ config PLAT_VERSATILE
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
+	  2026.
+
 if !MMU
 source "arch/arm/Kconfig-nommu"
 endif
-- 
2.39.5


