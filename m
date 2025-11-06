Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB8CCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0PFoYQFQD3v0a3p0/J9i6DxvK68dy02tZEojFdax54Y=; b=u825C6XdRWlXZaSrcE0JpUQT/j
	Gwr88daSpN2+AWz/nRf3tzEQn/ExGoB6BYb61N7AqkwqBgPJduX4Hzbgj3rVavr0EfQ/qomXTIOae
	BzrSE4QGRhihMAwViV5PnU808sF9cJ4jI0tx6k4UJhDpahaGFgxIH7GSlP62gknsv3O2nfmUj9ehY
	6hQDfmvHzD+BPmzBDz7mla0PdQ4DzM0LJEzh393aeCOmn38NgRxa3FJxD0mQDZqUNZ8A9pyrKsArb
	LgOJ1SSVEB03jFRQsIwrn278C2ghTqImaGl6DqymUUaS1JicovYi7WdTUjdq6bv6F4bA3Kvrqg+9X
	KaDkNlxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzUp-0000000FWAW-1uYA;
	Thu, 06 Nov 2025 12:53:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzUo-0000000FWAE-457J;
	Thu, 06 Nov 2025 12:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB8AD601F7;
	Thu,  6 Nov 2025 12:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11ED8C2BC9E;
	Thu,  6 Nov 2025 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762433625;
	bh=qpqMp5e8lEXU9t5JyBNe+DMT96p8uWWzgodHjoDXtyc=;
	h=From:Date:Subject:To:Cc:From;
	b=sK/GHvf0T4ru/v2C1wNir30tUj1EJimdN7YqKaypLWURIAc8WzoazVEchtDcaFK9d
	 GJ3p7ewE5mHyYh5FPL5jRWSJ8fzgIzxx8I2SKMcZsTeke04AcCXUYkc5NrwHJ3UPxm
	 GrdkoJMy45DcRCeeIK+0L0rzrepMmlD550232Hb9gMDFH36+ROJnSQzfh27RDjrb/Q
	 m2aDM4p+1oV3/qpSpiBr6O3UyQf6iLl4f9Z2QUFu7RJTzkb/K8/QP5jnaNMemJTJK8
	 hkfxGViuyx1Zz+kiCMxCFc06QY4Acgm6e89s1EoxtaGDoCRcZUpe8OU8ye8Bj0fOUG
	 +3Oj6H5fuGoPA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 06 Nov 2025 13:53:23 +0100
Subject: [PATCH net-next v2] net: airoha: Add the capability to consume
 out-of-order DMA tx descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-airoha-tx-linked-list-v2-1-0706d4a322bd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEKaDGkC/3WNQQqDMBBFr1Jm3SlJpKhd9R7FxWimOihJmYhYx
 Ls3teuuhvf5/80GiVU4we20gfIiSWLI4M4n6AYKPaP4zOCMu1pjSyTROBDOK04SRvb5pBkN+bZ
 2bUW185C3L+WnrIf30WQecinq+3iz2G/6M1pT/DEuFg22RKasK9d1hbmPrIGnS9Qemn3fP28ee
 Ha7AAAA
X-Change-ID: 20251017-airoha-tx-linked-list-0adb92b8a92d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>, Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2
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

EN7581 and AN7583 SoCs are capable of DMA mapping non-linear tx skbs on
non-consecutive DMA descriptors. This feature is useful when multiple
flows are queued on the same hw tx queue since it allows to fully utilize
the available tx DMA descriptors and to avoid the starvation of
high-priority flow we have in the current codebase due to head-of-line
blocking introduced by low-priority flows.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Drop patch 2/2
- Rely on list_move_tail() wherever possible
- Link to v1: https://lore.kernel.org/r/20251103-airoha-tx-linked-list-v1-0-baa07982cc30@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 85 +++++++++++++++-----------------
 drivers/net/ethernet/airoha/airoha_eth.h |  7 ++-
 2 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 688faf999e4c0a30d53a25877b4a81a33ec7fca2..75893c90a0a17c528c27fc0e986de194e7736637 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -892,19 +892,13 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 
 		dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
 				 DMA_TO_DEVICE);
-		memset(e, 0, sizeof(*e));
+		e->dma_addr = 0;
+		list_add_tail(&e->list, &q->tx_list);
+
 		WRITE_ONCE(desc->msg0, 0);
 		WRITE_ONCE(desc->msg1, 0);
 		q->queued--;
 
