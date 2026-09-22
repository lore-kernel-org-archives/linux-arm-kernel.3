Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0D6C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOp2axD6H9O+xfB99xRrvquImzm/JRxih28x/6xdp6c=; b=oWJnXZzCyhCI7MrNPE+4kx/7/R
	YQsR9rr3X3mOSnMHjhziuG6vA69PMEWebywS4Ff1QFw9gqRnO0YUv/Q0PwxBERTGeYQMk/kZy6nn+
	D7jhMRvASn9aAHgxTXS1Iy/EXhP96EBPJTnJRi+4pstK9jCFbzngLAK3AGGWdkbs9RVtRVmd2yi+S
	XUxHWJYzqfIPfsEZuN6ZWElBI1NXsg59w/8Zg4wgdqDkhwmK/oJqPm/Ti373rRmRcUKx8G9oe1SHD
	4HQaAoCsx5QBMBhqbr4xjfBSw+ZX+bWnPDDa3P8pk+VHXa+66gSs3s0pQNg6tqKC+7jPc3eIHhJih
	GjdFuJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Je-00000005Sa2-21Mp;
	Tue, 22 Sep 2026 13:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JE-00000005SGM-2moj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nOp2axD6H9O+xfB99xRrvquImzm/JRxih28x/6xdp6c=; b=DI/wngvaUKLk+kMIvlKMn+ynGD
	RUNNjntCDDbC2N5167MgMKdxaEmyrEhJylRFey9/iRK0ToFFhnIirhtmF+fVg+LNKg9TfTqcdgVNI
	Jve003XiLii3fl3f0YbU254osalal4VMu2vBYJabxu8goLBIvOy+Kd9+vc8hdLBvF6ANt0Uf/xF/F
	d2lmuwHkMGogbtnruUFYRRZuR+ejj41/HEC3J22EOtyHvKJoZW9ziAenMD0zgliphE98/rhwORer8
	HvEIaRxlPugM00qdwAo/5/0Fdyb2bTZgOQgpRIStNRxAIQvZCYUYJJOKTgShlI9ZOl1mlxeghnm05
	atUZ6uJQ==;
Received: from mail-ej1-x647.google.com ([2a00:1450:4864:20::647])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90JB-0000000DbaW-49f5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:19 +0000
Received: by mail-ej1-x647.google.com with SMTP id a640c23a62f3a-c294ae16988so506282366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082796; x=1790687596; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOp2axD6H9O+xfB99xRrvquImzm/JRxih28x/6xdp6c=;
        b=n6O51+cF7VBoa3dVfoafTwklkY14z4UffotkKdSbM9cQ3MThNrR8oqn1wY8hIsYX0w
         T9MoDSkofUmv5gS+NZ6P842aqLyMuQtHNZ+KRC61sHhSq33Jjlu36rTDajaR0LPp9MQm
         G2yohs+id4AyJu6PUvaSIuyvZ/0cFgWVfHUnhjpOhh+Upb/VjaFA3nXM6Fjon1k0VF1X
         2m8bwMQqmrK60eSPjh5zJUuZ0MEq+lIOk+sRYtq6VF4fsECJ78GNMUSjzetIWHW8qvZm
         DWG3iHK5oIhxlCBlM2SnmIbaSdsUaHvj3m78McRLyq+Ew73Zlw9HaFataFdimw3uMRUD
         ICEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082796; x=1790687596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOp2axD6H9O+xfB99xRrvquImzm/JRxih28x/6xdp6c=;
        b=aWoaa90Ez/g1JEdBVUcpAI3Wshf80qmUybzTX+/frpIjAJVXK9M4rWMLaGB/89lwpM
         IKBZPQBCSZnrKs4tIcA1kASsZ3qTdLHmuvIJEzZAnCfNH7ZpOjJXjT5Beh3C1iR4wLCQ
         6GEv/aD4HPVKe7mZtHHKcvtwJO2zjSQGNiIRVypTHjSOIowc/PXXYV1efSkgx4ZpYvft
         VFMiOr5iFgC8sxKB2q43ArEPdARPn+Z4nnn83FU5vp5FJDkkTLkW7q2svSUa0DGy2U0p
         mumhaEfE3jB4thRtqFPDm73WDxoB3i14oAmlEigFAPyc3a8yenNm9/QYYbtEJtZsEz6o
         gK5A==
