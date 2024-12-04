Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189D7E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb+GatSGbq/FiYncQmzp+aIxWUstMYCqCKDRbNC3uJk=; b=rgHeB1wQx9cXB8zrAsHZb0X2uS
	dq6g1iaFbzUzOg+qDAFdf1gIi4MEokRffUJpZBsybZtJLJxDYlN6Eqx6TO7FBkuUPi1Yt4YDYA82c
	gUOfBOy0BJFepaPhoSJpqH0G8PxtGOma8Y679tFBCcFp1QbONXRqb+DiSs2NL6LHdm286vBiKs8s6
	JfgGUZajkmwXZEIULfcwQR8KkGHulTT9pMtjZbI79YsV8QdTBG+D/h7Q/a5BhfV++QihnQSkkvQ21
	UHKOeejkBcJAbYS7+ajrbX4FInfffWKC52+/Mtw5dcpYAWGpngLvaxvTKMzl3RHGTOLZzukaqNd26
	01gTlsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImsB-0000000CFnn-2yrh;
	Wed, 04 Dec 2024 10:44:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImeQ-0000000CCkO-0k7Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 393F4A40F1E;
	Wed,  4 Dec 2024 10:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C49C4CEDD;
	Wed,  4 Dec 2024 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308233;
	bh=3y438iVSCRjif3uUSuYU+XZZGbL/kiock7Mz7H3Q0wI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n6AXLwr+aR6cqrQmzWCVnAdDptc5iY1/yB5jen8P+3dCAwbIqCnJfvppJbZBbnisC
	 ItpbTbS9m9gmFjvBHneN50GdcqCA/d8fVpibyWDpp/xzKrzft+JMILbh9qnaPhTLDi
	 ynL4/VW0EnZ6amxjuqPR2tBBVLtYRM4BgncQRGLAtQEgZna5SzY9B31L5hNni6K1qZ
	 lq6AMm9F+sQiNGa2kOsQyoASXSZe4kHz5gZLUc0DD0V99DhSChRnhTIlmJvpzEMMML
	 hTkKshIN+qQoZvu3IeVjwe638xxemldqhs872nT94Fxsoj6frygyW8AEABFtF7C3qq
	 /dzBB1Su0GWGw==
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
Subject: [PATCH 14/15] ARM: mark RiscPC as deprecated
Date: Wed,  4 Dec 2024 11:29:03 +0100
Message-Id: <20241204102904.1863796-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023034_281559_4252AEA7 
X-CRM114-Status: GOOD (  18.32  )
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
longer, plan to remove it in early 2025 while it is still expected
to mostly work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-rpc/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-rpc/Kconfig b/arch/arm/mach-rpc/Kconfig
index 55f6d829b677..90c13eaeec1f 100644
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
+	  Support for these machines will go away in 2025,
+	  unless there are any remaining users that speak up.
-- 
2.39.5


