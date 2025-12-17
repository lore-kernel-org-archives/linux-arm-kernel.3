Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0238CD6554E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfVHhpkmkpwB9OvayoQJs5eEMyLkT5ptXc5ZINcoNrQ=; b=B0ldlzLrSWeYhffd++ybbmF5ng
	jOZ7EiRdu0+ZPPB0DnirCoiAhhYSE4c24dCOUQ+2OztyrzM1jQrVx8iJR49JEZvmOMJ0UsBbTDm7A
	9cI5MVH2+pGx//GZvxRf03KNhAi1aQ0LVAEXMn8HX3GhZ9DyoUPz5qBjZ9ON2G2zUCqwXCDSNYwNj
	iVosFVcK6huNGmwmKIKktEW3ZldX/nkao1xgCMrwWzD1HKmR4XcJ54axG8xKobixspOb2DSAYvbex
	EgacD/GFhgoGsKWRk+rAvktTzxiNzFHppObuIWT+caVi/mP4p+Q0uvldRBsAAW24fQRvzIzWWeTNu
	pnnOFO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpl1-00000006jQc-2dpL;
	Wed, 17 Dec 2025 11:31:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVpky-00000006jPF-2f7l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 11:31:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 921B01692;
	Wed, 17 Dec 2025 03:31:40 -0800 (PST)
Received: from e134710.manchester.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD68A3F73B;
	Wed, 17 Dec 2025 03:31:45 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
To: linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: tony.luck@intel.com,
	bp@alien8.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	linux-doc@vger.kernel.org,
	Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com,
	ahmed.tiba@arm.com
Subject: [PATCH 11/12] ras: add DeviceTree estatus provider driver
Date: Wed, 17 Dec 2025 11:28:44 +0000
Message-ID: <20251217112845.1814119-12-ahmed.tiba@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217112845.1814119-1-ahmed.tiba@arm.com>
References: <20251217112845.1814119-1-ahmed.tiba@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_033148_755838_AE4A0194 
X-CRM114-Status: GOOD (  27.11  )
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

Introduce a platform driver that maps the CPER status block described
in DeviceTree, feeds it into the estatus core and handles either IRQ- or
poll-driven notifications. Arm64 gains a FIX_ESTATUS_IRQ slot so the
driver can safely map the shared buffer while copying records.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 MAINTAINERS                     |   1 +
 arch/arm64/include/asm/fixmap.h |   5 +
 drivers/ras/Kconfig             |  14 ++
 drivers/ras/Makefile            |   1 +
 drivers/ras/estatus-dt.c        | 318 ++++++++++++++++++++++++++++++++
 include/linux/estatus.h         |   3 +-
 6 files changed, 341 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ras/estatus-dt.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6b2ef2ddc0c7..5567d5e82053 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21761,6 +21761,7 @@ RAS ERROR STATUS
 M:	Ahmed Tiba <ahmed.tiba@arm.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/ras/arm,ras-ffh.yaml
+F:	drivers/ras/estatus-dt.c
 F:	drivers/firmware/efi/estatus.c
 F:	include/linux/estatus.h
 
diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 65555284446e..85ffba87bab9 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -64,6 +64,11 @@ enum fixed_addresses {
 #endif
 #endif /* CONFIG_ACPI_APEI_GHES */
 
+#ifdef CONFIG_RAS_ESTATUS_DT
+	/* Used for ESTATUS mapping from assorted contexts */
+	FIX_ESTATUS_IRQ,
+#endif /* CONFIG_RAS_ESTATUS_DT */
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 #ifdef CONFIG_RELOCATABLE
 	FIX_ENTRY_TRAMP_TEXT4,	/* one extra slot for the data page */
diff --git a/drivers/ras/Kconfig b/drivers/ras/Kconfig
index fc4f4bb94a4c..0f8c0d3c26db 100644
--- a/drivers/ras/Kconfig
+++ b/drivers/ras/Kconfig
@@ -34,6 +34,20 @@ if RAS
 source "arch/x86/ras/Kconfig"
 source "drivers/ras/amd/atl/Kconfig"
 
+config RAS_ESTATUS_DT
+	tristate "DeviceTree estatus provider"
+	depends on ARM64
+	depends on OF && HAS_IOMEM
+	select UEFI_CPER
+	select RAS_ESTATUS_CORE
+	help
+	  Enable support for firmware-first CPER providers that are described
+	  via DeviceTree.  The driver maps the firmware-provided CPER buffer
+	  and consumes records when firmware signals that new data is ready,
+	  either with an interrupt or via polling.  Select this when running on
+	  platforms that expose firmware-first error records without
+	  ACPI/APEI GHES.
+
 config RAS_FMPM
 	tristate "FRU Memory Poison Manager"
 	default m
diff --git a/drivers/ras/Makefile b/drivers/ras/Makefile
index 11f95d59d397..726455bcf950 100644
--- a/drivers/ras/Makefile
+++ b/drivers/ras/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_RAS_CEC)	+= cec.o
 
 obj-$(CONFIG_RAS_FMPM)	+= amd/fmpm.o
 obj-y			+= amd/atl/
