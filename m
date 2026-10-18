Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4519CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 04:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3i/yK5rC1k+fn8RMtLaWFdcUoFsMUXf2CgVoxMe+YA=; b=FvefT+zWIsBX2VlbkdIy6v9V3p
	zvRKfWeAoYa+i9AVTumVYd9FTip1fuIH4lL6f5W7YBrNppUN67LWcHKlC8ezCR3eQoY1TfEHKihti
	9lXciH0I9SWAxREW86ND4vEfE/R4dGEAuZPlGh0wzyWcn5k0L9EuEBU8/5y2iFfblUZeuUh0S4VBF
	6B6Jf1ydXvXhSL1v13Dqe7IcfQ5dAZTDsl52B2w+wi6b02LkM+OcUC1kCHMbU3lvQDD2BuVO1rCjq
	0vbaiVEa7ctbvhbPGIRjj0dwQjknxy99vZkDYisiXKUxpHGBYFlQ0m/8PavMmz3Jr3GfCFgR0bon1
	mbNvlIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIICV-00000005VKI-1SGw;
	Sun, 18 Oct 2026 04:08:47 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIICR-00000005VJc-3vrM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 04:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=O3
	i/yK5rC1k+fn8RMtLaWFdcUoFsMUXf2CgVoxMe+YA=; b=U/0ItJJF8jyCmxeXjX
	895pgpe7GzBj9dqLcARE+WvguFtC2NnG+XIDy3fDvd9bX3nbUzTvvnzEwo95iaEa
	gv8nD5YNe+LbyNjoIUm40h0R6Mbbgg1olS+nMh3iy1LXJRt53JEEAoN7COAbJOzd
	UrhUNzZLjkqr7P8JXbGTNRICM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3n6n9RdRqdUaGAw--.28247S8;
	Sun, 18 Oct 2026 12:07:34 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 6/7] dmaengine: mxs-dma: synchronize tasklet when freeing a channel
Date: Sun, 18 Oct 2026 12:07:22 +0800
Message-Id: <20261018040724.534641-7-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261018040724.534641-1-yaojiale02@163.com>
References: <20261018040724.534641-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3n6n9RdRqdUaGAw--.28247S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW8ZFyxKr18tw4kuF15urg_yoWDAwb_Wa
	10gryfXrn8ZFZ0yw12yrs8ZrWxta4DWF95Wrn2qayaqa43J3ZagrsFvr98C34vga15Za98
	Zwn8JrWxGrZrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuuWL5UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wZinGrURgbICgAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_210844_374153_BA45DAFD 
X-CRM114-Status: UNSURE (   8.33  )
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

The DMA interrupt handler schedules a per-channel tasklet to invoke the
completion callback. Releasing the IRQ does not drain a tasklet that was
already queued, so the callback can run after its client state has been
released.

Kill the tasklet after freeing the IRQ and before releasing the channel
command storage and clock.

Fixes: a580b8c5429a ("dmaengine: mxs-dma: add dma support for i.MX23/28")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/mxs-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..9e85ba45f0fa 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -442,6 +442,7 @@ static void mxs_dma_free_chan_resources(struct dma_chan *chan)
 	mxs_dma_disable_chan(chan);
 
 	free_irq(mxs_chan->chan_irq, mxs_dma);
+	tasklet_kill(&mxs_chan->tasklet);
 
 	dma_free_coherent(mxs_dma->dma_device.dev, CCW_BLOCK_SIZE,
 			mxs_chan->ccw, mxs_chan->ccw_phys);
-- 
2.34.1


