Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0B7C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mi1XMcQcbK6K358IcTKG6ZBCQ8Wr+Tcqk+OJxyY+WuA=; b=xryHzXLP+WRJz9T1nWrDQOMuXE
	BHtyZGBSA0hbn7TjjszRq+ocyiB/aHjc1UptGth0um1SI3Wbi1GI2AIEPXP8P/aSiahm+IuGO73IE
	dfXPGGbzPWw9P11todn+k6HXCfBWu5i3/oRz9nVNEN0C+JVQicwtE72RQrxQxOxeapHAQDnqsuy23
	OPg/HprgRDGfAIrij5gXofg2n97xbv/UiGZ+xDMdXRHT3iE2Wcf+vsSLxylebMSjqoxAu8xGajQFV
	PbqOo8hzijVnMa8/eUqcI5t9qZwHC6flp2tbh7oiGbNIAHqTtu/vbzBT+FT7yQfbM777LCUcIVRXc
	6rTFNVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpw5Y-00000009K0w-05Xm;
	Wed, 05 Mar 2025 21:15:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKl-00000009D8N-1CI4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:27:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mi1XMcQcbK6K358IcTKG6ZBCQ8Wr+Tcqk+OJxyY+WuA=; b=WriKR1T4WM9FB/VL0HAColJKKD
	oD8hoAkJpt/GGQ7idYelzk9JvUCXD646VMOQHmOIICGHTt6667+MQ4PZNviMNlx31G8Wn68L+4HMF
	/PZ13LOsz5GQ/YMiArRcrtjPC31fJm9T+6Gs4DEhkX9o+qf++W0l20S9MVMGQJQhPA+4SK9+6Zqkj
	bwZK1Cx0MNGQbKjST3AkPElUJmUFM2yKh9EUFtPtVRjM46lZHh3UX+IKXNHdLrSZwTxY0fBeN/yed
	O1awUb9Bm6rmrtE+Tj/yGzuAy5ArCHffygVy1/JI2FP3LRStU6fzkQF7mGxpa2jQ3rvzDsYy+KrJD
	AOE243fQ==;
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKi-00000006ATf-1o1H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:27:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741206429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi1XMcQcbK6K358IcTKG6ZBCQ8Wr+Tcqk+OJxyY+WuA=;
	b=gYoTh6f1jnEqxMed8Twec9WKr1UZ1j5M4K3FBegYEm9cf0klPbsOZkujn1shCl2WqeSg9P
	Ntj7XMT1zry3/nogC9yC2owhfBHIeLGh+2rqxAv1j6i6v9p6zJS4ZmEByTfUMbGfq4g/io
	hCx+UGUOvf0+dW1jWT7OCDhdRxzVK0I=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v3 05/14] KVM: arm64: Use a cpucap to determine if system supports FEAT_PMUv3
Date: Wed,  5 Mar 2025 12:26:32 -0800
Message-Id: <20250305202641.428114-6-oliver.upton@linux.dev>
In-Reply-To: <20250305202641.428114-1-oliver.upton@linux.dev>
References: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202712_488812_FBA331F1 
X-CRM114-Status: GOOD (  18.50  )
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

KVM is about to learn some new tricks to virtualize PMUv3 on IMPDEF
hardware. As part of that, we now need to differentiate host support
from guest support for PMUv3.

Add a cpucap to determine if an architectural PMUv3 is present to guard
host usage of PMUv3 controls.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/cpucaps.h        |  2 ++
 arch/arm64/include/asm/cpufeature.h     |  5 +++++
 arch/arm64/kernel/cpufeature.c          | 28 +++++++++++++++++++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h |  4 ++--
 arch/arm64/kvm/pmu.c                    | 10 ++++-----
 arch/arm64/tools/cpucaps                |  1 +
 include/kvm/arm_pmu.h                   |  2 +-
 7 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 0b5ca6e0eb09..9d769291a306 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -71,6 +71,8 @@ cpucap_is_possible(const unsigned int cap)
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
 		*/
 		return true;
+	case ARM64_HAS_PMUV3:
+		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
 	}
 
 	return true;
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e0e4478f5fb5..0eff048848b8 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -866,6 +866,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
 	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
 }
 
+static inline bool system_supports_pmuv3(void)
+{
+	return cpus_have_final_cap(ARM64_HAS_PMUV3);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index d561cf3b8ac7..ce2c1e688d8c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1898,6 +1898,26 @@ static bool has_lpa2(const struct arm64_cpu_capabilities *entry, int scope)
 }
 #endif
 
