Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0EE74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SMMOxX/cF7Xb/l1gaQLrU4Pzf2WwR+2hpnP6JvsXT20=; b=bIE0JCggp4J47qR0Ani5tkEG8N
	+vY37p7QzFlPnb1f37AutcIZtLFG/D5Ql1VKIpFnzaUu0EG3z7wN98QxSWQAn0BN2LaYSEE4v3S9u
	R8QgoxkUNLl0z4Am5cW622RLELx9V7qa4x5caVJS6u2hJb3Xm5gEbA8VAyuk6lxaE9zfZSds8bAPM
	dcCw4jaHY7lU5vknc1dPSkCQMLHCIQq9lIEIw+moVJnHkzIERplECq9hWkEsaj3okGwmd7fA88/Vd
	AVyeiHacODLrqEPNxhUmRARbSx4qBswCGAx/36SIKsq2Zz6dZkc1ojfUpCbpzCCX3F76VXHM9ZDGx
	WgtSqRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVhN-0000000A5My-0UJN;
	Tue, 03 Dec 2024 16:24:29 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVgM-0000000A58o-1kmX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:23:27 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by laurent.telenet-ops.be with cmsmtp
	id kGPJ2D00L3sLyzB01GPJFm; Tue, 03 Dec 2024 17:23:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVgE-000DSa-NC;
	Tue, 03 Dec 2024 17:23:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVgE-00AOqD-K5;
	Tue, 03 Dec 2024 17:23:18 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: GPIO_MVEBU should not default to y when compile-testing
Date: Tue,  3 Dec 2024 17:23:16 +0100
Message-Id: <6b9e55dbf544297d5acf743f6fa473791ab10644.1733242798.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_082326_595169_20BDA0C9 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Merely enabling compile-testing should not enable additional
functionality.

Fixes: 956ee0c5c969c9ca ("gpio: mvebu: allow building the module with COMPILE_TEST=y")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f483201637062cab..d371ce2578ee9703 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -491,8 +491,9 @@ config GPIO_MT7621
 	  Say yes here to support the Mediatek MT7621 SoC GPIO device.
 
 config GPIO_MVEBU
-	def_bool y
+	bool "Marvell Orion and EBU GPIO support" if COMPILE_TEST
 	depends on PLAT_ORION || ARCH_MVEBU || COMPILE_TEST
+	default PLAT_ORION || ARCH_MVEBU
 	select GENERIC_IRQ_CHIP
 	select REGMAP_MMIO
 
-- 
2.34.1


