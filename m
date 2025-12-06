Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C7ED3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT03r3WGpiwo19/4S5QoYm3Bx/6piafEWN0VhOWiV4M=; b=Rk0+sjlQeztMtS5XdYdUJBmD68
	X07SQRFoQB4ZDF/oMhD3tBwlpUZyUvmj5m9yvW80iq+yMQe88xfXN9spM15IkAEVG4mjb1AdwsUUk
	yRKCpyHZYAwsOZxtqFuPRcPsp4EWuQJcBj8W4yQaVs8kKZCx/MUWWekUqFQrR5nRhy/nuxQZnPcdJ
	9Gxv6KMbKI3xa9FSEY38NjbM2oqcA1riKKuY9NMqFuRNL2BFLYAauRPvXY3fB9X6Tt3OQl9xTKBkr
	yGoyHIFle4pYA5FlhB7WjWMesAmzbUZrjdhafV5+Mo5e+hFxjFr8EI3NMNa3bVXleWfetVuPzjyaz
	19IujFBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1H-0000000AHGG-2wCY;
	Sat, 06 Dec 2025 00:19:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0A-0000000AFID-0SsL
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FT03r3WGpiwo19/4S5QoYm3Bx/6piafEWN0VhOWiV4M=; b=LNMeD5X2q1sP50pqoYVSF2M/h4
	I83etLg1g0I4Hx7FYNjroLo1NTjAT/BAMTLr5Jwhm3pDq9zrTLNUQDziQ19/ikhrepVUCxXgNKk1Y
	9weF/BvGlTAEBjuR4VciUYqTJKmtbINjAcBxL9CV7aA+HCn6LddLDZIUACcak8Pc51tq8rz8O6AHo
	mS6M9optUt9WAPnmtwDZHsiAuLIyqbYOZjPmyvW8Susn6RZ9PtPhnO6jM1uOlgokaKwTFRom4YPEX
	p+9mUCuEXXyD7BxYXCYfEPjHII7u6Ac6v/zctLkuP+k6PyAnlMcdaIitddqmS+Qlx3tv7stp8HhFP
	otddRqwg==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg04-00000006SN0-2dTa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:16 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34188ba5990so6123458a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980290; x=1765585090; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FT03r3WGpiwo19/4S5QoYm3Bx/6piafEWN0VhOWiV4M=;
        b=Vk8RWMyzuHXkVIIpIQhJnhiq4kMIJn2NOfJfXcCXxF/eAGuHuadQ4J5xg0DSJsmtNn
         qBNxZ1l8UXRMXVTpu5hjh/m3eKz7PGGllSecYWwj6j+MAgs57SERj577ptOasNxlqdLJ
         D+ReCTVWxag404EEu7KBUzF7+SNNJT2Dxw8JKgrTSg08N0YSmTtHrF+285PJ2wWkoBS7
         W4OY4FmFUky5tYRzvCCc7T+ZYJCjZu/6brEGxqX818tzeG5jQor79QHf02XxF/vho1Ic
         iCrkd5lAtFXYV0ipCvH5s8irdL3uPkZCJhGaYqRFSwrjHKf2JKF1zGcBVZtGLIZEL+ub
         WmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980290; x=1765585090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT03r3WGpiwo19/4S5QoYm3Bx/6piafEWN0VhOWiV4M=;
        b=ou9clg6DexWcPVZhdcDAiLSYV1IHvsed2y8EGKJipyBcmD66kTmHVwowou7UFhEZlb
         S4SB21sZKOAcA5/kfQz2zFVU4RKBXfOt7uHrMnt2wRCqrM//P6sa6fo+IeHMNVYvnU4R
         6UlqZTvAeWqqHDzQGO7paEoA0K0mQvhaR7cBo2CN5/6amDvgfsRG47Z+oeBoElhB3Iae
         vzIcmhiLaPaAo+GcpAD+/Z/8JP7q+lIZ4bTnQ/eH7RJzFoM6Nr6XKdHl9S4IN5lo9udv
         q/4q1HpyECTayE4hV4arbovkLqNuzTVH7ICE1gCjuaYHYmUO5dZBSLlI7qQkgkmQOp6G
         FvCA==
X-Gm-Message-State: AOJu0YzQvUbaus3U5LBLKow/pCC2/utOk6z1tRiKLI2cQpp/5O4JsyYL
	71PHb97q9HuLRdbgCFf2WrCWdqzr5xFXqsitOui2+jEZD49cMgl4gvbrVRc/T/RkDm0I5asq9Sb
	E028Ujg==
