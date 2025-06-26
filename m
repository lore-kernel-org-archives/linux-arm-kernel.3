Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478DDC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 22:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EUw4Y0mcnEG/FkgSChX2W9q1RZ2xMCnbVv00SQ/fhA=; b=izUVlzi1SLhin0jQSWYPvW++6r
	DvD2pONfS+QZf6f/l09KfnWKxu5tq4ReoVv4uHxlf34IUNCDimvxwR7BDy5TRZ2m9QPOezsaLPHEL
	XdiE3LZ+NbiAgAsXEGk1xGGLsLlp03FIKZkwVIe8CJUpXB+qEvjk/dh7EZPoRq3EewFqK3fPGW6x5
	n359YIBSurKSv13ue4WrpnahNzg3FnM9C1+7kRcsTc5admvS8Q9KQlaiDozGzb2kT734adqiCl7hV
	LDK/q+kLafmQCxXWsUNgmdwoReunRYtvIxMWJUlccIDvuM6mqVJbQ7IhQ7lQFjUpwhh17ltM+jhq8
	VYxlHhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUugZ-0000000Cteu-45hV;
	Thu, 26 Jun 2025 22:03:11 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUsrC-0000000Cgje-3GCs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:06:04 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86cf9bad8e9so133096739f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 13:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968361; x=1751573161; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5EUw4Y0mcnEG/FkgSChX2W9q1RZ2xMCnbVv00SQ/fhA=;
        b=cBZCSVVxzbQ1riUcd+F8TTI7+T2+GwFBLG5AZRpf7Ox5mGb0q+hepzPhTqBCkN8ms1
         Xs7dUN5PKbhN62wrB7xtWQnwUHgtTPeuf2H/PF1YhZD5Ie+a4FR74xA1VmRlbX5dX16f
         fxCIncccmOh0RoZKt76FclilE9UEag4qyq7plaB62iUHIzli28uKibUymvOLs1nzVaxG
         gTv0ZNBSlf+7/84gYt53so6S9m0O68zfc28S+94OK5ynkGBQPvMzAkkYx9DA1gF5Xras
         uf6NuyqYKC515OdVKhD7kPzooxSJHIS2+ASnv2y6lvdB8WFmz2ikz4+HogtTOl1pdknq
         ziSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968361; x=1751573161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5EUw4Y0mcnEG/FkgSChX2W9q1RZ2xMCnbVv00SQ/fhA=;
        b=v6/uTKrpXe8CrMQ504fdLdgWj4kxuzIFsCQgezvO24nKuWSKIBcsWGW6tDwzDWRAOM
         VscoMnKAYuPJM9ifFW5/qfiHp6frIsRGx4jT8eHWZaM6AQ1YwHTQFWFxpBcClOoc5o1r
         qIhaCpQx+rXO3pc/LR06Ju50zjkFNbpfC8KL+IsYVnKWgmHerakdYYqr8vZ7iquo8fD+
         khQTXn8C60i6RLI6NZ+mlcgG7Jm42bY47KHORwytB57+2SmYOozz8JdVzxvOYJ94ZRKj
         Pgi/JL4Zrn/+xdNYM8faTnQPDXF3CHjn1p7GrZyVOONlpvwYUiFbRYvXYAKc5xlRgRgq
         vUTw==
X-Forwarded-Encrypted: i=1; AJvYcCXG0q4AGioZuKs/vVbt/NhA8UQArGW6bqu9vgTy2rW3q51vgKZnyjkaOM3/txfYWi306M2BVi5rLmYYxhTvz7DP@lists.infradead.org
X-Gm-Message-State: AOJu0YxfIR++gD4vTA4jFB3VZv+Vxy8nWdGlZOAnxxp7eqqwNP31hrWF
	uNVGK4IdbekBdExaw1umnZJWI+0kmsZ2UmwjEb5NyPZxbMiolnn3OZXqWKnvmsJ7iDvlXipvEum
	t2ZXQsJu4KycHxHDV8nBPLPE7Aw==
X-Google-Smtp-Source: AGHT+IEGP6p3lSxAsTlEVIC7KYL0WEMMLhnUKbnvL8lg4j3kdPHiyfZtI7gPbyS5YbhTsvYef9EF8diocba00WqnwQ==
X-Received: from ilbbs10.prod.google.com ([2002:a05:6e02:240a:b0:3dd:bbd4:ed74])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c23:b0:3dd:ceb0:f603 with SMTP id e9e14a558f8ab-3df4ab6aa68mr11148085ab.2.1750968361548;
 Thu, 26 Jun 2025 13:06:01 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:46 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-11-coltonlewis@google.com>
Subject: [PATCH v3 10/22] KVM: arm64: Set up FGT for Partitioned PMU
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
X-CRM114-CacheID: sfid-20250626_130602_815721_DDB3066D 
X-CRM114-Status: GOOD (  15.80  )
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

