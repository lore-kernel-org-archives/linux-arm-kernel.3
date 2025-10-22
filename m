Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C92CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJJsDsF51IYvKolPCNt+aag64yOfgRB0/rcNJyvd0YY=; b=aIg/WoH/lNUAIp9PZSKuv2kfjY
	D/NXUoYZeZII/IZDOltnhE1E9rjjFJlbFWHn7644O6CL4oBZ+kvnq+2970/ps/1TWc2zUo+mTtCcB
	NHfql/1J+oiOAOIjDF8ZDDJumXSG58cGPoXla96CHXJHvuBMgNANdi3ds2VKxeLYNZ+oTL3riFUzH
	Mh25VJ58Rn/tP68PCEjuNEtC3CnrtDb634Iy4q0ZzLl4JNwNcEZkpXWttb3MU1Xb2gtTyIkooK8gR
	POuj6lRNFdToOaAyY/aze1Imi43ck5Sc1MN6e2SyhIHX3goCuWuon/kuPTgAzLsImTDwpyZaDmjQK
	wjmDH88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSkp-00000001jvA-0U5c;
	Wed, 22 Oct 2025 06:55:27 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBSkk-00000001jrA-3EyG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:55:23 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 22 Oct
 2025 14:55:08 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 22 Oct 2025 14:55:08 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	<jk@codeconstruct.com.au>, Kevin Chen <kevin_chen@aspeedtech.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v5 2/3] Irqchip/ast2700-intc: add debugfs support for routing/protection display
Date: Wed, 22 Oct 2025 14:55:06 +0800
Message-ID: <20251022065507.1152071-3-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_235522_820360_AC5BD250 
X-CRM114-Status: GOOD (  20.12  )
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

AST2700 INTC0/INTC1 nodes ("aspeed,ast2700-intc0/1") not only
include the interrupt controller child node ("aspeed,ast2700-intc-ic"),
but also provide interrupt routing and register protection features.
Adds debugfs entries for interrupt routing and protection status for
AST2700 INTC0/INTC1.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/irqchip/Kconfig            |   6 +
 drivers/irqchip/Makefile           |   1 +
 drivers/irqchip/irq-ast2700-intc.c | 174 +++++++++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 drivers/irqchip/irq-ast2700-intc.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index a61c6dc63c29..75922d5c4da6 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -111,6 +111,12 @@ config AL_FIC
 	help
 	  Support Amazon's Annapurna Labs Fabric Interrupt Controller.
 
+config AST2700_INTC
+	tristate "AST2700 Interrupt Controller"
+	depends on ARCH_ASPEED
+	help
+	  Support AST2700 Interrupt Controller.
+
 config ATMEL_AIC_IRQ
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 3de083f5484c..055724a9e536 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_LS_EXTIRQ)			+= irq-ls-extirq.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-intc.o
+obj-$(CONFIG_AST2700_INTC)		+= irq-ast2700-intc.o
 obj-$(CONFIG_STM32MP_EXTI)		+= irq-stm32mp-exti.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
