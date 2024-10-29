Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAB3D2AB3B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGBrW6s1iDZGgAw1vKKsS6IoQiQB5AZQ9VznYANSAto=; b=e3w+RgzPBUtqoIGxgcPm5TF5mw
	3YGPhjyYzPW244guFfg4hz4tGioSd/UaIdsrbODOv7yNJR/m61LS5q/EWwitjlcTDty6fGjw9IepR
	JXi26ULZ3IupVvfLNr+id4wcCD4LnxWoWalZrle2EPVWQzXldDzIi6IiGKTo+FC+CaUfo7u3fOp3n
	bgH9fPAA8q9IlZusT2SqMVbBEgbNrB61L245azrWBT7U0a19keP2QDpwpg91XeAIJEwp6RnDsiy67
	/e5N1j8SWvvJgoPR66gLwWh3lPTBJy38qDsY9l242Jk0nMPCQpDIkoY8W1pzCT1TXAF+t9J8kHbmN
	aQynW2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ltu-0000000EVxH-0d08;
	Tue, 29 Oct 2024 13:04:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lAN-0000000ENeI-1zty;
	Tue, 29 Oct 2024 12:17:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E56125C5C81;
	Tue, 29 Oct 2024 12:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA1DC4CECD;
	Tue, 29 Oct 2024 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730204262;
	bh=tDkCaSGHNwLmvBZ1sIOYlpYZET0YJNWlUhpzReHjttw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ce2LSR3SW+LRk8THt1OeL4bpr+mNwqDl0mPzdmsISqGfIPtUBe83bur1Ygs9dJ35w
	 gx7NWDaEaKeESZzZkQ6ceNbW8LH4F7CM8EVuuvqXEg8mYx56v7TyktNXWbNA+RNJD+
	 UCbD7hvACBiZs/27X7JKPOnKPmlK4Fo4HWGoMmV88DbK0vkfGhLU6XmMIjh9ugU1Y2
	 UOjHMRMTrHnj0cK8pmjYH+jO2UK+iSQRor3dhhpeG7TRcLCwIeXsSUEL2bcHOZlIMB
	 JidWfF7VevZwn89oYrl0wFKIeuWx740m7iSZOUlq0c7Bjyd3SSfuMUc3dgqfkCUIWH
	 CcjSTnP6TlpWw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 29 Oct 2024 13:17:10 +0100
Subject: [PATCH net-next 2/2] net: airoha: Simplify Tx napi logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-airoha-en7581-tx-napi-work-v1-2-96ad1686b946@kernel.org>
References: <20241029-airoha-en7581-tx-napi-work-v1-0-96ad1686b946@kernel.org>
In-Reply-To: <20241029-airoha-en7581-tx-napi-work-v1-0-96ad1686b946@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_051743_638148_B6EE01FD 
X-CRM114-Status: GOOD (  15.44  )
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

Simplify Tx napi logic relying just on the packet index provided by
completion queue indicating the completed packet that can be removed
from the Tx DMA ring.
This is a preliminary patch to add Qdisc offload for airoha_eth driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 73 +++++++++++++++++-------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 6cd8901ed38f0640a8a8f72174c120668b364045..6c683a12d5aa52dd9d966df123509075a989c0b3 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -1670,8 +1670,12 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 	irq_queued = FIELD_GET(IRQ_ENTRY_LEN_MASK, status);
 
 	while (irq_queued > 0 && done < budget) {
-		u32 qid, last, val = irq_q->q[head];
+		u32 qid, val = irq_q->q[head];
+		struct airoha_qdma_desc *desc;
+		struct airoha_queue_entry *e;
 		struct airoha_queue *q;
+		u32 index, desc_ctrl;
+		struct sk_buff *skb;
 
 		if (val == 0xff)
 			break;
@@ -1681,9 +1685,7 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 		irq_queued--;
 		done++;
 
-		last = FIELD_GET(IRQ_DESC_IDX_MASK, val);
 		qid = FIELD_GET(IRQ_RING_IDX_MASK, val);
-
 		if (qid >= ARRAY_SIZE(qdma->q_tx))
 			continue;
 
@@ -1691,46 +1693,53 @@ static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 		if (!q->ndesc)
 			continue;
 
+		index = FIELD_GET(IRQ_DESC_IDX_MASK, val);
+		if (index >= q->ndesc)
+			continue;
+
 		spin_lock_bh(&q->lock);
 
-		while (q->queued > 0) {
-			struct airoha_qdma_desc *desc = &q->desc[q->tail];
-			struct airoha_queue_entry *e = &q->entry[q->tail];
-			u32 desc_ctrl = le32_to_cpu(desc->ctrl);
-			struct sk_buff *skb = e->skb;
-			u16 index = q->tail;
+		if (!q->queued)
+			goto unlock;
 
-			if (!(desc_ctrl & QDMA_DESC_DONE_MASK) &&
-			    !(desc_ctrl & QDMA_DESC_DROP_MASK))
-				break;
+		desc = &q->desc[index];
+		desc_ctrl = le32_to_cpu(desc->ctrl);
 
-			q->tail = (q->tail + 1) % q->ndesc;
-			q->queued--;
+		if (!(desc_ctrl & QDMA_DESC_DONE_MASK) &&
+		    !(desc_ctrl & QDMA_DESC_DROP_MASK))
+			goto unlock;
 
-			dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
-					 DMA_TO_DEVICE);
+		e = &q->entry[index];
+		skb = e->skb;
 
-			WRITE_ONCE(desc->msg0, 0);
-			WRITE_ONCE(desc->msg1, 0);
+		dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
+				 DMA_TO_DEVICE);
+		memset(e, 0, sizeof(*e));
+		WRITE_ONCE(desc->msg0, 0);
+		WRITE_ONCE(desc->msg1, 0);
+		q->queued--;
 
-			if (skb) {
-				u16 queue = skb_get_queue_mapping(skb);
-				struct netdev_queue *txq;
+		/* completion ring can report out-of-order indexes if hw QoS
+		 * is enabled and packets with different priority are queued
+		 * to same DMA ring. Take into account possible out-of-order
+		 * reports incrementing DMA ring tail pointer
+		 */
+		while (q->tail != q->head && !q->entry[q->tail].dma_addr)
+			q->tail = (q->tail + 1) % q->ndesc;
 
-				txq = netdev_get_tx_queue(skb->dev, queue);
-				netdev_tx_completed_queue(txq, 1, skb->len);
-				if (netif_tx_queue_stopped(txq) &&
-				    q->ndesc - q->queued >= q->free_thr)
-					netif_tx_wake_queue(txq);
+		if (skb) {
+			u16 queue = skb_get_queue_mapping(skb);
+			struct netdev_queue *txq;
 
-				dev_kfree_skb_any(skb);
-				e->skb = NULL;
-			}
+			txq = netdev_get_tx_queue(skb->dev, queue);
+			netdev_tx_completed_queue(txq, 1, skb->len);
+			if (netif_tx_queue_stopped(txq) &&
+			    q->ndesc - q->queued >= q->free_thr)
+				netif_tx_wake_queue(txq);
 
-			if (index == last)
-				break;
+			dev_kfree_skb_any(skb);
 		}
-
+unlock:
 		spin_unlock_bh(&q->lock);
 	}
 

-- 
2.47.0


