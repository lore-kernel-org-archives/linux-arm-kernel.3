Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30D3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7mScXH/6+pdXYQkInC9PtowohFYZMkWYozKee5Fshw=; b=tGMuhxRZJXGR6moniRoY8w9y2N
	fP2I16TrpwXW2/VDr9VeUbMO+fn7NbPUwagTMkB7H4C5MZVMfeyM+JUftItDb2zyCYtI73DWHHYvz
	BSG6NMgQa30uykbb45vfpSIgwS2fih6tMleYcy8tJX6ZM2XpDehi6cxq0jtPBxFx3olzB+GAMZhLN
	q06lcsvyLqW1TOoURhNdO0bQscRmleqgkYHTIpoE+k810hQfvjy4o9gmWnFHbU76UvAQOcBEgBYLY
	7hDlXhQZ3x7CGDfLFwIU6cMbUyn3VcMK/XKAbyM/jug+fIR421ZmS3zN0M/PKd+JM3uivQR83/cUJ
	P/h/q88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubStX-00000003ZiY-2caC;
	Mon, 14 Jul 2025 23:47:39 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS9H-00000003Sb8-2XYb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:52 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-41bb68aad9aso87077b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533990; x=1753138790; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7mScXH/6+pdXYQkInC9PtowohFYZMkWYozKee5Fshw=;
        b=l1os6Wby6hnpkWQRitBodhnPqycdIF0/8NyKT3rHW0nV4G8hCMqnek58mfVJmebV4i
         CHd4HNZNDvjk3AX7j+SSHzmyaGewxMFLTMv6K3VfBz7oF2Jwd8gROorSmFubmZl3/CHF
         cv3TdamePKz7Z6U2zG7+vXiZdtBI0Y1zE8lUsYL9L87+0dkrpZ8ZHCR6NlA07WUDvFXk
         8Y7oY0yuacQZkxtKLqEESwzhIsZlhJxx0LgOPEW+HiAFKeeVlMNJ9hiWNM3ZDEGtFTdQ
         8IX4ElIXGZte8ZXnXELxPEAaYBRyanZhoWOwuEu8jCQWQ2fAJu2ijTHIIRRA7m+kLXql
         Bxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533990; x=1753138790;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7mScXH/6+pdXYQkInC9PtowohFYZMkWYozKee5Fshw=;
        b=D5a8cNZ6NpfJ/XJS1qcSXt1896S+orT+1wJ6HxMZLYGIHXMh+SwT1oizbcBguyFEKk
         uzLZ23ZPQKykMDdJIKKWrPoQXfTC4mGtuYSSULPD5VNpS3zJtqJbb0fn5KgDO4buBjDh
         0cZx233Gvs+zRYDqM98C8pRjlSPI3tcapsLFtbqvow91kXPuxOmAeyG06iLOuxv3gK2e
         TCzGBMxI8+tw8Di7BifH7uRgkgc5Gg0J9m48G0v29yAEoHY1uqK+pWGOCt9tXDCQX9Nh
         k4SKPJmmBUjPjtYPqvdy4fCoxHnwQTNIgk7hu1Z32RSFexSzTVdY3CmmT+ZLv7EJkW0x
         3e+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1m+kCsr1+EK6+kwtNfu+IIQbqgGplXJKwb3y8vQmmwJ2KGGifMpHhrrDi9QkKZArgsWrpsN/7Bd0HBbVgVuJG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx4QXubaDNoq6i96j0apswum99yoNLbSzwy9hRzs/1KjXyZVLR
	m2NLidhBwl/Dv8l+9mIkA0RVaNBczO709ieArA63Tpx4OxK36xCUn2bI0FXnSVyOJl7xuzhJqEl
	rl51puQujtWoTpkWc5aeuSbySkQ==
X-Google-Smtp-Source: AGHT+IHeWycWc8V6KlcE3+nXaI8c1NOdk6N2RoQO/4A7VVje0Wg9HvCVPFl3hQhC7Im+5mMnPvUFMFuuatCQ6TJ/Gg==
X-Received: from oigd17.prod.google.com ([2002:a05:6808:4a11:b0:41b:4c26:7a64])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:14ce:b0:40b:a4ca:f7cb with SMTP id 5614622812f47-41b7cafb187mr830089b6e.15.1752533990127;
 Mon, 14 Jul 2025 15:59:50 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:13 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-20-coltonlewis@google.com>
Subject: [PATCH v4 19/23] KVM: arm64: Implement lazy PMU context swaps
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155951_645006_4F80F457 
X-CRM114-Status: GOOD (  18.55  )
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

Since many guests will never touch the PMU, they need not pay the cost
of context swapping those registers.

Use the ownership enum from the previous commit to implement a simple
state machine for PMU ownership. The PMU is always in one of three
states: host owned, guest owned, or free.

A host owned state means all PMU registers are trapped coarsely by
MDCR_EL2.TPM. In host owned state PMU partitioning is disabled and the
PMU may not transition to a different state without intervention from
the host.

A guest owned state means some PMU registers are untrapped under FGT
controls. This is the only state in which context swaps take place.

A free state is the default partitioned state. It means no context
swaps take place and KVM keeps the registers trapped. If a guest
accesses the PMU registers in a free state, the PMU transitions to a
guest owned state and KVM recalculates MDCR_EL2 to unset TPM.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  1 +
 arch/arm64/include/asm/kvm_pmu.h  | 18 ++++++++++++++++++
 arch/arm64/kvm/debug.c            |  2 +-
 arch/arm64/kvm/pmu-direct.c       |  4 +++-
 arch/arm64/kvm/pmu.c              | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/sys_regs.c         | 24 ++++++++++++++++++++++--
 6 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 21e32d7fa19b..f6803b57b648 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1453,6 +1453,7 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
 }
 
