Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213BAE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 16:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WI6XVVgb/sjOKhoe/ZrjdLzkj8wj+eqRqsuqmM7G5c=; b=RDxjVQfHkMea0komiemCcKeaB0
	0iv8oP2SwpWB1RoQgexr1wbfp1+4N539Rm2OVJV+w5rRnJ7+4SfFOuYzRiia3PzSb7XsWAC6BVOlO
	wCpEGqT24gsYmcbG3j/eWnxfg5WrltlOdpMgT1BGH3iVaG1tYdf8Ah8+YqlEpqMhutqqt2YIWOoOu
	3KbSt1hxmvvMROu8m15ncvOV1eQLV4/h2H4lroGfmUmzxct1GTntrFhr1XlDGzEtb4SEIrnQUTrl3
	+R3T4nD6OQPWrurso/JE/uDmCxEMU4HIyl4cZDKMHeiwPn2CbdkvJupqv3jGM6F7w7rE+VQ+e4kFw
	xl/GQ4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsk0K-0000000A2mi-0KbN;
	Wed, 18 Feb 2026 16:02:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsk0E-0000000A2jl-0B7Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 16:02:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4420205f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771430531; x=1772035331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6WI6XVVgb/sjOKhoe/ZrjdLzkj8wj+eqRqsuqmM7G5c=;
        b=iJXIosS0UN4ODsIrQTsgSq3xIrz2kA0kGUruIlYscELVreb8pDQTssRIyVdf08Oho7
         6863zBcK3N9+xO1OULePofAYkmJGD6nxbQ2MffqBvMP4om7tL/lo56/mj5Ce3bU5yDYf
         AYIDN/QWK7iBsnL9hC0iG8pM17baRtUDNfQ5oP2wXZLnSvyvAkHKcWO/Y+wpAPolzGVh
         wLwD4c3qHgBFVNIXMp2tGB7HNwqCQE62TiqzChMvLD2UxNhOpCwjITsTi8Ud1wXHA+CM
         lvwfoNP/B/srE5n/krDdyN0C7l633Sx/L8jSjS4VtPacEZKbN2sZ056Wi53a8TCcVew9
         S3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771430531; x=1772035331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WI6XVVgb/sjOKhoe/ZrjdLzkj8wj+eqRqsuqmM7G5c=;
        b=xIhZIXem8mgdZRPXF9rou2fiXjinruvSWV6hAkdzLHVuU4gfOBCEPDpx1mAUN/GQqN
         PjO5oLu8vw56IYko3WvbTSbExpaCa21gYF9We5IRUd+o49GJV+m5nDYs2jdKko5vPs+g
         1XPO3pWtE84fnkTJq7Rb4s00rEvUXx81+ivlOwAzLniQjX2GIVIxfvoQMKFOZqFgrLct
         WS1O7vnbYTt31EFmEQCAMsVorKQKmza8CxxxYll2cmhib4W+uFGtkKhIGnTE/dhoeu6v
         81/lTOvm7x7mPTF3y9kbn0dHrjJPLOfA17/6JcUaIMhV476aK9DX3YcZ5haiYPIkpfBc
         /6LA==
X-Forwarded-Encrypted: i=1; AJvYcCXHcbN7ZxT41o1j+xPmtYa7F+QZYEXLtse9boMc6wSDBRhmdvUk0kSzYs/G1JU8cpmlpos+gIWmFL6QbT4Yn3qz@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJ4evcSLv/UzLu0ytOXwYKKqfbK09C2imUDIGZO7s+wF2BzAv
	s2hfIdQIfhpsQqEneVrloDP5jrQ2uxNNTaCkhQpZcG1jdVp0seRT1TylVCNNLe15fA==
X-Gm-Gg: AZuq6aJfLo5be6akx3Ls/0sXBe97oS2c3USncl5Fbkq4HSSWiHB1rOv14wS2YMe/Zxl
	HMazohwfcm1K1wlBCWd75jf6mxHB/A/dKsXYSJOdIu88i0KTnafIWwtSyRUwTUf426jPA9f44EJ
	CX4J0bZsX40n+2PfPvdjaq3aM0QGX/fKXLkbKZ1EWE4ltfI/ogywodPfcOCFkwhmooKADXHiEBU
	mwOc3Kcdeat2cMGWN3R/vlfItOd1rpfCz/58OAxvSf6OrvVG7PqFkRNkxM+azFAwpleYkXOUCZQ
	3sN0Isc1YABgMag9AEyAOYY84muAuFZ/gmCjMQTmH0x22AOk2oZFWGdvIKI2JywQmrX+GnBcTix
	jgtInW8wkv5eAVR/OFTQ/l6paTI7RFyWEvwyv6iynEoRDDMa+Tx8K40IkKxcEYp9iTPKldWQ3vW
	swZQazJXKQvRxFSuNl8pvRbKfSlFj3SHu1BcF2qlr6rQvnycbxXhJ2RxMmdeSHl0SrjtQEO/A=
