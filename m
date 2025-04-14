Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C68C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CNaJ+TUXHuS+8BUbr3hVVc9p4W+Xe+7+Z2FFKhOC+Vw=; b=RhIyIUZeBXnOptGd60oS80RRJq
	yN4DuILWGo3lDLqucBNUmvREB36hn83n/Ek9boyDcS5UsTwMOIELnfZbTvbGVShDO24z9zUGG4KBG
	cUXBSzmXrt25xuViKQVYvhxdEuJw6wLFS8cePuk5cy2IaxhT2ZNQXEO4AQD3j7iEVLVvEPs2UMqSR
	r9pH8PzAhLELz/1SHAHFyzuPkrvm45Nt198r1bmeszgVOsMQRFyZhm72XjlYbGW9iq02lo5iS7Pt8
	DsQDyKYeZKizMs7F+WGA2ZDIXAuXhJug/tKJNUmKX+WDRw2gmrYYbHn2102VXH0RA2L4FmycCjk+Z
	vvjCzPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OJP-000000033n3-2UYJ;
	Mon, 14 Apr 2025 18:13:39 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OHW-000000033PK-1GYN;
	Mon, 14 Apr 2025 18:11:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4OHE-000000003xa-28sl;
	Mon, 14 Apr 2025 18:11:24 +0000
Date: Mon, 14 Apr 2025 19:11:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: [PATCH net 1/5] net: ethernet: mtk_eth_soc: revise mdc divider
 configuration
Message-ID: <08498e31e830cf0ee1ceb4fc1313d5c528a69150.1744654076.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_111142_345422_97E1E10E 
X-CRM114-Status: GOOD (  14.04  )
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
of 2.5MHz after the NETSYS SER. Therefore, we need to move the MDC
divider configuration function to mtk_hw_init().

Fixes: c0a440031d431 ("net: ethernet: mtk_eth_soc: set MDIO bus clock frequency")
Signed-off-by: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 60 ++++++++++++++-------
 1 file changed, 42 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 43197b28b3e74..fd643cc1b7dd2 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -871,11 +871,11 @@ static const struct phylink_mac_ops mtk_phylink_ops = {
 	.mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
 };
 
-static int mtk_mdio_init(struct mtk_eth *eth)
+static int mtk_mdio_config(struct mtk_eth *eth)
 {
 	unsigned int max_clk = 2500000, divider;
 	struct device_node *mii_np;
-	int ret;
+	int ret = 0;
 	u32 val;
 
 	mii_np = of_get_available_child_by_name(eth->dev->of_node, "mdio-bus");
@@ -884,22 +884,6 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 		return -ENODEV;
 	}
 
-	eth->mii_bus = devm_mdiobus_alloc(eth->dev);
-	if (!eth->mii_bus) {
-		ret = -ENOMEM;
-		goto err_put_node;
-	}
-
-	eth->mii_bus->name = "mdio";
-	eth->mii_bus->read = mtk_mdio_read_c22;
-	eth->mii_bus->write = mtk_mdio_write_c22;
-	eth->mii_bus->read_c45 = mtk_mdio_read_c45;
-	eth->mii_bus->write_c45 = mtk_mdio_write_c45;
-	eth->mii_bus->priv = eth;
-	eth->mii_bus->parent = eth->dev;
-
-	snprintf(eth->mii_bus->id, MII_BUS_ID_SIZE, "%pOFn", mii_np);
-
 	if (!of_property_read_u32(mii_np, "clock-frequency", &val)) {
 		if (val > MDC_MAX_FREQ || val < MDC_MAX_FREQ / MDC_MAX_DIVIDER) {
 			dev_err(eth->dev, "MDIO clock frequency out of range");
@@ -922,6 +906,42 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 
 	dev_dbg(eth->dev, "MDC is running on %d Hz\n", MDC_MAX_FREQ / divider);
 
+err_put_node:
+	of_node_put(mii_np);
+	return ret;
+}
+
+static int mtk_mdio_init(struct mtk_eth *eth)
+{
+	struct device_node *mii_np;
+	int ret;
+
+	mii_np = of_get_child_by_name(eth->dev->of_node, "mdio-bus");
+	if (!mii_np) {
+		dev_err(eth->dev, "no %s child node found", "mdio-bus");
+		return -ENODEV;
+	}
+
+	if (!of_device_is_available(mii_np)) {
+		ret = -ENODEV;
+		goto err_put_node;
+	}
+
+	eth->mii_bus = devm_mdiobus_alloc(eth->dev);
+	if (!eth->mii_bus) {
+		ret = -ENOMEM;
+		goto err_put_node;
+	}
+
+	eth->mii_bus->name = "mdio";
+	eth->mii_bus->read = mtk_mdio_read_c22;
+	eth->mii_bus->write = mtk_mdio_write_c22;
+	eth->mii_bus->read_c45 = mtk_mdio_read_c45;
+	eth->mii_bus->write_c45 = mtk_mdio_write_c45;
+	eth->mii_bus->priv = eth;
+	eth->mii_bus->parent = eth->dev;
+
+	snprintf(eth->mii_bus->id, MII_BUS_ID_SIZE, "%pOFn", mii_np);
 	ret = of_mdiobus_register(eth->mii_bus, mii_np);
 
 err_put_node:
@@ -3974,6 +3994,10 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
 	else
 		mtk_hw_reset(eth);
 
+	/* No MT7628/88 support yet */
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
+		mtk_mdio_config(eth);
+
 	if (mtk_is_netsys_v3_or_greater(eth)) {
 		/* Set FE to PDMAv2 if necessary */
 		val = mtk_r32(eth, MTK_FE_GLO_MISC);
-- 
2.49.0

