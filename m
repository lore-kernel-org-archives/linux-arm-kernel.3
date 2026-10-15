Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9704BCCA465
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UA46w466axNh+PriFGrOQFaeqWdmA8tYPa6OW//CU8=; b=tSUBrisKhZFuQO1ErR1OE60Eoj
	A7d7mPNCI1FzeSj4Hk5mXBO9d+ZiBvuwT5YhWCDULf+xdjgIBQD4oaTrseu3JN+VmrhSn4kyr3nz7
	9g1rGrPbEp5RGih/kCfXfcvz10Nmv8/kD2z3GFbmxjYxAh5gqKM630ooDtdu4GPlto98NLfvvPKbM
	eM5FZB4j48BN0rjRjR42cPpEwBmbZ1bzGG2hQW25jCiwiVj3tAjEaNOIwIXEogIOXEJWCVkKXgEh0
	9Q5lHOWl+SLRhCbtOEokxGTg3RgcxJE83foVD2/Y9EV+FporTxfxuQwvmZuzxBEFSaFqmICera5vk
	qb4Taxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlj-00000001IM6-3nAi;
	Thu, 15 Oct 2026 20:09:39 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRlV-00000001I5A-0Tcx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:09:26 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a1ad49096fso2458005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 13:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792094963; x=1792699763; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UA46w466axNh+PriFGrOQFaeqWdmA8tYPa6OW//CU8=;
        b=C+iSVi5CPnuvfFg4cYw2toAMqelZd8dAY2T302wtyCZeKS8+NzGYuE5YFgm9t/zNpP
         m0Y83eri7Zp97eVFkT3Ud9fwCYpD17uVw3/R7V1vprt0BabUy0Y2FZZcdOAJmcEUP0la
         IiXo3dzWHvgBWEl5rWtDdSgo2DIe8/k+2Fpb0kXGkuX3J5NCrxFvBKCbJ3rsAMkJ1uKu
         D2q/nSCFld3N6sP986VAhkDRtFMb90OVLaymDUgLvjVvD3rSfYZEQLbOsRkiGCstUY6S
         sj+rD/P0Kz2B5zOnIThc41/6HIpofXwYBU0mm/KDe0MA1bfWxYOpUX0fE52W9CKF4YXJ
         dgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094963; x=1792699763;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8UA46w466axNh+PriFGrOQFaeqWdmA8tYPa6OW//CU8=;
        b=BkBBu28d5HY0ODysPhXJrydcKOdbTNDGDOgDnxDC43SRewQDiN4DDOpCbNn3B1I/xb
         4VyKO9ea0ueqX9D1gKYPn/+sFgBKcV+/7K3OoKEYJvYOdKvSoeaP1x/7lrqG+XJfd2hU
         h2zMbO6wQfqF7uVGVuetJDpTOH6p71aRTEVEUaXkMg4v+RFU3V9PjW0q0nEz49tcXkjL
         rAWE0eCTfyswAsPl392gWrlf3hzmSJhMr1f+Y2gnRqCpHYxH9C1Y/xRkChnMlW1Q9rAk
         CWtp1a4qguDLFUbbrDgLgDIk4di5vyumz79+Xmxkb2Lmw3RUj9Nyf3GAo1wHp+q1mmk7
         JfyA==
X-Gm-Message-State: AFq9FYKkDr3XMMvaOA3QmhxRU3nV85fZ6mV9geC8oU+r7OWFF5nM3czz
	Rtdz+AvzupLdHH6NBbDB7xge4kxd5DBmMh0r9aUtC4AHJCHzldR4CDZhU3ZrpVBGXNTD83OvUwQ
	WWaQdo5lAahyjhqINSLklPS00o1vHYS55A3HdjhVDRzRTmKCcPGckGmf+8Bz2dTxhGmbniUT9o1
	WFvEF9l4mvARIE6HMWLRw1hzDAlPd8BqYbBz9w4XuA2a0gR/KeU3HggWqdVoj75n2tdw==
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:4a1:b6f1:344b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a407:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a1c665f687mr21139025e9.8.1792094962450;
 Thu, 15 Oct 2026 13:09:22 -0700 (PDT)
