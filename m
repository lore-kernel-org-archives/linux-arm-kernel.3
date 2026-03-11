Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7541049523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31gW1Ez9RW21ry4PNLhw5rfo5103IhHkPkxFZmjfbYk=; b=SYvdNWRxtX26SxmwjpflJez+en
	2+1dj0qAWzFpxla6c3OJpdRCi4GKZtrV4rdeyUvTnBj1E3wMIBm3PSMtnGD8oPh8FV4k3uzpBQjYf
	bOTakH0FiXUl7sg2v6u2vTAbb9B7KEDVOR3XAd6A+KnCQTxYEbYSsHLonqVfY5/Gy1lPifVjG9gRx
	3Qp8rDtwLbAzcefkGS8fS76jyezjpDZd1ChGSghy5ewsidzjOfJs61+o4Qz9dc1TK/g2B4N1w1Ybv
	T6J84W7M1ZPE/8+rQu24JxPXMS09wgXHJRmUhVkZpI3ru1MYDrLLFd1Z5/1gPQQxuOsyrWIUrJ5y6
	OBRewXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFP-0000000BKlH-1LXT;
	Wed, 11 Mar 2026 09:52:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFO-0000000BKkG-1qGr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=31gW1Ez9RW21ry4PNLhw5rfo5103IhHkPkxFZmjfbYk=; b=lLq8F10MI8vzilSE/0Nou39738
	ZMWj5xuoRTsk1Oqy+apyP6pxuRiEQlL77376T9d/wl7HkALH5V8rxmTlpm6Elh9AVnrScxKuG2krC
	TaiBDZbP2RA1SxOF8Yji6yvC0gwku53V7tLBG61QhpscUmzjghatMfJp5rW14Q/1mSguT7OxGAQuf
	wxkKRsfR6ksGoNNBPQVm7fOYRcptLpPCubIfbblW5NC4x5SHVg7yUHqkQXMfNt5B1W5Yulot05JHC
	aNIhsMskR9DmSy9F8yvzXOZu6wtzb5IuXvI1XaT6nXOGPMUjqyzoVAP9Ja+Q6TZXqioJjTrQsbXx1
	95h161kg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GFL-0000000GcIi-2cR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=31gW1Ez9RW21ry4PNLhw5rfo5103IhHkPkxFZmjfbYk=; b=VAOwIlySsvNFuS2qDo1aCVM9pn
	jig/UZyXHG8nfU1naLbEVDECLiRZhQqRjL5pSfLrzeUAb+msApnH++mPgLpIKVu/dnv2WK7VY32sW
	qwErEKet+yb+wcMhyRDmm7Yvx5H7/GJi7Q4THGc5cEdQ3eu/JSRz6hHI5kDYOrKcPq123v84Cp1s4
	H/mXGue77eRgGaGRkWDqebtghVD/XF3f3g71ITGynNyUDeyfF/Q4X5jAn6QMEFnJIywuL6H5TIOiK
	qh1F8G4wsRC19WpMuhAp9H5O6AS/6nJNJN3wonM98/Hx4UwFTS7vV2N5iQR6vs2BK35hif6DvFRJa
	hEvmbB1w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48164 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0GF2-0000000067z-1LJz;
	Wed, 11 Mar 2026 09:52:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0GF0-0000000CiT7-42vR;
	Wed, 11 Mar 2026 09:52:35 +0000
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
Subject: [PATCH net-next 06/15] net: stmmac: add helper to set receive tail
 pointer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0GF0-0000000CiT7-42vR@rmk-PC.armlinux.org.uk>
Date: Wed, 11 Mar 2026 09:52:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095255_753543_5ECBC16F 
X-CRM114-Status: GOOD (  11.76  )
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

Setting the queue receive tail pointer follows a common pattern:
calculate the DMA address, and then call stmmac_set_rx_tail_ptr().
The only difference between all the call sites is the index used.

