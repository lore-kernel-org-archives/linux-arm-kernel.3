Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05786C98327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4D4gHkQKKoRXHjGIax2rHuVglLwZYYOZFYlDPDZBIgw=; b=TyzQAYWYTld2lkXB9R9wEawdCv
	ZKYbNow1qy4BzAeNp5RNgcGGF/KvClm7Zi6+JMHQrcaFZx/DlfWoJ71G6tNBWZk96MGn7swN933wu
	NyDYIVwhhY6Atc1fXQcBtrSkVOERr0crzetDB8TpGO9Y/zja4BCm+WOvnfFAoCoJgzMMEIM5b41PS
	rKM4zUCzc7cPvlMIwmjQZz/nL0qM9pXSeR00OxmMAhT0sbctWB621blm22Id6fpcrl+4QcrQxw/p1
	tuvp+LaB8nRp47aMLqnu0RlYIMBsFtCI9NGXUqIX497FIsVi004CIksd2787LrELMUCLdYmzwqi2A
	9HVqQ4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHn-0000000BkoP-1YJB;
	Thu, 24 Sep 2026 17:31:07 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGg-0000000Bk7a-1Auh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:59 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4cb254da90eso198661b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270996; x=1790875796; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4D4gHkQKKoRXHjGIax2rHuVglLwZYYOZFYlDPDZBIgw=;
        b=DgdvixTHSKbKcRNLwYflML7U/QrrUr4Mh4wo3mgY66vG4s6dkVIMnWype7Qld0DCJ8
         TQj2AOXERpCyhkF7RLJ7gdWT6PN73y1U3kRm3JSDmXqy1tzCCwhWJxChtcbeE/erPshw
         rsNxhXc8yvP0gVFCO8rLzphaQYw6FsJfHrZZeGmskTp4jggNxXEptkXH6NSy8PSBLzYW
         ufdQQjJR1Jz3QqI6K1naYGPbBgIJanZvaadsBIEQsCHCLqGhXuSoaQelzylQHP86ow1Y
         8iq40F5I3HWdn3FESMX15y3afX9eOwVSYAz4JN+P9Wj/5BFpbg7g3+DH4jbvYmSCNTz0
         ufXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270996; x=1790875796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4D4gHkQKKoRXHjGIax2rHuVglLwZYYOZFYlDPDZBIgw=;
        b=fSy57jxvAAy4T0rrf+qBQ356uyCRbVMNRH8dfYdoZt6tdj4zT8ZRqgEWGZ+3GRcNnm
         cjw/xH50uYpoJV8xikkAqdI0NYMh6XP9Iqg4skmU8H/Mnppx1zYdYZgW2CJa1aOdgeoo
         1J1kRLnl41qu3icdS0YLEvsV3pZAqrKf7HDvwGShcksr6mYdvnMzOrFKJmU0J7uyDD2k
         dxQ7mDJ62Hl3MfNn5lm2bxIZwPehyx+kleBJNAokZAlRG52iJsUdcW1bpssA4IOCulZz
         1Y3THBpho+oBiPLVAYri2R6r7FNiWeDE2vcGD8u5MRnLxFmS5X4NgWSkp30GSrl0GQKB
         COKw==
X-Forwarded-Encrypted: i=1; AKwUvBy9j2iPBCjJDbcIfBBavchCJWBVw3NrEhqp9QHwNBxNbmKu021zt0PdjyG2dVXPCvIDLmrtg6oCrJRQK86m4jPN@lists.infradead.org
X-Gm-Message-State: AFuF++kYV0748Ef8V2Uy4gUnELwIh/hiqw8KE3Y+QRItw5lkyk3k+1VP
	VYpzoUkFXAh58UN0RN+AT4C7EZpDVWot2iKWXo/183jdzLwr33I/ZruKylfKEjGV7SdxUb6Ox0v
	zmumDBrFFwnlx3Yd3YSJrIMSvmw==
