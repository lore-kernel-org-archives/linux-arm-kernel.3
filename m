Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71787D78318
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT65BursDv9acFz36h76HkD1KU1Ehu2gLor/dQ9bFwQ=; b=Vlh3fKVIOf9Idi+tXkJJDOUSQd
	SWV95AlT/kl1yv030S1uR1dV4dZRRERM4DO6tTXTzj++IaWI0RFEG2RQeMbE+cVs69jQ3d2BAolBu
	QILIdKnSCJ8+UFsZhiSEoWM8SkAsOXbH958wMGCs05zt2TmI3fUYSc9DbJfRMzj2y3GozFI5HgfJC
	AXBNA2xBHBlFg9wT6X/sEWrJlTqx1mPbO6zJ0Mq1CyxcO3s7X0UmmkonaejexTKuR3Na3JwhHzL86
	XkGKoo2djeXGO0m+GmP8Heqn3fUsoWuxyXiCSPweP20hCtKuJp8yeOfwMEbZWNtwgaxHKW8Qz5zAL
	l48Dr+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI61N-000000069pE-0EAT;
	Mon, 02 Dec 2024 12:59:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI60N-000000069Yw-1k27
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:58:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4349ea54db7so219745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 04:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733144301; x=1733749101; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oT65BursDv9acFz36h76HkD1KU1Ehu2gLor/dQ9bFwQ=;
        b=GcEFMfnZHwCKwnlbuzjEODH1qbsMptsuazV4XeA7iBh8cw3zzh65vNI9WGpDkPLvBC
         QXAA9ANCgtyTuxYKLCcVZY2TS8Jmx4E+5xb81ERm8fDpvvNlsXTzYlWMdmFBpB3njB7E
         uRA3YoMk0k7GKLlSwy8SiB9Lkijz123kN3RUtT1m96PKftzpmLf54WrpDQhlcwv/3aUk
         3kGtTToDmnaqfc0uLbR8yb+KOFWvBhR0QLDZUDv/2aoWdEAox4wmotiLaDCIb+nlWizS
         DrVnaJF2lLZY4hkGp+xRSh4AizYSFYQoDTwwOQ5ahHpvXpSaEBwKmGTNfD5fdxidVBB+
         GYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733144301; x=1733749101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oT65BursDv9acFz36h76HkD1KU1Ehu2gLor/dQ9bFwQ=;
        b=Af7dMeLtM1g9830EY00KaJ4oUM3JFqPDVqETuHkkYofnpRvgIiEzstT4yzRsv4Zks2
         Jv3eNlqFGVg6uap2VTN9nBD2QMfNUE7tIlNmMS/gB63HHyJ+FXDQ9mQ3j8zI4inKHTCC
         77R5uGu0iNq6KfRpQDX1mkxvaYKgcBy+ktTH8kYItGYQNQc5QUmOPP6NMD0QNHlqSsaU
         1NKBTmt2vY//JNCDcLtlXgf2oaPcH8lo9kPd8KJi4jvpiAkFFHilZbm7IG9EcAlZ2xYZ
         0y5MObWkt8/Bhl2nkY4XrgLfwzI4GuYZrUZ/G9TC00a0EFXZAucyEvgNRIdOKGB37CY2
         kExg==
X-Forwarded-Encrypted: i=1; AJvYcCXHrZN5SB52RaR+fgHwgLfRPp/5Bxw/AjoSrvIy75hBR2cNjRxeWI2Y67/8tE4Zhpw6s71tNGDoZMsHvK7Jr9Z0@lists.infradead.org
X-Gm-Message-State: AOJu0YzGyvCT0piyZSG8SfopG6Pez3hg6pSlXrus7t5Fc7vshm+eqxoA
	vqY5+hI886ZXSARhUGy89d5xcvZGtNYkQ7W9IvilDLWPbLZAgxOJPB8zBI8eQhv8xAPT0uOmlBt
	NuRvGe7NQa3zfRlQOxQiVLkhXiZAgQW4TVIIbQW50dy0VLblIZ6Xq
