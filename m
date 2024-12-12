Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ECBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7kpsgAhVH2bN/fIbcV7TDao/OohnNe7nMaqWp62Lyo=; b=MuocGGM2POP/0ahRE5N5+kRFNR
	TYmW8L70AvTN2y4qCo6s+0EmwRidHK9zonqPYBltCX0Xtac4vRqfdORq34j0P3KfXjDXRgANE86sE
	U33Wy81en9L1x0SSrjuCwoW+F5xJwV5ACe1HQTtFGYAHngQu63t6fUl4Q/ZSloEoLwwmdtxmhBWH/
	WjHYJ+XVxdLzu08b+oi1WwZ8BDp/iDsKeZYBQ1iWf2xMNn6/Ru+ylygKDv3322d3QhiWG0BdiuPwR
	BFM8J9WMeacHhjFWk+fNdj274Mv+KS+r6yGpjytsj7QRt0hQRNlzWpu7oDWIYYGHWRbQl4RjMmlzo
	MF8S9kVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnuX-00000001Q6c-1V80;
	Thu, 12 Dec 2024 18:27:41 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnZ0-00000001JjM-3vjx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so8396165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026725; x=1734631525; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7kpsgAhVH2bN/fIbcV7TDao/OohnNe7nMaqWp62Lyo=;
        b=MccFNy99vFPhiYkWByhs/RtbCei9SLWNfF+Gjf/18Pep+/y22fDeUdSj4Y3ADThJcq
         Muk49Kxe6n2gBBnOCy6GJci/+XcKsea/V/f1VZ3zneDqVu8emguBfyGukGpJBrXfxHsR
         ThqyeqsEueS+GgFEyh+Jx7zt/WUv0InKAq5nF15I9sfHwZofFJ2GupjdQXZQbQ5fTjOv
         Cd10wt0k9V/68qeiNwVovIckIoyEXRSQ8n8PCaIs5ohBA/JreWR0kuVyrijfRmkNGr9m
         Gsg2cvNThcfuVO1hO4B1+WXZeH5Ea5WueKHBKseqoj0Pt/Tpr0DPHBKmVi4rL7FSZqyT
         CJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026725; x=1734631525;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7kpsgAhVH2bN/fIbcV7TDao/OohnNe7nMaqWp62Lyo=;
        b=VfP2GXCJ3g2glypqd+nTDNiLjbDhRQeBmugKKMhtS43X57hvgSjNMg1uz17xTfThYe
         fF5swuHo860PqlQQAVdUu5JYiBgmNYg4qKK/rrPmOvflbMXldBblPtKVJM33gpZBzYsn
         kQfl+X9itJKfOBrA9KkDWiGGgLgPwEpvcgZdcjlXPl2xcBm60IAASu+CO8pdQ5h8JzG9
         n9yPXK/e7qwlGG5e3v7wIvX3GPL6xAlvhB4m0Lf6yxa5dK3SURRBT29qQyKEe7rZM1hL
         yGhuSNo76ZfBzaUMPDnb+1o48hazneFyBwUer/CLt6/at08Jy3rPz+WicchvMK8NQE0Y
         bqtg==
X-Forwarded-Encrypted: i=1; AJvYcCU9FJEZqSxq3JXNlnqsI2LVGvzQccaZpX8OYWq5xXYp/RsFErztckVjkEBTY5/NjOlUc7FuW7/srQojV78NzRJy@lists.infradead.org
X-Gm-Message-State: AOJu0YzFtSIZm79yMN7Q9Bvk2OIE5f5QwgxU43k/CcJS7aAk4yaFDvyT
	48ffLv4UoeGW/Fjdl1JMI1AuecV8972rZg1E5pXcVuvx9E7k65GrG4d/JXTvWnv7rKRdcRCSwFd
	an61yramRTw==
