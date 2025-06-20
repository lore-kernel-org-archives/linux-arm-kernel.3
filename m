Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB9C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srRRaeOIs8QqP+SAheIX06PoynQsP08aWn4E9T2+MS8=; b=lPVXUuKRiN7AxKS8hNac7bopt5
	EUuT+BwVZQQUnf8YYucQ1nXJ3roPi4U1WwckiqOvi2XRjgEOdJEIG45YY/hPdCmGzNWhyABKyOQTC
	gnYf9ZGwcgRU/qBdznLaZjz4uCYMODSTzhicRcs+936SgnSH3Ec56lvJiyjH7pRi36AKpgvWLymAw
	DFEVokuolWtXIP9sJ/gpJFoKaXu7WL2HWKVN/+m2PZ3z7I/0Rnd8qu1J1FQYmW4spNomfn+nAvQsk
	2QvTRMCE/O1P+KcUJ7027OdojLD3cQcmN4i6vrTNlRAJOkn2ASPQZG2TbcJh1hPIGCIH6eo3sX5oh
	BN8T2Rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkzm-0000000GnaA-0t7n;
	Fri, 20 Jun 2025 23:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4s-0000000GhHQ-2GJa
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 22:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=srRRaeOIs8QqP+SAheIX06PoynQsP08aWn4E9T2+MS8=; b=Ozp/Z/D+EURXgHIUu+EYu9z71h
	GjGhl/8sySCMEnSUO6we9LuzyRr3rwKZAiluncfJcni65TB1PejunYvaOYqh1XUABjADPpf893o77
	sQqWYW+upetsWJVCNtc5Rw5vF1binhVSD9VxIvnNxujDUJv44WhV3/NUcyUyhHuO71eQgj/je2oGS
	ce3yEj9zCsGl5lF7yF7CyHHZ+ESDl8Wt2UfF5t3TBj43S7B+ktV4Itlr6zTdEI9YuoawsYu2QdmsF
	TUDQb67Thd8V+8mqn9cbAnHKGhqS5Hk8TZ/2RkDFSPf3hXxMPHj9RuF97xTItCBmyqp1778717hyQ
	sz+ZUMmA==;
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4T-00000004p3j-0zOD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:19:17 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-6114cffd99cso2636069eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457929; x=1751062729; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=srRRaeOIs8QqP+SAheIX06PoynQsP08aWn4E9T2+MS8=;
        b=bvkkbO9qXAfae2lrDRYx3jD8Ypkj5in/kpr5YstXCo//zYcDstFDZBhB8fokKcdAil
         MIjHbwLBbB6ZDJODp7Dom5+iTVEsCB3QEy/9mpnxmN9QH0cIQC++91OKiTKRjv6OX++4
         yKUOlrkyV9pMfddp0pRxHBQsZXr81R1fNUnVUNLuhLVus+VtOOMgaDyzRnvFoKzy+hao
         JL5lS7HYPNRFBcK0/4tfeT/P20XOeypBOQFA6j/rspYhCRnsV52G5ryb3SiRVGn9Gg7q
         PrbSZHr6HvieUTWqa4XXkzOpLqJnYRFyaA3OihQkHOg6a8QniqdHOXghLcWzYDGSHjgp
         MvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457929; x=1751062729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=srRRaeOIs8QqP+SAheIX06PoynQsP08aWn4E9T2+MS8=;
        b=npkDo+ttR3Mt1ptyee/3oIF7VuxCn840veUAFEKPRUHdvcc+awfqOKTUO02zw2CgN+
         JzpG3gTa6SK/mAh1f1lFVPz7yzWvr9f3nfVxKKwImW5T3We76Abyr6lppnRI59u5QQQG
         9RKbdVUj4SjU1XZqI2BEsum1ckPOyObuAdeKu/4KNXRcUpxzy72pPWWFaciuwvz9Z51c
         e5UYI4R3O7roJKAXqHzpcWcyR/TPO62NLhHmmQIKGFMTUNsJJP4mnhSTioPT3TuzlalZ
         r7A05upr1cDLvFANZ/+ATE/uaDzuTeGnWCAs39Y2f8Eg0X8L02otHyWeayOUt/75NUSi
         JoGw==
X-Forwarded-Encrypted: i=1; AJvYcCWafvWfTGZ7DCE6AjsTa0kKmaGAj9AN1IioPQmbMRDlvh2/gprpOq38lG1nyTXPqBC0zlOfbpWDnaYDv/fuaA+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YybaVOJyIfYYqkFTtlHa/5xFAE8Jc86XEIO9iiWPfGKYh31wvV9
	Nb5Rs9TXbOdueeDCuAFm8gus1NhjEbhLwijK+E+ko9hkKDUeskLKopH7xQ3ehLTz92xyZv7SZ4h
	sVP1sKOeygOduhC5r/agBXurEUA==
X-Google-Smtp-Source: AGHT+IFglucSmVuhrW+uZlSgSrT5jPMZNpmjjmax2ar+hK7o/sbaqYEVFqi7A3KjzTy6avd238vq7SDc4ZyxUgURTw==
X-Received: from oabxe8.prod.google.com ([2002:a05:6870:ce88:b0:2e9:2323:d48f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:364a:b0:2ea:7101:7dc1 with SMTP id 586e51a60fabf-2eeee65a6f4mr3296802fac.33.1750457928774;
 Fri, 20 Jun 2025 15:18:48 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:12 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-13-coltonlewis@google.com>
Subject: [PATCH v2 11/23] KVM: arm64: Set up FGT for Partitioned PMU
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
X-CRM114-CacheID: sfid-20250620_231853_497027_3BE977B1 
X-CRM114-Status: GOOD (  14.92  )
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
 arch/arm64/include/asm/kvm_pmu.h        | 13 ++++++
 arch/arm64/kvm/hyp/include/hyp/switch.h | 58 +++++++++++++++++++++++++
 arch/arm64/kvm/pmu-part.c               | 32 ++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 151e5b6793f2..02984cfeb446 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -93,7 +93,20 @@ u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
 
+#if !defined(__KVM_NVHE_HYPERVISOR__)
+bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
+bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
 #else
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
 
 /*
  * Updates the vcpu's view of the pmu events for this cpu.
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
index 340f8d334efd..269397a1fcbc 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -26,6 +26,38 @@ bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
 	return pmu->hpmn_max <= *host_data_ptr(nr_event_counters);
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
2.50.0.714.g196bf9f422-goog


