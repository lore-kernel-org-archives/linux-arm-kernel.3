Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE52CA0EC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xgsu0fWGzXM1P0ieUy8M+NNgbe9X2+RcO7orAU+l0hA=; b=YPqntP93YYfUFyPBrW2HLz4Ly1
	rThbM9tTWn14pMtwuRn3SvUZQSkiDKcwQ8VJ0UiPI9EXUKiYpb94oUp/Q5ukrqoGaX9AuuRZzWtOp
	Qdz3M7KA6Hi5nS4cWh1S1GuWAN7qcGVgAbp+R5cTsD4md3CyqYwy1HrWANdFWTRzd3JT4esySa7dh
	aj6QGWdg6/EyE8qbWwqB6aHRzRhCrDc6ekb8YvpmAZohzSkLPBgCUkIiRkzDNBODg0PizpZo/SnAq
	SM88BDb8i/5sgHSIBtbRgwXXMcTr+wCsASUlOvMzjkqXnQdpAvPcoBgKQhR/84GfyHLnBWichO0aE
	fjo7tzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujmPO-0000000GhQx-1usP;
	Wed, 06 Aug 2025 22:14:54 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkH7-0000000GGdv-3yBq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2424aaa9840so2089365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510293; x=1755115093; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xgsu0fWGzXM1P0ieUy8M+NNgbe9X2+RcO7orAU+l0hA=;
        b=hWBhg7cNqx7s8i6n8TNI5WxbpjCYfeDtzWIJvJF6zIpmiOwlBKeco8gRAJ9omLZyYh
         VZi6+Ht0mCkhUnPgeuA8gjOioJSkTRMJ12ocpzuMXKBqtRF8k+zCMy0zlyL6nsYoGU6I
         ya6ZWqKOrnzsoKzvjXwcOs2mf/xGA60tzzUMG0L0N7+8qOfor48PydygYz+EC1eKzu8S
         dZKe0sQPAN01NgKKwhU1zhJGTLNAeNU1yisACnIDoxoNKjXcmgHMve6+A9ffeXR7BdFn
         PZWK8cIX9cVtqM3R5e06qIME4t6/TmxYDp4EPWg9gtZqLRbY0a5bpO2IyTm8toLVI8zy
         exnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510293; x=1755115093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xgsu0fWGzXM1P0ieUy8M+NNgbe9X2+RcO7orAU+l0hA=;
        b=Xmoq52m1DDT6NcIp6LMYfXzdOngzaohIkKjjx5KXTAGju/oGPec0atpnJgBc9HwUKr
         o6UwfU+PrQAj6+Dki8IqIlf2ZmvL94HzQGhiUMyrFomTSX4Qee5PQwOwVoRgva+GjoJG
         /wA4ckLHwENM/qzGwJRARkmsRgeI3zcLYaOV58hBoLGF1JW/9P6z0ha81dQlPS2GZlby
         /xgTa7eYw9h4Z1t0czf6hCGMTfB14jkis++f0gVWp/PV31T1bDiBm8iENKLs5FsEcy5X
         sIbEnDm23kbG46cgwOh8mCQ/PkR4de8GM12qUxYlE3T/W5r/W8mmKxP0twbf5nJPaUHj
         qQEQ==
X-Gm-Message-State: AOJu0YyqUbSVWLyWCPDz2Mvk63U2dR8uKotDI7errX3Dvl5x+IX5A4Qw
	UOCHfUd5YbKX6CbqrlIA2y66M4OQlA5qanc27UQcZlR4XCtl0cB97n3ZwN0J7UTv4vUT1qIglS5
	JFukudw==