X-Google-Smtp-Source: AGHT+IFYZeA/1Yjha10aGWWmoHIcleNuAFmNne8CK5ME9Ml1zcteifWQF4rCyiueQYdIVptKTzpY36jecuo=
X-Received: from pjer9.prod.google.com ([2002:a17:90a:ac9:b0:343:6d9b:86c7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2784:b0:33f:eca0:47ae
 with SMTP id 98e67ed59e1d1-349a262dda2mr610988a91.28.1764980289948; Fri, 05
 Dec 2025 16:18:09 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:58 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-23-seanjc@google.com>
Subject: [PATCH v6 22/44] KVM: x86/pmu: Disable interception of select PMU
 MSRs for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001813_265373_6A60869F 
X-CRM114-Status: GOOD (  18.63  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

For vCPUs with a mediated vPMU, disable interception of counter MSRs for
PMCs that are exposed to the guest, and for GLOBAL_CTRL and related MSRs
if they are fully supported according to the vCPU model, i.e. if the MSRs
and all bits supported by hardware exist from the guest's point of view.

Do NOT passthrough event selector or fixed counter control MSRs, so that
KVM can enforce userspace-defined event filters, e.g. to prevent use of
AnyThread events (which is unfortunately a setting in the fixed counter
control MSR).

Defer support for nested passthrough of mediated PMU MSRs to the future,
as the logic for nested MSR interception is unfortunately vendor specific.

Suggested-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
Co-developed-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
[sean: squash patches, massage changelog, refresh VMX MSRs on filter change]
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c           | 41 +++++++++++++++++--------
 arch/x86/kvm/pmu.h           |  1 +
 arch/x86/kvm/svm/svm.c       | 36 ++++++++++++++++++++++
 arch/x86/kvm/vmx/pmu_intel.c | 13 --------
 arch/x86/kvm/vmx/pmu_intel.h | 15 +++++++++
 arch/x86/kvm/vmx/vmx.c       | 59 +++++++++++++++++++++++++++++-------
 6 files changed, 128 insertions(+), 37 deletions(-)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index c4a32bfb26f5..57833f29a746 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -719,27 +719,41 @@ int kvm_pmu_rdpmc(struct kvm_vcpu *vcpu, unsigned idx, u64 *data)
 	return 0;
 }
 
-bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
+static bool kvm_need_any_pmc_intercept(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
 	if (!kvm_vcpu_has_mediated_pmu(vcpu))
 		return true;
 
-	/*
-	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
-	 * in Ring3 when CR4.PCE=0.
-	 */
-	if (enable_vmware_backdoor)
-		return true;
-
 	/*
 	 * Note!  Check *host* PMU capabilities, not KVM's PMU capabilities, as
 	 * KVM's capabilities are constrained based on KVM support, i.e. KVM's
 	 * capabilities themselves may be a subset of hardware capabilities.
 	 */
 	return pmu->nr_arch_gp_counters != kvm_host_pmu.num_counters_gp ||
-	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed ||
+	       pmu->nr_arch_fixed_counters != kvm_host_pmu.num_counters_fixed;
+}
+
+bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu)
+{
+	return kvm_need_any_pmc_intercept(vcpu) ||
+	       !kvm_pmu_has_perf_global_ctrl(vcpu_to_pmu(vcpu));
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_need_perf_global_ctrl_intercept);
+
+bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu)
+{
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+
+	/*
+	 * VMware allows access to these Pseduo-PMCs even when read via RDPMC
+	 * in Ring3 when CR4.PCE=0.
+	 */
+	if (enable_vmware_backdoor)
+		return true;
+
+	return kvm_need_any_pmc_intercept(vcpu) ||
 	       pmu->counter_bitmask[KVM_PMC_GP] != (BIT_ULL(kvm_host_pmu.bit_width_gp) - 1) ||
 	       pmu->counter_bitmask[KVM_PMC_FIXED] != (BIT_ULL(kvm_host_pmu.bit_width_fixed) - 1);
 }
@@ -936,11 +950,12 @@ void kvm_pmu_refresh(struct kvm_vcpu *vcpu)
 	 * in the global controls).  Emulate that behavior when refreshing the
 	 * PMU so that userspace doesn't need to manually set PERF_GLOBAL_CTRL.
 	 */
