Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1436CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMKtT8/M7Oqq5j3+vFaJxCn79iedZwRsBfx5cv5/Oro=; b=MDgygKq013Jk1PCExLYHzB6u6b
	zK15ALlxaflEY1jSnQEQtxtre3T7HctCKIQcLvW9xKOrOrgP/3NWLSp/lDi1RQ9a8Wc8EhkJHtqYP
	mcrFCiLGtK4Gk1mGhMI7A4xyBX0UEgQq/NFHsuCtIMaZ66IGv1Q1dvMrJsvU1HnYs1bcYLN6BuAY3
	pvVyczSGFyx5qIyBdx1T1hnFNw/PjBvUlLwxvitnpp0Nk3HjGAJKFkBwh1rfZOseYzUgyOy2Kdlh1
	F4K3CSIS6E0FN44qD5ibdR7cMJzFKzLV0ihcM05J19aADqtLsFMlS/AYUVrjqSLIp+Rq979impfxR
	tPxol/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXKr-00000008nUp-3pMB;
	Mon, 11 Aug 2025 18:33:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUW7-00000008D51-2qzd;
	Mon, 11 Aug 2025 15:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1532A57303;
	Mon, 11 Aug 2025 15:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084E6C4CEED;
	Mon, 11 Aug 2025 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754926374;
	bh=Oif8hQl1Kcc9C/JgBA4+8hrlLgY5IlJjbDSx/1yJdas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jLhEbaHHFZzQruECXf8NN0BsvIRpAXtKrZ+1J6QP1faAmihQ7GScVuCl+8Ogd+ka+
	 67ll/Q6uz3C//3wP0I7Pl/6+cCWgg5hJlTj1lBTy+DAvrhb5ohi4tm/kvAVrGWyYwF
	 ja7Mtvbq+vvOZuRsL2WGItc4FavDpOGBvMSh2pcnztoRM88/EA262jpOf+rKvSv/9a
	 qao4eB+AhOAe0BsYF/db+bZOzpgt1H5lJcwul/arso7E93MwhKFpSK0d3ZX42zEBSp
	 71UsfiSMw1zKuMRillQbUAUxvEzGD8C2cobPiTZbcEGWOysUp7VylrmBuyf7YX0Psf
	 tO/AVi4htz4VA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 11 Aug 2025 17:31:42 +0200
