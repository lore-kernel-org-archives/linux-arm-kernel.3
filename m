Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A35E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuaJIv+0II3ukv04QL9TZXm2fRcM5xSP/QCe0zQWmpI=; b=vCywc8xdtT7QKiDBEbxFlrBEyl
	7NYbXEAYtIh0bJtjKkChB/NtEB4BitYI7Klhzms57iWiMvO3qUtDDh3CZoptEyCPja7m0EqtAZHUi
	5XKTAWM0BuHVmJXaXn1APw3psYUSQ+MXqnJr2eMjbkLyG1hgadNpoI+M0iBNxViTwDX6sKdrUX7HN
	Rxme84N931Kmff0EQnKQpl8jKtAS6yws3jme6+tata3wFIfQnBPdnfuep8kVIyuEtEDyPQbR/32U2
	2F+NmbWkxkGmUbJowyfx932lCaPILT8kAQ0SYFdtfx5Zfn+wuxHl/qdVvUlfADJyOGEzoQy3DdC0b
	3MoT155Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImtA-0000000CG0G-1lcD;
	Wed, 04 Dec 2024 10:45:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImeU-0000000CClT-23Rx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E738A40D77;
	Wed,  4 Dec 2024 10:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E67C4CEE1;
	Wed,  4 Dec 2024 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308237;
	bh=KA2Hh3KSr/1FPqAch6lEtAdXOaOdnfbOu1UPhcIPy5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tXJA2ALQObCLnxkCpRx8Fb6Q8zGpOUiiKuryw7TWqFW+6kpJeFhWFvUhepN0WpjjN
	 ZXHO+X4qPpjzRAQvGdm1Pm6GT3SfbhpotPG/Aw+BQb4ILhAjbKVw76rhDUQeMz1l2I
	 ODgU/6Uz2M0V5NCnZxyWDJlleY+T0uh7d7kZ7eI9FWlrODU+xmmLRlAXSghPLCLw4B
	 gZgUKHjiEnWMooq2jkv9miADwNwQbTxxZXbkxwgtEU/CQTzJZ3FUKKewQUFERuenPF
	 pe+YP63pde18c75VhEoCWvn/mhZvmn0gxgEVTSyvYAEWExB7iaYoV2zcbtq5lckYjT
	 IIwoNtSCBGUSQ==
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
Subject: [PATCH 15/15] ARM: mark footbridge as deprecated
Date: Wed,  4 Dec 2024 11:29:04 +0100
Message-Id: <20241204102904.1863796-16-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023038_591953_C3709D05 
X-CRM114-Status: GOOD (  16.11  )
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

Along with RiscPC and SA1100, these are the last remaining Intel StrongARM
machines. The Corel NetWinder used to be particular popular in the late
1990s, but was discontinued during the bankruptcy of rebel.com in 2001.
The other machine is the DEC (later Intel) EBSA285 evaluation board that
was made in small numbers in 1997 for software developers.

The footbridge/netwinder platform was the main target for the first Debian
2.0 "Hamm" release on the Arm architecture back in 1998, but was dropped
in Debian 6.0 "Squeeze" in 2011, which only supported ARMv4T and higher
with the EABI based ports as ARMv4 hardware had fallen already out of
use by that time.

Link: http://netwinder.org/
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-footbridge/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-footbridge/Kconfig b/arch/arm/mach-footbridge/Kconfig
index 78189997caa1..1ac37cadb201 100644
--- a/arch/arm/mach-footbridge/Kconfig
+++ b/arch/arm/mach-footbridge/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_FOOTBRIDGE
-	bool "FootBridge Implementations"
+	bool "FootBridge Implementations (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_MOXART || ARCH_GEMINI || ARCH_SA1100)
 	depends on ATAGS
@@ -12,7 +12,10 @@ menuconfig ARCH_FOOTBRIDGE
 	select NEED_MACH_MEMORY_H
 	help
 	  Support for systems based on the DC21285 companion chip
-	  ("FootBridge"), such as the Simtec CATS and the Rebel NetWinder.
+	  ("FootBridge"), used in the EBSA285 and the Rebel NetWinder.
+
+	  Support for these machines will go away in 2025,
+	  unless there are any remaining users that speak up.
 
 if ARCH_FOOTBRIDGE
 
-- 
2.39.5


