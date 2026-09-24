Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9CBC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1mUG2fA0FL2LAgiGPMhIThsTiIDR92J6kR8aYZPl94=; b=IP4CZ+0Wvoxt5agHzBM4+9M/z0
	3rCeh/ZgLtDZfQ7uG3nwj4OVhwR21VFk+9yGvy9rswKCOwOv6+3CAvy4El9NmqLyzB9Wul56p3Od/
	Kt8w835QiCIm1fz4lYN98BVJOTseQfu83BrbSVmSrhZupCWUnQ6KvuCcX2p5HoHA2O5eOBRg9qgzX
	Czk+6Nq2W//trbDztLwBwWXbEN7LDK0tRxrGGu+F3WmIuwfNXlg5KpnQF6soNGZgepPcYfuJqndN5
	W0FzERVjPuZqtTYq+aPgWHsPvl6UNACGwinllBNU7uUDRe5Cfcb2nwbyA29g90weutVYQ3hJZGjJ9
	JuM8W9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGX-0000000BjzD-1LGn;
	Thu, 24 Sep 2026 17:29:49 +0000
Received: from mail-oa1-x47.google.com ([2001:4860:4864:20::47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGQ-0000000Bjre-3cLN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:45 +0000
Received: by mail-oa1-x47.google.com with SMTP id 586e51a60fabf-467c2c754f8so109613fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270981; x=1790875781; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1mUG2fA0FL2LAgiGPMhIThsTiIDR92J6kR8aYZPl94=;
        b=IWdozgcblW9F063mD57bPnX6eH57uznY21szjSd+CSDfBsUlsAf8JcjWwcbcz+c7HJ
         lGlaOBVt1d733Gv1mfEHjEivYAnAORPInPGspB1Xv7sV9EzwgZcgoJ4mR6l/3SFe9lCI
         ws7x1zuZSwoUNxbd/L/hIK5PrqefWUNo6SAxO42rM2j82zsgUXJBIJJGlBtYzqf6AlHg
         KSAPjTcU9jRWlsVqfPVdE6FbFunefdxbDi/w0d0LHsLLXBzPHfIJIED1QKOgPNHkfV/7
         ab6Xba2kvOeDYPxmhjCpN2iopQTG+n5RDqrkKqF9vkn0l2qluMOckqCnex6ZCfp9RYbu
         Pe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270981; x=1790875781;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1mUG2fA0FL2LAgiGPMhIThsTiIDR92J6kR8aYZPl94=;
        b=HO4CfgKlJDq3QNmaNYKjXVzQo+litiSMli1c4FricVXpTldNOyrddbSYiL28Rddn+B
         iuTggKdJzTs7uslw2va4AZ+kkACZSQh+h12qJSRfbD+PCG29m4OIqEyZ4afPVprWC4nO
         E1AqekhLHDFIdatj2I7doE+ie3ZKTisHJ08SxV1/lorB+1w1HqAJXXkywVF8l9WAkKIH
         qgcV5v6AFrD2zaICSwCVVP53ypFkEvMVgbUujU39ti2CTP7wqqp32u31QmddppN2vlVr
         3E3UwMVxgqh3txKaqOMCeJIkq6iv2kl3Tzb7db66+C/UWBS0OiX5HC1WabIAkJqTumFd
         nhbQ==
X-Forwarded-Encrypted: i=1; AKwUvByA4Bg3uN3Qrdodj1TrrCqCe1ivZARIB2Gs7TDLB9925sCqT+JjNkG//jog3Nprtm0WutKhXSU/m34AQARKgl5q@lists.infradead.org
X-Gm-Message-State: AFuF++nwynTWAo+eMOO8usaY2NfByHXmPbuhMlmNnXKw+1UNIWW9+eyb
	7pNkHAQgoBHDZCz4EYtSM5G8TDa1lmWNZo5qvtGNwK0JvNGzQLH6HCY81XMFEdl1k2SF1vnNbpv
	KPaCjFHzXItmArZB3GLXzZkPz+A==
X-Received: from jabbp22.prod.google.com ([2002:a05:6638:4416:b0:5f3:9433:9f74])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3a05:b0:4c2:e1d3:757d with SMTP id 5614622812f47-4d728f29831mr3535404b6e.21.1790270980813;
 Thu, 24 Sep 2026 10:29:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:14 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-9-coltonlewis@google.com>
Subject: [PATCH v9 08/22] KVM: arm64: Add initial scaffolding for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102942_926220_EF73D5B1 
X-CRM114-Status: GOOD (  26.81  )
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

Add the foundational helpers for Partitioned PMU support in
arch/arm64/kvm/pmu-direct.c:
- has_host_pmu_partition_support() and has_kvm_pmu_partition_support()
  to check VHE and PMUv3 availability.
- kvm_pmu_partition_enable() and kvm_pmu_is_partitioned() to track per-VM
  partitioning state via KVM_ARCH_FLAG_PARTITION_PMU_ENABLED.
- kvm_pmu_host_counter_mask() and kvm_pmu_guest_counter_mask() to
  compute the bitmasks of host-reserved (HPMN..N-1) and guest-reserved
  (0..HPMN-1 and PMCCNTR_EL0) hardware counters.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h  |   8 ++
 arch/arm64/include/asm/kvm_host.h |   2 +
 arch/arm64/kvm/Makefile           |   2 +-
 arch/arm64/kvm/pmu-direct.c       | 120 ++++++++++++++++++++++++++++++
 include/kvm/arm_pmu.h             |  32 ++++++++
 5 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index ecfede0c03486..cec26c12bc009 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -221,12 +221,20 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 	return false;
 }
 
+static inline bool has_host_pmu_partition_support(void)
+{
+	return false;
+}
 static inline bool kvm_set_pmuserenr(u64 val)
 {
 	return false;
 }
 
 static inline void kvm_vcpu_pmu_resync_el0(void) {}
+static inline u64 kvm_pmu_host_counter_mask(void)
+{
+	return ~0;
+}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 217c36af1ca51..98143daab6a55 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -367,6 +367,8 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* Partitioned PMU Enabled */
+#define KVM_ARCH_FLAG_PARTITION_PMU_ENABLED		12
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 59612d2f277c1..0e7b8e65c4c93 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -26,7 +26,7 @@ kvm-y += arm.o mmu.o mmio.o psci.o hypercalls.o pvtime.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
 	 vgic/vgic-v5.o
 
-kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu.o
+kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o pmu-direct.o pmu.o
 kvm-$(CONFIG_ARM64_PTR_AUTH)  += pauth.o
 kvm-$(CONFIG_PTDUMP_STAGE2_DEBUGFS) += ptdump.o
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
new file mode 100644
index 0000000000000..f224b97823ce5
--- /dev/null
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Google LLC
+ * Author: Colton Lewis <coltonlewis@google.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <linux/perf/arm_pmu.h>
+#include <linux/perf/arm_pmuv3.h>
+
+#include <asm/arm_pmuv3.h>
+#include <asm/kvm_emulate.h>
+#include <asm/virt.h>
+
+/**
+ * has_host_pmu_partition_support() - Determine if partitioning is possible
+ *
+ * Partitioning is only supported in VHE mode with PMUv3
+ *
+ * Return: True if partitioning is possible, false otherwise
+ */
+bool has_host_pmu_partition_support(void)
+{
+	return has_vhe() &&
+		system_supports_pmuv3();
+}
+
+/**
+ * has_kvm_pmu_partition_support() - If we can enable/disable partition
+ *
+ * Return: true if allowed, false otherwise.
+ */
+bool has_kvm_pmu_partition_support(void)
+{
+	return has_host_pmu_partition_support() &&
+		kvm_supports_guest_pmuv3();
+}
+
+/**
+ * kvm_pmu_partition_enable() - Enable/disable partition flag
+ * @kvm: Pointer to kvm struct
+ * @enable: Whether to enable or disable
+ *
+ * If we want to enable the partition, the guest is free to grab
+ * hardware by accessing PMU registers. Otherwise, the host maintains
+ * control.
+ */
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable)
+{
+	if (enable)
+		set_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+	else
+		clear_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+}
+
+/**
+ * kvm_pmu_is_partitioned() - Determine if KVM has a partitioned PMU
+ * @kvm: Pointer to kvm struct
+ *
+ * Return: True if the KVM PMU is partitioned, false otherwise
+ */
+bool kvm_pmu_is_partitioned(struct kvm *kvm)
+{
+	return kvm && test_bit(KVM_ARCH_FLAG_PARTITION_PMU_ENABLED, &kvm->arch.flags);
+}
+
+/**
+ * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
+ *
+ * Compute the bitmask that selects the host-reserved counters in the
+ * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
+ * in HPMN..N-1.
+ *
+ * Return: Bitmask
+ */
+u64 kvm_pmu_host_counter_mask(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (vcpu && kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u8 nr_counters = *host_data_ptr(nr_event_counters);
+		unsigned int guest_counters = vcpu->kvm->arch.nr_pmu_counters;
+
+		if (nr_counters > guest_counters)
+			return GENMASK_ULL(nr_counters - 1, guest_counters);
+		else
+			return 0;
+	}
+
+	return ARMV8_PMU_CNT_MASK_ALL;
+}
+
+static u64 kvm_vcpu_pmu_guest_counter_mask(struct kvm_vcpu *vcpu)
+{
+	if (vcpu && kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u64 mask = ARMV8_PMU_CNT_MASK_C;
+		unsigned int guest_counters = vcpu->kvm->arch.nr_pmu_counters;
+
+		if (guest_counters > 0)
+			mask |= GENMASK_ULL(guest_counters - 1, 0);
+
+		return mask;
+	}
+
+	return 0;
+}
+
+/**
+ * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
+ *
+ * Compute the bitmask that selects the guest-reserved counters in the
+ * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the event counters
+ * in 0..HPMN-1 and the cycle counter (PMCCNTR_EL0).
+ *
+ * Return: Bitmask
+ */
+u64 kvm_pmu_guest_counter_mask(void)
+{
+	return kvm_vcpu_pmu_guest_counter_mask(kvm_get_running_vcpu());
+}
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index e1bf29de0b6dd..45ed338ee7504 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -50,6 +50,7 @@ struct arm_pmu_entry {
 };
 
 bool kvm_supports_guest_pmuv3(void);
