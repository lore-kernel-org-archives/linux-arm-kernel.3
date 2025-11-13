Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA6FCD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bv1p2UiR0nSxYC2q33C+km7HuHX9j6P06FARZFxt+hI=; b=muhZ6fclCIP5Wq5QANtDDuD7Ok
	ZNAYN4cgbxLE2mfs/9lFEEWjp1lZVE2V9G5sFWq3k3VOxWVTiS1KrrzVgRNecKBu+7bvrd1LaYziI
	vt2c6DH3kwH/PQdwKSyKLSwwRr5fDH0xXX06HNqghx4ioGqbX5Jw2VOcdADT3pklPRJ0T270yz8q2
	QURHYivpkQOjFuImZjF8FaPcd0xnbja8vqmwN3RbYi31NaYepcChCpZ/cv2axpdqy8BI3rNHwW5Gc
	pvm+qaeeJ3gbo99bRvGFTzDKZ6KFDiPBHE6SWQLKJkgJ99TBzo1q1rWq+umoEC/qYsidkYK9GCWbC
	sN+zUcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLo-0000000ARkF-0rxD;
	Thu, 13 Nov 2025 12:22:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWLb-0000000ARZO-1mJ9;
	Thu, 13 Nov 2025 12:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763036561;
	bh=k8+meZJQprbtExrsSpzTiYBLLVkN3FNkJSPN8CJTMSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhFkFB8wHB0rVMhJiyD/PKAF0WTYTQ2PpYbUPHeHsSQ6hsRDn1hKUfkQhNaICED86
	 kdrdumJVSvl5q5BTsGFBbcQUh3+n7rAWJPnLzzKM4FD3mo/khOdcb3DMOrysHEXsWv
	 9srCkHScQcbq1ho9N2DeMQJnZT03t/rZwmetD30tKYeqtTfgGwFeHNL9OJW7ET91bz
	 fOszy+WD7QZNcCcwJIJ/1xfZV56tYdgl5/A+oP3bYzRGdRRAKu8kni1hvPBog2Aguc
	 1NHCFZXHxgqbJMwq69bMZjtlOH7alMxX0YxzoHbT/+yDShWxwCIcYjPek5q7StqrIb
	 jTW2hhWFQsWyQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D20D17E13C1;
	Thu, 13 Nov 2025 13:22:40 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmaengine@vger.kernel.org
Cc: sean.wang@mediatek.com,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	long.cheng@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 4/8] dmaengine: mediatek: uart-apdma: Get addressing bits from match data
Date: Thu, 13 Nov 2025 13:22:25 +0100
Message-ID: <20251113122229.23998-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
References: <20251113122229.23998-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042243_619918_6E64BD1B 
X-CRM114-Status: GOOD (  13.75  )
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

The only SoC that declares mediatek,dma-33bits in its devicetree
currently is MT6795, which obviously also declares a SoC-specific
compatible string: in preparation for adding new SoCs with 34 bits
addressing, replace the parsing of said vendor property with logic
to get the number of addressing bits from platform data associated
to compatible strings.

While at it, also make the bit_mask variable unsigned and move the
`int rc` declaration as last to beautify the code.

Thanks to the correct declaration of the APDMA node is in all of
the MediaTek device trees that are currently upstream, this commit
brings no functional differences.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index 08e15177427b..b906e59f4c6d 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -468,7 +468,8 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
 }
 
 static const struct of_device_id mtk_uart_apdma_match[] = {
-	{ .compatible = "mediatek,mt6577-uart-dma", },
+	{ .compatible = "mediatek,mt6577-uart-dma", .data = (void *)32 },
+	{ .compatible = "mediatek,mt6795-uart-dma", .data = (void *)33 },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_uart_apdma_match);
@@ -477,9 +478,9 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct mtk_uart_apdmadev *mtkd;
-	int bit_mask = 32, rc;
 	struct mtk_chan *c;
-	unsigned int i;
+	unsigned int bit_mask, i;
+	int rc;
 
 	mtkd = devm_kzalloc(&pdev->dev, sizeof(*mtkd), GFP_KERNEL);
 	if (!mtkd)
@@ -492,12 +493,10 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	if (of_property_read_bool(np, "mediatek,dma-33bits"))
+	bit_mask = (unsigned int)(uintptr_t)of_device_get_match_data(&pdev->dev);
+	if (bit_mask > 32)
 		mtkd->support_33bits = true;
 
-	if (mtkd->support_33bits)
-		bit_mask = 33;
-
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(bit_mask));
 	if (rc)
 		return rc;
-- 
2.51.1


