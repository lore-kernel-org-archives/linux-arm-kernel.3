Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3A1C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwxGjo3C3PaTbZ1upD/wKWCbmcm+Dks40hLiS0mMgj0=; b=XfwJjucqigKpmmDaU9Oe6LqmEf
	/sIw4yocV6o5awtUlIhA7yuQNLJ1hNiCAXlRID3Boi7zmHV39d6KIpQKZnGjN4ok1crDVfkoyVVoP
	cN70Uhi4X35wz8yjOg20+/eJsnE3OQexFEknrzE8kptvN4vmMjC1RScqPktk2douV9WzjVHpUoqZp
	CWshWnFdOXl//OzWQ3i0Wq3S33aJcePmTBNGdECyBRQxzs53PCFNRI8QY0gPYRP+csZFYjt9fRAvk
	kUZ0797/AOjD1dKYMPDlFg4NJ0d/HSKdXTLAw+RxOp6NTlPMegbN//pJkkFLBDoRXogYuoIc8EhgF
	Td+bLmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85T-00000009Frt-1GyO;
	Tue, 21 Jul 2026 10:52:35 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85Q-00000009Fqv-1pAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:52:33 +0000
X-Forwarded-Encrypted: i=1; AHgh+RoWj2KBZ0RnlddJd3fTCxIQM6IgmJg2eZmgZf1yjMIUoXGoEGYqAuNRclQUBo8rXzhQWY9IuhYX9hlGcZESRWfl@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784631148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qwxGjo3C3PaTbZ1upD/wKWCbmcm+Dks40hLiS0mMgj0=;
	b=xCSa3agiFOnxctcvGKc07FCmHaL8ZUBMbhgz9xeL3c6WzOUbrl7caNkY/eAGYvNyoW4dPs
	gs/ZniO+iG/D+9WEXaR5o/PCyh5tP0ARCP/GhfvBv098GkH7hf5ZLLRxXFuUCrqTqN1mEy
	dFFvZHinDYwDHH7sBz69KQcEyDp+ksg=
X-Gm-Message-State: AOJu0YzbTieRw5NrwxvhS4GMqOYXEY+fIUZY5+3Yq7+HvE74JihzGyxC
	gEeTK0I8r6Yum8NsgqiPFBJlU+PhMB37Y/KOoeCTHg5KjuW/a8lSi9TDNcjuyweO3SGy0Ey/2jl
	CtcwhblMmqNXIO4lSzo+HSJTn1we7RXne37ngW8Gc
X-Received: by 2002:a05:622a:2b47:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-525fcfa53f6mr13372511cf.0.1784631143501; Tue, 21 Jul 2026
 03:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260721100654.476582-1-alexandru.elisei@arm.com>
In-Reply-To: <20260721100654.476582-1-alexandru.elisei@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 21 Jul 2026 11:51:46 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxE_nzEmos5SKso5GuwVD=xzdiVWwe_PweRugw0Ry9LCg@mail.gmail.com>
X-Gm-Features: AUfX_mxoUdDr3Z0VPtcSLj2d9seKYTW01ZdyS0410ymZuRA_6deg14RYY6K9Jbo
Message-ID: <CA+EHjTxE_nzEmos5SKso5GuwVD=xzdiVWwe_PweRugw0Ry9LCg@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Reject guest_memfd memslots when the VM
 has MTE
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035232_683401_5FB63167 
X-CRM114-Status: GOOD (  20.76  )
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

Hi Alex,

...

>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index a5f9ee92f43e..53547fac5e37 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8414,6 +8414,11 @@ When this capability is enabled all memory in memslots must be mapped as
>  attempts to create a memslot with an invalid mmap will result in an
>  -EINVAL return.
>
> +``guest_memfd``, even though is an anonymous file, is incompatible with MTE.
> +Attempting to create a memslot backed by ``guest_memfd`` when the MTE capability
> +is enabled, or attempting to enable the MTE capability after ``guest_memfd``
> +backed memslots have been created, will result in an error.

A few couple of smaller things first: "even though _it_ is an
anonymous file". "guest_memfd backed memslots" could be hyphenated,
and "will result in an error" could be "will result in an -EINVAL
return" to match the paragraph above it.

On the wording itself, I would lean towards "not supported" rather
than "incompatible". The gmem fault path currently doesn't handle MTE
tags, but I don't think there's a fundamental reason this can't be
changed in the future.

With these fixed:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


>  When enabled the VMM may make use of the ``KVM_ARM_MTE_COPY_TAGS`` ioctl to
>  perform a bulk copy of tags to/from the guest.
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 50adfff75be8..9a6c72a18672 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -149,14 +149,27 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>                 set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
>                         &kvm->arch.flags);
>                 break;
> -       case KVM_CAP_ARM_MTE:
> -               mutex_lock(&kvm->lock);
> -               if (system_supports_mte() && !kvm->created_vcpus) {
> -                       r = 0;
> -                       set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
> +       case KVM_CAP_ARM_MTE: {
> +               struct kvm_memory_slot *memslot;
> +               int bkt;
> +
> +               guard(mutex)(&kvm->lock);
> +               if (!system_supports_mte() || kvm->created_vcpus)
> +                       break;
> +
> +               r = 0;
> +               guard(mutex)(&kvm->slots_lock);
> +               kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm)) {
> +                       if (kvm_slot_has_gmem(memslot)) {
> +                               r = -EINVAL;
> +                               break;
> +                       }
>                 }
> -               mutex_unlock(&kvm->lock);
> +               if (r == 0)
> +                       set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
>                 break;
> +
> +       }
>         case KVM_CAP_ARM_SYSTEM_SUSPEND:
>                 r = 0;
>                 set_bit(KVM_ARCH_FLAG_SYSTEM_SUSPEND_ENABLED, &kvm->arch.flags);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 6c941aaa10c6..2d95203386ba 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2652,6 +2652,10 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>         if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>                 return -EINVAL;
>
> +       /* guest_memfd is incompatible with MTE. */
> +       if (kvm_slot_has_gmem(new) && kvm_has_mte(kvm))
> +               return -EINVAL;
> +
>         hva = new->userspace_addr;
>         reg_end = hva + (new->npages << PAGE_SHIFT);
>
>
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> --
> 2.55.0
>

