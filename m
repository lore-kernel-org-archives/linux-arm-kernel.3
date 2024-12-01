Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD893D49779
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ1CESpB4fm9nTPKw9g3foXLvDoZ3jjWEbaLo3SnRIU=; b=ZKlFg4ee6mdAzCrKyU0YVLAaSU
	MKjxVRjTBmKV5SYIKUVRL7hzKSaqEUOks3vBb2WWwZwD88towghrNA7G7XYCmI2hnbxI/22qNtKbd
	wg5Suo3AHKLZV0/W74XjGEDUQsPWYX7mX+i0v9AoC0nokuXKZGuPL1xPEn+iC5+hdEm3DBK71Zh6F
	uQ2XDsfomL5WSGI4sT5C+sOgljyE9uvoUXyR64OfT2YrZ/UwWYDJP2hubyjJEeVRPDCWGDmrqS1Xu
	y20bUY15TI4zY9nXsQaMAdMabW5NAicKWN/t3YZjIvNCqRcT6BlcSpfzIO3ymEcQNHWcvKugnCCi0
	1Fx6+V2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmYk-000000042O1-3cjO;
	Sun, 01 Dec 2024 16:12:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmOp-000000041Ah-0HGS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:02:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434a9f9a225so176355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733068936; x=1733673736; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ1CESpB4fm9nTPKw9g3foXLvDoZ3jjWEbaLo3SnRIU=;
        b=cLbCOALvrxQIpm0H8/lHoaWRQspAyYXitTMuu57PVd4M3ptGJ69paFFB/7ydOg7+x+
         YtcS8hx2byJ9XSx4jZ1AZR1zY7EUvBggQzg/QaG6BD+pAJyNfOdTdWC7TNsDkLp1swNO
         oIjbow/LxWZhZ0HA5oVLzzSz/Fm9HjB8eyidv93HTPuj+byVJkFePNiiabMz9qEEfWZo
         yqYQHLsx9LkuWi9N0b3h1tow+QCw1Ii5B5a0wdJPur2UJC6VH+wK2eAiwPCo63TVTxtt
         QqIMCEKD/Sx0GkWuVW1qh2Un8tyAmi7UkxFB9yczDbFAlJIhCdyeYFOmS7COa/aSoYfg
         LvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068936; x=1733673736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CZ1CESpB4fm9nTPKw9g3foXLvDoZ3jjWEbaLo3SnRIU=;
        b=KimikHpxVu9n0UhYy6+v3OH8JIFMD8WUoitfd92rOZtKNOaXItpcRu5lsb4BSXGgjU
         Ht3k19/5FDk7arKXObZ4KuzWyCoaBmxPG7JyuwAwi88fZSdTraWPtjqMVeVT/mWJjhg9
         iq/LKPvkA+uS6GJRCR+Ooy6VzksgFLVjUVhnb2WNxl8ZcYRcVm4luvBqeAyJ4svlPxVn
         Z5Ctq3D+ArZOKbH+f2DhgGajOcF1SubCbFCRMRfoPWCuIkfKD0YP0Vwf3QOd4xFbTAoZ
         1jjc12F1bRktHevMnXTtuyPLZsZ69+4qMS2On+OuBO+TV32aSJmd9Ij551JBzzfTsuww
         kdjA==
X-Forwarded-Encrypted: i=1; AJvYcCVimAgvxXGX5c9LrnNObom4+CchU+CjXynddesah9wLRtJY4wVlb4ykdWF+k5HxUsLBqoyO0rcu7a3IMGdCw2hN@lists.infradead.org
X-Gm-Message-State: AOJu0YxnDrSTPm6wL4CQ2zX4k6xAEeZMMIn4Wa25rukngIBbQoAI4vzT
	qmOF4/EDLENaoF3fuNhJ10mnpWSv9DEN2evd2vIkVaqFKa0GYW7Hh9jS7qpXuvUfbIdb3k7HimD
	+hAP0liclNpXUHj5zrqGSrwjmpF7XtoCCgs4Y
X-Gm-Gg: ASbGncsKHBixBPH9bXEcxW8QE1oAJ4v7tng1PXjxZxPMnM0mC14Qg197maH59Aq8oAR
	FHSbn3nzH7RGq+cN3nxXQhu56Gzn9Rw==
X-Google-Smtp-Source: AGHT+IGW5b1DQsiotNdqt/lX2Hk9Xn2EVhD7QZScnNyTLEOFgXrhCuq82/E84CNnzkZNrJkP2V8LMYX3xSz4yxswe1s=
X-Received: by 2002:a7b:cb92:0:b0:434:9e1d:44ef with SMTP id
 5b1f17b1804b1-434b1310e99mr3778495e9.7.1733068936174; Sun, 01 Dec 2024
 08:02:16 -0800 (PST)
MIME-Version: 1.0
References: <20241128123515.1709777-1-tabba@google.com> <20241128123515.1709777-15-tabba@google.com>
 <864j3nv9tk.wl-maz@kernel.org>
In-Reply-To: <864j3nv9tk.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 1 Dec 2024 16:01:39 +0000
Message-ID: <CA+EHjTyXj6NhUcxTfER=zPz3VOtd+HgqpfmyfR88cVyiXoxqwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241201_080219_121329_74B7F9FF 
X-CRM114-Status: GOOD (  32.80  )
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


