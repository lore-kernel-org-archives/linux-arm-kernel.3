Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D771CC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 19:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pCn5NGmkecFI7kg7iK/GSw/y8sj0MDaaDl/qTKpLnM=; b=k/ZWmLFdZyucDBkqOK9U/llFCs
	03N9+kQh1ZpZl6kqzh3p138wRTNK0hZDO4/PFCcmyAfnzeQd51x/6zdaba0olubzE4vbpLhOaFgOs
	9bLWBZB1xwzEGUmg3R0RAFnyIjbs5fvEtaeU1H2s6/OpfT6Jo92u0HlOaSuhcyGoqXQOwhZgILcM/
	NM0jlIg9xuT9kPe8EnPhqihWHdUZsCe/W76GyoMin6kq/2Qvo4n5dE2kX17jSiSYXJ4IUkhMzU2Hw
	XpPUw2zFaA9IluOao4Kv0Vh24CFqsB/s+BdcdKdVG5q58HjO5csA6CKi4lYqBwo33pDibQv2/JRRA
	wBMe16ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagNo-0000000GyRH-2I7I;
	Sat, 12 Jul 2025 19:59:40 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagLQ-0000000Gy6H-0DGL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 19:57:13 +0000
Date: Sat, 12 Jul 2025 12:57:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752350227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+pCn5NGmkecFI7kg7iK/GSw/y8sj0MDaaDl/qTKpLnM=;
	b=gkwpo2EOYiCDeoEXLJ4zYlSYl/QS8QftdcAuc1TyMKl9JOwTFE/Tfc8Arh9BUbM/1SBbmO
	PRpFzZ0DQyjRyC+P82l45BeuP0+X+GvEXKngzM+pS5x17SDdbXr58rdFV2sHSwUOqyZT2/
	iH4G/vd6b03weXckn3UxUrJgHqGxV3s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Subject: Re: [PATCH v2 1/6] KVM: arm64: VM exit to userspace to handle SEA
Message-ID: <aHK-DPufhLy5Dtuk@linux.dev>
References: <20250604050902.3944054-1-jiaqiyan@google.com>
 <20250604050902.3944054-2-jiaqiyan@google.com>
 <aHFohmTb9qR_JG1E@linux.dev>
 <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_125712_239417_EF7BB494 
X-CRM114-Status: GOOD (  40.58  )
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

On Fri, Jul 11, 2025 at 04:59:11PM -0700, Jiaqi Yan wrote:
> >  - Add some detail about FEAT_RAS where we may still exit to userspace
> >    for host-controlled memory, as we cannot differentiate between a
> >    stage-1 or stage-2 TTW SEA when taken on the descriptor PA
> 
> Ah, IIUC, you are saying even if the FSC code tells fault is on TTW
> (esr_fsc_is_secc_ttw or esr_fsc_is_sea_ttw), it can either be guest
> stage-1's or stage-2's descriptor PA, and we can tell which from
> which.
> 
> However, if ESR_ELx_S1PTW is set, we can tell this is a sub-case of
> stage-2 descriptor PA, their usage is for stage-1 PTW but they are
> stage-2 memory.
> 
> Is my current understanding right?

Yep, that's exactly what I'm getting at. As you note, stage-2 aborts
during a stage-1 walk are sufficiently described, but not much else.

> > +/*
> > + * Returns true if the SEA should be handled locally within KVM if the abort is
> > + * caused by a kernel memory allocation (e.g. stage-2 table memory).
> > + */
> > +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> > +{
> > +       /*
> > +        * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any external abort
> > +        * taken from a guest EL to EL2 is due to a host-imposed access (e.g.
> > +        * stage-2 PTW).
> > +        */
> > +       if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> > +               return true;
> > +
> > +       /* KVM owns the VNCR when the vCPU isn't in a nested context. */
> > +       if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> > +               return true;
> > +
> > +       /*
> > +        * Determining if an external abort during a table walk happened at
> > +        * stage-2 is only possible with S1PTW is set. Otherwise, since KVM
> > +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. accessing the PA
> > +        * of the stage-1 descriptor) can reach here and are reported with a
> > +        * TTW ESR value.
> > +        */
> > +       return esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW);
> 
> Should we include esr_fsc_is_secc_ttw? like
>   (esr_fsc_is_sea_ttw(esr) || esr_fsc_is_secc_ttw(esr)) && (esr & ESR_ELx_S1PTW)

Parity / ECC errors are not permitted if FEAT_RAS is implemented (which
is tested for up front).

> > +}
> > +
> >  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> >  {
> > +       u64 esr = kvm_vcpu_get_esr(vcpu);
> > +       struct kvm_run *run = vcpu->run;
> > +       struct kvm *kvm = vcpu->kvm;
> > +       u64 esr_mask = ESR_ELx_EC_MASK  |
> > +                      ESR_ELx_FnV      |
> > +                      ESR_ELx_EA       |
> > +                      ESR_ELx_CM       |
> > +                      ESR_ELx_WNR      |
> > +                      ESR_ELx_FSC;
> 
> Do you (and why) exclude ESR_ELx_IL on purpose?

Unintended :)

