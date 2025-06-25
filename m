Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB831C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DN+5tPTctUX1btvcEbOF2PlIYQ1oyRAXLWEjTL6I32M=; b=EzXUEHTpOiIbD2tdBuO44LJN7n
	5kALztrEwv2s+Bn1niQvbez1ktPj4D1azilWMjKNQcKhB0sQD3fCTV3ytToAU20r4hJn+rUfZhdaf
	Icy5hSwBZp5imVQ71/bsPowPS3Rd8lwbG/F2rQMsS0njCdVxYZBbnvCjLLF+X1djjDWYPxy2jlZD9
	wD2WCcNx3lttpxJTsX+F4XNly2+zCqbdX1xZbKI/cEqiWQNUF6XXscJ2zYdmIuyBiphLHhKC9HyUL
	+Jg3djslQctish88rBuNBH51bLuCEAGNaLwzdUn0zpCfYXV4VDwtR3lb74TW8MmOjGcc6D8WvL+tx
	vteO54Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUs1-00000009ZkA-2tm7;
	Wed, 25 Jun 2025 18:29:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURLT-000000090Nd-3BCZ;
	Wed, 25 Jun 2025 14:43:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27DE5611BD;
	Wed, 25 Jun 2025 14:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA19C4CEEA;
	Wed, 25 Jun 2025 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862606;
	bh=o/zklcCXTcNnCg6d1opHPaCZO1qBg4YhDTZnbLaFt4U=;
	h=From:Date:Subject:To:Cc:From;
	b=ZmLfXz8q1xkk/VQKZ2uu/uUAwdvnzZTbDksBJiJQ8EIZcPAcvylYGdK9vZs6eCmKE
	 fThokQ2cdl9FpFXiV/r0BXgUugqgWeM3KsRVL5AYziKypZ04CREAzTns8Z9Q8HJGNY
	 /Gqf+xuElPCsZ82UIiFXy8LmUTaAW2U1L70nYBMR2bjUDpEFNzf7XifVilTWruogAm
	 SDqGs1LeZAuelxPS8gsvuxKCcdF3vQUaf6sqHuORadPeTsOfJhgG3wu0gXTFei2EDd
	 xCnHvC8ZtgXwPO0nPrKaP6UNIRlUypwgdiYqpSFjKiPjFTQsjXKt7ZzYNbqytG1X9r
	 FoGKmBtl3sSQw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 25 Jun 2025 16:43:15 +0200
Subject: [PATCH net] net: airoha: Get rid of dma_sync_single_for_device()
 in airoha_qdma_fill_rx_queue()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-airoha-sync-for-device-v1-1-923741deaabf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAILXGgC/x3MMQqAMAxA0atIZgMmYhWvIg6lRs3SSgqiiHe3O
 P7h/QeymEqGsXrA5NSsKZaguoKw+7gJ6lIauOGucdyhV0u7x3zHgGsyXAoKgjQQk6O2d9xCwYf
 Jqtc/nub3/QDBA5yRaAAAAA==
X-Change-ID: 20250625-airoha-sync-for-device-181216137623
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Since the page_pool for airoha_eth driver is created with
PP_FLAG_DMA_SYNC_DEV flag, we do not need to sync_for_device each page
received from the pool since it is already done by the page_pool codebase.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 06dea3a13e77ce11f35dbd36966a34c5ef229c11..10a167224bf5ff60e60655306b8748253d2f52e5 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -551,9 +551,7 @@ static int airoha_fe_init(struct airoha_eth *eth)
 
 static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 {
-	enum dma_data_direction dir = page_pool_get_dma_dir(q->page_pool);
 	struct airoha_qdma *qdma = q->qdma;
-	struct airoha_eth *eth = qdma->eth;
 	int qid = q - &qdma->q_rx[0];
 	int nframes = 0;
 
@@ -577,9 +575,6 @@ static int airoha_qdma_fill_rx_queue(struct airoha_queue *q)
 		e->dma_addr = page_pool_get_dma_addr(page) + offset;
 		e->dma_len = SKB_WITH_OVERHEAD(q->buf_size);
 
-		dma_sync_single_for_device(eth->dev, e->dma_addr, e->dma_len,
-					   dir);
-
 		val = FIELD_PREP(QDMA_DESC_LEN_MASK, e->dma_len);
 		WRITE_ONCE(desc->ctrl, cpu_to_le32(val));
 		WRITE_ONCE(desc->addr, cpu_to_le32(e->dma_addr));

---
base-commit: 9caca6ac0e26cd20efd490d8b3b2ffb1c7c00f6f
change-id: 20250625-airoha-sync-for-device-181216137623

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


