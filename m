Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD55DC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ub791A4BOmeMS2MciMpwB8pjEJE56jW4Bbfb4aufBFQ=; b=yRGOjvsHsyCzcgn4cES9HdEmbA
	w9gw6LfQDqW3HQ4DDOeB7q/nmnVaQdkoq/E5CnMwx3tZ+54COjDiTEmnEDrhLFz+LVMlT+LCL6+FT
	9vWOpSr1yvdxoVgtuqkSihZHzEJVk9kXMBba4PrOi/V6ibiCQoH63ELO03sHf7vVTx5/pO/gdXr40
	DpSvJMCWrEtACoyDKpyDxE/M3k0f4MuhSnnp9bqYOxQEYBTx2TpUGIOEX+mQjajPCNjQbp3s3pKHp
	Llne3++L5y17WU3UkzBG2EqvGk2b8OUyxUB0Ivlb0VS42SqffuUG3CP7GZGzAlZdYoDEPWO0RfPym
	0NaDUNXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0eMd-00000007hNY-0QhI;
	Sun, 30 Aug 2026 12:10:19 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0eMZ-00000007hMx-0Hyj;
	Sun, 30 Aug 2026 12:10:17 +0000
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4bd6507d3;
	Sun, 30 Aug 2026 20:10:01 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	runyu.xiao@seu.edu.cn,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: [PATCH v2] dmaengine: mediatek: initialize tasklets before requesting IRQs
Date: Sun, 30 Aug 2026 20:09:55 +0800
Message-Id: <20260830120955.2638359-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260830060422.2204459-1-runyu.xiao@seu.edu.cn>
References: <20260830060422.2204459-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa05293a01a03a1kunm00237a53fe57a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGRkaVhgaSEgeQxlKGUsYGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=g4PcaCLHNFM/ofzTYLkAFaUzdqz5oSmW7Y5jjy+t+ZWUo4lJmovp7c42xQxrbNHyaKJUfEm/MPFT+prv4tt2MJeMVY0eQhKaJ0hLABBXsePs/2DV5ulud0fkp+H4Eg8TlHQoKcN4jrc0OpQ/DmmJapceIHSbuWiFYPdegKzpmEA=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ub791A4BOmeMS2MciMpwB8pjEJE56jW4Bbfb4aufBFQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_051015_800941_8B87A239 
X-CRM114-Status: GOOD (  14.90  )
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

The CQDMA probe registers each physical-channel IRQ before initializing
the tasklet scheduled by the interrupt handler. A pending interrupt can
access an uninitialized physical channel or schedule an uninitialized
tasklet while probe is still running.

Initialize all physical channels, including their tasklets, before
registering any IRQ.

On probe failure, unwind every requested IRQ and initialized tasklet
before devres releases the physical-channel and virtual-channel objects.
Also release the OF DMA controller when hardware initialization fails
after registration.

