Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685A3FED2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31gW1Ez9RW21ry4PNLhw5rfo5103IhHkPkxFZmjfbYk=; b=NnuA3ipgzOzzeivEkWKmxCuTHz
	cr5gu5JB+Cao2J/eoywVaaAhWVcwfivzuLvtEzFBce32C/p61gwcX6lj7le7pqoHyQgL1sQeUJjY9
	42FdBvRJZuWwDYhiv/arTusQHna2AmQfuJuHIkVEaqq7t/W1YvyridIfPz8mmlg6xnIfHPDoOdh/o
	0Nr/jqx4MId2u7ZAuOgOmX76ECRihzY72ZWWSb6WachopW7yeh2Z5+gVu4tIVDNh50f1s/2dTfF0h
	WmMopffosX49EP/jxrt8lwt7CHhAOGyMvasVy0igGUWg3GvASdFVey5Fs1yXpUDSuBB1D07GwVlAv
	WKskej1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cz8-0000000DpML-1Ri8;
	Thu, 12 Mar 2026 10:09:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cz5-0000000DpJP-25TD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=31gW1Ez9RW21ry4PNLhw5rfo5103IhHkPkxFZmjfbYk=; b=eI9d07CUYiXVZHf9AO7fr/THmC
	z/IymOPxExwJx8y/C3Y+NVdSZeG3mtYv3bTf7kOfAumaz2C4kdDVgDA7uc6xDByoUgziUF8hsBfr5
	FR654gvEJsugxmisodDx5/XvkqPuoc+Ie4It63H0yCWrxfXBMzPIyMijVO6Wrv2EoLSzAaVyHghQ2
	ApgF26KwaW0/yx9Nnh83Lbp2RHIkxxRyY9lpG2/pZxwM7JS/OuC61umQE0+JX+Ghv132omVg779vg
	ls9Xny2qatC/KqhUTtoGCVpb/dZmFpH4g/UAoUQBByP+CKc95YiNaeupNa1jFWzkXX01+fOblPcGT
	wBvnkNwg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57818 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0cyn-000000007YX-4705;
	Thu, 12 Mar 2026 10:09:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0cyk-0000000CzGN-1sCN;
	Thu, 12 Mar 2026 10:09:18 +0000
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
Subject: [PATCH net-next v2 06/15] net: stmmac: add helper to set receive tail
 pointer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0cyk-0000000CzGN-1sCN@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:18 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_030939_638249_D2EDCBD9 
X-CRM114-Status: GOOD (  11.99  )
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


