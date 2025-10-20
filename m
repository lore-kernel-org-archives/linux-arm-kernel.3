Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5A3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY4JzTbgRc0MDt1g9aDc4qBD5bvHZ45vaFfwXpy0QJY=; b=yWc4uOfeJmlivo1OdCS6N+zmGC
	1BG0mp7oz0ps7rwOPDbT1ylLIUHMTSDowz0ph52OLkgKCzujEeSEyLtas4JS+SYUsnfmHjIQTIB+j
	7AIle5xDJOEINxv6JOxky8q7VhMVQ6E3x6lzM4fWxgvmw2iQKK2HUpsEXkXShvDI63OOjGW4OD0zc
	wTEJyoQ4MrB4IA9KzWCm39zxZLhc67GmT4seYo0kSrBMOe/icfUZFKRf47qUUI5Mw6PqPxtXYsr12
	uwZW/UVh0V2rK7nxsYw9hGU0EkR1kA1FeO7Hsjk1Xi+I8ODbT2mky96Ffmv9m1znKU6E61kuGleOE
	/o9qjAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp4O-0000000DUoG-2EVv;
	Mon, 20 Oct 2025 12:33:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp2C-0000000DRiA-2jdA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 12:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dY4JzTbgRc0MDt1g9aDc4qBD5bvHZ45vaFfwXpy0QJY=; b=jfxidGf9sJ1wm88hGaZv+qcFfE
	PKf3SZ9zbBys/1Mp9xTyBqAV4Tkl8LYEuZVqfzh2ZzQe2Xqar5uNoKwYvDJQZeJlZf8bso0HMwK1F
	2k14BNIgSXyc7ii2i6NvQLOvEfaxeFpYiwXsWFkjcwW4Axx4+fl6d7bMubmKa3jlBzFb3irwWRJHq
	xSvw8OGJmGOOMac4DMm06/Ysvwtqg8O0UADthZGJF5tljiC2nX2jHW9XjJZwfurlzK4cY9Hlibc0p
	Dy69bKOPiPIq1fJZAf8wIOVTQ5JN/6yuLQahxcfiHgTtEO+VzfB9SCFfCBLs54rP4vb0PgHrpdUVF
	WxsnmFEg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAp27-000000074J7-2aw5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:30:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ED1848AEA;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E91C4CEF9;
	Mon, 20 Oct 2025 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760963416;
	bh=ZeZeow+O6wEhBEu/8xq11vfQ6Ea37bfghzO4swUD9Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6epOJE1p5/Og5D/W/AKsQEIGt9dJ00fUWPSB4nCqL2emAh/rjyU4B3Qj292nFWVd
	 IIwpDnyceECATdmm+1mP718XrmTobarj7I09qf1qJ89LIdXq59qqV0pNLpqr3G/jIm
	 6Gw+swWPobqdPOzr2Mig3FWDbJ32ycbSHepWTutn7AIzq+FPeAtsY5YTwnSQ8Vwjyx
	 LbBDK625kRUZh8kiUNrXEAEXYPBiZbe5YU3iOji7Ypnt74qronqEJuLxaeWo3t68Oz
	 CnmQ67KC03sl313MQMKcwyh9t0liuNGUj78bnwe2Nuz9jZFgc+j9ny2Z7Q5Ask9MaC
	 Moq+tTKgc7WPA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vAp1i-0000000FUu2-1YOc;
	Mon, 20 Oct 2025 12:30:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 23/26] irqchip: Kill irq-partition-percpu
Date: Mon, 20 Oct 2025 13:29:40 +0100
Message-ID: <20251020122944.3074811-24-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020122944.3074811-1-maz@kernel.org>
References: <20251020122944.3074811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, tglx@linutronix.de, mark.rutland@arm.com, will@kernel.org, rafael@kernel.org, robh@kernel.org, saravanak@google.com, gregkh@linuxfoundation.org, sven@kernel.org, j@jannau.net, suzuki.poulose@arm.com, james.clark@linaro.org, jonathan.cameron@huawei.com, ruanjinjie@huawei.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_133041_294443_4414A948 
X-CRM114-Status: GOOD (  19.40  )
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

This code is now completely unused, and nobody will ever miss it.

Tested-by: Will Deacon <will@kernel.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/Kconfig                      |   3 -
 drivers/irqchip/Makefile                     |   1 -
 drivers/irqchip/irq-partition-percpu.c       | 241 -------------------
 include/linux/irqchip/irq-partition-percpu.h |  53 ----
 4 files changed, 298 deletions(-)
 delete mode 100644 drivers/irqchip/irq-partition-percpu.c
 delete mode 100644 include/linux/irqchip/irq-partition-percpu.h

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 648b3618fc784..5dddb4c9442ad 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -450,9 +450,6 @@ config LS_SCFG_MSI
 	depends on PCI_MSI
 	select IRQ_MSI_LIB
 
