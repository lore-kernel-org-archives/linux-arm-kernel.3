Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFDFC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXI371y6Q91IjKZJl3725EGaRZHJZc6/jNsLEslSaEw=; b=nyLJpcz4IczcpWePBKxRIrRgKu
	s9tdsaSk6IbuMwjMphINkj1Z94y6dEl0rGxQYkBeRVik92DXozS6wyZym92KE8uq8zjPIH6iHUjd8
	v+LpzCXT5kKk1UcP0zUdNQ6VPLvf+FXfZ2gCAt2hiXWpPTbA08+ZolPq/axR/csXiXIcB/eBQ5k8W
	WdEQtO6JkIyqQLkeePFeNhPWetT/sdshKi2I8F2zedIwdOMLZmY5v7XDlIGo4Yku9wOLeg7SDeBcY
	uCTl5VnNSKoKwtAba20WFtdQVe+jdHl/6ZC3LyleJ+ut2fDh0Nl021wmntL8iDJ/7/8xyipBTRF+V
	j76bT8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFX-0000000344b-1BIY;
	Mon, 14 Jul 2025 18:50:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL3n-00000002f3W-2BnL;
	Mon, 14 Jul 2025 15:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 078315C53B8;
	Mon, 14 Jul 2025 15:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C23C4CEED;
	Mon, 14 Jul 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506742;
	bh=mt8GmlNMdRJGO4Ucaja9GT8LlCzPjyTro3ntkOcoqF4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=smX1IeC0UNBZluYlsyh4fBXIwhxtG02gOtG0S1T3uVV24uZlbmM/MT8iNDyssIR3w
	 MhHGAQSDbj1xUx2nF12F5mYgI0foREHBnZdV9KQGVBG+sx8WJKV9K4b1+qurx3jEt3
	 DCrPn4QbsAG6is35WsIXOjjGPpGPxtukujUBVkfPAfqcFEPaNp8euXEQaRZMpXZ1ac
	 JJYy9hGy80fl/g0AnOQpGzWYzjbgeuCmojdLyF5BLZAHWianXynxzJY7SBcPjf/yA9
	 OzoA7qeS3FlTzT6wa9StKS3y0KOqiVwkUeTiyInMblNa9t8SKL3fyzlzeLFmSwt6gi
	 YhPgAHQkjZdwQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 14 Jul 2025 17:25:15 +0200
Subject: [PATCH net-next v3 2/7] net: airoha: npu: Add NPU wlan memory
 initialization commands
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-airoha-en7581-wlan-offlaod-v3-2-80abf6aae9e4@kernel.org>
References: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
In-Reply-To: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_082543_652114_CDAF21E6 
X-CRM114-Status: GOOD (  12.78  )
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

Introduce wlan_init_reserved_memory callback used by MT76 driver during
NPU wlan offloading setup.
This is a preliminary patch to enable wlan flowtable offload for EN7581
SoC with MT76 driver.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 81 ++++++++++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_npu.h | 38 +++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4e8deb87f7514b2d17d877d485ffb3bce1ae03be..bcf7f5e645f7ec5e3e8c7474f6715f4810d192dc 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -124,6 +124,17 @@ struct ppe_mbox_data {
 	};
 };
 