X-Google-Smtp-Source: AGHT+IF25HMr2bpcyIuNUAnWweDO42iRimcWzqAUfJd/l3fGaSIRxPPS2WBm0GYXtXtdeE6P3qMiQCbNAneVug==
X-Received: from wmpr23.prod.google.com ([2002:a05:600c:3217:b0:434:f5f3:3314])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c9:b0:434:e9ee:c2d with SMTP id 5b1f17b1804b1-4361c401531mr58358885e9.26.1734026725379;
 Thu, 12 Dec 2024 10:05:25 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:44 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-21-smostafa@google.com>
Subject: [RFC PATCH v2 20/58] KVM: arm64: Support power domains
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100526_975752_8BA24CBD 
X-CRM114-Status: GOOD (  24.24  )
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

Unfortunately, as power management is not widely standardized we have
to work around that.

One implementation we can support is HOST_HVC, where the host
is in control of the power management and it notifies the
hypervisor about the updates.

This adds extra constraints to the IOMMUs, as they must reset to
blocking DMA traffic to be able to use this PD interface.

Unfortunately again, for SMMUv3 which is the only IOMMU currently
supported, there is no architectural way to discover this, so we
rely on enabling this driver when it fits the constraints, also
the driver sets GBPA and assumes that the SMMU retains across
power cycling.

In the next patch SCMI support is added.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/kvm_asm.h       |  1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h | 30 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/Makefile       |  2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  9 +++++
 arch/arm64/kvm/hyp/nvhe/power/hvc.c    | 47 ++++++++++++++++++++++++++
 include/kvm/power_domain.h             | 17 ++++++++++
 6 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kvm/hyp/nvhe/power/hvc.c
 create mode 100644 include/kvm/power_domain.h

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 9ea155a04332..3dbf30cd10f3 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -114,6 +114,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_map_pages,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_unmap_pages,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_iommu_iova_to_phys,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_hvc_pd,
 
 	/*
 	 * Start of the dynamically registered hypercalls. Start a bit
diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 8a5554615e40..e4a94696b10e 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -8,6 +8,7 @@
 #define __ARM64_KVM_NVHE_PKVM_H__
 
 #include <asm/kvm_pkvm.h>
+#include <kvm/power_domain.h>
 
 #include <nvhe/gfp.h>
 #include <nvhe/spinlock.h>
@@ -146,4 +147,33 @@ void pkvm_poison_pvmfw_pages(void);
 int pkvm_timer_init(void);
 void pkvm_udelay(unsigned long usecs);
 
+#define MAX_POWER_DOMAINS		32
+
+struct kvm_power_domain_ops {
+	int (*power_on)(struct kvm_power_domain *pd);
+	int (*power_off)(struct kvm_power_domain *pd);
+};
+
+int pkvm_init_hvc_pd(struct kvm_power_domain *pd,
+		     const struct kvm_power_domain_ops *ops);
+
+int pkvm_host_hvc_pd(u64 device_id, u64 on);
+
+/*
+ * Register a power domain. When the hypervisor catches power requests from the
+ * host for this power domain, it calls the power ops with @pd as argument.
+ */
+static inline int pkvm_init_power_domain(struct kvm_power_domain *pd,
+					 const struct kvm_power_domain_ops *ops)
+{
+	switch (pd->type) {
+	case KVM_POWER_DOMAIN_NONE:
+		return 0;
+	case KVM_POWER_DOMAIN_HOST_HVC:
+		return pkvm_init_hvc_pd(pd, ops);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index 9e1b74c661d2..950d34ba6e50 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -8,7 +8,7 @@ CFLAGS_switch.nvhe.o += -Wno-override-init
 hyp-obj-y := timer-sr.o sysreg-sr.o debug-sr.o switch.o tlb.o hyp-init.o host.o \
 	 hyp-main.o hyp-smp.o psci-relay.o alloc.o early_alloc.o page_alloc.o \
 	 cache.o setup.o mm.o mem_protect.o sys_regs.o pkvm.o stacktrace.o ffa.o \
-	 serial.o alloc_mgt.o iommu/iommu.o
+	 serial.o alloc_mgt.o iommu/iommu.o power/hvc.o
 hyp-obj-y += ../vgic-v3-sr.o ../aarch32.o ../vgic-v2-cpuif-proxy.o ../entry.o \
 	 ../fpsimd.o ../hyp-entry.o ../exception.o ../pgtable.o
 hyp-obj-$(CONFIG_LIST_HARDENED) += list_debug.o
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9b224842c487..5df98bf04ef4 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -1674,6 +1674,14 @@ static void handle___pkvm_host_iommu_iova_to_phys(struct kvm_cpu_context *host_c
 	cpu_reg(host_ctxt, 1) = kvm_iommu_iova_to_phys(domain, iova);
 }
 
+static void handle___pkvm_host_hvc_pd(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, device_id, host_ctxt, 1);
+	DECLARE_REG(u64, on, host_ctxt, 2);
+
+	cpu_reg(host_ctxt, 1) = pkvm_host_hvc_pd(device_id, on);
+}
+
 typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 #define HANDLE_FUNC(x)	[__KVM_HOST_SMCCC_FUNC_##x] = (hcall_t)handle_##x
@@ -1738,6 +1746,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_iommu_map_pages),
 	HANDLE_FUNC(__pkvm_host_iommu_unmap_pages),
 	HANDLE_FUNC(__pkvm_host_iommu_iova_to_phys),
