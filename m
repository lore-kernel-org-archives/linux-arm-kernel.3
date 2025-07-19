Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19C4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 02:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Km3E7HJGqkRcH0Nlf/SQc9KxwYivV0AKdXoW0Ns1pQ=; b=GH1uleHYuO+T1XoLHhANjD3DnV
	tcB9r4yU2iZDp9Q2eDkycl59rHZdkowxbPeWamuN8kdZpIMdZxFOYX3i5bP8nBvo2MeFBvbE+d3dI
	bo3udeD5Yn9KPQrsOulSS405ZJ4vM9WK50ZywYbFN1PNYMOwBVQcNjdJrgH2yaSAIqVrSISa0Z4ze
	M6E8Rn6N3jE9K5o0TrJ4NnswtafhVjBlMW6EX6wuzMY1k5IAEsYspNf5ramAQeavpCrpcqXztT90V
	zVM4KtRAzsXFHfUheBN3Rmgu7zbnTxCKs0OFtZKb7l6rljm1/QeqJEVU2MI5QJY/rzWUyjdIgJI3Q
	cR4dqE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxU6-0000000DlCE-430d;
	Sat, 19 Jul 2025 02:39:34 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucxOA-0000000Dkpk-2uxv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 02:33:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b34c068faf8so2700409a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752892406; x=1753497206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Km3E7HJGqkRcH0Nlf/SQc9KxwYivV0AKdXoW0Ns1pQ=;
        b=cExxEo0qin3/kgCcAPgMUMPPtMakV7IJe7A/mAeOmje7qwEpJD9oUsdvYnihxd8aNf
         Ci4l8z+M74VQvD0Vn6rikTZWOArIZyYuGx+1hM2hO+5891+MgntrkVKeMwCIrq8sBfhd
         90aexUzNVOJs/8WqG1UOQs+w/JgVxYlwFbJAhH7B9Hk/oVSP+5lS8Ii53woyxtDIROQA
         4ICOy4A+3/eKkEkpvaZwvGFNTgJF2BLHCKCutQXOr5+LhqkYy0YIDFioM39EZOdgHnuJ
         UNboTohNbW3NJHRDRigfi7Qxi4s0i8rf6gz1sAStF7d2fLKmOCxtSNdNP0NiesxxafMo
         JSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752892406; x=1753497206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Km3E7HJGqkRcH0Nlf/SQc9KxwYivV0AKdXoW0Ns1pQ=;
        b=bm+ceoFy8gR5vgzGqjBnxOSW/o44k9OxXEGycU5/idpiuSlC9paNxYG0Mh4QxMXKmN
         oLCmBYtCD2SS4qlqxss+cCVpcO6MfGsE9uPfLghuwAKfytsshfnZD6XAti1yL6wnjlHy
         uFWMarYgIrx4QxbcwgkhFKu8CbNohL3ENH0mR0wvnWPvj/S+ZofFjmI/wyqrCOpWqQ/+
         yXWqwWbweYFrHjZKTWH2qYaD6A5bcEnVVeKxmHk7F09rRal/++/njx2A7MJOyGm5r6Ck
         rlnSou+hBMbav8YWa5CKw0WeHPDqWQgUse8NzfUpbKnrfq/4tNxGcdojIc8JCxHDlc89
         afqg==
X-Forwarded-Encrypted: i=1; AJvYcCW2ZzrGZpXlGZjqGuiaHBtIZnrG+HQtIv1/ajByjTNP9YwpM0S6AGW7x9LbJl18GDpczAOos6Fk1ZbFY4Iq4eAD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx243tpyMXxk6Bx0fd/EhnUrzChsE4KZ5pW5Z4QrdC2K3JiZSB
	0dkTxpY80+CAmYZ0S8Q3W9fWkCJKkW7yXlwGXMV36OJ421S7UXPW/D3W
