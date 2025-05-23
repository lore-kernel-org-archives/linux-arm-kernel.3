Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E157C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 08:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHt3ciCOlWWGFv/hHizwXrIrdySa8FGSYcqD3FJvXFI=; b=BhywOML78Kt6a/P4abvnDKfThY
	O97mGraKAFzSnV2AITtqwsr8g4ITUjShLEtClhkXt1x1tfP7swwRq3miGs7pUPJ3Fn8aRegZZOaDd
	pLIuLsLVltlXJol2SUtAZO2u33jqFumJWQakbtD1K6od8UdUYvmN3dHmKP8HV9pgo0iwtL4gSHXpt
	st8l96MGP9ZBCIiAan3GHU84KN1TjP7Abw9FvUI51KEYhSARI85VguYMcTipv7vbIzGcc9xk0vadE
	2xGqTa6Lr8CbzViXzvE379D4MCHSB8BTEeAvjEm8cyf2obnerfdFOPgT1Rdk5MzLSPtUtlL3Vu7n+
	U1cvNaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINQe-00000003GFd-0lTt;
	Fri, 23 May 2025 08:06:56 +0000
Received: from mail-m49241.qiye.163.com ([45.254.49.241])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINEj-00000003EZs-2aij;
	Fri, 23 May 2025 07:54:39 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1628045f1;
	Fri, 23 May 2025 15:54:31 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com,
	kever.yang@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 4/4] net: can: rockchip: support dma for rk3576 rx
Date: Fri, 23 May 2025 15:54:22 +0800
Message-Id: <20250523075422.4010083-5-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523075422.4010083-1-zhangqing@rock-chips.com>
References: <20250523075422.4010083-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR8aGVZDQkofSUpLTxkaH0lWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a96fc22f42903a3kunm893a9d4d11db7f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Njo6Aio6TjE0NhUcOBcaEE46
	FAwaCzdVSlVKTE9MQkNNQ0xJQk5LVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUNOTko3Bg++
DKIM-Signature: a=rsa-sha256;
	b=Otywu/bi2Lk4lCDhFSIWywTXixpvAtTFf8q/3Us9Nx3oWEMHGoNp6oHd8kLMd/VPxiS+bqOISluErCXoSSuh7j2YdEIQ+kdCCb42cmJzLwInulKMAzgf4t+XP9ljwdQ+y946DQfeSYY/K28ScNogxWIsAd9+vsb0wEaPc6frGFc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=WHt3ciCOlWWGFv/hHizwXrIrdySa8FGSYcqD3FJvXFI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_005437_885573_3B470D4F 
X-CRM114-Status: GOOD (  19.90  )
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

The new can controller of rk3576 supports rx dma.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 .../net/can/rockchip/rockchip_canfd-core.c    | 39 +++++++++
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 86 +++++++++++++++++++
 drivers/net/can/rockchip/rockchip_canfd.h     | 11 +++
 3 files changed, 136 insertions(+)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index 92e260cb2527..9ef4a9ae19d8 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -433,6 +433,9 @@ static void rk3576canfd_chip_start(struct rkcanfd_priv *priv)
 		      RK3576CANFD_REG_BRS_CFG_BRS_NEGSYNC_EN |
 		      RK3576CANFD_REG_BRS_CFG_BRS_POSSYNC_EN);
 
+	if (priv->use_dma)
+		rkcanfd_write(priv, RK3576CANFD_REG_DMA_CTRL,
+			      RK3576CANFD_REG_DMA_CTRL_DMA_RX_EN | priv->dma_thr);
 	rkcanfd_set_bittiming(priv);
 
 	priv->devtype_data.interrupts_disable(priv);
@@ -1324,10 +1327,31 @@ static const struct of_device_id rkcanfd_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rkcanfd_of_match);
 
