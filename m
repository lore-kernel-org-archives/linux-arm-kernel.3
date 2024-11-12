Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F17D32D91
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=867c+Xk81TQQxI9AorJDkxlnQKkh21LK8NW2S3F1gcs=; b=mLiy2N3su4izacpLYKW4HaTBfk
	K0hfsqhfr9et9aSyt46Nhx5sCXcRUTV78ARkRIwDfyKX1N85z3ObnNvTjFNMBi1Z35u+udRkluhKj
	xIE+2fE+H1BhbDtbuFXPmmiT9pT3D4lWfA0OIFj2eVJT11VlEi2WezASEIjea+JqL/d7mtJfouw5X
	JG3km89wtzfUzcMfhs5QeFOVNHtNuz9e3mA5TmbHt1Hl8dX4Myhtk3wuOp7rxqGzEmpoGma+nG7Kp
	i98tI5Q0/PG0S0mCL6rairnsqwIC/pSIsS22Wi29dJZJ8I/sohAshyJ7bJpZmukoQXt/bm7lCUVBb
	TJN0bY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAox9-00000003CZ3-2I3i;
	Tue, 12 Nov 2024 11:20:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoHj-000000034jI-2it2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 10:38:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so44487215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 02:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731407890; x=1732012690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=867c+Xk81TQQxI9AorJDkxlnQKkh21LK8NW2S3F1gcs=;
        b=wMP6AXs2KAzdsyXmd2jypqjr+PGiVIxGtty00lhz35NyTdjZnJtbVVIN1OPJQT5mGs
         Q0gUwsXRZ0SpqnAVaDAjrH3Vldkn5EzHk/LpVVq+6j/MDlQ8vLFTL5UJCs06+j8CPf6W
         irLuGl2nuCx889TmUbDviO73/LeGAW5JxkbbaE1HzsoUM6iPUnQzlmmMbuJh0pjfSSTR
         IsubT+ky1OVBKVX63c0H0uvlI/WS6v+cjiatYZJQbQjF1CX2GES/y4k+c0mEtjImCGar
         fsYBXVXA4p5o8CFbgCgSkOa0JKwNf4Da3hAlIOyD/ycbHXzZBYzP2hDawHVnxqCBxWzQ
         srZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731407890; x=1732012690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=867c+Xk81TQQxI9AorJDkxlnQKkh21LK8NW2S3F1gcs=;
        b=hPfOmCcGzi0rJStxmrZ2aJcIut0+lU1/9UlDbLVAEsX/0FREJFXMOwGlRP+w+QmoPC
         AYJJ3RUZCxO6wPxC4Q9aRETwbRzoLtyNbFR/pQ7O6x6pZPAfE68xQtD/0G7c9lHZScwq
         inzdidB81ngfYFkJRivnVOddPJhRrGzf/LCvQ+ppiVrCof5pyhY2pnLjLMfcsZ7zUp1J
         pxm/cuG589C5+Lr0SSL8Z4Zx9XCykmLJUUsFd9ChECsqDYi4Q6piD3pEwzdhexz2caHx
         tWQQ8nQu2RJ3ectH7SrFOxqLAOgzVw1Q6q0CqWLPcBn+/Rr5CzeTG0gvw50qookpWrLX
         IhHQ==
X-Forwarded-Encrypted: i=1; AJvYcCViXiEJ9rI11BG1CCMvVnqFzyZT6zDqqdaBAhsDaYoRoCF52SWuy7DMXMbFMNB6eB8p82Ma2KPj0+4KtFX0zQai@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeh+hKIiaM9IYT+xGsmdqKfwJdmGfS1rm43ao36XJ5e0wnB1Jg
	8mOgUtOajfDsVJ345GdcNEVhAiRp08EbWGsvKAXT2ZMLjwqD23A0neOfkX9r6+0=
X-Google-Smtp-Source: AGHT+IE0xLwD1/ZV0XtAmGGdV4VSBlbGR4egnGHLGmnWqBzEDrOWmm09rA7sjHH5TO65egKKJadivA==
X-Received: by 2002:a05:600c:1910:b0:431:680e:95ff with SMTP id 5b1f17b1804b1-432cce723d3mr17694385e9.9.1731407890092;
        Tue, 12 Nov 2024 02:38:10 -0800 (PST)
