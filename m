Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A81CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xbx1jZ5ZtDZQNw/mTpWHRsEOAMqWoM+Ba2UTcs6fjM0=; b=KdlKdTlTHEcO2dlZRRPZXYwKZf
	ErGJjXN91VKg4vHv/qReCy40t7/4cdtCCQOWMM33KSlJKK9/6vnESczjB1a4FW2L/f7GyjAQ7aV8c
	ocsV7eQpeFNVZ0WU41YFqLhwgUMN0EvB9gGaaT598h1YCDeviJTl/95GXLKIR6z6EI065r96q2Qpt
	0yO0m9Q4U6jMv+MMR/SgXbKx+zE4FoJ88/7wKJv3huZOqU4OAGBkNNPOhrxDixV29fvg2fa1OCvZm
	0YJ1kOZ0fovH5ATAIU2WdEx+jyaeigFtEE5Z6g81Y8Q7f8bdB7zUyT1kt8GiDzyhZgslnie1mS39L
	fsW5f1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITRc-00000005eMI-2sdg;
	Mon, 10 Nov 2025 15:04:36 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITRZ-00000005eLc-0vlR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:04:35 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4edb8d6e98aso295911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 07:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762787072; x=1763391872; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xbx1jZ5ZtDZQNw/mTpWHRsEOAMqWoM+Ba2UTcs6fjM0=;
        b=lANxj0XH2FznV3ITflCzPtqAJ2zJMzBZdMnYX2MGL5HJ8GL9YAObIboHPS0cMNENvS
         QFozg6DNbmxnEwabdI+xiiB+POQ6nQVTxQeTgcdLdbKIYmg3o6A57w0jBeEKsf43q8ZK
         kS+yGzs5kxDuvCxKNsIz0yojnF8R7tHNDk+AYSKXOCqLueLVHzRcqvZNa3mAcfgjbQ+F
         qjTBLnVrwCUB+wzKVnE0N72E5i5vNnRE8OyXAT4hm4adEa7SKuZ3HcxyhNvxn4JqNbNB
         xXwoPRoyEB+iC8AAoULHOU/QFwwHN6BvdcFOuHYD+77rDbg2m6LKp6ZPoy55x2OFln9z
         x+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787072; x=1763391872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbx1jZ5ZtDZQNw/mTpWHRsEOAMqWoM+Ba2UTcs6fjM0=;
        b=K3f011Wei1bVXHSWor/HrewYwonNGZwmCMRZLytO3zYyT+A8y3ZXe1RTxlPOMiCixf
         x72gAZY7cKDMSilFzepCDnsgl8CII4XS2uSoT98jEHSKwH5AOIFUTWGgeX+VEfMpeIRC
         elg6hCUG2tyclN6JDQ+M2Thqb8JiBCcxWM8Qo8YdG/29Ok6Ha2Y7XaP4CqmEcS95tRZN
         GAwLSkIoGQvN3qRN4bqtKud+CJphthGv4yMzjR2OWNbaq/Kqu6sHfZt+x5W0GrZOp/Xa
         VOdlKf7ZOwxhfJKoIaIOEZUrPq/19B94wgzlaYMo9grA8YXkNu3UB0ZiCA72s1g1/Itf
         2IcA==
X-Forwarded-Encrypted: i=1; AJvYcCUbZnpFn1O0VgItf7G/aYiweKsbP6QU+/aMvyL3e9aiBohu/1KCYGd0cIbqUbmZe11Cg5Qwi8lxuZ9K7sjuteDb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9xkcWes2hQVIanuXKiivlJNSoLDS2TcLWVi7w3nyBasFLe1Qk
	yczu438wx8fK5XJNh9m3jILBNMeIBgPEAAhODNaKd9JGJvkK6BYC/AtniV8fZ3oIafL0Tb2jgUh
	HCPX+zO18bcKpHamLYWHbbX1yMehZRYKkICJNpVhBtEWQKJ7Qr66vTx5e8ME=
X-Gm-Gg: ASbGnctklIo/CyeHXgPkloBimDopJUr2nOq6R9rJ7udeEciVvkvyLFDLz/c05FjWay0
	3Tr2Cn9VTiuHHYHVDtiT5qrQiUnAJMkzxFl+jDmaZ8Wwek/cF+SBQBrh1gswN1gq2QKo3cB7tuR
	Kdx0S0FOvPEqkE5JpkqTK0MpHNSdvevDbAg7kKoosT7BoadV6jrVYAs26mrlHwy50yGkDWxlFk/
	Hel/HunTU4IJ++X42ocZnTobT950rsOMURz6JhUiTpRfxZ4Az0KgSiFspY7