+bool has_host_pmu_partition_support(void);
 #define kvm_arm_pmu_irq_initialized(v)	((v)->arch.pmu.irq_num >= VGIC_NR_SGIS)
 u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu, u64 select_idx);
 void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu, u64 select_idx, u64 val);
@@ -94,6 +95,11 @@ void kvm_vcpu_pmu_resync_el0(void);
 #define kvm_vcpu_has_pmuv3_strict(vcpu)				\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3_STRICT))
 
+bool has_kvm_pmu_partition_support(void);
+void kvm_pmu_partition_enable(struct kvm *kvm, bool enable);
+bool kvm_pmu_is_partitioned(struct kvm *kvm);
+u64 kvm_pmu_host_counter_mask(void);
+u64 kvm_pmu_guest_counter_mask(void);
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -122,12 +128,21 @@ static inline bool kvm_supports_guest_pmuv3(void)
 	return false;
 }
 
+static inline bool has_host_pmu_partition_support(void)
+{
+	return false;
+}
+
 #define kvm_arm_pmu_irq_initialized(v)	(false)
 static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 					    u64 select_idx)
 {
 	return 0;
 }
+static inline bool kvm_pmu_is_partitioned(struct kvm *kvm)
+{
+	return false;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
@@ -226,6 +241,23 @@ static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int id
 
 static inline void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu) {}
 
+static inline u64 kvm_pmu_host_counter_mask(void)
+{
+	return ~0;
+}
+
+static inline u64 kvm_pmu_guest_counter_mask(void)
+{
+	return 0;
+}
+
+static inline bool has_kvm_pmu_partition_support(void)
+{
+	return false;
+}
+
+static inline void kvm_pmu_partition_enable(struct kvm *kvm, bool enable) {}
+
 #endif
 
 #endif
-- 
2.56.0.rc1.310.g51773c2048-goog


