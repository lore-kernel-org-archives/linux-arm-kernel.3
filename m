Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C741C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iwQDxRfrOAjdLEnj6KqRv2uciFkrG85NKoY1Q5Ne64=; b=am3fs0549i4tSX7tnzIRSAkSip
	89Z5/nb68rFBwTR8ICrUy5C/FXVtDssAmuQ4jqYBmvY4kbSrZXsBM6kZkd7T5JL8fN/L2pTQUO7q7
	sdGpNhpoGxPob5WyAk+X2KFiCnjscL0a/U4QpJpafGNYH+SlKa+LJUfjO4zHPFZVZhYvPr86seny6
	d/5PVxCz1KnvKBMUEheZ0nGXoch1QN67OOlMdSo5Z3ccIc0t58A8kbmsqxUcG0ZPdS+4aWZpAbKuh
	GUV/CunVrn8geFOhYmeyN6laU6G5ko4D8nGhajWmfWz2tvWEgotRScujr+8dy+xe2wCgVwusme0Er
	CCWHxzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FY3-0000000HKEQ-2mc1;
	Sun, 20 Sep 2026 11:17:31 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FXr-0000000HK5i-1ruy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 11:17:21 +0000
Received: from [192.168.10.153] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68KBG36g088236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 20 Sep 2026 20:16:17 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=8iwQDxRfrOAjdLEnj6KqRv2uciFkrG85NKoY1Q5Ne64=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1789902977; v=1;
        b=kodpUlKskgJDYfgFYWg/SDs1zojEj+vAHqhdwVsBSFcoiu19swkP4YohevElDlpw
         idIF6OliQqAukZrtr+qT+F97ppYV4l14eNumGhTt+fJa/HxHb5wZoz49LfqFAYDK
         IlD37vtgNQmaD5SeeOhawR9aXac7HOewgnifUALoOotPYLozJKcN4FZjs7Hh+3nl
         6wattudp6JzMHJ70S0NB6MamVVAfIv7MxuU+WI0RSP9CXxAXEnumtpxWsh1G/jJJ
         1tHQlMbIuAhGHgyRQD7Pt/NYGb5jG5wMyBObJ9Mtw413fpifYjcp0ka86rLsI6jL
         T3fevnJLFuowCuKLindWKQ==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sun, 20 Sep 2026 20:16:00 +0900
Subject: [PATCH v11 19/21] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hybrid-v11-19-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8244;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=07g7Wsnxy7TV71yYjMKtl6l/jv8TXnMqlazGTus0lG4=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ9b6A4UWPwwz+YoP+p378f99InMC40/BpPhH57TfJKpO9
 Lz9vlCvo5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCKHUhj+GSxJSYyd7lhsPUHp
 OPfhTxdZozmtXkp69J113mnOdOVtLcN/Fzftn+d3PJ9TaMZ7XzTsaLark8eW8ANXonZufcF0X7q
 LDwA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_041719_717676_8F9AA68F 
X-CRM114-Status: GOOD (  25.02  )
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

Add internal state for PMUv3 emulation without programmable event
counters. When fixed-counters-only mode is active, KVM reports no
programmable counters and hides PMCEID, avoiding event-counter state
whose behavior can depend on the selected hardware PMU.

The cycle counter still uses a host perf event. Unlike the normal PMU
path, fixed-counters-only mode may create that event from the hardware
PMU attached to the VCPU's current pCPU. If the VCPU later loads on a
pCPU that is not covered by the existing event's PMU, request a PMU
reload so the cycle counter can be recreated against the new pCPU's PMU.
Keep this affinity check limited to fixed-counters-only VMs; the normal
programmable-counter mode continues to use the VM-wide PMU and does not
need per-load reload decisions.

Registered pPMUs must cover every CPU on which fixed-counters-only
emulation runs. On ACPI systems, a CPU brought online after PMU probing
may have an unregistered PMU implementation. Full coverage is also not
guaranteed when ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS is present.

Fixed-counters-only emulation is not supported once a vCPU runs on an
uncovered CPU. If event creation detects such a CPU, warn and add
TAINT_CPU_OUT_OF_SPEC.

Add a separate internal flag for explicit userspace PMU selection. The
UAPI wiring added later will use it to keep explicit PMU selection and
fixed-counters-only mode mutually exclusive while still allowing
fixed-counters-only mode to replace the default PMU selected during
KVM_ARM_VCPU_INIT.

The UAPI wiring that sets the fixed-counters-only flag and records
explicit PMU selection is added later in the series.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 arch/arm64/include/asm/kvm_host.h |  4 +++
 arch/arm64/kvm/arm.c              |  2 ++
 arch/arm64/kvm/pmu-emul.c         | 60 ++++++++++++++++++++++++++++++++++-----
 include/kvm/arm_pmu.h             |  2 ++
 4 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 766c5cb32f54..d273bfc4cbaf 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -367,6 +367,10 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* PMUv3 is emulated with an explicitly specified hardware PMU */
