Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F55AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxl8rp8wqmkZLCdj3/pqUays/JOlw0FMpgaoC2sElPo=; b=XG02b6u2qPswNEkaqzsCb46F1P
	evl5+O///MGDhFK/Z+psSRRFV7n5BMXYf4ohNuflP3LytTP3W8VehfV4ks23l0182WJJ8Kg6f+kGg
	46m2bOc3aGEYwAxT1E7DZrpAqqegweIeTh/eWEQK8qER2Vow3PTXK6ijzb0s0OibdIs3Hde3KvYpP
	OJS1DiWvuj+X4wC5We9KrL2L9xdgn31ERtMy8F7qAIoF5LeCa09utl45uho53KOb6H4DfEn5G3KiX
	Mit5gYtEcGZFL3GnpC33hu37Y9UwQqBFGHC07rWQCmFMzHcEntE0ujn2LV7aSmh3AEX6JWXI6sjHK
	fF0rlAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyHW-0000000Efnq-2YBT;
	Wed, 15 Jul 2026 12:00:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyGv-0000000Ef57-0ADk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 11:59:31 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-493c47a09b5so27826735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 04:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784116767; x=1784721567; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxl8rp8wqmkZLCdj3/pqUays/JOlw0FMpgaoC2sElPo=;
        b=CUxP8aT/jFCoKtU/xkdhNPlRcZ9NCCDZcCOk8RzrRlo6bsIv6eOO1Bt4TKoyfj0Pqb
         jcJ/UU2yp+oXVsZQbQim4dnEruvMZJGp/FqOuLkH/JPzov4jgsTvM4mVvrfoDf1CqWpB
         oHa4Kc2YLewbRok7+rg8vBaAyy7vjjFd4tzJeA0KIPtAHzBl2Ipv5R+QS7GFieGmu/0H
         2RKGt5mmhB3VOjH0Hu4sMQJXWH2jjqTbdH8q3YStzOyPzuzcCHdFEjq92l1oMefpHSpg
         pwXR+i3FiiL+ZPrCWv1GdtK+UmB6Me+h2+970ozhnq2aR7tFL+RNdZ+z2ni0jISHtLPf
         hO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116767; x=1784721567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxl8rp8wqmkZLCdj3/pqUays/JOlw0FMpgaoC2sElPo=;
        b=NOhXBikXTBbO+CImhpCOsf3dSRDysXygReqMUQlJgN1vha+MR+P94/pUEqzTqv4VE5
         zfDrZ6S/WU6c4Ofm17eOk1Pqem0EbgOhWPq60B+c1+7BwiQtHR4u9G8WLjmsMGD8M3k+
         2m+bjG6KyzpL5Rqll98aqqtOtBKVpequjDHZxCBg/o8Wv9PIE0u7l25HiRHJy/skm7fA
         P8TQ1WUls2wa39zQqh0E2LmcxNKoq7ChOxPOnk8yfBhWSyaB7KWdzKx6HJM6DCOVrLMF
         BCM0p395kGjrYZWykRuJoROwynhedO/kcjNx5tY/CkGR6cSx4LKavXrj5ANxX84+n6Nm
         gYVA==
X-Gm-Message-State: AOJu0Yyl48M4Kb5fDoAO7MqbC5IY2EXDEy6tJpuIzboRZenfSyRCdRwJ
	qacfUbeiiK33oTeACbmML4WsmdG/2Ih1+3toMyMJaY7YfVVMjGtywibuD3KaBb/z0S0pm/NRnIo
	QPX5I0xxN+fJmnAXVvk1+WdXYqAHHO89j6VAvCiqoBvsZQajzvm8PU5yyYzL3KDC3RORoMLwafZ
	qLTLmgSCPvhLy6sQvDmmzaXP6WLhE9FTpukYIcDr26SiMKvuNialpPBS2DIj1PgnLZTA==
X-Received: from wmbdt5.prod.google.com ([2002:a05:600c:6305:b0:493:e190:29a1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3486:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-4953b156ee2mr37101555e9.33.1784116766396;
 Wed, 15 Jul 2026 04:59:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:58:52 +0000
In-Reply-To: <20260715115906.2664882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260715115906.2664882-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715115906.2664882-12-smostafa@google.com>
Subject: [PATCH v7 11/24] iommu/arm-smmu-v3-kvm: Add the kernel driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045929_131104_79FD888A 
X-CRM114-Status: GOOD (  36.57  )
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
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 189 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  43 ++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm_smmu_v3.h  |   2 +
 4 files changed, 235 insertions(+)
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
index 000000000000..68b78ed933d4
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,189 @@
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
+extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
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
+static int __init kvm_arm_smmu_v3_register(void)
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
+	ret = pkvm_iommu_register_driver(kern_hyp_va(lm_alias(&kvm_nvhe_sym(smmu_ops))),
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
+		platform_driver_unregister(&smmuv3_nesting_driver);
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
index 674ff98706f6..49728d8076d9 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
@@ -5311,6 +5312,48 @@ static struct platform_driver arm_smmu_driver = {
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
2.55.0.141.g00534a21ce-goog


