Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6E1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zoUuW8MUOrKH78JI9d8xFBlkAyF1avhcSa2sdvpTDE=; b=gOT3YPRj/NYHZ39VWogbgIgv8x
	xxE9GhYGcracSYPnzhqQ7ZV7ELDmlw8yE96bsE3HANOijiYLqPWWbWo9o1liBd5aQ7zpcAUzqUoG2
	/FA/Nr/FOe2BY+DZiz6ld9+nKpl2RCpsiktAA/VR33e9EjNLKrqTnOYKAerdlS8Pt9bS9ZQifMbrO
	Mas1dZIPIXlOvjGf/ez917XbBNN4+eBW4RKNeDl7QuZbMRBTm4tPyd9ygZKqgzXt/WRr5cQuymVsM
	bbnaB0ZLVjOTRv/N3+CytcS4FThmo/hJTOjeu1ze/A2eIpX/+sj16dOko34wkrz+Z3p4PDiLdIJKH
	89Nk2KYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMBCC-00000008c0l-32s9;
	Mon, 02 Jun 2025 19:51:44 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqK-00000008UFb-1S1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:09 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86a50b5f5bdso412161639f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892547; x=1749497347; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zoUuW8MUOrKH78JI9d8xFBlkAyF1avhcSa2sdvpTDE=;
        b=y+H9L92t6hpeK2hwOK8BQq+CigvMEtavQFshiqk5ifZVDVgAqgBu8OMLBrQJSxItmU
         TjAygTPivZ8D9iOC7/fm6KxX7UOo6rlHZAfubQICWEWObi+sKyK4TpgPqRiOSxZ9/hok
         mpuh2Y8by1MGMTehuJDpRQXSPNdiioOCbypgUjEFuTFbO9fVe9GU7zofQwwxcru9KpLt
         ZSulPxs0TuwhBuO8TEkBbMILrOF5KnyT9FX3kS/GmATjeddglYWZdVoxeVyI50pwrG1e
         qEUixh3Ad9Uq1uVKv+jubk7r9YZhOA7KHiAGXMe9xEAEU3Zblc0juXvuMpcmv4aqZX6J
         ygSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892547; x=1749497347;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zoUuW8MUOrKH78JI9d8xFBlkAyF1avhcSa2sdvpTDE=;
        b=EMMtz6723aOSHsLV1EK/Dbp1qPXecBPqkiLBVfcsqd5f0DzLjJKIf9xAlTjzN8G6xT
         Kvq0VC9QmDtCqmcjbTGppm4Vswx6REDdpikcrY5Fa+BWTKONddd/hS+v/J91IRY+Yu47
         GZFoQe7H1Gh6AD0nBMl0jMtnffyia67ovK+2zy2o0MQIwBekcVH2wlQHetvm7mNsRMlZ
         uRRJs1++qPIrrN7Fo6r1EKi0wY+fndL+U38sk11qy1IWVt3XneN+aQktEFUfHR1l4P3c
         1pfCGcdbNv2qQxuaWoN3LEtYOYxUErxqzFwsFhn9WxQ/4PbtX+u8imutezsoqVzFUg2q
         GM1w==
X-Forwarded-Encrypted: i=1; AJvYcCW9ItkthJPrwrO+gaOsAuojr3uciizCil5n3OAmpePzJNjf7OjUZ+Mxi65CvA4EW378EARFbTRWFt6cW9EtR5li@lists.infradead.org
X-Gm-Message-State: AOJu0Yym77TY3gIdNzZhcwupLJzcBKWKI8m7dNHClkUipA1i32s1DKqu
	bk5QFoIqR/GiXAXslSz5Ss5IrMvByuUJnNGb4NuRa7wyUTe2Ibo9HgTpRZVuNpj05NHqxfYdBrL
	qbpXbtv/Nm+3SIqpYJsEuowTxWQ==
X-Google-Smtp-Source: AGHT+IGwp++K9bYUB9A3dAnUT3ZJdSuEOT5EY3KXma39JRYsyLuBt4tvoJnwGqdqyMUlHwe7mrLxzz2cIxBSsNLN8g==
X-Received: from ilsx9.prod.google.com ([2002:a05:6e02:749:b0:3dd:a3a9:42af])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:184e:b0:3dc:7c5d:6372 with SMTP id e9e14a558f8ab-3dd9c9ae2abmr132483545ab.7.1748892546821;
 Mon, 02 Jun 2025 12:29:06 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:54 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-10-coltonlewis@google.com>