-	if (kvm_pmu_has_perf_global_ctrl(pmu) && pmu->nr_arch_gp_counters) {
+	if (pmu->nr_arch_gp_counters &&
+	    (kvm_pmu_has_perf_global_ctrl(pmu) || kvm_vcpu_has_mediated_pmu(vcpu)))
 		pmu->global_ctrl = GENMASK_ULL(pmu->nr_arch_gp_counters - 1, 0);
-		if (kvm_vcpu_has_mediated_pmu(vcpu))
-			kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
-	}
+
+	if (kvm_vcpu_has_mediated_pmu(vcpu))
+		kvm_pmu_call(write_global_ctrl)(pmu->global_ctrl);
 
 	bitmap_set(pmu->all_valid_pmc_idx, 0, pmu->nr_arch_gp_counters);
 	bitmap_set(pmu->all_valid_pmc_idx, KVM_FIXED_PMC_BASE_IDX,
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 2ff469334c1a..356b08e92bc9 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -239,6 +239,7 @@ void kvm_pmu_instruction_retired(struct kvm_vcpu *vcpu);
 void kvm_pmu_branch_retired(struct kvm_vcpu *vcpu);
 
 bool is_vmware_backdoor_pmc(u32 pmc_idx);
+bool kvm_need_perf_global_ctrl_intercept(struct kvm_vcpu *vcpu);
 bool kvm_need_rdpmc_intercept(struct kvm_vcpu *vcpu);
 
 extern struct kvm_pmu_ops intel_pmu_ops;
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 11913574de88..fa04e58ff524 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -730,6 +730,40 @@ void svm_vcpu_free_msrpm(void *msrpm)
 	__free_pages(virt_to_page(msrpm), get_order(MSRPM_SIZE));
 }
 
+static void svm_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	bool intercept = !kvm_vcpu_has_mediated_pmu(vcpu);
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	int i;
+
+	if (!enable_mediated_pmu)
+		return;
+
+	/* Legacy counters are always available for AMD CPUs with a PMU. */
+	for (i = 0; i < min(pmu->nr_arch_gp_counters, AMD64_NUM_COUNTERS); i++)
+		svm_set_intercept_for_msr(vcpu, MSR_K7_PERFCTR0 + i,
+					  MSR_TYPE_RW, intercept);
+
+	intercept |= !guest_cpu_cap_has(vcpu, X86_FEATURE_PERFCTR_CORE);
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++)
+		svm_set_intercept_for_msr(vcpu, MSR_F15H_PERF_CTR + 2 * i,
+					  MSR_TYPE_RW, intercept);
+
+	for ( ; i < kvm_pmu_cap.num_counters_gp; i++)
+		svm_enable_intercept_for_msr(vcpu, MSR_F15H_PERF_CTR + 2 * i,
+					     MSR_TYPE_RW);
+
+	intercept = kvm_need_perf_global_ctrl_intercept(vcpu);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_CTL,
+				  MSR_TYPE_RW, intercept);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_STATUS,
+				  MSR_TYPE_RW, intercept);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_CLR,
+				  MSR_TYPE_RW, intercept);
+	svm_set_intercept_for_msr(vcpu, MSR_AMD64_PERF_CNTR_GLOBAL_STATUS_SET,
+				  MSR_TYPE_RW, intercept);
+}
+
 static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
@@ -798,6 +832,8 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	if (sev_es_guest(vcpu->kvm))
 		sev_es_recalc_msr_intercepts(vcpu);
 