+	HANDLE_FUNC(__pkvm_host_hvc_pd),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/hyp/nvhe/power/hvc.c b/arch/arm64/kvm/hyp/nvhe/power/hvc.c
new file mode 100644
index 000000000000..f4d811847e73
--- /dev/null
+++ b/arch/arm64/kvm/hyp/nvhe/power/hvc.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Google LLC
+ * Author: Mostafa Saleh <smostafa@google.com>
+ */
+
+#include <nvhe/pkvm.h>
+
+struct hvc_power_domain {
+	struct kvm_power_domain			*pd;
+	const struct kvm_power_domain_ops	*ops;
+};
+
+struct hvc_power_domain handlers[MAX_POWER_DOMAINS];
+
+int pkvm_init_hvc_pd(struct kvm_power_domain *pd,
+		     const struct kvm_power_domain_ops *ops)
+{
+	if (pd->device_id >= MAX_POWER_DOMAINS)
+		return -E2BIG;
+
+	handlers[pd->device_id].ops = ops;
+	handlers[pd->device_id].pd = pd;
+
+	return 0;
+}
+
+int pkvm_host_hvc_pd(u64 device_id, u64 on)
+{
+	struct hvc_power_domain *pd;
+
+	if (device_id >= MAX_POWER_DOMAINS)
+		return -E2BIG;
+
+	device_id = array_index_nospec(device_id, MAX_POWER_DOMAINS);
+	pd = &handlers[device_id];
+
+	if (!pd->ops)
+		return -ENOENT;
+
+	if (on)
+		pd->ops->power_on(pd->pd);
+	else
+		pd->ops->power_off(pd->pd);
+
+	return 0;
+}
diff --git a/include/kvm/power_domain.h b/include/kvm/power_domain.h
new file mode 100644
index 000000000000..f6a9c5cdfebb
--- /dev/null
+++ b/include/kvm/power_domain.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_POWER_DOMAIN_H
+#define __KVM_POWER_DOMAIN_H
+
+enum kvm_power_domain_type {
+	KVM_POWER_DOMAIN_NONE,
+	KVM_POWER_DOMAIN_HOST_HVC,
+};
+
+struct kvm_power_domain {
+	enum kvm_power_domain_type	type;
+	union {
+		u64 device_id; /* HOST_HVC device ID*/
+	};
+};
+
+#endif /* __KVM_POWER_DOMAIN_H */
-- 
2.47.0.338.g60cca15819-goog


