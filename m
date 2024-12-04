Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7F7E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZfgamzmdwu8pc9bON0iyaPP5tZR9f5Rq+NDnOhX8lo=; b=10q8Kv4fctc8UHVcpcU1jTo5EV
	j+08zjT1/MIEWkEhx5SGD9d2bQDANF87nhFQDZOiFq1Vbs/oOKZnZHCydk2sIjCGncRo9v3gKD2ix
	asCIO9W9gm27nc2OxOrv0bo/D41sVcSi9cXv+mPEscXvX3V067/X/P6zoH5gbcx/UwrardClnD0ZD
	PNEK1jWUhK6SR/3dolh8tG217/HotVuXsDbtEAqgQlfvH8l6E9N9gJR6kOdGRv11MVklHpIfKoYTk
	yfG7FGpltz2tVLNq8FatjFJcCccqCVCEIgSg2DAPSoQuSAkRmCIO7vSI8TjQnrPrS1AC8JgijdNIa
	gxbzFb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImmJ-0000000CEjj-40AT;
	Wed, 04 Dec 2024 10:38:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdz-0000000CCeI-1xeb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:30:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14F0D5C6BC5;
	Wed,  4 Dec 2024 10:29:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB04C4CED6;
	Wed,  4 Dec 2024 10:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308206;
	bh=YkbOGSzICrZiR+4fHhpecKjehdpXOnctJBrLxxFsimY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CQfnRHb0g7Q2z22aBdhfz3xK93jft7nmq9SDrBId79yDhfUqGwMCXaI/TGjS2kNOf
	 yIiDq36ob2rdhpFtENjXW3Olkirzz8fweFp/Th0sYvnVK5DRXZLEZeg5FD/ygz7Ax7
	 /+oGcbhuqg5clF7nPmWzkLG0jzX/Me7FRjPE30dRHnv84lnrKngwuuslGF8oXFFo7F
	 irTLNhwvAHOmiNMbZp/MUEbWLu+tzd4kQxjwshqqfY46uNG6O9USGb+k/xAqm5fOmY
	 9t9l2/2B6yhLs4BIASw7ysz2MMfJuBNM5FMWHV7Fn7lJGAUjsIndY+M7xF7ZkTN/gg
	 U8vOFUCBQDVvQ==
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
Subject: [PATCH 08/15] ARM: update FPE_NWFPE help text
Date: Wed,  4 Dec 2024 11:28:57 +0100
Message-Id: <20241204102904.1863796-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_023007_547876_230011DB 
X-CRM114-Status: GOOD (  17.37  )
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5278764162f8..d92531c3f982 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1661,16 +1661,16 @@ menu "Floating point emulation"
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