X-Google-Smtp-Source: AGHT+IEhj4deaDzdMbqhfKu1Xfh8nGslbXskec6lqQWbXZ4RiM6ounrrTFI5pFrD/dIUOXGWVk8xRUBXDzBAL5EHkw4=
X-Received: by 2002:ac8:5808:0:b0:4ed:b4e3:cfa9 with SMTP id
 d75a77b69052e-4edb4f31b23mr8209791cf.5.1762787071367; Mon, 10 Nov 2025
 07:04:31 -0800 (PST)
MIME-Version: 1.0
References: <20251110134525.3768197-1-tabba@google.com> <20251110134525.3768197-4-tabba@google.com>
 <bc25a11a-d5b7-45de-bb99-c78100e5055d@arm.com>
In-Reply-To: <bc25a11a-d5b7-45de-bb99-c78100e5055d@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 10 Nov 2025 15:03:54 +0000
X-Gm-Features: AWmQ_bnuzcmegBE5AU2g4oiIJKzzJSl7fV2EZbDb74iGF0ObJPvV6Janjbuy0xU
Message-ID: <CA+EHjTzW1Mj6yCY8_L83s5B_LvuzbbVs=0p83t1W7zahEs_PaQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] KVM: arm64: Fix MTE flag initialization for
 protected VMs
To: Ben Horgan <ben.horgan@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_070433_267199_D03048DD 
X-CRM114-Status: GOOD (  28.00  )
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

Hi Ben,

On Mon, 10 Nov 2025 at 14:51, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Fuad,
>
> On 11/10/25 13:45, Fuad Tabba wrote:
> > The function pkvm_init_features_from_host() initializes guest
> > features, propagating them from the host. The logic to propagate
> > KVM_ARCH_FLAG_MTE_ENABLED (Memory Tagging Extension)
> > has a couple of issues.
> >
> > First, the check was in the common path, before the divergence for
> > protected and non-protected VMs. For non-protected VMs, this was
> > unnecessary, as 'kvm->arch.flags' is completely overwritten by
> > host_arch_flags immediately after, which already contains the MTE flag.
> > For protected VMs, this was setting the flag even if the feature is not
> > allowed.
> >
> > Second, the check was reading 'host_kvm->arch.flags' instead of using
> > the local 'host_arch_flags', which is read once from the host flags.
> >
> > Fix these by moving the MTE flag check inside the protected-VM-only
> > path, checking if the feature is allowed, and changing it to use the
> > correct host_arch_flags local variable. This ensures non-protected VMs
> > get the flag via the bulk copy, and protected VMs get it via an explicit
> > check.
> >
> > Fixes: b7f345fbc32a ("KVM: arm64: Fix FEAT_MTE in pKVM")
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index f6f8996c4f97..7e370e31260d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -337,9 +337,6 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> >       /* CTR_EL0 is always under host control, even for protected VMs. */
> >       hyp_vm->kvm.arch.ctr_el0 = host_kvm->arch.ctr_el0;
> >
> > -     if (test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &host_kvm->arch.flags))
> > -             set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
> > -
> >       /* No restrictions for non-protected VMs. */
> >       if (!kvm_vm_is_protected(kvm)) {
> >               hyp_vm->kvm.arch.flags = host_arch_flags;
> > @@ -372,6 +369,11 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> >               kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_GUEST_HAS_SVE);
> >       }
> >
> > +     if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE)) {
> > +             set_bit(KVM_CAP_ARM_MTE, allowed_features);
>
> Isn't allowed_features a bitmap for the KVM_ARCH_VCPU_ defines? I think
> MTE is treated as a property of the VM.

Right! This line should go. The check should only be to propagate the
flag to kvm->arch.flags, i.e.,

+       if (kvm_pvm_ext_allowed(KVM_CAP_ARM_MTE))
+               kvm->arch.flags |= host_arch_flags &
BIT(KVM_ARCH_FLAG_MTE_ENABLED);

Thanks for pointing this out,
/fuad

> > +             kvm->arch.flags |= host_arch_flags & BIT(KVM_ARCH_FLAG_MTE_ENABLED);
> > +     }
> > +
> >       bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
> >                  allowed_features, KVM_VCPU_MAX_FEATURES);
> >  }
>
>
> Thanks,
>
> Ben
>

