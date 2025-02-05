Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00679C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSKKiDf9lV2pLaZCxyIkP363VASdX2bT57ifNm/GbSY=; b=AR2tMOJuENT/iALorAypXz/P7X
	dXsRyK8egYhJtJn0dsoIFs4S/LMLTPuQY7ozFQrXjKFzx04kE205rSXV+smaV+xiyBDzeAdsOSSof
	wGIrRK9oIx4yeXN231aG4k6lrpWw3iZ5NGcPbVrGNv9Q5tcTp3OtPwydZ3YIJurHdACxJjpnwf6SB
	2fV1OnltshjvhPfXFhvB9eLoqClzLc8LUaoK71BpW0bV73FDKXE9Ph/kOF6eXqti1AmwgngFAcb8y
	T5jnmUQ7PECwKj3yFJbzhmpa1Kr6WbG/EY7hKcB37Wi8IP3Nx0/AFwoMdcALptP6mpmhNp1XmEpkO
	EDb77Lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeo7-00000003Gt0-23Mv;
	Wed, 05 Feb 2025 12:47:07 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfekB-00000003Fgi-0LDp;
	Wed, 05 Feb 2025 12:43:04 +0000
X-CSE-ConnectionGUID: KTNcS2wNQMaUlothZ7KZaQ==
X-CSE-MsgGUID: zctjB0xES0S1VXpVZgYMxQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 21:43:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.225])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 45B7241F86AB;
	Wed,  5 Feb 2025 21:42:56 +0900 (JST)
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
Subject: [PATCH net-next v2 4/7] net: ethernet: mtk-star-emac: Use of_get_available_child_by_name()
Date: Wed,  5 Feb 2025 12:42:24 +0000
Message-ID: <20250205124235.53285-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044303_232030_960402A4 
X-CRM114-Status: UNSURE (   8.52  )
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
mtk_star_mdio_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 *  Dropped using _free()
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 25989c79c92e..76f202d7f055 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1427,15 +1427,10 @@ static int mtk_star_mdio_init(struct net_device *ndev)
 
 	of_node = dev->of_node;
 
-	mdio_node = of_get_child_by_name(of_node, "mdio");
+	mdio_node = of_get_available_child_by_name(of_node, "mdio");
 	if (!mdio_node)
 		return -ENODEV;
 
-	if (!of_device_is_available(mdio_node)) {
-		ret = -ENODEV;
-		goto out_put_node;
-	}
-
 	priv->mii = devm_mdiobus_alloc(dev);
 	if (!priv->mii) {
 		ret = -ENOMEM;
-- 
2.43.0