-		/* completion ring can report out-of-order indexes if hw QoS
-		 * is enabled and packets with different priority are queued
-		 * to same DMA ring. Take into account possible out-of-order
-		 * reports incrementing DMA ring tail pointer
-		 */
-		while (q->tail != q->head && !q->entry[q->tail].dma_addr)
-			q->tail = (q->tail + 1) % q->ndesc;
-
 		if (skb) {
 			u16 queue = skb_get_queue_mapping(skb);
 			struct netdev_queue *txq;
@@ -949,6 +943,7 @@ static int airoha_qdma_init_tx_queue(struct airoha_queue *q,
 	q->ndesc = size;
 	q->qdma = qdma;
 	q->free_thr = 1 + MAX_SKB_FRAGS;
+	INIT_LIST_HEAD(&q->tx_list);
 
 	q->entry = devm_kzalloc(eth->dev, q->ndesc * sizeof(*q->entry),
 				GFP_KERNEL);
@@ -961,9 +956,9 @@ static int airoha_qdma_init_tx_queue(struct airoha_queue *q,
 		return -ENOMEM;
 
 	for (i = 0; i < q->ndesc; i++) {
-		u32 val;
+		u32 val = FIELD_PREP(QDMA_DESC_DONE_MASK, 1);
 
-		val = FIELD_PREP(QDMA_DESC_DONE_MASK, 1);
+		list_add_tail(&q->entry[i].list, &q->tx_list);
 		WRITE_ONCE(q->desc[i].ctrl, cpu_to_le32(val));
 	}
 
@@ -973,9 +968,9 @@ static int airoha_qdma_init_tx_queue(struct airoha_queue *q,
 
 	airoha_qdma_wr(qdma, REG_TX_RING_BASE(qid), dma_addr);
 	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid), TX_RING_CPU_IDX_MASK,
-			FIELD_PREP(TX_RING_CPU_IDX_MASK, q->head));
+			FIELD_PREP(TX_RING_CPU_IDX_MASK, 0));
 	airoha_qdma_rmw(qdma, REG_TX_DMA_IDX(qid), TX_RING_DMA_IDX_MASK,
-			FIELD_PREP(TX_RING_DMA_IDX_MASK, q->head));
+			FIELD_PREP(TX_RING_DMA_IDX_MASK, 0));
 
 	return 0;
 }
@@ -1031,17 +1026,21 @@ static int airoha_qdma_init_tx(struct airoha_qdma *qdma)
 static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
 {
 	struct airoha_eth *eth = q->qdma->eth;
+	int i;
 
 	spin_lock_bh(&q->lock);
-	while (q->queued) {
-		struct airoha_queue_entry *e = &q->entry[q->tail];
+	for (i = 0; i < q->ndesc; i++) {
+		struct airoha_queue_entry *e = &q->entry[i];
+
+		if (!e->dma_addr)
+			continue;
 
 		dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
 				 DMA_TO_DEVICE);
 		dev_kfree_skb_any(e->skb);
+		e->dma_addr = 0;
 		e->skb = NULL;
-
-		q->tail = (q->tail + 1) % q->ndesc;
+		list_add_tail(&e->list, &q->tx_list);
 		q->queued--;
 	}
 	spin_unlock_bh(&q->lock);
@@ -1883,20 +1882,6 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
 #endif
 }
 