+obj-$(CONFIG_RAS_ESTATUS_DT)	+= estatus-dt.o
diff --git a/drivers/ras/estatus-dt.c b/drivers/ras/estatus-dt.c
new file mode 100644
index 000000000000..75c85c404cb6
--- /dev/null
+++ b/drivers/ras/estatus-dt.c
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * DeviceTree provider for firmware-first estatus error records
+ *
+ * Copyright (C) 2025 ARM Ltd.
+ * Author: Ahmed Tiba <ahmed.tiba@arm.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+
+#include <linux/estatus.h>
+#include <asm/fixmap.h>
+
+struct estatus_dt_ack {
+	void __iomem *addr;
+	u64 preserve;
+	u64 set;
+	u8 width;
+	bool present;
+};
+
+struct estatus_dt {
+	struct device *dev;
+	void __iomem *base;
+	phys_addr_t phys;
+	size_t block_size;
+
+	struct estatus_dt_ack ack;
+
+	struct estatus_source source;
+	int irq;
+
+	struct timer_list poll_timer;
+	u32 poll_interval_ms;
+	bool polling;
+
+	bool sea_notify;
+};
+
+static int estatus_dt_get_phys(struct estatus_source *source, phys_addr_t *addr)
+{
+	struct estatus_dt *ctx = source->priv;
+
+	*addr = ctx->phys;
+	return 0;
+}
+
+static int estatus_dt_read(struct estatus_source *source, phys_addr_t addr,
+			   void *buf, size_t len,
+			   enum fixed_addresses fixmap_idx)
+{
+	struct estatus_dt *ctx = source->priv;
+
+	(void)addr;
+	(void)fixmap_idx;
+
+	if (WARN_ON(len > ctx->block_size))
+		len = ctx->block_size;
+
+	memcpy_fromio(buf, ctx->base, len);
+
+	return 0;
+}
+
+static int estatus_dt_write(struct estatus_source *source, phys_addr_t addr,
+			    const void *buf, size_t len,
+			    enum fixed_addresses fixmap_idx)
+{
+	struct estatus_dt *ctx = source->priv;
+
+	(void)addr;
+	(void)fixmap_idx;
+
+	if (WARN_ON(len > ctx->block_size))
+		len = ctx->block_size;
+
+	memcpy_toio(ctx->base, buf, len);
+
+	return 0;
+}
+
+static void estatus_dt_ack(struct estatus_source *source)
+{
+	struct estatus_dt *ctx = source->priv;
+	u64 val;
+
+	if (!ctx->ack.present)
+		return;
+
+	if (ctx->ack.width == 64) {
+		val = readq(ctx->ack.addr);
+		val &= ctx->ack.preserve;
+		val |= ctx->ack.set;
+		writeq(val, ctx->ack.addr);
+	} else {
+		val = readl(ctx->ack.addr);
+		val &= (u32)ctx->ack.preserve;
+		val |= (u32)ctx->ack.set;
+		writel(val, ctx->ack.addr);
+	}
+}
+
+static size_t estatus_dt_get_max_len(struct estatus_source *source)
+{
+	struct estatus_dt *ctx = source->priv;
+
+	return ctx->block_size;
+}
+
+static enum estatus_notify_mode
+estatus_dt_get_notify_mode(struct estatus_source *source)
+{
+	struct estatus_dt *ctx = source->priv;
+
+	if (ctx->sea_notify)
+		return ESTATUS_NOTIFY_SEA;
+
+	return ESTATUS_NOTIFY_ASYNC;
+}
+
+static const char *estatus_dt_get_name(struct estatus_source *source)
+{
+	struct estatus_dt *ctx = source->priv;
+
+	return dev_name(ctx->dev);
+}
+
+static const struct estatus_ops estatus_dt_ops = {
+	.get_phys	= estatus_dt_get_phys,
+	.read		= estatus_dt_read,
+	.write		= estatus_dt_write,
+	.ack		= estatus_dt_ack,
+	.get_max_len	= estatus_dt_get_max_len,
+	.get_notify_mode = estatus_dt_get_notify_mode,
+	.get_name	= estatus_dt_get_name,
+};
+
+static irqreturn_t estatus_dt_irq(int irq, void *data)
+{
+	struct estatus_dt *ctx = data;
+
+	if (estatus_proc(&ctx->source))
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static void estatus_dt_poll(struct timer_list *t)
+{
+	struct estatus_dt *ctx = timer_container_of(ctx, t, poll_timer);
+
+	estatus_proc(&ctx->source);
+	mod_timer(&ctx->poll_timer,
+		  jiffies + msecs_to_jiffies(ctx->poll_interval_ms));
+}
+
+static int estatus_dt_init_ack(struct platform_device *pdev,
+			       struct estatus_dt *ctx)
+{
+	struct resource *res;
+	u64 preserve;
+	size_t size;
+	u32 width;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ack");
+	if (!res)
+		return 0;
+
+	ctx->ack.addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ctx->ack.addr))
+		return PTR_ERR(ctx->ack.addr);
+
+	size = resource_size(res);
+	if (size == 4)
+		width = 32;
+	else if (size == 8)
+		width = 64;
+	else {
+		dev_err(&pdev->dev, "Unsupported ack resource size %zu\n", size);
+		return -EINVAL;
+	}
+	ctx->ack.width = width;
+
+	preserve = width == 64 ? ~0ULL : ~0U;
+	ctx->ack.preserve = preserve;
+	ctx->ack.set = BIT_ULL(0);
+
+	ctx->ack.present = true;
+
+	return 0;
+}
+
+static int estatus_dt_probe(struct platform_device *pdev)
+{
+	struct estatus_dt *ctx;
+	struct resource *res;
+	size_t block_size;
+	int rc;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	block_size = resource_size(res);
+	if (!block_size) {
+		dev_err(&pdev->dev, "Status block region has zero size\n");
+		return -EINVAL;
+	}
+
+	rc = estatus_pool_init(1);
+	if (rc)
+		return rc;
+
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = &pdev->dev;
+	ctx->sea_notify = of_property_read_bool(pdev->dev.of_node,
+						"arm,sea-notify");
+	ctx->poll_interval_ms = 0;
+	of_property_read_u32(pdev->dev.of_node,
+			     "poll-interval", &ctx->poll_interval_ms);
+	if (ctx->poll_interval_ms)
+		ctx->polling = true;
+
+	ctx->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ctx->base))
+		return PTR_ERR(ctx->base);
+
+	ctx->phys = res->start;
+	ctx->block_size = block_size;
+
+	ctx->source.ops = &estatus_dt_ops;
+	ctx->source.priv = ctx;
+	ctx->source.estatus = devm_kzalloc(&pdev->dev, block_size, GFP_KERNEL);
+	if (!ctx->source.estatus)
+		return -ENOMEM;
+	ctx->source.fixmap_idx = FIX_ESTATUS_IRQ;
+
+	rc = estatus_dt_init_ack(pdev, ctx);
+	if (rc)
+		return rc;
+
+	ctx->irq = platform_get_irq_optional(pdev, 0);
+	if (ctx->irq < 0) {
+		if (ctx->irq != -ENXIO && ctx->irq != -EINVAL)
+			return ctx->irq;
+		ctx->irq = 0;
+	}
+
+	if (ctx->irq > 0) {
+		rc = devm_request_threaded_irq(&pdev->dev, ctx->irq,
+					       NULL, estatus_dt_irq,
+					       IRQF_ONESHOT,
+					       dev_name(&pdev->dev), ctx);
+		if (rc)
+			return rc;
+	}
+
+	if (!ctx->polling && ctx->irq <= 0) {
+		dev_err(&pdev->dev,
+			"Either poll-interval or an interrupt is required\n");
+		return -EINVAL;
+	}
+
+	if (ctx->polling) {
+		timer_setup(&ctx->poll_timer, estatus_dt_poll, 0);
+		mod_timer(&ctx->poll_timer,
+			  jiffies + msecs_to_jiffies(ctx->poll_interval_ms));
+	}
+
+	platform_set_drvdata(pdev, ctx);
+
+	dev_info(&pdev->dev, "Registered estatus provider (%s)\n",
+		 ctx->polling ? "polling" : "interrupt");
+
+	return 0;
+}
+
+static void estatus_dt_remove(struct platform_device *pdev)
+{
+	struct estatus_dt *ctx = platform_get_drvdata(pdev);
+
+	if (ctx->polling)
+		timer_delete_sync(&ctx->poll_timer);
+}
+
+static const struct of_device_id estatus_dt_of_match[] = {
+	{ .compatible = "arm,ras-ffh", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, estatus_dt_of_match);
+
+static struct platform_driver estatus_dt_driver = {
+	.probe = estatus_dt_probe,
+	.remove = estatus_dt_remove,
+	.driver = {
+		.name = "estatus-dt",
+		.of_match_table = estatus_dt_of_match,
+	},
+};
+
+module_platform_driver(estatus_dt_driver);
+
+MODULE_AUTHOR("Ahmed Tiba <ahmed.tiba@arm.com>");
+MODULE_DESCRIPTION("DeviceTree estatus provider");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/estatus.h b/include/linux/estatus.h
index 506a74ad60b9..2478f54b62e4 100644
--- a/include/linux/estatus.h
+++ b/include/linux/estatus.h
@@ -227,7 +227,8 @@ estatus_section_iter_next(struct estatus_section_iter *iter,
 
 #define estatus_for_each_section(_estatus, _section)				\
 	for (struct estatus_section_iter __estatus_iter = {0};		\
-	     ((_section) = estatus_section_iter_next(&__estatus_iter, (_estatus))); \
+	     ((_section) = estatus_section_iter_next(&__estatus_iter,		\
+				    (estatus_generic_status *)(_estatus)));	\
 	     )
 
 static inline int acpi_hest_get_version(struct acpi_hest_generic_data *gdata)
-- 
2.43.0


