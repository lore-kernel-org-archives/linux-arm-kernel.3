Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDDFF8E4AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 06:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFFVvPkdADRuERrXiXoq3ADdwuv0fXrqSCXuIlv0AJA=; b=L4gYLUaMZDU7uaQfa9hAnu9lJ5
	sGGhAiU/IYMqkb1B0KkHAXtWaUzaIQFigd2QG2lLhDP4zmmuwc0bY9oIyksDLj/kRhO8CMVKfVpjA
	Vhj+EVD2rC7vptputotJ9PW16d9H8Chf9DuKgri21RT7O08pxc/0LzMaqxutanw6omtZqwPpag8+a
	WUFNEP/icwKk5QhDyM5ot9VahQGc2tQp+PS5lAy2dZ4aIphC7VXUPa5rzE361TDsw9i9bFhjop3ll
	rgCtMyanlfHSdFxsqMuE7FKdMXcktMK2rG2A1VQxZ5WR+Ff0hyHfWJGwG/CZ6YubIr27ji01IwwTg
	EXEQmkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcqF-00000003Xz3-0tiC;
	Fri, 17 Apr 2026 06:38:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcqC-00000003Xw2-2hoC;
	Fri, 17 Apr 2026 06:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 281C944207;
	Fri, 17 Apr 2026 06:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A672DC19425;
	Fri, 17 Apr 2026 06:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776407892;
	bh=Z7oCi67s+UIvW6RHxfyBFr2akdeR2wnrV1Cz1XBiANA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HGvbvYG+BQHBleQfWUTUZ0EJM7fMY9laOrXwUiHkxoH4jJhfBejIpLoyUre6scfn8
	 HpzvplHuJ/gCPduC2bmLYpfDuy7AvkNuRQ1SYqjQ3V3Vb9wOtF66yRkniK1O62ONk4
	 A4wTFtHvMqTcmJNzWp1uNhdXfxyPujoLOuaL73WmJpjaxuoeyuT5xbBDoRcVhdBRhT
	 PDwr0i7JXYR5us3p0U9AP3Rw5kcIXQLNq9y3V5V+8tY9caxdN/rMxsQEXivRKnph49
	 nmRu6a825PxpxZwGG8gLCUG41JA0vndGrJPxb+LoCRpFJ/+mfY9DYq15HFRtTotbQq
	 BSTdo9zPKKT2g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 17 Apr 2026 08:36:32 +0200
Subject: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
In-Reply-To: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_233813_076674_62D6AEBB 
X-CRM114-Status: GOOD (  13.72  )
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

Similar to airoha_qdma_cleanup_rx_queue(), reset DMA TX descriptors in
airoha_qdma_cleanup_tx_queue routine. Moreover, reset TX_DMA_IDX to
TX_CPU_IDX to notify the NIC the QDMA TX ring is empty.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 690bfaf8d7d9..6d9f82c677a0 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1039,12 +1039,15 @@ static int airoha_qdma_init_tx(struct airoha_qdma *qdma)
 
 static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
 {
-	struct airoha_eth *eth = q->qdma->eth;
-	int i;
+	struct airoha_qdma *qdma = q->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	int i, qid = q - &qdma->q_tx[0];
+	u16 index = 0;
 
 	spin_lock_bh(&q->lock);
 	for (i = 0; i < q->ndesc; i++) {
 		struct airoha_queue_entry *e = &q->entry[i];
+		struct airoha_qdma_desc *desc = &q->desc[i];
 
 		if (!e->dma_addr)
 			continue;
@@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
 		e->dma_addr = 0;
 		e->skb = NULL;
 		list_add_tail(&e->list, &q->tx_list);
+
+		/* Reset DMA descriptor */
+		WRITE_ONCE(desc->ctrl, 0);
+		WRITE_ONCE(desc->addr, 0);
+		WRITE_ONCE(desc->data, 0);
+		WRITE_ONCE(desc->msg0, 0);
+		WRITE_ONCE(desc->msg1, 0);
+		WRITE_ONCE(desc->msg2, 0);
+
 		q->queued--;
 	}
+
+	if (!list_empty(&q->tx_list)) {
+		struct airoha_queue_entry *e;
+
+		e = list_first_entry(&q->tx_list, struct airoha_queue_entry,
+				     list);
+		index = e - q->entry;
+	}
+	/* Set TX_DMA_IDX to TX_CPU_IDX to notify the hw the QDMA TX ring is
+	 * empty.
+	 */
+	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid), TX_RING_CPU_IDX_MASK,
+			FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
+	airoha_qdma_rmw(qdma, REG_TX_DMA_IDX(qid), TX_RING_DMA_IDX_MASK,
+			FIELD_PREP(TX_RING_DMA_IDX_MASK, index));
+
 	spin_unlock_bh(&q->lock);
 }
 

-- 
2.53.0


