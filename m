Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA6EE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3suCC+aYHrJLrj7SndZrcpuGNrdVGXOoFT7Lc2dOLU=; b=ZjS0Dj8Qa4UvkMRMbeSbtPJP8q
	0y4n1Eafwe4H19q1+8vsSrplqcRYrRLuXRVb9fl4aC9o5edGHwOElXk8sX5jnH1C16BdbVuPZEHu1
	Egkegm/XG2SA9srZXLd/UPlmOCDJC7inQjGyEkf9ei1UfyFNuZmAp5nRp42jLuT8FMhCMc4njEoSL
	OJtFn63Yy98HUNEkv+pGK0+avGpOevWibsQrXko8g0vFMTB4LOMCxuIPhveOkyTdPjbznsMv/53yr
	FTh7Uvb5PYovZIhUEX76FPH1XO0VS0o0PXwZNPTvhYCJyRXZcaH5z/qVbLLIjJWMYxYRA/pk9GTFJ
	Lx0iU/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImrD-0000000CFgB-0VAx;
	Wed, 04 Dec 2024 10:43:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImeL-0000000CCjJ-32UL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB2B8A40F17;
	Wed,  4 Dec 2024 10:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B3EC4CEE1;
	Wed,  4 Dec 2024 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308228;
	bh=2usRHJwXPLxCLKp3Cp+X+mvu8EQwaVbHBk6s3Pt0UDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CG6/GR7382ltvgUUHANIq2MKmi0iiW8nL8dTyvAGLo3tnhPGgO1Py9ZpFEbnCATjw
	 52xSTYGEiHHQl3rqH1yHCF2rl2XokGyBh2Nu+3DC87HdRaQFjgySYWywV/PXIhFl3S
	 Du84oXm7xS6kP3hef7e6epH4mOeSqM4/1V1wn2axFfTXWUimZYxNSRE9h3T91i3FfF
	 CMzgrI+r4QeP1z+aeG3Riteq09Ykohv1qJrZAjZMayem9mWhnzvkQjHnyofDIkdeGl
	 xuAccf6C6DvzsswTvHAM5Br8O/Lo1CsnmIMlIGus/Dmjk7bpC7FyzNLLcTfpZq5b7I
	 tnm2IeJF0Dcqg==
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
Subject: [PATCH 13/15] ARM: mark mach-sa1100 as deprecated
Date: Wed,  4 Dec 2024 11:29:02 +0100
Message-Id: <20241204102904.1863796-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023029_832107_D5523D31 
X-CRM114-Status: GOOD (  18.59  )
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

Most of the old StrongARM1100 machines were removed two years ago as part
of a wider cleanup, the remaining four were left either because someone
showed interest in converting them to devicetree, or because they were
still supported by qemu and therefore useful to keep the platform alive.

None of the devicetree conversion actually happened, and qemu has
marked the platform as deprecated, so do the same in the kernel now.

If anyone is still running one of these four machines and planning
to keep updating their kernels, please speak up now so we can adapt
the plans as needed.

If nobody is found using StrongARM1100 any more, it can be removing
during 2025, leaving 6.12-LTS as the last longterm support kernel
for it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-sa1100/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-sa1100/Kconfig b/arch/arm/mach-sa1100/Kconfig
index 0fb4c24cfad5..f3fa215fd254 100644
--- a/arch/arm/mach-sa1100/Kconfig
+++ b/arch/arm/mach-sa1100/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 menuconfig ARCH_SA1100
-	bool "SA11x0 Implementations"
+	bool "SA11x0 Implementations (DEPRECATED)"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_MOXART || ARCH_GEMINI)
 	depends on ATAGS
@@ -19,6 +19,9 @@ menuconfig ARCH_SA1100
 	help
 	  Support for StrongARM 11x0 based boards.
 
+	  Support for these machines will go away in 2025,
+	  unless there are any remaining users that speak up.
+
 if ARCH_SA1100
 
 config SA1100_ASSABET
-- 
2.39.5