Received: from pop-os.. ([145.224.90.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432bbf436ffsm142270955e9.44.2024.11.12.02.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 02:38:09 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: suzuki.poulose@arm.com,
	oliver.upton@linux.dev,
	coresight@lists.linaro.org,
	kvmarm@lists.linux.dev
Cc: James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/12] KVM: arm64: Move SPE and TRBE flags to host data
Date: Tue, 12 Nov 2024 10:37:04 +0000
Message-Id: <20241112103717.589952-6-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112103717.589952-1-james.clark@linaro.org>
References: <20241112103717.589952-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_023811_807980_603B22EC 
X-CRM114-Status: GOOD (  25.87  )
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

They don't change, are per-CPU and don't need to be on the vcpu, so
initialize them one time only. Another benefit is this is done before
the host is deprivileged so can be trusted by pKVM.

Rename SAVE to HAS which is slightly more accurate because saving only
happens when it exists _and_ is enabled.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_host.h  | 21 +++++++-----
 arch/arm64/kvm/arm.c               |  3 --
 arch/arm64/kvm/debug.c             | 52 +++++++++++-------------------
 arch/arm64/kvm/hyp/nvhe/debug-sr.c |  8 ++---
 4 files changed, 36 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 34aa59f498c4..61ff34e1ffef 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -638,6 +638,11 @@ struct kvm_host_data {
 		FP_STATE_GUEST_OWNED,
 	} fp_owner;
 
+	struct {
+		/* Host CPU features, set at init */
+		u8 feats;
+	} flags;
+
 	/*
 	 * host_debug_state contains the host registers which are
 	 * saved and restored during world switches.
@@ -908,10 +913,6 @@ struct kvm_vcpu_arch {
 #define EXCEPT_AA64_EL2_SERR	__vcpu_except_flags(7)
 /* Guest debug is live */
 #define DEBUG_DIRTY		__kvm_single_flag(iflags, BIT(4))
-/* Save SPE context if active  */
-#define DEBUG_STATE_SAVE_SPE	__kvm_single_flag(iflags, BIT(5))
-/* Save TRBE context if active  */
-#define DEBUG_STATE_SAVE_TRBE	__kvm_single_flag(iflags, BIT(6))
 
 /* SVE enabled for host EL0 */
 #define HOST_SVE_ENABLED	__kvm_single_flag(sflags, BIT(0))
@@ -930,6 +931,14 @@ struct kvm_vcpu_arch {
 /* WFI instruction trapped */
 #define IN_WFI			__kvm_single_flag(sflags, BIT(7))
 
+#define host_data_get_flag(...)	__kvm_get_flag((*host_data_ptr(flags)), __VA_ARGS__)
+#define host_data_set_flag(...)	__kvm_set_flag((*host_data_ptr(flags)), __VA_ARGS__)
+#define host_data_clear_flag(...) __kvm_clear_flag((*host_data_ptr(flags)), __VA_ARGS__)
+
+/* Save SPE context if active  */
+#define HOST_FEAT_HAS_SPE	__kvm_single_flag(feats, BIT(0))
+/* Save TRBE context if active  */
+#define HOST_FEAT_HAS_TRBE	__kvm_single_flag(feats, BIT(1))
 
 /* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
 #define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +	\
@@ -1367,10 +1376,6 @@ static inline bool kvm_pmu_counter_deferred(struct perf_event_attr *attr)
 	return (!has_vhe() && attr->exclude_host);
 }
 
-/* Flags for host debug state */
-void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu);
-void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu);
-
 #ifdef CONFIG_KVM
 void kvm_set_pmu_events(u64 set, struct perf_event_attr *attr);
 void kvm_clr_pmu_events(u64 clr);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..2a54baca3144 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -617,15 +617,12 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	vcpu_set_pauth_traps(vcpu);
 
