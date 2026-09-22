Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16389C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8srb9JROZiTs+JP8OWXShbxiJ2Ux4ZLOqIdBK2bxck=; b=na894X3FZ95wQim8TguQQPqBgh
	J/mFHYtymRZelH6e6ZNyzKXOmxtpeK2CpyjTvZbEp03knKBeM5lngqXqBRDtoCIdbAuJWcJ0GCzsl
	zmvQsdQAeYuLNSbNh+pqEJMfbYGhXqMDHEAmvWDLPxNnDzzBI6GgW3Js4IbDsIMc5kNASvKgcKalD
	0irS7yEU9uihvlg/hILXFcjKzw7f1Baqp2qiWJxskDi4QX85inbFLSftTjtx5joHObqmd8M5+4JG4
	g3yl+5K2YRwahhD50UIEL5VUtTrn6uVC2InUSRX0EVQQIZ5nyL8NIe/eEivx95bryYYtk2OUvfnOF
	jyV93pFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Je-00000005SZa-0njr;
	Tue, 22 Sep 2026 13:13:46 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JA-00000005SBV-3JP2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:18 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-490a767c7dcso31188415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082795; x=1790687595; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8srb9JROZiTs+JP8OWXShbxiJ2Ux4ZLOqIdBK2bxck=;
        b=LhM1qp7nROxP0siYapjRx9kuqINaRK0FiwJrWFmJKotlHKP2eZQcUTrruWIdVioUxC
         ujNBgPzrkUojs/H8ljLVvsVwcZ0FKlU1sA0V61UWb1WKLsPLsuUX534kYXQFWpo7o6kJ
         mJwVwYkw/47wwLhN7Tl+ROZMaZBZku2JJKWv0RIuboHFIAW+gc+QcRMMVcN3Oa2zndlG
         wlIAwy7ArLMGS9dUa74TaNUNlEIbpUdZ5oBq8mu9NZ/YUf2TZU1LP3UVhHVxWu442sPS
         wGefuhIjDLQS9+zmNkZoB31yYwYA0oMTbVWsB46jDRbbPqMMA5YKNiocMMzpPAYKF3qf
         2hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082795; x=1790687595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8srb9JROZiTs+JP8OWXShbxiJ2Ux4ZLOqIdBK2bxck=;
        b=AmOj3+sv+y1Xy4MeTqmuQ6fEH6QH/OYc68rg9REtnfr66uws+Xv50T1OklVtK2hQKd
         3juiG6Ii413LzXkWAxmoNdlFM+rzG7jbsQ22M3nK+PdyU2bg+yr4xlxbaPNpsAa7RxZF
         XQttPJQuHzfmSH0ULWdee8LcQI0+0VkHqPEMAlAMFZZ7FDjJZbfT0ZJtpjvflMfiR6tu
         uP5ppOxiUDCOf4r9i+OumtsXMoEBD93GyL5tr46F8vHHVdVDgQbhFCAY04uyLo9+bdP2
         hKqc5xd/vIj4UidsLQ8HmnasoChEUmrZkhR+OyaLBVhwedqZJHZEeWsv2NJWF7auBoD6
         ru3Q==
X-Gm-Message-State: AFuF++kU+otKIsaKbI81T6KiOOCOP7TBUEsVwsGM3JPWJ5iUQ6QZp8ZY
	b1fmdrkDEPUk2vVI+HP/Yv5CBJ2dUtifD6Ctc6rk7HJjaVrB6fb4LCmUWq1AalOMhrEYhW23uI/
	/Q1jsVEdg+j9x9VqhU3fLFMBixIc+SfJSck3zb9WGGv8VH7zmL1r8oQeu2pzzbunmGHucn0IZvK
	UKCZbjk3sYf6iOeO5QWfX6jWQo7oQwxlM7Rtu4tPAUUhWAqxW3XY3FaPmCLRXh/e5wxA==
X-Received: from wmsm35.prod.google.com ([2002:a05:600c:3b23:b0:49e:6cae:132])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0a:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49fc5724061mr172422615e9.14.1790082794394;
 Tue, 22 Sep 2026 06:13:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:43 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-11-smostafa@google.com>
