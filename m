Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5919FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 17:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jD4bRF7JSc8ETHs85vhGq6oOkoVBviX9M2RC+G/dJSY=; b=itnAU9hiSV95w+y3UQk67lLXRQ
	GR3uMTiVVlzmLubXq5+axoHVZBeRVy1n1ILSagHS2cozSfZfxinR+W7EtTMr56TFQrlulRMKqE0VP
	0y2VL1buiTHJdT1fxL9OtkSw62Sq3YCyrsfvvu0Kl1sPhL5vxltA5a8lgn5oMw/XQ4/eSn2/Pj5m2
	gWRioQNqhZQUkaE3b3XTthfTNyiTqtJQ+vLv6ZRS5Chz+t1d1pBZaYf7DllvH5I1bLrW7JlhY7dZb
	h03SY5hFcJ/2R/bR9WOmGo1RpipW/WbIAc7YfjJQQyt2HBcU7Y5+AUok5zFZnC6IO9rfV7RUCf7Ep
	wNqtHjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3ff-00000001Pxw-1tzM;
	Fri, 30 May 2025 17:37:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3Xp-00000001P9h-3VDE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 17:29:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso4165e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748626163; x=1749230963; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD4bRF7JSc8ETHs85vhGq6oOkoVBviX9M2RC+G/dJSY=;
        b=BXD39qFUF8b5EYWzFcBXXtXOQhtzDFdT3oXjWseFpBMkLtPBIw5FALF8OismA2yhkU
         ia8LAkh66QSyvMBzpNu2MdoWdVkJ71KaVlHgJUHgrr3iUc6I8LU31ssRJBNDdsCPWixp
         YSACU+/lR0apSZCj5INYSXT0RrW9lFmMEHfHcO18WNXiAYpULf4w9AStWxWli7s7vFdG
         B2c6/uwlXzUXVSFoUJ5Or8JUaCHt6i3DUcj8PIhnCaZn4TFgQy1Q0lX3cs9Nnq8koPrC
         vZaiX5Paz54FzKD0PGfct7Tmu1pgqkNAvtMh1Wh5PrS7BNAmBe+z3RepZKzMkoh8JKHK
         xFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626163; x=1749230963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD4bRF7JSc8ETHs85vhGq6oOkoVBviX9M2RC+G/dJSY=;
        b=B+zTh2Lv5DTn4P715Y/U3mGFJ6oZRCc0uFM8ZNCukdQh3r4XLB8c5awSqmwPyMqzy/
         esV73J8M+w0CDBCv1JKQa/3kQZeOdspfe2eJ/tQWOOQeTidQjIPzbrA5PjEypK6/nejC
         IJ7BjDKKN4233p6I1xkpNrSdrHEqhEpSmn/DMug2N3EF2/JrX0C11UGKIpupGIbg1HWu
         o6GV5Fu9Eo3VCZnut+cmI4sRmOzo0EcOC9pP7RgpRExhJmRkUYokT80+wF0aTHmpQSa5
         SuvKSJT2YaEsJXwDiHCd7MjfXGMlLBLYJxxIThoAGh3spi0DOMwHVKxNiYjxOX3GCj3B
         sbrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeZTRiEn1uOKgNDq+6NaqLMUtYexq2dfLeyImKIdVA6WKNNf6hvTjahPZ6Bav/zFeemZMl+3fcfdILLkfW4MRh@lists.infradead.org
X-Gm-Message-State: AOJu0YzDWsLeoREoRuYGsm3V9zgBIbH3/RUS+JIh1wVUz3rLY1xiNVVi
	8gtVv2ZNPq8mqzag6hcYWqVzZ7W4xd/paH2q6qi1uSlPeso2ixXOZY8yJofcxd9FSy62Ed7y0BP
	4Juz9UCNEw4T1w9pNNL8PjvJFycpvMw4IHOTwfNfe
X-Gm-Gg: ASbGncuUjt6VNpJf35aCfvgz3IlmD+UzgoKl34HCPLFcq8GAp/Lj2gwyMO0raPeThsK
	qaBLhe52afvGZth47nLMOpeR1kdwJ6Sd35aXGSaFwQxXOGnUaVD4AhIQBhrBVG8a4/IlH1v++km
	xCmFazHYs2uoM5eduv44osTV3y+qtP+z3qKR0G+3lPzdSTLV8D8YBOyIuVJar1qFPkuBjEl8El
