Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B92BD42B97
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZJf54hz7xE0bBIr2JsyytkNQasf60PHx9P3JAB4nkQ=; b=U/fUBkbPcG7gl7w0Vewm22FGD7
	8/PfM+VNZxwVT4u18oiSGU8X5j4RwpEH6NvnQ9LwBLsCyiOfZwN9eq6xq+7tGuIvVyi3S1ADPHkk9
	Az15kIDGBYkb6isV/ItO3HtSficxg80LYrO7HTqjPJEex+qXG6wr9ghqcWj/A9MBpu4EDr8apGwxC
	HwWGP4z4NnTpqfcxCdOJ1PXSHnFL7C+JHdgorVwzS4tdIqw8MxAxhxLt77jIBfU/xadxeY/J7P1g7
	hvGZ8ZFHDJXqU7sNjaOYiKXdoMFASDYwxOAFdoAL4PJkbaBsIwli2nOMOPpUpNFDxuU0Y6VrqBu0n
	i6dk4CiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsat-00000003ud6-1zL7;
	Tue, 12 Nov 2024 15:14:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsZ3-00000003uEI-3cKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:12:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43150ea2db6so126805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 07:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731424339; x=1732029139; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZJf54hz7xE0bBIr2JsyytkNQasf60PHx9P3JAB4nkQ=;
        b=wAqDCbDtwU2zQv0LTcVsEcQ4gZVasSV9tA7D2CPzj4/sWWEWpITSKkqtg8FYioJQSF
         8qFG/ne2Lug6NvOkZ+u9ul684sSXuRcH0th1h2ZLvztynlIVmalj4xTtqnRDYIlzEfcU
         5toxAfp5eA2aiw269p1UDmuV3YEkT6GG/EipTaLyz/TzTpLybkBGz7wPb8E0Nyft/E9T
         WAqJ2zeKDkJVrtd5PrdvA4UDDYnkYU6msQHg7kvMsAz5ln7fg79xzm3iEAra6oAQ1PH3
         xg/ZADmqzR/SqfTPN1rRWCoB6rf4VM6FzdmDdz+rmh503LkddyfdrK3t4YDKA5Iap05X
         7FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731424339; x=1732029139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZJf54hz7xE0bBIr2JsyytkNQasf60PHx9P3JAB4nkQ=;
        b=JWicfO1BYP3NWPwqWHqUNhBjlPztLYtXmzjZ3X8HEZpO9b9c9yBsG0Fxu6whzEQakO
         UMBVdt8PTT9FH/y7tYwcJsX6sVVeNTzQvsSFf9HgVfa+06QWpHFllK0tmKwiG3uDIuIP
         0mzDM5whcFdKH2lTNq97tqEzfjzTnbKKr9NDJRcone7uBVAyscugsCVR1zKmaIrbL2b2
         bFXdBPKwVdx9lWrdbRgVVYYxmt+UfKapkPMSjcm2wyw4Nu0uSOjsGqivUhSMFoXf7rqt
         davThdKo/lRb2E2/vs7xrXeiV/JF2I2GTIaMEsZ/C+vIzM3PvZ/qrvaHuegRZnT1kOAP
         eMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyQU0GVVPc11aaAw/Ti9l5CnEfIE6L9twX/gh+FlSSuML+f2i5FquhjrejOQpTI8j11jch4805S0zUXiZtRImV@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZx65kS52KS62g6PvH0T53RK8t6AK9MlN41u7uo/UVxi+bih+
	86O58GiAQ5ORZbjzjsIhBWeLcpdgxl2LMQ7fEop7nRkR6wUxWZ94H1dUSxncBB9yG2Y5JQptb5v
	ePaNF+teve8LkOfnuutTgM+nH4Vckwu/lhZFV
X-Gm-Gg: ASbGncuuqZIpsTo6u7xR6/8djZGqrPCk39VCeFDj/aOuXwpIQXJYn5pgiesjHBhiseX
	89YXS5LRzjTTKlzmzhO/6lcme3cldHHmwlwon4dD3wvl4DqiWdAw40cUj5Thk
X-Google-Smtp-Source: AGHT+IFh1KG/4r/Jpj1n/ObwJscWvvtlsw0RsVTQkd1D68bpc9mkzBX4Z2VDq640KrO3IpXCu88faLISFm3MEsJl7tM=
X-Received: by 2002:a05:600c:1395:b0:431:43a1:4cac with SMTP id
 5b1f17b1804b1-432cf0fbec4mr2190145e9.3.1731424338902; Tue, 12 Nov 2024
 07:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20241112105032.793274-1-james.clark@linaro.org> <875xosts24.wl-maz@kernel.org>
In-Reply-To: <875xosts24.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 12 Nov 2024 15:11:42 +0000
Message-ID: <CA+EHjTyqunj19TLcaSp5DacRNWDsh-OpdRjpFOJfp0t8CBGEUw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Don't save FP traps in default cptr_el2 value
To: Marc Zyngier <maz@kernel.org>
Cc: James Clark <james.clark@linaro.org>, broonie@kernel.org, kvmarm@lists.linux.dev, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_071221_929359_B7E6FEF9 
X-CRM114-Status: GOOD (  40.92  )
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

Hi Marc and James,

