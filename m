Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97F3C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SrH0YNsJJUyH6a6DVSuV6GhoCitszYqU7WFGsnyX9bU=; b=1EghqHs7j9ujt+Xz8WvoSLkeky
	FV4/X/z1X9xczjTVOrQUCLkDNAkd1WAffNNo6QYJADpWmpSlDuo32DpO4w22fr1n2nTx+/Xqe/tPB
	+9HOFvBmbcYdSxrz3ktYvfhUmWfuS10so6NuZhyi2UyI3vy6L+qPU304wg6G+/bt5EnalM1sO69NM
	PA1jeCNg4/heL5NJaBqy6zG03pAG/mDZNHLd08Kk6VYQ2gfcOeQwYQtdj2X2wI4ND7gq3ntGV2pIK
	kENtIRSecBwecxnXuuYEavJ4dTiaJzHdLAHVecORl4dRNRiGMmw4X58g6tmE5yGOvD3/LI4XINvaC
	/Qt8f9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRLV-0000000AoWn-2b6q;
	Fri, 25 Jul 2025 22:56:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRJ2-0000000AoKe-20Kj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 22:54:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4562b2d98bcso7955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 15:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753484062; x=1754088862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrH0YNsJJUyH6a6DVSuV6GhoCitszYqU7WFGsnyX9bU=;
        b=S0IxnfnYmyxxsICtNe+LHfTQ+t7Hl8GrJ6oU7e0p2lZ2w+MgfryDdiJo0l+xIIbvCi
         F42KFCeD2Z6tVdijNi3wt3Qz+MVbD6dagZ2r02j7SMF/woIBUL13u7TvS72OJcY41gWG
         QRbuEbOKeUxFC/KfKEm7VwfxDE3GmPMvIVem0j22JnGol+pukvFR7BLXvzB9GVrBDzUE
         mirZPQJMOGg4FQek6AdjcK1kOZxMnRb6N62NdeMbmuVDqv5sreiY8AwLeJg1SjredrlI
         gdv70icmU730/eFSiEQTKbl9iC5RHCA6/8rfuqQjCQPeKOzXSjzgecloMLB38q2w4dTZ
         J9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753484062; x=1754088862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrH0YNsJJUyH6a6DVSuV6GhoCitszYqU7WFGsnyX9bU=;
        b=dG9hponzrrx8jbPo7dRS3MUP4UawwPRtwlbarCJUyhZhQAMCVz7HehKqj3tYA+TlRY
         m/mBHREgmJeGo2SxNn0+jfGODNtHYnN/dew7I9f6nMfY7Dup9ePIvvbtsyQCaOl5+AjD
         eLfR7lhbrzG/pUkaJl9kVvPDdo7oOUrhA3Lbpsmd0a2cj3cZ+DNfO0oA4zu8z0FCoVMo
         QJ4kfNEi2bhhXVWRGxUbinp1xIAppmxv/V1tclS9qKqbU7nm01uZcDPLEVhou/LroAK2
         UOWjbGGQEMOjZqo+wfltdNn5muJQrFeTJR3mWwbiJd8+cjcr8KOmjUIru/4Pmvq/sgYx
         6IWA==
X-Forwarded-Encrypted: i=1; AJvYcCW2oYnet/wkSYllE0wfWEUKPgFUvpV4YuZia+RtD6YeNgAAIsefHtBja7QuUf9IK6tIvFoe6ygeFumz+JUCy/TM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3krwwsjihlW+NSWqrgISSFDE+557UFxhqWP6nGt+nc1fh35As
	69LPr3ocqyDQ0YyDSZ669TsOOZaEecYSvZPUereQBdrzK8QQKISdlywgrjnJEYax1NJSxyJeShZ
	qeuetiu0EkvVYfTzsXFq+9SgxEOo4azgK728yGaFa
X-Gm-Gg: ASbGncui74ezA4X5c531S7i4HKE0rFiY9FbR2hyuBOrysGsnnVlNvQH8/WWZXUnU9rR
	ltQfaTtdbjZ+opYNH9WLKsCtyePhjZiDdAjJY0Jjvz5GSvsSC7ccyViZ+iAdHrMDUgMVhkUJ+hn
	xHboluE/xtYW2JhYTRDuGRkKfE35NnMvH+6hAv8S4rIVUo/naY/52i171QBcakFMbcfH9H3IxOV
	YieojQ5M9HXIwLf7KLxZEdjWr0Q2Vt5lY9Ghw==
