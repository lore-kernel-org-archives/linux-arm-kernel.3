Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11876F327AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4kXr04xPQupD3IbEqKXAANHc14Vb5ok50ScuvHUg79U=; b=41h5qaw0X51ZbVVPGbnpbgeMJ8
	PKwBlNXwz+M0PndDhAnORmAL7w/bltREM9ruajxAyrLoKK163Kz1tlh6f4cx96+zRJ/ETLhkIEVlF
	HfXBKcTxbIaMJ3qmnRN1T7mwOuN+BGDwUdVHA51mo66GGz7VeaAyQKp6fC6lKJaVaVuDdPpRYiuYN
	f4WGqZcE2xCk1FN/jmiUVf2tLaWw35H/uVY1DYlgQeqN0sB/laGxywq5/8qNh4kyHYe5JIdnrOFG3
	bD86Vo4af4uDp53S8KoWSom1Vq0aE0HPuMuvagawdnM93pBFYDyRnAXqSoqeixxo9usuIp1DUXap5
	jkxOoShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4ht-000000086g7-3sCP;
	Tue, 21 Apr 2026 06:35:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4ht-000000086fs-0BQB;
	Tue, 21 Apr 2026 06:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DC1C60018;
	Tue, 21 Apr 2026 06:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405FBC2BCB0;
	Tue, 21 Apr 2026 06:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776753335;
	bh=HFRROKnDutWrDUQ/r5EJQStec0lggxTMibf91XTkYuk=;
	h=From:Date:Subject:To:Cc:From;
	b=MP50jThUvzNGx0PUcXjmv7mIOARG3zBySFo5paK3DNunG/Sen7sttndf8JSAmjDt0
	 5nwj3V/xu8DVn4INc0A0l4VtBfG74GR2jUy/XkbAV2Cqy2HpfgtKbcvV429w9X/r4P
	 D7Opi/NsoL06ACklTc9aBOfWoSEz4N4x3NOpaXAGvBc1nix7DvgvnFbGovCu53Uui8
	 NBcwmt41X2aht08casV2T+9vVvP92oOIaXCMFlQSYXDh1P6FXVONcVNdFX5cl+sQoo
	 1qFxY55vIv7V2TvqOAmeq6vv/Kwdu3G+96bmlniBRdMGFZm6kI3APDsp/81t8L1Vjv
	 HgOpFkL3mpd3g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 21 Apr 2026 08:35:11 +0200
Subject: [PATCH net] net: airoha: fix BQL imbalance in TX path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-airoha-fix-bql-v1-1-f135afe4275b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsEkkvpKdFBbcyGsNCIQ/550H
 IaZDIkiU4KpyRDp4cRHqNC1DVivw0bIa2WQQg6ilx1qjofX6PhFc+2onHPKkjF21FCjM1JV/3C
 GQDcspXzouyTAZQAAAA==
X-Change-ID: 20260421-airoha-fix-bql-7fff7cebbc9a
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hariprasad Kelam <hkelam@marvell.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

Fix a possible BQL imbalance in airoha_dev_xmit(), where inflight
packets are accounted only for the AIROHA_NUM_TX_RING netdev TX
queues. The queue index is computed as:

    qid = skb_get_queue_mapping(skb) % ARRAY_SIZE(qdma->q_tx)
    txq = netdev_get_tx_queue(dev, qid);

However, airoha_qdma_tx_napi_poll() accounts completions across all
netdev TX queues (num_tx_queues), leading to inconsistent BQL
accounting.

Also reset all netdev TX queues in the ndo_stop callback.

Fixes: 1d304174106c ("net: airoha: Implement BQL support")
Fixes: c9f947769b77 ("net: airoha: Reset BQL stopping the netdevice")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 19f67c7dd8e1..6c7390f0de5d 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -929,10 +929,9 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 		q->queued--;
 
 		if (skb) {
-			u16 queue = skb_get_queue_mapping(skb);
 			struct netdev_queue *txq;
 
-			txq = netdev_get_tx_queue(skb->dev, queue);
+			txq = skb_get_tx_queue(skb->dev, skb);
 			netdev_tx_completed_queue(txq, 1, skb->len);
 			dev_kfree_skb_any(skb);
 		}
@@ -1711,7 +1710,7 @@ static int airoha_dev_stop(struct net_device *dev)
 	if (err)
 		return err;
 
-	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
+	for (i = 0; i < dev->num_tx_queues; i++)
 		netdev_tx_reset_subqueue(dev, i);
 
 	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
@@ -2002,7 +2001,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 
 	spin_lock_bh(&q->lock);
 
-	txq = netdev_get_tx_queue(dev, qid);
+	txq = skb_get_tx_queue(dev, skb);
 	nr_frags = 1 + skb_shinfo(skb)->nr_frags;
 
 	if (q->queued + nr_frags >= q->ndesc) {

---
base-commit: a663bac71a2f0b3ac6c373168ca57b2a6e6381aa
change-id: 20260421-airoha-fix-bql-7fff7cebbc9a

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


