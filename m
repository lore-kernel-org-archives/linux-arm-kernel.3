Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77813CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 11:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YSFkwBdwIZvGA3XLMEJv/9BLBx9P14qbmrv7iQoAww=; b=njzBWuJ+I7h89UgL9RMGQa+b1t
	34ufLF8NvGBEMzk4OJvU77EI52+5Xgthy1BQjWw6U1HSg8oUiYdbFB0RxecC/L7iQsdTZNznDZhyb
	VSzn+s2ljeoDXOC63XHWdjvTmEZT8z4JKv8EwQbD+MDj27FIT13kMkJmbLZBG4ATs0MfMC1ypSwYr
	OYL4iFmDKoP8FyaPadlMj/O1rhYNcqqe/RsGdNL8ZLzu6aELLBlR5pPzhmGoGqpm3MH+F2z9jJYnW
	A+RHK0A8y2x8UixUfS4S5C82do15jWNaD4Pwmx4hVCgxyISRkyga05nVHa9KNjlNW7yGaKBmU6EvV
	wfeuzohg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXXc-00000002LQv-21XH;
	Fri, 19 Jun 2026 11:37:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXXa-00000002LPQ-1Mas;
	Fri, 19 Jun 2026 11:37:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DD58601EE;
	Fri, 19 Jun 2026 11:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0261F00A3D;
	Fri, 19 Jun 2026 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781869061;
	bh=5YSFkwBdwIZvGA3XLMEJv/9BLBx9P14qbmrv7iQoAww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b7bGjU+U38EIWEfujwNOg+vifivWQzXRPCkAvvF+6b+SHVBYhnFkc16N7UucBuwzW
	 Fe0ijn4s/ibPDBOAZdRvnjG/t/LJ2wSnPTybsR/OElf8k9TpqHUj8MB6q3/gqOybPA
	 HRJgOhxhGWkiRHFKw9ts6k3h3RDBJ7hJCsk4qvRYEnj8DqlkRzFmBMSSeoZmvKBDfG
	 qFJwGTSZ6T/BzSAbLBY/vFHP4+0m4sMVeHYHqK5G7p9QroKW6rMzgwcnd2d0cjKzwI
	 MLLe8p1YGJE40jqcGNn3DlTb/eOIIaiA/YWYH1mTGHPk8eekZdWXhqJgfEg+QPiMQ2
	 zEcBp6goQaFaA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 19 Jun 2026 13:37:13 +0200
Subject: [PATCH net v2 1/2] net: airoha: Fix off-by-one in
 airoha_tc_remove_htb_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-airoha-qos-fixes-v2-1-5c43485038f9@kernel.org>
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

airoha_tc_htb_alloc_leaf_queue() computes the HTB QoS channel index
as opt->classid % AIROHA_NUM_QOS_CHANNELS and stores it in qos_sq_bmap.
However, airoha_tc_remove_htb_queue() clears the HTB configuration
using queue + 1 as the channel index, causing an off-by-one error.
Use queue directly as the QoS channel index to match the allocation
logic.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Reviewed-by: Simon Horman <horms@kernel.org>
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


