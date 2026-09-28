Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193D6CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zA/NU+RNAgeD9BOrpSB6bKryvPeGYSvBJqFkKYtNmis=; b=LJ8OKZY+3LhFtguhg8gDpn9LHb
	VpcmSKCA5HvqkSf/qUuMqK0cP9b3lZRjFO/A1yXUl9n6oeWwues4jE0cONapQ3PS/K5twkfUOjvu2
	HEInKfZ4kZ5vIKfKRvwt0qUuqiWY9arGTSwGcKDpXSTOLi06nAfBg2A4ELp5yHYFN5hjZK78H/z0M
	c15Ha8VktfcPFycaTQqitndyc/HOdryiTUDKvgH/eYGIAgsrJGf5+XcibxssGm/WfzK1sbftfav/F
	Jxhgpnx17Ap8u221ePrkkCQoS7eJ9bn9MvQ4Mi7AL8kv+QX65y8MubUUxLyILe7VbgYanzHvjm8xk
	OJ6hIUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAZd-00000000ZK0-3yRk;
	Mon, 28 Sep 2026 12:35:13 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAZa-00000000ZJO-3YDR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zA
	/NU+RNAgeD9BOrpSB6bKryvPeGYSvBJqFkKYtNmis=; b=AWBllJTokd4kPeZzb5
	k8asaCq/kXPYcf0gWyyqx3rgebS7ek/aLQyFU4qvYPHa4KYZGnBpDaiTzfixQBxC
	gBnsrmbfca7RnzFE7kUd3Fha2LdbifW4XMvxkP7slZWvenocYtFKLZwVqgX9gc+9
	qdrZUuo5ipr93Zci/1ipXUAfw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3P6HPXrpqTCkyAQ--.12557S2;
	Mon, 28 Sep 2026 20:34:23 +0800 (CST)
From: Linkui Xiao <xiaolinkui@126.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linkui Xiao <xiaolinkui@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH net v4] net: stmmac: do not keep the new TSO MSS cached on mapping failures
Date: Mon, 28 Sep 2026 20:34:22 +0800
Message-Id: <20260928123422.1698785-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3P6HPXrpqTCkyAQ--.12557S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr17KFyUur4DJw43Aw13Arb_yoWrAF4rpF
	W5Zws0k34kJr1Sqw48Cw48Xa4Fyayrtay5Cw1UK343Cwsxtr92grySgrWjg34UCFZ5Xr1S
	9anxua43Cr4UJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07ULFxUUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqA8U6mq6Xs9xjgAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053511_279118_BDD02564 
X-CRM114-Status: GOOD (  18.59  )
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

From: Linkui Xiao <xiaolinkui@kylinos.cn>

stmmac_tso_xmit() fills the MSS context descriptor and stores the new MSS
in tx_q->mss right away, but the descriptor only gets its OWN bit much
later, right before the frame is handed to the DMA. Every error path in
between - the dma_map_single() of the linear part and the
skb_frag_dma_map() of each fragment - returns with tx_q->mss already
updated while the MAC is still programmed with the previous MSS.

The context descriptor is now handled like the data descriptors are:
tx_q->cur_tx is not advanced while it is being filled, so the slot stays
where the next transmit fills it, and the error paths release it
explicitly instead of leaving a descriptor the DMA will stop on in the
middle of the ring. With the queue no longer wedged by that descriptor,
the stale cached MSS is what remains: the next skb carrying the same
gso_size compares equal to the cached value, no context descriptor is
emitted, and the hardware segments the TCP stream with the MSS of an
earlier frame, generating frames whose payload size does not match what
the stack accounted for.

Drop the cached value on those paths instead. Zero is what
stmmac_reset_tx_queue() leaves behind, so the next TSO frame programs the
context descriptor again.

The store itself stays ahead of the mappings, as before, rather than
moving next to the OWN bit: stmmac_tx_err() reinitialises the channel and
clears tx_q->mss from the DMA interrupt handler, which takes no TX queue
lock, so it can run in the middle of stmmac_tso_xmit(). Publishing the
cache after the descriptor has been handed over would widen the window in
which such a reset is overwritten with an MSS that the reinitialised
channel was never programmed with.

Fixes: f748be531d70 ("stmmac: support new GMAC4")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
v3:
- Link: https://lore.kernel.org/netdev/20260922124408.645496-1-xiaolinkui@126.com/
Changes in v4:
- Drop the cached MSS on the mapping failure paths instead of publishing it
  after the context descriptor has been given to the DMA. The deferred store
  widened the window in which a stmmac_tx_err() from the DMA interrupt
  handler, which takes no TX queue lock, is overwritten again with the new
  MSS for a channel that was never programmed with it; zero cannot
  republish anything, as it is what the reset itself leaves behind.
  (Sashiko AI review)
- Not carrying over the Acked-by from Lorenzo Bianconi, as the cache
  handling changed again.

 .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index af2d38a2bb3d..a20b2366f61a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4564,9 +4564,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		stmmac_set_mss(priv, mss_desc, mss);
 		tx_q->mss = mss;
-		tx_q->cur_tx = STMMAC_NEXT_ENTRY(tx_q->cur_tx,
-						priv->dma_conf.dma_tx_size);
-		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
 	}
 
 	if (netif_msg_tx_queued(priv)) {
@@ -4577,6 +4574,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	first_entry = tx_q->cur_tx;
+	if (mss_desc)
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
 	entry = first_entry;
 
 	WARN_ON(tx_q->tx_skbuff[entry]);
@@ -4745,6 +4745,16 @@ error_dma_unmap:
 						priv->dma_conf.dma_tx_size);
 	}
 error:
+	if (mss_desc) {
+		/* The context descriptor never reached the DMA, so the MAC is
+		 * still programmed with the previous MSS. Invalidate the cache
+		 * instead of leaving it ahead of the hardware; zero is the
+		 * value stmmac_reset_tx_queue() leaves behind.
+		 */
+		stmmac_release_tx_desc(priv, mss_desc, priv->descriptor_mode);
+		tx_q->mss = 0;
+	}
+
 	dev_err(priv->device, "Tx dma map failed\n");
 	dev_kfree_skb(skb);
 	priv->xstats.tx_dropped++;
-- 
2.25.1


