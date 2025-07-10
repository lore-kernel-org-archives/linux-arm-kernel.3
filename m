Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE3BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpVqT/0ziCiQWbhFEKbAX/q6iQaKzlbqaJjN/YymYjI=; b=Ce3DEL1wj7NFvO6Uoeo2cuyYs0
	54F554iL+zGQmpKeJteYMdE0tX22xhQCqjJ2aKjytpIOjIamy4pKf5kc2qrU//4SMQRtCQRGsCujH
	Js1kEXD5po4jabx60nN9HN8QfNeYDpyUX1ttdGa2zFpjBcrnSvxrEjlasZlmijNz2lWRH/BL5jjAO
	vnB5iKGJdpfctVWSqEqwxE0vLgi9A+Byi+N3CDNiYM+lXAHh/WONd/C6ImI6t6iWig87xg7dOTpar
	8XNA2hq+wt2VAa4m3j5JRM69VhkktpRKEGvElftRHrsyIsQnsNGD2d+Zr/IbW9cFGHp2k9qiVpBzp
	VY/zWCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZm1o-0000000B4S6-2xwe;
	Thu, 10 Jul 2025 07:49:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZl7s-0000000Auh5-1I2w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 06:51:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451d54214adso3796525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752130282; x=1752735082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpVqT/0ziCiQWbhFEKbAX/q6iQaKzlbqaJjN/YymYjI=;
        b=RMr59Bhyk/qABqGmLJw0EpCQUBvfoR5wQs7IEU1miN0O7zPC0ny951Fjfv+o2rRtF6
         xaoVHhCMo1+4C0hbUfGItoDQ1pngkqWEhpaqGRciUo+TRxuzEDXdpKXV03ayldJNzDHV
         LzVbFS6OBrafs4ehV46aM4eCZH3vAwg5sq2TmdBGVtj1oglEHmWb9YtcF8IMhcxSSu/v
         dEBnVukjhBHGKfaZdDBzwYNv4a+UFas2u1ipSrul2xxjHzwqOTKjPTdZieQRkJlEz5Zb
         UuRTM7I2S4q3deuHQWUWzwtxp6733ehxshrzKaVf5XvY1iA9Bh3BoVXGAr62T8PaiVz2
         szew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752130282; x=1752735082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpVqT/0ziCiQWbhFEKbAX/q6iQaKzlbqaJjN/YymYjI=;
        b=ly3KkKSZIc5yIPhXedAut2kQMrC8ra2FdDi08eX7tdgK2p7x3qcd/oRKdzw4D7oI4d
         TeMgo+PQ+ZI0OMg/w1JFBec1FqTE9Q4tqvn8VZVeg/OPzbRjsEVq7oPgveJIAUbduDgg
         LK/IjDvHxRboIuhkcgwhkWui+6r7vHsxFCb3rpEEMcsGbTmDDq27hJOqUPM4gTWwMLpn
         O9A/0DrVg4yjXqzNSWTDSWgezSV16ezkFLrjm5yWR5/yjDU3APEr28uGKsadKc8RXGH1
         cL57CE38be9KVi3jYupS+yRlgebIiP0Ac1twpcN1dcCWtfsjjYUlGjG1fLmiuDpSZaqH
         Dc+A==
X-Gm-Message-State: AOJu0YyoDqWGlqjUGbSRSyccMqq213+5gI74d+H2q34cEA+nwbaeae3R
	CD39TOJ18glIFHp6d8kDwoqRW6l9GdB/Z7wgB/+rjbTIQM0D0+Jxul0OjlzUE4k76A==
