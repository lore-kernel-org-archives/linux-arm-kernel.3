Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE8ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5e9Zs3MwDJ2yjIhn7su11zoqJKlrKCutAbPHqtuih2E=; b=RuwDyCqF/XQUXtJLgdgnxgmJKx
	lxUEw2yxAOEZNSLBiGunXUqW8mfO3X4SCV+j7g5ES3MNoawcxCZuSvOQi0uP8x+/kPDKsfblAMcMO
	TK1lC5Bhezm6mhb6TCKD1bYzSo7Qrosr5kmBa/kn+kYyay7Ror+VQHMZIBWeEg/bCK/pwgFsC4dxG
	KQHFc66PkkQoKXBVsTyD+oiv3gDCaVeZ2jzQ8hnjRoDpLQDwE68P7V55igBAkESSXlQraQBNBrb2z
	Kf5PrU+aSHseXJZTUSOGXlNHY577GgbZmRvIkM4UFRbQWG5ffDQQeI8YHb9lte/uNbx9q8iu+hH1w
	Jqc+1LIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIluu-00000006cuT-0pzW;
	Fri, 01 May 2026 11:20:20 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlur-00000006cnU-1BDk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:20:18 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44b186b715aso175047f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634415; x=1778239215; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5e9Zs3MwDJ2yjIhn7su11zoqJKlrKCutAbPHqtuih2E=;
        b=I9cchqAgqMkUQU8tK64vpOg4gBDPCNJCKPMA7hE7hf36P+qrbuL3TPFnTtfJEb26Hk
         IqoB5rBLDaMN3ETIBdg8M8HGdXcXTfrvgJApG+IXWD2wW/b8QYkgYlhDot6dVmnXZl+7
         UsLRLxaVGXdwyXXGez5FNlrCAVm+uGVYn5r8U9HH3OHGNrcsC4f8rJXKKwIIoehLwRRS
         8kUSjkQIfrQipeFB+eZnFWN+mxGSNianj0bXxkVHmbTrKOA1XgQ/RBVDCz9z4QQre3LO
         7JTkfug9D/XQAU5GaFKMESfXoU7RREcxhu5cxq9ZIaEqQlkxt543zxfR9t4ai+VzJTwL
         HKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634415; x=1778239215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5e9Zs3MwDJ2yjIhn7su11zoqJKlrKCutAbPHqtuih2E=;
        b=LciU873rWjG96wU5FdlmJdDT1B27NTs/t/FF2jyanyz/4FHjZEJHRvrSiBWGSWq1p/
         R0Pg5EtXVHS2yUcH7iAa39E3LUCcRGSLN8H0hgnglSvgW6SsA8ZhZbEhXwFuRz27SiyZ
         EDGk3SZH0il4MU8ERwIeKy0e5IwxYLeRJTu+JF5CzXQvnXvxnYe90VjJcOCMqtQSL2RP
         0l/5jTzgKp9GbEriYEOxj0bc4tZpezxq9RJEaFCua66AByFTHUGLlEGHJp8EYYXAVPT6
         bThOmuSPpRohissQ6+haF/rQ111dP/s6NFKv442mrEPL3Jpk92GvkhLqv3QwuZ1uXsm/
         GUbw==
X-Gm-Message-State: AOJu0Yz3/JBakIG0qtVCYIfu13yUm7UE40jHd0Aec4aTf25P1ExUoG68
	yzJRBZRfEkZjNcCbtagbSx7p1PH5sWhfdBEvVnAAGWvveZwcJBqie9oRWrPh3biqF/OkD9DzxMd
	PUWknOT6GKP/MepdrV7KbLdVlrpDaBC4QVDL6JqdmIXwMDsUuugGmwiof3Z1/Yiid8m+/42jI5W
	V++bDpFMaya3jkjvaU5aLF4aBfWayVbGTpz50K5QOyeF4sTzwsjwtKpcDHbCqh5jtI0Q==
X-Received: from wrrb6.prod.google.com ([2002:adf:f906:0:b0:43f:e4ba:3a2c])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:e11:b0:449:acdb:3009 with SMTP id ffacd0b85a97d-449acdb3074mr6505269f8f.6.1777634414928;
 Fri, 01 May 2026 04:20:14 -0700 (PDT)
