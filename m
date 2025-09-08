Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D404DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtuFE8fz0uXe9VtzwZec8xI+z6SKpPfaDmAZDtJxuFo=; b=ALK7bd8aWdzxjLYIuIbJsJB9tG
	JlgiEValwTo9vgxhAeD2adEs8T3u+c4mwThV4Tq5I+4HkjDBLMW0QnrfyIYsFKkNm8lYQanEqQZb9
	CDQjS5YQ/dtjm/FQ2ycdvlOgZJX/U8Hb6vBLauGbZtGu69KVVNj+ZrrJtH4uBC8t0Qu0kQe7Ax5oF
	mzLFAr41dyogbY0SoMRGCjI11yU6pLj1r5LgtGjAcxWKl5pPawLMUC3v3pMQbxUvnuQwJwix54WIJ
	ynSo2gTyr6hRQyOgfiChX9JI6BboA7r3SaZ5K31idWzoVF8UMhEhWt44XN2eJAYejlbnYgk5wnrKR
	xDz/ckDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBU-00000004ocI-2fdJ;
	Tue, 09 Sep 2025 06:50:32 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhp6-00000001z8j-3PXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 19:46:46 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-24c9304b7bcso50573865ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757360803; x=1757965603; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtuFE8fz0uXe9VtzwZec8xI+z6SKpPfaDmAZDtJxuFo=;
        b=KxbP1FswEYmB2l2heHpCUc2uNKZJQV5FmIwGainP2eASSKPFY+SDYvRYhbQjwsVO1g
         yeihlbXGmEpLfqLuT7eqxKWrHzQ+84RQM3OmRYsyW5aQH7Yr8H0n2IpZ2f9vFYtmAGa7
         GJkLf2Lpoe/abADToydHR5N8a0KO/S1ajr/0sOoTGp0dQSMu9GG/aaQRIazY9G/UZDAs
         Lc39IUB5F5sPZziNmYYaxFCd+vq1vYiupGrfnVaXzKQPVD9IHuNgrsdEGM91C2YltFj4
         51VPHaOhaF8EUodelr2RZDCR8bfkWNr+F1RTeDsjdEzxCO7HA8u6zGDe5DFHn9zWhb09
         ThYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360803; x=1757965603;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtuFE8fz0uXe9VtzwZec8xI+z6SKpPfaDmAZDtJxuFo=;
        b=qzftjkAO73DAsUXYvIcT2Cewx6LmwQzRJBjVbcWTVVXK8ruH2t8NtkM0e4vsL/TMqt
         STh6C+ub0wx3LmIX+/wdQbXM6xFAKMJ57oPY/N1B2L5hzLGpBUCU/70X76YFQmFcWbXl
         nfGqydK1IZzfPMHozUlYqP2fGUMBY4rAXjdFImLqCnMbd35JNc8lErGL19V5jfoE75ML
         mMzcxB2q7mN+9zjJsS8i1Z2JPnlGdpTu2t+WHCwvh1k0rO90esa0uzBUVnmGj8PswjHm
         F09DQFZnP8FXjuG7RvFEKB4BlT59KAMNzgJ9UA2FoiOP9i++sVkYV+B1COuYR8rfdRXe
         c9jw==
X-Gm-Message-State: AOJu0Yz8hmf79CJRktAl5Kxz3CCQB6VrEuhWhFqimB+lxE742DZwvtIg
	ADsEQvov/DUx3vKoFvVRX1vE8M9QWfokNdC3g1xoL+G4da3gq+pxxhhSGZbffOwb7NpiCGC3SSt
	vR2vw/Q==
X-Google-Smtp-Source: AGHT+IFb1neEFkxq+1aKM895lwflQXUWxZfzQ3TkgAtLxYrbO6zawNDmMq2mZAuMldFhSu9Kf+nu0tLZnJY=
X-Received: from pjeb1.prod.google.com ([2002:a17:90a:10c1:b0:32b:b3c4:a304])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8e:b0:24e:e5c9:ed14
 with SMTP id d9443c01a7336-251734f2fbemr125000785ad.35.1757360803162; Mon, 08
 Sep 2025 12:46:43 -0700 (PDT)
