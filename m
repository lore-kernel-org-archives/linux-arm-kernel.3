Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AD1E9126F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZh6U2qhrG2V6p3VNLSrDhnu7T0cCn/g5lOj1kvvFZ0=; b=sPY+F0NhB/FTPUjFpToHBJ9jah
	gBxGlWMcrIsOuGiFIpXhFyax3q6vJRW57YaZOqWxFYeSDRYzhy3V7vKqYdv9EP0SspqJAQdFFOy3m
	1cW30fkdFs+2177MLjR9iiNfN20rq4k9cSpbc97ROwv8cL+J+G+hV1asTWz4v00f8xlmQzFfB2oWQ
	lvwLeES7ALtjD2iUpRDttqYPAjRBlAhnuYGG8m4GdHMEyQUsJi6EaLDcK8iZAN0ZmvabcUgzc+mHe
	0dmSd2F5iOK+372rResa6nwFd00My6F4mwjt901touYP8Yn+H+2BALaBplT1vG1aGN5G0r2lGBLFZ
	or0m+AEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsWt-00000009UHd-1p1d;
	Thu, 05 Feb 2026 06:07:51 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsWq-00000009U9q-1Ipc;
	Thu, 05 Feb 2026 06:07:49 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 5 Feb
 2026 14:07:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 5 Feb 2026 14:07:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Thu, 5 Feb 2026 14:07:21 +0800
Subject: [PATCH 3/4] irqchip/aspeed: Remove legacy AST2700 interrupt
 controller driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260205-irqchip-v1-3-b0310e06c087@aspeedtech.com>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
In-Reply-To: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770271649; l=5554;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=/czyJlFUz+m3+HZmKZTbaU3DI1sOmd48ORlq8dtx26A=;
 b=aJadvqQVyHVtwWconhPq6ddtSwD01LZGhovAH0kIteVf2af1Re1ccgCw1Uthb3ijsZLlSwz/9
 NHRDXaSH5MFC+wATQXcP5WsnF0d3X5f8qH93gCvuMs672x0nTSo6NcY
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_220748_356406_C3EDA5AE 
X-CRM114-Status: GOOD (  13.77  )
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

The legacy driver was designed around a PSP-centric interrupt model and
cannot describe the full routing and protection capabilities of the
AST2700 interrupt architecture.

This driver is superseded by the new AST2700 INTC0/INTC1 drivers, which
provide a unified, block-level description suitable for all integrated
processors.

There are no known upstream users of the legacy
aspeed,ast2700-intc-ic compatible.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/irqchip/Makefile          |   1 -
 drivers/irqchip/irq-aspeed-intc.c | 139 --------------------------------------
 2 files changed, 140 deletions(-)

diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 51fdf269e436..ed547e90ae89 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -90,7 +90,6 @@ obj-$(CONFIG_LS_EXTIRQ)			+= irq-ls-extirq.o
 obj-$(CONFIG_LS_SCFG_MSI)		+= irq-ls-scfg-msi.o
 obj-$(CONFIG_ASPEED_AST2700_INTC)	+= irq-ast2700.o irq-ast2700-intc0.o irq-ast2700-intc1.o
 obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-vic.o irq-aspeed-i2c-ic.o irq-aspeed-scu-ic.o
-obj-$(CONFIG_ARCH_ASPEED)		+= irq-aspeed-intc.o
 obj-$(CONFIG_STM32MP_EXTI)		+= irq-stm32mp-exti.o
 obj-$(CONFIG_STM32_EXTI) 		+= irq-stm32-exti.o
 obj-$(CONFIG_QCOM_IRQ_COMBINER)		+= qcom-irq-combiner.o
