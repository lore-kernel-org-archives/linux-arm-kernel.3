Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0970ECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 06:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYloxdgygYkPA7nL3juFbK1wjjU26h+FbB0DnjN9yBI=; b=sSbBg3xZtEJqSZ76bpIIzXIbYG
	qzu/Lfg9+evNrzsFjgkKZAUC/GmngnO5GK8tIk4ZUZUSGvZiPqgkpsOhKDGWOW5cJXGj+EKdhncju
	aTdGi2jSdWkQp4EvStV0OxK0algt6wQFGugLIWXxoE1jabBqrKLFBz3tioYTO4YpxbKk4/Ilmuhlv
	9pOpBHZrEnizjzZFb3r9QvFTM7vLjxmZHfJFhktjIeDN6i6wWP4Dk3wjnWwmsLLSAXSGUsngjM2xw
	th63QO3qs6iMBOSc0FO6xlNN+pwZsKLULmu+EvrEce/9dyF+xIePIj66cZz5sotyAsFUtQ1dshRx4
	n8CgQPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oB-00000000fv4-3cPo;
	Thu, 18 Jun 2026 06:00:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa5oA-00000000fu5-22xm;
	Thu, 18 Jun 2026 06:00:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C34560098;
	Thu, 18 Jun 2026 06:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF0E1F000E9;
	Thu, 18 Jun 2026 06:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781762456;
	bh=nYloxdgygYkPA7nL3juFbK1wjjU26h+FbB0DnjN9yBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Meegnm5efee4PPsRHuUQRJo90vS6LuzcUOpQeQzkvlPhRfz/5bU5JA9upWJvwCEAb
	 wXR7D7m7jq3zFDL293+KxJqcNvoDj1gV7TlbAETHh1WC7bRoCza4C5jma0GkXk8zOs
	 FJVlPONeENnjHgyGAtl4mX63Cp57h0lm5esW1FH19KZp6KaTPBf632IyqHvMnprrrb
	 Qb0SYJ4b+3p2SrnsB8X97+12B0ijqn3LT64wGGp6D/n0TW3bI+FIvjn8x7QJ5DLvQl
	 uw/rO8DokZnMz4lqhXjbg8BfRl1jThtQvDwvjLcuC1450o5qMlbKzCFh/d6HKfxOVW
	 u4audTANr63iA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 18 Jun 2026 08:00:29 +0200
Subject: [PATCH net 1/2] net: airoha: Fix off-by-one in
 airoha_tc_remove_htb_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-airoha-qos-fixes-v1-1-37192652157f@kernel.org>
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

airoha_tc_htb_alloc_leaf_queue() computes the HTB QoS channel index
as opt->classid % AIROHA_NUM_QOS_CHANNELS and stores it in qos_sq_bmap.
However, airoha_tc_remove_htb_queue() clears the HTB configuration
using queue + 1 as the channel index, causing an off-by-one error.
Use queue directly as the QoS channel index to match the allocation
logic.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64dde6464f3f..aa98d1823ab6 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3006,7 +3006,7 @@ static void airoha_tc_remove_htb_queue(struct net_device *netdev, int queue)
 	struct airoha_qdma *qdma = dev->qdma;
 
 	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
-	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
+	airoha_qdma_set_tx_rate_limit(netdev, queue, 0, 0);
 
 	clear_bit(queue, qdma->qos_channel_map);
 	clear_bit(queue, dev->qos_sq_bmap);

-- 
2.54.0


