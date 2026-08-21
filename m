Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A70C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kglcgSe5zggpzPfjalYZhVJssgC8Q5cZEumLcJEjvuc=; b=x8X5lCtgea4fvmSdca2v+BiuUH
	TfPbZ4HiDJMMdk6t3ZDjILcScq/ke55J5F1aQQ27q+MNonr8/4M7H8xQQJqhV92ZAoSI/bdwqQWA4
	b7UUy01uXgF04Hxt6MLL5dYR/EZICQxcM1JTUkTG8naSqCzGEJkEG+aAH65wgFJ1ozBuMnEwVlCPR
	iM6PY71RRkDYNnFVXj2wSlLFrhP5kbHGgK7p9y68nGj8wW8dz/DfGB2OEnftitcxeRomYM3hgAiS8
	N9HqRtil+Lyzw/C6Td22cGee0wdAab7rH6rUX++UmNvcIJ4I4Ja2aLaP3VmMDkbVaJXO1A7WxLjpu
	AMFJJg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMA9-0000000D1qI-2jPX;
	Fri, 21 Aug 2026 10:07:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMA4-0000000D1nD-2wA9;
	Fri, 21 Aug 2026 10:07:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FB8F43F1B;
	Fri, 21 Aug 2026 10:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25511F00A3A;
	Fri, 21 Aug 2026 10:07:40 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next 1/3] net: macb: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:07:30 +0200
Message-ID: <00772e2fb1f8433a5d6c47dbd28cb4149495e1ab.1787240118.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 1476bce77f34d2a5..319e43098f57ed7b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5376,7 +5376,7 @@ static int fu540_c000_clk_init(struct platform_device *pdev, struct clk **pclk,
 			       struct clk **hclk, struct clk **tx_clk,
 			       struct clk **rx_clk, struct clk **tsu_clk)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int err = 0;
 
 	err = macb_clk_init_dflt(pdev, pclk, hclk, tx_clk, rx_clk, tsu_clk);
-- 
2.43.0