Subject: [PATCH v8 10/25] iommu/arm-smmu-v3-kvm: Add SMMUv3 driver
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_061316_875289_BE6879DF 
X-CRM114-Status: GOOD (  26.00  )
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

Add the skeleton for an Arm SMMUv3 driver at EL2.

The driver rely on an array of SMMUv3s on the system, where at
init it will donate the array and the resources of the SMMUv3s
so they can't be changed by the host after de-privilege.

This array will be populated in the next patch.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  5 +
 drivers/iommu/arm/Kconfig                     | 12 +++
 .../arm/arm-smmu-v3/arm-smmu-v3-common-lib.h  |  4 +
 .../arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h    | 31 +++++++
 .../iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c  | 91 +++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 7cb79db9bc47..aa76c0f3f147 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -33,6 +33,11 @@ hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
 hyp-obj-$(CONFIG_NVHE_EL2_TRACING) += clock.o trace.o events.o
 hyp-obj-y += $(lib-objs)
 
+HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
+
+hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
 
diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index 5fac08b89dee..fdbed6a51224 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -141,3 +141,15 @@ config QCOM_IOMMU
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
+
+config ARM_SMMU_V3_PKVM
+	bool "ARM SMMUv3 support for protected Virtual Machines"
+	depends on KVM && ARM_SMMU_V3=y
+	help
+	  Enable a SMMUv3 driver in the KVM hypervisor, to protect VMs against
+	  memory accesses from devices owned by the host.
+	  This works along side ARM_SMMU_V3 where the kernel driver manages the
+	  stage-1 of the SMMUv3, and the hypervisor driver will manage the
+	  stage-2 transparently through trap and emulate.
+
+	  Say Y here if you intend to enable KVM in protected mode.
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
index 9a7064c8e879..3a9d72988942 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-common-lib.h
@@ -15,6 +15,10 @@
  */
 #ifndef __KVM_NVHE_HYPERVISOR__
 typedef struct arm_smmu_device ARM_SMMU_OBJ;
+#else
+#include "pkvm/arm-smmu-v3-hyp.h"
+
+typedef struct hyp_arm_smmu_v3_device ARM_SMMU_OBJ;
 #endif
 
 static_assert(__same_type(typeof_member(ARM_SMMU_OBJ, features), u32));
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
new file mode 100644
index 000000000000..17b9454dab85
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3-hyp.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_ARM_SMMU_V3_HYP_H
+#define __KVM_ARM_SMMU_V3_HYP_H
+
+#include <asm/kvm_asm.h>
+
+/*
+ * Parameters from the trusted host:
+ * @mmio_addr		base address of the SMMU registers
+ * @mmio_size		size of the registers resource
+ *
+ * Other members are filled and used at runtime by the SMMU driver.
+ * @base		Virtual address of SMMU registers
+ */
+struct hyp_arm_smmu_v3_device {
+	phys_addr_t		mmio_addr;
+	size_t			mmio_size;
+	void __iomem		*base;
+	u32			features;
+	u32			options;
+	unsigned long		oas;
+	unsigned long		pgsize_bitmap;
+};
+
+extern size_t kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count);
+#define kvm_hyp_arm_smmu_v3_count kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_count)
+
+extern struct hyp_arm_smmu_v3_device *kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus);
+#define kvm_hyp_arm_smmu_v3_smmus kvm_nvhe_sym(kvm_hyp_arm_smmu_v3_smmus)
+
+#endif /* __KVM_ARM_SMMU_V3_HYP_H */
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
new file mode 100644
index 000000000000..7022d38e75c4
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pKVM hyp driver for the Arm SMMUv3
+ *
+ * Copyright (C) 2022 Linaro Ltd.
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
+					    smmu->mmio_size >> PAGE_SHIFT));
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
+/* Called while is the host is still trusted. */
+static int smmu_init(void)
+{
+	size_t smmu_arr_size = PAGE_ALIGN(sizeof(*kvm_hyp_arm_smmu_v3_smmus) *
+					  kvm_hyp_arm_smmu_v3_count);
+	struct hyp_arm_smmu_v3_device *smmu;
+	u64 pfn, nr_pages;
+	int ret;
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
-- 
2.55.0.1082.g2b9226bbc0-goog


