Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSP+SKXtRx+biMOjK34h1pSwHQW4K9lXK2fj/zxr4DU=; b=YSwmMub2PEIHW4LiNkld1/PJpk
	QTJoChGsnv5tCFoKNfLFvpvzbptSyJkSy0jbDmi97c7B+YTw+FJFvb7xLFEmogDuAY6sCBldrqRAV
	2cSI1JaZ0kdkandOvKVu8zPQkHE4zrr/4I46reAK8mMyruA3pyxaofILvs5gpqRvRjW94CtHmWHlG
	QbAWLr1TNCR7I4HeD8R6nZojK1CA7sxJe7Rt1OJrglUPGsb80piHvR6V9YIyPuxjE8I30tLW3/2zf
	drQhRZfhkqi5Ifs5IpP9q7R64MmMA7WXkCpcJg9sNmsX1AxH4JVMt15BQZ89daAZErA6THZywZ4J+
	EJ8bAYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaLA-0000000AKKb-2JOA;
	Thu, 26 Jun 2025 00:19:44 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaED-0000000AJhR-14my
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:12:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-315af0857f2so294951a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 17:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750896752; x=1751501552; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XSP+SKXtRx+biMOjK34h1pSwHQW4K9lXK2fj/zxr4DU=;
        b=JD5AzmCgxW5RtVOg+qiFU4NqrmAD+PVy7/UHrwPvfu5UPsy1uVTr9fh5dGAfjlG5+K
         DYTnn5uQeh2KfJdwzHYMnWeJzDL88zF7x/g0SNU3Uw5/1AnGjYCfsjQbbRg/A1mhWpLI
         k3e6vtNyHuTIPvzmhf9O1WvkBpifumgucxYtH/OSFKWfR3Ffr44OjyeEzQBpVX6MY76P
         gTyEafZT2kv2ujf3tUTxkxL3yn5zfZFI+3rvy28UhRWREGA20+cswJgt1fJm1ifoXotD
         Eqp7aXjG7Un2QuJwOVvK0G9HnvkUZADdfrsw+tYxzn06WKI07vwC7/DdR/s6WTpJWH9f
         YCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896752; x=1751501552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSP+SKXtRx+biMOjK34h1pSwHQW4K9lXK2fj/zxr4DU=;
        b=DcHtDk0yrNcfvNqIjiCTRPyoX6/iThx+rFP7WcPOIbsRWTL1D2Mt+gzGqVc+x1WksT
         MWzXkoZCa3uooYxMbWwulGrfGLJde2ZCRSIX8XX13FXmE6jN1slVnvJ9zgbZjkb+O/l2
         7W4XnppU2mYawKlIflB/ii9SHjbLbssqi/vfzJeVaXX4EL9MFtBtsss2iKcGjFyYfaRm
         rgacZUtkhTKc5RIUD4EMmx15IkayWObhYyDVyj794aBdob7GOZ0rSDKXb5afqza7fxWW
         j8vVFHXtJRgtgMQqDy0Mtc4EVH1rb/bFoxQKMAspc8LilsxJekPjnelrvtiAeJAPxmMl
         x8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNmEDjntv+egYOD1xDRZE2vEZ1tRRCOGd0F+YLmywI2TP67l1myLzj0gbmhiAGAGc0Q3vWCIo5YaY5lxR4Z5H6@lists.infradead.org
X-Gm-Message-State: AOJu0YyEMbQxL+gOtnAJkvRyXscCiO01Or7PAHo+eI2m9nCg92JqkQnM
	GlYNYfNbJ4zeBB7vf24LA4oNcUp27fMTKvTSVOOxbIk+ImVPVqiIgyGoSi11rfntAFGPdamNKQ8
	sigaufg==
X-Google-Smtp-Source: AGHT+IFx2aeEYWWp0A4eOd+dZkDdacmFG8AeQwkHeIe1hmy4RL4XWPzZG1HZhh54tyUmB3eNC5v+ZYUBeck=
X-Received: from pjbsz14.prod.google.com ([2002:a17:90b:2d4e:b0:313:1c10:3595])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5484:b0:312:1d2d:18e1
 with SMTP id 98e67ed59e1d1-315f2671e07mr5802724a91.22.1750896752146; Wed, 25
 Jun 2025 17:12:32 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:12:22 -0700
In-Reply-To: <20250626001225.744268-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250626001225.744268-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626001225.744268-3-seanjc@google.com>
Subject: [PATCH v5 2/5] KVM: x86: Provide a capability to disable APERF/MPERF
 read intercepts
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_171233_304336_0166D668 
X-CRM114-Status: GOOD (  19.61  )
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

From: Jim Mattson <jmattson@google.com>