In order to gain the best performance benefit from partitioning the
PMU, utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid
trapping common PMU register accesses by the guest to remove that
overhead.

There should be no information leaks between guests as all these
registers are context swapped by a later patch in this series.

Untrapped:
* PMCR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCCNTR_EL0
* PMINTEN_EL0
* PMEVCNTRn_EL0

Trapped:
* PMOVS_EL0
* PMEVTYPERn_EL0
* PMCCFILTR_EL0
* PMICNTR_EL0
* PMICFILTR_EL0

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR remains trapped because KVM is not handling that yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
are the same.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h        | 23 ++++++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 58 +++++++++++++++++++++++++
 arch/arm64/kvm/pmu-part.c               | 32 ++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 6328e90952ba..73b7161e3f4e 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -94,6 +94,21 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+#if !defined(__KVM_NVHE_HYPERVISOR__)
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
+#else
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
+static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+#endif
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -133,6 +148,14 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
 {
 	return 0;
 }
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+static inline bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 825b81749972..47d2db8446df 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -191,6 +191,61 @@ static inline bool cpu_has_amu(void)
                ID_AA64PFR0_EL1_AMU_SHIFT);
 }
 
+/**
+ * __activate_pmu_fgt() - Activate fine grain traps for partitioned PMU
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Clear the most commonly accessed registers for a partitioned
+ * PMU. Trap the rest.
+ */
+static inline void __activate_pmu_fgt(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
+	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
+	u64 set;
+	u64 clr;
+
+	set = HDFGRTR_EL2_PMOVS
+		| HDFGRTR_EL2_PMCCFILTR_EL0
+		| HDFGRTR_EL2_PMEVTYPERn_EL0;
+	clr = HDFGRTR_EL2_PMUSERENR_EL0
+		| HDFGRTR_EL2_PMSELR_EL0
+		| HDFGRTR_EL2_PMINTEN
+		| HDFGRTR_EL2_PMCNTEN
+		| HDFGRTR_EL2_PMCCNTR_EL0
+		| HDFGRTR_EL2_PMEVCNTRn_EL0;
+
+	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGRTR_EL2, clr, set);
+
+	set = HDFGWTR_EL2_PMOVS
+		| HDFGWTR_EL2_PMCCFILTR_EL0
+		| HDFGWTR_EL2_PMEVTYPERn_EL0;
+	clr = HDFGWTR_EL2_PMUSERENR_EL0
+		| HDFGWTR_EL2_PMCR_EL0
+		| HDFGWTR_EL2_PMSELR_EL0
+		| HDFGWTR_EL2_PMINTEN
+		| HDFGWTR_EL2_PMCNTEN
+		| HDFGWTR_EL2_PMCCNTR_EL0
+		| HDFGWTR_EL2_PMEVCNTRn_EL0;
+
+	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGWTR_EL2, clr, set);
+
+	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
+		return;
+
+	set = HDFGRTR2_EL2_nPMICFILTR_EL0
+		| HDFGRTR2_EL2_nPMICNTR_EL0;
+	clr = 0;
+
+	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGRTR2_EL2, clr, set);
+
+	set = HDFGWTR2_EL2_nPMICFILTR_EL0
+		| HDFGWTR2_EL2_nPMICNTR_EL0;
+	clr = 0;
+
+	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGWTR2_EL2, clr, set);
+}
+
 static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
@@ -210,6 +265,9 @@ static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 	if (cpu_has_amu())
 		update_fgt_traps(hctxt, vcpu, kvm, HAFGRTR_EL2);
 
+	if (kvm_vcpu_pmu_use_fgt(vcpu))
+		__activate_pmu_fgt(vcpu);
+
 	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
 	    return;
 
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 4f06a48175e2..92775e19cbf6 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -41,6 +41,38 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 		pmu->hpmn_max <= *host_data_ptr(nr_event_counters);
 }
 
+/**
+ * kvm_vcpu_pmu_is_partitioned() - Determine if given VCPU has a partitioned PMU
+ * @vcpu: Pointer to kvm_vcpu struct
+ *
+ * Determine if given VCPU has a partitioned PMU by extracting that
+ * field and passing it to :c:func:`kvm_pmu_is_partitioned`
+ *
+ * Return: True if the VCPU PMU is partitioned, false otherwise
+ */
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu);
+}
+
+/**
+ * kvm_vcpu_pmu_use_fgt() - Determine if we can use FGT
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if we can use FGT for direct access to registers. We can
+ * if capabilities permit the number of guest counters requested.
+ *
+ * Return: True if we can use FGT, false otherwise
+ */
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
+{
+	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;
+
+	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
+		cpus_have_final_cap(ARM64_HAS_FGT) &&
+		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
-- 
2.50.0.727.gbf7dc18ff4-goog


