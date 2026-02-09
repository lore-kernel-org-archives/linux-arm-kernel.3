Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E91E94621
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzFE4miTcOtAr/dPUTYbZiH7kW5NfaMHCMboYuCvXco=; b=EhcLdUVcGX/0+pNjUVEA1bahHE
	3hxPuv7pL7a1soGFpNySUJJYVM2DfFSqSBQ3qtRBrmRrGlYLLz0z2HW2Y2+1PkV2VplHndwkh6Jjb
	coIMboH/S+AgA+hM4MgiVIW/lcusElc2ouCS45fQK3mg+admpLmar13rQYKWI40Gon01Muf4vltva
	uXhH0o66sj5sqX96U3AAOuSL2oiGIk+VtoOCmy/RUklBKhD1ezcnCMz+hmOoXi/Fjm6cEY6BfBr8E
	UYccvWduDXzaSb2i6I3tFQACP9fuhtn/3QeYLVRj2dFTJxY6c4wzxm5ygc9dSYls/W4hgcFPv1Xba
	0yAShIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwM-0000000G7aC-0mR1;
	Mon, 09 Feb 2026 22:41:10 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwA-0000000G7Mh-3LJ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:00 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-40948b7e832so1285330fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676855; x=1771281655; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzFE4miTcOtAr/dPUTYbZiH7kW5NfaMHCMboYuCvXco=;
        b=0EW4EYRd5udJho8a5nbYU5EL+ZdpjfNivG/BY8Ikeg/tLIOLTh0ePxnvawL/bzds1E
         oMzJAkXoc7ihFZ+LrQ5ET/RhIz5zQBstz8JIs3ThHYBl6ZfcTq/BTa3n2ulj52So3hfz
         o9p9gvrXlb7wIuxIxryHLPSiAieGx1m4LVv43kYwd7iuHKh9iOTryWR03RDo6yNpR49f
         LYfgFPOyefKu93N/vUPHQz+jKsnj9uo7u1IpxggZ+pxXuCe0ujAy3shpmIPZkZ11Au57
         3r3c/oyDCv9GlZuxO7B2sBbvP0Jvva02i74eGHXFSmxt13AmKlXSax+mUnYUfOnMN6pB
         t0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676855; x=1771281655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzFE4miTcOtAr/dPUTYbZiH7kW5NfaMHCMboYuCvXco=;
        b=tw/AkrLGG7SWi11pD6GdiQaWdDOZyZyPAw1+QuFJN5oP5E+iMXNul51p8uOg15coQS
         dtZnddz9rYDHG257iQOmgJ0e3Zpsj3ho9fBaPF7XSwn3KISNksWrMyQcOX2OOGQUp7Ob
         QFFPUHuwYcRSWog1RuGrrukCpIO5A5Rk8+8aZcMp24VotzXGt6D5bAYLQljgO4ji3Zzc
         9EvCg2OqdvTSmXtZUSSzGwy9lReF/Eq+QvkDSw2lAowtLKyMFKO6msPVe2arjy04nxL5
         g61ENdEgyzC6zcvRf6bHbgLV/1bN0YyEBPPwaa3qc1723Tr1Akkv/SHNzbghYuexn7Qo
         TJ0g==
X-Forwarded-Encrypted: i=1; AJvYcCXo2J+3mE2FXDBdS1P16KYdl+rLHiJwAsiGkkj6uIbU7LzqNaZgIQffMXvO5Dlz4N1rAT93S1/q7GfScWctUclI@lists.infradead.org
X-Gm-Message-State: AOJu0YzPPGk3lXCW4vae6DtjZWYi8ATYhKyPVDUwLQS0ZkxlcjbwM4B5
	GxHezouqiTFcoZdsEs0yGuS3MUxviXC+910UOu6oG+sRwzIaRsMApC+HCBkuDDSgj47N72qm9px
	miHNLLyctSlaJ7aJElOwfFeAXwQ==
X-Received: from iozc9.prod.google.com ([2002:a05:6602:3349:b0:957:7945:e822])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1610:b0:66b:ea2:afa with SMTP id 006d021491bc7-66d09f9c4bbmr4972919eaf.20.1770676854816;
 Mon, 09 Feb 2026 14:40:54 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:05 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-11-coltonlewis@google.com>
