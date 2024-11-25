Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AA5D5806C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww3YlZzRzljXfiIGG34NOz7jVp5FZwnBv4kjnYFxh18=; b=IY95pXIWDq8n1/FdkVQSDRuKro
	hPfUDd5CQ6Yrhqz5uaecCTQts/7ecv0Xu+OKJVh4JIRqwJM8v9tbZlbh7BmPIJAdxyakXHtWHP14M
	nyeEtSC9nEFZ/9sUK2EN3c+/LMMsJ0zA0OEUunNX3mBXJJVEIxngPUiqAqOb3Kmrkjxx497lHS1Dj
	Kp0gDFHEFR4BRJD8a9gdLcnXcwiFIMKlrVOjL/4gUUudWUfPPYi05ceUjX1ysJkQrPo7bjUqLrunB
	juGGgWzJzE6+YxfqoHPxow9YQDS7p4JqS8wLT+f0uznCgVB9xVN1XIOVshnpejbyCP/I7f62a9rpb
	O91kf6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXlb-00000007xPp-3fN5;
	Mon, 25 Nov 2024 12:00:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXkf-00000007xIc-0Dzi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 11:59:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4349338add3so61985e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732535974; x=1733140774; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ww3YlZzRzljXfiIGG34NOz7jVp5FZwnBv4kjnYFxh18=;
        b=sLu+TrHZ5vplf6uXtd4i2nk6fabcetyqzULNqagIQkQaeU1QvegCZnBcdLTHv1PN5c
         KpGkNBZr8YPddgJ4TrSIClclY8z8ZS9C/gF7LtkevhDGEqMfeNzdh3N/rLBrGA6HFWzx
         6W1oVweKCmlR4CFWK5OooiGMwJUJX663ozQnndiOmdiorRD7i08cu76pwgg7oGfhvhve
         MeY4lak5WHKU2G+WFAPkofXSYdzv7LtSo72YKW55ss8BoJiwl2IBq4fvVA8BdIqHy+mS
         Udlv1a0dnx9yj9c47GlXWh0OB48hgcfRSt9kq698rv58cskVEgLCP6M+i7SvEORuresq
         gu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732535974; x=1733140774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ww3YlZzRzljXfiIGG34NOz7jVp5FZwnBv4kjnYFxh18=;
        b=SiVNkEFtnTDEZMgVYlkFqY5+HTQD1IQAQS+3IqZQpB66XVrKadJmepTjZjAEcx75DF
         hZubP7sTgkaeDoU8prhfLcXmPshiMdUfGDkDzSo+2evFcjXpx6GwMaAtFlNBjieBlcGo
         HDLKPc18mUYfoKMdpK7s5o66kxJMMX7gDZDjbqiWtE8a5G/JZvemBreS8sxJYWUc96ZE
         9yfVfxlusQufkuzzKQ/dPCx33jkOIYxJcG6NbhQjNgz6KwAZCUcI0J9r0U3/1MzpFHWE
         sgCjQ9HsTeKRRYeB3kRi/4mDysIGl+oUAdc0ZsY33/GF6bGXHMevQ/kvEkzF0QpHum06
         rnOw==
X-Forwarded-Encrypted: i=1; AJvYcCUvy8nKjkt4G2vuiemwHaMG0HrTHHOd3PKg+AQhkNW69CBKyQdCT7KbvOaEHPm4gGBLdc5rYyQ9Dsg7TxuDQNnU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ZTR0bW23fTLCp8QqMx4JRdhqA+5HDZyFOgmk3xefe/caCXKt
	pkIuRt9xs03gczopgII/rZ0qrcmzt3cdmUfUD63zQHH8c57T9DmpHebvFbjcisVVPnD28rApZNK
	OzLlZqUjA/z8Yg83I7bnZCprwylED84yHPOvS
X-Gm-Gg: ASbGnctbJPPaWTUgwHujO5F182fbQMGXFm0G0XoogGjRiqJA+jCjQtQmvD/Z5PO6ujV
	k7QuZhagN6bSuoCxgAEb8vrc+76G7Og==
X-Google-Smtp-Source: AGHT+IGu8CTtX0DwI9l42eo6hCR0G+gNVNebSmIzHE1Pb7TY8/8FCpvE/ag1zS55FnP4k8HK+qQSBBiN0gPZJz3+WEg=
X-Received: by 2002:a05:600c:5248:b0:431:43a1:4cac with SMTP id
 5b1f17b1804b1-4348c991304mr2570645e9.3.1732535974462; Mon, 25 Nov 2024
 03:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20241122110622.3010118-1-tabba@google.com> <20241122110622.3010118-6-tabba@google.com>
 <86ldx8vni5.wl-maz@kernel.org>
In-Reply-To: <86ldx8vni5.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 25 Nov 2024 11:58:58 +0000
Message-ID: <CA+EHjTyEOgedbeiaiNKSxxE9CNaSWLh4nQONMem+bgbrxnkCZA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] KVM: arm64: Initialize feature id registers for
 protected VMs
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, james.clark@linaro.org, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_035937_092613_50E1C2F7 
X-CRM114-Status: GOOD (  37.47  )
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