X-Received: from jabdy46.prod.google.com ([2002:a05:6638:1d6e:b0:5f4:2682:8634])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2384:b0:4b3:7efc:e970 with SMTP id 5614622812f47-4d72c1440a3mr2840084b6e.5.1790270995915;
 Thu, 24 Sep 2026 10:29:55 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:24 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-19-coltonlewis@google.com>
Subject: [PATCH v9 18/22] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
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
X-CRM114-CacheID: sfid-20260924_102958_363950_6546C07F 
X-CRM114-Status: GOOD (  22.04  )
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

Because ARM hardware is not yet capable of direct PPI injection into
guests, guest counters trigger physical PMU interrupts that must be
handled by the host PMU interrupt handler.

In armv8pmu_handle_irq(), clear the overflow flags in hardware for host
counters, restrict host perf event handling to bits in cpuc->cntr_mask,
and pass the overflow flags to kvm_pmu_handle_guest_irq(). The KVM hook
clears the guest counter overflow flags in hardware and records them in
the running vCPU's virtual PMOVSSET_EL0 register for subsequent guest
interrupt injection.

Additionally, provide kvm_pmu_host_start() and kvm_pmu_host_stop() so
that armv8pmu_start() and armv8pmu_stop() toggle MDCR_EL2.HPME rather
than PMCR_EL0.E when a partitioned guest's PMU state is loaded on the
CPU.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |  8 ++++
 arch/arm64/include/asm/arm_pmuv3.h |  5 +++
 arch/arm64/kvm/pmu-direct.c        | 67 ++++++++++++++++++++++++++++++
 drivers/perf/arm_pmuv3.c           | 34 ++++++++-------
 include/kvm/arm_pmu.h              |  6 +++
 5 files changed, 104 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index cec26c12bc009..9b8d6bbbe70cf 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -180,6 +180,11 @@ static inline void write_pmintenset(u32 val)
 	write_sysreg(val, PMINTENSET);
 }
 
+static inline u32 read_pmintenset(void)
+{
+	return read_sysreg(PMINTENSET);
+}
+
 static inline void write_pmintenclr(u32 val)
 {
 	write_sysreg(val, PMINTENCLR);
@@ -235,6 +240,9 @@ static inline u64 kvm_pmu_host_counter_mask(void)
 {
 	return ~0;
 }
+static inline void kvm_pmu_handle_guest_irq(u64 pmovsr) {}
+static inline bool kvm_pmu_host_start(void) { return false; }
+static inline bool kvm_pmu_host_stop(void) { return false; }
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index cf2b2212e00a2..9037a28365951 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -110,6 +110,11 @@ static inline void write_pmintenset(u64 val)
 	write_sysreg(val, pmintenset_el1);
 }
 
