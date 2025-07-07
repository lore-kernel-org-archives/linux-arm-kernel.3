Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C533DC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 19:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiZtjCuXu6VUlzg7WNmrhQE5Jv+jYJ68gKGt6GVpTiM=; b=Gkd0AK8BjEGv+kNOs5eIFW+tLy
	fwu9jSH54N5cwJq0qPiFDh0F7xMJwz/3doZ/YspcIX5KRowbKR/omECHY8rHsAEVSiz2gY4HZJH4c
	QX1AQQkmBNb9/y7SEjO39UhbYsW6pWipS3242FohrIkC4lGzis8OgcFiQ1l/4ZAYP3UzxBD/Whj6A
	6dVaxrOycRkiJ5IpTQ2PjTHXARL8B3rfHIaYGu5MaLY+g5n4+BwCbgCoeHmYsguZoddOLcJLtiz2Z
	ajKMf+zBMw3ifgcfhSNxrsXkSl1DX1KOfuDA7bryzh9urU35rpiaNMJLhQWHKuTYkKcNPlnZgsq+v
	7jE3ApgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrD7-00000003PFI-2gb0;
	Mon, 07 Jul 2025 19:09:05 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYquH-00000003MCT-23Xo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 18:49:38 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74927be2ec0so5319594b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 11:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751914176; x=1752518976; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XiZtjCuXu6VUlzg7WNmrhQE5Jv+jYJ68gKGt6GVpTiM=;
        b=q9PsuhNnJjtrgQycOvdfxHo0WxwqwdIbPslZw50amjZhcUJn1zHc5STApMFmjkxiDC
         fCmQS6t1RnOmXI0reBc4elmD2Cmav6hjxK62u8n3PCfMnmzEfnwqMqVJec9Tc925m+TY
         DGEJx+0NPUbfORXhuCtdWJnPgVxoGgqdxB6QsZugxXXG1oh6DO2k4kZ1py1iCymmP3yL
         t/XvUrJbKGncHt/I2FRMxBLGCbjyCA8v7g9sAiQR0cTSRKjfK5bqpMWa0Avn5H8DT9tV
         akyajU7d+enr+XNzWw6nHALyLUYvRyhHK30C1EIPrE4W0XN9dTMnU9kq1hFK9NUF2Cur
         DRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751914176; x=1752518976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XiZtjCuXu6VUlzg7WNmrhQE5Jv+jYJ68gKGt6GVpTiM=;
        b=FqWTuXw4nMn7rNsJyv9h/dhbR8JSuM4MGb7RxJrQpPNwL9FmlHDVxs+2eJoWFA5wa8
         KA/KWIpHnIYvevE0dHkK8CBmqmRLfZ/jAj5iSzkvuWGdUAZtsrKOp/wZCTyi8+2UZVLr
         tRTnh4aXcUhVFdf/3+l/KdFCUwJ/3HX71RHqO3MLdCOl4zeUiERwZP3T7hnJQXbbeCm9
         tbGg5+/RF1pZXQEy1dhjjl344Z/iJq/jv5/J9rvx6M42qZ0sxnLFmBbfUGTxGJSxTdji
         FcS/JDqw6h6W4a3OhVieMlIcEt+Qtq3Gl10uOw6kixiPdWCtN/n5IN35psEdS3y5u1Ad
         WjaA==
X-Gm-Message-State: AOJu0Yz4hhlbNcJjDPem5XkiLHHHHgTmFh3HWd0E1e7zDvE5k+zu4eDA
	FNTZYBnI91MluOKoA9Lwcf2r6CjoJMjIFhT5UkHYZzjWjZ8Gnk/1tIAwc2TepKFI0JbsuLCdSYC
	RWMz3Yg==