-	kvm_arch_vcpu_load_debug_state_flags(vcpu);
-
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	kvm_arch_vcpu_put_debug_state_flags(vcpu);
 	kvm_arch_vcpu_put_fp(vcpu);
 	if (has_vhe())
 		kvm_vcpu_put_vhe(vcpu);
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index ce8886122ed3..cf5558806687 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -68,16 +68,31 @@ static void restore_guest_debug_regs(struct kvm_vcpu *vcpu)
 /**
  * kvm_arm_init_debug - grab what we need for debug
  *
- * Currently the sole task of this function is to retrieve the initial
- * value of mdcr_el2 so we can preserve MDCR_EL2.HPMN which has
- * presumably been set-up by some knowledgeable bootcode.
- *
  * It is called once per-cpu during CPU hyp initialisation.
  */
 
 void kvm_arm_init_debug(void)
 {
+	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
+
+	/*
+	 * Retrieve the initial value of mdcr_el2 so we can preserve MDCR_EL2.HPMN which
+	 * has presumably been set-up by some knowledgeable bootcode.
+	 */
 	__this_cpu_write(mdcr_el2, kvm_call_hyp_ret(__kvm_get_mdcr_el2));
+
+	/*
+	 * If SPE is present on this CPU and is available at current EL,
+	 * we may need to check if the host state needs to be saved.
+	 */
+	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
+	    !(read_sysreg_s(SYS_PMBIDR_EL1) & BIT(PMBIDR_EL1_P_SHIFT)))
+		host_data_set_flag(HOST_FEAT_HAS_SPE);
+
+	/* Check if we have TRBE implemented and available at the host */
+	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
+	    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
+		host_data_set_flag(HOST_FEAT_HAS_TRBE);
 }
 
 /**
@@ -314,32 +329,3 @@ void kvm_arm_clear_debug(struct kvm_vcpu *vcpu)
 		}
 	}
 }
-
-void kvm_arch_vcpu_load_debug_state_flags(struct kvm_vcpu *vcpu)
-{
-	u64 dfr0;
-
-	/* For VHE, there is nothing to do */
-	if (has_vhe())
-		return;
-
-	dfr0 = read_sysreg(id_aa64dfr0_el1);
-	/*
-	 * If SPE is present on this CPU and is available at current EL,
-	 * we may need to check if the host state needs to be saved.
-	 */
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_PMSVer_SHIFT) &&
-	    !(read_sysreg_s(SYS_PMBIDR_EL1) & BIT(PMBIDR_EL1_P_SHIFT)))
-		vcpu_set_flag(vcpu, DEBUG_STATE_SAVE_SPE);
-
-	/* Check if we have TRBE implemented and available at the host */
-	if (cpuid_feature_extract_unsigned_field(dfr0, ID_AA64DFR0_EL1_TraceBuffer_SHIFT) &&
-	    !(read_sysreg_s(SYS_TRBIDR_EL1) & TRBIDR_EL1_P))
-		vcpu_set_flag(vcpu, DEBUG_STATE_SAVE_TRBE);
-}
-
-void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu)
-{
-	vcpu_clear_flag(vcpu, DEBUG_STATE_SAVE_SPE);
-	vcpu_clear_flag(vcpu, DEBUG_STATE_SAVE_TRBE);
-}
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 53efda0235cf..89f44a51a172 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -82,10 +82,10 @@ static void __debug_restore_trace(u64 trfcr_el1)
 void __debug_save_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
 	/* Disable and flush SPE data generation */
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_SPE))
+	if (host_data_get_flag(HOST_FEAT_HAS_SPE))
 		__debug_save_spe(host_data_ptr(host_debug_state.pmscr_el1));
 	/* Disable and flush Self-Hosted Trace generation */
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_TRBE))
+	if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
 		__debug_save_trace(host_data_ptr(host_debug_state.trfcr_el1));
 }
 
@@ -96,9 +96,9 @@ void __debug_switch_to_guest(struct kvm_vcpu *vcpu)
 
 void __debug_restore_host_buffers_nvhe(struct kvm_vcpu *vcpu)
 {
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_SPE))
+	if (host_data_get_flag(HOST_FEAT_HAS_SPE))
 		__debug_restore_spe(*host_data_ptr(host_debug_state.pmscr_el1));
-	if (vcpu_get_flag(vcpu, DEBUG_STATE_SAVE_TRBE))
+	if (host_data_get_flag(HOST_FEAT_HAS_TRBE))
 		__debug_restore_trace(*host_data_ptr(host_debug_state.trfcr_el1));
 }
 
-- 
2.34.1