+static inline u64 read_pmintenset(void)
+{
+	return read_sysreg(pmintenset_el1);
+}
+
 static inline void write_pmintenclr(u64 val)
 {
 	write_sysreg(val, pmintenclr_el1);
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 1ada09d54f68f..95b5a64052762 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -512,3 +512,70 @@ void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu)
 		kvm_pmu_load(vcpu);
 	}
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @pmovsr: Overflow flags reported by driver
+ *
+ * Set overflow flags in guest-reserved counters in the VCPU register
+ * for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 pmovsr)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	u64 mask = kvm_pmu_guest_counter_mask();
+	u64 govf = pmovsr & mask;
+	int i;
+
+	write_pmovsclr(govf);
+
+	if (!vcpu || !vcpu->arch.pmu.loaded_on_cpu)
+		return;
+
+	for_each_set_bit(i, (unsigned long *)&govf, 64)
+		set_bit(i, (unsigned long *)__ctxt_sys_reg(&vcpu->arch.ctxt, PMOVSSET_EL0));
+}
+
+/**
+ * kvm_pmu_host_start() - Enable host PMU counters while guest owns PMU
+ *
+ * When a partitioned guest owns the PMU, host counters (HPMN..N-1) are
+ * gated by MDCR_EL2.HPME rather than PMCR_EL0.E.
+ *
+ * Return: True if handled via MDCR_EL2.HPME, false if caller should use PMCR_EL0.E
+ */
+bool kvm_pmu_host_start(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (!vcpu || !kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
+		return false;
+
+	vcpu->arch.mdcr_el2 |= MDCR_EL2_HPME;
+	write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
+	isb();
+	return true;
+}
+
+/**
+ * kvm_pmu_host_stop() - Disable host PMU counters while guest owns PMU
+ *
+ * When a partitioned guest owns the PMU, host counters (HPMN..N-1) are
+ * gated by MDCR_EL2.HPME rather than PMCR_EL0.E.
+ *
+ * Return: True if handled via MDCR_EL2.HPME, false if caller should use PMCR_EL0.E
+ */
+bool kvm_pmu_host_stop(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (!vcpu || !kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
+		return false;
+
+	vcpu->arch.mdcr_el2 &= ~MDCR_EL2_HPME;
+	write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
+	isb();
+	return true;
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 4fcdae8021a56..3e5f8207a0fee 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -763,18 +763,9 @@ static void armv8pmu_disable_event_irq(struct perf_event *event)
 	armv8pmu_disable_intens(BIT(event->hw.idx));
 }
 
-static u64 armv8pmu_getreset_flags(void)
+static u64 armv8pmu_getovf_flags(void)
 {
-	u64 value;
-
-	/* Read */
-	value = read_pmovsclr();
-
-	/* Write to clear flags */
-	value &= ARMV8_PMU_CNT_MASK_ALL;
-	write_pmovsclr(value);
-
-	return value;
+	return read_pmovsclr() & ARMV8_PMU_CNT_MASK_ALL;
 }
 
 static void update_pmuserenr(u64 val)
@@ -864,7 +855,8 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 		brbe_enable(cpu_pmu);
 
 	/* Enable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
+	if (!kvm_pmu_host_start())
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
 }
 
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
@@ -875,7 +867,8 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 		brbe_disable();
 
 	/* Disable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
+	if (!kvm_pmu_host_stop())
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
 }
 
 static void read_branch_records(struct pmu_hw_events *cpuc,
@@ -890,16 +883,16 @@ static void read_branch_records(struct pmu_hw_events *cpuc,
 
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
-	u64 pmovsr;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
+	u64 pmovsr;
 	int idx;
 
 	/*
-	 * Get and reset the IRQ flags
+	 * Get the IRQ flags
 	 */
-	pmovsr = armv8pmu_getreset_flags();
+	pmovsr = armv8pmu_getovf_flags();
 
 	/*
 	 * Did an overflow occur?
@@ -907,6 +900,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	if (!armv8pmu_has_overflowed(pmovsr))
 		return IRQ_NONE;
 
+	/*
+	 * Guest flag reset is handled by the kvm hook at the bottom of
+	 * this function.
+	 */
+	write_pmovsclr(pmovsr & ~kvm_pmu_guest_counter_mask());
+
 	/*
 	 * Handle the counter(s) overflow(s)
 	 */
@@ -948,6 +947,9 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		 */
 		perf_event_overflow(event, &data, regs);
 	}
+
+	kvm_pmu_handle_guest_irq(pmovsr);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 0f2e39367d637..955f142a41b94 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -109,6 +109,9 @@ u64 kvm_pmu_guest_counter_mask(void);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
 void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu);
+void kvm_pmu_handle_guest_irq(u64 pmovsr);
+bool kvm_pmu_host_start(void);
+bool kvm_pmu_host_stop(void);
 void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx);
 
 #define kvm_pmu_get_access(vcpu)	((vcpu)->arch.pmu.access)
@@ -274,6 +277,9 @@ static inline u64 kvm_pmu_guest_counter_mask(void)
 	return 0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 pmovsr) {}
+static inline bool kvm_pmu_host_start(void) { return false; }
+static inline bool kvm_pmu_host_stop(void) { return false; }
 static inline void kvm_pmu_apply_single_event_filter(struct kvm_vcpu *vcpu, u8 idx) {}
 
 static inline bool has_kvm_pmu_partition_support(void)
-- 
2.56.0.rc1.310.g51773c2048-goog


