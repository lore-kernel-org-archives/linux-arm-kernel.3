Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F966C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0MJtPJukxDHokGFqPIDOiixqdEoWYSRe1kuishwSmuQ=; b=WU3eI+SaThOISdtiGMt+NeYnhi
	ynL1r6HMxJd3ARKfYW3JGxaiilrE+zTsQT29Cmqv2835Hyk5IxPUgnHm9zbOrczPnrjBUBikgkWoC
	gPjCa3AC/8C6mRIdqjwVhntcM67EC7AmhEpvG0R5pGuaowVv/vyBeTWA6cZG/7ghd8H5gRuXr6sLr
	kTW0qAlJxytjt/Zfad6oD/uUr8oNX7UYtxp+o7qHV2G3m8NCBtueozjt80Pc+tZgMXz2UVSm4sAg1
	bSqcBLOH3xx8I6OoAJcW+k/3OWGXKTCr/umEpj1KqnJZfGfELICP9babT8xJv2gWO04pH1b0Mqpv0
	Zv9fLFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8AsF-0000000GyuZ-2Ry7;
	Sun, 20 Sep 2026 06:18:03 +0000
Received: from mail-proxy49145.mail.163.com ([45.254.49.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8AsB-0000000Gyti-0WZ5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 06:18:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0M
	JtPJukxDHokGFqPIDOiixqdEoWYSRe1kuishwSmuQ=; b=G8T1U/IWWh3Iq+QoWS
	Dli0CFPLBlZhIK4dcX3ut2r7eRcPFmWcYJvUbyrARGulY8JDxS7ltH5o+lBMYhBn
	xTbPici6Nsz0dj92Kvdp0ihNq4YZQXdnQwL2YS2OXlqG420iejsQEmx7SyzEy4z4
	mXvGzs5sGddTvMeij3qnwlpBI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3xwwqeq9qij3sBg--.31149S2;
	Sun, 20 Sep 2026 14:16:12 +0800 (CST)
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
Subject: [PATCH net v2] net: stmmac: do not cache the new TSO MSS before it reaches the DMA
Date: Sun, 20 Sep 2026 14:16:09 +0800
Message-Id: <20260920061609.1919876-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3xwwqeq9qij3sBg--.31149S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr17KFyUur4DJw43Aw13Arb_yoW5KFyDpF
	4UAa90yr98Jr4fXw48Cw40qa45Ja95tayYkw18G3sxGw4ayryvgryfKrW8G34UCFyrZr1S
	ka129a43Ar4UXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlhFsUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqAwwB2qveixC+wAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_231759_413595_2FA4FE48 
X-CRM114-Status: GOOD (  15.01  )
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
updated while the MAC is still programmed with the previous MSS; the
abandoned context descriptor is later reclaimed by stmmac_tx_clean().

The next skb carrying the same MSS then compares equal to the cached
value, so no context descriptor is emitted and the hardware segments the
TCP stream with a stale MSS, generating frames whose payload size does
not match what the stack accounted for.

Update tx_q->mss only once the context descriptor has been given to the
DMA, so that the cached value always describes what the hardware is
actually programmed with.

The context descriptor is now handled like the data descriptors are:
tx_q->cur_tx is not advanced while it is being filled. Whether the frame
can be queued is only known after every dma_map_single() and
skb_frag_dma_map() has succeeded, so the descriptor stays at the slot
tx_q->cur_tx points to and the index moves past it later, together with
the data descriptors. That also keeps the context descriptor outside the
range stmmac_tx_clean() walks when the ring is cleaned after a failure,
so the error paths have to release it explicitly.

Fixes: f748be531d70 ("stmmac: support new GMAC4")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
---
Changes in v2:
- Do not advance tx_q->cur_tx while the context descriptor is filled, as
  for the data descriptors, and release the context descriptor on the
  error paths instead of leaving it to stmmac_tx_clean(). (Lorenzo Bianconi)

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index af2d38a2bb3d..e2e680dd980c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4563,10 +4563,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 			mss_desc = &tx_q->dma_tx[tx_q->cur_tx];
 
 		stmmac_set_mss(priv, mss_desc, mss);
-		tx_q->mss = mss;
-		tx_q->cur_tx = STMMAC_NEXT_ENTRY(tx_q->cur_tx,
-						priv->dma_conf.dma_tx_size);
-		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
 	}
 
 	if (netif_msg_tx_queued(priv)) {
@@ -4577,6 +4573,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	first_entry = tx_q->cur_tx;
+	if (mss_desc)
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
 	entry = first_entry;
 
 	WARN_ON(tx_q->tx_skbuff[entry]);
@@ -4714,6 +4713,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 		 */
 		dma_wmb();
 		stmmac_set_tx_owner(priv, mss_desc);
+		tx_q->mss = mss;
 	}
 
 	if (netif_msg_pktdata(priv)) {
@@ -4745,6 +4745,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 						priv->dma_conf.dma_tx_size);
 	}
 error:
+	if (mss_desc)
+		stmmac_release_tx_desc(priv, mss_desc, priv->descriptor_mode);
+
 	dev_err(priv->device, "Tx dma map failed\n");
 	dev_kfree_skb(skb);
 	priv->xstats.tx_dropped++;
-- 
2.25.1