+void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu);
 void kvm_init_host_debug_data(void);
 void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 58c1219adf54..47cfff7ebc26 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -97,6 +97,11 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+bool kvm_pmu_regs_free(struct kvm_vcpu *vcpu);
+bool kvm_pmu_regs_host_owned(struct kvm_vcpu *vcpu);
+bool kvm_pmu_regs_guest_owned(struct kvm_vcpu *vcpu);
+void kvm_pmu_regs_set_guest_owned(struct kvm_vcpu *vcpu);
+
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
@@ -168,6 +173,19 @@ static inline u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu)
 {
 	return 0;
 }
+static inline bool kvm_pmu_regs_free(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline bool kvm_pmu_regs_host_owned(struct kvm_vcpu *vcpu)
+{
+	return true;
+}
+static inline bool kvm_pmu_regs_guest_owned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline void kvm_pmu_regs_set_guest_owned(struct kvm_vcpu *vcpu) {}
 static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 {
 	return 0;
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index fa8b4f846b68..128fa17b7a35 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -28,7 +28,7 @@
  *  - Self-hosted Trace Filter controls (MDCR_EL2_TTRF)
  *  - Self-hosted Trace (MDCR_EL2_TTRF/MDCR_EL2_E2TB)
  */
-static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
+void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
 	preempt_disable();
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index e21fdd274c2e..28d8540c5ed2 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -52,7 +52,8 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
  */
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
 {
-	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu);
+	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
+		!kvm_pmu_regs_host_owned(vcpu);
 }
 
 /**
@@ -69,6 +70,7 @@ bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
 	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;
 
 	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
+		kvm_pmu_regs_guest_owned(vcpu) &&
 		cpus_have_final_cap(ARM64_HAS_FGT) &&
 		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
 }
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 1e5f46c1346c..db11a3e9c4b7 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -496,6 +496,7 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
 	init_irq_work(&vcpu->arch.pmu.overflow_work,
 		      kvm_pmu_perf_overflow_notify_vcpu);
 
+	vcpu->arch.pmu.owner = VCPU_REGISTER_HOST_OWNED;
 	vcpu->arch.pmu.created = true;
 	return 0;
 }
@@ -906,3 +907,26 @@ bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu)
 {
 	return check_pmu_access_disabled(vcpu, ARMV8_PMU_USERENR_EN);
 }
+
+bool kvm_pmu_regs_free(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.pmu.owner == VCPU_REGISTER_FREE;
+}
+
+bool kvm_pmu_regs_host_owned(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.pmu.owner == VCPU_REGISTER_HOST_OWNED;
+}
+
+bool kvm_pmu_regs_guest_owned(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.pmu.owner == VCPU_REGISTER_GUEST_OWNED;
+}
+
+void kvm_pmu_regs_set_guest_owned(struct kvm_vcpu *vcpu)
+{
+	if (kvm_pmu_regs_free(vcpu)) {
+		vcpu->arch.pmu.owner = VCPU_REGISTER_GUEST_OWNED;
+		kvm_arm_setup_mdcr_el2(vcpu);
+	}
+}
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e3d4ca167881..7d4b194bfa0a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -860,6 +860,8 @@ static bool access_pmcr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 {
 	u64 val;
 
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
@@ -887,6 +889,8 @@ static bool access_pmcr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static bool access_pmselr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			  const struct sys_reg_desc *r)
 {
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	if (pmu_access_event_counter_el0_disabled(vcpu))
 		return false;
 
@@ -905,6 +909,8 @@ static bool access_pmceid(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 {
 	u64 pmceid, mask, shift;
 
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	BUG_ON(p->is_write);
 
 	if (pmu_access_el0_disabled(vcpu))
@@ -973,6 +979,8 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 {
 	u64 idx = ~0UL;
 
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	if (r->CRn == 9 && r->CRm == 13) {
 		if (r->Op2 == 2) {
 			/* PMXEVCNTR_EL0 */
@@ -1049,6 +1057,8 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 {
 	u64 idx, reg, pmselr;
 
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
@@ -1110,6 +1120,8 @@ static bool access_pmcnten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 {
 	u64 val, mask;
 
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
@@ -1134,7 +1146,10 @@ static bool access_pmcnten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			   const struct sys_reg_desc *r)
 {
-	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+	u64 mask;
+
+	kvm_pmu_regs_set_guest_owned(vcpu);
+	mask = kvm_pmu_accessible_counter_mask(vcpu);
 
 	if (check_pmu_access_disabled(vcpu, 0))
 		return false;
@@ -1171,7 +1186,10 @@ static void writethrough_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
-	u64 mask = kvm_pmu_accessible_counter_mask(vcpu);
+	u64 mask;
+
+	kvm_pmu_regs_set_guest_owned(vcpu);
+	mask = kvm_pmu_accessible_counter_mask(vcpu);
 
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
@@ -1211,6 +1229,8 @@ static bool access_pmswinc(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 static bool access_pmuserenr(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			     const struct sys_reg_desc *r)
 {
+	kvm_pmu_regs_set_guest_owned(vcpu);
+
 	if (p->is_write) {
 		if (!vcpu_mode_priv(vcpu))
 			return undef_access(vcpu, p, r);
-- 
2.50.0.727.gbf7dc18ff4-goog