Allow a guest to read the physical IA32_APERF and IA32_MPERF MSRs
without interception.

The IA32_APERF and IA32_MPERF MSRs are not virtualized. Writes are not
handled at all. The MSR values are not zeroed on vCPU creation, saved
on suspend, or restored on resume. No accommodation is made for
processor migration or for sharing a logical processor with other
tasks. No adjustments are made for non-unit TSC multipliers. The MSRs
do not account for time the same way as the comparable PMU events,
whether the PMU is virtualized by the traditional emulation method or
the new mediated pass-through approach.

Nonetheless, in a properly constrained environment, this capability
can be combined with a guest CPUID table that advertises support for
CPUID.6:ECX.APERFMPERF[bit 0] to induce a Linux guest to report the
effective physical CPU frequency in /proc/cpuinfo. Moreover, there is
no performance cost for this capability.

Signed-off-by: Jim Mattson <jmattson@google.com>
Link: https://lore.kernel.org/r/20250530185239.2335185-3-jmattson@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst | 23 +++++++++++++++++++++++
 arch/x86/kvm/svm/nested.c      |  4 +++-
 arch/x86/kvm/svm/svm.c         |  5 +++++
 arch/x86/kvm/vmx/nested.c      |  6 ++++++
 arch/x86/kvm/vmx/vmx.c         |  4 ++++
 arch/x86/kvm/x86.c             |  6 +++++-
 arch/x86/kvm/x86.h             |  5 +++++
 include/uapi/linux/kvm.h       |  1 +
 tools/include/uapi/linux/kvm.h |  1 +
 9 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 43ed57e048a8..27ced3ee2b53 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7844,6 +7844,7 @@ Valid bits in args[0] are::
   #define KVM_X86_DISABLE_EXITS_HLT              (1 << 1)
   #define KVM_X86_DISABLE_EXITS_PAUSE            (1 << 2)
   #define KVM_X86_DISABLE_EXITS_CSTATE           (1 << 3)
+  #define KVM_X86_DISABLE_EXITS_APERFMPERF       (1 << 4)
 
 Enabling this capability on a VM provides userspace with a way to no
 longer intercept some instructions for improved latency in some
@@ -7854,6 +7855,28 @@ all such vmexits.
 
 Do not enable KVM_FEATURE_PV_UNHALT if you disable HLT exits.
 
+Virtualizing the ``IA32_APERF`` and ``IA32_MPERF`` MSRs requires more
+than just disabling APERF/MPERF exits. While both Intel and AMD
+document strict usage conditions for these MSRs--emphasizing that only
+the ratio of their deltas over a time interval (T0 to T1) is
+architecturally defined--simply passing through the MSRs can still
+produce an incorrect ratio.
+
+This erroneous ratio can occur if, between T0 and T1:
+
+1. The vCPU thread migrates between logical processors.
+2. Live migration or suspend/resume operations take place.
+3. Another task shares the vCPU's logical processor.
+4. C-states lower thean C0 are emulated (e.g., via HLT interception).
+5. The guest TSC frequency doesn't match the host TSC frequency.
+
+Due to these complexities, KVM does not automatically associate this
+passthrough capability with the guest CPUID bit,
+``CPUID.6:ECX.APERFMPERF[bit 0]``. Userspace VMMs that deem this
+mechanism adequate for virtualizing the ``IA32_APERF`` and
+``IA32_MPERF`` MSRs must set the guest CPUID bit explicitly.
+
+
 7.14 KVM_CAP_S390_HPAGE_1M
 --------------------------
 
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 749f7b866ac8..b7fd2e869998 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -194,7 +194,7 @@ void recalc_intercepts(struct vcpu_svm *svm)
  * Hardcode the capacity of the array based on the maximum number of _offsets_.
  * MSRs are batched together, so there are fewer offsets than MSRs.
  */
-static int nested_svm_msrpm_merge_offsets[6] __ro_after_init;
+static int nested_svm_msrpm_merge_offsets[7] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 typedef unsigned long nsvm_msrpm_merge_t;
 
@@ -216,6 +216,8 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 		MSR_IA32_SPEC_CTRL,
 		MSR_IA32_PRED_CMD,
 		MSR_IA32_FLUSH_CMD,
+		MSR_IA32_APERF,
+		MSR_IA32_MPERF,
 		MSR_IA32_LASTBRANCHFROMIP,
 		MSR_IA32_LASTBRANCHTOIP,
 		MSR_IA32_LASTINTFROMIP,
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 5ad54640314f..d9931c6c4bc6 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -839,6 +839,11 @@ static void svm_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 	svm_set_intercept_for_msr(vcpu, MSR_IA32_SYSENTER_ESP, MSR_TYPE_RW,
 				  guest_cpuid_is_intel_compatible(vcpu));
 
