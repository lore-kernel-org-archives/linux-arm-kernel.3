Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BA4C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PO3DE3LP/CRc60XxVQjG4C1VneQ7JlTbuSQ+FX+UJHg=; b=JyEyCljFXTbJfdainb352kDzGW
	7ZO0c4jW7+bX+gejTTSWOLCshsd08nrSj2uSjeHdGwueZHLkVeRH0K4d5G1qQPQM4Ev6F6eXFQx38
	S2cdDqm7grGLjI2VXDfvsitLl4cyFlMxQQtRvKjpSUydKf//6ZSgbM4qY+Uu7hzeUWAXnyjbjimJS
	b55TM+cXwnTTC/3yXUXPW6jj9mzy/b5nw4RALyw9oE8fVA82Y9JTCUSNj9c5BaXBYSqCCjLUrlObN
	SD6IntHUPStlia8YvW2/L+mxBp24Cy8XJ/0XecJf5XVhevRmlpMYJbPA5hB6xCU65JOi+krgYjeVU
	DGvihQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teH7D-0000000Cw8i-3f8n;
	Sat, 01 Feb 2025 17:17:07 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teH5s-0000000CvtQ-0Uya;
	Sat, 01 Feb 2025 17:15:45 +0000
X-CSE-ConnectionGUID: Tq4Nmjg8Qh6eCHLyTkiFJg==
X-CSE-MsgGUID: Zxdm66+1QWqsMWWy3aLtYw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Feb 2025 02:15:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D546A401CED4;
	Sun,  2 Feb 2025 02:15:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] net: ethernet: actions: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 17:15:18 +0000
Message-ID: <20250201171530.54612-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_091544_274591_453C404B 
X-CRM114-Status: UNSURE (   9.35  )
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

Use the helper of_get_available_child_by_name() to simplify
owl_emac_mdio_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/net/ethernet/actions/owl-emac.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
index 115f48b3342c..3457ce041335 100644
--- a/drivers/net/ethernet/actions/owl-emac.c
+++ b/drivers/net/ethernet/actions/owl-emac.c
@@ -1323,22 +1323,15 @@ static int owl_emac_mdio_init(struct net_device *netdev)
 	struct owl_emac_priv *priv = netdev_priv(netdev);
 	struct device *dev = owl_emac_get_dev(priv);
 	struct device_node *mdio_node;
-	int ret;
+	struct device_node *mdio_node _free(device_node) =
+		of_get_available_child_by_name(dev->of_node, "mdio");
 
-	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
 	if (!mdio_node)
 		return -ENODEV;
 
-	if (!of_device_is_available(mdio_node)) {
-		ret = -ENODEV;
-		goto err_put_node;
-	}
-
 	priv->mii = devm_mdiobus_alloc(dev);
-	if (!priv->mii) {
-		ret = -ENOMEM;
-		goto err_put_node;
-	}
+	if (!priv->mii)
+		return -ENOMEM;
 
 	snprintf(priv->mii->id, MII_BUS_ID_SIZE, "%s", dev_name(dev));
 	priv->mii->name = "owl-emac-mdio";
@@ -1348,11 +1341,7 @@ static int owl_emac_mdio_init(struct net_device *netdev)
 	priv->mii->phy_mask = ~0; /* Mask out all PHYs from auto probing. */
 	priv->mii->priv = priv;
 
-	ret = devm_of_mdiobus_register(dev, priv->mii, mdio_node);
-
-err_put_node:
-	of_node_put(mdio_node);
-	return ret;
+	return devm_of_mdiobus_register(dev, priv->mii, mdio_node);
 }
 
 static int owl_emac_phy_init(struct net_device *netdev)
-- 
2.43.0