X-Gm-Gg: ASbGncsGBuml04puKMMJZJ22J703pKa/XzSq5x2Py+6QFlBk9hfsJagQfuIp1yEErYN
	MK+Jh8vO4NIMfc+2jFSXpbQjoquqoZzn+HYgkpzpzqBS94XOMkgElj/siSRZcIKxrpozg3y8hRM
	ncZhH5eLfZzlEMgmv9geSof4dAkwLyvF29PICNOeg46Y4OGsVejvasmdjlsJOKEyDLJbtoF3Ay9
	sKuOmAxtrAT+TMs8/hoOWn4/qnNUSHHY/Tj6cl/d4iDl+GzhKpeuTam8Vnz4/J/7oyRZXdIynlR
	fZ1sjHEqexHH+MvBRmo4ReRjRtKCvVOOBQRH9QgsnkAjB+/p8xXz71ErMc5gArEpg7rItbrna42
	1ybkZhABvLLhA14RCZ8leE3g=
X-Google-Smtp-Source: AGHT+IFZP/UMNnhVWneOpJDGvjArQoTmSoQxfALO8N9dgC9g7qQ/GhXWcBfsOhwQL5ABm6JTjSKyuQ==
X-Received: by 2002:a05:600c:1546:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-454d53a608dmr55979805e9.16.1752130281641;
        Wed, 09 Jul 2025 23:51:21 -0700 (PDT)
Received: from google.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd439326sm9964525e9.1.2025.07.09.23.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:51:20 -0700 (PDT)
Date: Thu, 10 Jul 2025 06:51:16 +0000
From: Keir Fraser <keirf@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in
 kvm_io_bus_register_dev()
Message-ID: <aG9i5BHDHRlFRFnb@google.com>
References: <20250624092256.1105524-1-keirf@google.com>
 <20250624092256.1105524-4-keirf@google.com>
 <aFrANSe6fJOfMpOC@google.com>
 <aGJf7v9EQoEZiQUk@google.com>
 <aGwWvp_JeWe9tIJx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGwWvp_JeWe9tIJx@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_235124_371247_0F5771CD 
X-CRM114-Status: GOOD (  61.27  )
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