X-Gm-Gg: ASbGncuWjJYAF4UCg3qODm0GKdM0nPovofX/yFBktxac6R3c+78GY8eOCVqFDwOP7P/
	ENFL+vC7nJj8G+b1edosfJd2nRVouCjqKr6YmcFzjWYAm/5/MPOT2SUFntuq94swNMWwR2U492q
	oeTj9HrMwcOOPxkgZhlKemNK4LDEryvktqO+eUYioAE8bUqDsAdeIrN94gmWUO8qcUMZdJ7Uk2e
	X9dVcBnXd02saV3jqrbFVSaobwgrKb/ybiNaaEpaJ2F+cgsFJXAliV7MK5/y8/sXMGVkB+Y1yTG
	m56yw0OEh+WTBx/Vi7/297yOh/IKXgyT1EeuNmr5OAME21pyS0SQ/Zc6mHPM3kpYNo+Wjb09JFx
	1TX0wCYC49l/KF8D7IbNS6H2ljw==
X-Google-Smtp-Source: AGHT+IFddcDEX4gdepWIQ/BvG0Nwo+HQvjjThFlet4NsWkmc1fwbmYyZR3mGKsrsM2y2NTjRjFnSNA==
X-Received: by 2002:a17:90b:58e8:b0:312:db8:dbdc with SMTP id 98e67ed59e1d1-31caf8db4f3mr14317726a91.20.1752892405750;
        Fri, 18 Jul 2025 19:33:25 -0700 (PDT)
Received: from localhost ([2409:891f:6a27:93c:d451:d825:eb30:1bcc])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b3f2ff9af8csm1838901a12.58.2025.07.18.19.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 19:33:25 -0700 (PDT)
Date: Sat, 19 Jul 2025 10:33:19 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Keir Fraser <keirf@google.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/4] KVM: Implement barriers before accessing
 kvm->buses[] on SRCU read paths
Message-ID: <knb7uh5fk2okmszyncigplu2drimnfaprnjiburfsip2fnkce2@c2czybicw22d>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-4-keirf@google.com>
 <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
 <aHpgmTD0J9UpTzQb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpgmTD0J9UpTzQb@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_193326_742728_0DEDDBC6 
X-CRM114-Status: GOOD (  34.32  )
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

On Fri, Jul 18, 2025 at 02:56:25PM +0000, Keir Fraser wrote:
> On Thu, Jul 17, 2025 at 02:01:32PM +0800, Yao Yuan wrote:
> > On Wed, Jul 16, 2025 at 11:07:36AM +0800, Keir Fraser wrote:
> > > This ensures that, if a VCPU has "observed" that an IO registration has
> > > occurred, the instruction currently being trapped or emulated will also
> > > observe the IO registration.
> > >
> > > At the same time, enforce that kvm_get_bus() is used only on the
> > > update side, ensuring that a long-term reference cannot be obtained by
> > > an SRCU reader.
> > >
> > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > ---
> > >  arch/x86/kvm/vmx/vmx.c   |  7 +++++++
> > >  include/linux/kvm_host.h | 10 +++++++---
> > >  virt/kvm/kvm_main.c      | 33 +++++++++++++++++++++++++++------
> > >  3 files changed, 41 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > > index 191a9ed0da22..425e3d8074ab 100644
> > > --- a/arch/x86/kvm/vmx/vmx.c
> > > +++ b/arch/x86/kvm/vmx/vmx.c
> > > @@ -5861,6 +5861,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
> > >  		if (kvm_test_request(KVM_REQ_EVENT, vcpu))
> > >  			return 1;
> > >
> > > +		/*
> > > +		 * Ensure that any updates to kvm->buses[] observed by the
> > > +		 * previous instruction (emulated or otherwise) are also
> > > +		 * visible to the instruction we are about to emulate.
> > > +		 */
> > > +		smp_rmb();
> > > +
> > >  		if (!kvm_emulate_instruction(vcpu, 0))
> > >  			return 0;
> > >
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 3bde4fb5c6aa..9132148fb467 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -965,11 +965,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
> > >  	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
> > >  }
> > >
> > > +/*
> > > + * Get a bus reference under the update-side lock. No long-term SRCU reader
> > > + * references are permitted, to avoid stale reads vs concurrent IO
> > > + * registrations.
> > > + */
> > >  static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
> > >  {
> > > -	return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
> > > -				      lockdep_is_held(&kvm->slots_lock) ||
> > > -				      !refcount_read(&kvm->users_count));
> > > +	return rcu_dereference_protected(kvm->buses[idx],
> > > +					 lockdep_is_held(&kvm->slots_lock));
> >
> > I want to consult the true reason for using protected version here,
> > save unnecessary READ_ONCE() ?
>
> We don't want this function to be callable from SRCU read section, but
> *only* during teardown. Hence protected version provides a better,
> stricter safety check (that there are no users).