Subject: [PATCH v6 10/19] KVM: arm64: Setup MDCR_EL2 to handle a partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144058_952877_D2466AC3 
X-CRM114-Status: GOOD (  22.12  )
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

Setup MDCR_EL2 to handle a partitioned PMU. That means calculate an
appropriate value for HPMN instead of the default maximum setting the
host allows (which implies no partition) so hardware enforces that a
guest will only see the counters in the guest partition.

Setting HPMN to a non default value means the global enable bit for
the host counters is now MDCR_EL2.HPME instead of the usual
PMCR_EL0.E. Enable the HPME bit to allow the host to count guest
events. Since HPME only has an effect when HPMN is set which we only
do for the guest, it is correct to enable it unconditionally here.

Unset the TPM and TPMCR bits, which trap all PMU accesses, if
FGT (fine grain trapping) is being used.

If available, set the filtering bits HPMD and HCCD to be extra sure
nothing in the guest counts at EL2.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/debug.c      | 29 ++++++++++++++++++++++++++---
 arch/arm64/kvm/pmu-direct.c | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/pmu.c        |  7 +++++++
 include/kvm/arm_pmu.h       | 11 +++++++++++
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 3ad6b7c6e4ba7..0ab89c91e19cb 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -36,20 +36,43 @@ static int cpu_has_spe(u64 dfr0)
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
+	int hpmn = kvm_pmu_hpmn(vcpu);
+
 	preempt_disable();
 
 	/*
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
 				MDCR_EL2_TPMCR |
 				MDCR_EL2_TDRA |
-				MDCR_EL2_TDOSA);
+				MDCR_EL2_TDOSA |
+				MDCR_EL2_HPME);
+
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)) {
+		/*
+		 * Filtering these should be redundant because we trap
+		 * all the TYPER and FILTR registers anyway and ensure
+		 * they filter EL2, but set the bits if they are here.
+		 */
+		if (is_pmuv3p1(read_pmuver()))
+			vcpu->arch.mdcr_el2 |= MDCR_EL2_HPMD;
+		if (is_pmuv3p5(read_pmuver()))
+			vcpu->arch.mdcr_el2 |= MDCR_EL2_HCCD;
+
+		/*
+		 * Take out the coarse grain traps if we are using
+		 * fine grain traps.
+		 */
+		if (kvm_vcpu_pmu_use_fgt(vcpu))
+			vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);
+
+	}
 
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 275bd4156871e..f2e6b1eea8bd6 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -139,3 +139,27 @@ void kvm_pmu_host_counters_disable(void)
 	mdcr &= ~MDCR_EL2_HPME;
 	write_sysreg(mdcr, mdcr_el2);
 }
+
+/**
+ * kvm_pmu_hpmn() - Calculate HPMN field value
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Calculate the appropriate value to set for MDCR_EL2.HPMN. If
+ * partitioned, this is the number of counters set for the guest if
+ * supported, falling back to max_guest_counters if needed. If we are not
+ * partitioned or can't set the implied HPMN value, fall back to the
+ * host value.
+ *
+ * Return: A valid HPMN value
+ */
+u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
+{
+	u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
+
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)
+	    && !vcpu_on_unsupported_cpu(vcpu)
+	    && (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0))
+		return nr_guest_cntr;
+
+	return *host_data_ptr(nr_event_counters);
+}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 344ed9d8329a6..b198356d772ca 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -542,6 +542,13 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
 		return 1;
 
+	/*
+	 * If partitioned then we are limited by the max counters in
+	 * the guest partition.
+	 */
+	if (kvm_pmu_is_partitioned(arm_pmu))
+		return arm_pmu->max_guest_counters;
+
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index f21439000129b..8fab533fa3ebc 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -98,6 +98,9 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
+u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
+
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
@@ -162,6 +165,14 @@ static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
 {
 	return false;
 }
+static inline u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
-- 
2.53.0.rc2.204.g2597b5adb4-goog


