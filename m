Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E1EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 22:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnNRSAJFXExbfcI4FZdhcGHoEAcdOKJS1t28mOIX4ho=; b=PhNNry1ohlfFn1ODSR3pkYef2k
	QVoHSAYvt4dLggsDKYfzNM6z4Muk87hDgOqXFYJQTDSvi1TJzUy0eiVLpEQX8uQ0R7rJdzeBwlcCm
	85/+5jjqPr3ta0Nhydali+bQnNEhWR1JEtw78SUeJFaAkJQtC6mnuo+EkduObXUSf0t3gzV7YAD5W
	ze9tOTQCd1W+gN8NCa4LSp9QTtvF4aX3xvaJo9eono4G+nz/kCM2nydgkqxbTv/v0GurF09M0HBmS
	jshXajy84VtEo363xzwzcZxcU0mRmXIR8/yMkur26sEgtFMk12gMCUw4XO2paUkYFdnmbG3Xb2Ju5
	9kkddNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjwh-00000006orn-1KVL;
	Tue, 01 Jul 2025 22:59:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjOX-00000006mEC-3YLa;
	Tue, 01 Jul 2025 22:24:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0851E44C37;
	Tue,  1 Jul 2025 22:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C450C4CEEB;
	Tue,  1 Jul 2025 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408643;
	bh=K9FFHLIOVp/T297T8ldnFsmbwPzUF1X8BIBdvNgA5HA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bxYFR93uOXwel02OpZ5zXOqa46WNkfECGnxHjX0/KopB6xC7NonUdIdZJ6L0HlapQ
	 zqxZqwWWRzq0TfD38eEE7My1D0II7t5awxBwuheVo6LFAlGKv6SZRVVIOSw0hpuKtK
	 DrmLHXZNemOBHF7XV3ybXRSpse2VCA5mhozmzg5EcOY8PJygsn4pCIOfZ4iYNv9FLM
	 DzTotIpglygXsyv4hQXoZ7u4Ei/HZUH1Q9CdFWGqKIFOIpqp9MMmX3Lnxn94CUqTZQ
	 t8DIh0gGc2VlUDd6CH3QoUAyJU2abPW5zglChFpZ/ikNU/cJgtiUeesRghcaJxQv31
	 Ek1wHKN6ZN+Rw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 02 Jul 2025 00:23:31 +0200
Subject: [PATCH net-next 2/6] net: airoha: npu: Add more wlan NPU callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-airoha-en7581-wlan-offlaod-v1-2-803009700b38@kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_152405_932307_0468952C 
X-CRM114-Status: GOOD (  12.57  )
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

Introduce more NPU wlan callbacks used by wlan driver (MT76) to initialize
NPU module register for offloading wireless-wired offloading.
This is a preliminary patch to enable wlan flowtable offload for EN7581
SoC with MT76 driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 163 +++++++++++++++++++++++++++++++
 drivers/net/ethernet/airoha/airoha_npu.h |  21 ++++
 2 files changed, 184 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index f8057072cfd7bb114e34af176aabaa1ef9f052c0..8acb2c627dc32386f40795a26e03d36fffe359ac 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -42,6 +42,22 @@
 #define REG_CR_MBQ8_CTRL(_n)		(NPU_MBOX_BASE_ADDR + 0x0b0 + ((_n) << 2))
 #define REG_CR_NPU_MIB(_n)		(NPU_MBOX_BASE_ADDR + 0x140 + ((_n) << 2))
 
+#define NPU_WLAN_BASE_ADDR		0x30d000
+
+#define REG_IRQ_STATUS			(NPU_WLAN_BASE_ADDR + 0x030)
+#define REG_IRQ_RXDONE(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 2) + 0x034)
+#define NPU_IRQ_RX_MASK(_n)		((_n) == 1 ? BIT(17) : BIT(16))
+
+#define REG_TX_BASE(_n)			(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x080)
+#define REG_TX_DSCP_NUM(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x084)
+#define REG_TX_CPU_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x088)
+#define REG_TX_DMA_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x08c)
+
+#define REG_RX_BASE(_n)			(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x180)
+#define REG_RX_DSCP_NUM(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x184)
+#define REG_RX_CPU_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x188)
+#define REG_RX_DMA_IDX(_n)		(NPU_WLAN_BASE_ADDR + ((_n) << 4) + 0x18c)
+
 #define NPU_TIMER_BASE_ADDR		0x310100
 #define REG_WDT_TIMER_CTRL(_n)		(NPU_TIMER_BASE_ADDR + ((_n) * 0x100))
 #define WDT_EN_MASK			BIT(25)