X-Gm-Gg: ASbGncvhnhtTZNspesrOB2mY5e9xXWw5bo3rzpBtE3YTyCcKAYSKwG8EvuNJ67Zji89
	e0KOXJ9CXECBeOnxXE8lvipfn6Rs1xg==
X-Google-Smtp-Source: AGHT+IHJJFz6JqADai1NvA0AUirrevbk29ApkBCofFsaGh6xzxfVcudD1jFv6Y77lhY2GY8LObLArRWqB58KKkJnw78=
X-Received: by 2002:a05:600c:1d0e:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-434b04bfb20mr4739105e9.2.1733144301487; Mon, 02 Dec 2024
 04:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com> <20241128123515.1709777-15-tabba@google.com>
 <864j3nv9tk.wl-maz@kernel.org> <CA+EHjTyXj6NhUcxTfER=zPz3VOtd+HgqpfmyfR88cVyiXoxqwA@mail.gmail.com>
In-Reply-To: <CA+EHjTyXj6NhUcxTfER=zPz3VOtd+HgqpfmyfR88cVyiXoxqwA@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 2 Dec 2024 12:57:44 +0000
Message-ID: <CA+EHjTysFaaxGBo212e8kSHi_VkpXx6N6ddxwB0UGC6bSoK0gA@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] KVM: arm64: Convert the SVE guest vcpu flag to a
 vm flag
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_045823_454579_CC6727C3 
X-CRM114-Status: GOOD (  38.82  )
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

Hi Marc,

On Sun, 1 Dec 2024 at 16:01, Fuad Tabba <tabba@google.com> wrote:
>
> Hi Marc,
>
>
> On Sun, 1 Dec 2024 at 12:58, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Thu, 28 Nov 2024 12:35:14 +0000,
> > Fuad Tabba <tabba@google.com> wrote:
> > >
> > > The vcpu flag GUEST_HAS_SVE is per-vcpu, but it is based on what
> > > is now a per-vm feature. Make the flag per-vm.
> > >
> > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > ---
> > >  arch/arm64/include/asm/kvm_emulate.h    |  6 +++---
> > >  arch/arm64/include/asm/kvm_host.h       | 10 ++++++----
> > >  arch/arm64/kvm/hyp/include/hyp/switch.h |  2 +-
> > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  2 +-
> > >  arch/arm64/kvm/hyp/nvhe/pkvm.c          | 11 +++++++----
> > >  arch/arm64/kvm/hyp/nvhe/switch.c        |  8 ++++----
> > >  arch/arm64/kvm/hyp/vhe/switch.c         |  2 +-
> > >  arch/arm64/kvm/reset.c                  |  2 +-
> > >  8 files changed, 24 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > > index 406e99a452bf..ae6d0dc0e4ff 100644
> > > --- a/arch/arm64/include/asm/kvm_emulate.h
> > > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > > @@ -620,7 +620,7 @@ static __always_inline void kvm_write_cptr_el2(u64 val)
> > >  }
> > >
> > >  /* Resets the value of cptr_el2 when returning to the host. */
> > > -static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> > > +static __always_inline void kvm_reset_cptr_el2(struct kvm *kvm)
> >
> > I'd rather you avoid the resulting churn:
> >
> > static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> > {
> >         struct kvm *kvm = kern_hyp_va(vcpu->kvm);
> >         [...]
> >
> > which does the trick at zero cost. It is also more logical to keep the
> > vcpu as a parameter, as the per-VM-ness is only an implementation
> > detail.
>
> The reason for the churn (here and below for vcpu_has_sve()), which in
> hindsight I should have mentioned in the commit message or as a note,
> is that this code is called by the host kernel (e.g., in reset.c), and
> by the hypervisor). For nvhe, we need kern_hyp_va(), but not for the
> host. Should I gate the va conversion with is_hyp_nvhe()?

I spoke too soon. Your suggestion results in less churn, and of
course, solves the issue I had with kern_hyp_va.