X-Google-Smtp-Source: AGHT+IGjOVjMJgLz2fS/cn5FiFF0L2j0BQ8Kgspjt+cfMRIO/JKDaNYzPFPk3n1FGowkS6X5Jtr/S5JnoBk=
X-Received: from pjbgf4.prod.google.com ([2002:a17:90a:c7c4:b0:312:ea08:fa64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3504:b0:240:3e72:efb3
 with SMTP id d9443c01a7336-2429f42fa4cmr56513685ad.43.1754510293150; Wed, 06
 Aug 2025 12:58:13 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:46 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-25-seanjc@google.com>
Subject: [PATCH v5 24/44] KVM: x86: Rework KVM_REQ_MSR_FILTER_CHANGED into a
 generic RECALC_INTERCEPTS
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125814_048971_0B1B55B7 
X-CRM114-Status: GOOD (  22.99  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Rework the MSR_FILTER_CHANGED request into a more generic RECALC_INTERCEPTS
request, and expand the responsibilities of vendor code to recalculate all
intercepts that vary based on userspace input, e.g. instruction intercepts
that are tied to guest CPUID.

Providing a generic recalc request will allow the upcoming mediated PMU
support to trigger a recalc when PMU features, e.g. PERF_CAPABILITIES, are
set by userspace, without having to make multiple calls to/from PMU code.
As a bonus, using a request will effectively coalesce recalcs, e.g. will
reduce the number of recalcs for normal usage from 3+ to 1 (vCPU create,
set CPUID, set PERF_CAPABILITIES (Intel only), set filter).

The downside is that MSR filter changes that are done in isolation will do
a small amount of unnecessary work, but that's already a relatively slow
path, and the cost of recalculating instruction intercepts is negligible.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm-x86-ops.h |  2 +-
 arch/x86/include/asm/kvm_host.h    |  4 ++--
 arch/x86/kvm/svm/svm.c             |  8 ++++----
 arch/x86/kvm/vmx/main.c            | 14 +++++++-------
 arch/x86/kvm/vmx/vmx.c             |  9 +++++++--
 arch/x86/kvm/vmx/x86_ops.h         |  2 +-
 arch/x86/kvm/x86.c                 | 15 +++++++--------
 7 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/kvm-x86-ops.h b/arch/x86/include/asm/kvm-x86-ops.h
index 18a5c3119e1a..7c240e23bd52 100644
--- a/arch/x86/include/asm/kvm-x86-ops.h
+++ b/arch/x86/include/asm/kvm-x86-ops.h
@@ -138,7 +138,7 @@ KVM_X86_OP(check_emulate_instruction)
 KVM_X86_OP(apic_init_signal_blocked)
 KVM_X86_OP_OPTIONAL(enable_l2_tlb_flush)
 KVM_X86_OP_OPTIONAL(migrate_timers)
-KVM_X86_OP(recalc_msr_intercepts)
+KVM_X86_OP(recalc_intercepts)
 KVM_X86_OP(complete_emulated_msr)
 KVM_X86_OP(vcpu_deliver_sipi_vector)
 KVM_X86_OP_OPTIONAL_RET0(vcpu_get_apicv_inhibit_reasons);
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index ff0d753e2b07..b891bd92fc83 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -120,7 +120,7 @@
 #define KVM_REQ_TLB_FLUSH_GUEST \
 	KVM_ARCH_REQ_FLAGS(27, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_APF_READY		KVM_ARCH_REQ(28)
-#define KVM_REQ_MSR_FILTER_CHANGED	KVM_ARCH_REQ(29)
+#define KVM_REQ_RECALC_INTERCEPTS	KVM_ARCH_REQ(29)
 #define KVM_REQ_UPDATE_CPU_DIRTY_LOGGING \
 	KVM_ARCH_REQ_FLAGS(30, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_MMU_FREE_OBSOLETE_ROOTS \
@@ -1912,7 +1912,7 @@ struct kvm_x86_ops {
 	int (*enable_l2_tlb_flush)(struct kvm_vcpu *vcpu);
 
 	void (*migrate_timers)(struct kvm_vcpu *vcpu);
-	void (*recalc_msr_intercepts)(struct kvm_vcpu *vcpu);
+	void (*recalc_intercepts)(struct kvm_vcpu *vcpu);
 	int (*complete_emulated_msr)(struct kvm_vcpu *vcpu, int err);
 
 	void (*vcpu_deliver_sipi_vector)(struct kvm_vcpu *vcpu, u8 vector);
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index f7e1e665a826..3d9dcc66a407 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1077,7 +1077,7 @@ static void svm_recalc_instruction_intercepts(struct kvm_vcpu *vcpu)
 	}
 }
 
-static void svm_recalc_intercepts_after_set_cpuid(struct kvm_vcpu *vcpu)
+static void svm_recalc_intercepts(struct kvm_vcpu *vcpu)
 {
 	svm_recalc_instruction_intercepts(vcpu);
 	svm_recalc_msr_intercepts(vcpu);
@@ -1225,7 +1225,7 @@ static void init_vmcb(struct kvm_vcpu *vcpu)
 
 	svm_hv_init_vmcb(vmcb);
 
-	svm_recalc_intercepts_after_set_cpuid(vcpu);
+	svm_recalc_intercepts(vcpu);
 
 	vmcb_mark_all_dirty(vmcb);
 
@@ -4479,7 +4479,7 @@ static void svm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 	if (sev_guest(vcpu->kvm))
 		sev_vcpu_after_set_cpuid(svm);
 
-	svm_recalc_intercepts_after_set_cpuid(vcpu);
+	svm_recalc_intercepts(vcpu);
 }
 
 static bool svm_has_wbinvd_exit(void)
@@ -5181,7 +5181,7 @@ static struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.apic_init_signal_blocked = svm_apic_init_signal_blocked,
 
-	.recalc_msr_intercepts = svm_recalc_msr_intercepts,
+	.recalc_intercepts = svm_recalc_intercepts,
 	.complete_emulated_msr = svm_complete_emulated_msr,
 
 	.vcpu_deliver_sipi_vector = svm_vcpu_deliver_sipi_vector,
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index dbab1c15b0cd..68dcafd177a8 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -188,18 +188,18 @@ static int vt_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 	return vmx_get_msr(vcpu, msr_info);
 }
 
-static void vt_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
+static void vt_recalc_intercepts(struct kvm_vcpu *vcpu)
 {
 	/*
-	 * TDX doesn't allow VMM to configure interception of MSR accesses.
-	 * TDX guest requests MSR accesses by calling TDVMCALL.  The MSR
-	 * filters will be applied when handling the TDVMCALL for RDMSR/WRMSR
-	 * if the userspace has set any.
+	 * TDX doesn't allow VMM to configure interception of instructions or
+	 * MSR accesses.  TDX guest requests MSR accesses by calling TDVMCALL.
+	 * The MSR filters will be applied when handling the TDVMCALL for
+	 * RDMSR/WRMSR if the userspace has set any.
 	 */
 	if (is_td_vcpu(vcpu))
 		return;
 
-	vmx_recalc_msr_intercepts(vcpu);
+	vmx_recalc_intercepts(vcpu);
 }
 
 static int vt_complete_emulated_msr(struct kvm_vcpu *vcpu, int err)
@@ -995,7 +995,7 @@ struct kvm_x86_ops vt_x86_ops __initdata = {
 	.apic_init_signal_blocked = vt_op(apic_init_signal_blocked),
 	.migrate_timers = vmx_migrate_timers,
 
-	.recalc_msr_intercepts = vt_op(recalc_msr_intercepts),
+	.recalc_intercepts = vt_op(recalc_intercepts),
 	.complete_emulated_msr = vt_op(complete_emulated_msr),
 
 	.vcpu_deliver_sipi_vector = kvm_vcpu_deliver_sipi_vector,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 93b87f9e6dfd..2244ca074e9d 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4068,7 +4068,7 @@ void pt_update_intercept_for_msr(struct kvm_vcpu *vcpu)
 	}
 }
 
-void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
+static void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 {
 	if (!cpu_has_vmx_msr_bitmap())
 		return;
@@ -4121,6 +4121,11 @@ void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	 */
 }
 
+void vmx_recalc_intercepts(struct kvm_vcpu *vcpu)
+{
+	vmx_recalc_msr_intercepts(vcpu);
+}
+
 static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 						int vector)
 {
@@ -7778,7 +7783,7 @@ void vmx_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 			~FEAT_CTL_SGX_LC_ENABLED;
 
 	/* Recalc MSR interception to account for feature changes. */
-	vmx_recalc_msr_intercepts(vcpu);
+	vmx_recalc_intercepts(vcpu);
 
 	/* Refresh #PF interception to account for MAXPHYADDR changes. */
 	vmx_update_exception_bitmap(vcpu);
diff --git a/arch/x86/kvm/vmx/x86_ops.h b/arch/x86/kvm/vmx/x86_ops.h
index 2b3424f638db..2c590ff44ced 100644
--- a/arch/x86/kvm/vmx/x86_ops.h
+++ b/arch/x86/kvm/vmx/x86_ops.h
@@ -52,7 +52,7 @@ void vmx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
 			   int trig_mode, int vector);
 void vmx_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu);
 bool vmx_has_emulated_msr(struct kvm *kvm, u32 index);
