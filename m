Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24F3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t9x0QJtja4DCzZdLaPNBsn/8hVoTJhyYvRLwmkOrgE=; b=Zz5aqHb99aY83ael3PMPDsxuSb
	W4abbIG80x2xqidgQGnPVcU8hzEtscLHJw0J24pXKfAovPITwuuOj38CWT964Ri/7kLTLK8JPhi8o
	X6KTcuUJtD9SHPpe0XH5/y89pAfKPrHmMmm8JuAHEReidHo6i9o9R+W6SlOu4lnau+rKRDulzF9Ym
	2hVHQPnP2NWk0umejQ8urq9MtBTnwoJZuZSdw1EJ+Xpk19mBWgP1upmbFeQ55UbME3/365eV4Itgs
	WqMRuAlVBMxyt6AgYRBtlEO1v46wnBX1xHOtS1YSnKoKT84z6jKBw8YQexPIsh+zxRsKHipwkJQjJ
	NYpp+pEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRndr-00000009LT3-2aHq;
	Wed, 18 Jun 2025 07:55:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnXK-00000009KU1-2265;
	Wed, 18 Jun 2025 07:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B52E045007;
	Wed, 18 Jun 2025 07:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43521C4CEE7;
	Wed, 18 Jun 2025 07:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750232925;
	bh=zmxmRAuGPbnBoWImjaQfSrdRisEJjiibW7+o0uMkNko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X4ZTWC+MQ2HneiK1Z1/U+4C8CiA96Jz5ldqrn8y+xTFQGtPGFvwo3X/8tMVLBpGQ+
	 cTuWbi4Cvw1PUHn7X4lpo/rt2RSxTQRMBYTFkzr0MJBYXc0xpw6R1UEix/eNBoX3XW
	 gUd9+Zm6vbS0dOQFYhAX72ARIkbo31U4N+oE/J3c1ubS98uunV4rbPcc0DEncHEFD1
	 npHpPuWaTjMB0GlOrLMio1xvggAvpzmWyJRwO/2SqzSJQwK37uzzb6KLnqFHDwB1dK
	 Y/jMjhyhsEM8VaLQXz+OZ3n5rg3CR63CMDnsgEpyXxN0JvYRB1HRrWr/NID7IeTvlQ
	 Ar8mVnlIv/maA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 18 Jun 2025 09:48:05 +0200
Subject: [PATCH net v3 2/2] net: airoha: Differentiate hwfd buffer size for
 QDMA0 and QDMA1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-airoha-hw-num-desc-v3-2-18a6487cd75e@kernel.org>
References: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
In-Reply-To: <20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_004846_552371_B8019B6F 
X-CRM114-Status: GOOD (  11.78  )
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


