Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A765F43841
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5mLb8fLTUo8bD5KUH9FX6VLQbLqS3Mi567W+9mQZ3g=; b=00cAhFhnz8P8gVghZsex95l/YY
	U93sT+jUFTvjI8gkCe4BciTFiSu7HSPp9lO7J7heNGKnJ22VkFd107inb2rnxaqpHeeLgTV0xMTAq
	Fl3vy3ZcQYmKJ6VHICfp44bZFe5j7kP1mcDSttZagnFkqLGmsKQiJz5N2JM+abaZGV1kVCV4/gIJ/
	f6pdZrH85I+1c+b9XuTXwCo441pynTk5kFPW2WdkL+qYj7osUZ6XuJ+Xw6HMlAWyggs8qOgS/wNsV
	fl0+X9CcVGuZcWHON3SZN0ZCQjA1O5tVdvGckQF3jRyBTNU6uhOI3sKH3VlWl2qg1JXRnDElDKRgr
	YucaY2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH8q-000000027Po-1Ry5;
	Thu, 16 Apr 2026 07:28:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDH8o-000000027OD-0X33;
	Thu, 16 Apr 2026 07:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B293443F2E;
	Thu, 16 Apr 2026 07:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206C4C2BCB8;
	Thu, 16 Apr 2026 07:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776324477;
	bh=1RyKXEg9w7ciA1MUXVCuKlalb/RGHXZGMtXCmpwPV5I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d3ZXGZj0peE+uz8kz7teFb70pJG5LKSZIOqwTPYFraq9qwcA8WNw0yYvyP9JjZuC+
	 Cx9osbM7qzALaIrpuwZ/Z9RfWNq0JFM1OR5OcPszOAPvlTMQ7THeZZEvd6nWp103JX
	 wEt9fGdimjaO0nwTXWhDaO0vNOfaUbN1HL2cKSoFKVd3WcVfzEbxgA5nPOe2CQdpl/
	 9jPgGoP4QdpExjCUgl4AuNTcIqPQYYjYWr3Zree0F7NBmQ8YTI1lZWcH2O6KGQNBeE
	 kEAB2jcxYbdatNBN/yjSsvwcfhBr25QVsJoyljreehQmU4eXZuithSByrAxc/Mjzx4
	 fRtOuids4Dd9A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 16 Apr 2026 09:27:40 +0200
Subject: [PATCH net v3 2/3] net: airoha: Move entries to queue head in case
 of DMA mapping failure in airoha_dev_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-2-2b69f5788580@kernel.org>
References: <20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org>
In-Reply-To: <20260416-airoha_qdma_cleanup_tx_queue-fix-net-v3-0-2b69f5788580@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_002758_209965_ADB1BA18 
X-CRM114-Status: GOOD (  10.38  )
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

In order to respect the original descriptor order and avoid any
potential IOMMU fault or memory corruption, move pending queue entries
to the head of hw queue tx_list if the DMA mapping of current inflight
packet fails in airoha_dev_xmit routine.

Fixes: 3f47e67dff1f7 ("net: airoha: Add the capability to consume out-of-order DMA tx descriptors")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 690bfaf8d7d9..dfe8a0bd2abd 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2053,7 +2053,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 		dma_unmap_single(dev->dev.parent, e->dma_addr, e->dma_len,
 				 DMA_TO_DEVICE);
 		e->dma_addr = 0;
-		list_move_tail(&e->list, &q->tx_list);
+		list_move(&e->list, &q->tx_list);
 	}
 
 	spin_unlock_bh(&q->lock);

-- 
2.53.0


