Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944F0C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nwEj4HW3DxjRA65uXuwBg0qO3rOkz6zUVBijGlX0dU=; b=lpwy5Mc23fzKDBhK0QbKJL4e71
	g/paZd8+P4rvV2Dr4CrYD5fP54Ll6tAIaZvD+xkueK7wPc0nn8vzeBHutJtMoBoh0yYQX/JvHgDpN
	vG/F6krJ1Wx477EHmF4qzLwx6GZ1o68Y+scfP59h4rm7lV2UPCmFItlfHhKKNImVZhRNFqWWXfrJc
	5+IzbiHFygWD1+Ge3hFv9TpAnTG4MQ3Ii9G7BOwE6yGOmMYsE2nLK5kGcyc0Mh+kvy0cus8y35PzC
	HLbIWRjtLQ/UTsFyTpC6k0WaaERgvWc4Ks6uC8ftLe492UaWgCkCd+XmL4RddStgP6ZeukoEFlP2y
	kyBcdvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGFN-0000000Fx3Y-2bor;
	Wed, 14 May 2025 17:50:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFFcb-0000000Fq6m-0dAy;
	Wed, 14 May 2025 17:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 91DE35C64B6;
	Wed, 14 May 2025 17:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC2BC4CEE3;
	Wed, 14 May 2025 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747242618;
	bh=jO1c6Omlx+fsF4GHMQV9/rCFGaCws6F9qRa2fiBlvu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CCiyJIUgKiLhD1m2ZrwxCKNR7li+A+1nxrJ8RNMJxE4bDZ0lAK3InQY7f2qdcSBFf
	 /zXKoNbBTAxsvCtjuqO6n3Yj8OXQjD5ZfWWh5WVwDtuCj9JDJo26vdGPaJkxHtga0Z
	 r1dArVYtC7X/dodQycWdP0AXMUltZtv0FvzHKyu2UQCo0L03cRD3zAZCfhXOmSTNoK
	 2uEQyfUvt1S+0InRQBFpEgQE2xvIe7BlGtDSQMP5qyz86AmtL1SW7jF7lrBbk++8uS
	 bK6q8fO3TQUYMVm2P5eEJj/nZLJ84HlMlWPhVMeILCisD4zavAMeDhoA+vDenRC//l
	 yAFi8/6y4vQrw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 14 May 2025 19:09:57 +0200
Subject: [PATCH net-next 1/2] net: airoha: npu: Move memory allocation in
 airoha_npu_send_msg() caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-airoha-en7581-flowstats-v1-1-c00ede12a2ca@kernel.org>
References: <20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org>
In-Reply-To: <20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_101021_276975_0136987B 
X-CRM114-Status: GOOD (  13.14  )
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

Move ppe_mbox_data struct memory allocation from airoha_npu_send_msg
routine to the caller one. This is a preliminary patch to enable wlan NPU
offloading and flow counter stats support.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 123 ++++++++++++++++++-------------
 1 file changed, 70 insertions(+), 53 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index ead0625e781f57cd7c5883b6dd3d441db62292d3..2371677296aff1382f6e0516a8798739029e03fb 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -124,17 +124,12 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
-	void *addr;
 	int ret;
 
-	addr = kmemdup(p, size, GFP_ATOMIC);
-	if (!addr)
-		return -ENOMEM;
-
-	dma_addr = dma_map_single(npu->dev, addr, size, DMA_TO_DEVICE);
+	dma_addr = dma_map_single(npu->dev, p, size, DMA_TO_DEVICE);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
-		goto out;
+		return ret;
 
 	spin_lock_bh(&npu->cores[core].lock);
 
@@ -155,8 +150,6 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	spin_unlock_bh(&npu->cores[core].lock);
 
 	dma_unmap_single(npu->dev, dma_addr, size, DMA_TO_DEVICE);
-out:
-	kfree(addr);
 
 	return ret;
 }