Factor this out into a static function, and add a comment about why
it only uses the normal descriptor size.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dca62e7b259a..8823f8f5b053 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -380,6 +380,18 @@ static struct dma_desc *stmmac_get_rx_desc(struct stmmac_priv *priv,
 		return &rx_q->dma_rx[index];
 }
 
+static void stmmac_set_queue_rx_tail_ptr(struct stmmac_priv *priv,
+					 struct stmmac_rx_queue *rx_q,
+					 unsigned int chan, unsigned int index)
+{
+	/* This only needs to deal with normal descriptors as enhanced
+	 * descriptiors are only supported with dwmac1000 (<v4.0) which
+	 * does not implement .set_rx_tail_ptr
+	 */
+	rx_q->rx_tail_addr = rx_q->dma_rx_phy + index * sizeof(struct dma_desc);
+	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, chan);
+}
+
 /**
  * stmmac_rx_dirty - Get RX queue dirty
  * @priv: driver private structure
@@ -3302,11 +3314,8 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		stmmac_init_rx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 				    rx_q->dma_rx_phy, chan);
 
-		rx_q->rx_tail_addr = rx_q->dma_rx_phy +
-				     (rx_q->buf_alloc_num *
-				      sizeof(struct dma_desc));
-		stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
-				       rx_q->rx_tail_addr, chan);
+		stmmac_set_queue_rx_tail_ptr(priv, rx_q, chan,
+					     rx_q->buf_alloc_num);
 	}
 
 	/* DMA TX Channel Configuration */
@@ -4999,9 +5008,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 		entry = STMMAC_GET_ENTRY(entry, priv->dma_conf.dma_rx_size);
 	}
 	rx_q->dirty_rx = entry;
-	rx_q->rx_tail_addr = rx_q->dma_rx_phy +
-			    (rx_q->dirty_rx * sizeof(struct dma_desc));
-	stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, queue);
+	stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->dirty_rx);
 	/* Wake up Rx DMA from the suspend state if required */
 	stmmac_enable_dma_reception(priv, priv->ioaddr, queue);
 }
@@ -5381,9 +5388,7 @@ static bool stmmac_rx_refill_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 	if (rx_desc) {
 		rx_q->dirty_rx = entry;
-		rx_q->rx_tail_addr = rx_q->dma_rx_phy +
-				     (rx_q->dirty_rx * sizeof(struct dma_desc));
-		stmmac_set_rx_tail_ptr(priv, priv->ioaddr, rx_q->rx_tail_addr, queue);
+		stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->dirty_rx);
 	}
 
 	return ret;
@@ -6951,10 +6956,8 @@ void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
 	stmmac_init_rx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 			    rx_q->dma_rx_phy, rx_q->queue_index);
 
-	rx_q->rx_tail_addr = rx_q->dma_rx_phy + (rx_q->buf_alloc_num *
-			     sizeof(struct dma_desc));
-	stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
-			       rx_q->rx_tail_addr, rx_q->queue_index);
+	stmmac_set_queue_rx_tail_ptr(priv, rx_q, rx_q->queue_index,
+				     rx_q->buf_alloc_num);
 
 	if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
 		buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
@@ -7105,11 +7108,8 @@ int stmmac_xdp_open(struct net_device *dev)
 		stmmac_init_rx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 				    rx_q->dma_rx_phy, chan);
 
-		rx_q->rx_tail_addr = rx_q->dma_rx_phy +
-				     (rx_q->buf_alloc_num *
-				      sizeof(struct dma_desc));
-		stmmac_set_rx_tail_ptr(priv, priv->ioaddr,
-				       rx_q->rx_tail_addr, chan);
+		stmmac_set_queue_rx_tail_ptr(priv, rx_q, chan,
+					     rx_q->buf_alloc_num);
 
 		if (rx_q->xsk_pool && rx_q->buf_alloc_num) {
 			buf_size = xsk_pool_get_rx_frame_size(rx_q->xsk_pool);
-- 
2.47.3


