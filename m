Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A89D609C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8IXZQtrQe+QG8clUE2zr1MHtw2SOo30KxSiJ2MznX8=; b=VfLiz/RxxbazmtvMr8Zr0FOjGw
	9uKmXQf9TUjXh/sUHfLXnyhPmz82kXx/L5fHYYYd5jzKpM4vw/+66nhoAMIksSzFPQXGgyj06WZ/2
	vhZ9XMD4bTte77eCAIu7ZbwBvbXO+nrbXc3CvR6dCHWDLPB/9IXpYkRB6iqadHtRfdt+Nzd0mnPeH
	DecK7rNbocHkWkCL3SXcsn/ooHOiPryRfU0k7EsqgqgHatd7knfcfNHrryuFrSyTL6kyZP2eJ2YCf
	Fz8i8u8IgGyYc8rdalEp8cWqZfg1aT2BJ4YyNYgxr24x8LvQnKBjuu8b8MvHrnB4Z+zlPjNikAEja
	xqbTez5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEtb-0000000Cm8f-1txm;
	Wed, 27 Nov 2024 10:03:43 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEro-0000000ClbT-2OJ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:01:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5d071f70b51so1839727a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732701708; x=1733306508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8IXZQtrQe+QG8clUE2zr1MHtw2SOo30KxSiJ2MznX8=;
        b=rcqq66SzHfAEaGPiFg5ETsoDb9b7Sy0X8zFpPE9G5/bJ9HTPFLqi10/4rFy4k7K51/
         bdy91wbFESYQG4tZTkpTP/VoyS+7mOrzvk+xhbc0HOR7qFOXocMAfOdiSZZhIpRDQNq8
         WrJQYte4KwDGIU54mbVX7a6SNeO+TcIUojNl+e4b0+Zr4LjEyAt2RjoiR1+zAQoTgJh7
         gtXlW/yYcoGhsySf6f5fIkjWsLc2NgEqyXJuRWWcxe5CyPwPWVI1bUibUnqu+uJp9f3E
         5B8qjwVgrQh6tZF+gP9MC6Y2JyZP4tfRg56oGrvK+CxlI9INlikNfhd2OWYQAs17xTEV
         2TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701708; x=1733306508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8IXZQtrQe+QG8clUE2zr1MHtw2SOo30KxSiJ2MznX8=;
        b=IdJh76BZir8nCa7OON8L/DUoszQTvncO0ww2xWppAGsqel5w8dyeep7QFtKnN9Hcyt
         HfKeGpTD5gm7pawPD5NYtwzUE/LlQKh45MPLJmJ7sf6BNUQmkgKjJgI5Vkkw3qGgCS8v
         0VGpzfMJ7eva29Ls1uDuKV3uijWnYuy0J9BO4f5WPi/WC/37Tl039ZL8QouUt1EY1cx5
         /jBuSf06GMOssvks/xjdWxSXyG1iwI3ZcvBBhaGzRMBJHcaPAJ5G79QziqvqXCNkhNKg
         KAbojm8MNt0BtVVJyhAu+wExgdArk8jXnCGZdKng7Td+eodu4wMNzHB1FqoQKmwKH3T1
         hBgw==
X-Forwarded-Encrypted: i=1; AJvYcCXkyZFctCT1xAx6HjMJjVnxJaB8FK5W0ppgLTrHuD0zbl10/sxmDv0lbkFSmmcbMQKH/jqO41GhbfVl8EXldSlE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj3nmyMUyAn8RLBmf12SZZOAOoNZ/MYL2/t2EO3q/r/pAzK7nk
	NQtKaJN0SqnmW3c3Xx5ugjdq1Hn1fmUCOwf1cHQjm3nG70SvJ5jQQQqSwgZ6CD8=
X-Gm-Gg: ASbGncuNV4+UOhqPavkKU99fA/WVwPxY3/+syyr7YQNUwaal48FWnqAVOONExsaznqG
	7RSRPvqZbQgolug2akRaNeEGiZ2CFUM7QG1qg/CvCNHhYQwhlbeSyZ/wwIQ/dOeTEL1GEXxNsTi
	6JVmMZzAL1VG4K7OwXH8CjjG/cgkkWP4hozCnejz/Do+rrCpIPiqmUruwZrMSo+wzPZFxk9VqGE
	kj8vBaXz4+67w/syN/YnvrG5rIs0twVYvLVtEEpAFS8EYFgjA==
