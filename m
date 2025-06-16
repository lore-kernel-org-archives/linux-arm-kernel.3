Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9961C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8EghTM12FMx5V/+vp9nH39d+YwKGIKYdiHoR3usjgE=; b=nZxexk3FJEcDCk7vtEvHYS9NNv
	YR6kA/j2ioqQ/BD3g9UtvYSrjq+m8nV7m7/Am+83q7bPMQFMkMfZZI/xykFFQ32W8W6gmct9yCzKZ
	XnH5r6trqbyBeVuqHnaL07cCdps/gotj9eHZGYtvHYxk/SQW9ipIQJrOy2AsNSMbhVkjDT04e1Rex
	tHtPcPOTkf2kiyaGAVAC5DTHjqEZRzwY5eFxGSwZyz4esTZ5Wa8gD0GKv6qU8TRSe1B7bHSCT14tu
	h4hhoQyxASKGnm1LLnQOYQSCHbrHCCaWXRjlBYHXqcS1DcTtX+/h11932xGdF7cMDl4F9wTAxVbjD
	/iEz7GUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBlK-00000004snb-1Jwp;
	Mon, 16 Jun 2025 15:28:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA9p-00000004aZO-3GNL;
	Mon, 16 Jun 2025 13:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A61BA513FF;
	Mon, 16 Jun 2025 13:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672E8C4CEEA;
	Mon, 16 Jun 2025 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081552;
	bh=UfU3ocq2ii21xRQfAGGhtJtsNEug9yttyxDT5o40RTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nj7iNm+OYBSplfczo98mxZ9+U8lPls+yrRbzFPwIO+FIPv0x+2aqb7Ce9qsyD+HVS
	 6AS+Jyh64FbcJdZlMwYxfsf22cIvaBiGAgTraHdtFouBnQVyj5siBgJiqpgivW36QW
	 z90N1k3GVAlT1g72CC3rlm6Vy+S2Me/ox35Zfh2hr2CsgsDJZsBb62PFCFHoC9WLNk
	 gTfVzR0hFiBQGiH6Hrs4A/2T0OTUlBy5mh91NMVsT/0HIxGsv85gzjzzT+elt5K+24
	 UePvuexzZO8Jdps7MY0zEyvE7pyNNQgP/SAvI1PC86UUQ3ocnoek7ssuhdja2WaBsW
	 yRVMlOtqv27kQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 16 Jun 2025 15:45:40 +0200
Subject: [PATCH net-next v2 1/2] net: airoha: Compute number of descriptors
 according to reserved memory size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-airoha-hw-num-desc-v2-1-bb328c0b8603@kernel.org>
References: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
In-Reply-To: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_064553_947871_AFF3AAF1 
X-CRM114-Status: GOOD (  12.39  )
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

In order to not exceed the reserved memory size for hwfd buffers,
compute the number of hwfd buffers/descriptors according to the
reserved memory size and the size of each hwfd buffer (2KB).

Fixes: 3a1ce9e3d01b ("net: airoha: Add the capability to allocate hwfd buffers via reserved-memory")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index a7ec609d64dee9c8e901c7eb650bb3fe144ee00a..1b7fd7ee0cbf3e1f7717110c70e9c5183fdd93d4 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1065,19 +1065,13 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
 
 static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 {
+	int size, index, num_desc = HW_DSCP_NUM;
 	struct airoha_eth *eth = qdma->eth;
 	int id = qdma - &eth->qdma[0];
 	dma_addr_t dma_addr;
 	const char *name;
-	int size, index;
 	u32 status;
 
-	size = HW_DSCP_NUM * sizeof(struct airoha_qdma_fwd_desc);
-	if (!dmam_alloc_coherent(eth->dev, size, &dma_addr, GFP_KERNEL))
-		return -ENOMEM;
-
-	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
-
 	name = devm_kasprintf(eth->dev, GFP_KERNEL, "qdma%d-buf", id);
 	if (!name)
 		return -ENOMEM;
@@ -1099,8 +1093,12 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 		rmem = of_reserved_mem_lookup(np);
 		of_node_put(np);
 		dma_addr = rmem->base;
+		/* Compute the number of hw descriptors according to the
+		 * reserved memory size and the payload buffer size
+		 */
+		num_desc = rmem->size / AIROHA_MAX_PACKET_SIZE;
 	} else {
-		size = AIROHA_MAX_PACKET_SIZE * HW_DSCP_NUM;
+		size = AIROHA_MAX_PACKET_SIZE * num_desc;
 		if (!dmam_alloc_coherent(eth->dev, size, &dma_addr,
 					 GFP_KERNEL))
 			return -ENOMEM;
@@ -1108,6 +1106,11 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 
 	airoha_qdma_wr(qdma, REG_FWD_BUF_BASE, dma_addr);
 
+	size = num_desc * sizeof(struct airoha_qdma_fwd_desc);
+	if (!dmam_alloc_coherent(eth->dev, size, &dma_addr, GFP_KERNEL))
+		return -ENOMEM;
+
+	airoha_qdma_wr(qdma, REG_FWD_DSCP_BASE, dma_addr);
 	airoha_qdma_rmw(qdma, REG_HW_FWD_DSCP_CFG,
 			HW_FWD_DSCP_PAYLOAD_SIZE_MASK,
 			FIELD_PREP(HW_FWD_DSCP_PAYLOAD_SIZE_MASK, 0));
@@ -1116,7 +1119,7 @@ static int airoha_qdma_init_hfwd_queues(struct airoha_qdma *qdma)
 	airoha_qdma_rmw(qdma, REG_LMGR_INIT_CFG,
 			LMGR_INIT_START | LMGR_SRAM_MODE_MASK |
 			HW_FWD_DESC_NUM_MASK,
-			FIELD_PREP(HW_FWD_DESC_NUM_MASK, HW_DSCP_NUM) |
+			FIELD_PREP(HW_FWD_DESC_NUM_MASK, num_desc) |
 			LMGR_INIT_START | LMGR_SRAM_MODE_MASK);
 
 	return read_poll_timeout(airoha_qdma_rr, status,

-- 
2.49.0


