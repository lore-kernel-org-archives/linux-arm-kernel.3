Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EAAC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jF3dILZL9ojgbbbVrguUHH2h8IXx6sdfDdVa8Zo2QhI=; b=AU90fs1Jyw31bbOmspkoByP30F
	5eG2rnaOerTR4r3L+nSGUlcOj7di3BVat5jKSV0aSEMWlYiujEHyDTyB5iIsOp30PkAded0afS1N7
	N3ScOopIlrWhDtUZoZHAaotlmlzlGNT6NIFN5jVscpWnngVH/UKmivGCKAsihxOEikzDDbAcXBTnc
	yKNOMkiJNSdXrHqetEr3jTT+g8TEiqVdo0SVo9FH2+m42IUiYvalHA+y8PCpP907kvtGEYoybMYdU
	LlnaVYYQBexZttVplWekipTN+HISFCfWN5Zr2+gj+x/89znC956hntkrtmfPkNVsQkGoLY/tnWHXC
	u9hYTjpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGH0-0000000Cr4U-2P5z;
	Sat, 01 Feb 2025 16:23:10 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teGFg-0000000CqwL-3S0r;
	Sat, 01 Feb 2025 16:21:50 +0000
X-CSE-ConnectionGUID: AgGFxWtbTL2lG5Lg6U9uWg==
X-CSE-MsgGUID: l+OeNAZxSs+/vPP+FVGizw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Feb 2025 01:21:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DBB7B401E6AA;
	Sun,  2 Feb 2025 01:21:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] net: ethernet: mtk-star-emac: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 16:21:32 +0000
Message-ID: <20250201162135.46443-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_082148_978141_5CE6BB51 
X-CRM114-Status: GOOD (  10.00  )
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

Use the helper of_get_available_child_by_name() to simplify
mtk_star_mdio_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 24 ++++---------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 25989c79c92e..beb0500fe9d5 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1422,25 +1422,15 @@ static int mtk_star_mdio_init(struct net_device *ndev)
 {
 	struct mtk_star_priv *priv = netdev_priv(ndev);
 	struct device *dev = mtk_star_get_dev(priv);
-	struct device_node *of_node, *mdio_node;
-	int ret;
-
-	of_node = dev->of_node;
+	struct device_node *mdio_node _free(device_node) =
+		of_get_available_child_by_name(dev->of_node, "mdio");
 
-	mdio_node = of_get_child_by_name(of_node, "mdio");
 	if (!mdio_node)
 		return -ENODEV;
 
-	if (!of_device_is_available(mdio_node)) {
-		ret = -ENODEV;
-		goto out_put_node;
-	}
-
 	priv->mii = devm_mdiobus_alloc(dev);
-	if (!priv->mii) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
+	if (!priv->mii)
+		return -ENOMEM;
 
 	snprintf(priv->mii->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
 	priv->mii->name = "mtk-mac-mdio";
@@ -1449,11 +1439,7 @@ static int mtk_star_mdio_init(struct net_device *ndev)
 	priv->mii->write = mtk_star_mdio_write;
 	priv->mii->priv = priv;
 
-	ret = devm_of_mdiobus_register(dev, priv->mii, mdio_node);
-
-out_put_node:
-	of_node_put(mdio_node);
-	return ret;
+	return devm_of_mdiobus_register(dev, priv->mii, mdio_node);
 }
 
 static __maybe_unused int mtk_star_suspend(struct device *dev)
-- 
2.43.0


