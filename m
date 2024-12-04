Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B16E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9QHGq8ri5lS4th1+rD5tIuDxxnlDuT/FnyzqyhrZV8=; b=kFNcmscSyv4Zj+LrpizG3bhuFX
	i22bguuQSQ7sORyYMkBjNYlnD+Cp95/bayJJVz8FdyDaJq0oEtWXt+Ota0G7A2cMbbLA1o8TD1xxu
	RmDf2U05EY+WIljGfCJnAkbTnNPie2uXFKAVh851VLnJjcIpSQzacitvOnGunJoqOz3FOqN1WBHdx
	gVij281ysK9/03b5s1Pz62K/h7OIU96Cjc6P/s7IKPlf2o0gE4QuZMhVJrOhJSaqFcdlNKf8lBVXj
	5gEiCTxaK/4KQjgWxFJL/fLrJDtyN8S0qrcs3KPoNmxx6jLzKWPQQs922nLswLObx2ph2vrxti9Bp
	ceh/19Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImkL-0000000CEDl-2v8B;
	Wed, 04 Dec 2024 10:36:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImdq-0000000CCbl-3lnF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D9BCA40F0B;
	Wed,  4 Dec 2024 10:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1588C4CED6;
	Wed,  4 Dec 2024 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733308197;
	bh=8LBdUUpx/FRHg8VDxMOB3poMFcg37/aar7nw5/8IvY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lliecmitigPo/h/BYBh44zrRAsn86P8Za2KThMCS+8Q3nk6O7p9m3s1HQullUA5QI
	 H1eFE4+ef3TyQQ/9f4RKNuxBuDWw4UvC1CRJaIySmEKHb7iAx//VdCjV4PkJ8/JtKn
	 ZRN4Ri/fE4liCTzHKzcuVIZYkC98foP4hD9XWWNndedHcoJeJIgZozhuvKv6oBJ0mU
	 2NRV2QQyFSeJcZpWpYb8tTh4iGbeNL8saXbOq9vElyV/GhiFTf0mYgS7CJolKMPTnx
	 9gv47JylwWbJv25Mad5+I1Q+mHjMIo7buuFtjWoHoy/U3SgBBb5qJkPlgOsucTxfVF
	 wYSOEeWYtN58w==
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
Subject: [PATCH 06/15] ARM: update DEPRECATED_PARAM_STRUCT removal timeline
Date: Wed,  4 Dec 2024 11:28:55 +0100
Message-Id: <20241204102904.1863796-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204102904.1863796-1-arnd@kernel.org>
References: <20241204102904.1863796-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022958_996980_A6540854 
X-CRM114-Status: GOOD (  17.47  )
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2167f71f184b..5278764162f8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1411,11 +1411,11 @@ config ATAGS
 	  it is either converted to DT or removed.
 
 config DEPRECATED_PARAM_STRUCT
-	bool "Provide old way to pass kernel parameters"
+	bool "Provide old way to pass kernel parameters (DEPRECATED)"
 	depends on ATAGS
 	help
 	  This was deprecated in 2001 and announced to live on for 5 years.
-	  Some old boot loaders still use this way.
+	  It is now scheduled for removal in early 2025.
 
 # Compressed boot loader in ROM.  Yes, we really want to ask about
 # TEXT and BSS so we preserve their values in the config files.
-- 
2.39.5


