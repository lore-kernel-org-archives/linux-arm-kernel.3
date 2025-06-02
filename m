Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2C7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 20:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPN7IQ4QZrByG0258EKRU9FkVzNdKi6RapVUPx28H4Q=; b=Kth6DnciIdM/xl1ZycyE9ffggI
	L3ugjlyI5ixq3HefXBXtuwbtp+9fnNx3mJufRlAU+rCOVZEOgvYYafYy+BtuNKwXSjuMM6ybsjKJ/
	4wV7FI0Jmuv06SqkR2Pi7PmCbJd6fcebrE1oqhF8q9PewJCBS+1URKPRm5EsB3F7TXjnBlIQStHXd
	j+CepYhoMMnciRt3hi1DL+XZuzi/kZ2oRDNI2EunOoda9ovYaHBfHog2DsEsuHwAtUJsR6q3NaL4j
	ipm23QH+xgBIV9zLnMIBEibAZvQnI8OO7FOlGvJsdCjqym7zf6STCMugHwlN1PmOMDF0H80vuXn6c
	GHGzd7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBL1-00000008ehL-0MW1;
	Mon, 02 Jun 2025 20:00:51 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqN-00000008ULV-2RRt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:12 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddb4ed2dcbso9578645ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892550; x=1749497350; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vPN7IQ4QZrByG0258EKRU9FkVzNdKi6RapVUPx28H4Q=;
        b=zA3DuhEvf0tGayzYpPZP0Rs0zqtmFbXI48kMGbBZC/1yndOLzsOj9XekLLOJFIH4D8
         RtL+lAL1aMg0rkIHThG0gVJTpH/6y/0CZSmcMjDIn07eYWAicIc43qfJrdgEJnK3zBV3
         gy8qd06x0KioCYAKZQ/WR+yMchuQKkEk2NtMQwkpncgAehZ9Ev3eKqhvvfj9Ioj7NarP
         QO8CaC1703K9RS/HiM8zQzby3YEzveNvrqwmkSt5WbYaF9MlfQJYFCKVONlUknDl9yqk
         ythdZuHWb4sGTD2psDTGTHPObozBdnJ1BwyiQ76cmUnCuqPPMbCr5RljUoguCyO8a08m
         HiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892550; x=1749497350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPN7IQ4QZrByG0258EKRU9FkVzNdKi6RapVUPx28H4Q=;
        b=JbnjWqM52i/1/fmdnKx8pJj9UCCKWOZJzzIN4XK7jQiIuAXaagDB4cSa56TL896Tyt
         LUTJ70TT8+0DF7BWwGeJOeNJYP5luiFlKuhv0AQjuTWODvafVWGWb4GZK8anOB/0qNQf
         0cnS04UhzAT49gjBlCbCgrMFP4U1Yy2jqzXEoKf8G8k/x1XUtrc2ydttcgD9qHEsIij6
         xb7djfGB26/97getzf8D69mJJ3cCUaI8iqpn2/Tw3HHciyVDDbxoIIhgJ2rS2ncWNZS9
         nSYVvV2qD+HUcIgQB0GI1VHasco9GSU4tgPEW5FjfE0bedfjU+q/DcWk7AhgzotbHDsZ
         Nidg==
X-Forwarded-Encrypted: i=1; AJvYcCWaNvwfTebxti5tbaf21SgRM7hh9MCT33ZeAkk7Csf8X1TlxF4Gff8MWskbZpVKXzqCvBO1FqGuyNZ6THvKNW0z@lists.infradead.org
X-Gm-Message-State: AOJu0YxH4wvOsqf5ihZVb6i8c1kv9yZ7KKDnRbn2n7dygNFq1laotwYx
	+pIjwy5QTTAIG3NUwjYgptToLtfA5IRugIWEt6cR8bqDg7+brKEDloxJPu3wMkeEAG9YIQ2GTmp
	pC2cyLyqluMJ3O7NKtpcyd9cU3Q==
