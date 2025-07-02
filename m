Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB4EC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 02:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC+e6kjYmznFv6ySWKk0F6tnbU0Os+WvR9hTjZ1SDBs=; b=vu6u2WakqOFMy+QNaK7fw5xjO8
	XVng5LoDkcZIVOeM20lvk3EfhdQjk0fzCM+C3neBAJlmwZ2+51v6K2Lgcaof9iU0XenpgcG/5OUdf
	LO7MFHZEfgyyKpxGw+yhHFhOID2Jlk42tzR+emrD2kkmS4LYh8ubGO+AdDuh9c/4c3t/7YQQEvViY
	4QYGFkR6SoUbHUrudcVYC+Rn8kDfmIquG72fH/2qgZaWSTOWnsR/Y68O/9jamXXEbXKxGCZxWsYLE
	SwG4xON4qbRwvS4c26DPkKo/80+lIjPrQSaBs9Uf3svWK50PbBtgS8K4d6SRyQiIpLeM50yusN1iu
	xGsggMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnW9-000000074zw-0Few;
	Wed, 02 Jul 2025 02:48:13 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWnMK-000000073tt-1TtZ;
	Wed, 02 Jul 2025 02:38:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uWnMF-000000005DT-05g0;
	Wed, 02 Jul 2025 02:37:59 +0000
Date: Wed, 2 Jul 2025 03:37:55 +0100
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
Subject: [PATCH net-next v4 1/3] net: ethernet: mtk_eth_soc: improve support
 for named interrupts
Message-ID: <aeccd00eccb7186d39d2c16292019b3b22ec53b8.1751421358.git.daniel@makrotopia.org>
References: <cover.1751421358.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751421358.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_193804_390766_0C52D740 
X-CRM114-Status: GOOD (  12.41  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v4: unchanged
v3: unchanged
v2: unchanged

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

