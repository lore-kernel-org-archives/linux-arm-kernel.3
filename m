Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED3CC54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zTU1i6ZLwAcGazYmH7a8ZQ7oeTecxGNQB1+HH2d7i24=; b=nsh1Uwpj4e8mkFN3n9szFOj2W5
	9MZzJz3Ad9lSUdH3soLdO4gx0mXauNS6b3MCEVqArzQvx/Hpqmhb3wmfRurproWLnJRPdeHmlLMcj
	xa1WHHEiv9r3THJB7jP6/i70GcUd1o/EGk3evuX9zDKitGr29EpQv883dr5fTKoB9nu/0yvd0Rpoz
	vOF/bSDYUBSEGhHyvCxxRiKSctn3PMlXAAHJ0ZFmFQzfEy7tMOgdv34bc7k98PaqNArYs0KDlLP6r
	4+LKCftmZvQc0+H0d6t6scl6CU9kY3UFcKsuQTgmwYNW8e5MT4ZfdcPkafICela7S57iMWrjHSYit
	/EoOzXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSbE-0000000HDaF-1Auc;
	Thu, 15 May 2025 07:01:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFS9w-0000000H9sK-0Gid;
	Thu, 15 May 2025 06:33:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAF8D43CE6;
	Thu, 15 May 2025 06:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EF2C4CEE9;
	Thu, 15 May 2025 06:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747290815;
	bh=cbgw9V6+Bp5MHHZNIW3rwxi/2ijk9oU/XpwF92m4FqE=;
	h=From:Date:Subject:To:Cc:From;
	b=D+BMLNUMB2Vy87lZM2dhvbjvAU3/q53V4thtud/f8WqZcPx726NeWFyIziJ3hjlFK
	 nAIdNSRVnjC/jKayjqGGOegQLLhkEcrf4Nd6uoOizkLDwfSST2y3GX2PDe3vI1sWuT
	 LS1Uvzicy6HACYfwvKG4F6y6KBqiVej1HsYcgGRctp6MMhcuFaJvWkhfe3rm8KjaB1
	 bFIcXfAaaPg97efmXJdUm9V+menpl4NXZc3jocs5wTSvfdJ1fb16IDWztjgi9oWIAI
	 3w48nZrywTnS3W3HAU7kH0/7hc+CfBBElpWr79GSjaoREQshSDSfOArDrLuuo9id9Z
	 CH4LWaIgc3Vow==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 15 May 2025 08:33:06 +0200
Subject: [PATCH net v2] net: airoha: Fix page recycling in
 airoha_qdma_rx_process()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-airoha-fix-rx-process-error-condition-v2-1-657e92c894b9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKGKJWgC/5WNQQ6CMBBFr0Jm7Zi2WkhceQ/DAtoBJprWTAnBE
 O7uyA1cvp/89zYoJEwFbtUGQgsXzknBnSoIU5dGQo7K4IzzxtsLdix56nDgFWXFt+RApSCJZMG
 QU+RZDdjX5GPv3RCvA6jrLaSPo/NolScuc5bPkV3sb/23sFi0qJHGhNgEU9f3J0mi1znLCO2+7
 1+YFHm82wAAAA==
X-Change-ID: 20250513-airoha-fix-rx-process-error-condition-b6e5db52fd4f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_233336_145170_46909A1F 
X-CRM114-Status: GOOD (  12.02  )
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

Do not recycle the page twice in airoha_qdma_rx_process routine in case
of error. Just run dev_kfree_skb() if the skb has been allocated and marked
for recycling. Run page_pool_put_full_page() directly if the skb has not
been allocated yet.
Moreover, rely on DMA address from queue entry element instead of reading
it from the DMA descriptor for DMA syncing in airoha_qdma_rx_process().

Fixes: e12182ddb6e71 ("net: airoha: Enable Rx Scatter-Gather")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Add missing signed-off-by
- Link to v1: https://lore.kernel.org/r/20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d748dc6de92367365db9f9548f9af52a7fdac187..1e9ab65218ff144d99b47f5d4ad5ff4f9c227418 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -614,7 +614,6 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		struct airoha_queue_entry *e = &q->entry[q->tail];
 		struct airoha_qdma_desc *desc = &q->desc[q->tail];
 		u32 hash, reason, msg1 = le32_to_cpu(desc->msg1);
-		dma_addr_t dma_addr = le32_to_cpu(desc->addr);
 		struct page *page = virt_to_head_page(e->buf);
 		u32 desc_ctrl = le32_to_cpu(desc->ctrl);
 		struct airoha_gdm_port *port;
@@ -623,22 +622,16 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
 			break;
 
-		if (!dma_addr)
-			break;
-
-		len = FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
-		if (!len)
-			break;
-
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
 
-		dma_sync_single_for_cpu(eth->dev, dma_addr,
+		dma_sync_single_for_cpu(eth->dev, e->dma_addr,
 					SKB_WITH_OVERHEAD(q->buf_size), dir);
 
+		len = FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
 		data_len = q->skb ? q->buf_size
 				  : SKB_WITH_OVERHEAD(q->buf_size);
-		if (data_len < len)
+		if (!len || data_len < len)
 			goto free_frag;
 
 		p = airoha_qdma_get_gdm_port(eth, desc);
@@ -701,9 +694,12 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		q->skb = NULL;
 		continue;
 free_frag:
-		page_pool_put_full_page(q->page_pool, page, true);
-		dev_kfree_skb(q->skb);
-		q->skb = NULL;
+		if (q->skb) {
+			dev_kfree_skb(q->skb);
+			q->skb = NULL;
+		} else {
+			page_pool_put_full_page(q->page_pool, page, true);
+		}
 	}
 	airoha_qdma_fill_rx_queue(q);
 

---
base-commit: 09db7a4d287d1a2bcfc04df023c103d1213a0518
change-id: 20250513-airoha-fix-rx-process-error-condition-b6e5db52fd4f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