-config PARTITION_PERCPU
-	bool
-
 config STM32MP_EXTI
 	tristate "STM32MP extended interrupts and event controller"
 	depends on (ARCH_STM32 && !ARM_SINGLE_ARMV7M) || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 3de083f5484cc..6a229443efe08 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -36,7 +36,6 @@ obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
 obj-$(CONFIG_ARM_GIC_ITS_PARENT)	+= irq-gic-its-msi-parent.o
 obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
 obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
-obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
 obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o irq-gic-v5-its.o \
 					   irq-gic-v5-iwb.o
 obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
diff --git a/drivers/irqchip/irq-partition-percpu.c b/drivers/irqchip/irq-partition-percpu.c
deleted file mode 100644
index 4441ffe149ea0..0000000000000
--- a/drivers/irqchip/irq-partition-percpu.c
+++ /dev/null
@@ -1,241 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2016 ARM Limited, All Rights Reserved.
- * Author: Marc Zyngier <marc.zyngier@arm.com>
- */
-
-#include <linux/bitops.h>
-#include <linux/interrupt.h>
-#include <linux/irqchip.h>
-#include <linux/irqchip/chained_irq.h>
-#include <linux/irqchip/irq-partition-percpu.h>
-#include <linux/irqdomain.h>
-#include <linux/seq_file.h>
-#include <linux/slab.h>
-
-struct partition_desc {
-	int				nr_parts;
-	struct partition_affinity	*parts;
-	struct irq_domain		*domain;
-	struct irq_desc			*chained_desc;
-	unsigned long			*bitmap;
-	struct irq_domain_ops		ops;
-};
-
-static bool partition_check_cpu(struct partition_desc *part,
-				unsigned int cpu, unsigned int hwirq)
-{
-	return cpumask_test_cpu(cpu, &part->parts[hwirq].mask);
-}
-
-static void partition_irq_mask(struct irq_data *d)
-{
-	struct partition_desc *part = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
-	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
-
-	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
-	    chip->irq_mask)
-		chip->irq_mask(data);
-}
-
-static void partition_irq_unmask(struct irq_data *d)
-{
-	struct partition_desc *part = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
-	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
-
-	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
-	    chip->irq_unmask)
-		chip->irq_unmask(data);
-}
-
-static int partition_irq_set_irqchip_state(struct irq_data *d,
-					   enum irqchip_irq_state which,
-					   bool val)
-{
-	struct partition_desc *part = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
-	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
-
-	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
-	    chip->irq_set_irqchip_state)
-		return chip->irq_set_irqchip_state(data, which, val);
-
-	return -EINVAL;
-}
-
-static int partition_irq_get_irqchip_state(struct irq_data *d,
-					   enum irqchip_irq_state which,
-					   bool *val)
-{
-	struct partition_desc *part = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
-	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
-
-	if (partition_check_cpu(part, smp_processor_id(), d->hwirq) &&
-	    chip->irq_get_irqchip_state)
-		return chip->irq_get_irqchip_state(data, which, val);
-
-	return -EINVAL;
-}
-
-static int partition_irq_set_type(struct irq_data *d, unsigned int type)
-{
-	struct partition_desc *part = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
-	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
-
-	if (chip->irq_set_type)
-		return chip->irq_set_type(data, type);
-
-	return -EINVAL;
-}
-
-static void partition_irq_print_chip(struct irq_data *d, struct seq_file *p)
-{
-	struct partition_desc *part = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_desc_get_chip(part->chained_desc);
-	struct irq_data *data = irq_desc_get_irq_data(part->chained_desc);
-
-	seq_printf(p, "%5s-%lu", chip->name, data->hwirq);
-}
-
-static struct irq_chip partition_irq_chip = {
-	.irq_mask		= partition_irq_mask,
-	.irq_unmask		= partition_irq_unmask,
-	.irq_set_type		= partition_irq_set_type,
-	.irq_get_irqchip_state	= partition_irq_get_irqchip_state,
-	.irq_set_irqchip_state	= partition_irq_set_irqchip_state,
-	.irq_print_chip		= partition_irq_print_chip,
-};
-
-static void partition_handle_irq(struct irq_desc *desc)
-{
-	struct partition_desc *part = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int cpu = smp_processor_id();
-	int hwirq;
-
-	chained_irq_enter(chip, desc);
-
-	for_each_set_bit(hwirq, part->bitmap, part->nr_parts) {
-		if (partition_check_cpu(part, cpu, hwirq))
-			break;
-	}
-
-	if (unlikely(hwirq == part->nr_parts))
-		handle_bad_irq(desc);
-	else
-		generic_handle_domain_irq(part->domain, hwirq);
-
-	chained_irq_exit(chip, desc);
-}
-
-static int partition_domain_alloc(struct irq_domain *domain, unsigned int virq,
-				  unsigned int nr_irqs, void *arg)
-{
-	int ret;
-	irq_hw_number_t hwirq;
-	unsigned int type;
-	struct irq_fwspec *fwspec = arg;
-	struct partition_desc *part;
-
-	BUG_ON(nr_irqs != 1);
-	ret = domain->ops->translate(domain, fwspec, &hwirq, &type);
-	if (ret)
-		return ret;
-
-	part = domain->host_data;
-
-	set_bit(hwirq, part->bitmap);
-	irq_set_chained_handler_and_data(irq_desc_get_irq(part->chained_desc),
-					 partition_handle_irq, part);
-	irq_set_percpu_devid_partition(virq, &part->parts[hwirq].mask);
-	irq_domain_set_info(domain, virq, hwirq, &partition_irq_chip, part,
-			    handle_percpu_devid_irq, NULL, NULL);
-	irq_set_status_flags(virq, IRQ_NOAUTOEN);
-
-	return 0;
-}
-
-static void partition_domain_free(struct irq_domain *domain, unsigned int virq,
-				  unsigned int nr_irqs)
-{
-	struct irq_data *d;
-
-	BUG_ON(nr_irqs != 1);
-
-	d = irq_domain_get_irq_data(domain, virq);
-	irq_set_handler(virq, NULL);
-	irq_domain_reset_irq_data(d);
-}
-
-int partition_translate_id(struct partition_desc *desc, void *partition_id)
-{
-	struct partition_affinity *part = NULL;
-	int i;
-
-	for (i = 0; i < desc->nr_parts; i++) {
-		if (desc->parts[i].partition_id == partition_id) {
-			part = &desc->parts[i];
-			break;
-		}
-	}
-
-	if (WARN_ON(!part)) {
-		pr_err("Failed to find partition\n");
-		return -EINVAL;
-	}
-
-	return i;
-}
-
-struct partition_desc *partition_create_desc(struct fwnode_handle *fwnode,
-					     struct partition_affinity *parts,
-					     int nr_parts,
-					     int chained_irq,
-					     const struct irq_domain_ops *ops)
-{
-	struct partition_desc *desc;
-	struct irq_domain *d;
-
-	BUG_ON(!ops->select || !ops->translate);
-
-	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
-	if (!desc)
-		return NULL;
-
-	desc->ops = *ops;
-	desc->ops.free = partition_domain_free;
-	desc->ops.alloc = partition_domain_alloc;
-
-	d = irq_domain_create_linear(fwnode, nr_parts, &desc->ops, desc);
-	if (!d)
-		goto out;
-	desc->domain = d;
-
-	desc->bitmap = bitmap_zalloc(nr_parts, GFP_KERNEL);
-	if (WARN_ON(!desc->bitmap))
-		goto out;
-
-	desc->chained_desc = irq_to_desc(chained_irq);
-	desc->nr_parts = nr_parts;
-	desc->parts = parts;
-
-	return desc;
-out:
-	if (d)
-		irq_domain_remove(d);
-	kfree(desc);
-
-	return NULL;
-}
-
-struct irq_domain *partition_get_domain(struct partition_desc *dsc)
-{
-	if (dsc)
-		return dsc->domain;
-
-	return NULL;
-}
diff --git a/include/linux/irqchip/irq-partition-percpu.h b/include/linux/irqchip/irq-partition-percpu.h
deleted file mode 100644
index b35ee22c278f8..0000000000000
--- a/include/linux/irqchip/irq-partition-percpu.h
+++ /dev/null
@@ -1,53 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2016 ARM Limited, All Rights Reserved.
- * Author: Marc Zyngier <marc.zyngier@arm.com>
- */
-
-#ifndef __LINUX_IRQCHIP_IRQ_PARTITION_PERCPU_H
-#define __LINUX_IRQCHIP_IRQ_PARTITION_PERCPU_H
-
-#include <linux/fwnode.h>
-#include <linux/cpumask_types.h>
-#include <linux/irqdomain.h>
-
-struct partition_affinity {
-	cpumask_t			mask;
-	void				*partition_id;
-};
-
-struct partition_desc;
-
-#ifdef CONFIG_PARTITION_PERCPU
-int partition_translate_id(struct partition_desc *desc, void *partition_id);
-struct partition_desc *partition_create_desc(struct fwnode_handle *fwnode,
-					     struct partition_affinity *parts,
-					     int nr_parts,
-					     int chained_irq,
-					     const struct irq_domain_ops *ops);
-struct irq_domain *partition_get_domain(struct partition_desc *dsc);
-#else
-static inline int partition_translate_id(struct partition_desc *desc,
-					 void *partition_id)
-{
-	return -EINVAL;
-}
-
-static inline
-struct partition_desc *partition_create_desc(struct fwnode_handle *fwnode,
-					     struct partition_affinity *parts,
-					     int nr_parts,
-					     int chained_irq,
-					     const struct irq_domain_ops *ops)
-{
-	return NULL;
-}
-
-static inline
-struct irq_domain *partition_get_domain(struct partition_desc *dsc)
-{
-	return NULL;
-}
-#endif
-
-#endif /* __LINUX_IRQCHIP_IRQ_PARTITION_PERCPU_H */
-- 
2.47.3