+static void rk3576_canfd_dma_init(struct rkcanfd_priv *priv)
+{
+	struct dma_slave_config rxconf = {
+		.direction = DMA_DEV_TO_MEM,
+		.src_addr = priv->rx_dma_src_addr,
+		.src_addr_width = 4,
+		.dst_addr_width = 4,
+		.src_maxburst = 9,
+	};
+
+	priv->dma_thr = rxconf.src_maxburst - 1;
+	priv->rxbuf = dma_alloc_coherent(priv->dev, priv->dma_size * 14,
+					 &priv->rx_dma_dst_addr, GFP_KERNEL);
+	if (!priv->rxbuf) {
+		priv->use_dma = 0;
+		return;
+	}
+	dmaengine_slave_config(priv->rxchan, &rxconf);
+}
+
 static int rkcanfd_probe(struct platform_device *pdev)
 {
 	struct rkcanfd_priv *priv;
 	struct net_device *ndev;
+	struct resource *res;
 	const void *match;
 	int err;
 
@@ -1349,6 +1373,7 @@ static int rkcanfd_probe(struct platform_device *pdev)
 		goto out_free_candev;
 	}
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	priv->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->regs)) {
 		err = PTR_ERR(priv->regs);
@@ -1376,6 +1401,7 @@ static int rkcanfd_probe(struct platform_device *pdev)
 	priv->can.do_set_mode = rkcanfd_set_mode;
 	priv->can.do_get_berr_counter = rkcanfd_get_berr_counter;
 	priv->ndev = ndev;
+	priv->dev = &pdev->dev;
 
 	match = device_get_match_data(&pdev->dev);
 	if (match) {
@@ -1384,6 +1410,19 @@ static int rkcanfd_probe(struct platform_device *pdev)
 			priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
 	}
 
+	priv->rxchan = dma_request_chan(&pdev->dev, "rx");
+	if (IS_ERR(priv->rxchan)) {
+		dev_warn(&pdev->dev, "Failed to request rxchan\n");
+		priv->rxchan = NULL;
+		priv->use_dma = 0;
+	} else {
+		priv->rx_dma_src_addr = res->start + RK3576CANFD_REG_RXFRD;
+		priv->dma_size = RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT * 4;
+		priv->use_dma = 1;
+	}
+	if (priv->use_dma)
+		rk3576_canfd_dma_init(priv);
+
 	err = can_rx_offload_add_manual(ndev, &priv->offload,
 					RKCANFD_NAPI_WEIGHT);
 	if (err)
diff --git a/drivers/net/can/rockchip/rockchip_canfd-rx.c b/drivers/net/can/rockchip/rockchip_canfd-rx.c
index 8a383cabd9d2..18c4970c2573 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-rx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-rx.c
@@ -285,6 +285,51 @@ static int rk3576canfd_handle_rx_int_one(struct rkcanfd_priv *priv)
 	return 0;
 }
 