Subject: [PATCH 09/17] KVM: arm64: Set up FGT for Partitioned PMU
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
X-CRM114-CacheID: sfid-20250602_122908_389226_72C70FE6 
X-CRM114-Status: GOOD (  16.68  )
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

In order to gain a real performance benefit from partitioning the PMU,
utilize fine grain traps (FEAT_FGT and FEAT_FGT2) to avoid trapping
common PMU register accesses by the guest to remove that overhead.

There should be no information leaks between guests as all these
registers are context switched by a later patch in this series.

Untrapped:
* PMCR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCCNTR_EL0
* PMINTEN_EL0
* PMEVCNTRn_EL0
* PMICNTR_EL0

Trapped:
* PMOVS_EL0
* PMEVTYPERn_EL0
* PMICFILTR_EL0
* PMCCFILTR_EL0

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
are the same

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h       | 11 +++++
 arch/arm64/kvm/debug.c                  |  5 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h | 64 +++++++++++++++++++++++--
 arch/arm64/kvm/pmu-part.c               | 14 ++++++
 4 files changed, 88 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3482d7602a5b..4ea045098bfa 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1703,6 +1703,12 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
 			    struct kvm_device_attr *attr);
 int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu);
 
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
+
+#if defined(__KVM_NVHE_HYPERVISOR__)
+#define kvm_vcpu_pmu_is_partitioned(_) false
+#endif
+
 struct kvm_pmu_events *kvm_get_pmu_events(void);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
@@ -1819,6 +1825,11 @@ static inline bool kvm_pmu_counter_is_hyp(struct kvm_vcpu *vcpu, unsigned int id
 
 static inline void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu) {}
 
+static inline bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu)
+{
+	return false;
+}
+
 #endif
 
 #endif /* __ARM64_KVM_HOST_H__ */
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 41746a498a45..cbe36825e41f 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -42,13 +42,14 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 */
 	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, hpmn);
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD |
-				MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
-				MDCR_EL2_TPMCR |
 				MDCR_EL2_TDRA |
 				MDCR_EL2_TDOSA);
 
+	if (!kvm_vcpu_pmu_is_partitioned(vcpu))
+		vcpu->arch.mdcr_el2 |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
+
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
 		/* Route all software debug exceptions to EL2 */
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index d407e716df1b..c3c34a471ace 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -133,6 +133,10 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		case HDFGWTR_EL2:					\
 			id = HDFGRTR_GROUP;				\
 			break;						\
+		case HDFGRTR2_EL2:					\
+		case HDFGWTR2_EL2:					\
+			id = HDFGRTR2_GROUP;				\
+			break;						\
 		case HAFGRTR_EL2:					\
 			id = HAFGRTR_GROUP;				\
 			break;						\
@@ -143,10 +147,6 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 		case HFGITR2_EL2:					\
 			id = HFGITR2_GROUP;				\
 			break;						\
-		case HDFGRTR2_EL2:					\
-		case HDFGWTR2_EL2:					\
-			id = HDFGRTR2_GROUP;				\
-			break;						\
 		default:						\
 			BUILD_BUG_ON(1);				\
 		}							\
@@ -191,6 +191,59 @@ static inline bool cpu_has_amu(void)
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
+	set = HDFGRTR2_EL2_nPMICFILTR_EL0;
+	clr = HDFGRTR2_EL2_nPMICNTR_EL0;
+
+	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGRTR2_EL2, clr, set);
+
+	set = HDFGWTR2_EL2_nPMICFILTR_EL0;
+	clr = HDFGWTR2_EL2_nPMICNTR_EL0;
+
+	update_fgt_traps_cs(hctxt, vcpu, kvm, HDFGWTR2_EL2, clr, set);
+}
+
 static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
@@ -210,6 +263,9 @@ static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 	if (cpu_has_amu())
 		update_fgt_traps(hctxt, vcpu, kvm, HAFGRTR_EL2);
 
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		__activate_pmu_fgt(vcpu);
+
 	if (!cpus_have_final_cap(ARM64_HAS_FGT2))
 	    return;
 
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 33eeaa8faf7f..179a4144cfd0 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -131,6 +131,20 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 	return pmu->hpmn < *host_data_ptr(nr_event_counters);
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
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
-- 
2.49.0.1204.g71687c7c1d-goog


