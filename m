Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D11C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPvx2V/vOsq5iCHPmQ/GpXnhxNLSeesNNs2e5uyeLZc=; b=Hz84mXC01aGsKuyqf6AJWGzpQj
	D4XpqwfZcQett2lHZWD6/L0Od8FKMzGF5cSjqeGYDb+rb0qnxXTdju767bQmounecO/0aPDbJiJ31
	syMYRzYeP1ZLvgR15dgEG7emA781XBr25GgUc/Qtu5ciyU1t9sT62mh/A6AwR0RMw3XV6nIHx/Uo6
	Ph3gNoRA2UlzmyusbrYjAc71T1b41R1M6/YSNX4ZUKR0SOXSB2DiTvawtGjpPye4mCnvZLo4LXhKa
	QO1/4hCgmhaFi65rnwzt5NUvWxlH+Iyg0J2x3/jpWthttS2JkMNfWRbd02ODsWFkPvqDuTrHJauXA
	4wv7Khog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFq3q-00000002k2X-3Tzx;
	Fri, 16 May 2025 08:04:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpzg-00000002jVN-0hqs;
	Fri, 16 May 2025 08:00:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 662E3614BB;
	Fri, 16 May 2025 08:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7C0C4CEED;
	Fri, 16 May 2025 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747382435;
	bh=sJyp0PS6YswFZq8eBg4a4xjrjdQIP1pQUNaiWS5g9jI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZXj4GtWN6svSJzxZ82ItTUOh8LIr0bs9Fbs6/qKf43ALvvF8uuKdi3dmdNYnyWtLo
	 yQ1ec+uZu90SJkImmkX9ogO70BGhzeWvKlVsIGRFUZjXgU7UGdrPNlGjvWKuf4te8w
	 MxriXLLkBNZaBRbNKHo6a6F0r4n+DDPUJ1tReS5sXPNPvV8vU6q0b+g7ugqVjfSyiG
	 BBkGihAMlOhEjQZaRxjPHDQhjL1qSDer/kVQHpzKOpRxXnhJB3cz4ZzsZJalYcx7WK
	 cGkImN6UoxNH5O3Jq14Cet0IWFIVotNqe9lC5VsCH1mqPrZTke8dekZxobbtv+JAsA
	 Rwsg2rrWQCk7g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 16 May 2025 09:59:59 +0200
Subject: [PATCH net-next v2 1/3] net: airoha: npu: Move memory allocation
 in airoha_npu_send_msg() caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-airoha-en7581-flowstats-v2-1-06d5fbf28984@kernel.org>
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
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

Move ppe_mbox_data struct memory allocation from airoha_npu_send_msg
routine to the caller one. This is a preliminary patch to enable wlan NPU
offloading and flow counter stats support.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 126 ++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 54 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index ead0625e781f57cd7c5883b6dd3d441db62292d3..51c6fbd7b7b772baf8e05b10250d37416fa36f39 100644
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
@@ -261,76 +254,101 @@ static irqreturn_t airoha_npu_wdt_handler(int irq, void *core_instance)
 
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
+
+	ppe_data = kzalloc(sizeof(*ppe_data), GFP_KERNEL);
+	if (!ppe_data)
+		return -ENOMEM;
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
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
+
+	ppe_data->func_type = NPU_OP_SET;
+	ppe_data->func_id = PPE_FUNC_SET_WAIT_API;
+	ppe_data->set_info.func_id = PPE_SRAM_RESET_VAL;
+	ppe_data->set_info.data = foe_addr;
+	ppe_data->set_info.size = sram_num_entries;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
+	kfree(ppe_data);
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
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
-		return err;
+		goto out;
+
+	ppe_data->set_info.func_id = PPE_SRAM_SET_VAL;
+	ppe_data->set_info.data = hash;
+	ppe_data->set_info.size = sizeof(u32);
 
-	ppe_data.set_info.func_id = PPE_SRAM_SET_VAL;
-	ppe_data.set_info.data = hash;
-	ppe_data.set_info.size = sizeof(u32);
+	err = airoha_npu_send_msg(npu, NPU_FUNC_PPE, ppe_data,
+				  sizeof(*ppe_data));
+out:
+	kfree(ppe_data);
 
-	return airoha_npu_send_msg(npu, NPU_FUNC_PPE, &ppe_data,
-				   sizeof(struct ppe_mbox_data));
+	return err;
 }
 
 struct airoha_npu *airoha_npu_get(struct device *dev)

-- 
2.49.0