Date: Fri,  1 May 2026 11:19:14 +0000
In-Reply-To: <20260501111928.259252-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501111928.259252-13-smostafa@google.com>
Subject: [PATCH v6 12/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org, jgg@ziepe.ca, 
	mark.rutland@arm.com, qperret@google.com, tabba@google.com, 
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042017_448102_81127BC1 
X-CRM114-Status: GOOD (  36.35  )
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

When KVM runs in protected mode, and CONFIG_ARM_SMMU_V3_PKVM
is enabled, it will manage the SMMUv3 HW using trap and emulate
and present emulated SMMUs to the host kernel.

In that case, those SMMUs will be on the aux bus, so make it
possible to the driver to probe those devices.

Otherwise, everything else is the same as the KVM emulation
complies with the architecture,so the driver doesn't need
to be modified.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 188 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  43 ++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   2 +
 4 files changed, 234 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index c9ce392e6d31..c3fc5c4a4a1e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -4,5 +4,6 @@ arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-lib.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
+arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_PKVM) += arm-smmu-v3-kvm.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
new file mode 100644
index 000000000000..9765d3d636d7
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM host driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+#include <asm/kvm_mmu.h>
+#include <asm/kvm_pkvm.h>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "arm-smmu-v3.h"
+#include "pkvm/arm_smmu_v3.h"
+
+extern struct kvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+static size_t				kvm_arm_smmu_count;
+static struct hyp_arm_smmu_v3_device	*kvm_arm_smmu_array;
+static size_t				kvm_arm_smmu_cur;
+
+static void kvm_arm_smmu_array_free(void)
+{
+	int order;
+
+	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	free_pages((unsigned long)kvm_arm_smmu_array, order);
+}
+
+static int kvm_arm_smmu_array_alloc(void)
+{
+	int smmu_order;
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "arm,smmu-v3")
+		kvm_arm_smmu_count++;
+
+	if (!kvm_arm_smmu_count)
+		return -ENODEV;
+	smmu_order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	kvm_arm_smmu_array = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, smmu_order);
+	if (!kvm_arm_smmu_array)
+		return -ENOMEM;
+	return 0;
+}
+
+static unsigned int smmu_hyp_pgt_pages(void)
+{
+	struct device_node *np = of_find_compatible_node(NULL, NULL, "arm,smmu-v3");
+
+	/*
+	 * SMMUv3 uses the same format as the CPU stage-2 and hence have the same memory
+	 * requirements, we add extra 500 pages for L2 STEs.
+	 * Only one set of memory is allocated as the page table is shared between all
+	 * the SMMUs.
+	 */
+	if (np) {
+		of_node_put(np);
+		return host_s2_pgtable_pages() + 500;
+	}
+
+	return 0;
+}
+
+static struct platform_driver smmuv3_nesting_driver;
+static int smmuv3_nesting_probe(struct platform_device *pdev)
+{
+	struct hyp_arm_smmu_v3_device *smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	/* Only device tree, ACPI not supported. */
+	if (!dev->of_node)
+		return -EINVAL;
+
+	if (kvm_arm_smmu_cur >= kvm_arm_smmu_count)
+		return -ENOSPC;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	if (of_property_read_bool(dev->of_node, "cavium,cn9900-broken-page1-regspace"))
+		return -EINVAL;
+
+	smmu->mmio_addr = res->start;
+	smmu->mmio_size = resource_size(res);
+	if (smmu->mmio_size < SZ_128K) {
+		dev_err(dev, "MMIO region too small(%pr)\n", res);
+		return -EINVAL;
+	}
+
+	if (of_dma_is_coherent(dev->of_node))
+		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
+
+	kvm_arm_smmu_cur++;
+	return 0;
+}
+
+static int kvm_arm_smmu_v3_register(void)
+{
+	size_t nr_pages = smmu_hyp_pgt_pages();
+	int ret;
+
+	if (!is_protected_kvm_enabled() || !nr_pages)
+		return 0;
+
+	ret = kvm_arm_smmu_array_alloc();
+	if (ret)
+		goto out_err;
+
+	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
+	if (ret)
+		goto out_free;
+
+	ret = kvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))),
+					nr_pages);
+	if (ret)
+		goto out_unregister;
+
+	/*
+	 * These variables are stored in the nVHE image, and won't be accessible
+	 * after KVM initialization. Ownership of kvm_arm_smmu_array will be
+	 * transferred to the hypervisor as well.
+	 */
+	kvm_hyp_arm_smmu_v3_smmus = kvm_arm_smmu_array;
+	kvm_hyp_arm_smmu_v3_count = kvm_arm_smmu_cur;
+	return ret;
+
+out_unregister:
+	platform_driver_unregister(&smmuv3_nesting_driver);
+out_free:
+	kvm_arm_smmu_array_free();
+out_err:
+	kvm_arm_smmu_count = 0;
+	kvm_arm_smmu_array = NULL;
+	return ret;
+};
+
+static int smmu_create_aux_device(struct device *dev, void *data)
+{
+	static int dev_id;
+	struct auxiliary_device *auxdev;
+
+	auxdev = __devm_auxiliary_device_create(dev, "protected_kvm",
+						"smmu_v3_emu", NULL, dev_id++);
+	if (!auxdev)
+		return -ENODEV;
+
+	auxdev->dev.parent = dev;
+	return 0;
+}
+
+static int kvm_arm_smmu_v3_post_init(void)
+{
+	if (!kvm_arm_smmu_count)
+		return 0;
+
+	/*
+	 * If the hypervisor part of the driver fails, KVM will not initialise.
+	 */
+	if (!is_kvm_arm_initialised()) {
+		kvm_arm_smmu_array_free();
+		return 0;
+	}
+
+	WARN_ON(driver_for_each_device(&smmuv3_nesting_driver.driver, NULL,
+				       NULL, smmu_create_aux_device));
+
+	return 0;
+}
+
+static const struct of_device_id smmuv3_nested_of_match[] = {
+	{ .compatible = "arm,smmu-v3", },
+	{ },
+};
+
+static struct platform_driver smmuv3_nesting_driver = {
+	.driver = {
+		.name = "smmuv3-nesting",
+		.of_match_table = smmuv3_nested_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+late_initcall(kvm_arm_smmu_v3_post_init);
+subsys_initcall(kvm_arm_smmu_v3_register);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 96d5e7f80ce7..61e6ab364086 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
@@ -5335,6 +5336,48 @@ static struct platform_driver arm_smmu_driver = {
 module_driver(arm_smmu_driver, platform_driver_register,
 	      arm_smmu_driver_unregister);
 
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+/*
+ * Now we have 2 devices, the aux device bound to this driver, and pdev
+ * which is the physical platform device bound to the KVM driver but not used.
+ * However, this driver keeps using the platform device for 2 reasons:
+ * 1) Simplicity: Avoiding changing big parts of the code assuming
+ *    the underlying device is a platform device.
+ * 2) Dealing with DMA-API, irqs(MSIs), RPM... requires the physical device.
+ */
+
+static int arm_smmu_device_probe_emu(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
+{
+	struct device *parent = auxdev->dev.parent;
+
+	dev_info(&auxdev->dev, "Probing from %s\n", dev_name(parent));
+	return arm_smmu_device_probe(to_platform_device(parent));
+}
+
+static void arm_smmu_device_remove_emu(struct auxiliary_device *auxdev)
+{
+	arm_smmu_device_remove(to_platform_device(auxdev->dev.parent));
+}
+
+const struct auxiliary_device_id arm_smmu_aux_table[] = {
+	{ .name = "protected_kvm.smmu_v3_emu" },
+	{ },
+};
+
+struct auxiliary_driver arm_smmu_driver_emu = {
+	.driver = {
+		.suppress_bind_attrs = true,
+	},
+	.name = "arm-smmu-v3-emu",
+	.id_table = arm_smmu_aux_table,
+	.probe = arm_smmu_device_probe_emu,
+	.remove = arm_smmu_device_remove_emu,
+};
+
+module_auxiliary_driver(arm_smmu_driver_emu);
+#endif
+
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
 MODULE_ALIAS("platform:arm-smmu-v3");
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
index 0d9e48b201f5..744ee2b7f0b4 100644
--- a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h
@@ -8,6 +8,7 @@
  * Parameters from the trusted host:
  * @mmio_addr		base address of the SMMU registers
  * @mmio_size		size of the registers resource
+ * @features		Features of SMMUv3, subset of the main driver
  *
  * Other members are filled and used at runtime by the SMMU driver.
  * @base		Virtual address of SMMU registers
@@ -16,6 +17,7 @@ struct hyp_arm_smmu_v3_device {
 	phys_addr_t		mmio_addr;
 	size_t			mmio_size;
 	void __iomem		*base;
+	u32			features;
 };
 
 extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
-- 
2.54.0.545.g6539524ca2-goog


