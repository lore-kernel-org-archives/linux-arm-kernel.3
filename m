Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D50C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adXcI5G4e8+KS+J8sN2GRf5JFIOLakiExBCGEfq3iBI=; b=nB/VIqDdtUfOqn/g0+KLo2ygq0
	2rDU0r1yKkKYOX17AbmbkpGqr5n4kkhySX4wzFqp0wqbemasuiXz9oo0fG9JorYMv1Mz8Hba4soPR
	2A3TyvCAAXD2g2zg84Q08Yx++/JCrL2/6fbUcROrOLiOe5PRWUIaPUVKh+k/Ru52/XozzO+a9/K74
	phYw/OQiLRpPXdiVZG7kTfUDk2usE0TG97Eq5jsHD6lbS9ZZir3nmM16tWkl+xJfj6EvSaw9hsbzp
	VRUIybpwDrf0HGv8ytlH2FLpvir0QzGoCmyKSbiNC+Q8s/EMxOHAyDi0Og99tf8gEqIgu+uR2/SGR
	rTivILdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUl1c-0000000BRtv-3zxQ;
	Thu, 26 Jun 2025 11:44:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjqX-0000000BHSJ-1HwO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5E5561ADF;
	Thu, 26 Jun 2025 10:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78F8C4CEEE;
	Thu, 26 Jun 2025 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933724;
	bh=pWG1G2mBTD+N9l/FGUOM8XrO+5AgWTZQPiXtRYYjjvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YDsVvSZlgg78GVAhC+REHedyDVzMQly+m4N3CooaOplbs6stvLgG6bpThma18YmqU
	 9xLZscLQ3Aa4K0r9BEexCgX6HtRofXGULKwiPyV4QAiUMj5CL/lZL361N5oDo+Jg9r
	 ZXyJXWlS78Z1OUVC7A2ad/dIDQ0hfrtBPTL7tHKog5R2NX71XuXW0kpZ0+xAs5zHXJ
	 oZzDVcyc81nprI6rR6wDncWy4usiE4vAYib6nDKcyOkx9B1Xycy/YRVO22tXKe/SMT
	 QUkzrvBtHdLlJqfCCytQKhpYBsINnpvxiEY6OJle8gReI6l54JvkYlgqmI+wPdpemx
	 PPY73CSPa+zDA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:17 +0200
Subject: [PATCH v6 26/31] irqchip/gic-v3: Rename GICv3 ITS MSI parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-26-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
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

The GICv5 ITS will reuse some GICv3 ITS MSI parent functions therefore
it makes sense to keep the code functionality in a compilation unit
shared by the two drivers.

Rename the GICv3 ITS MSI parent file and update the related
Kconfig/Makefile entries to pave the way for code sharing.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/Kconfig                                       |  4 ++++
 drivers/irqchip/Makefile                                      |  3 ++-
 drivers/irqchip/irq-gic-common.h                              |  2 --
 .../{irq-gic-v3-its-msi-parent.c => irq-gic-its-msi-parent.c} |  2 +-
 drivers/irqchip/irq-gic-its-msi-parent.h                      | 11 +++++++++++
 drivers/irqchip/irq-gic-v3-its.c                              |  1 +
 6 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 3e4fb08b7a4d..f9eae1a645c9 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -41,10 +41,14 @@ config ARM_GIC_V3
 	select HAVE_ARM_SMCCC_DISCOVERY
 	select IRQ_MSI_IOMMU
 
+config ARM_GIC_ITS_PARENT
+	bool
+
 config ARM_GIC_V3_ITS
 	bool
 	select GENERIC_MSI_IRQ
 	select IRQ_MSI_LIB
+	select ARM_GIC_ITS_PARENT
 	default ARM_GIC_V3
 	select IRQ_MSI_IOMMU
 
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 7a0e6cee09e1..3ce6ea9a371b 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -33,7 +33,8 @@ obj-$(CONFIG_ARCH_REALVIEW)		+= irq-gic-realview.o
 obj-$(CONFIG_IRQ_MSI_LIB)		+= irq-msi-lib.o
 obj-$(CONFIG_ARM_GIC_V2M)		+= irq-gic-v2m.o
 obj-$(CONFIG_ARM_GIC_V3)		+= irq-gic-v3.o irq-gic-v3-mbi.o irq-gic-common.o
-obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o irq-gic-v3-its-msi-parent.o
+obj-$(CONFIG_ARM_GIC_ITS_PARENT)	+= irq-gic-its-msi-parent.o
+obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
 obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
 obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
 obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
index 020ecdf16901..710cab61d919 100644
--- a/drivers/irqchip/irq-gic-common.h
+++ b/drivers/irqchip/irq-gic-common.h
@@ -29,8 +29,6 @@ void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
 void gic_enable_of_quirks(const struct device_node *np,
 			  const struct gic_quirk *quirks, void *data);
 
-extern const struct msi_parent_ops gic_v3_its_msi_parent_ops;
-
 #define RDIST_FLAGS_PROPBASE_NEEDS_FLUSHING    (1 << 0)
 #define RDIST_FLAGS_RD_TABLES_PREALLOCATED     (1 << 1)
 #define RDIST_FLAGS_FORCE_NON_SHAREABLE        (1 << 2)
diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
similarity index 99%
rename from drivers/irqchip/irq-gic-v3-its-msi-parent.c
rename to drivers/irqchip/irq-gic-its-msi-parent.c
index a5e110ffdd88..8beecfed2b84 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -7,7 +7,7 @@
 #include <linux/acpi_iort.h>
 #include <linux/pci.h>
 
-#include "irq-gic-common.h"
+#include "irq-gic-its-msi-parent.h"
 #include <linux/irqchip/irq-msi-lib.h>
 
 #define ITS_MSI_FLAGS_REQUIRED  (MSI_FLAG_USE_DEF_DOM_OPS |	\
diff --git a/drivers/irqchip/irq-gic-its-msi-parent.h b/drivers/irqchip/irq-gic-its-msi-parent.h
new file mode 100644
index 000000000000..75e223e673ce
--- /dev/null
+++ b/drivers/irqchip/irq-gic-its-msi-parent.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 ARM Limited, All Rights Reserved.
+ */
+
+#ifndef _IRQ_GIC_ITS_MSI_PARENT_H
+#define _IRQ_GIC_ITS_MSI_PARENT_H
+
+extern const struct msi_parent_ops gic_v3_its_msi_parent_ops;
+
+#endif /* _IRQ_GIC_ITS_MSI_PARENT_H */
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index d54fa0638dc4..467cb78435a9 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -41,6 +41,7 @@
 #include <asm/exception.h>
 
 #include "irq-gic-common.h"
+#include "irq-gic-its-msi-parent.h"
 #include <linux/irqchip/irq-msi-lib.h>
 
 #define ITS_FLAGS_CMDQ_NEEDS_FLUSHING		(1ULL << 0)

-- 
2.48.0