X-Received: by 2002:a05:6000:2510:b0:42b:3246:1681 with SMTP id ffacd0b85a97d-4379db64295mr25862256f8f.18.1771430529420;
        Wed, 18 Feb 2026 08:02:09 -0800 (PST)
Received: from google.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac800esm45562165f8f.27.2026.02.18.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 08:02:08 -0800 (PST)
Date: Wed, 18 Feb 2026 16:02:05 +0000
From: Keir Fraser <keirf@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: Sean Christopherson <seanjc@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Li RongQing <lirongqing@baidu.com>
Subject: Re: [PATCH v4 4/4] KVM: Avoid synchronize_srcu() in
 kvm_io_bus_register_dev()
Message-ID: <aZXifSagpbj4CjBn@google.com>
References: <20250909100007.3136249-1-keirf@google.com>
 <20250909100007.3136249-5-keirf@google.com>
 <a84ddba8-12da-489a-9dd1-ccdf7451a1ba@amazon.com>
 <aY-x0OlJQEqInyNF@google.com>
 <dcbd7a58-c961-4510-ae48-ef7fd4f4d75c@amazon.com>
 <aZS8XXOW7vhMkNWQ@google.com>
 <162cedc3-cd6c-494c-b39e-daadfbd6d8db@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162cedc3-cd6c-494c-b39e-daadfbd6d8db@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_080214_145592_DF203464 
X-CRM114-Status: GOOD (  41.63  )
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

On Wed, Feb 18, 2026 at 12:55:11PM +0000, Nikita Kalyazin wrote:
> 
> 
> On 17/02/2026 19:07, Sean Christopherson wrote:
> > On Mon, Feb 16, 2026, Nikita Kalyazin wrote:
> > > On 13/02/2026 23:20, Sean Christopherson wrote:
> > > > On Fri, Feb 13, 2026, Nikita Kalyazin wrote:
> > > > > I am not aware of way to make it fast for both use cases and would be more
> > > > > than happy to hear about possible solutions.
> > > > 
> > > > What if we key off of vCPUS being created?  The motivation for Keir's change was
> > > > to avoid stalling during VM boot, i.e. *after* initial VM creation.
> > > 
> > > It doesn't work as is on x86 because the delay we're seeing occurs after the
> > > created_cpus gets incremented
> > 
> > I don't follow, the suggestion was to key off created_vcpus in
> > kvm_io_bus_register_dev(), not in kvm_swap_active_memslots().  I can totally
> > imagine the patch not working, but the ordering in kvm_vm_ioctl_create_vcpu()
> > should be largely irrelevant.
> 
> Yes, you're right, it's irrelevant.  I had made the change in
> kvm_io_bus_register_dev() like proposed, but have no idea how I couldn't see
> the effect.  I retested it now and it's obvious that it works on x86.  Sorry
> for the confusion.
> 
> > 
> > Probably a moot point though.
> 
> Yes, this will not solve the problem on ARM.

Sorry for being late to this thread. I'm a bit confused now. Did
Sean's original patch (reintroducing the old logic, based on whether
any vcpus have been created) work for both/either/neither arch? I
would have expected it to work for both ARM and X86, despite the
offending synchronize_srcu() not being in the vcpu-creation ioctl on
ARM, and I think that is finally what your testing seems to show? If
so then that seems the pragmatic if somewhat ugly way forward.

 Cheers,
  Keir


