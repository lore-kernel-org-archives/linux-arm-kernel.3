Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ACBCCA465
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ln7kKe9smd/hPeerr96XakAp8DXZ4YEDMpg01bk0tQ=; b=nNiMmPdy7ZZmLTtB7DeyUBC1xo
	bXKUZ1Ivn2lLwJdeCGv5FkONrhjyFLnu8nijSQ0/GquLolE6wLDCLOzj0JJbVCgCF70wjrjTbXHOA
	Pg+Jq3YqBCKtenMQHbmJWj9ZPmcqTJ8D0Xj58WiZO/rSNPRbgMIOaDxcpu53RaCSQGUsWp6hii0bZ
	i9gksHsKtpIInmW1yGmtEI8gifQ2cEnEqJbJQUwz3x2YjKFTXgj8bNw1SdotSYTZjhbiuA6MU4V/7
	1lP4lZfUOBMMgVDUd3qH5MWBueUYN6Mz+ptYAHRiNlHQbQrxQJuWuxvu6FGP04Cj/B9+yhCe4Iz0w
	l5ncNNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlk-00000001IN3-1fiL;
	Thu, 15 Oct 2026 20:09:40 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlW-00000001I6c-1Cfl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:27 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6b1d43907c2so4368514a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094964; x=1792699764; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ln7kKe9smd/hPeerr96XakAp8DXZ4YEDMpg01bk0tQ=;
        b=EIBRsox/R2d/lVYYhgxVSV7qRIWMUM8LG1Q441cTz8ai53vE6pNWscBHCFkMxr1PlY
         QxKq2ua8Cu+UpGuu8v8MAP2mf8Nx3oERxHiOh2F1KDiAN5NbkKgOv7XtkB3xLIfDaxcn
         RkBK9sJfA/DxQur9fnZzcKjy/UOJfgho5Esr6E939lsMPZ8xRgHiIgKovaJfZD0GW5Lm
         6hjWkznbP/DdydJCd2aG2bWVPTkdPBy20qdRu6mmVMVuHL2KKVI3L0ykyb3rTTGRkExZ
         inmCTiMcGL5OBtkCk1fl2Gmp5pmr2GP8S1J/vrkAjsfvNycTJ+zIjrTbJX1NJOPkFnSL
         7wLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094964; x=1792699764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ln7kKe9smd/hPeerr96XakAp8DXZ4YEDMpg01bk0tQ=;
        b=HJjOiVq+bF0n4GBmIaofDp9VSwQRwKvXUV+qRnx5aO7LM5emCuSdero69EP13D5kSK
         WYtbLj6oYou3EBIeMm/oBCBwBa57UXovUel0UD6RGYVVS3Ur8oNF92JFF/voNGUadOBV
         Xoa09zmH4IKd9DY74kaEnTyhc6WdwZJqRF96mYuAYmrF3D9LXh6cK6LTlBmlSuFiPO6J
         orn4tlKEIT0gT4rN1AI7snda6Do4noMmE11F4UPy6T4fIViRd1quw2vuZluUuNs7shXZ
         g6MLdSBEflV9DHTo2mXyMk2lA7ukizC8Rzu1ohvXIDCFvsRDUoa7OkO4zyVkIkCE/dV+
         of7g==
X-Gm-Message-State: AFq9FYK7h4xN6oJh6SkFddik3/CHJRILLnZuwwEklKccryn7qI1ovZBi
	ntp5oKfzb4Ke3awrb/h8AS8DmZlyUx3h49oG7cXmTG/DOhTjgNbldR8IeJlquFUQK0/1T7Wgn+x
	fnfp5WZC3vgyAOftZ0+ppYLyM2EjcHDwMPhOIzAk/qQ1SGWpnkfXY77qPX+7L0tOAAgGNsENit1
	GEqdV5WNr5uN+9PpcNNpxiUMehmDeJ67UCj/PJTBg9c8K45k2l/GrtSt8vuvcAE0xPCw==
X-Received: from edcnu6-n2.prod.google.com ([2002:a05:6402:c506:20b0:6b1:c3e6:d08])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2744:b0:6b1:ba86:5f48 with SMTP id 4fb4d7f45d1cf-6b38032f753mr1614433a12.36.1792094963468;
 Thu, 15 Oct 2026 13:09:23 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:42 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-12-smostafa@google.com>
Subject: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130926_394976_3AA5722D 
X-CRM114-Status: GOOD (  32.21  )
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

When KVM runs in protected mode with CONFIG_ARM_SMMU_V3_PKVM, the
hypervisor owns the SMMUv3 hardware and presents emulated SMMUs to the
host through trap and emulate.

Add the host side of the driver. At subsys_initcall, before the
hypervisor is initialised, it claims the "arm,smmu-v3" platform devices,
records their MMIO regions in an array handed to the hypervisor, and
registers the hypervisor ops with pKVM, requesting a page table pool
the size of the host stage-2 one. After KVM initialises, it creates an
auxiliary device for each SMMU. The SMMUv3 driver probes those through
a small auxiliary driver that keeps using the platform device for the
DMA API, IRQs and devres. The emulation complies with the architecture,
so the rest of the driver is unchanged.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 .../arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c   | 183 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  65 +++++++
 3 files changed, 249 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c