Subject: [PATCH net-next v7 7/7] net: airoha: Add airoha_offload.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-airoha-en7581-wlan-offlaod-v7-7-58823603bb4e@kernel.org>
References: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
In-Reply-To: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083255_867768_A30E645B 
X-CRM114-Status: GOOD (  16.62  )
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
 drivers/net/ethernet/airoha/airoha_npu.h  | 103 ------------
 drivers/net/ethernet/airoha/airoha_ppe.c  |   2 +-
 include/linux/soc/airoha/airoha_offload.h | 260 ++++++++++++++++++++++++++++++
 4 files changed, 262 insertions(+), 105 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 66a8a992dbf2abc9626610b1d445eb9d3d0a5e8c..1a6b191ae0b0bba2dc0a011b9da4eb5f4686783e 100644
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
index a448c74208a9e99116009606e039134aa0aae251..0000000000000000000000000000000000000000
--- a/drivers/net/ethernet/airoha/airoha_npu.h
+++ /dev/null
@@ -1,103 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2025 AIROHA Inc
- * Author: Lorenzo Bianconi <lorenzo@kernel.org>
- */
-
-#define NPU_NUM_CORES		8
-#define NPU_NUM_IRQ		6
-
-enum airoha_npu_wlan_set_cmd {
-	WLAN_FUNC_SET_WAIT_PCIE_ADDR,
-	WLAN_FUNC_SET_WAIT_DESC,
-	WLAN_FUNC_SET_WAIT_NPU_INIT_DONE,
-	WLAN_FUNC_SET_WAIT_TRAN_TO_CPU,
-	WLAN_FUNC_SET_WAIT_BA_WIN_SIZE,
-	WLAN_FUNC_SET_WAIT_DRIVER_MODEL,
-	WLAN_FUNC_SET_WAIT_DEL_STA,
-	WLAN_FUNC_SET_WAIT_DRAM_BA_NODE_ADDR,
-	WLAN_FUNC_SET_WAIT_PKT_BUF_ADDR,
-	WLAN_FUNC_SET_WAIT_IS_TEST_NOBA,
-	WLAN_FUNC_SET_WAIT_FLUSHONE_TIMEOUT,
-	WLAN_FUNC_SET_WAIT_FLUSHALL_TIMEOUT,
-	WLAN_FUNC_SET_WAIT_IS_FORCE_TO_CPU,
-	WLAN_FUNC_SET_WAIT_PCIE_STATE,
-	WLAN_FUNC_SET_WAIT_PCIE_PORT_TYPE,
-	WLAN_FUNC_SET_WAIT_ERROR_RETRY_TIMES,
-	WLAN_FUNC_SET_WAIT_BAR_INFO,
-	WLAN_FUNC_SET_WAIT_FAST_FLAG,
-	WLAN_FUNC_SET_WAIT_NPU_BAND0_ONCPU,
-	WLAN_FUNC_SET_WAIT_TX_RING_PCIE_ADDR,
-	WLAN_FUNC_SET_WAIT_TX_DESC_HW_BASE,
-	WLAN_FUNC_SET_WAIT_TX_BUF_SPACE_HW_BASE,
-	WLAN_FUNC_SET_WAIT_RX_RING_FOR_TXDONE_HW_BASE,
-	WLAN_FUNC_SET_WAIT_TX_PKT_BUF_ADDR,
-	WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
-	WLAN_FUNC_SET_WAIT_INODE_DEBUG_FLAG,
-	WLAN_FUNC_SET_WAIT_INODE_HW_CFG_INFO,
-	WLAN_FUNC_SET_WAIT_INODE_STOP_ACTION,
-	WLAN_FUNC_SET_WAIT_INODE_PCIE_SWAP,
-	WLAN_FUNC_SET_WAIT_RATELIMIT_CTRL,
-	WLAN_FUNC_SET_WAIT_HWNAT_INIT,
-	WLAN_FUNC_SET_WAIT_ARHT_CHIP_INFO,
-	WLAN_FUNC_SET_WAIT_TX_BUF_CHECK_ADDR,
-	WLAN_FUNC_SET_WAIT_TOKEN_ID_SIZE,
-};
-
-enum airoha_npu_wlan_get_cmd {
-	WLAN_FUNC_GET_WAIT_NPU_INFO,
-	WLAN_FUNC_GET_WAIT_LAST_RATE,
-	WLAN_FUNC_GET_WAIT_COUNTER,
-	WLAN_FUNC_GET_WAIT_DBG_COUNTER,
-	WLAN_FUNC_GET_WAIT_RXDESC_BASE,
-	WLAN_FUNC_GET_WAIT_WCID_DBG_COUNTER,
-	WLAN_FUNC_GET_WAIT_DMA_ADDR,
-	WLAN_FUNC_GET_WAIT_RING_SIZE,
-	WLAN_FUNC_GET_WAIT_NPU_SUPPORT_MAP,
-	WLAN_FUNC_GET_WAIT_MDC_LOCK_ADDRESS,
-	WLAN_FUNC_GET_WAIT_NPU_VERSION,
-};
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
-		int (*wlan_send_msg)(struct airoha_npu *npu, int ifindex,
-				     enum airoha_npu_wlan_set_cmd func_id,
-				     void *data, int data_len, gfp_t gfp);
-		int (*wlan_get_msg)(struct airoha_npu *npu, int ifindex,
-				    enum airoha_npu_wlan_get_cmd func_id,
-				    void *data, int data_len, gfp_t gfp);
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
index 47411d2cbd2803c0a448243fb3e92b32d9179bd8..82163392332c92d3bf50a976ffd473ae7a31a344 100644
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
index 0000000000000000000000000000000000000000..117c63c2448d2bd2a5c108c5baa56a39f6974d91
--- /dev/null
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -0,0 +1,260 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 AIROHA Inc
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+#ifndef AIROHA_OFFLOAD_H
+#define AIROHA_OFFLOAD_H
+
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
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
+	WLAN_FUNC_SET_WAIT_TOKEN_ID_SIZE,
+};
+
+enum airoha_npu_wlan_get_cmd {
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
+	WLAN_FUNC_GET_WAIT_NPU_VERSION,
+};
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
+		int (*wlan_send_msg)(struct airoha_npu *npu, int ifindex,
+				     enum airoha_npu_wlan_set_cmd func_id,
+				     void *data, int data_len, gfp_t gfp);
+		int (*wlan_get_msg)(struct airoha_npu *npu, int ifindex,
+				    enum airoha_npu_wlan_get_cmd func_id,
+				    void *data, int data_len, gfp_t gfp);
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
+static inline int airoha_npu_wlan_send_msg(struct airoha_npu *npu,
+					   int ifindex,
+					   enum airoha_npu_wlan_set_cmd cmd,
+					   void *data, int data_len, gfp_t gfp)
+{
+	return npu->ops.wlan_send_msg(npu, ifindex, cmd, data, data_len, gfp);
+}
+
+static inline int airoha_npu_wlan_get_msg(struct airoha_npu *npu, int ifindex,
+					  enum airoha_npu_wlan_get_cmd cmd,
+					  void *data, int data_len, gfp_t gfp)
+{
+	return npu->ops.wlan_get_msg(npu, ifindex, cmd, data, data_len, gfp);
+}
+
+static inline u32 airoha_npu_wlan_get_queue_addr(struct airoha_npu *npu,
+						 int qid, bool xmit)
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
+static inline int airoha_npu_wlan_send_msg(struct airoha_npu *npu,
+					   int ifindex,
+					   enum airoha_npu_wlan_set_cmd cmd,
+					   void *data, int data_len, gfp_t gfp)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int airoha_npu_wlan_get_msg(struct airoha_npu *npu, int ifindex,
+					  enum airoha_npu_wlan_get_cmd cmd,
+					  void *data, int data_len, gfp_t gfp)
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
2.50.1


