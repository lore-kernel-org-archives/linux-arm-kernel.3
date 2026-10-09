Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98124CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUH3wUuUnWN37/1HbBBLhfJspdC8p6M/xpzOVZgY2zw=; b=G7G2xICancd7KZdQD5jlvEdGgO
	9k68VOuPozSvDIYpE6VYrN31Q3yrCpdK1HPXXwkSFkq0zMKXNTakL6AV6X9R3+PMSAXwlLY3zAuqI
	kdnyD63khkw5HpnAM87KiMfN452+vX9swCXGLXyg3P6sAYmmU/G9/5cC9jIue51/v8HN+D/eGo7dm
	ik49ODJNQyUnNNOuKEiggHFlbsBF4VynPO3jXOGnlpwtC2zm8bzjHFhOg2evgz22HTBcfqKTbLzFC
	FB4lQ355iFNoaYkIt/l98hCwaBmhJ2CoccZHtksnMjpurNoJnGM440uexv1uslcHNvaIzQq5nd6Vl
	BcLGqTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF31M-00000005Wi6-37ZC;
	Fri, 09 Oct 2026 05:19:52 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF31K-00000005We8-0qrM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 05:19:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNZia2kTJMivpKegEdVpDdug+5NZHAEceCV7Wznmt2Eqj7UMVaAQC8YG6th5i0G/g2E/dgdqWI9CKDwd1/sCG7Imx1xsbaFifW8jhp5ILOXYQIwQc9I5gEaKO8XZgpOrOktr0VjypHyIZOmEwAtnD0AHOjodAzweFI36pCl98Tm9ECgkysyfC9RyxN8vz94ab7zRJbYT/kQqKlO8vi9xG9xasTnl8wxCphNxHF6dTgjHNm2RWcAmAB50MnOHXePqAyGMl/BgyZe2k+zLzqvnZHXnRMByuGlgowm/zx1Gqb9xoTO5ytSJWSgmZ2EM9mYIvMy5GhNSNkcvRuNQo3VGag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUH3wUuUnWN37/1HbBBLhfJspdC8p6M/xpzOVZgY2zw=;
 b=ulOb+B93gza5j9XruILbRfVn3DliXCv5vJdGMnKmSgvn4cwhWXI89CyKNNXyYYfwQ++rULBZ3plkgQpjhzaG1SUBctKloPhZvtVQtL4VxrPCm0w88/M1YjqzcmgMtt7cTOmzTJbwnB+B4KooRdqUTf2go+2FsoPmU7H7NAT85AZumTh3v35txesxC17/unJBkSqq4FKK63yN0+omIcrNVgpdPNFisCHcEdbdg7Artf5FEY/PCKiCUuGV32vk/QUwLwqBrrODWypk51AqnPeuxyJkY1UrHY2yeeR+EBh1ylNIWmChPAX48B0aJdIE44LmTvzZcmUN8bskojn/4rreXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0185.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::10) by TY0PR06MB6837.apcprd06.prod.outlook.com
 (2603:1096:405:12::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 05:19:22 +0000
Received: from SG2PEPF000B66CE.apcprd03.prod.outlook.com
 (2603:1096:990:75:cafe::24) by JH0PR01CA0185.outlook.office365.com
 (2603:1096:990:75::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri, 9
 Oct 2026 05:19:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CE.mail.protection.outlook.com (10.167.240.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EE42943B1085;
	Fri,  9 Oct 2026 13:18:48 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v2 5/6] dmaengine: arm-dma350: Add CIX Sky1 integration support
Date: Fri,  9 Oct 2026 13:18:45 +0800
Message-ID: <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CE:EE_|TY0PR06MB6837:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 78bd41b8-5eac-4c3b-7b30-08df25c4e0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|6133799003|22082099003|10067099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: mjS47XMlbm5ZYtKdGMO+znlSRnGfXlkuaBBs0f7tcrdmGhG6/sq/7xI9f25mShj/8AQ4DltORgmOvGSA9CGN1nXOPCCcwWCd9hw6jF2aOZzTtod5D9fsDS6qmE70zgchzOt8RIG00lLK8+5ufaEQr9cd6lKALxjknZL+yU/xeJcdc52XlFJLEk+l5pBqaSfFSxHI199ACGTn5qGTA6kV7/qFCkQ0kBTOvXscfzuF819G+KRsJfanAG0heRtNOdYNlEcPgpuWVh3ZBozt4bNoKqyRanrsVR4Y5gOLi+OsrFPFSoAxkuMwlkrCIwf4tsCE/ydBe91JRm4oT2TIxyryutioZTyAyPH4QQZ8wOFRvxLz52Nnw9XIvfyBmynDHh+BnZtpD7JnwdiVsCdupMFkhuVye2s3zsmVHpw5NhIFY+HHRpbCiqZGFkgwynPYMNFgG+Z9HTPdAa7r05Mdmwdq+mYezRfBsWCGC1GyyUnP7F/68TcAWqGb1bhu4vNjKA2VHquVBwPZlaVYzA/lgTse81xx5hvjp5Nly52TiddVL3FlyYtO1X37Qeee8EQAx/KubIo8d4zf5UoD6o9SWppePoQOTGicLbyTSH5WD9OKzgBZAlSASdzlL66iJCq6VMtjk8vOainSlUdgKxNYvyUsCqF3+l4jpslakA4khj1O1tFgbYfzWxp5xnIiWDWsOC5963Wv5f7wH26fGRRR4ukB5Q==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QXDjaDIAlRj3qIZnIxLTKhm+XFXyKs4xrM7H7LZw8vx6U5+v+TYowg3KxMr5AJy4q1MNj2fCAtAHA7ckUOdJ/wZsNDDFQfgHbK0TW4ypiEoWVV7nep5jjuPe7QTJziFoxSPHiaVKcp2hOajgNv+wi5SCp1AH6798ixwrM95F5Rp5FQlL5SUa1eQNKfl4zyOU0t4KGOF/AQ+T0lQPcs+81yH9kAHHeUXtsivag3bg98TfBQfd/OvlDo3A3yBIfR09VFwH/eKzZLJIxBVU04fvJnk4kITqC0fG0ieDuMoYYX5dXC6Kl65fuCe6wciK8dn1h+aZnp35RehnHNarL30mQmbaXBzbMmfj9ypPQG4WeFoPhURcQAjx3sdcDnBJZdGkOJJtzCG5iLIUjBVkbUO+UEG75pk2XHUOEI3Xjm6jp6nyHem3fYD5UzNMLL2XPDgI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:22.5204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bd41b8-5eac-4c3b-7b30-08df25c4e0ef
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CE.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6837
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_221950_321942_F1506576 
X-CRM114-Status: GOOD (  23.57  )
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

The CIX Sky1 SoC integrates DMA-350 controllers whose DMA masters see
peripheral resources at different addresses than the CPU, and whose
channel interrupts are gated by a subsystem register block before they
reach the AP interrupt controller.

Add match data for the "cix,sky1-dma350" compatible, describing the
interrupt routing register, and use it to bring the controller up:
enable the clock, reset the controller, and route the channel
interrupts through the register block. Routing is redone after system
resume because that block may lose its state.

The address translation is described in the device tree, not in the
driver: a bus node wrapping the controller carries the dma-ranges of
the integration, the OF core builds dev->dma_range_map from them, and
the DMA API applies the translation to both buffers and resources, so
slave resources are mapped with dma_map_resource() like on any other
device. Integrations without such a bus node keep the identity mapping.

The controller may also be attached to a reserved memory region, for
integrations whose DMA master cannot reach all of system memory.

Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
v1 -> v2:
- Merged the Sky1 integration into arm-dma350.c: the SoC resources are
  managed by the DMA-350 driver itself, matched through the
  "cix,sky1-dma350" compatible.
- Slave resources are mapped with dma_map_resource() and translated by
  the standard DMA API through the dma-ranges of the parent bus node.
- Dropped drivers/dma/cix-sky1-dma350.c and its MAINTAINERS entry.
- ARM_DMA350 now selects MFD_SYSCON for the interrupt router syscon.
 drivers/dma/Kconfig      |  4 ++
 drivers/dma/arm-dma350.c | 92 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..efa6d280bb36 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -97,9 +97,13 @@ config ARM_DMA350
 	depends on ARM || ARM64 || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
+	select MFD_SYSCON
 	help
 	  Enable support for the Arm DMA-350 controller.
 
+	  Some integrations need to poke a syscon to route the channel
+	  interrupts, so MFD_SYSCON is selected here.
+
 config AT_HDMAC
 	tristate "Atmel AHB DMA support"
 	depends on ARCH_AT91 || COMPILE_TEST
diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index e3fbfcce66e8..e443a9c3189b 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -4,14 +4,21 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_dma.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 
@@ -158,6 +165,9 @@
 
 #define D350_SLAVE_CMD_WORDS	14
 
+#define SKY1_DMA350_CRU_DMAC_AP_IRQ	0x54
+#define SKY1_DMA350_IRQ_ROUTE_MASK	0xff
+
 enum ch_ctrl_donetype {
 	CH_CTRL_DONETYPE_NONE = 0,
 	CH_CTRL_DONETYPE_CMD = 1,
@@ -222,6 +232,13 @@ struct d350_chan_map {
 	bool needs_unmap;
 };
 
+struct d350;
+
+struct d350_data {
+	u32 irq_route_reg;
+	u32 irq_route_mask;
+};
+
 struct d350_chan {
 	struct virt_dma_chan vc;
 	struct d350_desc *desc;
@@ -241,6 +258,8 @@ struct d350_chan {
 
 struct d350 {
 	struct dma_device dma;
+	const struct d350_data *data;
+	struct regmap *irq_router;
 	int nchan;
 	int nreq;
 	struct d350_chan channels[] __counted_by(nchan);
@@ -256,6 +275,16 @@ static inline struct d350_desc *to_d350_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct d350_desc, vd);
 }
 
+static int d350_route_irqs(struct d350 *dmac)
+{
+	if (!dmac->irq_router)
+		return 0;
+
+	return regmap_update_bits(dmac->irq_router, dmac->data->irq_route_reg,
+				  dmac->data->irq_route_mask,
+				  dmac->data->irq_route_mask);
+}
+
 static void d350_free_cmds(struct device *dev, struct d350_desc *desc)
 {
 	if (desc->cmds) {
@@ -1089,12 +1118,40 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 static int d350_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct d350_data *data = device_get_match_data(dev);
+	struct reset_control *reset;
+	struct regmap *irq_router = NULL;
+	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
+	reset = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to get reset\n");
+
+	if (data && data->irq_route_mask &&
+	    of_property_present(dev->of_node, "cix,irq-router")) {
+		irq_router =
+			syscon_regmap_lookup_by_phandle(dev->of_node,
+							"cix,irq-router");
+		if (IS_ERR(irq_router))
+			return dev_err_probe(dev, PTR_ERR(irq_router),
+					     "failed to get IRQ router\n");
+	}
+
+	ret = reset_control_reset(reset);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -1118,8 +1175,14 @@ static int d350_probe(struct platform_device *pdev)
 	if (!dmac)
 		return -ENOMEM;
 
+	dmac->data = data;
+	dmac->irq_router = irq_router;
 	dmac->nchan = nchan;
 
+	ret = d350_route_irqs(dmac);
+	if (ret)
+		return ret;
+
 	reg = readl_relaxed(base + DMAINFO + DMA_BUILDCFG1);
 	dmac->nreq = FIELD_GET(DMA_CFG_NUM_TRIGGER_IN, reg);
 
@@ -1201,6 +1264,13 @@ static int d350_probe(struct platform_device *pdev)
 		dmac->dma.device_prep_dma_memset = d350_prep_memset;
 	}
 
+	if (of_property_present(dev->of_node, "memory-region")) {
+		ret = of_reserved_mem_device_init(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to attach reserved memory\n");
+	}
+
 	platform_set_drvdata(pdev, dmac);
 
 	ret = dma_async_device_register(&dmac->dma);
@@ -1223,9 +1293,30 @@ static void d350_remove(struct platform_device *pdev)
 
 	of_dma_controller_free(pdev->dev.of_node);
 	dma_async_device_unregister(&dmac->dma);
+	of_reserved_mem_device_release(&pdev->dev);
+}
+
+static int __maybe_unused d350_resume_noirq(struct device *dev)
+{
+	struct d350 *dmac = dev_get_drvdata(dev);
+
+	if (!dmac)
+		return 0;
+
+	return d350_route_irqs(dmac);
 }
 
+static const struct dev_pm_ops d350_pm = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, d350_resume_noirq)
+};
+
+static const struct d350_data d350_sky1_data = {
+	.irq_route_reg = SKY1_DMA350_CRU_DMAC_AP_IRQ,
+	.irq_route_mask = SKY1_DMA350_IRQ_ROUTE_MASK,
+};
+
 static const struct of_device_id d350_of_match[] __maybe_unused = {
+	{ .compatible = "cix,sky1-dma350", .data = &d350_sky1_data },
 	{ .compatible = "arm,dma-350" },
 	{}
 };
@@ -1235,6 +1326,7 @@ static struct platform_driver d350_driver = {
 	.driver = {
 		.name = "arm-dma350",
 		.of_match_table = of_match_ptr(d350_of_match),
+		.pm = pm_sleep_ptr(&d350_pm),
 	},
 	.probe = d350_probe,
 	.remove = d350_remove,
-- 
2.54.0


