Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F641E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F/Jw6nVzFg/5bLqKJNEGuEUeVHz7iX0TWknb0In0SY=; b=13TFrJWM2tjtLsZ2On6VLUYCLd
	NxcgCzGwe8uPZ++2ky7arJBwOt3e5ak8qZwtDzdJRjLyFjtD8HhHuQvnX3uGCB0f0Erq5f8tzwkEX
	+O4ocYfgPKKPItqniGXABUZOnO0Q2tl/sSygldcTERFEj7AEfyNcz7julIhnNFoUkrxA7eWYVkYRo
	V6Z5SoSnK7AHZSaVok4BU2MbbU5UCd49UT+czFMsWloqiu2qutEjhc7Pk7s2VRpW13m0agrw1v4VJ
	mFIa3Twcs4B+s7kPAbBQy3hC73tCHuygwDC0hctjfc8q6GdHq6JChFSWq02uLJl7kOyvCrwosx46H
	bE+rH7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImlL-0000000CEVA-1OQS;
	Wed, 04 Dec 2024 10:37:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdv-0000000CCdJ-1aPJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7292DA40C43;
	Wed,  4 Dec 2024 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF21C4CEE0;
	Wed,  4 Dec 2024 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308202;
	bh=Ig2MTPjDp9GtEzGfz9dtsom3kAntHGBlM9IrrVuvXdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=URqp8wVvZcoXJOlb/brM0MYh2hDT0FQYKcI+tyDyEkX7B5AEVaUhkpxyxUH8PjAsU
	 R+BvTnMECQZx+QrYvVo0GaJYlbAYilUNZyLDbYbFTbvuQifMkHQpEWhc9lO2mXuz4X
	 DqEtNOsZFbrHZZTt5s2ulDbYLr6qcUxUjr8RyzSzzMBBH8Bx/3/s+wJKonYvYwlrym
	 Mb3O43atYmd0f9TswTPfSd2L4aGiyG78Ji3rJ3aNOGThevGlecIpjyHB+FBYSq3qgx
	 /x96F1ZCFwgJbF1cTzk8dcFLx4cwUySoK0ffkfWEFy2MzqHw+wVOWb2rpp9KI0I7bw
	 C2sY3lnRm0OfQ==
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
Subject: [PATCH 07/15] ARM: s3c64xx: extend deprecation schedule
Date: Wed,  4 Dec 2024 11:28:56 +0100
Message-Id: <20241204102904.1863796-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023003_485353_0997A5E0 
X-CRM114-Status: GOOD (  17.88  )
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
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c/Kconfig.s3c64xx | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 8f40af063ad6..3120a40ef102 100644
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
+	  Support for S3C64XX will be kept until the 2025 LTS kernel
+	  release and may be removed in early 2026.
+
+	  Please reach out to the maintainers of the platform and
+	  linux-samsung-soc@vger.kernel.org if you use any additional
+	  s3c64xx machines based on devicetree.
 
 if ARCH_S3C64XX
 
-- 
2.39.5


