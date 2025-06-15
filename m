Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A3FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 08:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJnvTQefdJMtrtPv6iulQvOMcnRwuscFvXvQ0rcQ474=; b=0lHSokMCf7oW8roy3WxfM/+Mc+
	cd7E0ie0OSBJW+/2eN9JYVF5rJo6z+336snSnzy4cNSCc2+sdTQ+0GyrtlfcnxXHSHHyeImDcJK7a
	ZHOsmuD3rSv9a+AOduzHnaJRO1loRwUfmTxvLKKDNEglOyEXVT/O7lJzW4vUCEySQWyS8VPbpLl8b
	MhxP+PhyyDOYR3gJ8Raolv6fPPDViMIOMW7Ab0kCrgF0IuPbsG7X4eio+zdVOl4yAny42H9hdvvbt
	0dzOgMAGZCpJDATL8qGk/ICYphlOP3lPOsomxDej4w1xKYn7sbnYF+SThmATs0i6D0g5udJzI12o/
	uxeZ8gTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQiyF-00000002Mra-3qXl;
	Sun, 15 Jun 2025 08:44:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQirl-00000002MVv-1OrG;
	Sun, 15 Jun 2025 08:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BDCE5C42BE;
	Sun, 15 Jun 2025 08:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CDDC4CEE3;
	Sun, 15 Jun 2025 08:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749976643;
	bh=elF098D0OS/wcuBbtA4frD9WsTW9bNNyp+TTzihxrvs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aIGHNTHa64cn/6DQZsXe1A13+teT+YB5TmgjvQJ7ckj+cP1VrVZ4Lw1DH+Kvu2N7r
	 quuDndtYPwl/VI80MikDQPflkH0xBgK+zmi4ArO05Va9kdcSsEN5t1/UPKJu8xgGa3
	 edHNOocu2c2HUJ+7o2nPA/grsqgoHccHS5liaNROcBMgON94DCDFppsK3iJnc1EWoV
	 jawroQ0OYWpzzUTM3IpX5jmdxvyaRsp4UCqA2vKn3hh+JqR9OLL60f7HUe4RItw4RP
	 TV3ZbcmBwCeC1NOuq5VOSAX+huuOmx5kBIJqd7UcPTBdy13F/WREriIOxy3nEP1mWd
	 PlPfCeaqqCD7w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 15 Jun 2025 10:36:19 +0200
Subject: [PATCH net-next 2/2] net: airoha: Differentiate hwfd buffer size
 for QDMA0 and QDMA1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-airoha-hw-num-desc-v1-2-8f88daa4abd7@kernel.org>
References: <20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org>
In-Reply-To: <20250615-airoha-hw-num-desc-v1-0-8f88daa4abd7@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_013725_417652_92657103 
X-CRM114-Status: GOOD (  11.62  )
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

In oreder to reduce the required hwfd buffers queue size for QDMA1,
differentiate hwfd buffer size for QDMA0 and QDMA1 and use 2KB for QDMA0
and 1KB for QDMA1.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 1b7fd7ee0cbf3e1f7717110c70e9c5183fdd93d4..bf8eec1c96ebf642150befaa9c12ca02e82a29bb 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1068,14 +1068,15 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 	int size, index, num_desc = HW_DSCP_NUM;
 	struct airoha_eth *eth = qdma->eth;
 	int id = qdma - &eth->qdma[0];
+	u32 status, buf_size;
 	dma_addr_t dma_addr;
 	const char *name;
-	u32 status;
 
 	name = devm_kasprintf(eth->dev, GFP_KERNEL, "qdma%d-buf", id);
 	if (!name)
 		return -ENOMEM;
 
+	buf_size = id ? AIROHA_MAX_PACKET_SIZE / 2 : AIROHA_MAX_PACKET_SIZE;
 	index = of_property_match_string(eth->dev->of_node,
 					 "memory-region-names", name);
 	if (index >= 0) {
@@ -1096,9 +1097,9 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 		/* Compute the number of hw descriptors according to the
 		 * reserved memory size and the payload buffer size
 		 */
-		num_desc = rmem->size / AIROHA_MAX_PACKET_SIZE;
+		num_desc = rmem->size / buf_size;
 	} else {
-		size = AIROHA_MAX_PACKET_SIZE * num_desc;
+		size = buf_size * num_desc;
 		if (!dmam_alloc_coherent(eth->dev, size, &dma_addr,
 					 GFP_KERNEL))
 			return -ENOMEM;
@@ -1111,9 +1112,10 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 		return -ENOMEM;
 
 	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
+	/* QDMA0: 2KB. QDMA1: 1KB */
 	airoha_qdma_rmw(qdma, REG_HW_FWD_DSCP_CFG,
 			HW_FWD_DSCP_PAYLOAD_SIZE_MASK,
-			FIELD_PREP(HW_FWD_DSCP_PAYLOAD_SIZE_MASK, 0));
+			FIELD_PREP(HW_FWD_DSCP_PAYLOAD_SIZE_MASK, !!id));
 	airoha_qdma_rmw(qdma, REG_FWD_DSCP_LOW_THR, FWD_DSCP_LOW_THR_MASK,
 			FIELD_PREP(FWD_DSCP_LOW_THR_MASK, 128));
 	airoha_qdma_rmw(qdma, REG_LMGR_INIT_CFG,

-- 
2.49.0


