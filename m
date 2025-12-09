Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB962D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ89vuk8IoQwxvZsx0+1wjVs3fhaJQxFPQySDckilYY=; b=lZRtzToyH8KPfGBMK5//EIzsJV
	lmXgF92nIpUpk8WGAFjb/tZfLfesu5w83QLXLS+KU6KmsEyyAxIAPPH0SVsUnWCRBpNFv45NiqIRk
	z5aJgu9OlgtFJUlpgna6nqVzO2XOJCnGRO1vsER1S1WYxSpJTSryrLSTz60lLJ6nekKhzITzzXoHN
	AEHoy7Tqpy09PJB8i9Y9e4bbAzlfg9K5/fNsKnvLCUlRPDd93+I2Ff6UEEjIKCJ7RS2TsUuh9WXQJ
	h0ds1cjHFRRgqDsaNAKmedV8H2+cAA/YoHdFMc8obY6cPfPd6ZCIBp1WJiQy3b/aaCIXIQ2e/mBmx
	rvGc782Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hv-0000000ElPg-2DPE;
	Tue, 09 Dec 2025 20:53:15 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hU-0000000EkqE-0683
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:50 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3ec76d47b56so7555478fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313565; x=1765918365; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ89vuk8IoQwxvZsx0+1wjVs3fhaJQxFPQySDckilYY=;
        b=E2MbHS04hgvNp8FgHVtwv/FJGu//Xw5lCrRpIJ/345yi1WsOJCdea7inIEj0/Z3fU8
         pHmLHFpSV/VwC14i+PqQXATaidt61G2UpDoglCvMiDKM12RXydaw4AK4IITBCACoz8Mc
         zafsVA1h5fCIsEjuixrpsk0l2LZ2EC+TEqCHFlA25YGnvgGEZDg+XS82pvRGGmlc3Ngh
         JzV4ubBmXmIhbFbd2bPX6etTIUOC7cR2wRctsMhgdXnrCutT3TBeUyQVyztHCdcsvT4X
         SjrZwSam2PJMPvyX9P0F3VSLMcd9sLiXFmkCyM6yb6ammZX9MeMALKE2J41cIlA+C7BT
         RWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313565; x=1765918365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ89vuk8IoQwxvZsx0+1wjVs3fhaJQxFPQySDckilYY=;
        b=kP90D9xy4WOan5+30QkUumx6sFSn7A9gGsH1ydJxb3MhBAJTn0ZJFM2JGjmXn+xx3h
         jJk0i6VpKvxDq0vX7tyKpuXirKN+wYj11cY2C1alJuJvB0y/K5tzbW/e+i9lo7TaLl2D
         aCmCQVMh7ikIrJB32WzPblcTsba/UrFPorAhsFxCl/yopH/3kVBGXDpUfR4Gxt3Ln1V3
         +S7KIEq6lUT+XtGnDZHlixnWIGgk14frivaSH5xlrVHuOwRds3CZzg+5XFmd2IY61goD
         ZELzXnAL8Dgyql0syP0PcZ4xUX2bPYOm785IxfGQynRdaezI0z7zNgtyVbx9JTMexiKV
         RAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaiNLxWEQBJ6nl3YcJXVkD2sYKhMIxrZtOaNw4PovVJCE3Ql+7Swzs+Db1pY7bDrOrRJ3cHeE5+z1IFYNXNZRw@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsEtEc6YIEV3TGNhQXpb4QcKDF9Chs4E8s0ZF3R2pjKbNOx6X
	40a4B6t/J54XkQIYNRLBnRT+KTBPZDgptDgZkQgvK0ZfYPT1W6KLgu12cS1P0zcKd77oF6eIfU0
	2vdVI9lfs+/Tg9YCALrnR6L0j4A==
X-Google-Smtp-Source: AGHT+IFMFGhBntVA7e0yxpl28sTmfttt7cHqvVKb12c8Ch6q+0Kzaupkymtg4kVqi74BeZUI4wFyYNpn47IB63gJJg==
X-Received: from ilbea4.prod.google.com ([2002:a05:6e02:4504:b0:436:f324:49])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:4d08:b0:659:9a49:9024 with SMTP id 006d021491bc7-65b2adaf85amr87797eaf.81.1765313565337;
 Tue, 09 Dec 2025 12:52:45 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:16 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-20-coltonlewis@google.com>
Subject: [PATCH v5 19/24] KVM: arm64: Implement lazy PMU context swaps
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
X-CRM114-CacheID: sfid-20251209_125248_477106_C0FF57E7 
X-CRM114-Status: GOOD (  17.90  )
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

Use an enum to implement a simple state machine for PMU register
access. The PMU either accesses registers virtually or physically.

