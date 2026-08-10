Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E113DC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+O3RP4khGolVisKEaJPPZ/5KR4V4I9tZWSXBQpVzFB0=; b=iQmavb63CEtl/98HnOrPysQL8x
	YwF4JjtnRz+XvWkeAYdEgM5z+VNg9R/iJigJos1pY0NXbMNEiIseGpyvKXZOvPKE7oF1aCoBP79ZJ
	GO3S3gpqdkfqp5oB9D3Z5ZWfyqgNlZk8o+wjRh/O90q7/K4ZF9AWhtvpWkvdLmXE7f9a7GOw9G946
	33Yu8ewrcEuWviFb+OKciAdVXUWXZyV0XZk3/x2bs8vdMSfpx1/580mi1bhijdyfYbSQWp1xmdELh
	+OiM9iXOHVrPVGABZOYhZW2BziUVQi/x6qZIyAncjltT0cbxkZY1wXIKVJy+maUx+grOT1HlLkH/3
	BKKlZjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUZ-0000000CbwR-1XMe;
	Mon, 10 Aug 2026 18:12:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUUW-0000000Cbup-3ntC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:12:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2804844a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385572; x=1786990372; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O3RP4khGolVisKEaJPPZ/5KR4V4I9tZWSXBQpVzFB0=;
        b=qCopcWm649/nr+DTZBrl4el1HMS6/dLTS6DAlHjmbIBNRVXQ5foUuZoTXAn5/GzXy8
         R+VAKAjaGfrxRZeNmokv6JS130bBzXrjMGO98R9ybYmp6zZDIgD4nLZwhtAiCzH2MATS
         +i/1/v0leDNev2kWhGr/S7KfUMGBqdQoxS3QUf1/nftyMqLDyl2vvH3BVPax//svMZ6b
         CmmioThFgeidVigDN6U36DVzcF9+7jta/ScuU7rmUM6hQX+v0zXEYrdNUSTKKpG5ng2M
         4dUffB33pO/1Hsd1Mx4jhYTI8uaoFsC9zQf1FAEHwE7D7A1/mm++iLl3JTWca7Cr8cl2
         sepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385572; x=1786990372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+O3RP4khGolVisKEaJPPZ/5KR4V4I9tZWSXBQpVzFB0=;
        b=OynncOoarOXac6mcnf1LMImhfcjW0bZzUfDcWxfH5w5YaDgJk6piWPCCED+ZHnND3C
         u15DGBZfgsF78ns3Xncz12pVlnrfGZ3dOBrpXSksXBeU2GKdj8K6y3Gkm4PbIwWqGd4Y
         D/hYfFcz5k8KNBTi1Ns+J15Mh4g31SKrZja9ZwNSPT6FwPW1mJgbu6lHSXYMd55S154J
         kmjG7cZGMCDfRsxy3ZSq700WcLhIwtkTzrFsV8raeUvJnXsZbVc5F37N0ZD2BNILF/6a
         3k/UMSENE6K1+co+rQfD9iTIwyYE4K3QaKQjlSsWzLKXHrfWRwfbEPHIT90bIl26jF1W
         Wx7g==
X-Forwarded-Encrypted: i=1; AHgh+RrOGLNBMmh2OyNxQh5EZoSf9SoHBIG/Xmq9VRfOJiq4tzxPzNfsSfaVq7ovMlicHj0fAC3T7nZ+O1BZY7bNqv65@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3YZ4GK/r6HVTPx3o+951eItGxdOAxeXsjQuA38OJidyfJt2Uk
	J7CFsDZeG5prafVvCcVNLi4SNIW/lR8BIdOQNmekEVo8N6UMjl8Z9iIt
X-Gm-Gg: AR+sD13c84jlmMcQ8D/SMlYz+Hc3dXHL3Yk5eczZh3n6KcPDi2wktUS0GzceOF8tlWC
	sIJ3FNIwLL3cuZgSXoQ1OtegLREIPNCj3RnM/STKRdpNue97RdOf+ISJebuKDCgz9L6ie7Ntfeb
	Yb/EIJsapkQUMRAcLHv/XJCwKgyfPDePv+scw30oaxkxjMCHkarX5aT0Isf2aJEeKV2Lz2ah/aS
	rTuwhbkq0BbhNtfMwOgjaW5Rp/Makq0zbCtPsqts6CiGyg4VoaKsDQnpW81Skd6j2qzHf1twfDV
	rGGdUf9Wvq8ehDzaq901tJuv+rrRMuhAEXxXoj4WygKsYLjLoklIuJlN05CVrTYTIxXKYweq1KQ
	KZg5gmEMVaqM6SrmEcwWAmKFJM1oFLRtyaRgP7jcJ/jXAkc6SF3n9mK2wgtpmi6O2LR/f403cKg
	tBGYVSm7DgQF5oXMEUm7CcARNlMYKF7+SZA57lDeCwadpObsfDJi56a6PS+SHeXvblWC+WgaUv8
	Q==
X-Received: by 2002:a17:90b:4990:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-392cc6da1e6mr3394837a91.0.1786385571937;
        Mon, 10 Aug 2026 11:12:51 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:51 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 21/34] dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
Date: Mon, 10 Aug 2026 11:09:22 -0700
Message-ID: <56dce14420ecdf8665c0e03b5f3a42004d33eadd.1786384169.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_111252_947141_302EFA38 
X-CRM114-Status: GOOD (  14.07  )
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f6a812e49ddc..e396a35f0e0d 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -207,7 +207,6 @@ struct zynqmp_dma_desc_sw {
  * @dev: The dma device
  * @irq: Channel IRQ
  * @is_dmacoherent: Tells whether dma operations are coherent or not
- * @tasklet: Cleanup work after irq
  * @idle : Channel status;
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
@@ -232,7 +231,6 @@ struct zynqmp_dma_chan {
 	struct device *dev;
 	int irq;
 	bool is_dmacoherent;
-	struct tasklet_struct tasklet;
 	bool idle;
 	size_t desc_size;
 	bool err;
@@ -735,7 +733,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
 	if (status & ZYNQMP_DMA_INT_DONE) {
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -744,7 +742,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		dev_err(chan->dev, "Channel %p has errors\n", chan);
 		ret = IRQ_HANDLED;
 	}
@@ -760,11 +758,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the ZynqMP DMA channel structure
+ * @c: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
+static void zynqmp_dma_do_tasklet(struct dma_chan *c)
 {
-	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct zynqmp_dma_chan *chan = container_of(c,
+			struct zynqmp_dma_chan, common);
 	u32 count;
 	unsigned long irqflags;
 
@@ -815,7 +814,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
 {
 	struct zynqmp_dma_chan *chan = to_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -887,7 +886,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	list_del(&chan->common.device_node);
 }
 
@@ -937,7 +936,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent =  of_property_read_bool(node, "dma-coherent");
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0


