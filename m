Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A523CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvUvDPc72DIV/MmMiN2g+hmUE1Xk6rQLgbIXZ7F8fC4=; b=R9Lh+1PQ11TDVcCLu1kAKDACQ1
	8nmJSpqUbatwPwYod/rp/yjW/OBj8XjeRiVSahpfPHo5aysAaMW/VaB3T+GQpPYQIqr1ugv4mmrkQ
	USYw3Onfe1T8I4NuimB461yhqy1BdyV5LTgvqxn4HVPnzl1cOzLNIx7IGG5mubQfi9/uJbZM9UkvD
	3+i059Vp0Hsuoux+mKX2AAzmfszyTnZZYLbPpdcMx+y+yt48duhp2z6IA0jHy/E4QQshfbs0Vm5hS
	1Pq/RNo0sUVRiWr95TDq4BtiAK+bptvQI0LFAHRU900tOPq5IY068AAWwM0G5ntiNetsKxrxeRWTp
	Z5rm0dBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0amQ-00000009BBP-3C5i;
	Mon, 22 Sep 2025 07:16:10 +0000
Received: from mail-m32110.qiye.163.com ([220.197.32.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0amC-00000009Asd-1cPV;
	Mon, 22 Sep 2025 07:15:58 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 239b62ac0;
	Mon, 22 Sep 2025 15:15:51 +0800 (GMT+08:00)
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
Subject: [PATCH v7 4/4] net: can: rockchip: support dma for rk3576 rx
Date: Mon, 22 Sep 2025 15:15:43 +0800
Message-Id: <20250922071543.73923-5-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922071543.73923-1-zhangqing@rock-chips.com>
References: <20250922071543.73923-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a997047682103a3kunm864fae2f23165f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkhDHVZISkMdGk9CHUwfSE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QfcFhI9kQ+HAbiQVcF+D9LYOyE5XdmIPjAg2a0ieNw29ovFOAaFWwrbyE9ezzc7S2aNnACDdqMah2DlBOZFTFWUAPlszo1y7Z8FIch7NfeL1us1h07A4sDtQRatpi+/SDpOiTLj+BJn9BvnrzWrxK7KfmbGGLfgGiB7i+RqvSI4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=wvUvDPc72DIV/MmMiN2g+hmUE1Xk6rQLgbIXZ7F8fC4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001556_594031_0427FA7E 
X-CRM114-Status: GOOD (  22.20  )
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
 .../net/can/rockchip/rockchip_canfd-core.c    |  62 +++++++++-
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 109 ++++++++++++++++++
 drivers/net/can/rockchip/rockchip_canfd.h     |   9 ++
 3 files changed, 178 insertions(+), 2 deletions(-)

diff --git a/drivers/net/can/rockchip/rockchip_canfd-core.c b/drivers/net/can/rockchip/rockchip_canfd-core.c
index e36cf4cb6743..fab2f8525208 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-core.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-core.c
@@ -400,6 +400,9 @@ static void rk3576canfd_chip_start(struct rkcanfd_priv *priv)
 		      RK3576CANFD_REG_BRS_CFG_BRS_NEGSYNC_EN |
 		      RK3576CANFD_REG_BRS_CFG_BRS_POSSYNC_EN);
 
+	if (priv->dma_thr)
+		rkcanfd_write(priv, RK3576CANFD_REG_DMA_CTRL,
+			      RK3576CANFD_REG_DMA_CTRL_DMA_RX_EN | priv->dma_thr);
 	rkcanfd_set_bittiming(priv);
 
 	priv->devtype_data.interrupts_disable(priv);
@@ -1291,10 +1294,34 @@ static const struct of_device_id rkcanfd_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rkcanfd_of_match);
 