X-Gm-Message-State: AFuF++ncnq8tK/EEVmmyx2OmI11NV6JWGAd/WnajdvAitlT1yTg+yhqE
	nQKY9j/Et9FUFYUS3QxlmlblUSFWrz7R3bse8OUkegWGcEthq4PAtqoOB2VuE/eFUlZXI9D2Z/d
	0ONxbYNyR+VMwTkG/Sc8lMQTlfXlobV/bZPT5CC6mj/b9DLwgSSMhGo7JlxZ641+6+B8wU0cr7F
	7+XoBEN/fLtqoVcxfIHDALl7niYA4N46dokSjL4+Ms1wmmxNfZ1sncfKC6wm27Obpfyw==
X-Received: from ejbop17.prod.google.com ([2002:a17:906:bcf1:b0:c15:cf52:157e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:ba89:b0:c29:5151:16b8 with SMTP id a640c23a62f3a-c2a1581803amr1073780166b.2.1790082795608;
 Tue, 22 Sep 2026 06:13:15 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:44 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-12-smostafa@google.com>
Subject: [PATCH v8 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
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
X-CRM114-CacheID: sfid-20260922_141318_128930_7916F607 
X-CRM114-Status: GOOD (  35.30  )
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

Otherwise, everything else is the same, as the KVM emulation
complies with the architecture,so the driver doesn't need
to be modified.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c   | 187 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  67 +++++++
 3 files changed, 255 insertions(+)
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
index 000000000000..9947d3a44304
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-kvm.c
@@ -0,0 +1,187 @@
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
+#include "pkvm/arm-smmu-v3-hyp.h"
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
+					 nr_pages);
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
index 2043c6dc1bdf..d6d1e2d30ef6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
@@ -5203,6 +5204,72 @@ static struct platform_driver arm_smmu_driver = {
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
+ *
+ * That means arm_smmu_device_probe() allocates its devm resources on the
+ * platform device, where they are not freed when the aux device unbinds.
+ * The devres group bounds them to the lifetime of this binding instead.
+ *
+ * The platform device is never unbound, as both drivers set
+ * suppress_bind_attrs and ARM_SMMU_V3_PKVM requires ARM_SMMU_V3=y.
+ */
+static int arm_smmu_device_probe_emu(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
+{
+	struct device *parent = auxdev->dev.parent;
+	void *group;
+	int ret;
+
+	dev_info(&auxdev->dev, "Probing from %s\n", dev_name(parent));
+	group = devres_open_group(parent, NULL, GFP_KERNEL);
+	if (!group)
+		return -ENOMEM;
+
+	ret = arm_smmu_device_probe(to_platform_device(parent));
+	if (ret)
+		devres_release_group(parent, group);
+	else
+		devres_close_group(parent, group);
+	return ret;
+}
+
+static void arm_smmu_device_remove_emu(struct auxiliary_device *auxdev)
+{
+	arm_smmu_device_remove(to_platform_device(auxdev->dev.parent));
+}
+
+static void arm_smmu_device_shutdown_emu(struct auxiliary_device *auxdev)
+{
+	arm_smmu_device_shutdown(to_platform_device(auxdev->dev.parent));
+}
+
+static const struct auxiliary_device_id arm_smmu_aux_table[] = {
+	{ .name = "protected_kvm.smmu_v3_emu" },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, arm_smmu_aux_table);
+
+static struct auxiliary_driver arm_smmu_driver_emu = {
+	.driver = {
+		.suppress_bind_attrs = true,
+	},
+	.name = "arm-smmu-v3-emu",
+	.id_table = arm_smmu_aux_table,
+	.probe = arm_smmu_device_probe_emu,
+	.remove = arm_smmu_device_remove_emu,
+	.shutdown = arm_smmu_device_shutdown_emu,
+};
+
+module_auxiliary_driver(arm_smmu_driver_emu);
+#endif
+
 MODULE_DESCRIPTION("IOMMU API for ARM architected SMMUv3 implementations");
 MODULE_AUTHOR("Will Deacon <will@kernel.org>");
 MODULE_ALIAS("platform:arm-smmu-v3");
-- 
2.55.0.1082.g2b9226bbc0-goog


