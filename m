Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F94C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XIpkQAKOSwPd+uiBrJiQRFiw70sh7kBbQn2HiXdRLoM=; b=yvdd8TgLTzN3d1uu2BhvbCQ0Er
	b33zk2z+StO2ot549ng9zbWPIX4r44PdGloZdg2ZNVyqvrd37ooszeryk0ZCoTb7JHYUxnmBVJrCj
	xISBYL/T4LWftT3bCoJm8vhE+cDslCcUMEjeQOYDGLliUeKcqYi2Ij9v3PGOUpk1NYlgV1rvTH+Aw
	5rh2Dov19oYFSzyaticOnluDXG6NHfo8pW41BGpuq4C1sFJNL8R/8jX2F9uCgX5xKRZJHy/HOUj26
	WPtNJvBR+MY4t0ROpBOgi0kOWFVFxJx5Y4/lzLN4Os6GQJ9Ye4Uv05W2Ng2ntk39urK5tAqbgk3vj
	IKKxPOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4r1V-00000007hrY-2ayc;
	Wed, 16 Apr 2025 00:53:05 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qzb-00000007hO3-3UZm;
	Wed, 16 Apr 2025 00:51:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4qwl-000000001SU-3xn7;
	Wed, 16 Apr 2025 00:50:49 +0000
Date: Wed, 16 Apr 2025 01:50:46 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 1/5] net: ethernet: mtk_eth_soc: reapply mdc divider
 on reset
Message-ID: <8ab7381447e6cdcb317d5b5a6ddd90a1734efcb0.1744764277.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_175107_871202_B3F95B1E 
X-CRM114-Status: GOOD (  15.48  )
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

From: Bo-Cun Chen <bc-bocun.chen@mediatek.com>

In the current method, the MDC divider was reset to the default setting
of 2.5MHz after the NETSYS SER. Therefore, we need to reapply the MDC
divider configuration function in mtk_hw_init() after reset.

Fixes: c0a440031d431 ("net: ethernet: mtk_eth_soc: set MDIO bus clock frequency")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: * only parse DT once, store divider in struct mtk_eth
    * make sure MDC is configured before calling of_mdiobus_register()
    * reapply after reset

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 39 +++++++++++++--------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
 2 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 43197b28b3e74..1a235283b0e9b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -871,9 +871,25 @@ static const struct phylink_mac_ops mtk_phylink_ops = {
 	.mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
 };
 
+static void mtk_mdio_config(struct mtk_eth *eth)
+{
+	u32 val;
+
+	/* Configure MDC Divider */
+	val = FIELD_PREP(PPSC_MDC_CFG, eth->mdc_divider);
+
+	/* Configure MDC Turbo Mode */
+	if (mtk_is_netsys_v3_or_greater(eth))
+		mtk_m32(eth, 0, MISC_MDC_TURBO, MTK_MAC_MISC_V3);
+	else
+		val |= PPSC_MDC_TURBO;
+
+	mtk_m32(eth, PPSC_MDC_CFG, val, MTK_PPSC);
+}
+
 static int mtk_mdio_init(struct mtk_eth *eth)
 {
-	unsigned int max_clk = 2500000, divider;
+	unsigned int max_clk = 2500000;
 	struct device_node *mii_np;
 	int ret;
 	u32 val;
@@ -908,20 +924,9 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 		}
 		max_clk = val;
 	}
-	divider = min_t(unsigned int, DIV_ROUND_UP(MDC_MAX_FREQ, max_clk), 63);
-
-	/* Configure MDC Turbo Mode */
-	if (mtk_is_netsys_v3_or_greater(eth))
-		mtk_m32(eth, 0, MISC_MDC_TURBO, MTK_MAC_MISC_V3);
-
-	/* Configure MDC Divider */
-	val = FIELD_PREP(PPSC_MDC_CFG, divider);
-	if (!mtk_is_netsys_v3_or_greater(eth))
-		val |= PPSC_MDC_TURBO;
-	mtk_m32(eth, PPSC_MDC_CFG, val, MTK_PPSC);
-
-	dev_dbg(eth->dev, "MDC is running on %d Hz\n", MDC_MAX_FREQ / divider);
-
+	eth->mdc_divider = min_t(unsigned int, DIV_ROUND_UP(MDC_MAX_FREQ, max_clk), 63);
+	mtk_mdio_config(eth);
+	dev_dbg(eth->dev, "MDC is running on %d Hz\n", MDC_MAX_FREQ / eth->mdc_divider);
 	ret = of_mdiobus_register(eth->mii_bus, mii_np);
 
 err_put_node:
@@ -3974,6 +3979,10 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	else
 		mtk_hw_reset(eth);
 
+	/* No MT7628/88 support yet */
+	if (reset && !MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
+		mtk_mdio_config(eth);
+
 	if (mtk_is_netsys_v3_or_greater(eth)) {
 		/* Set FE to PDMAv2 if necessary */
 		val = mtk_r32(eth, MTK_FE_GLO_MISC);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 90a377ab4359e..39709649ea8d1 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1271,6 +1271,7 @@ struct mtk_eth {
 	struct clk			*clks[MTK_CLK_MAX];
 
 	struct mii_bus			*mii_bus;
+	unsigned int			mdc_divider;
 	struct work_struct		pending_work;
 	unsigned long			state;
 
-- 
2.49.0