+static int rk3576canfd_handle_rx_dma(struct rkcanfd_priv *priv, u32 addr)
+{
+	struct net_device_stats *stats = &priv->ndev->stats;
+	struct canfd_frame cfd[1] = { }, *skb_cfd;
+	struct rk3576canfd_fifo_header header[1] = { };
+	struct sk_buff *skb;
+	unsigned int len;
+	int i;
+
+	header->frameinfo = readl(priv->rxbuf +
+				  addr * RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+	header->id = readl(priv->rxbuf + 1 +
+			   addr * RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+	for (i = 0; i < (RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT - 2); i++)
+		cfd->data[i] = readl(priv->rxbuf + 2 + i +
+				     addr * RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+
+	len = rk3576canfd_fifo_header_to_cfd_header(priv, header, cfd);
+
+	/* Manual handling of CAN Bus Error counters. See
+	 * rkcanfd_get_corrected_berr_counter() for detailed
+	 * explanation.
+	 */
+	if (priv->bec.rxerr)
+		priv->bec.rxerr = min(CAN_ERROR_PASSIVE_THRESHOLD,
+				      priv->bec.rxerr) - 1;
+
+	if (header->frameinfo & RK3576CANFD_REG_RXFRD_FRAMEINFO_FDF)
+		skb = alloc_canfd_skb(priv->ndev, &skb_cfd);
+	else
+		skb = alloc_can_skb(priv->ndev, (struct can_frame **)&skb_cfd);
+
+	if (!skb) {
+		stats->rx_dropped++;
+
+		return 0;
+	}
+
+	memcpy(skb_cfd, cfd, len);
+	stats->rx_packets++;
+	stats->rx_bytes += cfd->len;
+	netif_rx(skb);
+	return 0;
+}
+
 static int rkcanfd_handle_rx_int_one(struct rkcanfd_priv *priv)
 {
 	struct net_device_stats *stats = &priv->ndev->stats;
@@ -380,6 +425,43 @@ rk3576canfd_rx_fifo_get_len(const struct rkcanfd_priv *priv)
 	return DIV_ROUND_UP(val, RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
 }
 
+static void rk3576_canfd_rx_dma_callback(void *data)
+{
+	struct rkcanfd_priv *priv = data;
+	int i;
+
+	for (i = 0; i < priv->quota; i++)
+		rk3576canfd_handle_rx_dma(priv, i);
+
+	rkcanfd_write(priv, RK3576CANFD_REG_INT_MASK, priv->reg_int_mask_default);
+}
+
+static int rk3576_canfd_rx_dma(struct rkcanfd_priv *priv)
+{
+	struct dma_async_tx_descriptor *rxdesc = NULL;
+	const u32 reg = rkcanfd_read(priv, RK3576CANFD_REG_STR_STATE);
+	int quota = FIELD_GET(RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT, reg);
+
+	quota = DIV_ROUND_UP(quota, RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+	priv->quota = quota;
+	if (priv->quota == 0) {
+		rkcanfd_write(priv, RK3576CANFD_REG_INT_MASK, priv->reg_int_mask_default);
+		return 0;
+	}
+
+	rxdesc = dmaengine_prep_slave_single(priv->rxchan, priv->rx_dma_dst_addr,
+					     priv->dma_size * priv->quota, DMA_DEV_TO_MEM, 0);
+	if (!rxdesc)
+		return -ENOMSG;
+
+	rxdesc->callback = rk3576_canfd_rx_dma_callback;
+	rxdesc->callback_param = priv;
+
+	dmaengine_submit(rxdesc);
+	dma_async_issue_pending(priv->rxchan);
+	return 0;
+}
+
 int rkcanfd_handle_rx_int(struct rkcanfd_priv *priv)
 {
 	unsigned int len;
@@ -399,6 +481,10 @@ int rkcanfd_handle_rk3576_rx_int(struct rkcanfd_priv *priv)
 	unsigned int len;
 	int err;
 
+	if (priv->use_dma) {
+		rk3576_canfd_rx_dma(priv);
+		return 0;
+	}
 	while ((len = rk3576canfd_rx_fifo_get_len(priv))) {
 		err = rk3576canfd_handle_rx_int_one(priv);
 		if (err)
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index ef46837ed573..2ebb3c64e9d4 100644
--- a/drivers/net/can/rockchip/rockchip_canfd.h
+++ b/drivers/net/can/rockchip/rockchip_canfd.h
@@ -11,6 +11,8 @@
 #include <linux/can/dev.h>
 #include <linux/can/rx-offload.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/io.h>
 #include <linux/netdevice.h>
 #include <linux/reset.h>
@@ -737,6 +739,7 @@ struct rkcanfd_priv {
 	struct can_priv can;
 	struct can_rx_offload offload;
 	struct net_device *ndev;
+	struct device *dev;
 
 	void __iomem *regs;
 	unsigned int tx_head;
@@ -758,6 +761,14 @@ struct rkcanfd_priv {
 	struct reset_control *reset;
 	struct clk_bulk_data *clks;
 	int clks_num;
+	bool use_dma;
+	u32 dma_size;
+	u32 dma_thr;
+	int quota;
+	struct dma_chan *rxchan;
+	u32 *rxbuf;
+	dma_addr_t rx_dma_src_addr;
+	dma_addr_t rx_dma_dst_addr;
 };
 
 static inline u32
-- 
2.34.1


