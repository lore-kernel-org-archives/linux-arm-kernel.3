Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EECC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=trroXU93EYK0HpRYK6NyRWOhBYcZDpDonMFpc3M9xZg=; b=KCENDsZwqe2pGgIw8Uhs+vl5BA
	+heyw0Jyb9daWdMmQ6BlQ5Q2j2pKz3aDY7kNhdeY5gxBiEnfrVQXKez14JeoW3onRsZpAez0TWmHz
	u0Vuxm3i7NDh0VIWQ1Yj5cmM79OyqRD9X7TH25LvNY2WylFKmqu9H9z7xxC+CenTUwbwhtJjOco0O
	XXNHItBDaimWia0jRLW5NWhDpQqidK/xjXRoxqqS0qSX52BqLkMHLYJLBqkO/mzjPsu9c9pIAW2CB
	7nOPkmcISZPh9kZUVVGLjbgEHcEB6KRP6Sze/EWqoWfy/flx2hiHs8YTZcZReLKGj/OsIXtGk7EOi
	/b4blvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuEP-0000000AVog-0Wiu;
	Wed, 18 Jun 2025 14:57:41 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsVo-0000000AENH-3BMx;
	Wed, 18 Jun 2025 13:07:34 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 8FE9C60254;
	Wed, 18 Jun 2025 13:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750252050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trroXU93EYK0HpRYK6NyRWOhBYcZDpDonMFpc3M9xZg=;
	b=Y+zLjhmVUMhcz8Tz01Lw9TxB7+n2a23EDXs3CCikCe/CiRy9FHCs8otDeu1qNJX3QN53/z
	hs2uFTs4Tr2C/nWP7VT/Lw1askSqXJYycdqzFdAgxhs5ObEAcyWIpwSEcCjxV8kkkeqTQn
	lNHf5Ko61dZfd2YiJRrgZkMJzbtt2AM=
Received: from frank-u24.. (fttx-pool-80.245.76.73.bambit.de [80.245.76.73])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 54D7B122703;
	Wed, 18 Jun 2025 13:07:30 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
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
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Horman <horms@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	arinc.unal@arinc9.com
Subject: [net-next v5 1/3] net: ethernet: mtk_eth_soc: support named IRQs
Date: Wed, 18 Jun 2025 15:07:12 +0200
Message-ID: <20250618130717.75839-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618130717.75839-1-linux@fw-web.de>
References: <20250618130717.75839-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_060732_963851_03AE32D4 
X-CRM114-Status: GOOD (  20.60  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add named interrupts and keep index based fallback for existing
devicetrees.

Currently only rx and tx IRQs are defined to be used with mt7988, but
later extended with RSS/LRO support.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Simon Horman <horms@kernel.org>
---
v5:
- fix typo in description
- add comments from previous patch #3 with changes suggested by simon

v2:
- move irqs loading part into own helper function
- reduce indentation
- place mtk_get_irqs helper before the irq_handler (note for simon)
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 46 ++++++++++++++++-----
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b76d35069887..39b673ed7495 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3337,6 +3337,37 @@ static void mtk_tx_timeout(struct net_device *dev, unsigned int txqueue)
 	schedule_work(&eth->pending_work);
 }
 
+static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
+{
+	int i;
+
+	/* future SoCs beginning with MT7988 should use named IRQs in dts */
+	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
+	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
+	if (eth->irq[1] >= 0 && eth->irq[2] >= 0)
+		return 0;
+
+	/* legacy way:
+	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken
+	 * from devicetree and used for both RX and TX - it is shared.
+	 * On SoCs with non-shared IRQs the first entry is not used,
+	 * the second is for TX, and the third is for RX.
+	 */
+	for (i = 0; i < 3; i++) {
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
+			eth->irq[i] = eth->irq[0];
+		else
+			eth->irq[i] = platform_get_irq(pdev, i);
+
+		if (eth->irq[i] < 0) {
+			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
+			return -ENXIO;
+		}
+	}
+
+	return 0;
+}
+
 static irqreturn_t mtk_handle_irq_rx(int irq, void *_eth)
 {
 	struct mtk_eth *eth = _eth;
@@ -5106,17 +5137,10 @@ static int mtk_probe(struct platform_device *pdev)
 		}
 	}
 
-	for (i = 0; i < 3; i++) {
-		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
-			eth->irq[i] = eth->irq[0];
-		else
-			eth->irq[i] = platform_get_irq(pdev, i);
-		if (eth->irq[i] < 0) {
-			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
-			err = -ENXIO;
-			goto err_wed_exit;
-		}
-	}
+	err = mtk_get_irqs(pdev, eth);
+	if (err)
+		goto err_wed_exit;
+
 	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
 		eth->clks[i] = devm_clk_get(eth->dev,
 					    mtk_clks_source_name[i]);
-- 
2.43.0