X-Google-Smtp-Source: AGHT+IF6aoMeybQynniFtjBLCVbSjMXDujtwoTF9DDB/rAxTHRjQUri2uBbUKbvzHXkufJAm29/O+g==
X-Received: by 2002:a17:906:18b2:b0:aa5:b54:7549 with SMTP id a640c23a62f3a-aa580f4d9e2mr141128566b.34.1732701708364;
        Wed, 27 Nov 2024 02:01:48 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa547ffb152sm421887466b.62.2024.11.27.02.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:01:47 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Mark Brown <broonie@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/8] KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts
Date: Wed, 27 Nov 2024 10:01:18 +0000
Message-Id: <20241127100130.1162639-2-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127100130.1162639-1-james.clark@linaro.org>
References: <20241127100130.1162639-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020152_608939_76BDC364 
X-CRM114-Status: GOOD (  23.52  )
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

From: Oliver Upton <oliver.upton@linux.dev>

KVM caches MDCR_EL2 on a per-CPU basis in order to preserve the
configuration of MDCR_EL2.HPMN while running a guest. This is a bit
gross, since we're relying on some baked configuration rather than the
hardware definition of implemented counters.

Discover the number of implemented counters by reading PMCR_EL0.N
instead. This works because:

 - In VHE the kernel runs at EL2, and N always returns the number of
   counters implemented in hardware

 - In {n,h}VHE, the EL2 setup code programs MDCR_EL2.HPMN with the EL2
   view of PMCR_EL0.N for the host