diff --git a/drivers/iommu/arm/arm-smmu-v3/Makefile b/drivers/iommu/arm/arm-smmu-v3/Makefile
index c9ce392e6d31..b782d1fda5fd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/Makefile
+++ b/drivers/iommu/arm/arm-smmu-v3/Makefile
@@ -4,5 +4,6 @@ arm_smmu_v3-y := arm-smmu-v3.o arm-smmu-v3-common-lib.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_IOMMUFD) += arm-smmu-v3-iommufd.o
 arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_SVA) += arm-smmu-v3-sva.o
 arm_smmu_v3-$(CONFIG_TEGRA241_CMDQV) += tegra241-cmdqv.o
+arm_smmu_v3-$(CONFIG_ARM_SMMU_V3_PKVM) += arm-smmu-v3-pkvm-init.o
 
 obj-$(CONFIG_ARM_SMMU_V3_KUNIT_TEST) += arm-smmu-v3-test.o
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
new file mode 100644
index 000000000000..5c5f0ff455e3
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-pkvm-init.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM host driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ * Copyright (C) 2025 Google LLC
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
+static size_t kvm_arm_smmu_count;
+static struct hyp_arm_smmu_v3_device *kvm_arm_smmu_array;
+static size_t kvm_arm_smmu_cur;
+
+static void __init kvm_arm_smmu_array_free(void)
+{
+	int order;
+
+	order = get_order(kvm_arm_smmu_count * sizeof(*kvm_arm_smmu_array));
+	free_pages((unsigned long)kvm_arm_smmu_array, order);
+}
+
+static int __init kvm_arm_smmu_array_alloc(void)
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
+static unsigned int __init smmu_hyp_pgt_pages(void)
+{
+	struct device_node *np = of_find_compatible_node(NULL, NULL, "arm,smmu-v3");
+
+	if (!np)
+		return 0;
+	of_node_put(np);
+
+	/*
+	 * Minimum for mirroring the host stage-2 at page granularity. The pool
+	 * itself is sized by kvm-arm.iommu_pgt_mem, which must also cover the
+	 * stream tables.
+	 */
+	return host_s2_pgtable_pages();
+}
+
+static struct platform_driver smmuv3_nesting_driver;
+static int __init smmuv3_nesting_probe(struct platform_device *pdev)
+{
+	struct hyp_arm_smmu_v3_device *smmu;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+
+	/* Only device tree, ACPI not supported. */
+	if (!dev->of_node)
+		return -EINVAL;
+
+	if (WARN_ON(kvm_arm_smmu_cur >= kvm_arm_smmu_count))
+		return -ENOSPC;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	if (of_property_read_bool(dev->of_node, "cavium,cn9900-broken-page1-regspace")) {
+		dev_err(dev, "cavium,cn9900-broken-page1-regspace is not supported\n");
+		return -EINVAL;
+	}
+
+	if (resource_size(res) < SZ_128K ||
+	    !PAGE_ALIGNED(res->start | resource_size(res))) {
+		dev_err(dev, "unsupported MMIO region %pr\n", res);
+		return -EINVAL;
+	}
+
+	smmu = &kvm_arm_smmu_array[kvm_arm_smmu_cur];
+	smmu->mmio_addr = res->start;
+	smmu->mmio_size = resource_size(res);
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
+	ret = pkvm_iommu_register_driver(&kvm_nvhe_sym(smmu_ops), nr_pages);
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
+}
+
+static int __init smmu_create_aux_device(struct device *dev, void *data)
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
+static int __init kvm_arm_smmu_v3_post_init(void)
+{
+	if (!kvm_arm_smmu_count)
+		return 0;
+
+	/*
+	 * If KVM failed to initialise, the host stage-2 is never enabled and
+	 * the SMMUs are driven natively through the same path.
+	 */
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
index c2ec33c763a0..66f38c54742b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
@@ -5264,6 +5265,70 @@ static struct platform_driver arm_smmu_driver = {
 module_driver(arm_smmu_driver, platform_driver_register,
 	      arm_smmu_driver_unregister);
 
+#ifdef CONFIG_ARM_SMMU_V3_PKVM
+/*
+ * Two devices are involved: the aux device bound to this driver, and the
+ * physical platform device bound to the pKVM init driver, which only uses it
+ * for discovery. This driver keeps using the platform device, as it carries
+ * the fwnode the IOMMU core and consumers link to, the DMA configuration and
+ * the IRQs.
+ *
+ * So arm_smmu_device_probe() allocates its devm resources on the platform
+ * device, where an aux unbind would not free them. The devres group releases
+ * them if the probe fails, so a deferred probe can retry. The platform device
+ * is never unbound: both drivers set suppress_bind_attrs and
+ * ARM_SMMU_V3_PKVM requires ARM_SMMU_V3=y.
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
2.56.0.176.g3575e65682-goog


