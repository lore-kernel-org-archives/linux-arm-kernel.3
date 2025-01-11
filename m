Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19753E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 01:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb/3+mKu6t8Zhrqra/tibkxSDkT7W4OQb1wzc5Zn/9I=; b=4yrp7c0d50wgq2lpTHelcCNtg1
	AWr9pB932xDJHbi8jgGhwbyHH+iQ0rHtW16lhOySMoqr1FHVUvziBP+FXhvqIJSoqzo8ir5wQUVcd
	Bu+eIfIdsfEyc7MFlTotmwNs/ceuflYSB49+wIhKEjp2Q8TyJamcewUBZpb20saVh9GLVRbyTlFPq
	iH4JUhS2DDYKvaVR20NqLt3LsXn7uwV5W5GvgpBDSlhMvkBevTgQ3ZTQ1Gn/knY1pd2Ghf6ChdJ7m
	EVhsWKF+D2rUUkJbFAbbR2+CnYjEtmf+uVdj3mCrewhiNY5takUYDQrixMOHnlJ5klv1UifVUNWpQ
	cQVc7HyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQIo-0000000HV9o-41hb;
	Sat, 11 Jan 2025 01:28:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFG-0000000HURb-2p89
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:24:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso4801323a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 17:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558697; x=1737163497; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=eb/3+mKu6t8Zhrqra/tibkxSDkT7W4OQb1wzc5Zn/9I=;
        b=DnVmTwiTzvSkWFQaS24Gjq0zqMKUffaueJVs8LDgWzScDrcFXb1rHWypcWwjHqEGL2
         z0jzC/xbeRUNvp/8Klhdoh2GOcQyQNXmYpXPrnTY51/Il979t2M5KNq3JL66LHj2o8W1
         x6832L/WL843O6a0PpHydBxVwxj3/UB+ax7to4WNVRJfdG7tpuY67l4+Rwbzm4nz7GsC
         gwqg644vj4d1+su9XPYL/WwctsmIeyTYsUVJc3yqhz8OBy+YFa7dZ/5PpZGRtRoTmhkw
         xpdP1g2fwV4ptgwCoi822uQ1wP7OxpPDslhljuO95App+2Ihk4hQkHeaIL7V8IE3MYXZ
         03jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558697; x=1737163497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb/3+mKu6t8Zhrqra/tibkxSDkT7W4OQb1wzc5Zn/9I=;
        b=wyafgBjDWmRTK84vyrhExOnHN8gG0IqZHucqBYBH/MhNgESqmzxpLZGpa4aTb78CmY
         PNDUAVFGQyYnVp3puHmvhXAP6V0nMiGSEiAAdKagjt1a4n0qGBZKtIn36p3m+t4v1cyt
         2pCfrRk6Ii28TBLZ01JR7EA6NIIGJyp1jkV7qPWY5NHdopQcHFTZF/EqQ7A4TGNdmAgX
         wtVgL/MYjFEvm+ehiFN5a45RtcLDuymBV8Ma/3mtP37NgadD7Op+pXLHT7CmPuvsHCAO
         7wTqsZKTmQSxgTBSwnmHFfpPP4G7EJzMWFnChlmvmQlZf0e/8n8szFdMIE6c85Txqg6v
         jwSw==
X-Forwarded-Encrypted: i=1; AJvYcCXU55Opai8DGEjBI1fV5U03bqv4qdfjx/Qt3qCJmz3cOlN30H2VFt1XwHdDH8Uvq99V8qI23kCxH/IwMNIcuIqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwYT4/TGqfIgpiUWVmJEutVhVMk+pYGdTN47rZ+36fo8dxBQjnI
	jF+6s7CO2HngtkPQ5onzCapJv9Z8htGpwOb80tIN3GXPltF+ymKtUSRYrH7iWAm4PaldWMbvdHK
	aMQ==
