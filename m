Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD9E9D814
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k94lUa+KEMbk6AFvbQk7NdZga11Yp/wVHOllCIcd9o0=; b=owaWuHzAdVUIY5oDl784fx4FeT
	BMkZi/XoWlA48IhtV18Y5kBBD5TvFJeFr+csK5wwZSO1DT+UsT0koZiO2bIiT+iuA7hkaAjDKXfco
	XEWvep+FYC9JTYNpWCYSMfjZBgqx8wZ2t5BvWtey2sbD+pEZ/iWuzbFvpzpc5ueTTXSdlWnGnQiyu
	mND4jZPoOIpHfLhtbae5fVanEKZTJjl+4HBw3mpemMlyro6HKcmIF/zMtfRrJ7GTwnv0Cd/t0zMSG
	3eGLjrk99n45qvAtQI7V1WWAkKGGKNoJkMZh848OrCaUAbDSFdJEk3JCq7q9e8VIarZtXNPK0YZBT
	lSLzItiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0Er-000000061Ye-39Py;
	Tue, 07 Apr 2026 06:48:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0Ep-000000061Xs-2Dc3;
	Tue, 07 Apr 2026 06:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C82BC441C6;
	Tue,  7 Apr 2026 06:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A990C116C6;
	Tue,  7 Apr 2026 06:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775544518;
	bh=sO9aQuhE+niwJIm1bqiOtD3Jjz6qnYB8L83GRriDkrA=;
	h=From:Date:Subject:To:Cc:From;
	b=W7RyjkJPbc9QY9ImPBHkmjo0uS84hXK7K/BSLw6m6mt+L9Y6FaXWxApbiloGeOI49
	 MO+z5Z2rMK1/BgV1bIFHqNSaXzJTEtrPCqO2xkAJUXzYxiLwtDdg79S1CiJLQ3MJXR
	 nRERo2iz9AwoFN0eBfPSC1I21LHmaklRVfmdP1FoYDSbJ6zyvfr2DjkCoIvNa3Du9l
	 OpS8xCNQnTvj3bxcwjnKpKqZdS7aIuqxj0XE9F+GlfCPYJeOE+69VSHzgjg1eE5AMN
	 XHn4GAOCbmEl687Akghnl9byCiBaJU5iA1OX/KUPavRUrtkLdC7+VPrEMQhlGMfpxb
	 GAltvef+phLjw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 07 Apr 2026 08:48:04 +0200
Subject: [PATCH net v3] net: airoha: Add dma_rmb() and READ_ONCE() in
 airoha_qdma_rx_process()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-airoha_qdma_rx_process-fix-reordering-v3-1-91c36e9da31f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNSw6CMBCA4auQrq1pp1CIK+9hDOExQKO2OCUNh
 nB3m650p8t55Ps35pEMenbKNkYYjDfOxkEdMtZNjR2Rmz7ODARokQvgjSE3NfWzfzQ1rfVMrkP
 v+WBWTuioj5wdeQmgRAVF0eqCRWsmjB+pc2EWF3aNy8n4xdErtYNMpz8zQXLJCwVllZf5IDScb
 0gW70dHY0oE+GTVryxEVlYSNYLqoWy/2H3f374jibI3AQAA
X-Change-ID: 20260402-airoha_qdma_rx_process-fix-reordering-722308255b65
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Xuegang Lu <xuegang.lu@airoha.com>, Simon Horman <horms@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_234839_632093_A62F2F42 
X-CRM114-Status: GOOD (  11.49  )
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

Add missing dma_rmb() in airoha_qdma_rx_process routine to make sure the
DMA read operations are completed when the NIC reports the processing on
the current descriptor is done. Moreover, add missing READ_ONCE() in
airoha_qdma_rx_process() for DMA descriptor control fields in order to
avoid any compiler reordering.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- Move page pointer initialization before checking error condition on
  payload length in order avoid using page pointer uninitialized in the
  airoha_qdma_rx_process() error path.
- Link to v2: https://lore.kernel.org/r/20260403-airoha_qdma_rx_process-fix-reordering-v2-1-181e6e23d27b@kernel.org

Changes in v2:
- Use msg1 in airoha_qdma_get_gdm_port() signature to avoid missing
  READ_ONCE().
- Link to v1: https://lore.kernel.org/r/20260402-airoha_qdma_rx_process-fix-reordering-v1-1-53278474f062@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 91cb63a32d99..9285a68f435f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -584,7 +584,7 @@ static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 static int airoha_qdma_get_gdm_port(struct airoha_eth *eth,
 				    struct airoha_qdma_desc *desc)
 {
-	u32 port, sport, msg1 = le32_to_cpu(desc->msg1);
+	u32 port, sport, msg1 = le32_to_cpu(READ_ONCE(desc->msg1));
 
 	sport = FIELD_GET(QDMA_ETH_RXMSG_SPORT_MASK, msg1);
 	switch (sport) {
@@ -612,21 +612,24 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 	while (done < budget) {
 		struct airoha_queue_entry *e = &q->entry[q->tail];
 		struct airoha_qdma_desc *desc = &q->desc[q->tail];
-		u32 hash, reason, msg1 = le32_to_cpu(desc->msg1);
-		struct page *page = virt_to_head_page(e->buf);
-		u32 desc_ctrl = le32_to_cpu(desc->ctrl);
+		u32 hash, reason, msg1, desc_ctrl;
 		struct airoha_gdm_port *port;
 		int data_len, len, p;
+		struct page *page;
 
+		desc_ctrl = le32_to_cpu(READ_ONCE(desc->ctrl));
 		if (!(desc_ctrl & QDMA_DESC_DONE_MASK))
 			break;
 
+		dma_rmb();
+
 		q->tail = (q->tail + 1) % q->ndesc;
 		q->queued--;
 
 		dma_sync_single_for_cpu(eth->dev, e->dma_addr,
 					SKB_WITH_OVERHEAD(q->buf_size), dir);
 
+		page = virt_to_head_page(e->buf);
 		len = FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
 		data_len = q->skb ? q->buf_size
 				  : SKB_WITH_OVERHEAD(q->buf_size);
@@ -670,8 +673,8 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 			 * DMA descriptor. Report DSA tag to the DSA stack
 			 * via skb dst info.
 			 */
-			u32 sptag = FIELD_GET(QDMA_ETH_RXMSG_SPTAG,
-					      le32_to_cpu(desc->msg0));
+			u32 msg0 = le32_to_cpu(READ_ONCE(desc->msg0));
+			u32 sptag = FIELD_GET(QDMA_ETH_RXMSG_SPTAG, msg0);
 
 			if (sptag < ARRAY_SIZE(port->dsa_meta) &&
 			    port->dsa_meta[sptag])
@@ -679,6 +682,7 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 						  &port->dsa_meta[sptag]->dst);
 		}
 
+		msg1 = le32_to_cpu(READ_ONCE(desc->msg1));
 		hash = FIELD_GET(AIROHA_RXD4_FOE_ENTRY, msg1);
 		if (hash != AIROHA_RXD4_FOE_ENTRY)
 			skb_set_hash(q->skb, jhash_1word(hash, 0),

---
base-commit: a9d4f4f6e65e0bf9bbddedecc84d67249991979c
change-id: 20260402-airoha_qdma_rx_process-fix-reordering-722308255b65

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