-void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu);
+void vmx_recalc_intercepts(struct kvm_vcpu *vcpu);
 void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu);
 void vmx_update_exception_bitmap(struct kvm_vcpu *vcpu);
 int vmx_get_feature_msr(u32 msr, u64 *data);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2c34dd3f0222..69f5d9deb75f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6742,7 +6742,11 @@ static int kvm_vm_ioctl_set_msr_filter(struct kvm *kvm,
 
 	kvm_free_msr_filter(old_filter);
 
-	kvm_make_all_cpus_request(kvm, KVM_REQ_MSR_FILTER_CHANGED);
+	/*
+	 * Recalc MSR intercepts as userspace may want to intercept accesses to
+	 * MSRs that KVM would otherwise pass through to the guest.
+	 */
+	kvm_make_all_cpus_request(kvm, KVM_REQ_RECALC_INTERCEPTS);
 
 	return 0;
 }
@@ -10765,13 +10769,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_APF_READY, vcpu))
 			kvm_check_async_pf_completion(vcpu);
 
-		/*
-		 * Recalc MSR intercepts as userspace may want to intercept
-		 * accesses to MSRs that KVM would otherwise pass through to
-		 * the guest.
-		 */
-		if (kvm_check_request(KVM_REQ_MSR_FILTER_CHANGED, vcpu))
-			kvm_x86_call(recalc_msr_intercepts)(vcpu);
+		if (kvm_check_request(KVM_REQ_RECALC_INTERCEPTS, vcpu))
+			kvm_x86_call(recalc_intercepts)(vcpu);
 
 		if (kvm_check_request(KVM_REQ_UPDATE_CPU_DIRTY_LOGGING, vcpu))
 			kvm_x86_call(update_cpu_dirty_logging)(vcpu);
-- 
2.50.1.565.gc32cd1483b-goog