@@ -161,6 +177,19 @@ enum {
 	WLAN_FUNC_SET_WAIT_DEBUG_ARRAY_ADDR,
 };
 
+enum {
+	WLAN_FUNC_GET_WAIT_NPU_INFO,
+	WLAN_FUNC_GET_WAIT_LAST_RATE,
+	WLAN_FUNC_GET_WAIT_COUNTER,
+	WLAN_FUNC_GET_WAIT_DBG_COUNTER,
+	WLAN_FUNC_GET_WAIT_RXDESC_BASE,
+	WLAN_FUNC_GET_WAIT_WCID_DBG_COUNTER,
+	WLAN_FUNC_GET_WAIT_DMA_ADDR,
+	WLAN_FUNC_GET_WAIT_RING_SIZE,
+	WLAN_FUNC_GET_WAIT_NPU_SUPPORT_MAP,
+	WLAN_FUNC_GET_WAIT_MDC_LOCK_ADDRESS,
+};
+
 #define WLAN_MAX_STATS_SIZE	4408
 struct wlan_mbox_data {
 	u32 ifindex:4;
@@ -168,6 +197,12 @@ struct wlan_mbox_data {
 	u32 func_id;
 	union {
 		u32 data;
+		struct {
+			u32 dir;
+			u32 in_counter_addr;
+			u32 out_status_addr;
+			u32 out_counter_addr;
+		} txrx_addr;
 		u8 stats[WLAN_MAX_STATS_SIZE];
 	};
 };
@@ -460,6 +495,29 @@ static int airoha_npu_wlan_send_msg(struct airoha_npu *npu, int ifindex,
 	return err;
 }
 
+static int airoha_npu_wlan_get_msg(struct airoha_npu *npu, int index,
+				   int func_id, u32 *data)
+{
+	struct wlan_mbox_data *wlan_data;
+	int err;
+
+	wlan_data = kzalloc(sizeof(*wlan_data), GFP_ATOMIC);
+	if (!wlan_data)
+		return -ENOMEM;
+
+	wlan_data->ifindex = index;
+	wlan_data->func_type = NPU_OP_GET;
+	wlan_data->func_id = func_id;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
+				  sizeof(*wlan_data));
+	if (!err)
+		*data = wlan_data->data;
+	kfree(wlan_data);
+
+	return err;
+}
+
 static int airoha_npu_wlan_set_reserved_memory(struct airoha_npu *npu,
 					       int ifindex, const char *name,
 					       int func_id)
@@ -512,6 +570,99 @@ static int airoha_npu_wlan_init_memory(struct airoha_npu *npu)
 	return airoha_npu_wlan_send_msg(npu, 0, cmd, 0, GFP_KERNEL);
 }
 