@@ -261,76 +254,100 @@ static irqreturn_t airoha_npu_wdt_handler(int irq, void *core_instance)
 
 static int airoha_npu_ppe_init(struct airoha_npu *npu)
 {
-	struct ppe_mbox_data ppe_data = {
-		.func_type = NPU_OP_SET,
-		.func_id = PPE_FUNC_SET_WAIT_HWNAT_INIT,
-		.init_info = {
-			.ppe_type = PPE_TYPE_L2B_IPV4_IPV6,
-			.wan_mode = QDMA_WAN_ETHER,
-		},
-	};
+	struct ppe_mbox_data *ppe_data;
+	int err;
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
+	ppe_data = kzalloc(sizeof(*ppe_data), GFP_KERNEL);
+	if (!ppe_data)
+		return -ENOMEM;
+
+	ppe_data->func_type = NPU_OP_SET;
+	ppe_data->func_id = PPE_FUNC_SET_WAIT_HWNAT_INIT;
+	ppe_data->init_info.ppe_type = PPE_TYPE_L2B_IPV4_IPV6;
+	ppe_data->init_info.wan_mode = QDMA_WAN_ETHER;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
+	kfree(ppe_data);
+
+	return err;
 }
 
 static int airoha_npu_ppe_deinit(struct airoha_npu *npu)
 {
-	struct ppe_mbox_data ppe_data = {
-		.func_type = NPU_OP_SET,
-		.func_id = PPE_FUNC_SET_WAIT_HWNAT_DEINIT,
-	};
+	struct ppe_mbox_data *ppe_data;
+	int err;
+
+	ppe_data = kzalloc(sizeof(*ppe_data), GFP_KERNEL);
+	if (!ppe_data)
+		return -ENOMEM;
+
+	ppe_data->func_type = NPU_OP_SET;
+	ppe_data->func_id = PPE_FUNC_SET_WAIT_HWNAT_DEINIT;
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
+	kfree(ppe_data);
+
+	return err;
 }
 
 static int airoha_npu_ppe_flush_sram_entries(struct airoha_npu *npu,
 					     dma_addr_t foe_addr,
 					     int sram_num_entries)
 {
-	struct ppe_mbox_data ppe_data = {
-		.func_type = NPU_OP_SET,
-		.func_id = PPE_FUNC_SET_WAIT_API,
-		.set_info = {
-			.func_id = PPE_SRAM_RESET_VAL,
-			.data = foe_addr,
-			.size = sram_num_entries,
-		},
-	};
+	struct ppe_mbox_data *ppe_data;
+	int err;
+
+	ppe_data = kzalloc(sizeof(*ppe_data), GFP_KERNEL);
+	if (!ppe_data)
+		return -ENOMEM;
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
+	ppe_data->func_type = NPU_OP_SET;
+	ppe_data->func_id = PPE_FUNC_SET_WAIT_API;
+	ppe_data->set_info.func_id = PPE_SRAM_RESET_VAL;
+	ppe_data->set_info.data = foe_addr;
+	ppe_data->set_info.size = sram_num_entries;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
+	kfree(ppe_data);
+
+	return err;
 }
 
 static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 				       dma_addr_t foe_addr,
 				       u32 entry_size, u32 hash, bool ppe2)
 {
-	struct ppe_mbox_data ppe_data = {
-		.func_type = NPU_OP_SET,
-		.func_id = PPE_FUNC_SET_WAIT_API,
-		.set_info = {
-			.data = foe_addr,
-			.size = entry_size,
-		},
-	};
+	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data.set_info.func_id = ppe2 ? PPE2_SRAM_SET_ENTRY
-					 : PPE_SRAM_SET_ENTRY;
+	ppe_data = kzalloc(sizeof(*ppe_data), GFP_ATOMIC);
+	if (!ppe_data)
+		return -ENOMEM;
+
+	ppe_data->func_type = NPU_OP_SET;
+	ppe_data->func_id = PPE_FUNC_SET_WAIT_API;
+	ppe_data->set_info.data = foe_addr;
+	ppe_data->set_info.size = entry_size;
+	ppe_data->set_info.func_id = ppe2 ? PPE2_SRAM_SET_ENTRY
+					  : PPE_SRAM_SET_ENTRY;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				  sizeof(struct ppe_mbox_data));
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
 	if (err)
 		return err;
 
-	ppe_data.set_info.func_id = PPE_SRAM_SET_VAL;
-	ppe_data.set_info.data = hash;
-	ppe_data.set_info.size = sizeof(u32);
+	ppe_data->set_info.func_id = PPE_SRAM_SET_VAL;
+	ppe_data->set_info.data = hash;
+	ppe_data->set_info.size = sizeof(u32);
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
+	kfree(ppe_data);
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
+	return err;
 }
 
 struct airoha_npu *airoha_npu_get(struct device *dev)

-- 
2.49.0