On Tue, 12 Nov 2024 at 15:01, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 12 Nov 2024 10:50:31 +0000,
> James Clark <james.clark@linaro.org> wrote:
> >
> > kvm_get_reset_cptr_el2() is called at vcpu init before the vcpu is
> > loaded. Since the linked commit, the fp state was moved from the vcpu to
> > host data but it shouldn't be accessed at this point.
> >
> > Move the bits that require guest_owns_fp_regs() out of the default value
> > and into just before they're used in activate and deactivate traps. This
> > fixes the following bug when nvhe && vcpu_has_sve() == true:
> >
> >  BUG: using smp_processor_id() in preemptible [00000000] code: lkvm/118
> >  caller is debug_smp_processor_id+0x20/0x30
> >  CPU: 0 UID: 0 PID: 118 Comm: lkvm Not tainted 6.12.0-rc1+ #35
> >  Hardware name: FVP Base RevC (DT)
> >  Call trace:
> >   dump_backtrace+0xfc/0x120
> >   show_stack+0x24/0x38
> >   dump_stack_lvl+0x3c/0x98
> >   dump_stack+0x18/0x28
> >   check_preemption_disabled+0xe0/0xe8
> >   debug_smp_processor_id+0x20/0x30
> >   guest_owns_fp_regs+0x1c/0xb0
> >   kvm_arch_vcpu_ioctl+0xcfc/0xe10
> >   kvm_vcpu_ioctl+0x6c4/0x8a0
> >   __arm64_sys_ioctl+0x9c/0xe0
> >   invoke_syscall+0x4c/0x110
> >   el0_svc_common+0xb8/0xf0
> >   do_el0_svc+0x28/0x40
> >   el0_svc+0x4c/0xc0
> >   el0t_64_sync_handler+0x84/0x100
> >   el0t_64_sync+0x190/0x198
> >
> > Fixes: 5294afdbf45a ("KVM: arm64: Exclude FP ownership from kvm_vcpu_arch")
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> >
> > I'm only mildly confident that the logic here is equivalent to before.
> > Someone with a bit more context about the FP stuff can say, or if there
> > is a neater way to fix this issue altogether.
> >
> >  arch/arm64/include/asm/kvm_emulate.h | 15 +++++++++------
> >  arch/arm64/kvm/hyp/nvhe/switch.c     |  3 ++-
> >  2 files changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> > index cf811009a33c..0eefb9fb08a0 100644
> > --- a/arch/arm64/include/asm/kvm_emulate.h
> > +++ b/arch/arm64/include/asm/kvm_emulate.h
> > @@ -629,16 +629,12 @@ static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
> >                       val |= CPACR_EL1_SMEN_EL1EN;
> >       } else if (has_hvhe()) {
> >               val = CPACR_ELx_FPEN;
> > -
> > -             if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
> > +             if (!vcpu_has_sve(vcpu))
> >                       val |= CPACR_ELx_ZEN;
> >               if (cpus_have_final_cap(ARM64_SME))
> >                       val |= CPACR_ELx_SMEN;
> >       } else {
> >               val = CPTR_NVHE_EL2_RES1;
> > -
> > -             if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
> > -                     val |= CPTR_EL2_TZ;
> >               if (cpus_have_final_cap(ARM64_SME))
> >                       val &= ~CPTR_EL2_TSM;
> >       }
> > @@ -648,8 +644,15 @@ static __always_inline u64 kvm_get_reset_cptr_el2(struct kvm_vcpu *vcpu)
> >
> >  static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
> >  {
> > -     u64 val = kvm_get_reset_cptr_el2(vcpu);
> > +     u64 val = vcpu->arch.cptr_el2;
> >
> > +     if (has_hvhe()) {
> > +             if (!guest_owns_fp_regs())
> > +                     val |= CPACR_ELx_ZEN;
> > +     } else if (!has_vhe()) {
> > +             if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
> > +                     val |= CPTR_EL2_TZ;
> > +     }
> >       kvm_write_cptr_el2(val);
> >  }
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> > index cc69106734ca..296c4155e1fc 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> > @@ -60,7 +60,8 @@ static void __activate_traps(struct kvm_vcpu *vcpu)
> >                       val |= CPTR_EL2_TFP | CPTR_EL2_TZ;
> >
> >               __activate_traps_fpsimd32(vcpu);
> > -     }
> > +     } else if (!has_hvhe() && vcpu_has_sve(vcpu))
> > +             val |= CPTR_EL2_TZ;
> >
> >       kvm_write_cptr_el2(val);
> >       write_sysreg(__this_cpu_read(kvm_hyp_vector), vbar_el2);
>
> I think this is papering over the real issue, which is that we
> conflate reset value for the host and what is required for the guest
> to run.
>
> CPTR_EL2 is state-dependent, as you found out. And that really only
> means one single thing: it cannot be initialised outside of the vcpu
> being either loaded or run, both of which require being in a
> non-preemptible section.
>
> There is also another thing: VHE rebuilds the guest's CPTR_EL2 view
> from scratch, while the nVHE takes the saved state, mutates it in
> funny ways before applying it, and pKVM does all sorts of interesting
> manipulations before hitting the nVHE code.
>
> What I would really like to see is:
>
> - when entering the guest, we recompute the run-time value of CPTR_EL2
>   from scratch, just like VHE does.
>
> - when exiting the guest, we reset the value using the current helper,
>   which takes the guest state into account.
>
> - pKVM should be converted to using the plain nVHE code.
>
> - vcpu->arch.cptr_el2 should be killed.
>
> I think Fuad has already started on some of that. Fuad, do you mind
> adding that to your current rework and post something shortly?

Yes, this is a bit of a mess currently. I've been reworking it as part
of the work on pKVM. I'll post something shortly that will make it
more inline with how VHE handles this.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

