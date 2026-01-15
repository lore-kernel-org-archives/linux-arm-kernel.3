Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DAFD41150
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnP0hT2Z5RP3xhE6GAdLcYXmmNe+5Ux9QW0yJehPfk4=; b=ygBrg+G23Ac1NyM8bFepCY9i+K
	Y9PUR2M6h7+aZmeTT2kU+XufywCRGCP/8hNFsZKqpQ8pPPgSJOSeDQlCMb3VNANbmGAXwZjUl3WL1
	IeU4rGxjBF2pSo/xilbuh+gSM1DHH35pEmFsH4jwSzQvd0SMUmffBzbO9NbNNpDrnlS28izcNOL7J
	Y3KkRp10io9UD+Dfu33ZtZpI+B3yyFhGMXdEFOFFRhjSVuFsPc9G3hAp2Dd8rUeJueqYYP1CHuWTb
	CwWuoKVWp542qx36rRT0kqKOJ+A/BlQLTYc5N+XyFnkBv4D9KQ4zYAIc8d7j/jT5Dg4thU2c339/6
	I5rsoDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK0h-0000000C6CK-0sSV;
	Thu, 15 Jan 2026 09:51:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgK0e-0000000C6BS-3ltC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 09:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 915DF436F5;
	Thu, 15 Jan 2026 09:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3470FC16AAE;
	Thu, 15 Jan 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768470680;
	bh=HpqC5xx2JciOccRQs/mA4K61HFjvK3cJ4krLdRlhU9Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QAm8REZzpgJ6ozjkDjZvG74LFL6foGHUYhUPiID8BHk89ghMnX1FHRs/dptQuDsMR
	 ubn9o0aUETiUpCFZOqE8repG7S45r8PTGGNrgCYfkm/aiC4GnMZtbgvcipQd65Zefa
	 uHhlTOMBuQuvYyMVoqv7VXHhFvQu9+KbISTX89OizFUuofTWZf2b89pQHao0d0tgnl
	 sP1eTxrhMT5jxULYR+kMUoZ/I6CaVPjUORR/R4HhKheAaWteZhJAYhWj6YfG8xyCVc
	 jxmkcvGaJyM2Jyi+KMOiZarzNgz9HUFanWNiEg/xGEGrcfeaoa0yfUlPF+hkhow4Au
	 Rm5g+JcB2lbuQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 15 Jan 2026 10:50:49 +0100
Subject: [PATCH v3 3/6] irqchip/gic-v5: Split IRS probing into OF and
 generic portions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-gicv5-host-acpi-v3-3-c13a9a150388@kernel.org>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
In-Reply-To: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_015121_003971_521E3BE7 
X-CRM114-Status: GOOD (  16.65  )
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

Split the IRS driver code into OF specific and generic portions in order
to pave the way for adding ACPI firmware bindings support.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c | 112 +++++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 52 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index ce2732d649a3..7db44a91f043 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -545,15 +545,13 @@ int gicv5_irs_register_cpu(int cpuid)
 
 static void __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
 					void __iomem *irs_base,
