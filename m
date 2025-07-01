Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0180C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 23:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e40PMVpZqzOVhJtVM1+4KVY8RW7oyseVgQJLYUHiotQ=; b=RJf6TcrJKnv4PZmKpxowY+qivp
	LrKl9wv8VU7hnoXGT/Fw3Q5LTo8UlNnkl9gVE4XsuzJu3tzW1OIe6XauQhyRHX2y3EIcThY2/GC0n
	zZf8BGpqlwyZxJmUJPudqfFOEpAlJGYwG/wK3Eb2iqGOYcFSw+NoEHlPqVAcozL2k7d3tyDMP2s5B
	NKKIxyJscZ6UYvM2GuGdLv7hyIspBzxcjFK3SYiejp6qo9idv8G+9Vibvpp74SV0XSTowIi/6/dY8
	zhPALnEWGrWQbGBWRPjiW2dg+Y6Cea1G7ARIH9GGl5L8kGuZ2RosrPjm6VNH3sGG1EMx5OArEeTDw
	MPmlTfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWk5u-00000006pXx-3p8T;
	Tue, 01 Jul 2025 23:08:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWjOh-00000006mGW-3T5m;
	Tue, 01 Jul 2025 22:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0C37CA52C3F;
	Tue,  1 Jul 2025 22:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E10C4CEEB;
	Tue,  1 Jul 2025 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408654;
	bh=ioy5WpVEp/hb8T6iEC04eOhiEoRTknTmHlH1RErJhSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Okf35a/mQap60A5U4aGk0h3/lRltBMzwOGvBvd116Hyooe7LVIEziA6titUvfFX0D
	 vc1lsMBFf7ddFWIBP3XDTbtPmCfrZrpORV8o2YPs+Ai6OfQleizVBtSNvPfjMf1Thg
	 3EODJyfYmWHtm9ws71plEJDXtt+0FeKmASk7G/xZc1QCQEQoSSqXQuZNdAWvtpXyS9
	 rqe5QkInDnklWMkgUsAZfp/8FWu2/Y85kKx64ZMZGXr9/8BkbpL1PnS4I6qPZO3PZn
	 9ST9nOdKUOm66A9DFD/b/s6Wq+iyOrk11PWAiSo7/cgs1zWVlzjtBr2WHMAgg+caaH
	 xM/Yjcgwi7RLA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 02 Jul 2025 00:23:35 +0200
Subject: [PATCH net-next 6/6] net: airoha: Add airoha_offload.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-airoha-en7581-wlan-offlaod-v1-6-803009700b38@kernel.org>
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
X-CRM114-CacheID: sfid-20250701_152416_002461_EA956F4A 
X-CRM114-Status: GOOD (  16.30  )
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

Move NPU definitions to airoha_offload.h in include/linux/soc/airoha/ in
order to allow the MT76 driver to access the callback definitions.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c  |   2 +-
 drivers/net/ethernet/airoha/airoha_npu.h  |  65 -------
 drivers/net/ethernet/airoha/airoha_ppe.c  |   2 +-
 include/linux/soc/airoha/airoha_offload.h | 295 ++++++++++++++++++++++++++++++
 4 files changed, 297 insertions(+), 67 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 3e30cd424085d882aad98a0e751743de73f135fe..46cc3598defa409f0465de0362883ec0e59280fc 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -11,9 +11,9 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/regmap.h>
+#include <linux/soc/airoha/airoha_offload.h>
 
 #include "airoha_eth.h"
-#include "airoha_npu.h"
 
 #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
 #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
