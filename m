Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00498C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q/gXoaffigG8SJ50bYXBMyjpep5Cs+E0rWgAJGLqcfQ=; b=0uIrJMl/kKDkVfYm7QXgcVLKA1
	MNED9ohW+vXbpdQm9Nl0c9Tdq2H1K2Qs4m2g4HiYQRFAEEG91oqYaKnfhf4y7xtiTErvGCQEy9mJ6
	dRl871D7MrwtBV1aV4WD3Nd/ovzoLtrefMDrIY2qpW23L2JaMORqtdmBvu0MCP/ISKaIbqkibrrzy
	7Br45Knkk/LXWcajl4i3YYVIJ494FVVHdp3sSGBmBiARqxzkrL33OjP+FxzVWkm5aOszpSDSATg8M
	VF/3yFMlxcwh6lMpheVmpHiUU20h6CoXl4io2MRk1/pKBTkkKL87KsDWiHXwmjuuTBv0rZM7mG/S0
	dnHdrzbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6eR-0000000Gx5p-1T4B;
	Fri, 13 Jun 2025 15:49:07 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5ey-0000000Gkff-0rD6;
	Fri, 13 Jun 2025 14:45:38 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id F0118605C3;
	Fri, 13 Jun 2025 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749825932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q/gXoaffigG8SJ50bYXBMyjpep5Cs+E0rWgAJGLqcfQ=;
	b=l2XbA7APatv4/BRBtKwKXxKfXpMUu0sK25tuuA3s32t9LHfHoLV0uVxp8xGpeea7RQC2Ii
	mEopG5gUanKERS1gmIhaEYnyOvXkxeFSBGZowO5b5xxQfRPM8S3w+48yfrv9/s8yukrVn4
	VXTseTVVXw2mGIBVdCpj/BZVXe9G9HI=
Received: from frank-u24.. (fttx-pool-217.61.151.84.bambit.de [217.61.151.84])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id D3E0E1226D6;
	Fri, 13 Jun 2025 14:45:31 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: 
Cc: Frank Wunderlich <frank-w@public-files.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	daniel@makrotopia.org
Subject: [net-next v1] net: ethernet: mtk_eth_soc: support named IRQs
Date: Fri, 13 Jun 2025 16:45:23 +0200
Message-ID: <20250613144525.53305-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074536_411296_32A0A315 
X-CRM114-Status: GOOD (  12.24  )
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

Add named interrupts and keep index based fallback for exiting devicetrees.

Currently only rx and tx IRQs are defined to be used with mt7988, but
later extended with RSS/LRO support.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 24 +++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b76d35069887..fcec5f95685e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -5106,17 +5106,23 @@ static int mtk_probe(struct platform_device *pdev)
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
+	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
+	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
+	if (eth->irq[1] < 0 || eth->irq[2] < 0) {
+		for (i = 0; i < 3; i++) {
+			if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
+				eth->irq[i] = eth->irq[0];
+			else
+				eth->irq[i] = platform_get_irq(pdev, i);
+
+			if (eth->irq[i] < 0) {
+				dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
+				err = -ENXIO;
+				goto err_wed_exit;
+			}
 		}
 	}
+
 	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
 		eth->clks[i] = devm_clk_get(eth->dev,
 					    mtk_clks_source_name[i]);
-- 
2.43.0


