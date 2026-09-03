Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1950C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+W38nW5eFNROJ/dZdnbDzztGkxqMyRq2nTYc3/n4MA=; b=PleTkZlWMgzO3LUSkG5eHtxIt3
	fYJ9uB3oDdIM9kUQ5mTUPq0LSYQh97YrbI/DyifrH1yIazE6zeVGlxjAsZgIt6ACetX6bfbdk5a1a
	uWCZeUm66xoRWUxHss76Ut9zKyaIxDGoZDNAjlIOxxlb3ohQThWlk/A3IBT8CSadF5ntg7a7VzNLm
	7CdvqlWBInoSEs1+xwXgUCBuzp4InBfVXiTcjH6TFKlO6SxFcRdfEdB2Gd0E3J/eIT8OgOj28+t2k
	93HW2pnUmN+poRtt3Icqx4cSzqG5eeNTcvlK+spyk6aQN6Og4KmTA+id5IVGkM8F6zo5VoaU5XLno
	e2IB2l3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23JW-0000000GsON-2axs;
	Thu, 03 Sep 2026 09:00:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23JV-0000000GsN7-0MVE;
	Thu, 03 Sep 2026 09:00:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D336C407A0;
	Thu,  3 Sep 2026 09:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D221F00A3A;
	Thu,  3 Sep 2026 09:00:48 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH net-next v2 1/3] net: macb: Make sure clk_init_data is fully initialized
Date: Thu,  3 Sep 2026 11:00:39 +0200
Message-ID: <62cfa62a8f39e0014d2fe9b30a668df20ace4a0c.1788425654.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1788425654.git.geert+renesas@glider.be>
References: <cover.1788425654.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Compile-tested only.

v2:
  - Add Reviewed-by.
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 76ee4f5060335c4e..2e6a5e93d0cdd5d5 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5375,7 +5375,7 @@ static int fu540_c000_clk_init(struct platform_device *pdev, struct clk **pclk,
 			       struct clk **hclk, struct clk **tx_clk,
 			       struct clk **rx_clk, struct clk **tsu_clk)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	int err = 0;
 
 	err = macb_clk_init_dflt(pdev, pclk, hclk, tx_clk, rx_clk, tsu_clk);
-- 
2.43.0