X-Google-Smtp-Source: AGHT+IEDaoeQYzknKNPhwfM50BqmxavX54ASYqaldUiSdZ412v1zOF3fm3U++s1S199tI0GtncqtABqEC977/b57C6Y=
X-Received: by 2002:a05:600c:a30d:b0:441:aaa8:312e with SMTP id
 5b1f17b1804b1-450d6e173b3mr1383855e9.6.1748626163057; Fri, 30 May 2025
 10:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com> <20250505161412.1926643-2-jiaqiyan@google.com>
 <861psofupa.wl-maz@kernel.org>
In-Reply-To: <861psofupa.wl-maz@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 30 May 2025 10:29:11 -0700
X-Gm-Features: AX0GCFv8WkutK84BMegz1ycX6ji81qpzLiG-WwpnuohJIL9_OAKK2H5fYoKECrk
Message-ID: <CACw3F51hmM1WU81=Vev-JLoknNxVut=K4--+2dJcNFSb+bNOQA@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] KVM: arm64: VM exit to userspace to handle SEA
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_102925_901369_259C5B65 
X-CRM114-Status: GOOD (  53.90  )
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

Thanks for the review, Marc! Sorry for the late reply, some of your
questions took me some time to learn and think.

On Fri, May 16, 2025 at 8:20=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Mon, 05 May 2025 17:14:07 +0100,
> Jiaqi Yan <jiaqiyan@google.com> wrote:
> >
> > When APEI fails to handle a stage2 abort that is synchronous external
> > abort (SEA),
>
> nit: "a stage-2 synchronous external abort".

Will fix in V2.

>
> > today KVM directly injects an async SError to the VCPU
> > then resumes it, which usually results in unpleasant guest kernel panic=
.
>
> Which is a perfectly legal thing to do, and not a violation of the
> architecture.

Absolutely, this commit is just an alternative (and hopefully better
option) to directly injecting SError.

>
> > One major situation of guest SEA is when vCPU consumes recoverable
> > uncorrected memory error (UER). Although SError and guest kernel panic
> > effectively stops the propagation of corrupted memory, there is still
> > room to recover from memory UER in a more graceful manner.
>
> "there is room to recover from an UER..."

Will reword in V2.

> >
> > Alternatively KVM can redirect the synchronous SEA event to VMM to
> > - Reduce blast radius if possible. VMM can inject a SEA to VCPU via
> >   KVM's existing KVM_SET_VCPU_EVENTS API. If the memory poison
> >   consumption or fault is not from guest kernel, blast radius can be
> >   limited to the triggering thread in guest userspace, so VM can
> >   keep running.
> > - VMM can protect from future memory poison consumption by unmapping
> >   the page from stage-2 with KVM userfault [1]. VMM can also
> >   track SEA events that VM customer cares about, restart VM when
> >   certain number of distinct poison events happened, provide
> >   observability to customers [2].
> >
> > Introduce following userspace-visible features to make VMM handle SEA:
> > - KVM_CAP_ARM_SEA_TO_USER. As the alternative fallback behavior
> >   when host APEI fails to claim a SEA, userspace can opt in this new
> >   capability to let KVM exit to userspace during synchronous abort.
> > - KVM_EXIT_ARM_SEA. A new exit reason is introduced for this, and
> >   KVM fills kvm_run.arm_sea with as much as possible information about
> >   the SEA, including
> >   - ESR_EL2.
> >   - If faulting guest virtual and physical addresses are available.
> >   - Faulting guest virtual address if available.
> >   - Faulting guest physical address if available.
> >
> > [1] https://lpc.events/event/18/contributions/1757/attachments/1442/307=
3/LPC_%20KVM%20Userfault.pdf
> > [2] https://cloud.google.com/solutions/sap/docs/manage-host-errors
>
> I really don't think we need these link in a commit message (they are
> likely to vanish, specially the second one). Either the information is
> pertinent and it needs to be added to the commit message, or removed
> altogether. I don't think the SAP thing makes much sense as is.
>

Will reword in V2 with links removed.

> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h | 12 +++++++
> >  arch/arm64/include/asm/kvm_host.h    |  8 +++++
> >  arch/arm64/include/asm/kvm_ras.h     | 21 ++++-------
> >  arch/arm64/kvm/Makefile              |  3 +-
> >  arch/arm64/kvm/arm.c                 |  5 +++
> >  arch/arm64/kvm/kvm_ras.c             | 54 ++++++++++++++++++++++++++++
> >  arch/arm64/kvm/mmu.c                 | 12 ++-----
> >  include/uapi/linux/kvm.h             | 11 ++++++
> >  8 files changed, 101 insertions(+), 25 deletions(-)
> >  create mode 100644 arch/arm64/kvm/kvm_ras.c
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/=
asm/kvm_emulate.h
> > index bd020fc28aa9c..a9de30478a088 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -429,6 +429,18 @@ static __always_inline bool kvm_vcpu_abt_issea(con=
st struct kvm_vcpu *vcpu)
> >       }
> >  }
> >
> > +/* Return true if FAR holds valid faulting guest virtual address. */
> > +static inline bool kvm_vcpu_sea_far_valid(const struct kvm_vcpu *vcpu)
> > +{
> > +     return !(kvm_vcpu_get_esr(vcpu) & ESR_ELx_FnV);
> > +}
> > +
> > +/* Return true if HPFAR_EL2 holds valid faulting guest physical addres=
s. */
> > +static inline bool kvm_vcpu_sea_ipa_valid(const struct kvm_vcpu *vcpu)
> > +{
> > +     return vcpu->arch.fault.hpfar_el2 & HPFAR_EL2_NS;
> > +}
> > +
> >  static __always_inline int kvm_vcpu_sys_get_rt(struct kvm_vcpu *vcpu)
> >  {
> >       u64 esr =3D kvm_vcpu_get_esr(vcpu);
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm=
/kvm_host.h
> > index 73b7762b0e7d1..e0129f9799f80 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -342,6 +342,14 @@ struct kvm_arch {
> >  #define KVM_ARCH_FLAG_GUEST_HAS_SVE                  9
> >       /* MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are writable from userspace=
 */
> >  #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS           10
> > +     /*
> > +      * When APEI failed to claim stage-2 synchronous external abort
> > +      * (SEA) return to userspace with fault information. Userspace
> > +      * can opt in this feature if KVM_CAP_ARM_SEA_TO_USER is
> > +      * supported. Userspace is encouraged to handle this VM exit
> > +      * by injecting a SEA to VCPU before resume the VCPU.
> > +      */
> > +#define KVM_ARCH_FLAG_RETURN_SEA_TO_USER             11
> >       unsigned long flags;
> >
> >       /* VM-wide vCPU feature set */
> > diff --git a/arch/arm64/include/asm/kvm_ras.h b/arch/arm64/include/asm/=
kvm_ras.h
> > index 9398ade632aaf..a2fd91af8f97e 100644
> > --- a/arch/arm64/include/asm/kvm_ras.h
> > +++ b/arch/arm64/include/asm/kvm_ras.h
> > @@ -4,22 +4,15 @@
> >  #ifndef __ARM64_KVM_RAS_H__
> >  #define __ARM64_KVM_RAS_H__
> >
> > -#include <linux/acpi.h>
> > -#include <linux/errno.h>
> > -#include <linux/types.h>
> > -
> > -#include <asm/acpi.h>
> > +#include <linux/kvm_host.h>
> >
> >  /*
> > - * Was this synchronous external abort a RAS notification?
> > - * Returns '0' for errors handled by some RAS subsystem, or -ENOENT.
> > + * Handle stage2 synchronous external abort (SEA) in the following ord=
er:
> > + * 1. Delegate to APEI/GHES and if they can claim SEA, resume guest.
> > + * 2. If userspace opt-ed in KVM_CAP_ARM_SEA_TO_USER, exit to userspac=
e
> > + *    with details about the SEA.
> > + * 3. Otherwise, inject async SError into the VCPU and resume guest.
> >   */
> > -static inline int kvm_handle_guest_sea(void)
> > -{
> > -     /* apei_claim_sea(NULL) expects to mask interrupts itself */
> > -     lockdep_assert_irqs_enabled();
> > -
> > -     return apei_claim_sea(NULL);
> > -}
> > +int kvm_handle_guest_sea(struct kvm_vcpu *vcpu);
> >
> >  #endif /* __ARM64_KVM_RAS_H__ */
> > diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> > index 209bc76263f10..785d568411e88 100644
> > --- a/arch/arm64/kvm/Makefile
> > +++ b/arch/arm64/kvm/Makefile
> > @@ -23,7 +23,8 @@ kvm-y +=3D arm.o mmu.o mmio.o psci.o hypercalls.o pvt=
ime.o \
> >        vgic/vgic-v3.o vgic/vgic-v4.o \
> >        vgic/vgic-mmio.o vgic/vgic-mmio-v2.o \
> >        vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
> > -      vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o
> > +      vgic/vgic-its.o vgic/vgic-debug.o vgic/vgic-v3-nested.o \
> > +      kvm_ras.o
> >
> >  kvm-$(CONFIG_HW_PERF_EVENTS)  +=3D pmu-emul.o pmu.o
> >  kvm-$(CONFIG_ARM64_PTR_AUTH)  +=3D pauth.o
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 19ca57def6292..47544945fba45 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -133,6 +133,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
> >               }
> >               mutex_unlock(&kvm->lock);
> >               break;
> > +     case KVM_CAP_ARM_SEA_TO_USER:
> > +             r =3D 0;
> > +             set_bit(KVM_ARCH_FLAG_RETURN_SEA_TO_USER, &kvm->arch.flag=
s);
> > +             break;
> >       default:
> >               break;
> >       }
> > @@ -322,6 +326,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
ong ext)
> >       case KVM_CAP_IRQFD_RESAMPLE:
> >       case KVM_CAP_COUNTER_OFFSET:
> >       case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
> > +     case KVM_CAP_ARM_SEA_TO_USER:
> >               r =3D 1;
> >               break;
> >       case KVM_CAP_SET_GUEST_DEBUG2:
> > diff --git a/arch/arm64/kvm/kvm_ras.c b/arch/arm64/kvm/kvm_ras.c
> > new file mode 100644
> > index 0000000000000..83f2731c95d77
> > --- /dev/null
> > +++ b/arch/arm64/kvm/kvm_ras.c
>
> I don't think we need a new file for so little code. Please leave it
> with the MMU code for now.