X-Google-Smtp-Source: AGHT+IEahfph4iX899pUZU2sWlx08q+szoXMpcKFVnSL/6Z/oUV0Zh5RCrkeMGXrUzIUgcOK6vulcmkt/Qg=
X-Received: from pjvb13.prod.google.com ([2002:a17:90a:d88d:b0:2ee:4679:4a6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f03:b0:2ee:ed1c:e451
 with SMTP id 98e67ed59e1d1-2f548eb32ffmr20060830a91.15.1736558697483; Fri, 10
 Jan 2025 17:24:57 -0800 (PST)
Date: Fri, 10 Jan 2025 17:24:48 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-4-seanjc@google.com>
Subject: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an exit
 needs completion
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_172458_717279_9BA8CBEF 
X-CRM114-Status: GOOD (  23.92  )
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

Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
that KVM_RUN needs to be re-executed prior to save/restore in order to
complete the instruction/operation that triggered the userspace exit.

KVM's current approach of adding notes in the Documentation is beyond
brittle, e.g. there is at least one known case where a KVM developer added
a new userspace exit type, and then that same developer forgot to handle
completion when adding userspace support.

On x86, there are multiple exits that need completion, but they are all
conveniently funneled through a single callback, i.e. in theory, this is a
one-time thing for KVM x86 (and other architectures could follow suit with
additional refactoring).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/api.rst    | 48 ++++++++++++++++++++++---------
 arch/powerpc/kvm/book3s_emulate.c |  1 +
 arch/powerpc/kvm/book3s_hv.c      |  1 +
 arch/powerpc/kvm/book3s_pr.c      |  2 ++
 arch/powerpc/kvm/booke.c          |  1 +
 arch/x86/include/uapi/asm/kvm.h   |  7 +++--
 arch/x86/kvm/x86.c                |  2 ++
 include/uapi/linux/kvm.h          |  3 ++
 virt/kvm/kvm_main.c               |  1 +
 9 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index c92c8d4e8779..8e172675d8d6 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6505,7 +6505,7 @@ local APIC is not used.
 
 	__u16 flags;
 
-More architecture-specific flags detailing state of the VCPU that may
+Common and architecture-specific flags detailing state of the VCPU that may
 affect the device's behavior. Current defined flags::
 
   /* x86, set if the VCPU is in system management mode */
@@ -6518,6 +6518,8 @@ affect the device's behavior. Current defined flags::
   /* arm64, set for KVM_EXIT_DEBUG */
   #define KVM_DEBUG_ARCH_HSR_HIGH_VALID  (1 << 0)
 
+  /* all architectures, set when the exit needs completion (via KVM_RUN) */
+  #define KVM_RUN_NEEDS_COMPLETION  (1 << 15)
 ::
 
 	/* in (pre_kvm_run), out (post_kvm_run) */
@@ -6632,19 +6634,10 @@ requires a guest to interact with host userspace.
 
 .. note::
 
-      For KVM_EXIT_IO, KVM_EXIT_MMIO, KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN,
-      KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR, KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL
-      the corresponding operations are complete (and guest state is consistent)
-      only after userspace has re-entered the kernel with KVM_RUN.  The kernel
-      side will first finish incomplete operations and then check for pending
-      signals.
+      For some exits, userspace must re-enter the kernel with KVM_RUN to
+      complete the exit and ensure guest state is consistent.
 
-      The pending state of the operation is not preserved in state which is
-      visible to userspace, thus userspace should ensure that the operation is
-      completed before performing a live migration.  Userspace can re-enter the
-      guest with an unmasked signal pending or with the immediate_exit field set
-      to complete pending operations without allowing any further instructions
-      to be executed.
+      See KVM_CAP_NEEDS_COMPLETION for details.
 
 ::
 
@@ -8239,7 +8232,7 @@ Note: Userspace is responsible for correctly configuring CPUID 0x15, a.k.a. the
 core crystal clock frequency, if a non-zero CPUID 0x15 is exposed to the guest.
 
 7.36 KVM_CAP_X86_GUEST_MODE
-------------------------------
+---------------------------
 
 :Architectures: x86
 :Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
@@ -8252,6 +8245,33 @@ KVM exits with the register state of either the L1 or L2 guest
 depending on which executed at the time of an exit. Userspace must
 take care to differentiate between these cases.
 
+7.37 KVM_CAP_NEEDS_COMPLETION
+-----------------------------
+
+:Architectures: all
+:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
+
+The presence of this capability indicates that KVM_RUN will set
+KVM_RUN_NEEDS_COMPLETION in kvm_run.flags if KVM requires userspace to re-enter
+the kernel KVM_RUN to complete the exit.
+
+For select exits, userspace must re-enter the kernel with KVM_RUN to complete
+the corresponding operation, only after which is guest state guaranteed to be
+consistent.  On such a KVM_RUN, the kernel side will first finish incomplete
+operations and then check for pending signals.
+
+The pending state of the operation for such exits is not preserved in state
+which is visible to userspace, thus userspace should ensure that the operation
+is completed before performing state save/restore, e.g. for live migration.
+Userspace can re-enter the guest with an unmasked signal pending or with the
+immediate_exit field set to complete pending operations without allowing any
+further instructions to be executed.
+
+Without KVM_CAP_NEEDS_COMPLETION, KVM_RUN_NEEDS_COMPLETION will never be set
+and userspace must assume that exits of type KVM_EXIT_IO, KVM_EXIT_MMIO,
+KVM_EXIT_OSI, KVM_EXIT_PAPR, KVM_EXIT_XEN, KVM_EXIT_EPR, KVM_EXIT_X86_RDMSR,
+KVM_EXIT_X86_WRMSR, and KVM_EXIT_HYPERCALL require completion.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/powerpc/kvm/book3s_emulate.c b/arch/powerpc/kvm/book3s_emulate.c
index de126d153328..15014a66c167 100644
--- a/arch/powerpc/kvm/book3s_emulate.c
+++ b/arch/powerpc/kvm/book3s_emulate.c
@@ -374,6 +374,7 @@ int kvmppc_core_emulate_op_pr(struct kvm_vcpu *vcpu,
 			}
 
 			vcpu->run->exit_reason = KVM_EXIT_PAPR_HCALL;
+			vcpu->run->flags |= KVM_RUN_NEEDS_COMPLETION;
 			vcpu->arch.hcall_needed = 1;
 			emulated = EMULATE_EXIT_USER;
 			break;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index b253f7372774..05ad0c3494f1 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1767,6 +1767,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		for (i = 0; i < 9; ++i)
 			run->papr_hcall.args[i] = kvmppc_get_gpr(vcpu, 4 + i);
 		run->exit_reason = KVM_EXIT_PAPR_HCALL;
+		run->flags |= KVM_RUN_NEEDS_COMPLETION;
 		vcpu->arch.hcall_needed = 1;
 		r = RESUME_HOST;
 		break;
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 83bcdc80ce51..c45beb64905a 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1310,6 +1310,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 				run->papr_hcall.args[i] = gpr;
 			}
 			run->exit_reason = KVM_EXIT_PAPR_HCALL;
+			run->flags |= KVM_RUN_NEEDS_COMPLETION;
 			vcpu->arch.hcall_needed = 1;
 			r = RESUME_HOST;
 		} else if (vcpu->arch.osi_enabled &&
@@ -1320,6 +1321,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 			int i;
 
 			run->exit_reason = KVM_EXIT_OSI;
+			run->flags |= KVM_RUN_NEEDS_COMPLETION;
 			for (i = 0; i < 32; i++)
 				gprs[i] = kvmppc_get_gpr(vcpu, i);
 			vcpu->arch.osi_needed = 1;
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6a5be025a8af..3a0e00178fa5 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -751,6 +751,7 @@ int kvmppc_core_check_requests(struct kvm_vcpu *vcpu)
 		vcpu->run->epr.epr = 0;
 		vcpu->arch.epr_needed = true;
 		vcpu->run->exit_reason = KVM_EXIT_EPR;
+		vcpu->run->flags |= KVM_RUN_NEEDS_COMPLETION;
 		r = 0;
 	}
 