On Sun, 24 Nov 2024 at 12:12, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 22 Nov 2024 11:06:15 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The hypervisor maintains the state of protected VMs. Initialize
> > the values for feature ID registers for protected VMs, to be used
> > when setting traps and when advertising features to protected
> > VMs.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  .../arm64/kvm/hyp/include/nvhe/fixed_config.h |  1 +
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  4 ++
> >  arch/arm64/kvm/hyp/nvhe/sys_regs.c            | 54 +++++++++++++++++--
> >  3 files changed, 56 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> > index d1e59b88ff66..69e26d1a0ebe 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
> > @@ -201,6 +201,7 @@
> >  u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id);
> >  bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
> >  bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
> > +void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
> >  int kvm_check_pvm_sysreg_table(void);
> >
> >  #endif /* __ARM64_KVM_FIXED_CONFIG_H__ */
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 59ff6aac514c..4ef03294b2b4 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -381,6 +381,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
> >       hyp_vm->kvm.created_vcpus = nr_vcpus;
> >       hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
> >       hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
> > +     hyp_vm->kvm.arch.flags = 0;
> >       pkvm_init_features_from_host(hyp_vm, host_kvm);
> >  }
> >
> > @@ -419,6 +420,9 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
> >       hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
> >       hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
> >
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             kvm_init_pvm_id_regs(&hyp_vcpu->vcpu);
> > +
> >       ret = pkvm_vcpu_init_traps(hyp_vcpu);
> >       if (ret)
> >               goto done;
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > index 59fb2f056177..7008e9641f41 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -204,8 +204,7 @@ static u64 get_pvm_id_aa64mmfr2(const struct kvm_vcpu *vcpu)
> >       return id_aa64mmfr2_el1_sys_val & PVM_ID_AA64MMFR2_ALLOW;
> >  }
> >
> > -/* Read a sanitized cpufeature ID register by its encoding */
> > -u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> > +static u64 pvm_calc_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> >  {
> >       switch (id) {
> >       case SYS_ID_AA64PFR0_EL1:
> > @@ -240,10 +239,25 @@ u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> >       }
> >  }
> >
> > +/* Read a sanitized cpufeature ID register by its encoding */
> > +u64 pvm_read_id_reg(const struct kvm_vcpu *vcpu, u32 id)
> > +{
> > +     return pvm_calc_id_reg(vcpu, id);
> > +}
> > +
>
> Whatever reason you have to keep this per-CPU, it really needs to
> change to be VM-scoped. Maybe not immediately, but that should be on
> your list.

Ack.

> >  static u64 read_id_reg(const struct kvm_vcpu *vcpu,
> >                      struct sys_reg_desc const *r)
> >  {
> > -     return pvm_read_id_reg(vcpu, reg_to_encoding(r));
> > +     struct kvm *kvm = vcpu->kvm;
> > +     u32 reg = reg_to_encoding(r);
> > +
> > +     if (WARN_ON_ONCE(!test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags)))
> > +             return 0;
> > +
> > +     if (reg >= sys_reg(3, 0, 0, 4, 0) && reg <= sys_reg(3, 0, 0, 7, 7))
> > +             return kvm->arch.id_regs[IDREG_IDX(reg)];
>
> Why the limit to the AA64 idregs? Aren't the other shadow sysreg
> values correctly initialised to 0?

Yes they are. Will expand this to cover those too.


> > +
> > +     return 0;
> >  }
> >
> >  /* Handler to RAZ/WI sysregs */
> > @@ -448,6 +462,40 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
> >       /* Performance Monitoring Registers are restricted. */
> >  };
> >
> > +/*
> > + * Initializes feature registers for protected vms.
> > + */
> > +void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu)
> > +{
> > +     const u32 pvm_feat_id_regs[] = {
>
> static?

Yes, and see below.

> > +             SYS_ID_AA64PFR0_EL1,
> > +             SYS_ID_AA64PFR1_EL1,
> > +             SYS_ID_AA64ISAR0_EL1,
> > +             SYS_ID_AA64ISAR1_EL1,
> > +             SYS_ID_AA64ISAR2_EL1,
> > +             SYS_ID_AA64ZFR0_EL1,
> > +             SYS_ID_AA64MMFR0_EL1,
> > +             SYS_ID_AA64MMFR1_EL1,
> > +             SYS_ID_AA64MMFR2_EL1,
> > +             SYS_ID_AA64MMFR4_EL1,
> > +             SYS_ID_AA64DFR0_EL1,
> > +     };
> > +     struct kvm *kvm = vcpu->kvm;
> > +     unsigned long i;
> > +
> > +     if (WARN_ON_ONCE(test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags)))
> > +             return;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(pvm_feat_id_regs); i++) {
>
> But do you really need this array? Can't you just iterate over the
> idreg space and compute the value? Sure, that'd be a bit longer, but
> at least you would define the idregs you care about in a single place.

Like you said, I was trying to save a couple of cycles, but I'll
change it as you suggest.

> > +             struct kvm_arch *ka = &kvm->arch;
> > +             u32 reg = pvm_feat_id_regs[i];
> > +
> > +             ka->id_regs[IDREG_IDX(reg)] = pvm_calc_id_reg(vcpu, reg);
> > +     }
> > +
> > +     set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
> > +}
> > +
> >  /*
> >   * Checks that the sysreg table is unique and in-order.
> >   *
>
> Thanks,

Thank you!


/fuad

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