X-Google-Smtp-Source: AGHT+IH86fHCzapUTGFWqzE+3QpTaBJs9I3lg0JaK8lTkophTRu4KMdA3DgBlYLQP0BjLgK/7D8Z4lUFZI+wwSJ2TQ==
X-Received: from ilbbf17.prod.google.com ([2002:a05:6e02:3091:b0:3dc:a282:283e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:3c04:b0:3d9:36a8:3d98 with SMTP id e9e14a558f8ab-3dd99bd048bmr170872535ab.2.1748892550667;
 Mon, 02 Jun 2025 12:29:10 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:58 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-14-coltonlewis@google.com>
Subject: [PATCH 13/17] KVM: arm64: Context switch Partitioned PMU guest registers
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122911_621586_D8F38408 
X-CRM114-Status: GOOD (  20.02  )
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

Save and restore newly untrapped registers that will be directly
accessed by the guest when the PMU is partitioned.

* PMEVCNTRn_EL0
* PMCCNTR_EL0
* PMICNTR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1

If the PMU is not partitioned or MDCR_EL2.TPM is set, all PMU
registers are trapped so return immediately.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h |  17 ++++-
 arch/arm64/include/asm/kvm_host.h  |   4 +
 arch/arm64/kvm/arm.c               |   2 +
 arch/arm64/kvm/pmu-part.c          | 117 +++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 5d01ed25c4ef..a00845cffb3f 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -107,6 +107,11 @@ static inline void write_pmcntenset(u64 val)
 	write_sysreg(val, pmcntenset_el0);
 }
 
+static inline u64 read_pmcntenset(void)
+{
+	return read_sysreg(pmcntenset_el0);
+}
+
 static inline void write_pmcntenclr(u64 val)
 {
 	write_sysreg(val, pmcntenclr_el0);
@@ -117,6 +122,11 @@ static inline void write_pmintenset(u64 val)
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
@@ -162,11 +172,16 @@ static inline u64 read_pmovsclr(void)
 	return read_sysreg(pmovsclr_el0);
 }
 
-static inline void write_pmuserenr(u32 val)
+static inline void write_pmuserenr(u64 val)
 {
 	write_sysreg(val, pmuserenr_el0);
 }
 
+static inline u64 read_pmuserenr(void)
+{
+	return read_sysreg(pmuserenr_el0);
+}
+
 static inline void write_pmuacr(u64 val)
 {
 	write_sysreg_s(val, SYS_PMUACR_EL1);
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4ea045098bfa..955359f20161 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -453,9 +453,11 @@ enum vcpu_sysreg {
 	PMEVCNTR0_EL0,	/* Event Counter Register (0-30) */
 	PMEVCNTR30_EL0 = PMEVCNTR0_EL0 + 30,
 	PMCCNTR_EL0,	/* Cycle Counter Register */
+	PMICNTR_EL0,	/* Instruction Counter Register */
 	PMEVTYPER0_EL0,	/* Event Type Register (0-30) */
 	PMEVTYPER30_EL0 = PMEVTYPER0_EL0 + 30,
 	PMCCFILTR_EL0,	/* Cycle Count Filter Register */
+	PMICFILTR_EL0,	/* Insturction Count Filter Register */
 	PMCNTENSET_EL0,	/* Count Enable Set Register */
 	PMINTENSET_EL1,	/* Interrupt Enable Set Register */
 	PMOVSSET_EL0,	/* Overflow Flag Status Set Register */
@@ -1713,6 +1715,8 @@ struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu);
+void kvm_pmu_load(struct kvm_vcpu *vcpu);
+void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 3b9c003f2ea6..4a1cc7b72295 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -615,6 +615,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 		kvm_vcpu_load_vhe(vcpu);
 	kvm_arch_vcpu_load_fp(vcpu);
 	kvm_vcpu_pmu_restore_guest(vcpu);
+	kvm_pmu_load(vcpu);
 	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
 		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
 
@@ -657,6 +658,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_timer_vcpu_put(vcpu);
 	kvm_vgic_put(vcpu);
 	kvm_vcpu_pmu_restore_host(vcpu);
+	kvm_pmu_put(vcpu);
 	if (vcpu_has_nv(vcpu))
 		kvm_vcpu_put_hw_mmu(vcpu);
 	kvm_arm_vmid_clear_active();
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 179a4144cfd0..40c72caef34e 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -8,6 +8,7 @@
 #include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
+#include <asm/kvm_emulate.h>
 #include <asm/kvm_pmu.h>
 #include <asm/arm_pmuv3.h>
 
@@ -202,3 +203,119 @@ void kvm_pmu_host_counters_disable(void)
 	mdcr &= ~MDCR_EL2_HPME;
 	write_sysreg(mdcr, mdcr_el2);
 }
+
+/**
+ * kvm_pmu_load() - Load untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Load all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_load(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u8 i;
+	u64 val;
+
+	/*
+	 * If the PMU is not partitioned, don't bother.
+	 *
+	 * If we have MDCR_EL2_TPM, every PMU access is trapped which
+	 * implies we are using the emulated PMU instead of direct
+	 * access.
+	 */
+	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
+		return;
+
+	for (i = 0; i < pmu->hpmn; i++) {
+		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
+		write_pmevcntrn(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMCCNTR_EL0);
+	write_pmccntr(val);
+
+	if (cpus_have_final_cap(ARM64_HAS_PMICNTR)) {
+		val = __vcpu_sys_reg(vcpu, PMICNTR_EL0);
+		write_pmicntr(val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMUSERENR_EL0);
+	write_pmuserenr(val);
+
+	val = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+	write_pmselr(val);
+
+	val = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	write_pmcr(val);
+
+	/*
+	 * Loading these registers is tricky because of
+	 * 1. Applying only the bits for guest counters (indicated by mask)
+	 * 2. Setting and clearing are different registers
+	 */
+	val = __vcpu_sys_reg(vcpu, PMCNTENSET_EL0);
+	write_pmcntenset(val & mask);
+	write_pmcntenclr(~val & mask);
+
+	val = __vcpu_sys_reg(vcpu, PMINTENSET_EL1);
+	write_pmintenset(val & mask);
+	write_pmintenclr(~val & mask);
+}
+
+/**
+ * kvm_pmu_put() - Put untrapped PMU registers
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Put all untrapped PMU registers from the VCPU into the PCPU. Mask
+ * to only bits belonging to guest-reserved counters and leave
+ * host-reserved counters alone in bitmask registers.
+ */
+void kvm_pmu_put(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u8 i;
+	u64 val;
+
+	/*
+	 * If the PMU is not partitioned, don't bother.
+	 *
+	 * If we have MDCR_EL2_TPM, every PMU access is trapped which
+	 * implies we are using the emulated PMU instead of direct
+	 * access.
+	 */
+	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
+		return;
+
+	for (i = 0; i < pmu->hpmn; i++) {
+		val = read_pmevcntrn(i);
+		__vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i) = val;
+	}
+
+	val = read_pmccntr();
+	__vcpu_sys_reg(vcpu, PMCCNTR_EL0) = val;
+
+	if (this_cpu_has_cap(ARM64_HAS_PMICNTR)) {
+		val = read_pmicntr();
+		__vcpu_sys_reg(vcpu, PMICNTR_EL0) = val;
+	}
+
+	val = read_pmuserenr();
+	__vcpu_sys_reg(vcpu, PMUSERENR_EL0) = val;
+
+	val = read_pmselr();
+	__vcpu_sys_reg(vcpu, PMSELR_EL0) = val;
+
+	val = read_pmcr();
+	__vcpu_sys_reg(vcpu, PMCR_EL0) = val;
+
+	/* Mask these to only save the guest relevant bits. */
+	val = read_pmcntenset();
+	__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) = val & mask;
+
+	val = read_pmintenset();
+	__vcpu_sys_reg(vcpu, PMINTENSET_EL1) = val & mask;
+}
-- 
2.49.0.1204.g71687c7c1d-goog