Fixes: b1f01e48df5a ("dmaengine: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260830060422.2204459-1-runyu.xiao@seu.edu.cn/
Assisted-by: Codex:GPT-5
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

---
v2:
- Initialize all physical channels before registering any IRQ, since the
  interrupt handler scans all channels.
- Disable requested IRQs before killing physical- and virtual-channel
  tasklets, then free the IRQs on every probe error path before devres
  releases channel state.
- Release the OF DMA controller when hardware initialization fails.
---
 drivers/dma/mediatek/mtk-cqdma.c | 59 +++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 80791e30a..741b6325c 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -749,7 +749,7 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 	struct mtk_cqdma_vchan *vc;
 	struct dma_device *dd;
 	int err;
-	u32 i;
+	u32 i, nr_tasklets = 0, nr_irqs = 0;
 
 	cqdma = devm_kzalloc(&pdev->dev, sizeof(*cqdma), GFP_KERNEL);
 	if (!cqdma)
@@ -805,41 +805,54 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 	if (!cqdma->pc)
 		return -ENOMEM;
 
-	/* initialization for PCs */
+	/* Initialize all PCs before registering any IRQ. */
 	for (i = 0; i < cqdma->dma_channels; ++i) {
 		cqdma->pc[i] = devm_kcalloc(&pdev->dev, 1,
 					    sizeof(**cqdma->pc), GFP_KERNEL);
-		if (!cqdma->pc[i])
-			return -ENOMEM;
+		if (!cqdma->pc[i]) {
+			err = -ENOMEM;
+			goto err_tasklets;
+		}
 
 		INIT_LIST_HEAD(&cqdma->pc[i]->queue);
 		spin_lock_init(&cqdma->pc[i]->lock);
 		refcount_set(&cqdma->pc[i]->refcnt, 0);
+		tasklet_setup(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb);
+		nr_tasklets++;
 		cqdma->pc[i]->base = devm_platform_ioremap_resource(pdev, i);
-		if (IS_ERR(cqdma->pc[i]->base))
-			return PTR_ERR(cqdma->pc[i]->base);
+		if (IS_ERR(cqdma->pc[i]->base)) {
+			err = PTR_ERR(cqdma->pc[i]->base);
+			goto err_tasklets;
+		}
 
 		/* allocate IRQ resource */
 		err = platform_get_irq(pdev, i);
 		if (err < 0)
-			return err;
+			goto err_tasklets;
 		cqdma->pc[i]->irq = err;
+	}
 
+	/* Register IRQs only after all PCs are initialized. */
+	for (i = 0; i < cqdma->dma_channels; ++i) {
 		err = devm_request_irq(&pdev->dev, cqdma->pc[i]->irq,
 				       mtk_cqdma_irq, 0, dev_name(&pdev->dev),
 				       cqdma);
 		if (err) {
 			dev_err(&pdev->dev,
 				"request_irq failed with err %d\n", err);
-			return -EINVAL;
+			err = -EINVAL;
+			goto err_tasklets;
 		}
+		nr_irqs++;
 	}
 
 	/* allocate resource for VCs */
 	cqdma->vc = devm_kcalloc(&pdev->dev, cqdma->dma_requests,
 				 sizeof(*cqdma->vc), GFP_KERNEL);
-	if (!cqdma->vc)
-		return -ENOMEM;
+	if (!cqdma->vc) {
+		err = -ENOMEM;
+		goto err_tasklets;
+	}
 
 	for (i = 0; i < cqdma->dma_requests; i++) {
 		vc = &cqdma->vc[i];
@@ -850,7 +863,7 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 
 	err = dma_async_device_register(dd);
 	if (err)
-		return err;
+		goto err_tasklets;
 
 	err = of_dma_controller_register(pdev->dev.of_node,
 					 of_dma_xlate_by_chan_id, cqdma);
@@ -864,22 +877,36 @@ static int mtk_cqdma_probe(struct platform_device *pdev)
 	if (err) {
 		dev_err(&pdev->dev,
 			"MediaTek CQDMA HW initialization failed %d\n", err);
-		goto err_unregister;
+		goto err_of_unregister;
 	}
 
 	platform_set_drvdata(pdev, cqdma);
 
-	/* initialize tasklet for each PC */
-	for (i = 0; i < cqdma->dma_channels; ++i)
-		tasklet_setup(&cqdma->pc[i]->tasklet, mtk_cqdma_tasklet_cb);
-
 	dev_info(&pdev->dev, "MediaTek CQDMA driver registered\n");
 
 	return 0;
 
+err_of_unregister:
+	of_dma_controller_free(pdev->dev.of_node);
+
 err_unregister:
 	dma_async_device_unregister(dd);
 
+err_tasklets:
+	/* Prevent IRQ handlers from accessing channel state during cleanup. */
+	for (i = 0; i < nr_irqs; i++)
+		disable_irq(cqdma->pc[i]->irq);
+
+	for (i = 0; i < nr_tasklets; i++)
+		tasklet_kill(&cqdma->pc[i]->tasklet);
+
+	if (cqdma->vc)
+		for (i = 0; i < cqdma->dma_requests; i++)
+			tasklet_kill(&cqdma->vc[i].vc.task);
+
+	for (i = 0; i < nr_irqs; i++)
+		devm_free_irq(&pdev->dev, cqdma->pc[i]->irq, cqdma);
+
 	return err;
 }
 
-- 
2.34.1


