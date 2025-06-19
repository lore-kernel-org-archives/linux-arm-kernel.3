Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1908DC71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:From:To:Cc:
	Message-Id:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNmGhx6R0M+QxE1a3W/1Hlcq5xEj9nhVFRfzWvErvmQ=; b=EBPUFmTR4Ky/yoaVqV27mO6m2s
	bGGbH0F4Bdf4Q7EVOlCYnISW0y6I4TTDBu0Y+M8kPAwv02hg9U1Q9GH/LZnFUfbAUAcJh3nb7c+Lx
	l1b65pL+Fzy29FUUCJua7IhZ09OrZHjzuhTHbUct7PaiFxeP5LfCLlxltyL1ViyU6AuZgLAeNIrFx
	jknynsZ32kRIVh2EJRnyok66qUH7zAqEhThGgllikULw9NJzKkvO7oBVTUySmo5I8CSffk6xHxa62
	UqPUzEVY73kajMc1GrHSKR4g1/JzyoECnDd0Xh4LZQwdJSy+wwaCt0zBJsr3af2q+7sW5VQBAC45r
	h16AxUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9bN-0000000CHgb-1bXd;
	Thu, 19 Jun 2025 07:22:25 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS987-0000000CDOD-3bir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 06:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=Subject:Date:From:To:Cc:Message-Id:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=eNmGhx6R0M+QxE1a3W/1Hlcq5xEj9nhVFRfzWvErvmQ=; b=QxCNY5sLajg3zF6IR5NcXZxP4L
	aIiEzqPLqA0XCcl8t0RDZkM0nwafrHNkVT7CKf2Q7gZIwIFxGq+eMlx7jSXNk4OlBLxsiQ5woEyaZ
	qxu1R6L8kthAzg1i/2xDEp5r8jYpeIDEi79KHiUrAxQws/ELtKTYtVo6kfedT7XLpMTT6Mzc1WiBo
	Nx+fUvLwFZbTH8ng6//9Kgnm85NjXjeqOCwQlfhKLaaInVJrizkeNO8+3H9P7jx1LmD15hawpZHSy
	i0KxpYwImnLTRE7pNWviaI76Hdwrq58AzXdxoLvOvs4p8rgVpUf66LYTTnNb2oNkKKPcuh1JhSIUk
	4SxjLI0g==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uS97m-000BbN-0a;
	Thu, 19 Jun 2025 08:51:50 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1uS97k-00026S-3C;
	Thu, 19 Jun 2025 08:51:49 +0200
Message-Id: <DAQB7EU7UXR3.Z07Q6JQ1V67Y@folker-schwesinger.de>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "Marek Vasut" <marex@denx.de>, "Radhey
 Shyam Pandey" <radhey.shyam.pandey@amd.com>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
Date: Thu, 19 Jun 2025 08:32:58 +0200
Subject: [PATCH v2] dmaengine: xilinx_dma: Support descriptor setup from
 dma_vecs
