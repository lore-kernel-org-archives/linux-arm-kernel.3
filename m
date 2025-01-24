Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD8FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xS8sfpyKxEecLfJgThWHKU3Ix8NabgEGiuP5uDP/ji4=; b=My4z5FvELlHVdeb05sz6OXs2fN
	VPetYwoTpNVKUlwDAiB2aMw+1/WbSUe6u6+W9L+Otnv8LrnrzI8OjGR6BqlmXAhTHtUvrc9mU4eq3
	fV7JbWZI1lc9jT47bfKwXd37v/BXLZc34aClmlEkjbt4bBPq4Rp8JU6OfJbfr2v8bf3oUWqmKHsnV
	NZCr68WWSLiGSWbLOQEF1YAbDxEXLnM1YsH75fCNdtceIOWBhetyvPiCOmcBkbvLYJlxWMTh8F5Ep
	dhYEh+x2l8Ui5AOgm6t5iPh6Ysvcj40RqPBcRZa/8tB+sura6+cInT6Si0Pme0usQlahBQgpR5xhp
	DMXplvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHUv-0000000EX4x-07O7;
	Fri, 24 Jan 2025 11:05:13 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHSc-0000000EWlk-0YFG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 11:02:52 +0000
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 0BC1640755EB;
	Fri, 24 Jan 2025 11:02:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 0BC1640755EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1737716567;
	bh=xS8sfpyKxEecLfJgThWHKU3Ix8NabgEGiuP5uDP/ji4=;
	h=From:To:Cc:Subject:Date:From;
	b=audw0OhgKV189hBmIGwdsFiT6XnENZxvdWhS8yD+r0GxiqxQ8Gz0uH7D/uGRH/QRg
	 wwlUwtw4XIZrWLSNm1acFni0WyisihC2bUvZqCb8Efj59Lvn+qb65yg/kaF+b3Alj+
	 6Ef+S+FmRjiBS15zhgKYkH9CbAP+fXTPhHJ2cIeY=
From: Vitalii Mordan <mordan@ispras.ru>
To: Vinod Koul <vkoul@kernel.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>
Subject: [PATCH] dma: milbeaut-hdmac: fix call balance of mdev->clk handling routines
Date: Fri, 24 Jan 2025 14:02:40 +0300
Message-Id: <20250124110240.1285500-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_030250_355657_E32DBBB4 
X-CRM114-Status: GOOD (  15.04  )
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

If the clock mdev->clk was enabled in milbeaut_hdmac_probe(), it should be
disabled in any path. If dmaengine_terminate_sync() returns an error in
milbeaut_hdmac_remove(), the clock mdev->clk will not be disabled.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for mdev->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: 6c3214e698e4 ("dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/dma/milbeaut-hdmac.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
index 9a5ec247ed6d..cc70928602af 100644
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -476,16 +476,12 @@ static int milbeaut_hdmac_probe(struct platform_device *pdev)
 	if (IS_ERR(mdev->reg_base))
 		return PTR_ERR(mdev->reg_base);
 
-	mdev->clk = devm_clk_get(dev, NULL);
+	mdev->clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(mdev->clk)) {
-		dev_err(dev, "failed to get clock\n");
+		dev_err(dev, "failed to get and enable clock\n");
 		return PTR_ERR(mdev->clk);
 	}
 
-	ret = clk_prepare_enable(mdev->clk);
-	if (ret)
-		return ret;
-
 	ddev = &mdev->ddev;
 	ddev->dev = dev;
 	dma_cap_set(DMA_SLAVE, ddev->cap_mask);
@@ -507,12 +503,12 @@ static int milbeaut_hdmac_probe(struct platform_device *pdev)
 	for (i = 0; i < nr_chans; i++) {
 		ret = milbeaut_hdmac_chan_init(pdev, mdev, i);
 		if (ret)
-			goto disable_clk;
+			return ret;
 	}
 
 	ret = dma_async_device_register(ddev);
 	if (ret)
-		goto disable_clk;
+		return ret;
 
 	ret = of_dma_controller_register(dev->of_node,
 					 milbeaut_hdmac_xlate, mdev);
@@ -525,8 +521,6 @@ static int milbeaut_hdmac_probe(struct platform_device *pdev)
 
 unregister_dmac:
 	dma_async_device_unregister(ddev);
-disable_clk:
-	clk_disable_unprepare(mdev->clk);
 
 	return ret;
 }
@@ -560,7 +554,6 @@ static void milbeaut_hdmac_remove(struct platform_device *pdev)
 
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&mdev->ddev);
-	clk_disable_unprepare(mdev->clk);
 }
 
 static const struct of_device_id milbeaut_hdmac_match[] = {
-- 
2.25.1