X-Google-Smtp-Source: AGHT+IEXVboywdhHKbB21FrYI19SVE/5eWAE9USxvMw9lAL1b7BTPdyv52TpToqz3CvoLCcmj+yjtDmKNzHRxga+43I=
X-Received: by 2002:a05:600c:3ba3:b0:450:cb25:ead with SMTP id
 5b1f17b1804b1-4587c99bf66mr125825e9.7.1753484061777; Fri, 25 Jul 2025
 15:54:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-2-jiaqiyan@google.com>
 <aHFohmTb9qR_JG1E@linux.dev> <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
 <aHK-DPufhLy5Dtuk@linux.dev> <CACw3F53TYZ1KFv0Yc-GCyOxn7TF3iYjTNSE8bd3nte=KaCN0UQ@mail.gmail.com>
In-Reply-To: <CACw3F53TYZ1KFv0Yc-GCyOxn7TF3iYjTNSE8bd3nte=KaCN0UQ@mail.gmail.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 25 Jul 2025 15:54:10 -0700
X-Gm-Features: Ac12FXyZ0np7ePqY2RtGzxlS12fDizdwLAcMXNFO9IJOKnf3jD-9veylvlP7J20
Message-ID: <CACw3F50Q_G75wf2rBm-P-NkyyO72i1NKqR9se99QrgipfD62yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: VM exit to userspace to handle SEA
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_155424_522903_13FDB209 
X-CRM114-Status: GOOD (  52.66  )
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