X-Virus-Scanned: Clear (ClamAV 1.0.7/27673/Wed Jun 18 11:48:55 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_235212_189642_AE62F542 
X-CRM114-Status: GOOD (  16.48  )
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

The DMAEngine provides an interface for obtaining DMA transaction
descriptors from an array of scatter gather buffers represented by
struct dma_vec. This interface is used in the DMABUF API of the IIO
framework [1].
To enable DMABUF support through the IIO framework for the Xilinx DMA,
implement callback .device_prep_peripheral_dma_vec() of struct
dma_device in the driver.

[1]: https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/iio/buffer/industrialio-buffer-dmaengine.c#L104

Signed-off-by: Folker Schwesinger <dev@folker-schwesinger.de>

---
Changes in v2:
- Improve commit message to include reasoning behind the change.
- Rebase onto v6.16-rc1.
- Link to v1: https://lore.kernel.org/dmaengine/D8TV2MP99NTE.1842MMA04VB9N@folker-schwesinger.de/
---
 drivers/dma/xilinx/xilinx_dma.c | 94 +++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index a34d8f0ceed8..fabff602065f 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2172,6 +2172,99 @@ xilinx_cdma_prep_memcpy(struct dma_chan *dchan, dma_addr_t dma_dst,
 	return NULL;
 }
 
+/**
+ * xilinx_dma_prep_peripheral_dma_vec - prepare descriptors for a DMA_SLAVE
+ *	transaction from DMA vectors
+ * @dchan: DMA channel
+ * @vecs: Array of DMA vectors that should be transferred
+ * @nb: number of entries in @vecs
+ * @direction: DMA direction
+ * @flags: transfer ack flags
+ *
+ * Return: Async transaction descriptor on success and NULL on failure
+ */
+static struct dma_async_tx_descriptor *xilinx_dma_prep_peripheral_dma_vec(
+	struct dma_chan *dchan, const struct dma_vec *vecs, size_t nb,
+	enum dma_transfer_direction direction, unsigned long flags)
+{
+	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
+	struct xilinx_dma_tx_descriptor *desc;
+	struct xilinx_axidma_tx_segment *segment, *head, *prev = NULL;
+	size_t copy;
+	size_t sg_used;
+	unsigned int i;
+
+	if (!is_slave_direction(direction) || direction != chan->direction)
+		return NULL;
+
+	desc = xilinx_dma_alloc_tx_descriptor(chan);
+	if (!desc)
+		return NULL;
+
+	dma_async_tx_descriptor_init(&desc->async_tx, &chan->common);
+	desc->async_tx.tx_submit = xilinx_dma_tx_submit;
+
+	/* Build transactions using information from DMA vectors */
+	for (i = 0; i < nb; i++) {
+		sg_used = 0;
+
+		/* Loop until the entire dma_vec entry is used */
+		while (sg_used < vecs[i].len) {
+			struct xilinx_axidma_desc_hw *hw;
+
+			/* Get a free segment */
+			segment = xilinx_axidma_alloc_tx_segment(chan);
+			if (!segment)
+				goto error;
+
+			/*
+			 * Calculate the maximum number of bytes to transfer,
+			 * making sure it is less than the hw limit
+			 */
+			copy = xilinx_dma_calc_copysize(chan, vecs[i].len,
+					sg_used);
+			hw = &segment->hw;
+
+			/* Fill in the descriptor */
+			xilinx_axidma_buf(chan, hw, vecs[i].addr, sg_used, 0);
+			hw->control = copy;
+
+			if (prev)
+				prev->hw.next_desc = segment->phys;
+
+			prev = segment;
+			sg_used += copy;
+
+			/*
+			 * Insert the segment into the descriptor segments
+			 * list.
+			 */
+			list_add_tail(&segment->node, &desc->segments);
+		}
+	}
+
+	head = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment, node);
+	desc->async_tx.phys = head->phys;
+
+	/* For the last DMA_MEM_TO_DEV transfer, set EOP */
+	if (chan->direction == DMA_MEM_TO_DEV) {
+		segment->hw.control |= XILINX_DMA_BD_SOP;
+		segment = list_last_entry(&desc->segments,
+					  struct xilinx_axidma_tx_segment,
+					  node);
+		segment->hw.control |= XILINX_DMA_BD_EOP;
+	}
+
+	if (chan->xdev->has_axistream_connected)
+		desc->async_tx.metadata_ops = &xilinx_dma_metadata_ops;
+
+	return &desc->async_tx;
+
+error:
+	xilinx_dma_free_tx_descriptor(chan, desc);
+	return NULL;
+}
+
 /**
  * xilinx_dma_prep_slave_sg - prepare descriptors for a DMA_SLAVE transaction
  * @dchan: DMA channel
@@ -3180,6 +3273,7 @@ static int xilinx_dma_probe(struct platform_device *pdev)
 	xdev->common.device_config = xilinx_dma_device_config;
 	if (xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA) {
 		dma_cap_set(DMA_CYCLIC, xdev->common.cap_mask);
+		xdev->common.device_prep_peripheral_dma_vec = xilinx_dma_prep_peripheral_dma_vec;
 		xdev->common.device_prep_slave_sg = xilinx_dma_prep_slave_sg;
 		xdev->common.device_prep_dma_cyclic =
 					  xilinx_dma_prep_dma_cyclic;

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

