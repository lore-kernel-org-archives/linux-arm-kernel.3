Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B52BCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYe/R+B0EIyzp+VSVmzKrxMqtVM346VU1YDtZ/Nm964=; b=hOsxO6OSC0H6wtPMAaj/XpLUJb
	jdGPemGZBLbfzxkr+CVtF15JcDUHA3qNszBiCoWP1z0EpL2MBDg8L5pwgkrD7EN3J2KNrvluJujwj
	VNdjBfA1mutTjSafaURbM6uvWwX4K399h+jzkrEIVTJHhNz0kKv8YrT3S5ZCQW1b9lRidnXF6jaVH
	xHqEk547qSOZfFZilITNEAc/5VHGMov4LgN5Ixi6ttCKPDOlQx+r6pI+URI304xF3+J4pZ4ZIVwMU
	4yPyQDL9hObQbyXQTU5G7M+W280t0OZUepPgxb9zItib9ar416AvvMhMyDGzHuYbq112pm9XeaR8X
	AvwE4eVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oG-00000000fxX-00S0;
	Thu, 18 Jun 2026 06:01:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oB-00000000fum-1m97;
	Thu, 18 Jun 2026 06:00:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B124172F;
	Thu, 18 Jun 2026 06:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263CE1F000E9;
	Thu, 18 Jun 2026 06:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781762458;
	bh=xYe/R+B0EIyzp+VSVmzKrxMqtVM346VU1YDtZ/Nm964=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cFFDo3xdDE7f9X36tOCU65NXDqgnoAHLQ/UzCTnXJ2WidFPO0zIUOiWlITv/ucbTA
	 9NQUJQEHYf0ySE7FWYGKJ0ZdAMXN+r/K1GBaF3/OqVAOt03Y9tLgSV37wKrUiSdtJR
	 Axh9i8owHcYZw7dw9N1pPOMx5e9kIZJ3UQ1rZntnxLisNmpgQGAR/7S6lW04wFv3ud
	 BZNuCefgBmnlpowgKw/Gb0xpD0BCWywYqnNoP7y++mfW/2dvcCvbRT1RZKYEkfj2jl
	 zxZpm7C0zeuzT0rjy+qya1u0BwoZo8iUL9gdS5kCBoJ0gz77mV5t27NbEtlYgFZhLw
	 66vUiVJYh95xA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 18 Jun 2026 08:00:30 +0200
Subject: [PATCH net 2/2] net: airoha: fix netif_set_real_num_tx_queues for
 sparse QoS channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-airoha-qos-fixes-v1-2-37192652157f@kernel.org>
References: <20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org>
In-Reply-To: <20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org, 
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
 drivers/net/ethernet/airoha/airoha_eth.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index aa98d1823ab6..e2652cff67c0 100644
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
 
@@ -2806,7 +2806,10 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 	if (err)
 		goto error;
 
-	err = netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
+	if (num_tx_queues <= netdev->real_num_tx_queues)
+		goto set_qos_sq_bmap;
+
+	err = netif_set_real_num_tx_queues(netdev, num_tx_queues);
 	if (err) {
 		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
 					      opt->quantum);
@@ -2815,6 +2818,7 @@ static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
 		goto error;
 	}
 
+set_qos_sq_bmap:
 	set_bit(channel, dev->qos_sq_bmap);
 	opt->qid = AIROHA_NUM_TX_RING + channel;
 
@@ -3003,13 +3007,18 @@ static int airoha_dev_setup_tc_block(struct net_device *dev,
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