+static int rk3576_canfd_dma_init(struct rkcanfd_priv *priv, struct resource *res)
+{
+	struct dma_slave_config rxconf = {
+		.direction = DMA_DEV_TO_MEM,
+		.src_addr = res->start + RK3576CANFD_REG_RXFRD,
+		.src_addr_width = 4,
+		.dst_addr_width = 4,
+		.src_maxburst = 9,
+	};
+
+	priv->dma_thr = rxconf.src_maxburst - 1;
+	priv->dma_size = RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT * 4;
+	priv->rxbuf = dma_alloc_coherent(priv->ndev->dev.parent,
+					 priv->dma_size * RK3576CANFD_SRAM_MAX_FIFO_CNT,
+					 &priv->rx_dma_dst_addr, GFP_KERNEL);
+	if (!priv->rxbuf) {
+		priv->rxbuf = NULL;
+		return -ENOMEM;
+	}
+	dmaengine_slave_config(priv->rxchan, &rxconf);
+	return 0;
+}
+
 static int rkcanfd_probe(struct platform_device *pdev)
 {
 	struct rkcanfd_priv *priv;
 	struct net_device *ndev;
+	struct resource *res;
 	const void *match;
 	int err;
 
@@ -1316,7 +1343,7 @@ static int rkcanfd_probe(struct platform_device *pdev)
 		goto out_free_candev;
 	}
 
-	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->regs)) {
 		err = PTR_ERR(priv->regs);
 		goto out_free_candev;
@@ -1351,10 +1378,22 @@ static int rkcanfd_probe(struct platform_device *pdev)
 			priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
 	}
 
+	priv->rxchan = dma_request_chan(&pdev->dev, "rx");
+	if (IS_ERR(priv->rxchan)) {
+		netdev_warn(priv->ndev,
+			    "Failed to request RX-DMA channel: %pe, continuing without DMA",
+			    priv->rxchan);
+		priv->rxchan = NULL;
+	} else {
+		err = rk3576_canfd_dma_init(priv, res);
+		if (err)
+			goto out_can_dma_rx_chan_del;
+	}
+
 	err = can_rx_offload_add_manual(ndev, &priv->offload,
 					RKCANFD_NAPI_WEIGHT);
 	if (err)
-		goto out_free_candev;
+		goto out_can_dma_rx_chan_del;
 
 	err = rkcanfd_register(priv);
 	if (err)
@@ -1364,6 +1403,15 @@ static int rkcanfd_probe(struct platform_device *pdev)
 
 out_can_rx_offload_del:
 	can_rx_offload_del(&priv->offload);
+out_can_dma_rx_chan_del:
+	if (priv->rxbuf) {
+		dma_free_coherent(priv->ndev->dev.parent,
+				  priv->dma_size * RK3576CANFD_SRAM_MAX_FIFO_CNT,
+				  priv->rxbuf, priv->rx_dma_dst_addr);
+		priv->rxbuf = NULL;
+	}
+	if (priv->rxchan)
+		dma_release_channel(priv->rxchan);
 out_free_candev:
 	free_candev(ndev);
 
@@ -1375,6 +1423,16 @@ static void rkcanfd_remove(struct platform_device *pdev)
 	struct rkcanfd_priv *priv = platform_get_drvdata(pdev);
 	struct net_device *ndev = priv->ndev;
 
+	if (priv->rxbuf) {
+		dma_free_coherent(priv->ndev->dev.parent,
+				  priv->dma_size * RK3576CANFD_SRAM_MAX_FIFO_CNT,
+				  priv->rxbuf, priv->rx_dma_dst_addr);
+		priv->rxbuf = NULL;
+	}
+
+	if (priv->rxchan)
+		dma_release_channel(priv->rxchan);
+
 	rkcanfd_unregister(priv);
 	can_rx_offload_del(&priv->offload);
 	free_candev(ndev);
diff --git a/drivers/net/can/rockchip/rockchip_canfd-rx.c b/drivers/net/can/rockchip/rockchip_canfd-rx.c
index d6f39393c7ea..7c858fb06528 100644
--- a/drivers/net/can/rockchip/rockchip_canfd-rx.c
+++ b/drivers/net/can/rockchip/rockchip_canfd-rx.c
@@ -277,6 +277,71 @@ static int rk3576canfd_handle_rx_int_one(struct rkcanfd_priv *priv)
 	return 0;
 }
 
