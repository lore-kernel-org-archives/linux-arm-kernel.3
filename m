Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8FCD2AB3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAiX92EH+zU+oYvN+sUJoA56TzA0ah3Ui7+72hvJUBo=; b=ihPGwzubVMannJOprp1W4FRfU0
	KK5/SWxzUC6BWbIQ9ezXoiuePQ86XBLKy3W/vtqtbscslwJyOrqHj9hcXgWeeCCtLvU1JpExBwZHk
	IBBGkG1uRGcFdD756k/n4Iu1Uq1RTz0bFixJgOVwzpTktR8Qht0+HU4cDnho7NV9cvJe0qOz19/2C
	y35acm8i1qt/crCGKi4lO1kTSNPvHS786dBHJeBh8qSykX2Y+Y1g8bkJR/Io235wk4nLrDUhIy8I0
	/TItraqeAjc3UBFtFsB9UdNJGrXM8ppyocJ1iN6sdwSPzaNirgt68WotxBzjfDFsL1SVdMIXVvBtd
	+dRx+rdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lsI-0000000EVas-2zvm;
	Tue, 29 Oct 2024 13:03:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lAK-0000000ENdj-2cC1;
	Tue, 29 Oct 2024 12:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A8A35C5519;
	Tue, 29 Oct 2024 12:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735BAC4CEE3;
	Tue, 29 Oct 2024 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730204259;
	bh=/LUSzupHcKWrdrfuDausc+liN4esxpnvqcwq3WMS2II=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WLeVeK+M273yJDTn4AI99XG7gGJ6pRCpJSFtfw2UFEs5WXvyE2fMSUP1SCTOqu52z
	 Vhy4yZ+vrjD+EY9GjW25n72BbbQGemvpDTTAPowEYDv5+HPdnxM7upEGncuuiBgH66
	 IkulVWJ7nkBoCJlm5N0TrRduHPJdT4x8WwHFqq3rbvVFHJZzTp0W4dsbGFWGVZ9N6d
	 D3ynPfT6+VuzyN+pXrSIekMUvD5WhkvnG3UkMjRr0GVlAINSrZpkwlK2K1g7toQNaf
	 fOc1LwkwpNQb3gzCwQ/5cKWNYKWrLAgXYx15Ct4eQdvaYCb0MmWnzrN+/xYq03XUFr
	 q/gF9+OAykjiA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 29 Oct 2024 13:17:09 +0100
Subject: [PATCH net-next 1/2] net: airoha: Read completion queue data in
 airoha_qdma_tx_napi_poll()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-airoha-en7581-tx-napi-work-v1-1-96ad1686b946@kernel.org>
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
X-CRM114-CacheID: sfid-20241029_051740_783995_35DEDEAF 
X-CRM114-Status: GOOD (  14.63  )
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

In order to avoid any possible race, read completion queue head and
pending entry in airoha_qdma_tx_napi_poll routine instead of doing it in
airoha_irq_handler. Remove unused airoha_tx_irq_queue unused fields.
This is a preliminary patch to add Qdisc offload for airoha_eth driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 31 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index f463a505f5babed3e8e53bf62c92290fc94b3525..6cd8901ed38f0640a8a8f72174c120668b364045 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -752,11 +752,9 @@ struct airoha_tx_irq_queue {
 	struct airoha_qdma *qdma;
 
 	struct napi_struct napi;
-	u32 *q;
 
 	int size;
-	int queued;
-	u16 head;
+	u32 *q;
 };
 
 struct airoha_hw_stats {
@@ -1656,25 +1654,31 @@ static int airoha_qdma_init_rx(struct airoha_qdma *qdma)
 static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
 {
 	struct airoha_tx_irq_queue *irq_q;
+	int id, done = 0, irq_queued;
 	struct airoha_qdma *qdma;
 	struct airoha_eth *eth;
-	int id, done = 0;
+	u32 status, head;
 
 	irq_q = container_of(napi, struct airoha_tx_irq_queue, napi);
 	qdma = irq_q->qdma;
 	id = irq_q - &qdma->q_tx_irq[0];
 	eth = qdma->eth;
 
-	while (irq_q->queued > 0 && done < budget) {
-		u32 qid, last, val = irq_q->q[irq_q->head];
+	status = airoha_qdma_rr(qdma, REG_IRQ_STATUS(id));
+	head = FIELD_GET(IRQ_HEAD_IDX_MASK, status);
+	head = head % irq_q->size;
+	irq_queued = FIELD_GET(IRQ_ENTRY_LEN_MASK, status);
+
+	while (irq_queued > 0 && done < budget) {
+		u32 qid, last, val = irq_q->q[head];
 		struct airoha_queue *q;
 
 		if (val == 0xff)
 			break;
 
-		irq_q->q[irq_q->head] = 0xff; /* mark as done */
-		irq_q->head = (irq_q->head + 1) % irq_q->size;
-		irq_q->queued--;
+		irq_q->q[head] = 0xff; /* mark as done */
+		head = (head + 1) % irq_q->size;
+		irq_queued--;
 		done++;
 
 		last = FIELD_GET(IRQ_DESC_IDX_MASK, val);
@@ -2026,20 +2030,11 @@ static irqreturn_t airoha_irq_handler(int irq, void *dev_instance)
 
 	if (intr[0] & INT_TX_MASK) {
 		for (i = 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++) {
-			struct airoha_tx_irq_queue *irq_q = &qdma->q_tx_irq[i];
-			u32 status, head;
-
 			if (!(intr[0] & TX_DONE_INT_MASK(i)))
 				continue;
 
 			airoha_qdma_irq_disable(qdma, QDMA_INT_REG_IDX0,
 						TX_DONE_INT_MASK(i));
-
-			status = airoha_qdma_rr(qdma, REG_IRQ_STATUS(i));
-			head = FIELD_GET(IRQ_HEAD_IDX_MASK, status);
-			irq_q->head = head % irq_q->size;
-			irq_q->queued = FIELD_GET(IRQ_ENTRY_LEN_MASK, status);
-
 			napi_schedule(&qdma->q_tx_irq[i].napi);
 		}
 	}

-- 
2.47.0