On Sun, 1 Dec 2024 at 12:58, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 28 Nov 2024 12:35:14 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The vcpu flag GUEST_HAS_SVE is per-vcpu, but it is based on what
> > is now a per-vm feature. Make the flag per-vm.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_emulate.h    |  6 +++---
> >  arch/arm64/include/asm/kvm_host.h       | 10 ++++++----
> >  arch/arm64/kvm/hyp/include/hyp/switch.h |  2 +-
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  2 +-
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c          | 11 +++++++----
> >  arch/arm64/kvm/hyp/nvhe/switch.c        |  8 ++++----
> >  arch/arm64/kvm/hyp/vhe/switch.c         |  2 +-
> >  arch/arm64/kvm/reset.c                  |  2 +-
> >  8 files changed, 24 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index 406e99a452bf..ae6d0dc0e4ff 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -620,7 +620,7 @@ static __always_inline void kvm_write_cptr_el2(u64 val)
> >  }
> >
> >  /* Resets the value of cptr_el2 when returning to the host. */
> > -static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> > +static __always_inline void kvm_reset_cptr_el2(struct kvm *kvm)
>
> I'd rather you avoid the resulting churn:
>
> static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> {
>         struct kvm *kvm = kern_hyp_va(vcpu->kvm);
>         [...]
>
> which does the trick at zero cost. It is also more logical to keep the
> vcpu as a parameter, as the per-VM-ness is only an implementation
> detail.

The reason for the churn (here and below for vcpu_has_sve()), which in
hindsight I should have mentioned in the commit message or as a note,
is that this code is called by the host kernel (e.g., in reset.c), and
by the hypervisor). For nvhe, we need kern_hyp_va(), but not for the
host. Should I gate the va conversion with is_hyp_nvhe()?

> >  {
> >       u64 val;
> >
> > @@ -631,14 +631,14 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> >       } else if (has_hvhe()) {
> >               val = CPACR_ELx_FPEN;
> >
> > -             if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
> > +             if (!kvm_has_sve(kvm) || !guest_owns_fp_regs())
> >                       val |= CPACR_ELx_ZEN;
> >               if (cpus_have_final_cap(ARM64_SME))
> >                       val |= CPACR_ELx_SMEN;
> >       } else {
> >               val = CPTR_NVHE_EL2_RES1;
> >
> > -             if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
> > +             if (kvm_has_sve(kvm) && guest_owns_fp_regs())
> >                       val |= CPTR_EL2_TZ;
> >               if (!cpus_have_final_cap(ARM64_SME))
> >                       val |= CPTR_EL2_TSM;
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 680ecef1d7aa..c5c80c789ad0 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -331,6 +331,8 @@ struct kvm_arch {
> >  #define KVM_ARCH_FLAG_ID_REGS_INITIALIZED            7
> >       /* Fine-Grained UNDEF initialised */
> >  #define KVM_ARCH_FLAG_FGU_INITIALIZED                        8
> > +     /* SVE exposed to guest */
> > +#define KVM_ARCH_FLAG_GUEST_HAS_SVE                  9
> >       unsigned long flags;
> >
> >       /* VM-wide vCPU feature set */
> > @@ -862,8 +864,6 @@ struct kvm_vcpu_arch {
> >  #define vcpu_set_flag(v, ...)        __vcpu_set_flag((v), __VA_ARGS__)
> >  #define vcpu_clear_flag(v, ...)      __vcpu_clear_flag((v), __VA_ARGS__)
> >
> > -/* SVE exposed to guest */
> > -#define GUEST_HAS_SVE                __vcpu_single_flag(cflags, BIT(0))
> >  /* SVE config completed */
> >  #define VCPU_SVE_FINALIZED   __vcpu_single_flag(cflags, BIT(1))
> >  /* KVM_ARM_VCPU_INIT completed */
> > @@ -956,8 +956,10 @@ struct kvm_vcpu_arch {
> >                                KVM_GUESTDBG_USE_HW | \
> >                                KVM_GUESTDBG_SINGLESTEP)
> >
> > -#define vcpu_has_sve(vcpu) (system_supports_sve() &&                 \
> > -                         vcpu_get_flag(vcpu, GUEST_HAS_SVE))
> > +#define kvm_has_sve(kvm)     \
> > +     test_bit(KVM_ARCH_FLAG_GUEST_HAS_SVE, &(kvm)->arch.flags)
> > +#define vcpu_has_sve(vcpu)   \
> > +     kvm_has_sve((vcpu)->kvm)
>
> Two things:
>
> - it is definitely worth keeping the system_supports_sve() helper, so
>   that we avoid checking flags for nothing

Ack

> - Since you preserve the vcpu_has_sve(), how about writing it as:
>
> #ifdef __KVM_NVHE_HYPERVISOR__
> #define vcpu_has_sve(v)         kvm_has_sve(kern_hyp_va((v)->kvm))
> #else
> #define vcpu_has_sve(v)         kvm_has_sve((v)->kvm)
> #endif
>
>   which will avoid the churn in this patch, and makes it hard to get
>   it wrong?

Same as I mentioned above. This macro is even used in more places by
the host kernel.

Thanks,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

