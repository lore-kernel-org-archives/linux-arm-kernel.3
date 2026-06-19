Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF13CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzGWo/J3oWaOMaIBzTSc/1EZhyAP1P9XFheTEgmUqRw=; b=tXPKrFiIZuWPtj4ZQY7yfjdvGB
	tKg/vxpCl/zOXTXAKNglfa/Nm2xP/66UY/wrRjP1NHQ353nwb0jBZPD54OosLUgzDC/XIqIpt5eQS
	MMupfuEEMwPrCRKtcAIDqftfbesxh/+kPF6xUHp+aye9jS27/HpV40SpHZDATeAS2pq4vVjfzeN70
	lIVNxKyf7Rx8+LVaErLLAatSceryWkLDJNhMdzXtzn6R2+oDEDAqP+ZEKu8a5FiQCYH/qMvO+uWSD
	p9MnsuCWms3K4/DrEB1Zlw1zOcJjLm/XI/9uh39sEo7qAgU0QiHmfsqeqfFG7XsKTQHgOX5icXoVg
	qodVMmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXXg-00000002LT0-0k1n;
	Fri, 19 Jun 2026 11:37:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXXc-00000002LQT-0Ebs;
	Fri, 19 Jun 2026 11:37:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BED17439D4;
	Fri, 19 Jun 2026 11:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257681F000E9;
	Fri, 19 Jun 2026 11:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869063;
	bh=jzGWo/J3oWaOMaIBzTSc/1EZhyAP1P9XFheTEgmUqRw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HgJkgRVJyQTeYJh8CF9PvOAkHxNxLtvwZnvzDOJNI6gEbsfOm5W9LKjgqpnjfrw9/
	 Cf+wXKrC4AoaE70wxaoKLRSVKZtWyu0nk4djm0bZ1BV0/bMXYUuUnDbLpRZvSnWnek
	 h1+1ZdvItX54QqBZKOnpZRTWAwXwudixbk3AcYreJu7p3xhu89oAvKzVtiJ4wAzZNN
	 gW4WQw1hgvqZKFYX5+rsmtBqWEDNLUPDVSxFTS4Qed2CDE65PILGLaHxizeyp04Tf4
	 F1ZG0tmjbZEObf4KZz+KV1GrIgG6DfN4Ylfe1aMy64vLTnHpQK3l+kTtBjbIanzAWP
	 wBG76r8P+q9+g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 19 Jun 2026 13:37:14 +0200
Subject: [PATCH net v2 2/2] net: airoha: fix netif_set_real_num_tx_queues
 for sparse QoS channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-airoha-qos-fixes-v2-2-5c43485038f9@kernel.org>
References: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
In-Reply-To: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Wayen Yan <win847@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org
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

airoha_tc_htb_alloc_leaf_queue() assigns queue IDs based on the channel
index (opt->qid = AIROHA_NUM_TX_RING + channel), but updates
real_num_tx_queues with a simple increment (num_tx_queues + 1). When QoS
channels are allocated sparsely (e.g., channels 0 and 3 without 1 and
2), the returned qid can exceed real_num_tx_queues, causing out-of-bounds
accesses in the networking stack.
For example, allocating channel 0 then channel 3 results in
real_num_tx_queues = 34 but qid = 35, which is out of range [0, 34).
Fix this by computing real_num_tx_queues based on the highest active
channel index rather than using a simple counter, in both the allocation
and deletion paths.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index aa98d1823ab6..aa2ddfd3af9f 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2789,7 +2789,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 					  struct tc_htb_qopt_offload *opt)
 {
 	u32 channel = TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
-	int err, num_tx_queues = netdev->real_num_tx_queues;
+	int err, num_tx_queues = AIROHA_NUM_TX_RING + channel + 1;
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_qdma *qdma = dev->qdma;
 
@@ -2806,13 +2806,15 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 	if (err)
 		goto error;
 
-	err = netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
-	if (err) {
-		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
-					      opt->quantum);
-		NL_SET_ERR_MSG_MOD(opt->extack,
-				   "failed setting real_num_tx_queues");
-		goto error;
+	if (num_tx_queues > netdev->real_num_tx_queues) {
+		err = netif_set_real_num_tx_queues(netdev, num_tx_queues);
+		if (err) {
+			airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
+						      opt->quantum);
+			NL_SET_ERR_MSG_MOD(opt->extack,
+					   "failed setting real_num_tx_queues");
+			goto error;
+		}
 	}
 
 	set_bit(channel, dev->qos_sq_bmap);
@@ -3003,13 +3005,18 @@ static int airoha_dev_setup_tc_block(struct net_device *dev,
 static void airoha_tc_remove_htb_queue(struct net_device *netdev, int queue)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	int num_tx_queues = AIROHA_NUM_TX_RING;
 	struct airoha_qdma *qdma = dev->qdma;
 
-	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
 	airoha_qdma_set_tx_rate_limit(netdev, queue, 0, 0);
 
 	clear_bit(queue, qdma->qos_channel_map);
 	clear_bit(queue, dev->qos_sq_bmap);
+
+	if (!bitmap_empty(dev->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS))
+		num_tx_queues += find_last_bit(dev->qos_sq_bmap,
+					       AIROHA_NUM_QOS_CHANNELS) + 1;
+	netif_set_real_num_tx_queues(netdev, num_tx_queues);
 }
 
 static int airoha_tc_htb_delete_leaf_queue(struct net_device *netdev,

-- 
2.54.0