diff --git a/drivers/irqchip/irq-aspeed-intc.c b/drivers/irqchip/irq-aspeed-intc.c
deleted file mode 100644
index 8330221799a0..000000000000
--- a/drivers/irqchip/irq-aspeed-intc.c
+++ /dev/null
@@ -1,139 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Aspeed Interrupt Controller.
- *
- *  Copyright (C) 2023 ASPEED Technology Inc.
- */
-
-#include <linux/bitops.h>
-#include <linux/irq.h>
-#include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/irqdomain.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/io.h>
-#include <linux/spinlock.h>
-
-#define INTC_INT_ENABLE_REG	0x00
-#define INTC_INT_STATUS_REG	0x04
-#define INTC_IRQS_PER_WORD	32
-
-struct aspeed_intc_ic {
-	void __iomem		*base;
-	raw_spinlock_t		gic_lock;
-	raw_spinlock_t		intc_lock;
-	struct irq_domain	*irq_domain;
-};
-
-static void aspeed_intc_ic_irq_handler(struct irq_desc *desc)
-{
-	struct aspeed_intc_ic *intc_ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-
-	chained_irq_enter(chip, desc);
-
-	scoped_guard(raw_spinlock, &intc_ic->gic_lock) {
-		unsigned long bit, status;
-
-		status = readl(intc_ic->base + INTC_INT_STATUS_REG);
-		for_each_set_bit(bit, &status, INTC_IRQS_PER_WORD) {
-			generic_handle_domain_irq(intc_ic->irq_domain, bit);
-			writel(BIT(bit), intc_ic->base + INTC_INT_STATUS_REG);
-		}
-	}
-
-	chained_irq_exit(chip, desc);
-}
-
-static void aspeed_intc_irq_mask(struct irq_data *data)
-{
-	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
-	unsigned int mask = readl(intc_ic->base + INTC_INT_ENABLE_REG) & ~BIT(data->hwirq);
-
-	guard(raw_spinlock)(&intc_ic->intc_lock);
-	writel(mask, intc_ic->base + INTC_INT_ENABLE_REG);
-}
-
-static void aspeed_intc_irq_unmask(struct irq_data *data)
-{
-	struct aspeed_intc_ic *intc_ic = irq_data_get_irq_chip_data(data);
-	unsigned int unmask = readl(intc_ic->base + INTC_INT_ENABLE_REG) | BIT(data->hwirq);
-
-	guard(raw_spinlock)(&intc_ic->intc_lock);
-	writel(unmask, intc_ic->base + INTC_INT_ENABLE_REG);
-}
-
-static struct irq_chip aspeed_intc_chip = {
-	.name			= "ASPEED INTC",
-	.irq_mask		= aspeed_intc_irq_mask,
-	.irq_unmask		= aspeed_intc_irq_unmask,
-};
-
-static int aspeed_intc_ic_map_irq_domain(struct irq_domain *domain, unsigned int irq,
-					 irq_hw_number_t hwirq)
-{
-	irq_set_chip_and_handler(irq, &aspeed_intc_chip, handle_level_irq);
-	irq_set_chip_data(irq, domain->host_data);
-
-	return 0;
-}
-
-static const struct irq_domain_ops aspeed_intc_ic_irq_domain_ops = {
-	.map = aspeed_intc_ic_map_irq_domain,
-};
-
-static int __init aspeed_intc_ic_of_init(struct device_node *node,
-					 struct device_node *parent)
-{
-	struct aspeed_intc_ic *intc_ic;
-	int irq, i, ret = 0;
-
-	intc_ic = kzalloc(sizeof(*intc_ic), GFP_KERNEL);
-	if (!intc_ic)
-		return -ENOMEM;
-
-	intc_ic->base = of_iomap(node, 0);
-	if (!intc_ic->base) {
-		pr_err("Failed to iomap intc_ic base\n");
-		ret = -ENOMEM;
-		goto err_free_ic;
-	}
-	writel(0xffffffff, intc_ic->base + INTC_INT_STATUS_REG);
-	writel(0x0, intc_ic->base + INTC_INT_ENABLE_REG);
-
-	intc_ic->irq_domain = irq_domain_create_linear(of_fwnode_handle(node), INTC_IRQS_PER_WORD,
-						    &aspeed_intc_ic_irq_domain_ops, intc_ic);
-	if (!intc_ic->irq_domain) {
-		ret = -ENOMEM;
-		goto err_iounmap;
-	}
-
-	raw_spin_lock_init(&intc_ic->gic_lock);
-	raw_spin_lock_init(&intc_ic->intc_lock);
-
-	/* Check all the irq numbers valid. If not, unmaps all the base and frees the data. */
-	for (i = 0; i < of_irq_count(node); i++) {
-		irq = irq_of_parse_and_map(node, i);
-		if (!irq) {
-			pr_err("Failed to get irq number\n");
-			ret = -EINVAL;
-			goto err_iounmap;
-		}
-	}
-
-	for (i = 0; i < of_irq_count(node); i++) {
-		irq = irq_of_parse_and_map(node, i);
-		irq_set_chained_handler_and_data(irq, aspeed_intc_ic_irq_handler, intc_ic);
-	}
-
-	return 0;
-
-err_iounmap:
-	iounmap(intc_ic->base);
-err_free_ic:
-	kfree(intc_ic);
-	return ret;
-}
-
-IRQCHIP_DECLARE(ast2700_intc_ic, "aspeed,ast2700-intc-ic", aspeed_intc_ic_of_init);

-- 
2.34.1


