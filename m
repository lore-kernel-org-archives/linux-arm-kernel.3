Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23936C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6CWSxTe9mZJ2q9dOB61lI8dMNoa5PiXFBmpcdOCaes=; b=NpuBtW2Kq6FSozqrkHW+Z91E30
	c4AysjB7jP2p4+dS9BoBO2Pix38TIDgn0fBsIgsoMSPdzdDJyA/iq/aR40gDU9YlIwCPgSTJEq8oV
	BmqLNaZy8+kQN3JT4jorJ7xVspaqcRGSmY1DKozi9ONt34eEqZUPO7UBmqzfQkav9X34Ga5VQ1OKw
	JBQ3+ap/xO+F4axcZddK6eoyGfZejXkbJQ4pY/+qsoTAzyR5bVqjOMmNmkHjKf/umkPdfkbtdT4Tj
	6o12bKMtL9ayhzkHA/rUgr2RG4alnsH4iOpM4QFwENw4mJXMkM/9Moa11XnlpwwpHSJWjPZbLldlL
	A0Z5VcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xk-0000000058i-2fWi;
	Thu, 03 Sep 2026 16:06:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29xg-0000000054Z-1WvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:06:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CE071D34;
	Thu,  3 Sep 2026 09:06:44 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247333F673;
	Thu,  3 Sep 2026 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451607; bh=K+TqvQ2LszEAPyJfany07rS0u9GRq3+OT4tlXUWaLJw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dcpRrCTeHuZZ5anWmVd9+w+hDX9MZR91dZdo7X4sKBEQzbXyid3HUB+DT+zqFzKl8
	 E2duGQKCC8GjbW/x/MjdjKvBu6ZaXgT+uarWHPNIr3CFhZoAYdZv+SOAA0YLp/MV6I
	 7cXVDJbEM7a5CnLepd+sifooygY6jz3yYNBtXlB0=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 06/28] KVM: arm64: Add KVM_CAP_ARM_SPE capability
Date: Thu,  3 Sep 2026 17:06:01 +0100
Message-ID: <20260903160623.315525-7-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090648_478392_37A4BBB7 
X-CRM114-Status: GOOD (  21.16  )
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
 Documentation/virt/kvm/api.rst   | 10 ++++++
 arch/arm64/include/asm/kvm_spe.h | 18 ++++++++++
 arch/arm64/kvm/Makefile          |  1 +
 arch/arm64/kvm/arm.c             |  4 +++
 arch/arm64/kvm/spe.c             | 56 ++++++++++++++++++++++++++++++++
 drivers/perf/arm_spe_pmu.c       |  4 +++
 include/linux/perf/arm_spe_pmu.h | 12 +++++++
 include/uapi/linux/kvm.h         |  1 +
 8 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/include/asm/kvm_spe.h
 create mode 100644 arch/arm64/kvm/spe.c

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9..1ed5c389c7a4 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9600,6 +9600,16 @@ take care to differentiate between these cases.
 The presence of this capability indicates that the nested KVM guest can
 start in ESA mode.
 
+8.48 KVM_CAP_ARM_SPE
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
index 000000000000..f05e6d3f5705
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 - ARM Ltd
+ */
+
+#ifndef __ARM64_KVM_SPE_H__
+#define __ARM64_KVM_SPE_H__
+
+#ifdef CONFIG_KVM_ARM_SPE
+bool kvm_supports_spe(void);
+#else
+static __always_inline bool kvm_supports_spe(void)
+{
+	return false;
+}
+#endif /* CONFIG_KVM_ARM_SPE */
+
+#endif /* __ARM64_KVM_SPE_H__ */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c..9ee271f713cd 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -29,6 +29,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
+kvm-$(CONFIG_KVM_ARM_SPE)     += spe.o
 
 kvm-$(CONFIG_NVHE_EL2_TRACING) += hyp_trace.o
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8b080804bc90..eca1184ef9dd 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -42,6 +42,7 @@
 #include <asm/kvm_nested.h>
 #include <asm/kvm_pkvm.h>
 #include <asm/kvm_ptrauth.h>
