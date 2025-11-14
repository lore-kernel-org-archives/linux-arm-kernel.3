Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD78CE8D50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rc2TnrHXHZiGbCsxPYxVucAkzwI4G42BiHenIKnV+cg=; b=FhTJZWL4bIJFGsMSifrRO0dWT9
	1XWr82gIxJ4I9gWSSYp2uktsdCAJi/xVFuqrRNj+lftkHPW8hkF/fpBZ2R6W9ciXiXGEmcYyZeq10
	Vj7dOoVjvUNWe+7X2QfgvAckVpp7niYUspflrPNCGXYhXe/BPxenLO5lQCu26IFtEq5R32UIVgqr1
	bVIdJPrCC/8k+Ks+8ea1xz5jppepzm8aDeihecrWHbOCbXrQHTMSVzPBItP3jSzXPPIDHvXwhbQcO
	eg0bkYRkaWZkeZ8hAP/J6BIAKvoqfGOkETzkAWA+h2qoZ8eVwCgwG1EmXxNdTBCE0FrHeeVxIEsjs
	AYIiAdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwL1-0000000Cf2g-11fi;
	Fri, 14 Nov 2025 16:07:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKx-0000000Cezx-16xt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:07:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3868819F6;
	Fri, 14 Nov 2025 08:07:39 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0A9D3F5A1;
	Fri, 14 Nov 2025 08:07:44 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 05/35] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Date: Fri, 14 Nov 2025 16:06:46 +0000
Message-ID: <20251114160717.163230-6-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080747_384373_FC1F3D72 
X-CRM114-Status: GOOD (  19.51  )
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

Add the SPE capability that will be used by userspace to test if KVM
supports SPE virtualization.

The SPE driver supports heterogenous systems. Keep track of all the
available Statistical Profiling Units (SPUs) in the system, because KVM
will require the user to associate a VM with exactly one SPU.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/virt/kvm/api.rst   | 10 +++++++++
 arch/arm64/include/asm/kvm_spe.h | 20 +++++++++++++++++
 arch/arm64/kvm/Makefile          |  1 +
 arch/arm64/kvm/arm.c             |  5 ++++-
 arch/arm64/kvm/spe.c             | 38 ++++++++++++++++++++++++++++++++
 drivers/perf/arm_spe_pmu.c       |  2 ++
 include/linux/perf/arm_spe_pmu.h |  8 +++++++
 include/uapi/linux/kvm.h         |  1 +
 8 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/kvm_spe.h
 create mode 100644 arch/arm64/kvm/spe.c

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 57061fa29e6a..10e0733297ac 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9229,6 +9229,16 @@ KVM exits with the register state of either the L1 or L2 guest
 depending on which executed at the time of an exit. Userspace must
 take care to differentiate between these cases.
 
+8.46 KVM_CAP_ARM_SPE
+--------------------
+
+:Capability: KVM_CAP_ARM_SPE
+:Architectures: arm64
+:Type: vm
+
+This capability indicates that Statistical Profiling Extension (SPE)
+virtualization is available in KVM.
+
 9. Known KVM API problems
 =========================
 
diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
new file mode 100644
index 000000000000..6572384531e2
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 - ARM Ltd
+ */
+
+#ifndef __ARM64_KVM_SPE_H__
+#define __ARM64_KVM_SPE_H__
+
+#ifdef CONFIG_KVM_ARM_SPE
+DECLARE_STATIC_KEY_FALSE(kvm_spe_available);
+
+static __always_inline bool kvm_supports_spe(void)
+{
+	return static_branch_likely(&kvm_spe_available);
+}
+#else
+#define kvm_supports_spe()	false
+#endif /* CONFIG_KVM_ARM_SPE */
+
+#endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 3ebc0570345c..6ea071653c5e 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -29,6 +29,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
+kvm-$(CONFIG_KVM_ARM_SPE)     += spe.o
 
 always-y := hyp_constants.h hyp-constants.s
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 052bf0d4d0b0..ee230cb34215 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -39,6 +39,7 @@
 #include <asm/kvm_nested.h>
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_ptrauth.h>
+#include <asm/kvm_spe.h>
 #include <asm/sections.h>
 
 #include <kvm/arm_hypercalls.h>
@@ -419,7 +420,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		else
 			r = kvm_supports_cacheable_pfnmap();
 		break;
-
+	case KVM_CAP_ARM_SPE:
+		r = kvm_supports_spe();
+		break;
 	default:
 		r = 0;
 	}
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
new file mode 100644
index 000000000000..cf902853750f
--- /dev/null
+++ b/arch/arm64/kvm/spe.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 - ARM Ltd
+ */
+
+#include <linux/cpumask.h>
+#include <linux/kvm_host.h>
+#include <linux/perf/arm_spe_pmu.h>
+
+#include <asm/kvm_spe.h>
+#include <asm/sysreg.h>
+
+DEFINE_STATIC_KEY_FALSE(kvm_spe_available);
+
+static LIST_HEAD(arm_spus);
+static DEFINE_MUTEX(arm_spus_lock);
+
+struct arm_spu_entry {
+	struct list_head link;
+	struct arm_spe_pmu *arm_spu;
+};
+
+void kvm_host_spe_init(struct arm_spe_pmu *arm_spu)
+{
+	struct arm_spu_entry *entry;
+
+	guard(mutex)(&arm_spus_lock);
+
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return;
+
+	entry->arm_spu = arm_spu;
+	list_add_tail(&entry->link, &arm_spus);
+
+	if (list_is_singular(&arm_spus))
+		static_branch_enable(&kvm_spe_available);
+}
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 188ea783a569..66ae36d4d32e 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1326,6 +1326,8 @@ static int arm_spe_pmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_teardown_dev;
 
+	kvm_host_spe_init(spe_pmu);
+
 	return 0;
 
 out_teardown_dev:
diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
index 86085a7559d9..8a2db0e03e45 100644
--- a/include/linux/perf/arm_spe_pmu.h
+++ b/include/linux/perf/arm_spe_pmu.h
@@ -46,4 +46,12 @@ struct arm_spe_pmu {
 
 #define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
 
+#ifdef CONFIG_KVM_ARM_SPE
+void kvm_host_spe_init(struct arm_spe_pmu *spe_pmu);
+#else
+static inline void kvm_host_spe_init(struct arm_spe_pmu *spe_pmu)
+{
+}
+#endif /* CONFIG_KVM_ARM_SPE */
+
 #endif /* __PERF_ARM_SPE_PMU_H__ */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 52f6000ab020..11e5dbde331b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -963,6 +963,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
 #define KVM_CAP_ARM_CACHEABLE_PFNMAP_SUPPORTED 243
 #define KVM_CAP_GUEST_MEMFD_FLAGS 244
+#define KVM_CAP_ARM_SPE 245
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.51.2