Agreed, will do in V2.


>
> > @@ -0,0 +1,54 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/types.h>
> > +#include <asm/acpi.h>
> > +#include <asm/kvm_emulate.h>
> > +#include <asm/kvm_ras.h>
> > +#include <asm/system_misc.h>
> > +
> > +/*
> > + * Was this synchronous external abort a RAS notification?
> > + * Returns 0 for errors handled by some RAS subsystem, or -ENOENT.
> > + */
> > +static int kvm_delegate_guest_sea(void)
> > +{
> > +     /* apei_claim_sea(NULL) expects to mask interrupts itself. */
> > +     lockdep_assert_irqs_enabled();
> > +     return apei_claim_sea(NULL);
> > +}
> > +
> > +int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > +{
> > +     struct kvm_run *run =3D vcpu->run;
> > +     bool exit =3D test_bit(KVM_ARCH_FLAG_RETURN_SEA_TO_USER,
> > +                          &vcpu->kvm->arch.flags);
> > +
> > +     /* For RAS the host kernel may handle this abort. */
> > +     if (kvm_delegate_guest_sea() =3D=3D 0)
> > +             return 1;
> > +
> > +     if (!exit) {
>
> Move the condition here, since nothing else evaluates "exit".

Will do in V2.

>
> > +             /* Fallback behavior prior to KVM_EXIT_ARM_SEA. */
> > +             kvm_inject_vabt(vcpu);
> > +             return 1;
> > +     }
> > +
> > +     run->exit_reason =3D KVM_EXIT_ARM_SEA;
> > +     run->arm_sea.esr =3D kvm_vcpu_get_esr(vcpu);
>
> Do we *always* want to report this without any sanitisation? ESR_EL2
> contains a lot of things that we may want to hide.

You are right, we should sanitize ESR_EL2. The general rule I followed
is to keep only the SEA-relevent bits that are useful for userspace,
and relevant to guest memory. Below is a rundown of the SEA bits.

Hide the following bits:
- HDBSSF: hardware dirty state is not guest memory.
- TnD, TagAccess, AssuredOnly, Overlay, DirtyBit: they are for
permission faults, not SEA
- GCS: not guest memory.
- Xs: it is for translation/access flag/permission fault.
- Summing up the bits above, ISS2 is entirely hidden.
- ISV and ISS[23:14]: Situation for ISV is a little complicated. ISV
is 1 mostly for Translation fault, Access flag fault, or Permission
fault. When FEAT_RAS is implemented ISV=3D0; when FEAT_RAS is not
implemented, ISV may (implementation defined) be 1 for S2PTW, which is
not worthy to return to userspace (see my reply below about S1PTW and
S2PTW).
- VNCR: VNCR_EL2 is not guest memory.

Report the following bits because they tell userspace useful info
- EC: tell if abort on instruction or data.
- IL: useful if userspace decides to retire the instruction.
- FSC: tell if abort on translation table walk.
- SET or [12:11]: tell if abort is recoverable, uncontainable, or restartab=
le.
- S1PTW: userspace can tell the guest kernel its stage-1 has a problem.
- FnV: userspace should avoid writing FAR_EL1 if FnV=3D1.
- CM and WnR: make ESR "authentic" in general.

I try to be thorough but please point out anything missing.

>
> For example, what do we do on a SEA generated by a S1PTW? I don't
> think it makes any sense to report it as such, if only because
> userspace knows nothing of stage-2.

For S1PTW=3D1, i.e. the memory used for stage-1 is poisoned or broken, I
think "returning to VMM and letting VMM inject SEA to VM" a better
virtualization (reflect the corresponding bare-metal behavior)
compared to injecting SError.
However if memory allocated to stage-2 is poisoned or broken, which
eventually will cause an exception at EL2 and crash host, returning to
VMM doesn't seem to be beneficial. I can add a check for S2PTW and if
so, just keep the old behavior of injecting SError.

>
> > +     run->arm_sea.flags =3D 0ULL;
> > +     run->arm_sea.gva =3D 0ULL;
> > +     run->arm_sea.gpa =3D 0ULL;
> > +
> > +     if (kvm_vcpu_sea_far_valid(vcpu)) {
> > +             run->arm_sea.flags |=3D KVM_EXIT_ARM_SEA_FLAG_GVA_VALID;
> > +             run->arm_sea.gva =3D kvm_vcpu_get_hfar(vcpu);
> > +     }
>
> Under which circumstances is the guest VA of interest to userspace? I
> can imagine *something*, but it'd be good to document it.

Guest VA/PA are interesting to VMM if VMM wants to emulate SEA by
itself, and write FAR_EL1 + HPFAR_EL1 registers. Will add a comment
around here.

>
> > +
> > +     if (kvm_vcpu_sea_ipa_valid(vcpu)) {
> > +             run->arm_sea.flags |=3D KVM_EXIT_ARM_SEA_FLAG_GPA_VALID;
> > +             run->arm_sea.gpa =3D kvm_vcpu_get_fault_ipa(vcpu);
> > +     }
> > +
> > +     return 0;
> > +}
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 754f2fe0cc673..a605ee56fa150 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1795,16 +1795,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu=
)
> >       int ret, idx;
> >
> >       /* Synchronous External Abort? */
> > -     if (kvm_vcpu_abt_issea(vcpu)) {
> > -             /*
> > -              * For RAS the host kernel may handle this abort.
> > -              * There is no need to pass the error into the guest.
> > -              */
> > -             if (kvm_handle_guest_sea())
> > -                     kvm_inject_vabt(vcpu);
> > -
> > -             return 1;
> > -     }
> > +     if (kvm_vcpu_abt_issea(vcpu))
> > +             return kvm_handle_guest_sea(vcpu);
> >
> >       esr =3D kvm_vcpu_get_esr(vcpu);
> >
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index b6ae8ad8934b5..79dc4676ff74b 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -178,6 +178,7 @@ struct kvm_xen_exit {
> >  #define KVM_EXIT_NOTIFY           37
> >  #define KVM_EXIT_LOONGARCH_IOCSR  38
> >  #define KVM_EXIT_MEMORY_FAULT     39
> > +#define KVM_EXIT_ARM_SEA          40
> >
> >  /* For KVM_EXIT_INTERNAL_ERROR */
> >  /* Emulate instruction failed. */
> > @@ -446,6 +447,15 @@ struct kvm_run {
> >                       __u64 gpa;
> >                       __u64 size;
> >               } memory_fault;
> > +             /* KVM_EXIT_ARM_SEA */
> > +             struct {
> > +                     __u64 esr;
> > +#define KVM_EXIT_ARM_SEA_FLAG_GVA_VALID      (1ULL << 0)
> > +#define KVM_EXIT_ARM_SEA_FLAG_GPA_VALID      (1ULL << 1)
> > +                     __u64 flags;
> > +                     __u64 gva;
> > +                     __u64 gpa;
> > +             } arm_sea;
> >               /* Fix the size of the union. */
> >               char padding[256];
> >       };
> > @@ -930,6 +940,7 @@ struct kvm_enable_cap {
> >  #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
> >  #define KVM_CAP_X86_GUEST_MODE 238
> >  #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
> > +#define KVM_CAP_ARM_SEA_TO_USER 240
> >
> >  struct kvm_irq_routing_irqchip {
> >       __u32 irqchip;
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