-					struct fwnode_handle *handle)
+					bool noncoherent)
 {
-	struct device_node *np = to_of_node(handle);
 	u32 cr0, cr1;
 
-	irs_data->fwnode = handle;
 	irs_data->irs_base = irs_base;
 
-	if (of_property_read_bool(np, "dma-noncoherent")) {
+	if (noncoherent) {
 		/*
 		 * A non-coherent IRS implies that some cache levels cannot be
 		 * used coherently by the cores and GIC. Our only option is to mark
@@ -678,49 +676,13 @@ static void irs_setup_pri_bits(u32 idr1)
 	}
 }
 
-static int __init gicv5_irs_init(struct device_node *node)
+static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
 {
-	struct gicv5_irs_chip_data *irs_data;
-	void __iomem *irs_base;
-	u32 idr, spi_count;
-	u8 iaffid_bits;
-	int ret;
+	u32 spi_count, idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR2);
 
-	irs_data = kzalloc(sizeof(*irs_data), GFP_KERNEL);
-	if (!irs_data)
-		return -ENOMEM;
-
-	raw_spin_lock_init(&irs_data->spi_config_lock);
-
-	ret = of_property_match_string(node, "reg-names", "ns-config");
-	if (ret < 0) {
-		pr_err("%pOF: ns-config reg-name not present\n", node);
-		goto out_err;
-	}
-
-	irs_base = of_io_request_and_map(node, ret, of_node_full_name(node));
-	if (IS_ERR(irs_base)) {
-		pr_err("%pOF: unable to map GICv5 IRS registers\n", node);
-		ret = PTR_ERR(irs_base);
-		goto out_err;
-	}
-
-	gicv5_irs_init_bases(irs_data, irs_base, &node->fwnode);
-
-	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
-	iaffid_bits = FIELD_GET(GICV5_IRS_IDR1_IAFFID_BITS, idr) + 1;
-
-	ret = gicv5_irs_of_init_affinity(node, irs_data, iaffid_bits);
-	if (ret) {
-		pr_err("Failed to parse CPU IAFFIDs from the device tree!\n");
-		goto out_iomem;
-	}
-
-	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR2);
 	if (WARN(!FIELD_GET(GICV5_IRS_IDR2_LPI, idr),
 		 "LPI support not available - no IPIs, can't proceed\n")) {
-		ret = -ENODEV;
-		goto out_iomem;
+		return -ENODEV;
 	}
 
 	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR7);
@@ -729,14 +691,6 @@ static int __init gicv5_irs_init(struct device_node *node)
 	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR6);
 	irs_data->spi_range = FIELD_GET(GICV5_IRS_IDR6_SPI_IRS_RANGE, idr);
 
-	if (irs_data->spi_range) {
-		pr_info("%s detected SPI range [%u-%u]\n",
-						of_node_full_name(node),
-						irs_data->spi_min,
-						irs_data->spi_min +
-						irs_data->spi_range - 1);
-	}
-
 	/*
 	 * Do the global setting only on the first IRS.
 	 * Global properties (iaffid_bits, global spi count) are guaranteed to
@@ -760,6 +714,60 @@ static int __init gicv5_irs_init(struct device_node *node)
 	list_add_tail(&irs_data->entry, &irs_nodes);
 
 	return 0;
+}
+
+static int __init gicv5_irs_of_init(struct device_node *node)
+{
+	struct gicv5_irs_chip_data *irs_data;
+	void __iomem *irs_base;
+	u8 iaffid_bits;
+	u32 idr;
+	int ret;
+
+	irs_data = kzalloc(sizeof(*irs_data), GFP_KERNEL);
+	if (!irs_data)
+		return -ENOMEM;
+
+	raw_spin_lock_init(&irs_data->spi_config_lock);
+
+	ret = of_property_match_string(node, "reg-names", "ns-config");
+	if (ret < 0) {
+		pr_err("%pOF: ns-config reg-name not present\n", node);
+		goto out_err;
+	}
+
+	irs_base = of_io_request_and_map(node, ret, of_node_full_name(node));
+	if (IS_ERR(irs_base)) {
+		pr_err("%pOF: unable to map GICv5 IRS registers\n", node);
+		ret = PTR_ERR(irs_base);
+		goto out_err;
+	}
+
+	irs_data->fwnode = of_fwnode_handle(node);
+	gicv5_irs_init_bases(irs_data, irs_base, of_property_read_bool(node, "dma-noncoherent"));
+
+	idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
+	iaffid_bits = FIELD_GET(GICV5_IRS_IDR1_IAFFID_BITS, idr) + 1;
+
+	ret = gicv5_irs_of_init_affinity(node, irs_data, iaffid_bits);
+	if (ret) {
+		pr_err("Failed to parse CPU IAFFIDs from the device tree!\n");
+		goto out_iomem;
+	}
+
+	ret = gicv5_irs_init(irs_data);
+	if (ret)
+		goto out_iomem;
+
+	if (irs_data->spi_range) {
+		pr_info("%s detected SPI range [%u-%u]\n",
+						of_node_full_name(node),
+						irs_data->spi_min,
+						irs_data->spi_min +
+						irs_data->spi_range - 1);
+	}
+
+	return ret;
 
 out_iomem:
 	iounmap(irs_base);
@@ -818,7 +826,7 @@ int __init gicv5_irs_of_probe(struct device_node *parent)
 		if (!of_device_is_compatible(np, "arm,gic-v5-irs"))
 			continue;
 
-		ret = gicv5_irs_init(np);
+		ret = gicv5_irs_of_init(np);
 		if (ret)
 			pr_err("Failed to init IRS %s\n", np->full_name);
 	}

-- 
2.50.1