On Mon, Jul 07, 2025 at 11:49:34AM -0700, Sean Christopherson wrote:
> On Mon, Jun 30, 2025, Keir Fraser wrote:
> > On Tue, Jun 24, 2025 at 08:11:49AM -0700, Sean Christopherson wrote:
> > > +Li
> > > 
> > > On Tue, Jun 24, 2025, Keir Fraser wrote:
> > > > Device MMIO registration may happen quite frequently during VM boot,
> > > > and the SRCU synchronization each time has a measurable effect
> > > > on VM startup time. In our experiments it can account for around 25%
> > > > of a VM's startup time.
> > > > 
> > > > Replace the synchronization with a deferred free of the old kvm_io_bus
> > > > structure.
> > > > 
> > > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > > ---
> > > >  include/linux/kvm_host.h |  1 +
> > > >  virt/kvm/kvm_main.c      | 10 ++++++++--
> > > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > > index 3bde4fb5c6aa..28a63f1ad314 100644
> > > > --- a/include/linux/kvm_host.h
> > > > +++ b/include/linux/kvm_host.h
> > > > @@ -205,6 +205,7 @@ struct kvm_io_range {
> > > >  struct kvm_io_bus {
> > > >  	int dev_count;
> > > >  	int ioeventfd_count;
> > > > +	struct rcu_head rcu;
> > > >  	struct kvm_io_range range[];
> > > >  };
> > > >  
> > > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > > index eec82775c5bf..b7d4da8ba0b2 100644
> > > > --- a/virt/kvm/kvm_main.c
> > > > +++ b/virt/kvm/kvm_main.c
> > > > @@ -5924,6 +5924,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(kvm_io_bus_read);
> > > >  
> > > > +static void __free_bus(struct rcu_head *rcu)
> > > > +{
> > > > +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> > > > +
> > > > +	kfree(bus);
> > > > +}
> > > > +
> > > >  int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> > > >  			    int len, struct kvm_io_device *dev)
> > > >  {
> > > > @@ -5962,8 +5969,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> > > >  	memcpy(new_bus->range + i + 1, bus->range + i,
> > > >  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
> > > >  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> > > > -	synchronize_srcu_expedited(&kvm->srcu);
> > > > -	kfree(bus);
> > > > +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
> > > 
> > > I'm 99% certain this will break ABI.  KVM needs to ensure all readers are
> > > guaranteed to see the new device prior to returning to userspace.
> > 
> > I'm not sure I understand this. How can userspace (or a guest VCPU) know that
> > it is executing *after* the MMIO registration, except via some form of
> > synchronization or other ordering of its own? For example, that PCI BAR setup
> > happens as part of PCI probing happening early in device registration in the
> > guest OS, strictly before the MMIO region will be accessed. Otherwise the
> > access is inherently racy against the registration?
> 
> Yes, guest software needs its own synchronization.  What I am pointing out is that,
> very strictly speaking, KVM relies on synchronize_srcu_expedited() to ensure that
> KVM's emulation of MMIO accesses are correctly ordered with respect to the guest's
> synchronization.
> 
> It's legal, though *extremely* uncommon, for KVM to emulate large swaths of guest
> code, including emulated MMIO accesses.  If KVM grabs kvm->buses at the start of
> an emulation block, and then uses that reference to resolve MMIO, it's theoretically
> possible for KVM to mishandle an access due to using a stale bus.

But it doesn't do that? I think I understand now though that you are
concerned about the buses API exposed to the kernel at large. And yes
I see this would be a problem for example if a kvm_get_bus() return
value was cached.

Will and I also had a brainstorm in the office and theorised that a
really "smart" compiler might somehow unroll
handle_invalid_guest_state() 130 times and hoist all the READ_ONCE()s
of the bus to the start. It's impractical, even likely impossible, but
we couldn't outright say it's disallowed by the current enforcements
in the KVM subsystem itself.

> Today, such scenarios are effectively prevented by synchronize_srcu_expedited().
> Using kvm->buses outside of SRCU protection would be a bug (per KVM's locking
> rules), i.e. a large emulation block must take and hold SRCU for its entire
> duration.  And so waiting for all SRCU readers to go away ensures that the new
> kvm->buses will be observed if KVM starts a new emulation block.

Understood. Yes that does make the current code definitely safe in
this regard, just slow!

> AFAIK, the only example of such emulation is x86's handle_invalid_guest_state().
> And in practice, it's probably impossible for the compiler to keep a reference to
> kvm->buses across multiple invocations of kvm_emulate_instruction() while still
> honoring the READ_ONCE() in __rcu_dereference_check().

That certainly stops compiler reordering. But I think I now agree with
your concern about needing an actual memory barrier. I am worried for
example if the guest is relying on an address dependency to
synchronise an MMIO access. For example:
     data = READ_ONCE(*READ_ONCE(mmio_base_addr));

Two loads, ordered by address dependency. But that dependency would
not prevent the access to kvm->buses[idx] from being
hoisted/speculated by the CPU, since it's not data-dependent on the
preceding load...

That said, on x86, loads are ordered anyway.

> But I don't want to simply drop KVM's synchronization, because we need a rule of
> some kind to ensure correct ordering, even if it's only for documentation purposes
> for 99% of cases.  And because the existence of kvm_get_bus() means that it would
> be possible for KVM to grab a long-term reference to kvm->buses and use it across
> emulation of multiple instructions (though actually doing that would be all kinds
> of crazy).

That seems reasonable, in terms of maintaining a fool-proof API to kvm->buses.

> 
> > > I'm quite confident there are other flows that rely on the synchronization,
> > > the vGIC case is simply the one that's documented.
> > 
> > If they're in the kernel they can be fixed? If necessary I'll go audit the callers.
> 
> Yes, I'm sure there's a solution.  Thinking more about this, you make a good
> point that KVM needs to order access with respect to instruction execution, not
> with respect to the start of KVM_RUN.
> 
> For all intents and purposes, holding kvm->srcu across VM-Enter/VM-Exit is
> disallowed (though I don't think this is formally documented), i.e. every
> architecture is guaranteed to do srcu_read_lock() after a VM-Exit, prior to
> reading kvm->buses.  And srcu_read_lock() contains a full smp_mb(), which ensures
> KVM will get a fresh kvm->buses relative to the instruction that triggered the
> exit.
> 
> So for the common case of one-off accesses after a VM-Exit, I think we can simply
> add calls to smp_mb__after_srcu_read_lock() (which is a nop on all architectures)
> to formalize the dependency on reacquiring SRCU.  AFAICT, that would also suffice
> for arm64's use of kvm_io_bus_get_dev().  And then add an explicit barrier of some
> kind in handle_invalid_guest_state()?
> 
> Then to prevent grabbing long-term references to a bus, require kvm->slots_lock
> in kvm_get_bus() (and special case the kfree() in VM destruction).
> 
> So something like this?  I think the barriers would pair with the smp_store_release()
> in rcu_assign_pointer()?

It would certainly mean that kvm->buses would be accessed *after* any
preceding vCPU memory access. Including any that "observed" the
newly-registered IO region, somehow (lock acquisition, read of a flag
or base address, or whatever).

Would it be satisfactory to put a patch along the lines of your
suggestions below into a v2 of this patch series? I have made some
comments below.

> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 4953846cb30d..057fb4ce66b0 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -5861,6 +5861,9 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
>                 if (kvm_test_request(KVM_REQ_EVENT, vcpu))
>                         return 1;
>  
> +               /* Or maybe smp_mb()?  Not sure what this needs to be. */
> +               barrier();
> +

Looks weak but maybe strong enough for x86? Maybe smp_rmb() would be better statement of intention?

>                 if (!kvm_emulate_instruction(vcpu, 0))
>                         return 0;
>  
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3bde4fb5c6aa..066438b6571a 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -967,9 +967,8 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
>  
>  static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
>  {
> -       return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
> -                                     lockdep_is_held(&kvm->slots_lock) ||
> -                                     !refcount_read(&kvm->users_count));
> +       return rcu_dereference_protected(kvm->buses[idx],
> +                                        lockdep_is_held(&kvm->slots_lock));
>  }
>  
>  static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index eec82775c5bf..7b0e881351f7 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1228,7 +1228,8 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>  out_err_no_arch_destroy_vm:
>         WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
>         for (i = 0; i < KVM_NR_BUSES; i++)
> -               kfree(kvm_get_bus(kvm, i));
> +               kfree(rcu_dereference_check(kvm->buses[i], &kvm->srcu,
> +                                           !refcount_read(&kvm->users_count));

srcu_dereference_check()

>         kvm_free_irq_routing(kvm);
>  out_err_no_irq_routing:
>         cleanup_srcu_struct(&kvm->irq_srcu);
> @@ -5847,6 +5848,9 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>                 .len = len,
>         };
>  
> +       /* comment goes here */
> +       smp_mb__after_srcu_read_lock();
> +
>         bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
>         if (!bus)
>                 return -ENOMEM;
> @@ -5866,6 +5870,9 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
>                 .len = len,
>         };
>  
> +       /* comment goes here */
> +       smp_mb__after_srcu_read_lock();
> +
>         bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
>         if (!bus)
>                 return -ENOMEM;
> @@ -6025,6 +6032,9 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
>  
>         srcu_idx = srcu_read_lock(&kvm->srcu);
>  
> +       /* comment goes here */
> +       smp_mb__after_srcu_read_lock();
> +
>         bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
>         if (!bus)
>                 goto out_unlock;
> 
> 

I guess kvm_io_bus_read() is to be done as well? Perhaps the barrier
and dereference should be pulled into a helper with the comment, just
in one place?

 -- Keir (with thanks to Will for brainstorming!)
 

