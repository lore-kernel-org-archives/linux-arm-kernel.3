Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7965CFED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuiBWL9slWFfLdMK78HlbHZtxacsYxcx6jOQkgQ83JU=; b=gYeauRtaFQ+nb5eej9TpQa33OO
	/aqe7/P/ZRg3ajsMPqg3VZJTj6KA+aEDgvAgkCO/+53kPjfrv3ILCLN4vh8Q3mIaTlla03i0j/l5p
	7CFJJT4/InfLq9umFiJ8tIkPcf5izNOYnwCA4CXeJ8hg0xW5aN3C3sp7IxuZTYpf17YcaM6tT8qVG
	AZ7/bfvfiXckaMauO0cZWOWfqMN+MxHFzco0Y66loot8FizkjgXjLLWm5426nrk1OMYY+UXG6JSYN
	cBCu6ZxddZErzsdOQ+lDjMoDnUBLJ9tByH/BGTgHkSZNVOkcCVtwT4+GgT/UVBf7Siz1EPCIhHXTf
	+mTdfHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czY-0000000DpcF-0sw1;
	Thu, 12 Mar 2026 10:10:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czR-0000000DpVj-1ekg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SuiBWL9slWFfLdMK78HlbHZtxacsYxcx6jOQkgQ83JU=; b=HVz+oQ/SD+1GzKmoWFplkMpSIF
	uJ6AFb6GUoQ/kp9BH8tjgkHNUqcfhHJtIShzwBhRamebgtUJ9J2VFmpIxrNxkRJAFWBA9XaLkDUNs
	eak3mirVWOKKzlZ9O0mFoga94mX63g81WEwpiuPdbaLY8B8L7aJqaT5pYK/k5MtFG2Kctn5xOewkp
	zFIKwSX/SKp6DtnKCsMqNSM29C5G9IzQuml2dXcf1paC8re2qxN6/upWX4n3t1oqlf+3v2Td5Oh5E
	QFi+ItWMiZy1JMgGe1gn0NgLPyTCAZPjtbCo10k/HYBWJOHbMVY2YWmLicnWK1lbm0AlgY6YNldom
	r5JGswUA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60658 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0cz4-000000007Zf-1vta;
	Thu, 12 Mar 2026 10:09:38 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0cyz-0000000CzGf-3K08;
	Thu, 12 Mar 2026 10:09:33 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 09/15] net: stmmac: add helper to set receive
 buffer size
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0cyz-0000000CzGf-3K08@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:33 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031005_679092_58414B08 
X-CRM114-Status: GOOD (  13.32  )
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

There are three sites that configure the hardware for the receive
buffer size using the same logic to determine the buffer size.
Add a helper so there is only one copy of this code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 54 ++++++++-----------
 1 file changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 787b02c2607a..47b536c15c0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -393,6 +393,24 @@ static void stmmac_set_queue_rx_tail_ptr(struct stmmac_priv *priv,
 	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_tail_addr, chan);
 }
 
+static void stmmac_set_queue_rx_buf_size(struct stmmac_priv *priv,
+					 struct stmmac_rx_queue *rx_q,
+					 unsigned int chan)
+{
+	u32 buf_size;
+
+	if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
+		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
+		stmmac_set_dma_bfsize(priv, priv->ioaddr,
+				      buf_size,
+				      rx_q->queue_index);
+	} else {
+		stmmac_set_dma_bfsize(priv, priv->ioaddr,
+				      priv->dma_conf.dma_buf_sz,
+				      rx_q->queue_index);
+	}
+}
+
 /**
  * stmmac_rx_dirty - Get RX queue dirty
  * @priv: driver private structure
@@ -2605,23 +2623,13 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	/* configure all channels */
 	for (chan = 0; chan < rx_channels_count; chan++) {
 		struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[chan];
-		u32 buf_size;
 
 		qmode = priv->plat->rx_queues_cfg[chan].mode_to_use;
 
 		stmmac_dma_rx_mode(priv, priv->ioaddr, rxmode, chan,
 				rxfifosz, qmode);
 
-		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
-			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      buf_size,
-					      chan);
-		} else {
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      priv->dma_conf.dma_buf_sz,
-					      chan);
-		}
+		stmmac_set_queue_rx_buf_size(priv, rx_q, chan);
 	}
 
 	for (chan = 0; chan < tx_channels_count; chan++) {
@@ -6935,7 +6943,6 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
 	struct stmmac_channel *ch = &priv->channel[queue];
 	unsigned long flags;
-	u32 buf_size;
 	int ret;
 
 	ret = __alloc_dma_rx_desc_resources(priv, &priv->dma_conf, queue);
@@ -6960,16 +6967,7 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_set_queue_rx_tail_ptr(priv, rx_q, rx_q->queue_index,
 				     rx_q->buf_alloc_num);
 
-	if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
-		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-		stmmac_set_dma_bfsize(priv, priv->ioaddr,
-				      buf_size,
-				      rx_q->queue_index);
-	} else {
-		stmmac_set_dma_bfsize(priv, priv->ioaddr,
-				      priv->dma_conf.dma_buf_sz,
-				      rx_q->queue_index);
-	}
+	stmmac_set_queue_rx_buf_size(priv, rx_q, rx_q->queue_index);
 
 	stmmac_start_rx_dma(priv, queue);
 
@@ -7072,7 +7070,6 @@ int stmmac_xdp_open(struct net_device *dev)
 	u8 dma_csr_ch = max(rx_cnt, tx_cnt);
 	struct stmmac_rx_queue *rx_q;
 	struct stmmac_tx_queue *tx_q;
-	u32 buf_size;
 	bool sph_en;
 	u8 chan;
 	int ret;
@@ -7112,16 +7109,7 @@ int stmmac_xdp_open(struct net_device *dev)
 		stmmac_set_queue_rx_tail_ptr(priv, rx_q, chan,
 					     rx_q->buf_alloc_num);
 
-		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
-			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      buf_size,
-					      rx_q->queue_index);
-		} else {
-			stmmac_set_dma_bfsize(priv, priv->ioaddr,
-					      priv->dma_conf.dma_buf_sz,
-					      rx_q->queue_index);
-		}
+		stmmac_set_queue_rx_buf_size(priv, rx_q, chan);
 
 		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
 	}
-- 
2.47.3


