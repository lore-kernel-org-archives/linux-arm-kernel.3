Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F57C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Feb 2025 17:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eExwuOe3q6rE3TAfOL1546i6biWWSruubGJYTG4GOiQ=; b=pSntKrOaTbMcsCnYotI6X2JT1o
	oKqYlVzeeaAhJ99YJuXOkZHq5YViJKsdmgNy/Xmzg5EmB/oSP5B5sXXVI/4xkeZtsviMf2nja6FaN
	JagzCoyFr/iGsayx329hWegUn6GTYC9WJ/szwEHhobXHgXdzW3NUSTu0IhmNYnohNqjzj4IUhcLSJ
	w/lpDqlGgc5PqJwa9EGUmBUY0rY9E8Dco2BLUc7zBxrNgf3uVRxbAP1QXwmcyjFe7ZdKdY8MrtNvF
	it/ndACbKtDHw/ri48JSScBm8+Q850kFRNvxHFBs7u2lXUfUylQinfOAybwqgN+9Eb7khM7lDfuXs
	/XBdwJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teHJ9-0000000Cwsb-3K6p;
	Sat, 01 Feb 2025 17:29:27 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teHHq-0000000Cwp7-2Nyv;
	Sat, 01 Feb 2025 17:28:07 +0000
X-CSE-ConnectionGUID: 1G7weM7jTkuXTAlgpHH4DA==
X-CSE-MsgGUID: 9Is9hnlbSAOWwxWubiFzSA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Feb 2025 02:28:04 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 56E61403A86F;
	Sun,  2 Feb 2025 02:27:48 +0900 (JST)
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
Subject: [PATCH v2] net: ethernet: actions: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 17:27:40 +0000
Message-ID: <20250201172745.56627-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_092806_725853_0BB13B10 
X-CRM114-Status: UNSURE (   9.98  )
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
v1->v3:
 * Dropped duplicate mdio_node declaration.

This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/net/ethernet/actions/owl-emac.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
index 115f48b3342c..c5a00c09b1ea 100644
--- a/drivers/net/ethernet/actions/owl-emac.c
+++ b/drivers/net/ethernet/actions/owl-emac.c
@@ -1322,23 +1322,15 @@ static int owl_emac_mdio_init(struct net_device *netdev)
 {
 	struct owl_emac_priv *priv = netdev_priv(netdev);
 	struct device *dev = owl_emac_get_dev(priv);
-	struct device_node *mdio_node;
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
@@ -1348,11 +1340,7 @@ static int owl_emac_mdio_init(struct net_device *netdev)
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