diff --git a/arch/x86/include/uapi/asm/kvm.h b/arch/x86/include/uapi/asm/kvm.h
index 88585c1de416..e2ec32a8970c 100644
--- a/arch/x86/include/uapi/asm/kvm.h
+++ b/arch/x86/include/uapi/asm/kvm.h
@@ -104,9 +104,10 @@ struct kvm_ioapic_state {
 #define KVM_IRQCHIP_IOAPIC       2
 #define KVM_NR_IRQCHIPS          3
 
-#define KVM_RUN_X86_SMM		 (1 << 0)
-#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
-#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
+#define KVM_RUN_X86_SMM			(1 << 0)
+#define KVM_RUN_X86_BUS_LOCK		(1 << 1)
+#define KVM_RUN_X86_GUEST_MODE		(1 << 2)
+#define KVM_RUN_X86_NEEDS_COMPLETION	(1 << 2)
 
 /* for KVM_GET_REGS and KVM_SET_REGS */
 struct kvm_regs {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a8aa12e0911d..67034b089371 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10154,6 +10154,8 @@ static void post_kvm_run_save(struct kvm_vcpu *vcpu)
 		kvm_run->flags |= KVM_RUN_X86_SMM;
 	if (is_guest_mode(vcpu))
 		kvm_run->flags |= KVM_RUN_X86_GUEST_MODE;
+	if (vcpu->arch.complete_userspace_io)
+		kvm_run->flags |= KVM_RUN_NEEDS_COMPLETION;
 }
 
 static void update_cr8_intercept(struct kvm_vcpu *vcpu)
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 343de0a51797..91dbee3ae0bc 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -192,6 +192,8 @@ struct kvm_xen_exit {
 /* Flags that describe what fields in emulation_failure hold valid data. */
 #define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
 
+#define KVM_RUN_NEEDS_COMPLETION	(1 << 15)
+
 /*
  * struct kvm_run can be modified by userspace at any time, so KVM must be
  * careful to avoid TOCTOU bugs. In order to protect KVM, HINT_UNSAFE_IN_KVM()
@@ -933,6 +935,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_NEEDS_COMPLETION 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7d2076439081..28aa89e5ba85 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4746,6 +4746,7 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_CHECK_EXTENSION_VM:
 	case KVM_CAP_ENABLE_CAP_VM:
 	case KVM_CAP_HALT_POLL:
+	case KVM_CAP_NEEDS_COMPLETION:
 		return 1;
 #ifdef CONFIG_KVM_MMIO
 	case KVM_CAP_COALESCED_MMIO:
-- 
2.47.1.613.gc27f4b7a9f-goog


