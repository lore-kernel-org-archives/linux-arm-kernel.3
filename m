Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F0C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsyrQTZY+NVH5nil6RuG7SvmccuQbuMeBRKoaahJSPk=; b=2guZHuXCQuwYqlzAyW1zOB1UW5
	R8x6Kj964sCfMi7Zz2j0RcGpndHlteLwFGDJHatSFagoAEHJS7350XW4GLlWz1xNWOn7EjJJhlpAx
	XbzNh7XmNDnTdLwkSzImUWnsKjio0zeKtb/4MyxfzrP7JuCi2Bl9LAgVSTylKtFAiN7WO6lDsJoL3
	U68b17fRxNHSGQyltkE/ltnPeZH0k3ykSLqGJnbB2Yl3QrcaGNUYNTPIGHiD2gK9o6kks2aW5aEPa
	hDXBYi2hcQzm6Oghqxcbmep2+uN0mv/AGdCjovW6eIf58PLTP1bvpzZJAK6LamVrDH8vhOxy5ipnm
	rpp+roiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ixw-00000005Fsj-03yD;
	Mon, 28 Apr 2025 07:31:48 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ins-00000005E7S-1jlc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 07:21:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53S7LK8q2714007
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 02:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745824881;
	bh=JsyrQTZY+NVH5nil6RuG7SvmccuQbuMeBRKoaahJSPk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fzAUs6RdtB25icZdW+8rVWmiNJGsRC+dzNX27ABqyRKjmiF5iQ8dcSkPp4lO9Aio2
	 XpxqMD4RhiuNs1FlcJipWzrP7u9beTzlIT0CFtQ630OCEDLGp5bneY1diVgJwfmN0o
	 1DyT2ClM9WpaE3CThV6np5EXpA3RcnV5zCO+eJew=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53S7LKEF016562
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 02:21:20 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 02:21:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 02:21:20 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.227.7])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53S7KdMe068873;
	Mon, 28 Apr 2025 02:21:16 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <praneeth@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <a-chavda@ti.com>
Subject: [PATCH 5/8] drivers: soc: ti: k3-ringacc: handle absence of tisci
Date: Mon, 28 Apr 2025 12:50:29 +0530
Message-ID: <20250428072032.946008-6-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428072032.946008-1-s-adivi@ti.com>
References: <20250428072032.946008-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_002124_545053_3964D38D 
X-CRM114-Status: GOOD (  17.00  )
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

Handle absence of tisci with direct register writes. This will support
platforms that do not have tisci firmware like AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/soc/ti/k3-ringacc.c       | 162 +++++++++++++++++++++++++-----
 include/linux/soc/ti/k3-ringacc.h |   4 +
 2 files changed, 142 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/ti/k3-ringacc.c b/drivers/soc/ti/k3-ringacc.c
index 82a15cad1c6c4..49e0483676a14 100644
--- a/drivers/soc/ti/k3-ringacc.c
+++ b/drivers/soc/ti/k3-ringacc.c
@@ -45,6 +45,38 @@ struct k3_ring_rt_regs {
 	u32	hwindx;
 };
 
+#define K3_RINGACC_RT_CFG_REGS_OFS	0x40
+#define K3_DMARING_CFG_ADDR_HI_MASK	GENMASK(3, 0)
+#define K3_DMARING_CFG_ASEL_SHIFT	16
+#define K3_DMARING_CFG_SIZE_MASK	GENMASK(15, 0)
+
+/**
+ * struct k3_ring_cfg_regs - The RA Configuration Registers region
+ *
+ * @ba_lo: Ring Base Address Low Register
+ * @ba_hi: Ring Base Address High Register
+ * @size: Ring Size Register
+ */
+struct k3_ring_cfg_regs {
+	u32	ba_lo;
+	u32	ba_hi;
+	u32	size;
+};
+
+#define K3_RINGACC_RT_INT_REGS_OFS		0x140
+#define K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE	BIT(0)
+#define K3_RINGACC_RT_INT_ENABLE_SET_TR			BIT(2)
+
+struct k3_ring_intr_regs {
+	u32	enable_set;
+	u32	resv_4;
+	u32	clr;
+	u32	resv_16;
+	u32	status_set;
+	u32	resv_8;
+	u32	status;
+};
+
 #define K3_RINGACC_RT_REGS_STEP			0x1000
 #define K3_DMARING_RT_REGS_STEP			0x2000
 #define K3_DMARING_RT_REGS_REVERSE_OFS		0x1000
@@ -157,6 +189,8 @@ struct k3_ring_state {
  */
 struct k3_ring {
 	struct k3_ring_rt_regs __iomem *rt;
+	struct k3_ring_cfg_regs __iomem *cfg;
+	struct k3_ring_intr_regs __iomem *intr;
 	struct k3_ring_fifo_regs __iomem *fifos;
 	struct k3_ringacc_proxy_target_regs  __iomem *proxy;
 	dma_addr_t	ring_mem_dma;
@@ -465,16 +499,30 @@ static void k3_ringacc_ring_reset_sci(struct k3_ring *ring)
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
+	u32 reg;
 
-	ring_cfg.nav_id = ringacc->tisci_dev_id;
-	ring_cfg.index = ring->ring_id;
-	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
-	ring_cfg.count = ring->size;
+	if (!ringacc->tisci) {
+		if (ring->cfg == NULL)
+			return;
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+		writel(reg, &ring->cfg->size);
+		wmb();
+		reg |= ring->size;
+
+		writel(reg, &ring->cfg->size);
+	} else {
+		ring_cfg.nav_id = ringacc->tisci_dev_id;
+		ring_cfg.index = ring->ring_id;
+		ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_COUNT_VALID;
+		ring_cfg.count = ring->size;
+
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reset ring fail (%d) ring_idx %d\n",
+				ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset(struct k3_ring *ring)
@@ -494,16 +542,30 @@ static void k3_ringacc_ring_reconfig_qmode_sci(struct k3_ring *ring,
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
+	u32 reg;
 
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_RING_MODE_VALID;
 	ring_cfg.mode = mode;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI reconf qmode fail (%d) ring_idx %d\n",
+					ret, ring->ring_id);
+	}
 }
 
 void k3_ringacc_ring_reset_dma(struct k3_ring *ring, u32 occ)
@@ -570,15 +632,29 @@ static void k3_ringacc_ring_free_sci(struct k3_ring *ring)
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
 	int ret;
+	u32 reg;
 
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
 
-	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
-	if (ret)
-		dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
+	if (!ringacc->tisci) {
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+	} else {
+		ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
+		if (ret)
+			dev_err(ringacc->dev, "TISCI ring free fail (%d) ring_idx %d\n",
+					ret, ring->ring_id);
+	}
 }
 
 int k3_ringacc_ring_free(struct k3_ring *ring)
