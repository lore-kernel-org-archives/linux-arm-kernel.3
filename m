Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4037C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t9x0QJtja4DCzZdLaPNBsn/8hVoTJhyYvRLwmkOrgE=; b=xG8TKqbmu+RAZ7PeI7lCuCu/yA
	9xgZ3tP0fuWU6PVHLgg0l65dE0o7eLZ1JaBufCEIt9gQZ1/t3bodj0jl1tzIC0nqlEg9WeuPWXJAT
	JK5MhDaZDK8J+W3ahEGgL1JNxtQTyEY+6xAlagULNU1AryhlJQqhrWB2XZTKaMuAQ2tcj00ia6ekK
	bQjMrP71cKDTS8+XRQInvPcxhK0QzWdhN06a5II6NPVV34kN+CEeqWiAIv1SbvBaenMhe3W0d8SG5
	vF668tMhL0iq7z3bs4woeB8IWpYLnXX4/qnTjUS3TN6K9G5lI6+y1/n18HgVmEyM+o7Xo0Qk2725p
	cgDLnSWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBnK-00000004tHv-0yl8;
	Mon, 16 Jun 2025 15:30:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA9s-00000004aZr-0nno;
	Mon, 16 Jun 2025 13:45:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 993D66115E;
	Mon, 16 Jun 2025 13:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F223BC4CEEA;
	Mon, 16 Jun 2025 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081555;
	bh=zmxmRAuGPbnBoWImjaQfSrdRisEJjiibW7+o0uMkNko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i8yimSth2VYAxT3sk9M8734i0KHckgC4iYFDE6CYcl2n35Ny9wbUOHjDgv1GpD6B1
	 ZzYDFwztkAfZNKpEthlpVgZWviGdLOQornBqAi7DO2aQxD/ZrNmL0nM+VYBJTsZjjh
	 /ReeUVs2cL3Xm9WlwowazKycxVN59dCaLk+RoPcHijp2JUU8+Qcc7ODdN6n3XpfnV9
	 kcIlSqYC1+M8TKbY35X7zUNvLviMXbRf5uwmIxGmeaYU+BJEv0Stsp1lEsqMLLAUd/
	 x9qyeb0UM3bEX8oVpmFEEW+2rqA0RCZfsAUQsJhJx8lNOQhgvi8xrxhVmpZmTjwGAM
	 KaANvZTtnos0g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 16 Jun 2025 15:45:41 +0200
Subject: [PATCH net-next v2 2/2] net: airoha: Differentiate hwfd buffer
 size for QDMA0 and QDMA1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-airoha-hw-num-desc-v2-2-bb328c0b8603@kernel.org>
References: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
In-Reply-To: <20250616-airoha-hw-num-desc-v2-0-bb328c0b8603@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

In oreder to reduce the required hwfd buffers queue size for QDMA1,
differentiate hwfd buffer size for QDMA0 and QDMA1 and use 2KB for QDMA0
and 1KB for QDMA1.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 1b7fd7ee0cbf3e1f7717110c70e9c5183fdd93d4..06dea3a13e77ce11f35dbd36966a34c5ef229c11 100644
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
+		num_desc = div_u64(rmem->size, buf_size);
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