+static int airoha_npu_wlan_txrx_reg_addr_set(struct airoha_npu *npu,
+					     int ifindex, u32 dir,
+					     u32 in_counter_addr,
+					     u32 out_status_addr,
+					     u32 out_counter_addr)
+{
+	struct wlan_mbox_data *wlan_data;
+	int err;
+
+	wlan_data = kzalloc(sizeof(*wlan_data), GFP_ATOMIC);
+	if (!wlan_data)
+		return -ENOMEM;
+
+	wlan_data->ifindex = ifindex;
+	wlan_data->func_type = NPU_OP_SET;
+	wlan_data->func_id = WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR;
+	wlan_data->txrx_addr.dir = dir;
+	wlan_data->txrx_addr.in_counter_addr = in_counter_addr;
+	wlan_data->txrx_addr.out_status_addr = out_status_addr;
+	wlan_data->txrx_addr.out_counter_addr = out_counter_addr;
+
+	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data,
+				  sizeof(*wlan_data));
+	kfree(wlan_data);
+
+	return err;
+}
+
+static int airoha_npu_wlan_pcie_port_type_set(struct airoha_npu *npu,
+					      int ifindex, u32 port_type)
+{
+	return airoha_npu_wlan_send_msg(npu, ifindex,
+					WLAN_FUNC_SET_WAIT_PCIE_PORT_TYPE,
+					port_type, GFP_ATOMIC);
+}
+
+static int airoha_npu_wlan_pcie_addr_set(struct airoha_npu *npu,
+					 int ifindex, u32 addr)
+{
+	return airoha_npu_wlan_send_msg(npu, ifindex,
+					WLAN_FUNC_SET_WAIT_PCIE_ADDR, addr,
+					GFP_ATOMIC);
+}
+
+static int airoha_npu_wlan_desc_set(struct airoha_npu *npu, int ifindex,
+				    u32 desc)
+{
+	return airoha_npu_wlan_send_msg(npu, ifindex,
+					WLAN_FUNC_SET_WAIT_DESC, desc,
+					GFP_ATOMIC);
+}
+
+static int airoha_npu_wlan_tx_ring_pcie_addr_set(struct airoha_npu *npu,
+						 int ifindex, u32 addr)
+{
+	return airoha_npu_wlan_send_msg(npu, ifindex,
+					WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
+					addr, GFP_ATOMIC);
+}
+
+static int airoha_npu_wlan_rx_desc_base_get(struct airoha_npu *npu,
+					    int ifindex, u32 *data)
+
+{
+	return airoha_npu_wlan_get_msg(npu, ifindex,
+				       WLAN_FUNC_GET_WAIT_RXDESC_BASE, data);
+}
+
+static int airoha_npu_wlan_tx_buf_space_base_set(struct airoha_npu *npu,
+						 int ifindex, u32 addr)
+{
+	return airoha_npu_wlan_send_msg(npu, ifindex,
+			WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
+			addr, GFP_ATOMIC);
+}
+
+static int airoha_npu_wlan_rx_ring_for_txdone_set(struct airoha_npu *npu,
+						  int ifindex, u32 addr)
+{
+	return airoha_npu_wlan_send_msg(npu, ifindex,
+			WLAN_FUNC_SET_WAIT_RX_RING_FOR_TXDONE_HW_BASE,
+			addr, GFP_ATOMIC);
+}
+
+static u32 airoha_npu_wlan_queue_addr_get(struct airoha_npu *npu, int qid,
+					  bool xmit)
+{
+	if (xmit)
+		return REG_TX_BASE(qid + 2);
+
+	return REG_RX_BASE(qid);
+}
+
 struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
 {
 	struct platform_device *pdev;
@@ -616,6 +767,18 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
 	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
 	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;
+	npu->ops.wlan_set_txrx_reg_addr = airoha_npu_wlan_txrx_reg_addr_set;
+	npu->ops.wlan_set_pcie_port_type = airoha_npu_wlan_pcie_port_type_set;
+	npu->ops.wlan_set_pcie_addr = airoha_npu_wlan_pcie_addr_set;
+	npu->ops.wlan_set_desc = airoha_npu_wlan_desc_set;
+	npu->ops.wlan_set_tx_ring_pcie_addr =
+		airoha_npu_wlan_tx_ring_pcie_addr_set;
+	npu->ops.wlan_get_rx_desc_base = airoha_npu_wlan_rx_desc_base_get;
+	npu->ops.wlan_set_tx_buf_space_base =
+		airoha_npu_wlan_tx_buf_space_base_set;
+	npu->ops.wlan_set_rx_ring_for_txdone =
+		airoha_npu_wlan_rx_ring_for_txdone_set;
+	npu->ops.wlan_get_queue_addr = airoha_npu_wlan_queue_addr_get;
 
 	npu->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
 	if (IS_ERR(npu->regmap))
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
index 242f0d15b2f7c262daaf7bb78ee386ccc8a0433d..9fdec469e7b0e7caa5d988dfd78578d860a0e66d 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ b/drivers/net/ethernet/airoha/airoha_npu.h
@@ -30,6 +30,27 @@ struct airoha_npu {
 					    u32 entry_size, u32 hash,
 					    bool ppe2);
 		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
+		int (*wlan_set_txrx_reg_addr)(struct airoha_npu *npu,
+					      int ifindex, u32 dir,
+					      u32 in_counter_addr,
+					      u32 out_status_addr,
+					      u32 out_counter_addr);
+		int (*wlan_set_pcie_port_type)(struct airoha_npu *npu,
+					       int ifindex, u32 port_type);
+		int (*wlan_set_pcie_addr)(struct airoha_npu *npu, int ifindex,
+					  u32 addr);
+		int (*wlan_set_desc)(struct airoha_npu *npu, int ifindex,
+				     u32 desc);
+		int (*wlan_set_tx_ring_pcie_addr)(struct airoha_npu *npu,
+						  int ifindex, u32 addr);
+		int (*wlan_get_rx_desc_base)(struct airoha_npu *npu,
+					     int ifindex, u32 *data);
+		int (*wlan_set_tx_buf_space_base)(struct airoha_npu *npu,
+						  int ifindex, u32 addr);
+		int (*wlan_set_rx_ring_for_txdone)(struct airoha_npu *npu,
+						   int ifindex, u32 addr);
+		u32 (*wlan_get_queue_addr)(struct airoha_npu *npu, int qid,
+					   bool xmit);
 	} ops;
 };
 

-- 
2.50.0