Lastly, avoid traps under nested virtualization by saving PMCR_EL0.N in
host data.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/kvm_asm.h   |  5 +----
 arch/arm64/include/asm/kvm_host.h  |  7 +++++--
 arch/arm64/kvm/arm.c               |  2 +-
 arch/arm64/kvm/debug.c             | 29 +++++++++++------------------
 arch/arm64/kvm/hyp/nvhe/debug-sr.c |  5 -----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c |  6 ------
 arch/arm64/kvm/hyp/vhe/debug-sr.c  |  5 -----
 7 files changed, 18 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index ca2590344313..063185c202ce 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -53,8 +53,7 @@
 enum __kvm_host_smccc_func {
 	/* Hypercalls available only prior to pKVM finalisation */
 	/* __KVM_HOST_SMCCC_FUNC___kvm_hyp_init */
-	__KVM_HOST_SMCCC_FUNC___kvm_get_mdcr_el2 = __KVM_HOST_SMCCC_FUNC___kvm_hyp_init + 1,
-	__KVM_HOST_SMCCC_FUNC___pkvm_init,
+	__KVM_HOST_SMCCC_FUNC___pkvm_init = __KVM_HOST_SMCCC_FUNC___kvm_hyp_init + 1,
 	__KVM_HOST_SMCCC_FUNC___pkvm_create_private_mapping,
 	__KVM_HOST_SMCCC_FUNC___pkvm_cpu_set_vector,
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
@@ -247,8 +246,6 @@ extern void __kvm_adjust_pc(struct kvm_vcpu *vcpu);
 extern u64 __vgic_v3_get_gic_config(void);
 extern void __vgic_v3_init_lrs(void);
 
-extern u64 __kvm_get_mdcr_el2(void);
-
 #define __KVM_EXTABLE(from, to)						\
 	"	.pushsection	__kvm_ex_table, \"a\"\n"		\
 	"	.align		3\n"					\
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index f333b189fb43..ad514434f3fe 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -642,7 +642,7 @@ struct kvm_host_data {
 	 * host_debug_state contains the host registers which are
 	 * saved and restored during world switches.
 	 */
-	 struct {
+	struct {
 		/* {Break,watch}point registers */
 		struct kvm_guest_debug_arch regs;
 		/* Statistical profiling extension */
@@ -652,6 +652,9 @@ struct kvm_host_data {
 		/* Values of trap registers for the host before guest entry. */
 		u64 mdcr_el2;
 	} host_debug_state;
+
+	/* Number of programmable event counters (PMCR_EL0.N) for this CPU */
+	unsigned int nr_event_counters;
 };
 
 struct kvm_host_psci_config {
@@ -1332,7 +1335,7 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 
-void kvm_arm_init_debug(void);
+void kvm_init_host_debug_data(void);
 void kvm_arm_vcpu_init_debug(struct kvm_vcpu *vcpu);
 void kvm_arm_setup_debug(struct kvm_vcpu *vcpu);
 void kvm_arm_clear_debug(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..ab1bf9ccf385 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2109,6 +2109,7 @@ static void cpu_set_hyp_vector(void)
 static void cpu_hyp_init_context(void)
 {
 	kvm_init_host_cpu_context(host_data_ptr(host_ctxt));
+	kvm_init_host_debug_data();
 
 	if (!is_kernel_in_hyp_mode())
 		cpu_init_hyp_mode();
@@ -2117,7 +2118,6 @@ static void cpu_hyp_init_context(void)
 static void cpu_hyp_init_features(void)
 {
 	cpu_set_hyp_vector();
-	kvm_arm_init_debug();
 
 	if (is_kernel_in_hyp_mode())
 		kvm_timer_init_vhe();
diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index ce8886122ed3..0dbabb6e1108 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -21,8 +21,6 @@
 				DBG_MDSCR_KDE | \
 				DBG_MDSCR_MDE)
 
-static DEFINE_PER_CPU(u64, mdcr_el2);
-
 /*
  * save/restore_guest_debug_regs
  *
@@ -65,21 +63,6 @@ static void restore_guest_debug_regs(struct kvm_vcpu *vcpu)
 		*vcpu_cpsr(vcpu) &= ~DBG_SPSR_SS;
 }
 
-/**
- * kvm_arm_init_debug - grab what we need for debug
- *
- * Currently the sole task of this function is to retrieve the initial
- * value of mdcr_el2 so we can preserve MDCR_EL2.HPMN which has
- * presumably been set-up by some knowledgeable bootcode.
- *
- * It is called once per-cpu during CPU hyp initialisation.
- */
-
-void kvm_arm_init_debug(void)
-{
-	__this_cpu_write(mdcr_el2, kvm_call_hyp_ret(__kvm_get_mdcr_el2));
-}
-
 /**
  * kvm_arm_setup_mdcr_el2 - configure vcpu mdcr_el2 value
  *
@@ -99,7 +82,8 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = __this_cpu_read(mdcr_el2) & MDCR_EL2_HPMN_MASK;
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
+					 *host_data_ptr(nr_event_counters));
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
@@ -343,3 +327,12 @@ void kvm_arch_vcpu_put_debug_state_flags(struct kvm_vcpu *vcpu)
 	vcpu_clear_flag(vcpu, DEBUG_STATE_SAVE_SPE);
 	vcpu_clear_flag(vcpu, DEBUG_STATE_SAVE_TRBE);
 }
+
+void kvm_init_host_debug_data(void)
+{
+	u64 dfr0 = read_sysreg(id_aa64dfr0_el1);
+
+	if (cpuid_feature_extract_signed_field(dfr0, ID_AA64DFR0_EL1_PMUVer_SHIFT) > 0)
+		*host_data_ptr(nr_event_counters) = FIELD_GET(ARMV8_PMU_PMCR_N,
+							      read_sysreg(pmcr_el0));
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
index 53efda0235cf..1e2a26d0196e 100644
--- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
@@ -106,8 +106,3 @@ void __debug_switch_to_host(struct kvm_vcpu *vcpu)
 {
 	__debug_switch_to_host_common(vcpu);
 }
-
-u64 __kvm_get_mdcr_el2(void)
-{
-	return read_sysreg(mdcr_el2);
-}
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 6aa0b13d86e5..16f5da3a884a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -264,11 +264,6 @@ static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 	__vgic_v3_init_lrs();
 }
 
-static void handle___kvm_get_mdcr_el2(struct kvm_cpu_context *host_ctxt)
-{
-	cpu_reg(host_ctxt, 1) = __kvm_get_mdcr_el2();
-}
-
 static void handle___vgic_v3_save_vmcr_aprs(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
@@ -384,7 +379,6 @@ typedef void (*hcall_t)(struct kvm_cpu_context *);
 
 static const hcall_t host_hcall[] = {
 	/* ___kvm_hyp_init */
-	HANDLE_FUNC(__kvm_get_mdcr_el2),
 	HANDLE_FUNC(__pkvm_init),
 	HANDLE_FUNC(__pkvm_create_private_mapping),
 	HANDLE_FUNC(__pkvm_cpu_set_vector),
diff --git a/arch/arm64/kvm/hyp/vhe/debug-sr.c b/arch/arm64/kvm/hyp/vhe/debug-sr.c
index 289689b2682d..0100339b09e0 100644
--- a/arch/arm64/kvm/hyp/vhe/debug-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/debug-sr.c
@@ -19,8 +19,3 @@ void __debug_switch_to_host(struct kvm_vcpu *vcpu)
 {
 	__debug_switch_to_host_common(vcpu);
 }
-
-u64 __kvm_get_mdcr_el2(void)
-{
-	return read_sysreg(mdcr_el2);
-}
-- 
2.34.1