> BTW, if my previous statement about TTW SEA is correct, then I also
> understand why we need to explicitly exclude ESR_ELx_S1PTW.

Right, we shouldn't be exposing genuine stage-2 external aborts to userspace.

> > +       u64 ipa;
> > +
> > +
> >         /*
> >          * Give APEI the opportunity to claim the abort before handling it
> >          * within KVM. apei_claim_sea() expects to be called with IRQs
> > @@ -1824,7 +1864,32 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> >         if (apei_claim_sea(NULL) == 0)
> 
> I assume kvm should still lockdep_assert_irqs_enabled(), right? That
> is, a WARN_ON_ONCE is still useful in case?

Ah, this is diffed against my VNCR prefix which has this context. Yes, I
want to preserve the lockdep assertion.


From eb63dbf07b3d1f42b059f5c94abd147d195299c8 Mon Sep 17 00:00:00 2001
From: Oliver Upton <oliver.upton@linux.dev>
Date: Thu, 10 Jul 2025 17:14:51 -0700
Subject: [PATCH] KVM: arm64: nv: Handle SEAs due to VNCR redirection

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_mmu.h |  1 +
 arch/arm64/include/asm/kvm_ras.h | 25 -------------------------
 arch/arm64/kvm/mmu.c             | 30 ++++++++++++++++++------------
 arch/arm64/kvm/nested.c          |  3 +++
 4 files changed, 22 insertions(+), 37 deletions(-)
 delete mode 100644 arch/arm64/include/asm/kvm_ras.h

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index ae563ebd6aee..e4069f2ce642 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -180,6 +180,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
 int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
 			  phys_addr_t pa, unsigned long size, bool writable);
 
+int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
 
 phys_addr_t kvm_mmu_get_httbr(void);
diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/kvm_ras.h
deleted file mode 100644
index 9398ade632aa..000000000000
--- a/arch/arm64/include/asm/kvm_ras.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (C) 2018 - Arm Ltd */
-
-#ifndef __ARM64_KVM_RAS_H__
-#define __ARM64_KVM_RAS_H__
-
-#include <linux/acpi.h>
-#include <linux/errno.h>
-#include <linux/types.h>
-
-#include <asm/acpi.h>
-
-/*
- * Was this synchronous external abort a RAS notification?
- * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
- */
-static inline int kvm_handle_guest_sea(void)
-{
-	/* apei_claim_sea(NULL) expects to mask interrupts itself */
-	lockdep_assert_irqs_enabled();
-
-	return apei_claim_sea(NULL);
-}
-
-#endif /* __ARM64_KVM_RAS_H__ */
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1c78864767c5..6934f4acdc45 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -4,19 +4,20 @@
  * Author: Christoffer Dall <c.dall@virtualopensystems.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/mman.h>
 #include <linux/kvm_host.h>
 #include <linux/io.h>
 #include <linux/hugetlb.h>
 #include <linux/sched/signal.h>
 #include <trace/events/kvm.h>
+#include <asm/acpi.h>
 #include <asm/pgalloc.h>
 #include <asm/cacheflush.h>
 #include <asm/kvm_arm.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_pgtable.h>
 #include <asm/kvm_pkvm.h>
-#include <asm/kvm_ras.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
 #include <asm/virt.h>
@@ -1811,6 +1812,20 @@ static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
+int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Give APEI the opportunity to claim the abort before handling it
+	 * within KVM. apei_claim_sea() expects to be called with IRQs
+	 * enabled.
+	 */
+	lockdep_assert_irqs_enabled();
+	if (apei_claim_sea(NULL) == 0)
+		return 1;
+
+	return kvm_inject_serror(vcpu);
+}
+
 /**
  * kvm_handle_guest_abort - handles all 2nd stage aborts
  * @vcpu:	the VCPU pointer
@@ -1834,17 +1849,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	gfn_t gfn;
 	int ret, idx;
 
-	/* Synchronous External Abort? */
-	if (kvm_vcpu_abt_issea(vcpu)) {
-		/*
-		 * For RAS the host kernel may handle this abort.
-		 * There is no need to pass the error into the guest.
-		 */
-		if (kvm_handle_guest_sea())
-			return kvm_inject_serror(vcpu);
-
-		return 1;
-	}
+	if (kvm_vcpu_abt_issea(vcpu))
+		return kvm_handle_guest_sea(vcpu);
 
 	esr = kvm_vcpu_get_esr(vcpu);
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 096747a61bf6..38b0e3a9a6db 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1289,6 +1289,9 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
 
 	BUG_ON(!(esr & ESR_ELx_VNCR_SHIFT));
 
+	if (kvm_vcpu_abt_issea(vcpu))
+		return kvm_handle_guest_sea(vcpu);
+
 	if (esr_fsc_is_permission_fault(esr)) {
 		inject_vncr_perm(vcpu);
 	} else if (esr_fsc_is_translation_fault(esr)) {
-- 
2.39.5