Date: Mon, 8 Sep 2025 12:46:41 -0700
In-Reply-To: <20250819090853.3988626-4-keirf@google.com>
Mime-Version: 1.0
References: <20250819090853.3988626-1-keirf@google.com> <20250819090853.3988626-4-keirf@google.com>
Message-ID: <aL8yoZLK73svpYv7@google.com>
Subject: Re: [PATCH v3 3/4] KVM: Implement barriers before accessing
 kvm->buses[] on SRCU read paths
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_124644_851146_EBFEC621 
X-CRM114-Status: GOOD (  26.13  )
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

On Tue, Aug 19, 2025, Keir Fraser wrote:
> This ensures that, if a VCPU has "observed" that an IO registration has
> occurred, the instruction currently being trapped or emulated will also
> observe the IO registration.
> 
> At the same time, enforce that kvm_get_bus() is used only on the
> update side, ensuring that a long-term reference cannot be obtained by
> an SRCU reader.
> 
> Signed-off-by: Keir Fraser <keirf@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c   |  7 +++++++
>  include/linux/kvm_host.h | 10 +++++++---
>  virt/kvm/kvm_main.c      | 33 +++++++++++++++++++++++++++------
>  3 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index aa157fe5b7b3..2d3c8cb4f860 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -5785,6 +5785,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
>  		if (kvm_test_request(KVM_REQ_EVENT, vcpu))
>  			return 1;
>  
> +		/*
> +		 * Ensure that any updates to kvm->buses[] observed by the
> +		 * previous instruction (emulated or otherwise) are also
> +		 * visible to the instruction we are about to emulate.

Please avoid pronouns, e.g.

		 * visible to the instruction KVM is about to emulate.

> +		 */
> +		smp_rmb();

...

>  static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 6c07dd423458..4f35ae23ee5a 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1103,6 +1103,15 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
>  {
>  }
>  
> +/* Called only on cleanup and destruction paths when there are no users. */
> +static inline struct kvm_io_bus *kvm_get_bus_for_destruction(struct kvm *kvm,
> +							     enum kvm_bus idx)
> +{
> +	return rcu_dereference_protected(kvm->buses[idx],
> +					 !refcount_read(&kvm->users_count));
> +}
> +

Extra newline.

> +
>  static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>  {
>  	struct kvm *kvm = kvm_arch_alloc_vm();
> @@ -1228,7 +1237,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>  out_err_no_arch_destroy_vm:
>  	WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
>  	for (i = 0; i < KVM_NR_BUSES; i++)
> -		kfree(kvm_get_bus(kvm, i));
> +		kfree(kvm_get_bus_for_destruction(kvm, i));
>  	kvm_free_irq_routing(kvm);
>  out_err_no_irq_routing:
>  	cleanup_srcu_struct(&kvm->irq_srcu);
> @@ -1276,7 +1285,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
>  
>  	kvm_free_irq_routing(kvm);
>  	for (i = 0; i < KVM_NR_BUSES; i++) {
> -		struct kvm_io_bus *bus = kvm_get_bus(kvm, i);
> +		struct kvm_io_bus *bus = kvm_get_bus_for_destruction(kvm, i);
>  
>  		if (bus)
>  			kvm_io_bus_destroy(bus);
> @@ -5843,6 +5852,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
>  	return -EOPNOTSUPP;
>  }
>  
> +static struct kvm_io_bus *kvm_get_bus_srcu(struct kvm *kvm, enum kvm_bus idx)
> +{
> +	/*
> +	 * Ensure that any updates to kvm_buses[] observed by the previous VCPU

s/VCPU/vCPU to match KVM's preferred/typical style.

> +	 * machine instruction are also visible to the VCPU machine instruction
> +	 * that triggered this call.
> +	 */
> +	smp_mb__after_srcu_read_lock();
> +
> +	return srcu_dereference(kvm->buses[idx], &kvm->srcu);
> +}

