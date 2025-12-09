Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874E5D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyMhuaQls3hUZ6GN0FBCXMwBUjXHqrFvzqVQVVR2z7A=; b=4kiqcoGWTIhHo8QU6TfxXO99cn
	yqLUiU+jW13o4VWF2MGyf7NusAY05lpjAvS68dP/xme01GlYbDWlXZhIge6ha0tlaMZLQi0fNjmeK
	hyjuTL36cNLNvrC36BAupwt/UehPnKTuLPpoe/Ad4Ku0U24dwS9/OYuwbjqgv8Rro6OrursHJTVQc
	2VUbsMvVg1OiwKgOSkXJUbKhP/Lqd6S10RlNlgfnvMijWNOAaTixqoDDeOQ5zPBjglJSsXqcRWx1P
	PXL01ldrhIk9nHw8+FCDxu4Jyj3Yurk/3VkFpt87ZFEr3xZ01vsgI65x9WHTYYzPGDyCtTIxa0hP/
	dUlvIMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hW-0000000Ekvw-2sEz;
	Tue, 09 Dec 2025 20:52:50 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hK-0000000Ekfy-21At
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:39 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-3e890e6be00so8160162fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313556; x=1765918356; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyMhuaQls3hUZ6GN0FBCXMwBUjXHqrFvzqVQVVR2z7A=;
        b=JuX4XE+NuF+pPjNNtvOUKqmTdrM6h381kednpmiyzOSoCYjImruCAYui3f0z/o93SM
         gQSFb+IJJxgMMR1pQiGM2CpdTeVQz2+DWNEVRO8Zovz2oOX+Um7n+fAey+4CRocCDPHc
         IbSl7Sim7TyUow/x+bniBgaHRcyeLxpyr5fgEf2pRHmyuaNjluv6iDvnEGF10g0S3BBG
         dc58cl/HGMvp5VAvZzurLD9RCgRWXankD8stDzCD1SbiHUhN67aaN0s9RvbCpmG8ZsX6
         OsqCfHW0r4Vb53K9r3HDhSWZFCEueiEIW3iGbbkRenwtXlzA0JTznyk6pZeqMGrLuXlt
         f2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313556; x=1765918356;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyMhuaQls3hUZ6GN0FBCXMwBUjXHqrFvzqVQVVR2z7A=;
        b=ip12RXecLFzh+rjejSSeOJ4wKcQ3YeIrUB0DE8zbylvzR3JT2O2NCXZrn0z35u0aYx
         ALgmWE3y5Cuf5STvugm6l2lwBEqKcZpY2PlXEUNfbKlYDT31XTOvgAOgePhoItmztTe4
         zRPto5k3lWJvwMoVVmwy3AW4gY+OEJE2YSuRxDNFICEyrXfZG/tmYrUwfsuXqsPpPALs
         VrXKJda9k2Ip2HEBvhvROFZrdmzEueUAJNvj7O5PnEb7scQ7wBjqEfS2GJdL+ZRs0u5v
         owj844gB+oglYeHQqx1TBIRumoSi0BxImbNk58I48SyY9HBf22Vxaji+zflIKsClz31S
         rmig==
X-Forwarded-Encrypted: i=1; AJvYcCWLXw2jQDVLc8mTYKDX5HvkPyEsNBIdsGY7qaB1qD0RvAbFoRSchz+tHxIcpJthuOF4JWUpT4YZqRcOE7pO9Fzo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4wLG4rANA95RrLbJ9dCRtwlkTpWBtHoesKFVD7WHPRaz5Xl0+
	TYeVjGfzbOA51ePBNiEtL8WjTfcI6WUo14Ott91LYWNRJt9KVI4GXOX48UcrQSUGUacUopqjg2o
	oXtfL5Jc9yZW+TYLrQoHTE0S37A==
X-Google-Smtp-Source: AGHT+IEL2YXntnNluNzyop1DJKdNOL9WpvG30YFGZ5q0MGpLQ+kw1q3/XcXCa4YnfEMsFjzbz6E8dm5ob96Qli2iIg==
X-Received: from ilbbs15.prod.google.com ([2002:a05:6e02:240f:b0:434:972f:bf91])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:81c1:b0:659:9a49:8ec0 with SMTP id 006d021491bc7-65b2ad8bbf7mr124430eaf.68.1765313556199;
 Tue, 09 Dec 2025 12:52:36 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:07 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-11-coltonlewis@google.com>
Subject: [PATCH v5 10/24] KVM: arm64: Set up FGT for Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125238_555768_D340A18C 
X-CRM114-Status: GOOD (  19.90  )
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

Untrapped:
* PMCR_EL0
* PMUSERENR_EL0
* PMSELR_EL0
* PMCCNTR_EL0
* PMCNTEN_EL0
* PMINTEN_EL1
* PMEVCNTRn_EL0

These are safe to untrap because writing MDCR_EL2.HPMN as this series
will do limits the effect of writes to any of these registers to the
partition of counters 0..HPMN-1. Reads from these registers will not
leak information from between guests as all these registers are
context swapped by a later patch in this series. Reads from these
registers also do not leak any information about the host's hardware
beyond what is promised by PMUv3.

