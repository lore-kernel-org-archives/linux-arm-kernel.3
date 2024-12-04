Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF17CE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5344TTmDDNAwCtFCGuaxeUzJq9CmaOyaKGkOTJDd8Y=; b=hKzajB6WkEkTEBTUEi40njkjet
	jIwX4sE0PbLla7c52pt/63MMoKirm7dhu2jMrIibIhmIrfZ9XcJL3ddf3BH8aCsGluAY87YQVN2hs
	N2tCVFdrqQZD1b0HW4IFWh6gDSoTTSmXIs8Nig8Dj4tqgI+a48/YlTasDXR8vJWE8OUDied2Mvw36
	avh4kfDSOC8dY7XZHKO+ZwSbawHk5YT536x2ydkNmkkik/vS/OODY9tyULo3g130vEo6ommWadksJ
	wSPGJmU78Nz4Z43aEx03XpCOThR0NTy9pNp0c351kZNr4LgKlMJ0sIyvvywifxJ7CN8F+ekEPAbNo
	pWWSmv/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImoI-0000000CFA4-1Ebw;
	Wed, 04 Dec 2024 10:40:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIme8-0000000CCfe-2GK0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A072AA40F05;
	Wed,  4 Dec 2024 10:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5A2C4CEE1;
	Wed,  4 Dec 2024 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308215;
	bh=xv+CbtFY6FV5HX6gbusMtIex1IYQRXtvcNJL6BglegI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u7yp1Q6KjWYvaNXJ07IKlmh280G5wsLKn6OymxGGCsLotzIeJWCHziEHu0WRc6mDP
	 JTktFm72evtDu80EM4IWwL5KvxNVcbd2PMN5u3MsHeDFj28siCI7ZQm3LVakQRuFOw
	 ToBnkFJ7cfpy2LJZs+T2ljZL9Z4n2hDlkk6Uyt3uMFPxkgTQXpFCmJLVLGi4k3pMCT
	 eZ+X8VgmfigvfvXUzK1X7igm33SR9F8+ecZicqG5yXDaUYLDfg9tfqwuUrehqEIQ88
	 lLVbgUk+K6lISv+rpL3Q9U9lNbWQyFf11LmUtLUTCj9JoKWuCX+/Oj0z9Ko7qPWoy2
	 GIH4PN4xyaM4A==
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
Subject: [PATCH 10/15] ARM: deprecate ARCH_DOVE
Date: Wed,  4 Dec 2024 11:28:59 +0100
Message-Id: <20241204102904.1863796-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023016_643164_308C98A0 
X-CRM114-Status: GOOD (  14.59  )
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

The Marvell Armada 510 (Dove) platform is supported both as devicetree
and atags/boardfile variants, with varying degrees of hardware support.

Russell was the last known user of the board file version, and there
are very few users overall. Unless Russell still needs this variant,
let's remove it soon, in order to simplify the DT conversion of the
remaining plat-orion machines (mv78xx0 and orion5x).

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-dove/Kconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
index 996888ffcfe7..01e79945ddcf 100644
--- a/arch/arm/mach-dove/Kconfig
+++ b/arch/arm/mach-dove/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 menuconfig ARCH_DOVE
-	bool "Marvell Dove" if ARCH_MULTI_V7
+	bool "Marvell Dove (DEPRECATED)" if ARCH_MULTI_V7
 	depends on ATAGS
 	select CPU_PJ4
 	select GPIOLIB
@@ -11,7 +11,11 @@ menuconfig ARCH_DOVE
 	select PM_GENERIC_DOMAINS if PM
 	select PCI_QUIRKS if PCI
 	help
-	  Support for the Marvell Dove SoC 88AP510
+	  Support for the Marvell Dove SoC 88AP510 using board files.
+
+	  Support for this machine will be removed in early 2025, unless
+	  there is a strong reason to keep it. Users should migrate to
+	  the devicetree-enabled version (CONFIG_MACH_DOVE) instead.
 
 if ARCH_DOVE
 
-- 
2.39.5


