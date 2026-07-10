Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB74C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=noT/QqAliZBhFyawFYslzQgo6v2k6ipjVMsOMMsynIw=; b=Z8UDLM7GTVx4GBqJ7mCoT6rVvz
	ZvM7BiRjeOeBJZ1tFqjNHTsf323hqPMG0PRG4OzI0h8c+XdNZ8dAeXowdfXs4899tAVcewK2C7MvT
	3bCxf3lT8yZ885vZ0TuV+/ptwIrO2kpV7Xum9JnonCzKMYsK65vDJDCOz2A7pYfWABevLCJpbytmX
	vti3khDzjPWiHCnvLgSRboyIK1qZqe+qKyQvMGtA1DQ9cAPNv+KTYce5jXD7AVorHOOCqUxT35D9w
	4UlplWMfSSLnedkvm7AVVQmVxMxsWJkonf7fJImwuIcCkkwadLqUyfBcM0Bb4tHB2h4b7RtAgxAel
	MwsQKl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9DB-00000004ncd-0Z8Y;
	Fri, 10 Jul 2026 11:16:05 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9D8-00000004naK-2gX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:16:03 +0000
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 66ABEvsN024946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 10 Jul 2026 20:15:12 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=noT/QqAliZBhFyawFYslzQgo6v2k6ipjVMsOMMsynIw=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1783682112; v=1;
        b=s8KhwOEQ0TjZ0sa5iX9TriaWVWFZ7j48jRfLsphEyI5FuZn9G+Fldfwg/DG9H0vd
         prIJOloH+Qfq9puU6SYOdH/SOcCwfKwQOLL7FQvRm+zTh2Jc9f+UoOavoEBh6+s7
         Siu3ll6DOafoctznF7SlNHORlqwKImPeRcUhudMQlokhomGW0nAdGljxvfCz8Ph0
         fH9ct3+NFK0nyJM4NO/m4rA0Ccn7qibUFreMKG3Mv2OzYSxyXGA7X6mNez6T9pHl
         5YxoTRNXNA9oIVD98uj/afd9c1QFbDDEBosrMMf2JJTNE8AWc4crPY6qbTVaSv37
         BMd+OKYIDaFgYLLL3DDMGA==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 10 Jul 2026 20:15:03 +0900
Subject: [PATCH v8 09/11] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-hybrid-v8-9-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-925f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=8614;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=1xofsopO2LYUhV98oaA7uLf7eeShoy+dvPyeps8ZL/w=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ1bAFSuvbQqHmZNzbGWmNpRlqCx59PJh3etFfyrm6cV2b
 ZOMFF7bUcrCIMbFICumyJJStJtbI7r2U2FCfAvMHFYmkCEMXJwCMJHmHQz/YyoO3md3ejGF/c7p
 uVb+ikqnDq17esvb6ExJpZnZzXcv+Rh+s9yN1Ty+zW76jr97oou1dzutvyxxyJ7/w911D2p418+
 1ZgMA
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_041602_909117_6A8B8B76 
X-CRM114-Status: GOOD (  25.30  )
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
 arch/arm64/kvm/pmu-emul.c         | 69 ++++++++++++++++++++++++++++++++++-----
 include/kvm/arm_pmu.h             |  2 ++
 4 files changed, 69 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0c39d9db7d57..aa07b05b8231 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -353,6 +353,10 @@ struct kvm_arch {
 #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
 	/* Unhandled SEAs are taken to userspace */
 #define KVM_ARCH_FLAG_EXIT_SEA				11
+	/* PMUv3 is emulated with an explicitly specified hardware PMU */
+#define KVM_ARCH_FLAG_PMU_V3_EXPLICIT			12
+	/* PMUv3 is emulated without progammable event counters */
+#define KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY	13
 	unsigned long flags;
 
 	/* VM-wide vCPU feature set */
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 58d0783f254d..b21bd8cf13c9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -638,6 +638,7 @@ static bool kvm_vcpu_should_clear_twe(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_s2_mmu *mmu;
+	int last_cpu = vcpu->cpu;
 	int *last_ran;
 
 	if (is_protected_kvm_enabled())
@@ -687,6 +688,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (has_vhe())
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
+	kvm_vcpu_load_pmu(vcpu, last_cpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 1dd8aa6a027d..1aa115aee781 100644
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
@@ -330,7 +335,12 @@ u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
 
 static void kvm_pmc_enable_perf_event(struct kvm_pmc *pmc)
 {
-	if (!pmc->perf_event) {
+	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
+
+	if (!pmc->perf_event ||
+	    (kvm_pmu_fixed_counters_only(vcpu->kvm) &&
+	     !cpumask_test_cpu(READ_ONCE(vcpu->cpu),
+			       &to_arm_pmu(pmc->perf_event->pmu)->supported_cpus))) {
 		kvm_pmu_create_perf_event(pmc);
 		return;
 	}
@@ -694,14 +704,10 @@ static struct arm_pmu *kvm_pmu_probe_armpmu(int cpu)
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
@@ -735,7 +741,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 	 * Don't create an event if we're running on hardware that requires
 	 * PMUv3 event translation and we couldn't find a valid mapping.
 	 */
-	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
+	eventsel = kvm_map_pmu_event(arm_pmu, eventsel);
 	if (eventsel < 0)
 		return;
 
@@ -780,6 +786,29 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
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
+			if (WARN_ON_ONCE(!arm_pmu))
+				return;
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
@@ -813,6 +842,15 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
 	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
 		return;
 
+	/*
+	 * IMPDEF PMUv3 traps are non-architectural, and KVM cannot assume a
+	 * uniform PMUv3-compatible arm_pmu is available on all CPUs.
+	 */
+	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS)) {
+		kvm_info("Non-architectural PMU, tainting kernel\n");
+		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+	}
+
 	guard(mutex)(&arm_pmus_lock);
 
 	entry = kmalloc_obj(*entry);
@@ -865,6 +903,9 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 	u64 val, mask = 0;
 	int base, i, nr_events;
 
+	if (kvm_pmu_fixed_counters_only(vcpu->kvm))
+		return 0;
+
 	if (!pmceid1) {
 		val = compute_pmceid0(cpu_pmu);
 		base = 0;
@@ -892,6 +933,15 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 	return val & mask;
 }
 
+void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
+{
+	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu || last_cpu == -1)
+		return;
+
+	if (kvm_pmu_probe_armpmu(vcpu->cpu) != kvm_pmu_probe_armpmu(last_cpu))
+		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+}
+
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu)
 {
 	u64 mask = kvm_pmu_implemented_counter_mask(vcpu);
@@ -1003,6 +1053,9 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
 
+	if (kvm_pmu_fixed_counters_only(kvm))
+		return 0;
+
 	/*
 	 * PMUv3 requires that all event counters are capable of counting any
 	 * event, though the same may not be true of non-PMUv3 hardware.
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0a36a3d5c894..9720fbd0eeb4 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -59,6 +59,7 @@ void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val);
 void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu, u64 data,
 				    u64 select_idx);
+void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu);
 void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu);
 int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
 			    struct kvm_device_attr *attr);
@@ -164,6 +165,7 @@ static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
 static inline void kvm_pmu_update_vcpu_events(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu) {}
 static inline void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu) {}
+static inline void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu) {}
 static inline void kvm_vcpu_reload_pmu(struct kvm_vcpu *vcpu) {}
 static inline u8 kvm_arm_pmu_get_pmuver_limit(void)
 {

-- 
2.55.0