+#define WLAN_MAX_STATS_SIZE	4408
+struct wlan_mbox_data {
+	u32 ifindex:4;
+	u32 func_type:4;
+	u32 func_id;
+	union {
+		u32 data;
+		u8 stats[WLAN_MAX_STATS_SIZE];
+	};
+};
+
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)
 {
@@ -390,6 +401,75 @@ static int airoha_npu_stats_setup(struct airoha_npu *npu,
 	return err;
 }
 
+static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
+				    enum airoha_npu_wlan_set_cmd func_id,
+				    u32 data, gfp_t gfp)
+{
+	struct wlan_mbox_data *wlan_data;
+	int err;
+
+	wlan_data = kzalloc(sizeof(*wlan_data), gfp);
+	if (!wlan_data)
+		return -ENOMEM;
+
+	wlan_data->ifindex = ifindex;
+	wlan_data->func_type = NPU_OP_SET;
+	wlan_data->func_id = func_id;
+	wlan_data->data = data;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
+				  sizeof(*wlan_data));
+	kfree(wlan_data);
+
+	return err;
+}
+
+static int
+airoha_npu_wlan_set_reserved_memory(struct airoha_npu *npu,
+				    int ifindex, const char *name,
+				    enum airoha_npu_wlan_set_cmd func_id)
+{
+	struct device *dev = npu->dev;
+	struct resource res;
+	int err;
+
+	err = of_reserved_mem_region_to_resource_byname(dev->of_node, name,
+							&res);
+	if (err)
+		return err;
+
+	return airoha_npu_wlan_msg_send(npu, ifindex, func_id, res.start,
+					GFP_KERNEL);
+}
+
+static int airoha_npu_wlan_init_memory(struct airoha_npu *npu)
+{
+	enum airoha_npu_wlan_set_cmd cmd = WLAN_FUNC_SET_WAIT_NPU_BAND0_ONCPU;
+	int err;
+
+	err = airoha_npu_wlan_msg_send(npu, 1, cmd, 0, GFP_KERNEL);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_TX_BUF_CHECK_ADDR;
+	err = airoha_npu_wlan_set_reserved_memory(npu, 0, "tx-bufid", cmd);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_PKT_BUF_ADDR;
+	err = airoha_npu_wlan_set_reserved_memory(npu, 0, "pkt", cmd);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_TX_PKT_BUF_ADDR;
+	err = airoha_npu_wlan_set_reserved_memory(npu, 0, "tx-pkt", cmd);
+	if (err)
+		return err;
+
+	cmd = WLAN_FUNC_SET_WAIT_IS_FORCE_TO_CPU;
+	return airoha_npu_wlan_msg_send(npu, 0, cmd, 0, GFP_KERNEL);
+}
+
 struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
 {
 	struct platform_device *pdev;
@@ -492,6 +572,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
 	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
 	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
+	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;
 
 	npu->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
 	if (IS_ERR(npu->regmap))
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
index 98ec3be74ce450bf4fa8bc771d19d174e8c157e5..58f4ee04e17161acbe513779638c23fe79a83a78 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ b/drivers/net/ethernet/airoha/airoha_npu.h
@@ -6,6 +6,43 @@
 
 #define NPU_NUM_CORES		8
 
+enum airoha_npu_wlan_set_cmd {
+	WLAN_FUNC_SET_WAIT_PCIE_ADDR,
+	WLAN_FUNC_SET_WAIT_DESC,
+	WLAN_FUNC_SET_WAIT_NPU_INIT_DONE,
+	WLAN_FUNC_SET_WAIT_TRAN_TO_CPU,
+	WLAN_FUNC_SET_WAIT_BA_WIN_SIZE,
+	WLAN_FUNC_SET_WAIT_DRIVER_MODEL,
+	WLAN_FUNC_SET_WAIT_DEL_STA,
+	WLAN_FUNC_SET_WAIT_DRAM_BA_NODE_ADDR,
+	WLAN_FUNC_SET_WAIT_PKT_BUF_ADDR,
+	WLAN_FUNC_SET_WAIT_IS_TEST_NOBA,
+	WLAN_FUNC_SET_WAIT_FLUSHONE_TIMEOUT,
+	WLAN_FUNC_SET_WAIT_FLUSHALL_TIMEOUT,
+	WLAN_FUNC_SET_WAIT_IS_FORCE_TO_CPU,
+	WLAN_FUNC_SET_WAIT_PCIE_STATE,
+	WLAN_FUNC_SET_WAIT_PCIE_PORT_TYPE,
+	WLAN_FUNC_SET_WAIT_ERROR_RETRY_TIMES,
+	WLAN_FUNC_SET_WAIT_BAR_INFO,
+	WLAN_FUNC_SET_WAIT_FAST_FLAG,
+	WLAN_FUNC_SET_WAIT_NPU_BAND0_ONCPU,
+	WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
+	WLAN_FUNC_SET_WAIT_TX_DESC_HW_BASE,
+	WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
+	WLAN_FUNC_SET_WAIT_RX_RING_FOR_TXDONE_HW_BASE,
+	WLAN_FUNC_SET_WAIT_TX_PKT_BUF_ADDR,
+	WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
+	WLAN_FUNC_SET_WAIT_INODE_DEBUG_FLAG,
+	WLAN_FUNC_SET_WAIT_INODE_HW_CFG_INFO,
+	WLAN_FUNC_SET_WAIT_INODE_STOP_ACTION,
+	WLAN_FUNC_SET_WAIT_INODE_PCIE_SWAP,
+	WLAN_FUNC_SET_WAIT_RATELIMIT_CTRL,
+	WLAN_FUNC_SET_WAIT_HWNAT_INIT,
+	WLAN_FUNC_SET_WAIT_ARHT_CHIP_INFO,
+	WLAN_FUNC_SET_WAIT_TX_BUF_CHECK_ADDR,
+	WLAN_FUNC_SET_WAIT_DEBUG_ARRAY_ADDR,
+};
+
 struct airoha_npu {
 	struct device *dev;
 	struct regmap *regmap;
@@ -29,6 +66,7 @@ struct airoha_npu {
 					    dma_addr_t foe_addr,
 					    u32 entry_size, u32 hash,
 					    bool ppe2);
+		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
 	} ops;
 };
 

-- 
2.50.1