On Sat, Jul 19, 2025 at 2:24=E2=80=AFPM Jiaqi Yan <jiaqiyan@google.com> wro=
te:
>
> On Sat, Jul 12, 2025 at 12:57=E2=80=AFPM Oliver Upton <oliver.upton@linux=
.dev> wrote:
> >
> > On Fri, Jul 11, 2025 at 04:59:11PM -0700, Jiaqi Yan wrote:
> > > >  - Add some detail about FEAT_RAS where we may still exit to usersp=
ace
> > > >    for host-controlled memory, as we cannot differentiate between a
> > > >    stage-1 or stage-2 TTW SEA when taken on the descriptor PA
> > >
> > > Ah, IIUC, you are saying even if the FSC code tells fault is on TTW
> > > (esr_fsc_is_secc_ttw or esr_fsc_is_sea_ttw), it can either be guest
> > > stage-1's or stage-2's descriptor PA, and we can tell which from
> > > which.
> > >
> > > However, if ESR_ELx_S1PTW is set, we can tell this is a sub-case of
> > > stage-2 descriptor PA, their usage is for stage-1 PTW but they are
> > > stage-2 memory.
> > >
> > > Is my current understanding right?
> >
> > Yep, that's exactly what I'm getting at. As you note, stage-2 aborts
> > during a stage-1 walk are sufficiently described, but not much else.
>
> Got it, thanks!
>
> >
> > > > +/*
> > > > + * Returns true if the SEA should be handled locally within KVM if=
 the abort is
> > > > + * caused by a kernel memory allocation (e.g. stage-2 table memory=
).
> > > > + */
> > > > +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> > > > +{
> > > > +       /*
> > > > +        * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any extern=
al abort
> > > > +        * taken from a guest EL to EL2 is due to a host-imposed ac=
cess (e.g.
> > > > +        * stage-2 PTW).
> > > > +        */
> > > > +       if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> > > > +               return true;
> > > > +
> > > > +       /* KVM owns the VNCR when the vCPU isn't in a nested contex=
t. */
> > > > +       if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> > > > +               return true;
> > > > +
> > > > +       /*
> > > > +        * Determining if an external abort during a table walk hap=
pened at
> > > > +        * stage-2 is only possible with S1PTW is set. Otherwise, s=
ince KVM
> > > > +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. acces=
sing the PA
> > > > +        * of the stage-1 descriptor) can reach here and are report=
ed with a
> > > > +        * TTW ESR value.
> > > > +        */
> > > > +       return esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW);
> > >
> > > Should we include esr_fsc_is_secc_ttw? like
> > >   (esr_fsc_is_sea_ttw(esr) || esr_fsc_is_secc_ttw(esr)) && (esr & ESR=
_ELx_S1PTW)
> >
> > Parity / ECC errors are not permitted if FEAT_RAS is implemented (which
> > is tested for up front).
>
> Ah, thanks for pointing this out.
>
> >
> > > > +}
> > > > +
> > > >  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > > >  {
> > > > +       u64 esr =3D kvm_vcpu_get_esr(vcpu);
> > > > +       struct kvm_run *run =3D vcpu->run;
> > > > +       struct kvm *kvm =3D vcpu->kvm;
> > > > +       u64 esr_mask =3D ESR_ELx_EC_MASK  |
> > > > +                      ESR_ELx_FnV      |
> > > > +                      ESR_ELx_EA       |
> > > > +                      ESR_ELx_CM       |
> > > > +                      ESR_ELx_WNR      |
> > > > +                      ESR_ELx_FSC;
> > >
> > > Do you (and why) exclude ESR_ELx_IL on purpose?
> >
> > Unintended :)
>
> Will add into my patch.
>
> >
> > > BTW, if my previous statement about TTW SEA is correct, then I also
> > > understand why we need to explicitly exclude ESR_ELx_S1PTW.
> >
> > Right, we shouldn't be exposing genuine stage-2 external aborts to user=
space.
> >
> > > > +       u64 ipa;
> > > > +
> > > > +
> > > >         /*
> > > >          * Give APEI the opportunity to claim the abort before hand=
ling it
> > > >          * within KVM. apei_claim_sea() expects to be called with I=
RQs
> > > > @@ -1824,7 +1864,32 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vc=
pu)
> > > >         if (apei_claim_sea(NULL) =3D=3D 0)
> > >
> > > I assume kvm should still lockdep_assert_irqs_enabled(), right? That
> > > is, a WARN_ON_ONCE is still useful in case?
> >
> > Ah, this is diffed against my VNCR prefix which has this context. Yes, =
I
> > want to preserve the lockdep assertion.
>
> Thanks for sharing the patch! Should I wait for you to send and queue
> to kvmarm/next and rebase my v3 to it? Or should I insert it into my
> v3 patch series with you as the commit author, and Signed-off-by you?

Friendly ping for this question, my v3 is ready but want to confirm
the best option here.

Recently we found even the newer ARM64 platforms used by our org has
to rely on KVM to more gracefully handle SEA (lacking support from
APEI), so we would really want to work with upstream to lock down the
proposed approach/UAPI asap.

Thanks!

>
> BTW, while I am working on v3, I think it is probably better to
> decouple the current patchset into two. The first one for
> KVM_EXIT_ARM_SEA, and the second one for injecting (D|I)ABT with
> user-supplemented esr. This way may help KVM_EXIT_ARM_SEA, the more
> important feature, get reviewed and accepted sooner. I will send out a
> separate patchset for enhancing the guest SEA injection.
>
> >
> >
> > From eb63dbf07b3d1f42b059f5c94abd147d195299c8 Mon Sep 17 00:00:00 2001
> > From: Oliver Upton <oliver.upton@linux.dev>
> > Date: Thu, 10 Jul 2025 17:14:51 -0700
> > Subject: [PATCH] KVM: arm64: nv: Handle SEAs due to VNCR redirection
> >
> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> > ---
> >  arch/arm64/include/asm/kvm_mmu.h |  1 +
> >  arch/arm64/include/asm/kvm_ras.h | 25 -------------------------
> >  arch/arm64/kvm/mmu.c             | 30 ++++++++++++++++++------------
> >  arch/arm64/kvm/nested.c          |  3 +++
> >  4 files changed, 22 insertions(+), 37 deletions(-)
> >  delete mode 100644 arch/arm64/include/asm/kvm_ras.h
> >
> > diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/=
kvm_mmu.h
> > index ae563ebd6aee..e4069f2ce642 100644
> > --- a/arch/arm64/include/asm/kvm_mmu.h
> > +++ b/arch/arm64/include/asm/kvm_mmu.h
> > @@ -180,6 +180,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu);
> >  int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
> >                           phys_addr_t pa, unsigned long size, bool writ=
able);
> >
> > +int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
> >  int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
> >
> >  phys_addr_t kvm_mmu_get_httbr(void);
> > diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/=
kvm_ras.h
> > deleted file mode 100644
> > index 9398ade632aa..000000000000
> > --- a/arch/arm64/include/asm/kvm_ras.h
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -/* Copyright (C) 2018 - Arm Ltd */
> > -
> > -#ifndef __ARM64_KVM_RAS_H__
> > -#define __ARM64_KVM_RAS_H__
> > -
> > -#include <linux/acpi.h>
> > -#include <linux/errno.h>
> > -#include <linux/types.h>
> > -
> > -#include <asm/acpi.h>
> > -
> > -/*
> > - * Was this synchronous external abort a RAS notification?
> > - * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
> > - */
> > -static inline int kvm_handle_guest_sea(void)
> > -{
> > -       /* apei_claim_sea(NULL) expects to mask interrupts itself */
> > -       lockdep_assert_irqs_enabled();
> > -
> > -       return apei_claim_sea(NULL);
> > -}
> > -
> > -#endif /* __ARM64_KVM_RAS_H__ */
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1c78864767c5..6934f4acdc45 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -4,19 +4,20 @@
> >   * Author: Christoffer Dall <c.dall@virtualopensystems.com>
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/mman.h>
> >  #include <linux/kvm_host.h>
> >  #include <linux/io.h>
> >  #include <linux/hugetlb.h>
> >  #include <linux/sched/signal.h>
> >  #include <trace/events/kvm.h>
> > +#include <asm/acpi.h>
> >  #include <asm/pgalloc.h>
> >  #include <asm/cacheflush.h>
> >  #include <asm/kvm_arm.h>
> >  #include <asm/kvm_mmu.h>
> >  #include <asm/kvm_pgtable.h>
> >  #include <asm/kvm_pkvm.h>
> > -#include <asm/kvm_ras.h>
> >  #include <asm/kvm_asm.h>
> >  #include <asm/kvm_emulate.h>
> >  #include <asm/virt.h>
> > @@ -1811,6 +1812,20 @@ static void handle_access_fault(struct kvm_vcpu =
*vcpu, phys_addr_t fault_ipa)
> >         read_unlock(&vcpu->kvm->mmu_lock);
> >  }
> >
> > +int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > +{
> > +       /*
> > +        * Give APEI the opportunity to claim the abort before handling=
 it
> > +        * within KVM. apei_claim_sea() expects to be called with IRQs
> > +        * enabled.
> > +        */
> > +       lockdep_assert_irqs_enabled();
> > +       if (apei_claim_sea(NULL) =3D=3D 0)
> > +               return 1;
> > +
> > +       return kvm_inject_serror(vcpu);
> > +}
> > +
> >  /**
> >   * kvm_handle_guest_abort - handles all 2nd stage aborts
> >   * @vcpu:      the VCPU pointer
> > @@ -1834,17 +1849,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu=
)
> >         gfn_t gfn;
> >         int ret, idx;
> >
> > -       /* Synchronous External Abort? */
> > -       if (kvm_vcpu_abt_issea(vcpu)) {
> > -               /*
> > -                * For RAS the host kernel may handle this abort.
> > -                * There is no need to pass the error into the guest.
> > -                */
> > -               if (kvm_handle_guest_sea())
> > -                       return kvm_inject_serror(vcpu);
> > -
> > -               return 1;
> > -       }
> > +       if (kvm_vcpu_abt_issea(vcpu))
> > +               return kvm_handle_guest_sea(vcpu);
> >
> >         esr =3D kvm_vcpu_get_esr(vcpu);
> >
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 096747a61bf6..38b0e3a9a6db 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -1289,6 +1289,9 @@ int kvm_handle_vncr_abort(struct kvm_vcpu *vcpu)
> >
> >         BUG_ON(!(esr & ESR_ELx_VNCR_SHIFT));
> >
> > +       if (kvm_vcpu_abt_issea(vcpu))
> > +               return kvm_handle_guest_sea(vcpu);
> > +
> >         if (esr_fsc_is_permission_fault(esr)) {
> >                 inject_vncr_perm(vcpu);
> >         } else if (esr_fsc_is_translation_fault(esr)) {
> > --
> > 2.39.5
> >