+#define KVM_ARCH_FLAG_PMU_V3_EXPLICIT			12
+	/* PMUv3 is emulated without programmable event counters */
+#define KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY	13
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 55b07926ce2e..4b1f06a36055 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -665,6 +665,7 @@ static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_s2_mmu *mmu;
+	int last_cpu = vcpu->cpu;
 	int *last_ran;
 
 	if (is_protected_kvm_enabled())
@@ -714,6 +715,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_vcpu_load_pmu(vcpu, last_cpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a303752c5e61..9c1e2f3e41db 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -83,6 +83,11 @@ u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
 	return mask;
 }
 
+static bool kvm_pmu_fixed_counters_only(struct kvm *kvm)
+{
+	return test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags);
+}
+
 /**
  * kvm_pmc_is_64bit - determine if counter is 64bit
  * @pmc: counter context
@@ -725,14 +730,10 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(int cpu)
 	return NULL;
 }
 
-/**
- * kvm_pmu_create_perf_event - create a perf event for a counter
- * @pmc: Counter context
- */
-static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
+static void kvm_pmu_create_perf_event_with_pmu(struct kvm_pmc *pmc,
+					       struct arm_pmu *arm_pmu)
 {
 	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
-	struct arm_pmu *arm_pmu = vcpu->kvm->arch.arm_pmu;
 	struct perf_event *event;
 	struct perf_event_attr attr;
 	int eventsel;
@@ -766,7 +767,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	 * Don't create an event if we're running on hardware that requires
 	 * PMUv3 event translation and we couldn't find a valid mapping.
 	 */
-	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
+	eventsel = kvm_map_pmu_event(arm_pmu, eventsel);
 	if (eventsel < 0)
 		return;
 
@@ -811,6 +812,32 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	pmc->perf_event = event;
 }
 
+/**
+ * kvm_pmu_create_perf_event - create a perf event for a counter
+ * @pmc: Counter context
+ */
+static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
+{
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+	struct arm_pmu *arm_pmu = vcpu->kvm->arch.arm_pmu;
+
+	if (kvm_pmu_fixed_counters_only(vcpu->kvm)) {
+		do {
+			arm_pmu = kvm_pmu_probe_armpmu(READ_ONCE(vcpu->cpu));
+
+			if (!arm_pmu) {
+				pr_warn_once("kvm: Unsupported PMU variation detected.\n");
+				add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+				return;
+			}
+
+			kvm_pmu_create_perf_event_with_pmu(pmc, arm_pmu);
+		} while (!cpumask_test_cpu(READ_ONCE(vcpu->cpu), &arm_pmu->supported_cpus));
+	} else {
+		kvm_pmu_create_perf_event_with_pmu(pmc, arm_pmu);
+	}
+}
+
 /**
  * kvm_pmu_set_counter_event_type - set selected counter to monitor some event
  * @vcpu: The vcpu pointer
@@ -897,6 +924,13 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 	u64 val, mask = 0;
 	int base, i, nr_events;
 
+	/*
+	 * Hide the hardware PMU's event set to keep PMCEID stable across
+	 * physical CPU migration.
+	 */
+	if (kvm_pmu_fixed_counters_only(vcpu->kvm))
+		return 0;
+
 	if (!pmceid1) {
 		val = compute_pmceid0(vcpu);
 		base = 0;
@@ -924,6 +958,15 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 	return val & mask;
 }
 
+void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
+{
+	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu || last_cpu == -1)
+		return;
+
+	if (kvm_pmu_probe_armpmu(vcpu->cpu) != kvm_pmu_probe_armpmu(last_cpu))
+		kvm_pmu_request_recreate(vcpu);
+}
+
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 {
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
@@ -1048,6 +1091,9 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
 
+	if (kvm_pmu_fixed_counters_only(kvm))
+		return 0;
+
 	/*
 	 * Under KVM_ARM_VCPU_PMU_V3_STRICT no PMU exists until userspace sets
 	 * one, so this can be reached before arm_pmu is set. Report no
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index fca00f7f4c0a..33d81461f5cd 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -63,6 +63,7 @@ void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val);
 void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 				    u64 select_idx);
+void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu);
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu);
 int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
 			    struct kvm_device_attr *attr);
@@ -176,6 +177,7 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
+static inline void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu) {}
 static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
 static inline u8 kvm_arm_pmu_get_pmuver_limit(void)
 {

-- 
2.55.0