Virtual access implies all PMU registers are trapped coarsely by
MDCR_EL2.TPM and therefore do not need to be context swapped. Physical
access implies some registers are untrapped through FGT and do need to
be context swapped. All vCPUs do virtual access by default and
transition to physical if the PMU is partitioned and the guest
actually tries a PMU access.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_host.h       |  1 +
 arch/arm64/include/asm/kvm_pmu.h        |  4 ++++
 arch/arm64/include/asm/kvm_types.h      |  7 ++++++-
 arch/arm64/kvm/debug.c                  |  2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h |  2 ++
 arch/arm64/kvm/pmu-direct.c             | 21 +++++++++++++++++++++
 arch/arm64/kvm/pmu.c                    |  7 +++++++
 arch/arm64/kvm/sys_regs.c               |  4 ++++
 8 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index c7e52aaf469dc..f92027d8fdfd0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1373,6 +1373,7 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 	return cpus_have_final_cap(ARM64_SPECTRE_V3A);
 }
 
+void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu);
 void kvm_init_host_debug_data(void);
 void kvm_debug_init_vhe(void);
 void kvm_vcpu_load_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 25a5eb8c623da..43aa334dce517 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -38,6 +38,7 @@ struct kvm_pmu {
 	int irq_num;
 	bool created;
 	bool irq_level;
+	enum vcpu_pmu_register_access access;
 };
 
 struct arm_pmu_entry {
@@ -106,6 +107,8 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
 
+void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu);
+
 #if !defined(__KVM_NVHE_HYPERVISOR__)
 bool kvm_vcpu_pmu_is_partitioned(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu);
@@ -188,6 +191,7 @@ static inline u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 }
 static inline void kvm_pmu_load(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_put(struct kvm_vcpu *vcpu) {}
+static inline void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu) {}
 static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
 					     u64 select_idx, u64 val) {}
 static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
index 9a126b9e2d7c9..9f67165359f5c 100644
--- a/arch/arm64/include/asm/kvm_types.h
+++ b/arch/arm64/include/asm/kvm_types.h
@@ -4,5 +4,10 @@
 
 #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
 
-#endif /* _ASM_ARM64_KVM_TYPES_H */
+enum vcpu_pmu_register_access {
+	VCPU_PMU_ACCESS_UNSET,
+	VCPU_PMU_ACCESS_VIRTUAL,
+	VCPU_PMU_ACCESS_PHYSICAL,
+};
 
+#endif /* _ASM_ARM64_KVM_TYPES_H */
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 0ab89c91e19cb..c2cf6b308ec60 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -34,7 +34,7 @@ static int cpu_has_spe(u64 dfr0)
  *  - Self-hosted Trace Filter controls (MDCR_EL2_TTRF)
  *  - Self-hosted Trace (MDCR_EL2_TTRF/MDCR_EL2_E2TB)
  */
-static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
+void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
 	int hpmn = kvm_pmu_hpmn(vcpu);
 
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index bde79ec1a1836..ea288a712bb5d 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -963,6 +963,8 @@ static bool kvm_hyp_handle_pmu_regs(struct kvm_vcpu *vcpu)
 	if (ret)
 		__kvm_skip_instr(vcpu);
 
+	kvm_pmu_set_physical_access(vcpu);
+
 	return ret;
 }
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 8d0d6d1a0d851..c5767e2ebc651 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -73,6 +73,7 @@ bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
 	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;
 
 	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
+		vcpu->arch.pmu.access == VCPU_PMU_ACCESS_PHYSICAL &&
 		cpus_have_final_cap(ARM64_HAS_FGT) &&
 		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
 }
@@ -92,6 +93,26 @@ u64 kvm_pmu_fgt2_bits(void)
 		| HDFGRTR2_EL2_nPMICNTR_EL0;
 }
 
+/**
+ * kvm_pmu_set_physical_access()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * Reconfigure the guest for physical access of PMU hardware if
+ * allowed. This means reconfiguring mdcr_el2 and loading the vCPU
+ * state onto hardware.
+ *
+ */
+
+void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu)
+{
+	if (kvm_vcpu_pmu_is_partitioned(vcpu)
+	    && vcpu->arch.pmu.access == VCPU_PMU_ACCESS_VIRTUAL) {
+		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_PHYSICAL;
+		kvm_arm_setup_mdcr_el2(vcpu);
+		kvm_pmu_load(vcpu);
+	}
+}
+
 /**
  * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
  * @pmu: Pointer to arm_pmu struct
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 48b39f096fa12..c9862e55a4049 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -471,6 +471,12 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
+static void kvm_pmu_register_init(struct kvm_vcpu *vcpu)
+{
+	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_UNSET)
+		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_VIRTUAL;
+}
+
 static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
 {
 	if (irqchip_in_kernel(vcpu->kvm)) {
@@ -496,6 +502,7 @@ static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
 	init_irq_work(&vcpu->arch.pmu.overflow_work,
 		      kvm_pmu_perf_overflow_notify_vcpu);
 
+	kvm_pmu_register_init(vcpu);
 	vcpu->arch.pmu.created = true;
 	return 0;
 }
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f2ae761625a66..d73218706b834 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1197,6 +1197,8 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 		p->regval = __vcpu_sys_reg(vcpu, reg);
 	}
 
+	kvm_pmu_set_physical_access(vcpu);
+
 	return true;
 }
 
@@ -1302,6 +1304,8 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 	}
 
+	kvm_pmu_set_physical_access(vcpu);
+
 	return true;
 }
 
-- 
2.52.0.239.gd5f0c6e74e-goog


