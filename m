Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EADC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5RkN0z+55zFtz3QXxYvvxP7CKRy4NcW9mCzf5ABPrqI=; b=Rff8oMEuO1lj7r4Y1NxQUEiEfs
	8/4naKZ4GJOLrBWQVnLK4jJm99zM7STLUn53XuHZuFnExiGyfpMDJLBRrA2e+JLNNnuzC+ILZX0fC
	+NqEWKoftJUDSmXFO4MKVgLwB3byAlvMVBUEkmhqWmxRL3lkBOtlF8HZBJlwo8UAB8wmml3yM40eM
	QPowr9+iaLZTujOcaAC2lBSxqnkDvy5GFRnRDkY0NGIDLeWdjUOSdC01RtcrsoCA8JwE/4SrkZ/fr
	qkzCMLyfJZKegj2K0wx+EKoh9W53jwyWQgbTzBnAM9DtOqVKfCR9Dml6NgbhUiEq1iXWAUJJJ7Lfm
	/MoVttuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEssQ-0000000D00D-3HrR;
	Tue, 13 May 2025 16:53:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEsb0-0000000Cwg0-3wfd;
	Tue, 13 May 2025 16:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2E38A4DA19;
	Tue, 13 May 2025 16:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B460FC4CEF3;
	Tue, 13 May 2025 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154107;
	bh=LuI21fazPCPjiw1XUPMaiVnZtrF9a5CII2+pk6dGMbc=;
	h=From:Date:Subject:To:Cc:From;
	b=DNeKQP8u6rZUMWUrtj4oQIwZ2DmD0fxD41mka5vzWkPcfAchWkkQpks/AxhjSCpHq
	 ttVMhsyUDjT8i24LJc4qcNfDv9NixcCrD2jf2GyXYQ2irXVBKhD817cWZv/N0eRUce
	 6WgyrUN012hFMHlgUzm/x+mY4vj2BUuXctfe2/ncYroTN3HtbeupOIeCGbV6q1zhyi
	 bIpCbqCGK/Ksf+vnWFMTB53t3WrYgp2ROx4ZK/iuOxHMssl0vZr1idF8Xz7uk2xs4C
	 3/0+6NxiSfNt+vDhkf6XBArjONNFTePiI47YPjoafkgB6IGJ2xInsYmzDParp9MZDQ
	 LO86uFVHma8Pw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 13 May 2025 18:34:44 +0200
Subject: [PATCH net] net: airoha: Fix page recycling in
 airoha_qdma_rx_process()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKN0I2gC/x2NMQ6DMAwAv4I8YwnShqFfqRhC4oCXGNkIISH+X
 qvjDXd3g5EyGXy6G5RONpbmMPYd5C21lZCLM4QhxCGOL0yssiWsfKFeuKtkMkNSFcUsrfDhBVw
 mimWJoZZ3BW/tSm78P9/5eX7p9jhmdwAAAA==
X-Change-ID: 20250513-airoha-fix-rx-process-error-condition-b6e5db52fd4f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_093511_153632_21D7395A 
X-CRM114-Status: GOOD (  11.44  )
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
base-commit: 4227ea91e2657f7965e34313448e9d0a2b67712e
change-id: 20250513-airoha-fix-rx-process-error-condition-b6e5db52fd4f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