Date: Thu, 15 Oct 2026 20:08:41 +0000
In-Reply-To: <20261015200903.2735565-1-smostafa@google.com>
Mime-Version: 1.0
References: <20261015200903.2735565-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261015200903.2735565-11-smostafa@google.com>
Subject: [PATCH v9 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	nicolinc@nvidia.com, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_130925_202467_CF107967 
X-CRM114-Status: GOOD (  26.69  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add the skeleton of the Arm SMMUv3 driver at EL2, and build the shared
IDR/STE code and lib/hweight.o into the hypervisor.

The kernel driver, added next, fills an array describing the SMMUv3s in
the system and hands it to the hypervisor. At init the hypervisor takes
ownership of the array and of the SMMU MMIO regions, so the host cannot
change either after de-privilege.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  5 +
 drivers/iommu/arm/Kconfig                     | 12 +++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |  7 ++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c    | 96 +++++++++++++++++++
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    | 41 ++++++++
 5 files changed, 161 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 7cb79db9bc47..ee86e4b3436f 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -33,6 +33,11 @@ hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
 hyp-obj-y += $(lib-objs)
 
+HYP_SMMU_V3_DRV_PATH := ../../../../../drivers/iommu/arm/arm-smmu-v3
+
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3-hyp.o \
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
 
diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index 5fac08b89dee..82fbc729563e 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -128,6 +128,18 @@ config TEGRA241_CMDQV
 
 	  Say Y here if your system is NVIDIA Tegra241 (Grace) or it has the same
 	  CMDQ-V extension.
+
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM_SMMU_V3=y && OF
+	help
+	  Enable SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+	  This works alongside ARM_SMMU_V3 where the kernel driver manages the
+	  SMMUv3 stage-1, and the hypervisor driver manages the stage-2
+	  transparently through trap and emulate.
+
+	  Say Y here if you intend to enable KVM in protected mode.
 endif
 
 config QCOM_IOMMU
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
index 9f6949a60fe8..74b6c05b8f8f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
@@ -20,6 +20,13 @@ typedef struct arm_smmu_device ARM_SMMU_OBJ;
 
 #define arm_smmu_err(smmu, fmt, ...)	dev_err((smmu)->dev, fmt, ##__VA_ARGS__)
 #define arm_smmu_info(smmu, fmt, ...)	dev_info((smmu)->dev, fmt, ##__VA_ARGS__)
+#else
+#include "pkvm/arm-smmu-v3-hyp.h"
+
+typedef struct hyp_arm_smmu_v3_device ARM_SMMU_OBJ;
+
+#define arm_smmu_err(smmu, fmt, ...)
+#define arm_smmu_info(smmu, fmt, ...)
 #endif
 
 static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
new file mode 100644
index 000000000000..ba209951039f
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM hyp driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ * Copyright (C) 2025 Google LLC
+ */
+#include <asm/kvm_hyp.h>
+
+#include <nvhe/iommu.h>
+#include <nvhe/mem_protect.h>
+
+#include "arm-smmu-v3-hyp.h"
+#include "../arm-smmu-v3.h"
+#include "../arm-smmu-v3-common-lib.h"
+
+size_t __ro_after_init kvm_hyp_arm_smmu_v3_count;
+struct hyp_arm_smmu_v3_device *kvm_hyp_arm_smmu_v3_smmus;
+
+#define for_each_smmu(smmu) \
+	for ((smmu) = kvm_hyp_arm_smmu_v3_smmus; \
+	     (smmu) != &kvm_hyp_arm_smmu_v3_smmus[kvm_hyp_arm_smmu_v3_count]; \
+	     (smmu)++)
+
+/* Put the device in a state that can be probed by the host driver. */
+static void smmu_deinit_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	WARN_ON(__pkvm_hyp_donate_host_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
+					    smmu->mmio_size >> PAGE_SHIFT,
+					    (unsigned long)smmu->base));
+	smmu->base = NULL;
+}
+
+static int smmu_init_device(struct hyp_arm_smmu_v3_device *smmu)
+{
+	unsigned long haddr;
+	int ret;
+
+	if (!PAGE_ALIGNED(smmu->mmio_addr | smmu->mmio_size))
+		return -EINVAL;
+
+	ret = __pkvm_host_donate_hyp_mmio(hyp_phys_to_pfn(smmu->mmio_addr),
+					  smmu->mmio_size >> PAGE_SHIFT, &haddr);
+	if (ret)
+		return ret;
+
+	smmu->base = (void __iomem *)haddr;
+
+	return 0;
+}
+
+/* Called while the host is still trusted. */
+static int smmu_init(void)
+{
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+	struct hyp_arm_smmu_v3_device *smmu;
+	u64 pfn, nr_pages;
+	int ret;
+
+	if (!PAGE_ALIGNED(kvm_hyp_arm_smmu_v3_smmus))
+		return -EINVAL;
+
+	kvm_hyp_arm_smmu_v3_smmus = kern_hyp_va(kvm_hyp_arm_smmu_v3_smmus);
+	pfn = hyp_virt_to_pfn(kvm_hyp_arm_smmu_v3_smmus);
+	nr_pages = smmu_arr_size >> PAGE_SHIFT;
+
+	ret = __pkvm_host_donate_hyp(pfn, nr_pages);
+	if (ret)
+		return ret;
+
+	for_each_smmu(smmu) {
+		ret = smmu_init_device(smmu);
+		if (ret)
+			goto out_reclaim_smmu;
+	}
+
+	return 0;
+
+out_reclaim_smmu:
+	while (smmu != kvm_hyp_arm_smmu_v3_smmus)
+		smmu_deinit_device(--smmu);
+	WARN_ON(__pkvm_hyp_donate_host(pfn, nr_pages));
+	return ret;
+}
+
+static int smmu_host_stage2_idmap(phys_addr_t start, phys_addr_t end, int prot)
+{
+	return 0;
+}
+
+/* Shared with the kernel driver in EL1 */
+struct pkvm_iommu_ops smmu_ops = {
+	.init				= smmu_init,
+	.host_stage2_idmap		= smmu_host_stage2_idmap,
+};
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
new file mode 100644
index 000000000000..c2630397f57a
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_ARM_SMMU_V3_HYP_H
+#define __KVM_ARM_SMMU_V3_HYP_H
+
+#include <asm/kvm_asm.h>
+
+/**
+ * struct hyp_arm_smmu_v3_device - SMMUv3 instance owned by the hypervisor
+ * @mmio_addr:		Physical address of the SMMU registers
+ * @mmio_size:		Size of the register region
+ * @base:		Hypervisor virtual address of the registers
+ * @features:		ARM_SMMU_FEAT_* bits
+ * @options:		ARM_SMMU_OPT_* bits
+ * @oas:		Output address size
+ * @pgsize_bitmap:	Supported page sizes
+ * @sid_bits:		Number of StreamID bits
+ *
+ * @mmio_addr, @mmio_size and ARM_SMMU_FEAT_COHERENCY are filled by the host
+ * before de-privilege, the rest by the hypervisor driver.
+ */
+struct hyp_arm_smmu_v3_device {
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+	void __iomem		*base;
+	u32			features;
+	u32			options;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+	unsigned int		sid_bits;
+};
+
+extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
+#define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
+
+extern struct hyp_arm_smmu_v3_device *kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus);
+#define kvm_hyp_arm_smmu_v3_smmus kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus)
+
+struct pkvm_iommu_ops;
+extern struct pkvm_iommu_ops kvm_nvhe_sym(smmu_ops);
+
+#endif /* __KVM_ARM_SMMU_V3_HYP_H */
-- 
2.56.0.176.g3575e65682-goog


