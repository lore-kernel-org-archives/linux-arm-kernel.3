Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA89F327AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X0m1NUvqw2gT7j+B3KcKS2rxFkHNWKeKj7YCN024hGs=; b=3J1DTpfUWmSVIybriYPGCYq+oL
	aiHq1pyzP98rHVyo8ILHj7j4zX2vf+Qzjalyrc9V/q4z60lzv0PRgV+Jd8d7qJghUhZBZP1jGtSq2
	M+e+ouY99ik1ADHteEPh9WuGQinZ/xPrOHbQXnj2dq5UWn62rN3XkOykH6b1P8bpUEKPgRryrmwN8
	0G5XDy0no1OHBRD3dWqeo+hL6F0w0sITWGPcD6k5zbmrSL9nnyxXsOEQ7emvJ5VvLnH4mqu7+UNtf
	uXJQDIoRaeESv2sPx0BKwKq752vacQCcuXYajbGv/KzNfgmiTtCKVDOG63U3AyGMeyGBBvUIbmguY
	M6SBwi8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4pU-000000087UT-1UXZ;
	Tue, 21 Apr 2026 06:43:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4pR-000000087Tv-2UFt;
	Tue, 21 Apr 2026 06:43:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAE5760018;
	Tue, 21 Apr 2026 06:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32B3C2BCB0;
	Tue, 21 Apr 2026 06:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776753804;
	bh=ZKZG+O0J9kV7ldRJcMabcJRwOJQwoGJwOtsehsIKW+Q=;
	h=From:Date:Subject:To:Cc:From;
	b=S6CZ42TNemFsGJ28k4IRpJ+UpPcHGjRTYozI1fnJHUuYU7Hsul5zU4Fdy+6GQwfpS
	 txFENVglu/DsDsyrjf7APABe27rQrbHxBMhuFDZ24YzrpnkfQhTIdFosNgmEkbcT3O
	 8eJSsHEBUHI6J4rsCe0qqijarKgU+AS/0zH2y9F2Z+4IYbY5x3NNuynzz2TZ0J4BqA
	 Ce5hbmsR0+USuYkQZlS4H4DAh4arZYrQbwV03bl0rQfKEgI4VuEgBOObDw4oha90QJ
	 bQgvPkqnsUPdvbZylAavVsSIU19H//hro1TJ429V4Dfrr40SxAFP5LdX+eGQaWwOoR
	 OVsVJxPEEPDTQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 21 Apr 2026 08:43:07 +0200
Subject: [PATCH net] net: airoha: stop net_device TX queue before updating
 CPU index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-airoha-xmit-stop-condition-v1-1-e670d6a48467@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBvQSYK6SrQQnWoWaahEEN49a
 fkW/7+QOQlnmLsXEt+SJYYG3XfgDht2RvHNQIpGZUijlRQPi88pBXOJF7oYvJSW4WCMd4omsnq
 CNrgSb/L88wUCF1hr/QDdzUd0cQAAAA==
X-Change-ID: 20260421-airoha-xmit-stop-condition-344dc0292a19
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
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

Currently, airoha_eth driver updates the CPU index register prior of
verifying whether the number of free descriptors has fallen below the
threshold.
Move net_device TX queue length check before updating the TX CPU index
in order to update TX CPU index even if there are more packets to be
transmitted but the net_device TX queue is going to be stopped
accounting the inflight packets.

Fixes: 1d304174106c ("net: airoha: Implement BQL support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 19f67c7dd8e1..5d327237e274 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2058,17 +2058,16 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 
 	skb_tx_timestamp(skb);
 	netdev_tx_sent_queue(txq, skb->len);
+	if (q->ndesc - q->queued < q->free_thr) {
+		netif_tx_stop_queue(txq);
+		q->txq_stopped = true;
+	}
 
 	if (netif_xmit_stopped(txq) || !netdev_xmit_more())
 		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
 				TX_RING_CPU_IDX_MASK,
 				FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
 
-	if (q->ndesc - q->queued < q->free_thr) {
-		netif_tx_stop_queue(txq);
-		q->txq_stopped = true;
-	}
-
 	spin_unlock_bh(&q->lock);
 
 	return NETDEV_TX_OK;

---
base-commit: a663bac71a2f0b3ac6c373168ca57b2a6e6381aa
change-id: 20260421-airoha-xmit-stop-condition-344dc0292a19

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