+#include <asm/kvm_spe.h>
 #include <asm/sections.h>
 #include <asm/stacktrace/nvhe.h>
 
@@ -468,6 +469,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_PMU_V3_STRICT:
 		r = kvm_supports_guest_pmuv3();
 		break;
+	case KVM_CAP_ARM_SPE:
+		r = kvm_supports_spe();
+		break;
 	case KVM_CAP_ARM_INJECT_SERROR_ESR:
 		r = cpus_have_final_cap(ARM64_HAS_RAS_EXTN);
 		break;
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
new file mode 100644
index 000000000000..646806a60d66
--- /dev/null
+++ b/arch/arm64/kvm/spe.c
@@ -0,0 +1,56 @@
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
+static LIST_HEAD(spe_pmus);
+static DEFINE_MUTEX(spe_pmus_lock);
+
+struct spe_pmu_entry {
+	struct list_head link;
+	struct arm_spe_pmu *spe_pmu;
+};
+
+void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
+{
+	struct spe_pmu_entry *entry;
+
+	guard(mutex)(&spe_pmus_lock);
+
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return;
+
+	entry->spe_pmu = spe_pmu;
+	list_add_tail(&entry->link, &spe_pmus);
+}
+EXPORT_SYMBOL_FOR_MODULES(kvm_spe_add_instance, "arm_spe_pmu");
+
+void kvm_spe_remove_instance(struct arm_spe_pmu *spe_pmu)
+{
+	struct spe_pmu_entry *entry, *tmp;
+
+	guard(mutex)(&spe_pmus_lock);
+
+	list_for_each_entry_safe(entry, tmp, &spe_pmus, link) {
+		if (entry->spe_pmu == spe_pmu) {
+			list_del(&entry->link);
+			kfree(entry);
+			break;
+		}
+	}
+}
+EXPORT_SYMBOL_FOR_MODULES(kvm_spe_remove_instance, "arm_spe_pmu");
+
+bool kvm_supports_spe(void)
+{
+	guard(mutex)(&spe_pmus_lock);
+	return !list_empty(&spe_pmus);
+}
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 42ba0924bd02..f24b122a087c 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -1370,6 +1370,8 @@ static int arm_spe_pmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_teardown_dev;
 
+	kvm_spe_add_instance(spe_pmu);
+
 	return 0;
 
 out_teardown_dev:
@@ -1383,6 +1385,8 @@ static void arm_spe_pmu_device_remove(struct platform_device *pdev)
 {
 	struct arm_spe_pmu *spe_pmu = platform_get_drvdata(pdev);
 
+	kvm_spe_remove_instance(spe_pmu);
+
 	arm_spe_pmu_perf_destroy(spe_pmu);
 	arm_spe_pmu_dev_teardown(spe_pmu);
 	free_percpu(spe_pmu->handle);
diff --git a/include/linux/perf/arm_spe_pmu.h b/include/linux/perf/arm_spe_pmu.h
index 97b14e236fcd..bdb703558a87 100644
--- a/include/linux/perf/arm_spe_pmu.h
+++ b/include/linux/perf/arm_spe_pmu.h
@@ -49,4 +49,16 @@ struct arm_spe_pmu {
 
 #define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
 
+#ifdef CONFIG_KVM_ARM_SPE
+void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu);
+void kvm_spe_remove_instance(struct arm_spe_pmu *spe_pmu);
+#else
+static inline void kvm_spe_add_instance(struct arm_spe_pmu *spe_pmu)
+{
+}
+static inline void kvm_spe_remove_instance(struct arm_spe_pmu *spe_pmu)
+{
+}
+#endif /* CONFIG_KVM_ARM_SPE */
+
 #endif /* __PERF_ARM_SPE_PMU_H__ */
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index ac2d77d14963..1565a609890b 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -999,6 +999,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_S390_HPAGE_2G 249
 #define KVM_CAP_PPC_COMPAT_CAPS 250
 #define KVM_CAP_ARM_PMU_V3_STRICT 251
+#define KVM_CAP_ARM_SPE 252
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.43.0