+static int rk3576canfd_handle_rx_dma(struct rkcanfd_priv *priv, u32 addr)
+{
+	struct net_device_stats *stats = &priv->ndev->stats;
+	struct canfd_frame *skb_cfd;
+	struct sk_buff *skb;
+	u32 frameinfo, id, data[16] = {0};
+	u8 dlc;
+	int i;
+
+	frameinfo = *(u32 *)(priv->rxbuf + addr * RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+	id = *(u32 *)(priv->rxbuf + 1 + addr * RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+	for (i = 0; i < (RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT - 2); i++)
+		data[i] = *(u32 *)(priv->rxbuf + 2 + i +
+				   addr * RK3576CANFD_REG_STR_STATE_INTM_LEFT_CNT_UNIT);
+
+	if (frameinfo & RK3576CANFD_REG_RXFRD_FRAMEINFO_FDF)
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
+	if (frameinfo & RK3576CANFD_REG_RXFRD_FRAMEINFO_FRAME_FORMAT)
+		skb_cfd->can_id = FIELD_GET(RKCANFD_REG_FD_ID_EFF, id) |
+			CAN_EFF_FLAG;
+	else
+		skb_cfd->can_id = FIELD_GET(RKCANFD_REG_FD_ID_SFF, id);
+
+	dlc = FIELD_GET(RK3576CANFD_REG_RXFRD_FRAMEINFO_DATA_LENGTH,
+			frameinfo);
+
+	/* CAN-FD */
+	if (frameinfo & RK3576CANFD_REG_RXFRD_FRAMEINFO_FDF) {
+		skb_cfd->len = can_fd_dlc2len(dlc);
+
+		/* The cfd is not allocated by alloc_canfd_skb(), so
+		 * set CANFD_FDF here.
+		 */
+		skb_cfd->flags |= CANFD_FDF;
+
+		if (frameinfo & RK3576CANFD_REG_RXFRD_FRAMEINFO_BRS)
+			skb_cfd->flags |= CANFD_BRS;
+	} else {
+		skb_cfd->len = can_cc_dlc2len(dlc);
+
+		if (frameinfo & RK3576CANFD_REG_RXFRD_FRAMEINFO_RTR)
+			skb_cfd->can_id |= CAN_RTR_FLAG;
+	}
+	if (!(skb_cfd->can_id & CAN_RTR_FLAG)) {
+		/* Change CANFD data format to SocketCAN data format */
+		for (i = 0; i < skb_cfd->len; i += 4)
+			*(u32 *)(skb_cfd->data + i) = data[i / 4];
+	}
+
+	stats->rx_packets++;
+	stats->rx_bytes += skb_cfd->len;
+	netif_rx(skb);
+
+	return 0;
+}
+
 static int rkcanfd_handle_rx_int_one(struct rkcanfd_priv *priv)
 {
 	struct net_device_stats *stats = &priv->ndev->stats;
@@ -372,6 +437,43 @@ rk3576canfd_rx_fifo_get_len(const struct rkcanfd_priv *priv)
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
@@ -391,6 +493,13 @@ int rkcanfd_handle_rk3576_rx_int(struct rkcanfd_priv *priv)
 	unsigned int len;
 	int err;
 
+	if (priv->rxchan) {
+		err = rk3576_canfd_rx_dma(priv);
+		if (err)
+			return err;
+		else
+			return 0;
+	}
 	while ((len = rk3576canfd_rx_fifo_get_len(priv))) {
 		err = rk3576canfd_handle_rx_int_one(priv);
 		if (err)
diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/rockchip/rockchip_canfd.h
index 6b77a19e0d4a..30bd692486e6 100644
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
@@ -532,6 +534,7 @@
 #define RK3576CANFD_ISM_WATERMASK_CANFD 0x6c /* word */
 
 #define RK3576CANFD_SRAM_MAX_DEPTH 256 /* word */
+#define RK3576CANFD_SRAM_MAX_FIFO_CNT (RK3576CANFD_SRAM_MAX_DEPTH / RK3576CANFD_SRAM_MAX_DEPTH)
 
 #define RK3576CANFD_CANFD_FILTER GENMASK(28, 0)
 
@@ -749,6 +752,12 @@ struct rkcanfd_priv {
 	struct reset_control *reset;
 	struct clk_bulk_data *clks;
 	int clks_num;
+	u32 dma_size;
+	u32 dma_thr;
+	int quota;
+	struct dma_chan *rxchan;
+	u32 *rxbuf;
+	dma_addr_t rx_dma_dst_addr;
 };
 
 static inline u32
-- 
2.34.1


