Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9716FFED2F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM/25rP2GFaFoIJz6+i2p9dz592LekvcNbAGy7ERTB8=; b=cfCbEB1eJ4N02x8uW8/6bGmBhD
	qZ7KRO1UksiB1m2gTnZkfHKeEdbYGWw20gfASmVfmXyQjE9be7aRbJ6jJ3Ru5hB0b2VIt9JTXg8sI
	IKimCI4ryijlLWk77VOMLo4O4HJ/8K2p8N7pJc/X21bHxidtLfd8yW2P8dnf4sxnPXu6mORNuShDJ
	C+2ju7+s/T6KOpDZUpNRaaUCeCbcqS/DGKxpDm0inMe2xFvGekeVbjgDKvFkZEaUCCrPjq7eBO68+
	f29imIz6wMPsW1bA7moyZhUFsLCJFIrGVOsai+ldnGya4pisWpWNkts8V6BWj+HYhD3cvY3pEs03Q
	iOOv4o4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czr-0000000Dpu9-2tGf;
	Thu, 12 Mar 2026 10:10:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0czj-0000000Dpir-34dJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KM/25rP2GFaFoIJz6+i2p9dz592LekvcNbAGy7ERTB8=; b=j4ufD53jLj2Es9suAUwsaWHJpc
	4DAdCGOM5SiSwST7E2Uaf8PEnBs7nNIyJKPs3kX67fIhdRX3zYeSG53XGO0XBTnF566ycQ99et4aM
	OTOBuT9pq8sJ33Rj8gszk0UkSufBsQ+nAMw2tpamm+o0T0LRsUgv1gOvJA/e+CswMOfats8urxswq
	vp5Hug45+ZaDfpoOfV2cVXPXNMqnbZt/2j0WlkSijWpsWDGKWaV9E1QiHjgxvfnjK6ubY/PWnJ4m+
	yXyHZqI84mSUDX+aOJCypi8TmjHw5lvt04L6O5PJSxBL9MUMqW7TPXwWktaAAgEXIzBEzD+Iki81Q
	ZWK4wLHg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49126 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0czO-000000007b2-2agx;
	Thu, 12 Mar 2026 10:09:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0czK-0000000CzH7-19Fb;
	Thu, 12 Mar 2026 10:09:54 +0000
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
Subject: [PATCH net-next v2 13/15] net: stmmac: add helper to set transmit
 tail pointer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0czK-0000000CzH7-19Fb@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_031019_780715_508FF1A1 
X-CRM114-Status: GOOD (  15.09  )
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

Setting the queue transmit tail pointer follows a common pattern:
calculate the DMA address, and then call stmmac_set_tx_tail_ptr().
The only difference between all the call sites is the index used.

Factor this out into a static function.

We need to update dwmac4_display_ring() to cope the passed head
pointer always pointing at the struct dma_desc by using
dma_desc_to_edesc() to convert it to struct dma_edesc. This is the
only stmmac_display_ring() implementation that this affects.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++---------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index 1bbf02504dad..d5c003f3fbbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -427,7 +427,7 @@ static void dwmac4_display_ring(void *head, unsigned int size, bool rx,
 			extp++;
 		}
 	} else if (desc_size == sizeof(struct dma_edesc)) {
-		struct dma_edesc *ep = (struct dma_edesc *)head;
+		struct dma_edesc *ep = dma_desc_to_edesc(head);
 
 		for (i = 0; i < size; i++) {
 			dma_addr = dma_rx_phy + i * sizeof(*ep);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index da1726b887f3..4521469c5e1d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -385,6 +385,18 @@ static struct dma_desc *stmmac_get_tx_desc(struct stmmac_priv *priv,
 		return &tx_q->dma_tx[index];
 }
 
+static void stmmac_set_queue_tx_tail_ptr(struct stmmac_priv *priv,
+					 struct stmmac_tx_queue *tx_q,
+					 unsigned int chan, unsigned int index)
+{
+	int desc_size;
+
+	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
+
+	tx_q->tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
+	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, chan);
+}
+
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
 {
 	if (priv->extend_desc)
@@ -3311,9 +3323,7 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
 		stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 				    tx_q->dma_tx_phy, chan);
 
-		tx_q->tx_tail_addr = tx_q->dma_tx_phy;
-		stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
-				       tx_q->tx_tail_addr, chan);
+		stmmac_set_queue_tx_tail_ptr(priv, tx_q, chan, 0);
 	}
 
 	return ret;
@@ -4326,9 +4336,6 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
 static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
-	int desc_size;
-
-	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
 	/* The own bit must be the latest setting done when prepare the
 	 * descriptor and then barrier is needed to make sure that
@@ -4336,8 +4343,7 @@ static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int queue)
 	 */
 	wmb();
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy + (tx_q->cur_tx * desc_size);
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, queue);
+	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
 }
 
 /**
@@ -6967,9 +6973,7 @@ void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
 	if (tx_q->tbs & STMMAC_TBS_AVAIL)
 		stmmac_enable_tbs(priv, priv->ioaddr, 1, tx_q->queue_index);
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy;
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
-			       tx_q->tx_tail_addr, tx_q->queue_index);
+	stmmac_set_queue_tx_tail_ptr(priv, tx_q, tx_q->queue_index, 0);
 
 	stmmac_start_tx_dma(priv, queue);
 
@@ -7070,9 +7074,7 @@ int stmmac_xdp_open(struct net_device *dev)
 		stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
 				    tx_q->dma_tx_phy, chan);
 
-		tx_q->tx_tail_addr = tx_q->dma_tx_phy;
-		stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
-				       tx_q->tx_tail_addr, chan);
+		stmmac_set_queue_tx_tail_ptr(priv, tx_q, chan, 0);
 
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	}
-- 
2.47.3


