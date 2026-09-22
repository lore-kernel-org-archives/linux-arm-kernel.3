Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8715CC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dJ/NF/IKzyTCf3s98R9LljNUJNr1ysT/7jTS8YD1kDA=; b=fsVCzh8L6WJaHN71Mz+ghOQzSY
	vuDZpNlmOPVBMgOtBsYmpAxW01KWH2/PDpcFonFKCRQtNNtS1x8jGhf5V0tTwjnFU3UFKq8RkTRdj
	1CaXJsHSFdaUmQjashPOL19yJ9D8cmRq5Vh74v0XwKP4j8S4XZ2fFuQlgir5DBaXkDyZQxUpvV1GD
	I5/GbVbB8NGVYtOUZN0KZ6RWoS9xf1NZbtfHCUSF88b5bHuGrPTFmmeWbluRHGYMzEq+dF8dlhFLO
	5hhJ7DmoM2jzOZOI439Sj7HmirMWWgmRAGwJ9EclNWVgCl3ypUbynLW/6fx/c+rJWpSaHhv59oVPc
	YjBI6lBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zru-00000005LUV-0QgP;
	Tue, 22 Sep 2026 12:45:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zrt-00000005LU5-0myJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 12:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dJ/NF/IKzyTCf3s98R9LljNUJNr1ysT/7jTS8YD1kDA=; b=HjrRXEvDxCc0d39B0tFfp2iomG
	VFf5O1fbAkb8LOoHNjIo415Ha94yRAWC0NNKi1HI7raRLXUein0KL74AtUhqgmM6BCpzni7iH60C9
	KkCiuuVMK12cAUfDybHAx4mohDmgkNF9DETQ5Yc+lbM7BDZq/rpnwYWVusotE4WWZLVwCcgtjVLFC
	tOyld8MyyplzhebQz2iOYD52aJ9EJQiXzKENhcg4nn2fiabndirwUhoY4s9BXfxMMzfPgkzD3R1W4
	mb9tbUA492ck4vsFZHbI2nRQKiYZreNSiAhIpGD0ZX4fxK0SFpBsIWBBCwgpxfi9in3wKHQ/l4tde
	SSdFgFRw==;
Received: from m16.mail.126.com ([220.197.31.9])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8zrn-0000000DZBy-0iYh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dJ
	/NF/IKzyTCf3s98R9LljNUJNr1ysT/7jTS8YD1kDA=; b=pIw/gEsw9hc1kv9ou/
	jvGzbKBcUQ31Ucys3yYzr7CAgtmNo8A2er9874K7ht7fKVc1qN4vqf3b4TwhpFl0
	nKg7uJXyEiIhv0UwwzGcu6QYNE2CI1lZ0F/ZH1XLBaFFOtHnqhVc+MKcuFFobgw6
	bmV5IPQs57ZzAChDwKhdApAUc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3f90ZeLJqrJ0eAA--.64182S2;
	Tue, 22 Sep 2026 20:44:09 +0800 (CST)
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
	stable@vger.kernel.org,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v3] net: stmmac: do not cache the new TSO MSS before it reaches the DMA
Date: Tue, 22 Sep 2026 20:44:08 +0800
Message-Id: <20260922124408.645496-1-xiaolinkui@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3f90ZeLJqrJ0eAA--.64182S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr17KFyUur4DJw43Aw13Arb_yoWrZrWxpF
	4UZa90yr95Jr1fWw48C3y0va45Jayrtay5Cw18G3sxCwsIyryvgryfKrWUWa4UAF95ZF1a
	ka1q9asxAF4UJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul-ewUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqRlrQmqyeBnq-AAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_134459_723035_1BFB0593 
X-CRM114-Status: GOOD (  17.60  )
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

The abandoned context descriptor is never handed to the DMA:
stmmac_set_mss() does not set the OWN bit, and the error paths return
before stmmac_flush_tx_descriptors(), which is the only place that
advances the TX tail pointer. When a later xmit advances the tail pointer
past the abandoned slot, the DMA stops on the not-owned context
descriptor and suspends; stmmac_tx_clean() then reclaims the slot in
software but stops at the first descriptor the DMA still owns, so the
ring can never wrap around. The queue stalls until the watchdog fires
and stmmac_tx_err() resets the channel, which also clears the stale
tx_q->mss via stmmac_reset_tx_queue().

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
so the error paths have to release it explicitly. A mapping failure
therefore leaves the slot reusable instead of parked in the middle of
the ring as a descriptor the DMA will stop on.

Fixes: f748be531d70 ("stmmac: support new GMAC4")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v3:
- Rewrote the failure description in the commit message: after a mapping
  failure the not-owned context descriptor wedges the TX ring (the DMA
  suspends on it, stmmac_tx_clean() pins dirty_tx, only the watchdog
  reset recovers), it does not produce mis-sized segments as previously
  claimed. No code change. (Sashiko AI review)
- Kept Lorenzo's Acked-by, as the patch is unchanged from v2.
- Link: https://lore.kernel.org/all/20260920061609.1919876-1-xiaolinkui@126.com/

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a268cd4acdef..276187f50ee3 100644
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


