Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AA110706C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vwljc2bReMp+ReRMVI0DIpKEZxv2RLRL09hipjwo8dA=; b=hPQhvLV5swzBjuw/OkrkcBgx/v
	RF/M3KRzTCF8QF7nJ+vdhB/cEUhHgUE98fbyBUH+8swZhPIlLxRyuRh7HLnF2I+FmmkyVDLTRnXSz
	LrIux6GO1+O1RldMYhqaFnphtgx/a709Ix9+L7kiSe+AE4PAtnie/0Siadp3K2MZm8HQxdBBwO6hX
	SgLvBKriUyuMmx0PIoAVNfzkRI+T2i00+Widz5m4K/WhlHDYHdBXzTEvbjcjnYj/1oDl6obvVFT/m
	51YiYAq35/NCj5UHAlFfNc8HofUYHRWjgQ+Hx/fZ0j8bG7xxcEL3gOLToralaO3nGjk/gx0DPqWfL
	2lg1iQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LcX-00000001iBR-2IxD;
	Sat, 14 Mar 2026 09:49:21 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1LcU-00000001i9t-122q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 09:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vwljc2bReMp+ReRMVI0DIpKEZxv2RLRL09hipjwo8dA=; b=RJITm808HJxNAgngepUVHWS4BO
	iS1JZsplQN3QOH8t7a58fK5PYFKjotLQcYo8VuisOgWcFYj6MFmi1Oj0XOtVeBgib3vCBP9jANtoo
	I8h4psS2ADNjdhoHTYbJBlgntsOrgeIEpaFIFD2u+blY4peG7w+WIcXKUB65aNaPK+TIBxca/c95M
	S4WuoIYVguJB/rzcUvDMkBkVBCblmqbX82HizILz7BG+57Wdx14LCRQIZlBfc0Dl5OA6czTsGHO4p
	2xVvxEYpGJvQ7W3gSzV0RkGRe41fOu3YDOgYzs8uzE8euoxKeKtKlw0KXx7wJ4RZc0wc11o3YQzdQ
	aEHLZvew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40726 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w1LWr-0000000023J-1JE0;
	Sat, 14 Mar 2026 09:43:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w1LWo-0000000DGSw-1MCe;
	Sat, 14 Mar 2026 09:43:26 +0000
In-Reply-To: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
References: <abUtGH9KB03PH5Ne@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v4 13/15] net: stmmac: add helper to set transmit
 tail pointer
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w1LWo-0000000DGSw-1MCe@rmk-PC.armlinux.org.uk>
Date: Sat, 14 Mar 2026 09:43:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_024918_281744_7DFC40D2 
X-CRM114-Status: GOOD (  10.97  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 30 ++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

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