I see, thanks for your explanation!

>
>  -- Keir
>
> > >  }
> > >
> > >  static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 222f0e894a0c..9ec3b96b9666 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -1103,6 +1103,15 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
> > >  {
> > >  }
> > >
> > > +/* Called only on cleanup and destruction paths when there are no users. */
> > > +static inline struct kvm_io_bus *kvm_get_bus_for_destruction(struct kvm *kvm,
> > > +							     enum kvm_bus idx)
> > > +{
> > > +	return rcu_dereference_protected(kvm->buses[idx],
> > > +					 !refcount_read(&kvm->users_count));
> > > +}
> > > +
> > > +
> > >  static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
> > >  {
> > >  	struct kvm *kvm = kvm_arch_alloc_vm();
> > > @@ -1228,7 +1237,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
> > >  out_err_no_arch_destroy_vm:
> > >  	WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
> > >  	for (i = 0; i < KVM_NR_BUSES; i++)
> > > -		kfree(kvm_get_bus(kvm, i));
> > > +		kfree(kvm_get_bus_for_destruction(kvm, i));
> > >  	kvm_free_irq_routing(kvm);
> > >  out_err_no_irq_routing:
> > >  	cleanup_srcu_struct(&kvm->irq_srcu);
> > > @@ -1276,7 +1285,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
> > >
> > >  	kvm_free_irq_routing(kvm);
> > >  	for (i = 0; i < KVM_NR_BUSES; i++) {
> > > -		struct kvm_io_bus *bus = kvm_get_bus(kvm, i);
> > > +		struct kvm_io_bus *bus = kvm_get_bus_for_destruction(kvm, i);
> > >
> > >  		if (bus)
> > >  			kvm_io_bus_destroy(bus);
> > > @@ -5838,6 +5847,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
> > >  	return -EOPNOTSUPP;
> > >  }
> > >
> > > +static struct kvm_io_bus *kvm_get_bus_srcu(struct kvm *kvm, enum kvm_bus idx)
> > > +{
> > > +	/*
> > > +	 * Ensure that any updates to kvm_buses[] observed by the previous VCPU
> > > +	 * machine instruction are also visible to the VCPU machine instruction
> > > +	 * that triggered this call.
> > > +	 */
> > > +	smp_mb__after_srcu_read_lock();
> > > +
> > > +	return srcu_dereference(kvm->buses[idx], &kvm->srcu);
> > > +}
> > > +
> > >  int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> > >  		     int len, const void *val)
> > >  {
> > > @@ -5850,7 +5871,7 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> > >  		.len = len,
> > >  	};
> > >
> > > -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> > > +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
> > >  	if (!bus)
> > >  		return -ENOMEM;
> > >  	r = __kvm_io_bus_write(vcpu, bus, &range, val);
> > > @@ -5869,7 +5890,7 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
> > >  		.len = len,
> > >  	};
> > >
> > > -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> > > +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
> > >  	if (!bus)
> > >  		return -ENOMEM;
> > >
> > > @@ -5919,7 +5940,7 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> > >  		.len = len,
> > >  	};
> > >
> > > -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> > > +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
> > >  	if (!bus)
> > >  		return -ENOMEM;
> > >  	r = __kvm_io_bus_read(vcpu, bus, &range, val);
> > > @@ -6028,7 +6049,7 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
> > >
> > >  	srcu_idx = srcu_read_lock(&kvm->srcu);
> > >
> > > -	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
> > > +	bus = kvm_get_bus_srcu(kvm, bus_idx);
> > >  	if (!bus)
> > >  		goto out_unlock;
> > >
> > > --
> > > 2.50.0.727.gbf7dc18ff4-goog
> > >
>