+	if (kvm_aperfmperf_in_guest(vcpu->kvm)) {
+		svm_disable_intercept_for_msr(vcpu, MSR_IA32_APERF, MSR_TYPE_R);
+		svm_disable_intercept_for_msr(vcpu, MSR_IA32_MPERF, MSR_TYPE_R);
+	}
+
 	if (sev_es_guest(vcpu->kvm))
 		sev_es_recalc_msr_intercepts(vcpu);
 
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index c69df3aba8d1..b8ea1969113d 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -715,6 +715,12 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
 
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
+					 MSR_IA32_APERF, MSR_TYPE_R);
+
+	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
+					 MSR_IA32_MPERF, MSR_TYPE_R);
+
 	kvm_vcpu_unmap(vcpu, &map);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 702486e7511c..58c5dd368222 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4088,6 +4088,10 @@ void vmx_recalc_msr_intercepts(struct kvm_vcpu *vcpu)
 		vmx_disable_intercept_for_msr(vcpu, MSR_CORE_C6_RESIDENCY, MSR_TYPE_R);
 		vmx_disable_intercept_for_msr(vcpu, MSR_CORE_C7_RESIDENCY, MSR_TYPE_R);
 	}
+	if (kvm_aperfmperf_in_guest(vcpu->kvm)) {
+		vmx_disable_intercept_for_msr(vcpu, MSR_IA32_APERF, MSR_TYPE_R);
+		vmx_disable_intercept_for_msr(vcpu, MSR_IA32_MPERF, MSR_TYPE_R);
+	}
 
 	/* PT MSRs can be passed through iff PT is exposed to the guest. */
 	if (vmx_pt_mode_is_host_guest())
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2d893993262b..28541a612526 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4580,6 +4580,9 @@ static u64 kvm_get_allowed_disable_exits(void)
 {
 	u64 r = KVM_X86_DISABLE_EXITS_PAUSE;
 
+	if (boot_cpu_has(X86_FEATURE_APERFMPERF))
+		r |= KVM_X86_DISABLE_EXITS_APERFMPERF;
+
 	if (!mitigate_smt_rsb) {
 		r |= KVM_X86_DISABLE_EXITS_HLT |
 			KVM_X86_DISABLE_EXITS_CSTATE;
@@ -6478,7 +6481,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 
 		if (!mitigate_smt_rsb && boot_cpu_has_bug(X86_BUG_SMT_RSB) &&
 		    cpu_smt_possible() &&
-		    (cap->args[0] & ~KVM_X86_DISABLE_EXITS_PAUSE))
+		    (cap->args[0] & ~(KVM_X86_DISABLE_EXITS_PAUSE |
+				      KVM_X86_DISABLE_EXITS_APERFMPERF)))
 			pr_warn_once(SMT_RSB_MSG);
 
 		kvm_disable_exits(kvm, cap->args[0]);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 31ae58b765f3..bcfd9b719ada 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -546,6 +546,11 @@ static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 	return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_CSTATE;
 }
 
+static inline bool kvm_aperfmperf_in_guest(struct kvm *kvm)
+{
+	return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_APERFMPERF;
+}
+
 static inline bool kvm_notify_vmexit_enabled(struct kvm *kvm)
 {
 	return kvm->arch.notify_vmexit_flags & KVM_X86_NOTIFY_VMEXIT_ENABLED;
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7a4c35ff03fe..aeb2ca10b190 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -644,6 +644,7 @@ struct kvm_ioeventfd {
 #define KVM_X86_DISABLE_EXITS_HLT            (1 << 1)
 #define KVM_X86_DISABLE_EXITS_PAUSE          (1 << 2)
 #define KVM_X86_DISABLE_EXITS_CSTATE         (1 << 3)
+#define KVM_X86_DISABLE_EXITS_APERFMPERF     (1 << 4)
 
 /* for KVM_ENABLE_CAP */
 struct kvm_enable_cap {
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index d00b85cb168c..7415a3863891 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -618,6 +618,7 @@ struct kvm_ioeventfd {
 #define KVM_X86_DISABLE_EXITS_HLT            (1 << 1)
 #define KVM_X86_DISABLE_EXITS_PAUSE          (1 << 2)
 #define KVM_X86_DISABLE_EXITS_CSTATE         (1 << 3)
+#define KVM_X86_DISABLE_EXITS_APERFMPERF     (1 << 4)
 
 /* for KVM_ENABLE_CAP */
 struct kvm_enable_cap {
-- 
2.50.0.727.gbf7dc18ff4-goog