diff --git a/drivers/net/ethernet/airoha/airoha_npu.h b/drivers/net/ethernet/airoha/airoha_npu.h
deleted file mode 100644
index 19cfc6b7fb52f4a176d91c7b39383b4c3e13d777..0000000000000000000000000000000000000000
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2025 AIROHA Inc
- * Author: Lorenzo Bianconi <lorenzo@kernel.org>
- */
-
-#define NPU_NUM_CORES		8
-#define NPU_NUM_IRQ		6
-
-struct airoha_npu {
-	struct device *dev;
-	struct regmap *regmap;
-
-	struct airoha_npu_core {
-		struct airoha_npu *npu;
-		/* protect concurrent npu memory accesses */
-		spinlock_t lock;
-		struct work_struct wdt_work;
-	} cores[NPU_NUM_CORES];
-
-	int irqs[NPU_NUM_IRQ];
-
-	struct airoha_foe_stats __iomem *stats;
-
-	struct {
-		int (*ppe_init)(struct airoha_npu *npu);
-		int (*ppe_deinit)(struct airoha_npu *npu);
-		int (*ppe_flush_sram_entries)(struct airoha_npu *npu,
-					      dma_addr_t foe_addr,
-					      int sram_num_entries);
-		int (*ppe_foe_commit_entry)(struct airoha_npu *npu,
-					    dma_addr_t foe_addr,
-					    u32 entry_size, u32 hash,
-					    bool ppe2);
-		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
-		int (*wlan_set_txrx_reg_addr)(struct airoha_npu *npu,
-					      int ifindex, u32 dir,
-					      u32 in_counter_addr,
-					      u32 out_status_addr,
-					      u32 out_counter_addr);
-		int (*wlan_set_pcie_port_type)(struct airoha_npu *npu,
-					       int ifindex, u32 port_type);
-		int (*wlan_set_pcie_addr)(struct airoha_npu *npu, int ifindex,
-					  u32 addr);
-		int (*wlan_set_desc)(struct airoha_npu *npu, int ifindex,
-				     u32 desc);
-		int (*wlan_set_tx_ring_pcie_addr)(struct airoha_npu *npu,
-						  int ifindex, u32 addr);
-		int (*wlan_get_rx_desc_base)(struct airoha_npu *npu,
-					     int ifindex, u32 *data);
-		int (*wlan_set_tx_buf_space_base)(struct airoha_npu *npu,
-						  int ifindex, u32 addr);
-		int (*wlan_set_rx_ring_for_txdone)(struct airoha_npu *npu,
-						   int ifindex, u32 addr);
-		u32 (*wlan_get_queue_addr)(struct airoha_npu *npu, int qid,
-					   bool xmit);
-		void (*wlan_set_irq_status)(struct airoha_npu *npu, u32 val);
-		u32 (*wlan_get_irq_status)(struct airoha_npu *npu, int q);
-		void (*wlan_enable_irq)(struct airoha_npu *npu, int q);
-		void (*wlan_disable_irq)(struct airoha_npu *npu, int q);
-	} ops;
-};
-
-struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr);
-void airoha_npu_put(struct airoha_npu *npu);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index c354d536bc66e97ab853792e4ab4273283d2fb91..5d12bde6b20a89b3037ae4405b383d75307e8239 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -7,10 +7,10 @@
 #include <linux/ip.h>
 #include <linux/ipv6.h>
 #include <linux/rhashtable.h>
+#include <linux/soc/airoha/airoha_offload.h>
 #include <net/ipv6.h>
 #include <net/pkt_cls.h>
 
