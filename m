Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D39C104BED3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jy7ZZYhO/l6AOCV4Dt/j5MRaTr5NmlKcOirpso5gcsI=; b=M0hiShILU5mTw1WqsAL96sw05p
	24bDcUqUR/6eu23NQ6iJZ7SQUt8D2c4HP6qCzRPZsWXjDk35MfapPTondhg0PUl6A8hGGymj8VtB7
	JSk577yIA11tiqj+gCutnrWRWqjxivmXjxsgj9VmrgB2NSw8gixpE66rVt8Xj6RbKrwnvxq7gmALr
	/NpFOMrx3hWy1VmhEc9yO/2AlmeQHlVfpCXpS0XqSu42DghzgsojRAxrbtVaaxqtZJZrdUG+tut4i
	00QbCTLYii1gA+Sx3npM2gaR5qeBjnp84njxs0d1UGgbAHl4t71FtUQeHwegGPRYqsgvruK0zvhJe
	gKIJp04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gfc-0000000BPC7-0mqg;
	Wed, 11 Mar 2026 10:20:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gfa-0000000BPBg-15na
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jy7ZZYhO/l6AOCV4Dt/j5MRaTr5NmlKcOirpso5gcsI=; b=wMo/5xuCM6GHbf1VABNSVs8FvT
	J73OKmQkiNMTevw2lC5BF7diZINev13LOSSGOH7DX9JAgM52l7SAtQt88Kc898211sHTdwQiDo5Ls
	V7u+IrRHQIbwyUzgzkMNvYhk0qiJ2OzvKRBeSRHKMHTM4FGyo9VGo/T7tbS/POr6Z4gJ+Go51Qvlg
	9VXIG7PS/NxWbJ+7X55bQcbLxgSdsDAyELN5uq54LGPz0IOHh8OozOdyb6u/w2d6HmeyXtl+ww/nl
	d5n8RycOmq/0HD5UtTr1yLdqbjGFl9JYQe6DdyAMWiWzuRCGipWHVMZkyTPmp9PO1tlgvLPwH/XVu
	ELJITC+g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48598 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GFp-000000006BF-0GVv;
	Wed, 11 Mar 2026 09:53:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GFl-0000000CiU0-03iN;
	Wed, 11 Mar 2026 09:53:21 +0000
In-Reply-To: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
References: <abE7LWj04-JNxgS2@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 15/15] net: stmmac: use queue rather than
 ->queue_index
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GFl-0000000CiU0-03iN@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:53:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032002_327035_E958D3BD 
X-CRM114-Status: GOOD (  11.41  )
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

We use a lot of ->queue_index where we already have the queue / channel
index (which are actually the same index), which has been used to get
the queue struct. Since queue and queue_index are identical in
priv->(tx|rx)_queue[queue]->queue_index there is no point using the
queue_index where we already have queue.

Use queue rather than queue_index.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 55b79e9e637f..8393cbd0875e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -440,7 +440,7 @@ static void stmmac_set_queue_rx_buf_size(struct stmmac_priv *priv,
 	else
 		buf_size = priv->dma_conf.dma_buf_sz;
 
-	stmmac_set_dma_bfsize(priv, priv->ioaddr, buf_size, rx_q->queue_index);
+	stmmac_set_dma_bfsize(priv, priv->ioaddr, buf_size, chan);
 }
 
 /**
@@ -1902,7 +1902,7 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 						   NULL));
 		netdev_info(priv->dev,
 			    "Register MEM_TYPE_XSK_BUFF_POOL RxQ-%d\n",
-			    rx_q->queue_index);
+			    queue);
 		xsk_pool_set_rxq_info(rx_q->xsk_pool, &rx_q->xdp_rxq);
 	} else {
 		WARN_ON(xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
@@ -1910,7 +1910,7 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 						   rx_q->page_pool));
 		netdev_info(priv->dev,
 			    "Register MEM_TYPE_PAGE_POOL RxQ-%d\n",
-			    rx_q->queue_index);
+			    queue);
 	}
 
 	if (rx_q->xsk_pool) {
@@ -2310,9 +2310,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	else
 		napi_id = ch->rx_napi.napi_id;
 
-	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev,
-			       rx_q->queue_index,
-			       napi_id);
+	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
 	if (ret) {
 		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
 		return -EINVAL;
@@ -3340,7 +3338,7 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
 	if (!tx_coal_timer)
 		return;
 
-	ch = &priv->channel[tx_q->queue_index];
+	ch = &priv->channel[queue];
 	napi = tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;
 
 	/* Arm timer only if napi is not already scheduled.
@@ -6918,12 +6916,11 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_clear_rx_descriptors(priv, &priv->dma_conf, queue);
 
 	stmmac_init_rx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
-			    rx_q->dma_rx_phy, rx_q->queue_index);
+			    rx_q->dma_rx_phy, queue);
 
-	stmmac_set_queue_rx_tail_ptr(priv, rx_q, rx_q->queue_index,
-				     rx_q->buf_alloc_num);
+	stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->buf_alloc_num);
 
-	stmmac_set_queue_rx_buf_size(priv, rx_q, rx_q->queue_index);
+	stmmac_set_queue_rx_buf_size(priv, rx_q, queue);
 
 	stmmac_start_rx_dma(priv, queue);
 
@@ -6969,12 +6966,12 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_clear_tx_descriptors(priv, &priv->dma_conf, queue);
 
 	stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
-			    tx_q->dma_tx_phy, tx_q->queue_index);
+			    tx_q->dma_tx_phy, queue);
 
 	if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		stmmac_enable_tbs(priv, priv->ioaddr, 1, tx_q->queue_index);
+		stmmac_enable_tbs(priv, priv->ioaddr, 1, queue);
 
-	stmmac_set_queue_tx_tail_ptr(priv, tx_q, tx_q->queue_index, 0);
+	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, 0);
 
 	stmmac_start_tx_dma(priv, queue);
 
-- 
2.47.3


