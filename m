Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CFDC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbSs2LOWzdNenXX0oELvI/bNNE458C+NZ9lgVj5hXDQ=; b=2V/9dJ4lNCRoN+iVy8Mm+CxBoJ
	bgr8AhBvnJPBG/+51Mm2uD12ffeJUzxW289yiC9E3H/rnCrkHI9tajJwBVTOfh1mWR7qjBuc70lKG
	OlXFdxTzGY22LSUCDEyVHJ/52s6iqGSUolUybyp0q6cNZeiZoT9IyPvns3S97cIuVH+ZyX81iTUoM
	Jd4EPTFe/2Ka28fJEzBTl3MkQHtFtJ4sgzaLFWoWXqoKnEu33hSKomqQ4IZDZiGveNcSzxH3qt7q0
	27bWMWaebNB6LyNTLEFVAibiZV7dlhWeCOsJk/d4gVcK76BQwUGCWpPSjgwOCy0Fyn6idmY5VegGq
	lbAwHP9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeqq-00000003HM2-0BjM;
	Wed, 05 Feb 2025 12:49:56 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfekM-00000003FjP-1KV5;
	Wed, 05 Feb 2025 12:43:15 +0000
X-CSE-ConnectionGUID: kZEjbmkXQmKuWVWpCE4ldQ==
X-CSE-MsgGUID: heLXhqTjSwWnRtR0B4PM8w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:43:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AC44F41F86B5;
	Wed,  5 Feb 2025 21:43:02 +0900 (JST)
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
Subject: [PATCH net-next v2 5/7] net: ethernet: mtk_eth_soc: Use of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:25 +0000
Message-ID: <20250205124235.53285-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044314_464330_98C9F0C7 
X-CRM114-Status: UNSURE (   8.73  )
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
mtk_mdio_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped using _free().
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 53485142938c..0ad965ced5ef 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -830,17 +830,12 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	int ret;
 	u32 val;
 
-	mii_np = of_get_child_by_name(eth->dev->of_node, "mdio-bus");
+	mii_np = of_get_available_child_by_name(eth->dev->of_node, "mdio-bus");
 	if (!mii_np) {
 		dev_err(eth->dev, "no %s child node found", "mdio-bus");
 		return -ENODEV;
 	}
 
-	if (!of_device_is_available(mii_np)) {
-		ret = -ENODEV;
-		goto err_put_node;
-	}
-
 	eth->mii_bus = devm_mdiobus_alloc(eth->dev);
 	if (!eth->mii_bus) {
 		ret = -ENOMEM;
-- 
2.43.0


