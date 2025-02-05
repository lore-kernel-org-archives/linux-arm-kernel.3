Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E8CC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9supdkQCm8FYkhwurAhujvgrSF6y4N6SMnERr+tIZQ=; b=cXy4dFvzeUZHFaARTt1nrTkgkt
	bMpAo2bu28vU09smvU/RGlhA3nOD4GM2tCkRfPAAghDKHV2EBqaR3zGCoGNSyktfESJcuNGZN3NcP
	FFj4e8FPnf/1sAwpYeWsil2eTmjHpsABR84TC4mk1XTfgLWrzF4nBQ/k8Hmgf9Ag2rEPLY3eAJ6NR
	/+v/MbadYreDdhclTtZrLc1NJsMoilIR7EPIA/rOfH4M/X3aKSb9nlm3t45YQZ+Vko/CZc9dhws3G
	V3edDK5vwA8Z6cEcdbqzmfaGeXLsGIKC368HJ8hBm1rJ3HUOlsoJ6YcmkSH00KxG8CSh4UjEbzXl0
	i3RVEjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfepU-00000003HAb-420Q;
	Wed, 05 Feb 2025 12:48:32 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfekK-00000003FjP-2ppG;
	Wed, 05 Feb 2025 12:43:13 +0000
X-CSE-ConnectionGUID: ceBcTh8kQCW+CZ/WKhC9Yg==
X-CSE-MsgGUID: TpZdVZhQTc2TjjwYpYPbgw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:43:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DF36D41F86AF;
	Wed,  5 Feb 2025 21:43:07 +0900 (JST)
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
Subject: [PATCH net-next v2 6/7] net: ethernet: actions: Use of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:26 +0000
Message-ID: <20250205124235.53285-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044312_851988_A27E017E 
X-CRM114-Status: UNSURE (   8.00  )
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
previous v2->v2:
 * Dropped using _free().
v1-> previous v2:
 * Dropped duplicate mdio_node declaration.
---
 drivers/net/ethernet/actions/owl-emac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
index 115f48b3342c..0a08da799255 100644
--- a/drivers/net/ethernet/actions/owl-emac.c
+++ b/drivers/net/ethernet/actions/owl-emac.c
@@ -1325,15 +1325,10 @@ static int owl_emac_mdio_init(struct net_device *netdev)
 	struct device_node *mdio_node;
 	int ret;
 
-	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
+	mdio_node = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (!mdio_node)
 		return -ENODEV;
 
-	if (!of_device_is_available(mdio_node)) {
-		ret = -ENODEV;
-		goto err_put_node;
-	}
-
 	priv->mii = devm_mdiobus_alloc(dev);
 	if (!priv->mii) {
 		ret = -ENOMEM;
-- 
2.43.0