diff --git a/drivers/irqchip/irq-ast2700-intc.c b/drivers/irqchip/irq-ast2700-intc.c
new file mode 100644
index 000000000000..7c7241539fe5
--- /dev/null
+++ b/drivers/irqchip/irq-ast2700-intc.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AST2700 Interrupt Controller
+ */
+
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+
+/* INTC0 register layout */
+#define INTC0_PROT_OFFS           0x40
+#define INTC0_ROUTING_SEL0_BASE   0x200
+#define INTC0_ROUTING_GAP         0x100
+#define INTC0_GROUPS              4
+
+/* INTC1 register layout */
+#define INTC1_PROT_OFFS           0x00
+#define INTC1_ROUTING_SEL0_BASE   0x80
+#define INTC1_ROUTING_GAP         0x20
+#define INTC1_GROUPS              6
+
+struct aspeed_intc_data {
+	const char                  *name;
+	u32                          prot_offs;
+	u32                          rout_sel0_base;
+	u32                          rout_gap;
+	unsigned int                 groups;
+};
+
+static const struct aspeed_intc_data aspeed_intc0_data = {
+	.name            = "INTC0",
+	.prot_offs       = INTC0_PROT_OFFS,
+	.rout_sel0_base  = INTC0_ROUTING_SEL0_BASE,
+	.rout_gap        = INTC0_ROUTING_GAP,
+	.groups          = INTC0_GROUPS,
+};
+
+static const struct aspeed_intc_data aspeed_intc1_data = {
+	.name            = "INTC1",
+	.prot_offs       = INTC1_PROT_OFFS,
+	.rout_sel0_base  = INTC1_ROUTING_SEL0_BASE,
+	.rout_gap        = INTC1_ROUTING_GAP,
+	.groups          = INTC1_GROUPS,
+};
+
+struct aspeed_intc {
+	void __iomem                    *base;
+	const struct aspeed_intc_data   *data;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry                   *dbg_root;
+#endif
+};
+
+#ifdef CONFIG_DEBUG_FS
+static int aspeed_intc_regs_show(struct seq_file *s, void *unused)
+{
+	struct aspeed_intc *intc = s->private;
+	const struct aspeed_intc_data *d = intc->data;
+	void __iomem *base = intc->base;
+	unsigned int i;
+
+	for (i = 0; i < d->groups; i++) {
+		void __iomem *b = base + d->rout_sel0_base + i * 4;
+		u32 r0 = readl(b);
+		u32 r1 = readl(b + d->rout_gap);
+		u32 r2 = readl(b + 2 * d->rout_gap);
+
+		seq_printf(s, "ROUTE[%u]: 0x%08x 0x%08x 0x%08x\n", i, r0, r1, r2);
+	}
+	return 0;
+}
+
+static int aspeed_intc_regs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, aspeed_intc_regs_show, inode->i_private);
+}
+
+static const struct file_operations aspeed_intc_regs_fops = {
+	.owner    = THIS_MODULE,
+	.open     = aspeed_intc_regs_open,
+	.read     = seq_read,
+	.llseek   = seq_lseek,
+	.release  = single_release,
+};
+
+static int aspeed_intc_prot_show(struct seq_file *s, void *unused)
+{
+	struct aspeed_intc *intc = s->private;
+	const struct aspeed_intc_data *d = intc->data;
+	u32 prot = readl(intc->base + d->prot_offs);
+
+	seq_printf(s, "%s_PROT: 0x%08x\n", d->name, prot);
+	return 0;
+}
+
+static int aspeed_intc_prot_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, aspeed_intc_prot_show, inode->i_private);
+}
+
+static const struct file_operations aspeed_intc_prot_fops = {
+	.owner    = THIS_MODULE,
+	.open     = aspeed_intc_prot_open,
+	.read     = seq_read,
+	.llseek   = seq_lseek,
+	.release  = single_release,
+};
+#endif /* CONFIG_DEBUG_FS */
+
+static int aspeed_intc_probe(struct platform_device *pdev)
+{
+	const struct aspeed_intc_data *data;
+	struct aspeed_intc *intc;
+	struct resource *res;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	intc = devm_kzalloc(&pdev->dev, sizeof(*intc), GFP_KERNEL);
+	if (!intc)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	intc->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(intc->base))
+		return PTR_ERR(intc->base);
+
+	intc->data = data;
+
+	platform_set_drvdata(pdev, intc);
+
+#ifdef CONFIG_DEBUG_FS
+	intc->dbg_root = debugfs_create_dir(dev_name(&pdev->dev), NULL);
+	if (intc->dbg_root) {
+		debugfs_create_file("routing", 0400, intc->dbg_root, intc,
+				    &aspeed_intc_regs_fops);
+		debugfs_create_file("protection", 0400, intc->dbg_root, intc,
+				    &aspeed_intc_prot_fops);
+	}
+#endif
+	return 0;
+}
+
+static void aspeed_intc_remove(struct platform_device *pdev)
+{
+#ifdef CONFIG_DEBUG_FS
+	struct aspeed_intc *intc = platform_get_drvdata(pdev);
+
+	if (intc && intc->dbg_root)
+		debugfs_remove_recursive(intc->dbg_root);
+#endif
+}
+
+static const struct of_device_id aspeed_intc_of_match[] = {
+	{ .compatible = "aspeed,ast2700-intc0", .data = &aspeed_intc0_data },
+	{ .compatible = "aspeed,ast2700-intc1", .data = &aspeed_intc1_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_intc_of_match);
+
+static struct platform_driver aspeed_intc_driver = {
+	.probe   = aspeed_intc_probe,
+	.remove  = aspeed_intc_remove,
+	.driver  = {
+		.name           = "aspeed-ast2700-intc",
+		.of_match_table = aspeed_intc_of_match,
+	},
+};
+module_platform_driver(aspeed_intc_driver);
-- 
2.34.1