Trapped:
* PMOVS_EL0
* PMEVTYPERn_EL0
* PMCCFILTR_EL0
* PMICNTR_EL0
* PMICFILTR_EL0
* PMCEIDn_EL0
* PMMIR_EL1

PMOVS remains trapped so KVM can track overflow IRQs that will need to
be injected into the guest.

PMICNTR and PMIFILTR remain trapped because KVM is not handling them
yet.

PMEVTYPERn remains trapped so KVM can limit which events guests can
count, such as disallowing counting at EL2. PMCCFILTR and PMCIFILTR
are special cases of the same.

PMCEIDn and PMMIR remain trapped because they can leak information
specific to the host hardware implementation.

NOTE: This patch temporarily forces kvm_vcpu_pmu_is_partitioned() to
be false to prevent partial feature activation for easier debugging.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h | 33 ++++++++++++++++++++++
 arch/arm64/kvm/config.c          | 34 ++++++++++++++++++++--
 arch/arm64/kvm/pmu-direct.c      | 48 ++++++++++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 8887f39c25e60..7297a697a4a62 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -96,6 +96,23 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
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
+u64 kvm_pmu_fgt_bits(void);
+u64 kvm_pmu_fgt2_bits(void);
+
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
  * Must be called before every vcpu run after disabling interrupts, to ensure
@@ -135,6 +152,22 @@ static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
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
+static inline u64 kvm_pmu_fgt_bits(void)
+{
+	return 0;
+}
+static inline u64 kvm_pmu_fgt2_bits(void)
+{
+	return 0;
+}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 24bb3f36e9d59..064dc6aa06f76 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -6,6 +6,7 @@
 
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
+#include <asm/kvm_pmu.h>
 #include <asm/kvm_nested.h>
 #include <asm/sysreg.h>
 
@@ -1489,12 +1490,39 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
 		*vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
 }
 
+static void __compute_hdfgrtr(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR_EL2);
+
+	if (kvm_vcpu_pmu_use_fgt(vcpu))
+		*vcpu_fgt(vcpu, HDFGRTR_EL2) |= kvm_pmu_fgt_bits();
+}
+
 static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
 {
 	__compute_fgt(vcpu, HDFGWTR_EL2);
 
 	if (is_hyp_ctxt(vcpu))
 		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= HDFGWTR_EL2_MDSCR_EL1;
+
+	if (kvm_vcpu_pmu_use_fgt(vcpu))
+		*vcpu_fgt(vcpu, HDFGWTR_EL2) |= kvm_pmu_fgt_bits();
+}
+
+static void __compute_hdfgrtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGRTR2_EL2);
+
+	if (kvm_vcpu_pmu_use_fgt(vcpu))
+		*vcpu_fgt(vcpu, HDFGRTR2_EL2) |= kvm_pmu_fgt2_bits();
+}
+
+static void __compute_hdfgwtr2(struct kvm_vcpu *vcpu)
+{
+	__compute_fgt(vcpu, HDFGWTR2_EL2);
+
+	if (kvm_vcpu_pmu_use_fgt(vcpu))
+		*vcpu_fgt(vcpu, HDFGWTR2_EL2) |= kvm_pmu_fgt2_bits();
 }
 
 void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
@@ -1505,7 +1533,7 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HFGRTR_EL2);
 	__compute_hfgwtr(vcpu);
 	__compute_fgt(vcpu, HFGITR_EL2);
-	__compute_fgt(vcpu, HDFGRTR_EL2);
+	__compute_hdfgrtr(vcpu);
 	__compute_hdfgwtr(vcpu);
 	__compute_fgt(vcpu, HAFGRTR_EL2);
 
@@ -1515,6 +1543,6 @@ void kvm_vcpu_load_fgt(struct kvm_vcpu *vcpu)
 	__compute_fgt(vcpu, HFGRTR2_EL2);
 	__compute_fgt(vcpu, HFGWTR2_EL2);
 	__compute_fgt(vcpu, HFGITR2_EL2);
-	__compute_fgt(vcpu, HDFGRTR2_EL2);
-	__compute_fgt(vcpu, HDFGWTR2_EL2);
+	__compute_hdfgrtr2(vcpu);
+	__compute_hdfgwtr2(vcpu);
 }
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index d5de7fdd059f4..4dd160c878862 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -43,6 +43,54 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
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
+	return kvm_pmu_is_partitioned(vcpu->kvm->arch.arm_pmu) &&
+		false;
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
+u64 kvm_pmu_fgt_bits(void)
+{
+	return HDFGRTR_EL2_PMOVS
+		| HDFGRTR_EL2_PMCCFILTR_EL0
+		| HDFGRTR_EL2_PMEVTYPERn_EL0
+		| HDFGRTR_EL2_PMCEIDn_EL0
+		| HDFGRTR_EL2_PMMIR_EL1;
+}
+
+u64 kvm_pmu_fgt2_bits(void)
+{
+	return HDFGRTR2_EL2_nPMICFILTR_EL0
+		| HDFGRTR2_EL2_nPMICNTR_EL0;
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
-- 
2.52.0.239.gd5f0c6e74e-goog


