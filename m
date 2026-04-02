Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07666D6AAF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3vQ8QeY0ne6RQFW1DbV98KTZDASSo5rBQdtH/QGkgU=; b=E1YGcpnQVv2eQNb21WFH7vzj3/
	MpDYU/wydOzgiTKuy1QUU2DtnbyZk7R0XohuHyRHzuRcOuyuwXhORm6LX6YugyvT7Okwmr6K6aLGd
	OXiZ0L8xIDucv3/XcMJ3wybfDhJhwyTiGg9tznF3g2x9i+4RgxbYcV9ZlB4zckhd6BpVUtMbRWwaQ
	i5qvJj+fqBOhwv+OZdfzxwv1OxnELlvXU0CRp71vaMIYOI2n7w8qs2cDkLeoVGWlM5+l6IR2gnxPI
	mbkEgSrRblo9LYeHAt3bqU8u1KRP805MW1jkqL/XuTSYK95a6LS/kcaTLiq7hWGLGuJ7rzcb4+8UL
	4PpMrynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L2I-00000000WJ1-3Zwy;
	Thu, 02 Apr 2026 16:36:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8L2G-00000000WIT-1XXI;
	Thu, 02 Apr 2026 16:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF0C9429E9;
	Thu,  2 Apr 2026 16:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D028C19423;
	Thu,  2 Apr 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775147806;
	bh=uLmS0HsUDr2BokeD+jSdwx3Xz2Gctb+uLNXQ4boAXU0=;
	h=From:Date:Subject:To:Cc:From;
	b=OwhXBHWnXxQbgi+Lr/d+FvS3AagvKuOJYOhfaXr08zbUSER3M5c3OxYjwjYv1c0Tj
	 ZF2yShxfaOil38PS1vqkSxJnvE4VW98G385tH3yHFDyuW4QVLvnkI7oY+1zX0wS5zg
	 hw9sCi/Ys6iEnDf6wIq55kG1f6CJQPU6PonA/mEcjhwBiuYNrf6y2pmrMvPfzPPoFW
	 Krb47bfx+9KYhZA1PL+O/O6uO0BY2p5MFBFgTYwUbbp/cN5PjKyosdYEEccBIkFbuj
	 w57xRsiPbM1DoOoiRjuGtpRRTujC1WyHHDN5ub32eSW8FfraqyrjDtfc/fPGKCMFUD
	 KDfUjKtjwIyuA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 02 Apr 2026 18:36:28 +0200
Subject: [PATCH net] net: airoha: Add dma_rmb() and READ_ONCE() in
 airoha_qdma_rx_process()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-airoha_qdma_rx_process-fix-reordering-v1-1-53278474f062@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QrCMAwAf2Xk2UCNdoq/IqPUNW55sJ2JyGDs3
 w0+Hhx3GxirsMGt20D5KyatOhwPHYxzrhOjFGegQH04B8Is2uac3uWVk65p0TayGT5lReWmxXN
 1wgvRKVwpxkcfwVuLshv/zx0qf2DY9x9LzFK9fAAAAA==
X-Change-ID: 20260402-airoha_qdma_rx_process-fix-reordering-722308255b65
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Xuegang Lu <xuegang.lu@airoha.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_093648_472117_4303D7DE 
X-CRM114-Status: GOOD (  11.43  )
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
 drivers/net/ethernet/airoha/airoha_eth.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 95ba99b89428e4cafb91ff7813e43ffeb38e6d9b..29dea8b35f64bfdcf88bc09fd711e0d8b4f7b6fa 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -612,15 +612,17 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
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
 
@@ -637,6 +639,7 @@ static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
 		if (p < 0 || !eth->ports[p])
 			goto free_frag;
 
+		page = virt_to_head_page(e->buf);
 		port = eth->ports[p];
 		if (!q->skb) { /* first buffer */
 			q->skb = napi_build_skb(e->buf, q->buf_size);
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
base-commit: ec7067e661193403a7a00980bda8612db5954142
change-id: 20260402-airoha_qdma_rx_process-fix-reordering-722308255b65

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