-#include "airoha_npu.h"
 #include "airoha_regs.h"
 #include "airoha_eth.h"
 
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
new file mode 100644
index 0000000000000000000000000000000000000000..d2353da154d7ab1ae97901a46062ef49fcefa74d
--- /dev/null
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -0,0 +1,295 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 AIROHA Inc
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+#ifndef AIROHA_OFFLOAD_H
+#define AIROHA_OFFLOAD_H
+
+#define NPU_NUM_CORES		8
+#define NPU_NUM_IRQ		6
+#define NPU_RX0_DESC_NUM	512
+#define NPU_RX1_DESC_NUM	512
+
+/* CTRL */
+#define NPU_RX_DMA_DESC_LAST_MASK	BIT(29)
+#define NPU_RX_DMA_DESC_LEN_MASK	GENMASK(28, 15)
+#define NPU_RX_DMA_DESC_CUR_LEN_MASK	GENMASK(14, 1)
+#define NPU_RX_DMA_DESC_DONE_MASK	BIT(0)
+/* INFO */
+#define NPU_RX_DMA_PKT_COUNT_MASK	GENMASK(31, 28)
+#define NPU_RX_DMA_PKT_ID_MASK		GENMASK(28, 26)
+#define NPU_RX_DMA_SRC_PORT_MASK	GENMASK(25, 21)
+#define NPU_RX_DMA_CRSN_MASK		GENMASK(20, 16)
+#define NPU_RX_DMA_FOE_ID_MASK		GENMASK(15, 0)
+/* DATA */
+#define NPU_RX_DMA_SID_MASK		GENMASK(31, 16)
+#define NPU_RX_DMA_FRAG_TYPE_MASK	GENMASK(15, 14)
+#define NPU_RX_DMA_PRIORITY_MASK	GENMASK(13, 10)
+#define NPU_RX_DMA_RADIO_ID_MASK	GENMASK(9, 6)
+#define NPU_RX_DMA_VAP_ID_MASK		GENMASK(5, 2)
+#define NPU_RX_DMA_FRAME_TYPE_MASK	GENMASK(1, 0)
+
+struct airoha_npu_rx_dma_desc {
+	u32 ctrl;
+	u32 info;
+	u32 data;
+	u32 addr;
+	u64 rsv;
+} __packed;
+
+/* CTRL */
+#define NPU_TX_DMA_DESC_SCHED_MASK	BIT(31)
+#define NPU_TX_DMA_DESC_LEN_MASK	GENMASK(30, 18)
+#define NPU_TX_DMA_DESC_VEND_LEN_MASK	GENMASK(17, 1)
+#define NPU_TX_DMA_DESC_DONE_MASK	BIT(0)
+
+#define NPU_TXWI_LEN	192
+
+struct airoha_npu_tx_dma_desc {
+	u32 ctrl;
+	u32 addr;
+	u64 rsv;
+	u8 txwi[NPU_TXWI_LEN];
+} __packed;
+
+struct airoha_npu {
+#if (IS_BUILTIN(CONFIG_NET_AIROHA_NPU) || IS_MODULE(CONFIG_NET_AIROHA_NPU))
+	struct device *dev;
+	struct regmap *regmap;
+
+	struct airoha_npu_core {
+		struct airoha_npu *npu;
+		/* protect concurrent npu memory accesses */
+		spinlock_t lock;
+		struct work_struct wdt_work;
+	} cores[NPU_NUM_CORES];
+
+	int irqs[NPU_NUM_IRQ];
+
+	struct airoha_foe_stats __iomem *stats;
+
+	struct {
+		int (*ppe_init)(struct airoha_npu *npu);
+		int (*ppe_deinit)(struct airoha_npu *npu);
+		int (*ppe_flush_sram_entries)(struct airoha_npu *npu,
+					      dma_addr_t foe_addr,
+					      int sram_num_entries);
+		int (*ppe_foe_commit_entry)(struct airoha_npu *npu,
+					    dma_addr_t foe_addr,
+					    u32 entry_size, u32 hash,
+					    bool ppe2);
+		int (*wlan_init_reserved_memory)(struct airoha_npu *npu);
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
+		void (*wlan_set_irq_status)(struct airoha_npu *npu, u32 val);
+		u32 (*wlan_get_irq_status)(struct airoha_npu *npu, int q);
+		void (*wlan_enable_irq)(struct airoha_npu *npu, int q);
+		void (*wlan_disable_irq)(struct airoha_npu *npu, int q);
+	} ops;
+#endif
+};
+
+#if (IS_BUILTIN(CONFIG_NET_AIROHA_NPU) || IS_MODULE(CONFIG_NET_AIROHA_NPU))
+struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr);
+void airoha_npu_put(struct airoha_npu *npu);
+
+static inline int airoha_npu_wlan_init_reserved_memory(struct airoha_npu *npu)
+{
+	return npu->ops.wlan_init_reserved_memory(npu);
+}
+
+static inline int airoha_npu_wlan_set_txrx_reg_addr(struct airoha_npu *npu,
+						    int ifindex, u32 dir,
+						    u32 in_counter_addr,
+						    u32 out_status_addr,
+						    u32 out_counter_addr)
+{
+	return npu->ops.wlan_set_txrx_reg_addr(npu, ifindex, dir,
+					       in_counter_addr,
+					       out_status_addr,
+					       out_counter_addr);
+}
+
+static inline int airoha_npu_wlan_set_pcie_port_type(struct airoha_npu *npu,
+						     int ifindex,
+						     u32 port_type)
+{
+	return npu->ops.wlan_set_pcie_port_type(npu, ifindex, port_type);
+}
+
+static inline int airoha_npu_wlan_set_pcie_addr(struct airoha_npu *npu,
+						int ifindex, u32 addr)
+{
+	return npu->ops.wlan_set_pcie_addr(npu, ifindex, addr);
+}
+
+static inline int airoha_npu_wlan_set_desc(struct airoha_npu *npu, int ifindex,
+					   u32 desc)
+{
+	return npu->ops.wlan_set_desc(npu, ifindex, desc);
+}
+
+static inline int airoha_npu_wlan_set_tx_ring_pcie_addr(struct airoha_npu *npu,
+							int ifindex, u32 addr)
+{
+	return npu->ops.wlan_set_tx_ring_pcie_addr(npu, ifindex, addr);
+}
+
+static inline int airoha_npu_wlan_get_rx_desc_base(struct airoha_npu *npu, int ifindex,
+						   u32 *data)
+{
+	return npu->ops.wlan_get_rx_desc_base(npu, ifindex, data);
+}
+
+static inline int airoha_npu_wlan_set_tx_buf_space_base(struct airoha_npu *npu,
+							int ifindex, u32 addr)
+{
+	return npu->ops.wlan_set_tx_buf_space_base(npu, ifindex, addr);
+}
+
+static inline int airoha_npu_wlan_set_rx_ring_for_txdone(struct airoha_npu *npu,
+							 int ifindex, u32 addr)
+{
+	return npu->ops.wlan_set_rx_ring_for_txdone(npu, ifindex, addr);
+}
+
+static inline u32 airoha_npu_wlan_get_queue_addr(struct airoha_npu *npu, int qid,
+						 bool xmit)
+{
+	return npu->ops.wlan_get_queue_addr(npu, qid, xmit);
+}
+
+static inline void airoha_npu_wlan_set_irq_status(struct airoha_npu *npu,
+						  u32 val)
+{
+	npu->ops.wlan_set_irq_status(npu, val);
+}
+
+static inline u32 airoha_npu_wlan_get_irq_status(struct airoha_npu *npu, int q)
+{
+	return npu->ops.wlan_get_irq_status(npu, q);
+}
+
+static inline void airoha_npu_wlan_enable_irq(struct airoha_npu *npu, int q)
+{
+	npu->ops.wlan_enable_irq(npu, q);
+}
+
+static inline void airoha_npu_wlan_disable_irq(struct airoha_npu *npu, int q)
+{
+	npu->ops.wlan_disable_irq(npu, q);
+}
+#else
+static inline struct airoha_npu *airoha_npu_get(struct device *dev,
+						dma_addr_t *foe_stats_addr)
+{
+	return NULL;
+}
+
+static inline void airoha_npu_put(struct airoha_npu *npu)
+{
+}
+
+static inline int airoha_npu_wlan_init_reserved_memory(struct airoha_npu *npu)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_txrx_reg_addr(struct airoha_npu *npu,
+						    int ifindex, u32 dir,
+						    u32 in_counter_addr,
+						    u32 out_status_addr,
+						    u32 out_counter_addr)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_pcie_port_type(struct airoha_npu *npu,
+						     int ifindex, u32 port_type)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_pcie_addr(struct airoha_npu *npu,
+						int ifindex, u32 addr)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_desc(struct airoha_npu *npu, int ifindex,
+					   u32 desc)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_tx_ring_pcie_addr(struct airoha_npu *npu,
+							int ifindex, u32 addr)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_get_rx_desc_base(struct airoha_npu *npu,
+						   int ifindex, u32 *data)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_tx_buf_space_base(struct airoha_npu *npu,
+							int ifindex, u32 addr)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_set_rx_ring_for_txdone(struct airoha_npu *npu,
+							 int ifindex, u32 addr)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline u32 airoha_npu_wlan_get_queue_addr(struct airoha_npu *npu,
+						 int qid, bool xmit)
+{
+	return 0;
+}
+
+static inline void airoha_npu_wlan_set_irq_status(struct airoha_npu *npu,
+						  u32 val)
+{
+}
+
+static inline u32 airoha_npu_wlan_get_irq_status(struct airoha_npu *npu,
+						 int q)
+{
+	return 0;
+}
+
+static inline void airoha_npu_wlan_enable_irq(struct airoha_npu *npu, int q)
+{
+}
+
+static inline void airoha_npu_wlan_disable_irq(struct airoha_npu *npu, int q)
+{
+}
+#endif
+
+#endif /* AIROHA_OFFLOAD_H */

-- 
2.50.0


