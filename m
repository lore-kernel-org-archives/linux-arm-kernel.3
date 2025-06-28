Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C457C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVDFT+oyTZ1rxiHMigFwRzNpB17g/Z0lUTxlQPScSgQ=; b=uyk9GY0efFniZMYrGLOI1v6h0W
	lM1EHfou8+LIHy7ynzWrVHZiqgs71Q1T5PU2dNEaw4x3KXrcPHZsfNw2C5oqFQ1i/OzmzIhxgsg7H
	rt1YUiYBbBhyAVKY2xza9UnzG8lSSp3hrqA/GlliiY5JVFJggMo20PDR8PbqdKq4npbuFQpt9llWo
	pBJ62oftz52fI4x7BSJiJGKc9WoImae2DKZjlCGVapNdlfY3tF9qAGNHYPVDnmIrT3jn/pEjkPJGm
	euMs9VFTtAEhtAk4/2Hw30bpbyIrSlgse/Qni9Uzyt1CCQy0pQG45T2NU1bh+/U9dHwITck0M92do
	nouN2duw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVKTO-0000000G97l-1u2I;
	Sat, 28 Jun 2025 01:35:18 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVKOn-0000000G8Zg-1hEc;
	Sat, 28 Jun 2025 01:30:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uVKOg-000000004QF-1ynj;
	Sat, 28 Jun 2025 01:30:26 +0000
Date: Sat, 28 Jun 2025 02:30:23 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>,
	Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>,
	Bo-Cun Chen <bc-bocun.chen@mediatek.com>,
	Sky Huang <skylake.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net/next 1/3] net: ethernet: mtk_eth_soc: improve support for
 named interrupts
Message-ID: <d1b744685a464c5cd353107555faca6cd965d158.1751072868.git.daniel@makrotopia.org>
References: <cover.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_183033_446708_B92F407C 
X-CRM114-Status: GOOD (  11.84  )
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

Use platform_get_irq_byname_optional() to avoid outputting error
messages when using legacy device trees which rely identifying
interrupts only by index. Instead, output a warning notifying the user
to update their device tree.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index f8a907747db4..8f55069441f4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3341,17 +3341,22 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
 	int i;
 
 	/* future SoCs beginning with MT7988 should use named IRQs in dts */
-	eth->irq[MTK_FE_IRQ_TX] = platform_get_irq_byname(pdev, "fe1");
-	eth->irq[MTK_FE_IRQ_RX] = platform_get_irq_byname(pdev, "fe2");
+	eth->irq[MTK_FE_IRQ_TX] = platform_get_irq_byname_optional(pdev, "fe1");
+	eth->irq[MTK_FE_IRQ_RX] = platform_get_irq_byname_optional(pdev, "fe2");
 	if (eth->irq[MTK_FE_IRQ_TX] >= 0 && eth->irq[MTK_FE_IRQ_RX] >= 0)
 		return 0;
 
-	/* only use legacy mode if platform_get_irq_byname returned -ENXIO */
+	/* only use legacy mode if platform_get_irq_byname_optional returned -ENXIO */
 	if (eth->irq[MTK_FE_IRQ_TX] != -ENXIO)
-		return eth->irq[MTK_FE_IRQ_TX];
+		return dev_err_probe(&pdev->dev, eth->irq[MTK_FE_IRQ_TX],
+				     "Error requesting FE TX IRQ\n");
 
 	if (eth->irq[MTK_FE_IRQ_RX] != -ENXIO)
-		return eth->irq[MTK_FE_IRQ_RX];
+		return dev_err_probe(&pdev->dev, eth->irq[MTK_FE_IRQ_RX],
+				     "Error requesting FE RX IRQ\n");
+
+	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT))
+		dev_warn(&pdev->dev, "legacy DT: missing interrupt-names.");
 
 	/* legacy way:
 	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken
-- 
2.50.0