> > 
> > > so it doesn't allow to differentiate the two
> > > cases (below is kvm_vm_ioctl_create_vcpu):
> > > 
> > >        kvm->created_vcpus++; // <===== incremented here
> > >        mutex_unlock(&kvm->lock);
> > > 
> > >        vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
> > >        if (!vcpu) {
> > >                r = -ENOMEM;
> > >                goto vcpu_decrement;
> > >        }
> > > 
> > >        BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
> > >        page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> > >        if (!page) {
> > >                r = -ENOMEM;
> > >                goto vcpu_free;
> > >        }
> > >        vcpu->run = page_address(page);
> > > 
> > >        kvm_vcpu_init(vcpu, kvm, id);
> > > 
> > >        r = kvm_arch_vcpu_create(vcpu); // <===== the delay is here
> > > 
> > > 
> > > firecracker   583 [001]   151.297145: probe:synchronize_srcu_expedited:
> > > (ffffffff813e5cf0)
> > >      ffffffff813e5cf1 synchronize_srcu_expedited+0x1 ([kernel.kallsyms])
> > >      ffffffff81234986 kvm_swap_active_memslots+0x136 ([kernel.kallsyms])
> > >      ffffffff81236cdd kvm_set_memslot+0x1cd ([kernel.kallsyms])
> > >      ffffffff81237518 kvm_set_memory_region.part.0+0x478 ([kernel.kallsyms])
> > >      ffffffff81264dbc __x86_set_memory_region+0xec ([kernel.kallsyms])
> > >      ffffffff8127e2dc kvm_alloc_apic_access_page+0x5c ([kernel.kallsyms])
> > >      ffffffff812b9ed3 vmx_vcpu_create+0x193 ([kernel.kallsyms])
> > >      ffffffff8126788a kvm_arch_vcpu_create+0x1da ([kernel.kallsyms])
> > >      ffffffff8123c54c kvm_vm_ioctl+0x5fc ([kernel.kallsyms])
> > >      ffffffff8167b331 __x64_sys_ioctl+0x91 ([kernel.kallsyms])
> > >      ffffffff8251a89c do_syscall_64+0x4c ([kernel.kallsyms])
> > >      ffffffff8100012b entry_SYSCALL_64_after_hwframe+0x76 ([kernel.kallsyms])
> > >                6512de ioctl+0x32 (/mnt/host/firecracker)
> > >                 d99a7 std::rt::lang_start+0x37 (/mnt/host/firecracker)
> > > 
> > > Also, given that it stumbles after the KVM_CREATE_VCPU on ARM (in
> > > KVM_SET_USER_MEMORY_REGION), it doesn't look like a universal solution.
> > 
> > Hmm.  Under the hood, __synchronize_srcu() itself uses __call_srcu, so I _think_
> > the only practical difference (aside from waiting, obviously) between call_srcu()
> > and synchronize_srcu_expedited() with respect to "transferring" grace period
> > latency is that using call_srcu() could start a normal, non-expedited grace period.
> > 
> > IIUC, SRCU has best-effort logic to shift in-flight non-expedited grace periods
> > to expedited mode, but if the normal grace period has already started the timer
> > for the delayed invocation of process_srcu(), then SRCU will still wait for one
> > jiffie, i.e. won't immediately queue the work.
> > 
> > I have no idea if this is sane and/or acceptable, but before looping in Paul and
> > others, can you try this to see if it helps?
> 
> That's exactly what I tried myself before and it didn't help, probably for
> the reason you mentioned above (a normal GP being already started).
> 
> > 
> > diff --git a/include/linux/srcu.h b/include/linux/srcu.h
> > index 344ad51c8f6c..30437dc8d818 100644
> > --- a/include/linux/srcu.h
> > +++ b/include/linux/srcu.h
> > @@ -89,6 +89,8 @@ void __srcu_read_unlock(struct srcu_struct *ssp, int idx) __releases(ssp);
> > 
> >   void call_srcu(struct srcu_struct *ssp, struct rcu_head *head,
> >                  void (*func)(struct rcu_head *head));
> > +void call_srcu_expedited(struct srcu_struct *ssp, struct rcu_head *rhp,
> > +                        rcu_callback_t func);
> >   void cleanup_srcu_struct(struct srcu_struct *ssp);
> >   void synchronize_srcu(struct srcu_struct *ssp);
> > 
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index ea3f128de06f..03333b079092 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -1493,6 +1493,13 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
> >   }
> >   EXPORT_SYMBOL_GPL(call_srcu);
> > 
> > +void call_srcu_expedited(struct srcu_struct *ssp, struct rcu_head *rhp,
> > +                        rcu_callback_t func)
> > +{
> > +       __call_srcu(ssp, rhp, func, rcu_gp_is_normal());
> > +}
> > +EXPORT_SYMBOL_GPL(call_srcu_expedited);
> > +
> >   /*
> >    * Helper function for synchronize_srcu() and synchronize_srcu_expedited().
> >    */
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 737b74b15bb5..26215f98c98f 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -6036,7 +6036,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> >          memcpy(new_bus->range + i + 1, bus->range + i,
> >                  (bus->dev_count - i) * sizeof(struct kvm_io_range));
> >          rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> > -       call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
> > +       call_srcu_expedited(&kvm->srcu, &bus->rcu, __free_bus);
> > 
> >          return 0;
> >   }
> 