X-Google-Smtp-Source: AGHT+IHGn8Uxvz+lSthO8udA+t0GcVRzKHgJAJRhGYDyoqQCuBbpAGuq+sZU3f2jJv1XsfzMmaICh7XBBpY=
X-Received: from pfbbj17.prod.google.com ([2002:a05:6a00:3191:b0:746:21fd:3f7a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d83:b0:74b:4cab:f01d
 with SMTP id d2e1a72fcca58-74ce8ab1545mr18533794b3a.12.1751914175836; Mon, 07
 Jul 2025 11:49:35 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:49:34 -0700
In-Reply-To: <aGJf7v9EQoEZiQUk@google.com>
Mime-Version: 1.0
References: <20250624092256.1105524-1-keirf@google.com> <20250624092256.1105524-4-keirf@google.com>
 <aFrANSe6fJOfMpOC@google.com> <aGJf7v9EQoEZiQUk@google.com>
Message-ID: <aGwWvp_JeWe9tIJx@google.com>
Subject: Re: [PATCH 3/3] KVM: Avoid synchronize_srcu() in kvm_io_bus_register_dev()
From: Sean Christopherson <seanjc@google.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Li RongQing <lirongqing@baidu.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_114937_531636_0DEAF5D0 
X-CRM114-Status: GOOD (  40.19  )
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

On Mon, Jun 30, 2025, Keir Fraser wrote:
> On Tue, Jun 24, 2025 at 08:11:49AM -0700, Sean Christopherson wrote:
> > +Li
> > 
> > On Tue, Jun 24, 2025, Keir Fraser wrote:
> > > Device MMIO registration may happen quite frequently during VM boot,
> > > and the SRCU synchronization each time has a measurable effect
> > > on VM startup time. In our experiments it can account for around 25%
> > > of a VM's startup time.
> > > 
> > > Replace the synchronization with a deferred free of the old kvm_io_bus
> > > structure.
> > > 
> > > Signed-off-by: Keir Fraser <keirf@google.com>
> > > ---
> > >  include/linux/kvm_host.h |  1 +
> > >  virt/kvm/kvm_main.c      | 10 ++++++++--
> > >  2 files changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > > index 3bde4fb5c6aa..28a63f1ad314 100644
> > > --- a/include/linux/kvm_host.h
> > > +++ b/include/linux/kvm_host.h
> > > @@ -205,6 +205,7 @@ struct kvm_io_range {
> > >  struct kvm_io_bus {
> > >  	int dev_count;
> > >  	int ioeventfd_count;
> > > +	struct rcu_head rcu;
> > >  	struct kvm_io_range range[];
> > >  };
> > >  
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index eec82775c5bf..b7d4da8ba0b2 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -5924,6 +5924,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
> > >  }
> > >  EXPORT_SYMBOL_GPL(kvm_io_bus_read);
> > >  
> > > +static void __free_bus(struct rcu_head *rcu)
> > > +{
> > > +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> > > +
> > > +	kfree(bus);
> > > +}
> > > +
> > >  int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> > >  			    int len, struct kvm_io_device *dev)
> > >  {
> > > @@ -5962,8 +5969,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
> > >  	memcpy(new_bus->range + i + 1, bus->range + i,
> > >  		(bus->dev_count - i) * sizeof(struct kvm_io_range));
> > >  	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> > > -	synchronize_srcu_expedited(&kvm->srcu);
> > > -	kfree(bus);
> > > +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
> > 
> > I'm 99% certain this will break ABI.  KVM needs to ensure all readers are
> > guaranteed to see the new device prior to returning to userspace.
> 
> I'm not sure I understand this. How can userspace (or a guest VCPU) know that
> it is executing *after* the MMIO registration, except via some form of
> synchronization or other ordering of its own? For example, that PCI BAR setup
> happens as part of PCI probing happening early in device registration in the
> guest OS, strictly before the MMIO region will be accessed. Otherwise the
> access is inherently racy against the registration?

Yes, guest software needs its own synchronization.  What I am pointing out is that,
very strictly speaking, KVM relies on synchronize_srcu_expedited() to ensure that
KVM's emulation of MMIO accesses are correctly ordered with respect to the guest's
synchronization.

It's legal, though *extremely* uncommon, for KVM to emulate large swaths of guest
code, including emulated MMIO accesses.  If KVM grabs kvm->buses at the start of
an emulation block, and then uses that reference to resolve MMIO, it's theoretically
possible for KVM to mishandle an access due to using a stale bus.

Today, such scenarios are effectively prevented by synchronize_srcu_expedited().
Using kvm->buses outside of SRCU protection would be a bug (per KVM's locking
rules), i.e. a large emulation block must take and hold SRCU for its entire
duration.  And so waiting for all SRCU readers to go away ensures that the new
kvm->buses will be observed if KVM starts a new emulation block.

AFAIK, the only example of such emulation is x86's handle_invalid_guest_state().
And in practice, it's probably impossible for the compiler to keep a reference to
kvm->buses across multiple invocations of kvm_emulate_instruction() while still
honoring the READ_ONCE() in __rcu_dereference_check().
 
But I don't want to simply drop KVM's synchronization, because we need a rule of
some kind to ensure correct ordering, even if it's only for documentation purposes
for 99% of cases.  And because the existence of kvm_get_bus() means that it would
be possible for KVM to grab a long-term reference to kvm->buses and use it across
emulation of multiple instructions (though actually doing that would be all kinds
of crazy).

> > I'm quite confident there are other flows that rely on the synchronization,
> > the vGIC case is simply the one that's documented.
> 
> If they're in the kernel they can be fixed? If necessary I'll go audit the callers.

Yes, I'm sure there's a solution.  Thinking more about this, you make a good
point that KVM needs to order access with respect to instruction execution, not
with respect to the start of KVM_RUN.

For all intents and purposes, holding kvm->srcu across VM-Enter/VM-Exit is
disallowed (though I don't think this is formally documented), i.e. every
architecture is guaranteed to do srcu_read_lock() after a VM-Exit, prior to
reading kvm->buses.  And srcu_read_lock() contains a full smp_mb(), which ensures
KVM will get a fresh kvm->buses relative to the instruction that triggered the
exit.

So for the common case of one-off accesses after a VM-Exit, I think we can simply
add calls to smp_mb__after_srcu_read_lock() (which is a nop on all architectures)
to formalize the dependency on reacquiring SRCU.  AFAICT, that would also suffice
for arm64's use of kvm_io_bus_get_dev().  And then add an explicit barrier of some
kind in handle_invalid_guest_state()?

Then to prevent grabbing long-term references to a bus, require kvm->slots_lock
in kvm_get_bus() (and special case the kfree() in VM destruction).

So something like this?  I think the barriers would pair with the smp_store_release()
in rcu_assign_pointer()?

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 4953846cb30d..057fb4ce66b0 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -5861,6 +5861,9 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
                if (kvm_test_request(KVM_REQ_EVENT, vcpu))
                        return 1;
 
+               /* Or maybe smp_mb()?  Not sure what this needs to be. */
+               barrier();
+
                if (!kvm_emulate_instruction(vcpu, 0))
                        return 0;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..066438b6571a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -967,9 +967,8 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
 
 static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 {
-       return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
-                                     lockdep_is_held(&kvm->slots_lock) ||
-                                     !refcount_read(&kvm->users_count));
+       return rcu_dereference_protected(kvm->buses[idx],
+                                        lockdep_is_held(&kvm->slots_lock));
 }
 
 static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index eec82775c5bf..7b0e881351f7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1228,7 +1228,8 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_arch_destroy_vm:
        WARN_ON_ONCE(!refcount_dec_and_test(&kvm->users_count));
        for (i = 0; i < KVM_NR_BUSES; i++)
-               kfree(kvm_get_bus(kvm, i));
+               kfree(rcu_dereference_check(kvm->buses[i], &kvm->srcu,
+                                           !refcount_read(&kvm->users_count));
        kvm_free_irq_routing(kvm);
 out_err_no_irq_routing:
        cleanup_srcu_struct(&kvm->irq_srcu);
@@ -5847,6 +5848,9 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
                .len = len,
        };
 
+       /* comment goes here */
+       smp_mb__after_srcu_read_lock();
+
        bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
        if (!bus)
                return -ENOMEM;
@@ -5866,6 +5870,9 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
                .len = len,
        };
 
+       /* comment goes here */
+       smp_mb__after_srcu_read_lock();
+
        bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
        if (!bus)
                return -ENOMEM;
@@ -6025,6 +6032,9 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
 
        srcu_idx = srcu_read_lock(&kvm->srcu);
 
+       /* comment goes here */
+       smp_mb__after_srcu_read_lock();
+
        bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
        if (!bus)
                goto out_unlock;