I did have to convert kvm_reset_cptr_el2() into a macro, because it
now needs kern_hyp_va(), defined in kvm_mmu.h, which in turn includes
kvm_emulate.h. But since it's __always_inline, it shouldn't make any
difference in practice.

If this conversion to a macro is alright by you, I'll respin this.

Thanks again, and sorry for the noise.
/fuad

>
> > >  {
> > >       u64 val;
> > >
> > > @@ -631,14 +631,14 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> > >       } else if (has_hvhe()) {
> > >               val = CPACR_ELx_FPEN;
> > >
> > > -             if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
> > > +             if (!kvm_has_sve(kvm) || !guest_owns_fp_regs())
> > >                       val |= CPACR_ELx_ZEN;
> > >               if (cpus_have_final_cap(ARM64_SME))
> > >                       val |= CPACR_ELx_SMEN;
> > >       } else {
> > >               val = CPTR_NVHE_EL2_RES1;
> > >
> > > -             if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
> > > +             if (kvm_has_sve(kvm) && guest_owns_fp_regs())
> > >                       val |= CPTR_EL2_TZ;
> > >               if (!cpus_have_final_cap(ARM64_SME))
> > >                       val |= CPTR_EL2_TSM;
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index 680ecef1d7aa..c5c80c789ad0 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -331,6 +331,8 @@ struct kvm_arch {
> > >  #define KVM_ARCH_FLAG_ID_REGS_INITIALIZED            7
> > >       /* Fine-Grained UNDEF initialised */
> > >  #define KVM_ARCH_FLAG_FGU_INITIALIZED                        8
> > > +     /* SVE exposed to guest */
> > > +#define KVM_ARCH_FLAG_GUEST_HAS_SVE                  9
> > >       unsigned long flags;
> > >
> > >       /* VM-wide vCPU feature set */
> > > @@ -862,8 +864,6 @@ struct kvm_vcpu_arch {
> > >  #define vcpu_set_flag(v, ...)        __vcpu_set_flag((v), __VA_ARGS__)
> > >  #define vcpu_clear_flag(v, ...)      __vcpu_clear_flag((v), __VA_ARGS__)
> > >
> > > -/* SVE exposed to guest */
> > > -#define GUEST_HAS_SVE                __vcpu_single_flag(cflags, BIT(0))
> > >  /* SVE config completed */
> > >  #define VCPU_SVE_FINALIZED   __vcpu_single_flag(cflags, BIT(1))
> > >  /* KVM_ARM_VCPU_INIT completed */
> > > @@ -956,8 +956,10 @@ struct kvm_vcpu_arch {
> > >                                KVM_GUESTDBG_USE_HW | \
> > >                                KVM_GUESTDBG_SINGLESTEP)
> > >
> > > -#define vcpu_has_sve(vcpu) (system_supports_sve() &&                 \
> > > -                         vcpu_get_flag(vcpu, GUEST_HAS_SVE))
> > > +#define kvm_has_sve(kvm)     \
> > > +     test_bit(KVM_ARCH_FLAG_GUEST_HAS_SVE, &(kvm)->arch.flags)
> > > +#define vcpu_has_sve(vcpu)   \
> > > +     kvm_has_sve((vcpu)->kvm)
> >
> > Two things:
> >
> > - it is definitely worth keeping the system_supports_sve() helper, so
> >   that we avoid checking flags for nothing
>
> Ack
>
> > - Since you preserve the vcpu_has_sve(), how about writing it as:
> >
> > #ifdef __KVM_NVHE_HYPERVISOR__
> > #define vcpu_has_sve(v)         kvm_has_sve(kern_hyp_va((v)->kvm))
> > #else
> > #define vcpu_has_sve(v)         kvm_has_sve((v)->kvm)
> > #endif
> >
> >   which will avoid the churn in this patch, and makes it hard to get
> >   it wrong?
>
> Same as I mentioned above. This macro is even used in more places by
> the host kernel.
>
> Thanks,
> /fuad
>
> > Thanks,
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