@@ -669,15 +745,31 @@ int k3_ringacc_get_ring_irq_num(struct k3_ring *ring)
 }
 EXPORT_SYMBOL_GPL(k3_ringacc_get_ring_irq_num);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
+
+	return readl(&ring2->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_get_irq_status);
+
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring)
+{
+	struct k3_ringacc *ringacc = ring->parent;
+	struct k3_ring *ring2 = &ringacc->rings[ring->ring_id];
+
+	writel(0xFF, &ring2->intr->status);
+}
+EXPORT_SYMBOL_GPL(k3_ringacc_ring_clear_irq);
+
 static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 {
 	struct ti_sci_msg_rm_ring_cfg ring_cfg = { 0 };
 	struct k3_ringacc *ringacc = ring->parent;
+	u32 reg;
 	int ret;
 
-	if (!ringacc->tisci)
-		return -EINVAL;
-
 	ring_cfg.nav_id = ringacc->tisci_dev_id;
 	ring_cfg.index = ring->ring_id;
 	ring_cfg.valid_params = TI_SCI_MSG_VALUE_RM_ALL_NO_ORDER;
@@ -688,11 +780,26 @@ static int k3_ringacc_ring_cfg_sci(struct k3_ring *ring)
 	ring_cfg.size = ring->elm_size;
 	ring_cfg.asel = ring->asel;
 
+	if (!ringacc->tisci) {
+		writel(ring_cfg.addr_lo, &ring->cfg->ba_lo);
+		writel((ring_cfg.addr_hi & K3_DMARING_CFG_ADDR_HI_MASK) +
+				(ring_cfg.asel << K3_DMARING_CFG_ASEL_SHIFT),
+				&ring->cfg->ba_hi);
+
+		reg = readl(&ring->cfg->size);
+		reg &= ~K3_DMARING_CFG_SIZE_MASK;
+		reg |= ring_cfg.count & K3_DMARING_CFG_SIZE_MASK;
+
+		writel(reg, &ring->cfg->size);
+		writel(K3_RINGACC_RT_INT_ENABLE_SET_COMPLETE | K3_RINGACC_RT_INT_ENABLE_SET_TR,
+				&ring->intr->enable_set);
+		return 0;
+	}
+
 	ret = ringacc->tisci_ring_ops->set_cfg(ringacc->tisci, &ring_cfg);
 	if (ret)
 		dev_err(ringacc->dev, "TISCI config ring fail (%d) ring_idx %d\n",
-			ret, ring->ring_id);
-
+				ret, ring->ring_id);
 	return ret;
 }
 
@@ -1480,9 +1587,12 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 
 	mutex_init(&ringacc->req_lock);
 
-	base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
-	if (IS_ERR(base_rt))
-		return ERR_CAST(base_rt);
+	base_rt = data->base_rt;
+	if (!base_rt) {
+		base_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(base_rt))
+			return ERR_CAST(base_rt);
+	}
 
 	ringacc->rings = devm_kzalloc(dev,
 				      sizeof(*ringacc->rings) *
@@ -1498,6 +1608,10 @@ struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
 		struct k3_ring *ring = &ringacc->rings[i];
 
 		ring->rt = base_rt + K3_DMARING_RT_REGS_STEP * i;
+		ring->cfg = base_rt + K3_RINGACC_RT_CFG_REGS_OFS +
+			    K3_DMARING_RT_REGS_STEP * i;
+		ring->intr = base_rt + K3_RINGACC_RT_INT_REGS_OFS +
+			     K3_DMARING_RT_REGS_STEP * i;
 		ring->parent = ringacc;
 		ring->ring_id = i;
 		ring->proxy_id = K3_RINGACC_PROXY_NOT_USED;
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 39b022b925986..fcf6fbd4a8594 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -158,6 +158,9 @@ u32 k3_ringacc_get_ring_id(struct k3_ring *ring);
  */
 int k3_ringacc_get_ring_irq_num(struct k3_ring *ring);
 
+u32 k3_ringacc_ring_get_irq_status(struct k3_ring *ring);
+void k3_ringacc_ring_clear_irq(struct k3_ring *ring);
+
 /**
  * k3_ringacc_ring_cfg - ring configure
  * @ring: pointer on ring
@@ -262,6 +265,7 @@ struct k3_ringacc_init_data {
 	const struct ti_sci_handle *tisci;
 	u32 tisci_dev_id;
 	u32 num_rings;
+	void __iomem *base_rt;
 };
 
 struct k3_ringacc *k3_ringacc_dmarings_init(struct platform_device *pdev,
-- 
2.34.1