+	svm_recalc_pmu_msr_intercepts(vcpu);
+
 	/*
 	 * x2APIC intercepts are modified on-demand and cannot be filtered by
 	 * userspace.
diff --git a/arch/x86/kvm/vmx/pmu_intel.c b/arch/x86/kvm/vmx/pmu_intel.c
index dbab7cca7a62..820da47454d7 100644
--- a/arch/x86/kvm/vmx/pmu_intel.c
+++ b/arch/x86/kvm/vmx/pmu_intel.c
@@ -128,19 +128,6 @@ static struct kvm_pmc *intel_rdpmc_ecx_to_pmc(struct kvm_vcpu *vcpu,
 	return &counters[array_index_nospec(idx, num_counters)];
 }
 
-static inline u64 vcpu_get_perf_capabilities(struct kvm_vcpu *vcpu)
-{
-	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_PDCM))
-		return 0;
-
-	return vcpu->arch.perf_capabilities;
-}
-
-static inline bool fw_writes_is_enabled(struct kvm_vcpu *vcpu)
-{
-	return (vcpu_get_perf_capabilities(vcpu) & PERF_CAP_FW_WRITES) != 0;
-}
-
 static inline struct kvm_pmc *get_fw_gp_pmc(struct kvm_pmu *pmu, u32 msr)
 {
 	if (!fw_writes_is_enabled(pmu_to_vcpu(pmu)))
diff --git a/arch/x86/kvm/vmx/pmu_intel.h b/arch/x86/kvm/vmx/pmu_intel.h
index 5620d0882cdc..5d9357640aa1 100644
--- a/arch/x86/kvm/vmx/pmu_intel.h
+++ b/arch/x86/kvm/vmx/pmu_intel.h
@@ -4,6 +4,21 @@
 
 #include <linux/kvm_host.h>
 
+#include "cpuid.h"
+
+static inline u64 vcpu_get_perf_capabilities(struct kvm_vcpu *vcpu)
+{
+	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_PDCM))
+		return 0;
+
+	return vcpu->arch.perf_capabilities;
+}
+
+static inline bool fw_writes_is_enabled(struct kvm_vcpu *vcpu)
+{
+	return (vcpu_get_perf_capabilities(vcpu) & PERF_CAP_FW_WRITES) != 0;
+}
+
 bool intel_pmu_lbr_is_enabled(struct kvm_vcpu *vcpu);
 int intel_pmu_create_guest_lbr_event(struct kvm_vcpu *vcpu);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 72b92cea9d72..f0a20ff2a941 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4228,6 +4228,53 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void vmx_recalc_pmu_msr_intercepts(struct kvm_vcpu *vcpu)
+{
+	bool has_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
+	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
+	struct vcpu_vmx *vmx = to_vmx(vcpu);
+	bool intercept = !has_mediated_pmu;
+	int i;
+
+	if (!enable_mediated_pmu)
+		return;
+
+	vm_entry_controls_changebit(vmx, VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL,
+				    has_mediated_pmu);
+
+	vm_exit_controls_changebit(vmx, VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
+					VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL,
+				   has_mediated_pmu);
+
+	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
+					  MSR_TYPE_RW, intercept);
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PMC0 + i, MSR_TYPE_RW,
+					  intercept || !fw_writes_is_enabled(vcpu));
+	}
+	for ( ; i < kvm_pmu_cap.num_counters_gp; i++) {
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PERFCTR0 + i,
+					  MSR_TYPE_RW, true);
+		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PMC0 + i,
+					  MSR_TYPE_RW, true);
+	}
+
+	for (i = 0; i < pmu->nr_arch_fixed_counters; i++)
+		vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_FIXED_CTR0 + i,
+					  MSR_TYPE_RW, intercept);
+	for ( ; i < kvm_pmu_cap.num_counters_fixed; i++)
+		vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_FIXED_CTR0 + i,
+					  MSR_TYPE_RW, true);
+
+	intercept = kvm_need_perf_global_ctrl_intercept(vcpu);
+	vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_STATUS,
+				  MSR_TYPE_RW, intercept);
+	vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_CTRL,
+				  MSR_TYPE_RW, intercept);
+	vmx_set_intercept_for_msr(vcpu, MSR_CORE_PERF_GLOBAL_OVF_CTRL,
+				  MSR_TYPE_RW, intercept);
+}
+
 static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	bool intercept;
@@ -4294,17 +4341,7 @@ static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 		vmx_set_intercept_for_msr(vcpu, MSR_IA32_S_CET, MSR_TYPE_RW, intercept);
 	}
 
-	if (enable_mediated_pmu) {
-		bool is_mediated_pmu = kvm_vcpu_has_mediated_pmu(vcpu);
-		struct vcpu_vmx *vmx = to_vmx(vcpu);
-
-		vm_entry_controls_changebit(vmx,
-					    VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL, is_mediated_pmu);
-
-		vm_exit_controls_changebit(vmx,
-					   VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
-					   VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL, is_mediated_pmu);
-	}
+	vmx_recalc_pmu_msr_intercepts(vcpu);
 
 	/*
 	 * x2APIC and LBR MSR intercepts are modified on-demand and cannot be
-- 
2.52.0.223.gf5cc29aaa4-goog