-static bool airoha_dev_tx_queue_busy(struct airoha_queue *q, u32 nr_frags)
-{
-	u32 tail = q->tail <= q->head ? q->tail + q->ndesc : q->tail;
-	u32 index = q->head + nr_frags;
-
-	/* completion napi can free out-of-order tx descriptors if hw QoS is
-	 * enabled and packets with different priorities are queued to the same
-	 * DMA ring. Take into account possible out-of-order reports checking
-	 * if the tx queue is full using circular buffer head/tail pointers
-	 * instead of the number of queued packets.
-	 */
-	return index >= tail;
-}
-
 static int airoha_get_fe_port(struct airoha_gdm_port *port)
 {
 	struct airoha_qdma *qdma = port->qdma;
@@ -1919,8 +1904,10 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	struct airoha_gdm_port *port = netdev_priv(dev);
 	struct airoha_qdma *qdma = port->qdma;
 	u32 nr_frags, tag, msg0, msg1, len;
+	struct airoha_queue_entry *e;
 	struct netdev_queue *txq;
 	struct airoha_queue *q;
+	LIST_HEAD(tx_list);
 	void *data;
 	int i, qid;
 	u16 index;
@@ -1966,7 +1953,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	txq = netdev_get_tx_queue(dev, qid);
 	nr_frags = 1 + skb_shinfo(skb)->nr_frags;
 
-	if (airoha_dev_tx_queue_busy(q, nr_frags)) {
+	if (q->queued + nr_frags >= q->ndesc) {
 		/* not enough space in the queue */
 		netif_tx_stop_queue(txq);
 		spin_unlock_bh(&q->lock);
@@ -1975,11 +1962,13 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 
 	len = skb_headlen(skb);
 	data = skb->data;
-	index = q->head;
+
+	e = list_first_entry(&q->tx_list, struct airoha_queue_entry,
+			     list);
+	index = e - q->entry;
 
 	for (i = 0; i < nr_frags; i++) {
 		struct airoha_qdma_desc *desc = &q->desc[index];
-		struct airoha_queue_entry *e = &q->entry[index];
 		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 		dma_addr_t addr;
 		u32 val;
@@ -1989,7 +1978,14 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		if (unlikely(dma_mapping_error(dev->dev.parent, addr)))
 			goto error_unmap;
 
-		index = (index + 1) % q->ndesc;
+		list_move_tail(&e->list, &tx_list);
+		e->skb = i ? NULL : skb;
+		e->dma_addr = addr;
+		e->dma_len = len;
+
+		e = list_first_entry(&q->tx_list, struct airoha_queue_entry,
+				     list);
+		index = e - q->entry;
 
 		val = FIELD_PREP(QDMA_DESC_LEN_MASK, len);
 		if (i < nr_frags - 1)
@@ -2002,15 +1998,9 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		WRITE_ONCE(desc->msg1, cpu_to_le32(msg1));
 		WRITE_ONCE(desc->msg2, cpu_to_le32(0xffff));
 
-		e->skb = i ? NULL : skb;
-		e->dma_addr = addr;
-		e->dma_len = len;
-
 		data = skb_frag_address(frag);
 		len = skb_frag_size(frag);
 	}
-
-	q->head = index;
 	q->queued += i;
 
 	skb_tx_timestamp(skb);
@@ -2019,7 +2009,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	if (netif_xmit_stopped(txq) || !netdev_xmit_more())
 		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
 				TX_RING_CPU_IDX_MASK,
-				FIELD_PREP(TX_RING_CPU_IDX_MASK, q->head));
+				FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
 
 	if (q->ndesc - q->queued < q->free_thr)
 		netif_tx_stop_queue(txq);
@@ -2029,10 +2019,13 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 error_unmap:
-	for (i--; i >= 0; i--) {
-		index = (q->head + i) % q->ndesc;
-		dma_unmap_single(dev->dev.parent, q->entry[index].dma_addr,
-				 q->entry[index].dma_len, DMA_TO_DEVICE);
+	while (!list_empty(&tx_list)) {
+		e = list_first_entry(&tx_list, struct airoha_queue_entry,
+				     list);
+		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
+				 DMA_TO_DEVICE);
+		e->dma_addr = 0;
+		list_move_tail(&e->list, &q->tx_list);
 	}
 
 	spin_unlock_bh(&q->lock);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index eb27a4ff51984ef376c6e94607ee2dc1a806488b..fbbc58133364baefafed30299ca0626c686b668e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -169,7 +169,10 @@ enum trtcm_param {
 struct airoha_queue_entry {
 	union {
 		void *buf;
-		struct sk_buff *skb;
+		struct {
+			struct list_head list;
+			struct sk_buff *skb;
+		};
 	};
 	dma_addr_t dma_addr;
 	u16 dma_len;
@@ -193,6 +196,8 @@ struct airoha_queue {
 	struct napi_struct napi;
 	struct page_pool *page_pool;
 	struct sk_buff *skb;
+
+	struct list_head tx_list;
 };
 
 struct airoha_tx_irq_queue {

---
base-commit: 0567c84d683d1f38dc41928eec786ec5c02bf7b4
change-id: 20251017-airoha-tx-linked-list-0adb92b8a92d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


