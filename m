Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC5110ED645
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zhDhjLrf7YoZnOLrf6qk6WfuLrEvkjkrqmkaEY40rcA=; b=wPfk7K4HlQzvjMNu/m9g7HkPbc
	xaKz8qllU/+CW0aOlHcNFlmyIH2JDTQn2fYZ7bvIaviLHTivdq3nGZoaP6GGhabZBJzMq8XT+1fPU
	sHdN+1DBmVSXX8h/dh5cpFuJrkILFZ3/AY9G+qzWAF+dDHTZl0/kEhdBTHZzXtaXA8VxlA365OdV1
	+ZpjJHYgh4oQ6+TtpJLckoF1iTz/sCiqrb8gxBRHmELI04uiK6Q4YBSWyvzGy6+WgQL/VFBrroOD8
	PkMQSxKqsFvz2p7m0B+zgkQjhIb9qI+4bQCYkAzDScOrDAMGfQ+FaPG284XDrg87dspU41ZauisBS
	Ofo/rFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63oK-000000076kq-14BX;
	Fri, 27 Mar 2026 09:49:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63oH-000000076k4-0L2d;
	Fri, 27 Mar 2026 09:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EDFB401B6;
	Fri, 27 Mar 2026 09:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D6DC2BCB2;
	Fri, 27 Mar 2026 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774604935;
	bh=mxd+97vIOAnLehTvk1vdsvxt2oKWOD4syysFg/2MUkY=;
	h=From:Date:Subject:To:Cc:From;
	b=khNPZwTCoQkFOnTxuFEFYovhH2GFOXF+iyaEgLEjRFNIyBoUFJxvExBkvyovF1QKw
	 hE0qXlTWnJ2ca1ppfekD7Adhq6vEncctlmYZZP8djKuGLQZ091e6gmhnpfWAlUERHb
	 su6zzaTsLZ45SBTQDkXTqOrSKTNddhlctHaOj+0Oflm6zhMW1itshcHvcqLbzAwQsa
	 Sgeif7wj1yS5hidfTK4ROGt0Ks/5y4DADsS4cP53JDLKTbWOPV7jdUtJsqxZrnskeh
	 rfO2hF+jQOfoeskcVeXajc5sG2jUDKmIZ7z4u8uafkLjwjPHJq2XjY1kfzVJQhj4Bm
	 yHWUmHiDEZIxg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 27 Mar 2026 10:48:21 +0100
Subject: [PATCH net] net: airoha: Add missing cleanup bits in
 airoha_qdma_cleanup_rx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-airoha_qdma_cleanup_rx_queue-fix-v1-1-369d6ab1511a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NwQqDMBAFf0X23EBMqLT9FSlha551oY26ISKI/
 97Q48xh5qAMFWR6NAcpNskypwrtpaFh4vSGkViZnHWd9a4zLDpPHNb45TB8wKksQfewFhSYUXZ
 zxRhv8Hf3ipZqZlFU/V/0z/P8AaT+eVpyAAAA
X-Change-ID: 20260326-airoha_qdma_cleanup_rx_queue-fix-5efd8e392bd0
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Madhur Agrawal <Madhur.Agrawal@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_024857_165761_CA17B3D1 
X-CRM114-Status: GOOD (  10.44  )
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

In order to properly cleanup hw rx QDMA queues and bring the device to
the initial state, reset rx DMA queue head/tail index. Moreover, reset
queued DMA descriptor fields.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Tested-by: Madhur Agrawal <Madhur.Agrawal@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 56cf9a926a83da38bb03373ced9728f1fecdbce7..c2a54dbcbb0d576da298f2a36a354afaef89b240 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -794,18 +794,34 @@ static int airoha_qdma_init_rx_queue(struct airoha_queue *q,
 
 static void airoha_qdma_cleanup_rx_queue(struct airoha_queue *q)
 {
-	struct airoha_eth *eth = q->qdma->eth;
+	struct airoha_qdma *qdma = q->qdma;
+	struct airoha_eth *eth = qdma->eth;
+	int qid = q - &qdma->q_rx[0];
 
 	while (q->queued) {
 		struct airoha_queue_entry *e = &q->entry[q->tail];
+		struct airoha_qdma_desc *desc = &q->desc[q->tail];
 		struct page *page = virt_to_head_page(e->buf);
 
 		dma_sync_single_for_cpu(eth->dev, e->dma_addr, e->dma_len,
 					page_pool_get_dma_dir(q->page_pool));
 		page_pool_put_full_page(q->page_pool, page, false);
+		/* Reset DMA descriptor */
+		WRITE_ONCE(desc->ctrl, 0);
+		WRITE_ONCE(desc->addr, 0);
+		WRITE_ONCE(desc->data, 0);
+		WRITE_ONCE(desc->msg0, 0);
+		WRITE_ONCE(desc->msg1, 0);
+		WRITE_ONCE(desc->msg2, 0);
+		WRITE_ONCE(desc->msg3, 0);
+
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
 	}
+
+	q->head = q->tail;
+	airoha_qdma_rmw(qdma, REG_RX_DMA_IDX(qid), RX_RING_DMA_IDX_MASK,
+			FIELD_PREP(RX_RING_DMA_IDX_MASK, q->tail));
 }
 
 static int airoha_qdma_init_rx(struct airoha_qdma *qdma)

---
base-commit: ae05340ccaa9d347fe85415609e075545bec589f
change-id: 20260326-airoha_qdma_cleanup_rx_queue-fix-5efd8e392bd0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