+static bool has_pmuv3(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	u64 dfr0 = read_sanitised_ftr_reg(SYS_ID_AA64DFR0_EL1);
+	unsigned int pmuver;
+
+	/*
+	 * PMUVer follows the standard ID scheme for an unsigned field with the
+	 * exception of 0xF (IMP_DEF) which is treated specially and implies
+	 * FEAT_PMUv3 is not implemented.
+	 *
+	 * See DDI0487L.a D24.1.3.2 for more details.
+	 */
+	pmuver = cpuid_feature_extract_unsigned_field(dfr0,
+						      ID_AA64DFR0_EL1_PMUVer_SHIFT);
+	if (pmuver == ID_AA64DFR0_EL1_PMUVer_IMP_DEF)
+		return false;
+
+	return pmuver >= ID_AA64DFR0_EL1_PMUVer_IMP;
+}
+
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 #define KPTI_NG_TEMP_VA		(-(1UL << PMD_SHIFT))
 
@@ -2998,6 +3018,14 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		ARM64_CPUID_FIELDS(ID_AA64PFR1_EL1, GCS, IMP)
 	},
+#endif
+#ifdef CONFIG_HW_PERF_EVENTS
+	{
+		.desc = "PMUv3",
+		.capability = ARM64_HAS_PMUV3,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_pmuv3,
+	},
 #endif
 	{},
 };
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 23bbe28eaaf9..b741ea6aefa5 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -244,7 +244,7 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 	 * counter, which could make a PMXEVCNTR_EL0 access UNDEF at
 	 * EL1 instead of being trapped to EL2.
 	 */
-	if (kvm_arm_support_pmu_v3()) {
+	if (system_supports_pmuv3()) {
 		struct kvm_cpu_context *hctxt;
 
 		write_sysreg(0, pmselr_el0);
@@ -281,7 +281,7 @@ static inline void __deactivate_traps_common(struct kvm_vcpu *vcpu)
 	write_sysreg(*host_data_ptr(host_debug_state.mdcr_el2), mdcr_el2);
 
 	write_sysreg(0, hstr_el2);
-	if (kvm_arm_support_pmu_v3()) {
+	if (system_supports_pmuv3()) {
 		struct kvm_cpu_context *hctxt;
 
 		hctxt = host_data_ptr(host_ctxt);
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 0b3adf3e17b4..6b48a3d16d0d 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -41,7 +41,7 @@ void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr)
 {
 	struct kvm_pmu_events *pmu = kvm_get_pmu_events();
 
-	if (!kvm_arm_support_pmu_v3() || !kvm_pmu_switch_needed(attr))
+	if (!system_supports_pmuv3() || !kvm_pmu_switch_needed(attr))
 		return;
 
 	if (!attr->exclude_host)
@@ -57,7 +57,7 @@ void kvm_clr_pmu_events(u64 clr)
 {
 	struct kvm_pmu_events *pmu = kvm_get_pmu_events();
 
-	if (!kvm_arm_support_pmu_v3())
+	if (!system_supports_pmuv3())
 		return;
 
 	pmu->events_host &= ~clr;
@@ -133,7 +133,7 @@ void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu)
 	struct kvm_pmu_events *pmu;
 	u64 events_guest, events_host;
 
-	if (!kvm_arm_support_pmu_v3() || !has_vhe())
+	if (!system_supports_pmuv3() || !has_vhe())
 		return;
 
 	preempt_disable();
@@ -154,7 +154,7 @@ void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu)
 	struct kvm_pmu_events *pmu;
 	u64 events_guest, events_host;
 
-	if (!kvm_arm_support_pmu_v3() || !has_vhe())
+	if (!system_supports_pmuv3() || !has_vhe())
 		return;
 
 	pmu = kvm_get_pmu_events();
@@ -180,7 +180,7 @@ bool kvm_set_pmuserenr(u64 val)
 	struct kvm_cpu_context *hctxt;
 	struct kvm_vcpu *vcpu;
 
-	if (!kvm_arm_support_pmu_v3() || !has_vhe())
+	if (!system_supports_pmuv3() || !has_vhe())
 		return false;
 
 	vcpu = kvm_get_running_vcpu();
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 1e65f2fb45bd..ee4316cb3690 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -45,6 +45,7 @@ HAS_LSE_ATOMICS
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_PAN
+HAS_PMUV3
 HAS_S1PIE
 HAS_S1POE
 HAS_RAS_EXTN
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 147bd3ee4f7b..3a8edd78240f 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -86,7 +86,7 @@ void kvm_vcpu_pmu_resync_el0(void);
  */
 #define kvm_pmu_update_vcpu_events(vcpu)				\
 	do {								\
-		if (!has_vhe() && kvm_arm_support_pmu_v3())		\
+		if (!has_vhe() && system_supports_pmuv3())		\
 			vcpu->arch.pmu.events = *kvm_get_pmu_events();	\
 	} while (0)
 
-- 
2.39.5


