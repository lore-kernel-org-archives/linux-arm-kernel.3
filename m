Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14058CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXiQUtZeQmAEP0ZEmjMWqTXf4XIHOoKpgb4lVMRg2uA=; b=HDHE506N8blw90ikB/K2tEiJtH
	xh/65DHD8thcZoFoCrISSN9u/wIKRX76PCpaGBBe4+sgsCSeA2BGKlx76fCultY17YSt7GJ5Y+km1
	RiHj+3lFO1rBHyIzRb8FHgn0uVpmdbK6Nu5cK8vJgmQmwI9/qV37SX9RLPFVUXejXcAR5evKnTHTm
	3qOM1xbGUf92V1uTrRhKbfMUftKX+ypfihhqIIZ1urt8amWWAf8832G6weJeYwEivFpNreglaoze7
	ZdrLzoiUr88kFa9W4eRtx0HifvuBbzjuwyriVyvyl02UtT0OO2qTAZFd7a5gd6GRdNOQ7jB1mHvae
	9Hnl5/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7D5-0000000EHVf-00Ba;
	Mon, 15 Jun 2026 13:18:39 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7CW-0000000EHOM-0nh7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 13:18:37 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51765331535so943041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 06:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781529483; cv=none;
        d=google.com; s=arc-20240605;
        b=QNpMdKxa3v/kwlDH+9q6iJreh81GUR8NsQWX3MP2L3QXberlZ/kQXaiI3yt8C5cuvm
         4EA7ZGjAzyVKFw14sOJhWBJEyZh5jhYOvTj+u+3KPufRX34CD0d3kJ5QNUQju/9NQnk7
         K1K3NTSEqbYsOzedBcuwtCnsnFsuH1fB6rE2u64EVLmKxUE96pKdPtDzJIMzFmvnV7fA
         2t/WLlnzVzn7CHr9DYED/Uxqqx+R+6wra+gH28PWCcmTo7GzgKXa0j4nY+dFl+aqlWXW
         LQnHfkIfAFUXxDUiRYg32Km/+2DXltuSdkk0NZD/Wn2cWukF/yKvBoPBd9bjKfldZa9l
         klYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uXiQUtZeQmAEP0ZEmjMWqTXf4XIHOoKpgb4lVMRg2uA=;
        fh=JKERrpimSEmZnrRh4LSer79A6aQWxykvQCQFdjnfIH4=;
        b=c7NiYVaH3iK6XtK7ujn8kJU0ljCQFA9PMTWzgR/BmOjMTHpWnGCW883oWH7Gbp8fY+
         TemDavJl5yPweQQ6twXsqrGn4YUPz/XkoSr86bkh09BEu4pxzUD50hm3O6W64FwFailm
         C7wGXskfDYfh/EzBSwiSBSMztIiK6Px8i806KCwtZr7paep1LynZI/I+mzGg1xU6g1jA
         0hdDJMGO/8pYhNTsdZD4OYT3wtwgMt7mQShseYhd9Xgycby06amzxjn2YwV7Uk5AdKkD
         MmE7mjP56LtuViGJVoGBJiB+6QMbH/F0MXgYNivv32JHRJBPjZzN5J6qomnza4AL/9GS
         JKjA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781529483; x=1782134283; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uXiQUtZeQmAEP0ZEmjMWqTXf4XIHOoKpgb4lVMRg2uA=;
        b=vBrmCBjN/BiLWju8at9W/qXYV5hWYKGoCtc0zQeILN8qKpCx7nRTqftQq9w7gP88ta
         8gDsTfjmhOuAlrnCbYslr33ab8HwqPCGizYZcJDWnLBZ0RBcriHBYgDw2iIWkMqENUEc
         YSXIIToLJWskyZwhN/6qBLtHbY/JQgBCPPATheFiIQFnTt60uvkGitvIK2kAk/N2TJvS
         btqXEDHUpPdtJiQ+kib6Xn+r3xClVZ3Z62Fiiiz74IX5zddC9N8lLppJyh04FpO6gt5n
         ZunwvaKr6dxLn4eyLDu1hPmRYCIocIgTFxBkNdHG+RT8e0OGE9TT2PfDF21lyJjzZYd/
         gIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529483; x=1782134283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXiQUtZeQmAEP0ZEmjMWqTXf4XIHOoKpgb4lVMRg2uA=;
        b=D1bHGL7gZNcnY9Nyq6SyACc76Xm4tvNrfrMDEexZFeJmq1nrlYWMtpF8pzbP+WcDpy
         3ciJVO6JrVcbHqpJO2TR7l+Hx85wK80LjZW81qptBHmqywMSL/9HrCBwKKafpbkGyc8y
         /kHBATdZ/rFt9lKMbQQCq6CSsaS95BZtpvHM4APg01N9acZ/KQ4mCej27JklDdnWsceu
         I7DqOGBnF97R8YQF+XByS3YZRi7s2G04ljWWrRuu446fT930+aYPwP3SQi0dw1hCqhus
         AP0niUa11cx4UJBirisonfCQf1IYWyu8YFcWIG/HsmJwVtmUsbA1w4E6yMSkIOFbHABy
         oG/A==
X-Forwarded-Encrypted: i=1; AFNElJ923HMEP0yEA0hX2tx9EZGXcBhFNHWuK0Q6MTkOkKVwpvH+b9Q8tm16XkcPlQd9OUiSuKGK+pVeaRBbT6o2JjeS@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw1Ry+f0o9eLF+mKGHzM9uDbDcEJbcV0KU3Gn7pFfcU4Uuscaz
	mLvMcmBrTJAHeuQc6i41BPpCUhkoBoB6fIZTsvVXghWDRHAlvtwDt2W8icFFhncsHcw3a1DMTXC
	692h+SYrxfGOxUeT+zQgdN4jUMkzDbWTTzJdVxMb+
X-Gm-Gg: Acq92OG6aupx1jV92Mrvwd+hfC8BDKmFkYyyCCI4P1KK8PvHDQ0fcR2Z8ncLkNXEgs4
	pg3EDoXe4B3+qeSloJmdbUMd30iVln3JvqPqSHMV+3gzAujwSGxjS3Wwp4ZW6l+5mEVEfNk3Fks
	3yrbaPSOtdJbLjOn1ia7ND3l6FiG4CcSWx++JtrpiL4qqyudYKY1oLKZOrWBXykySre90GoZXCn
	A7tZr13aFjZxst87Q68ks+gmObaK6ijj4xQn4q1DXg6s137bNq1mMwGtIWU02NFnBKjImqEGR6p
	dfOIAmIE
X-Received: by 2002:a05:622a:248e:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-519872e7656mr1540691cf.2.1781529482065; Mon, 15 Jun 2026
 06:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-4-tabba@google.com>
 <ai_3Hlf8CakQ7ESQ@google.com>
In-Reply-To: <ai_3Hlf8CakQ7ESQ@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 14:17:25 +0100
X-Gm-Features: AVVi8CeyrAKW-cv791O6i-EeRBkuB2A92LrYUKT1_oKuiNIQXb3fwr9dG8LEDbA
Message-ID: <CA+EHjTxxGChwio0tQym5VEHCUbC8yjzVZbNuzz5qN9V=WWApKw@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] KVM: arm64: Use guard()/scoped_guard() in arm64
 KVM EL1 code
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Per Larsen <perlarsen@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Hyunwoo Kim <imv4bel@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_061826_901062_C56F62F5 
X-CRM114-Status: GOOD (  32.23  )
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

On Mon, 15 Jun 2026 at 13:59, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> On Fri, Jun 12, 2026 at 07:59:17AM +0100, tabba@google.com wrote:
> > Convert the manual mutex_lock()/spin_lock() pairs in
> > arch/arm64/kvm/{pkvm,arm,mmu,reset,psci}.c to guard(mutex),
> > guard(spinlock) and scoped_guard(), dropping unlock-only goto labels in
> > favour of direct returns. Centralised cleanup gotos that still serve
> > other resources are preserved.
> >
> > reset.c uses scoped_guard() rather than guard() so the lock covers only
> > the small read/update window inside kvm_reset_vcpu(), leaving the rest
> > of the function outside the critical section.
>
> I believe in that case unless it really helps with cleaning resources, there's
> not much point using scoped_guard().
>
> I would keep it as is.

Ack.

>
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/arm.c   | 14 +++-----
> >  arch/arm64/kvm/mmu.c   | 80 +++++++++++++++---------------------------
> >  arch/arm64/kvm/pkvm.c  | 26 ++++++--------
> >  arch/arm64/kvm/psci.c  | 17 ++++-----
> >  arch/arm64/kvm/reset.c |  8 ++---
> >  5 files changed, 53 insertions(+), 92 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 9453321ef8c6..c9f36932c980 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -793,9 +793,7 @@ int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
> >  int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
> >                                   struct kvm_mp_state *mp_state)
> >  {
> > -     int ret = 0;
> > -
> > -     spin_lock(&vcpu->arch.mp_state_lock);
> > +     guard(spinlock)(&vcpu->arch.mp_state_lock);
> >
> >       switch (mp_state->mp_state) {
> >       case KVM_MP_STATE_RUNNABLE:
> > @@ -808,12 +806,10 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
> >               kvm_arm_vcpu_suspend(vcpu);
> >               break;
> >       default:
> > -             ret = -EINVAL;
> > +             return -EINVAL;
> >       }
> >
> > -     spin_unlock(&vcpu->arch.mp_state_lock);
> > -
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  /**
> > @@ -1726,15 +1722,13 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
> >       /*
> >        * Handle the "start in power-off" case.
> >        */
> > -     spin_lock(&vcpu->arch.mp_state_lock);
> > +     guard(spinlock)(&vcpu->arch.mp_state_lock);
> >
> >       if (power_off)
> >               __kvm_arm_vcpu_power_off(vcpu);
> >       else
> >               WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_RUNNABLE);
> >
> > -     spin_unlock(&vcpu->arch.mp_state_lock);
> > -
> >       return 0;
> >  }
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 4da9281312eb..d18f4ce7ceae 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -391,13 +391,13 @@ static void stage2_flush_vm(struct kvm *kvm)
> >   */
> >  void __init free_hyp_pgds(void)
> >  {
> > -     mutex_lock(&kvm_hyp_pgd_mutex);
> > -     if (hyp_pgtable) {
> > -             kvm_pgtable_hyp_destroy(hyp_pgtable);
> > -             kfree(hyp_pgtable);
> > -             hyp_pgtable = NULL;
> > -     }
> > -     mutex_unlock(&kvm_hyp_pgd_mutex);
> > +     guard(mutex)(&kvm_hyp_pgd_mutex);
> > +     if (!hyp_pgtable)
> > +             return;
> > +
> > +     kvm_pgtable_hyp_destroy(hyp_pgtable);
> > +     kfree(hyp_pgtable);
> > +     hyp_pgtable = NULL;
> >  }
> >
> >  static bool kvm_host_owns_hyp_mappings(void)
> > @@ -424,16 +424,11 @@ static bool kvm_host_owns_hyp_mappings(void)
> >  int __create_hyp_mappings(unsigned long start, unsigned long size,
> >                         unsigned long phys, enum kvm_pgtable_prot prot)
> >  {
> > -     int err;
> > -
> >       if (WARN_ON(!kvm_host_owns_hyp_mappings()))
> >               return -EINVAL;
> >
> > -     mutex_lock(&kvm_hyp_pgd_mutex);
> > -     err = kvm_pgtable_hyp_map(hyp_pgtable, start, size, phys, prot);
> > -     mutex_unlock(&kvm_hyp_pgd_mutex);
> > -
> > -     return err;
> > +     guard(mutex)(&kvm_hyp_pgd_mutex);
> > +     return kvm_pgtable_hyp_map(hyp_pgtable, start, size, phys, prot);
> >  }
> >
> >  static phys_addr_t kvm_kaddr_to_phys(void *kaddr)
> > @@ -481,56 +476,42 @@ static int share_pfn_hyp(u64 pfn)
> >  {
> >       struct rb_node **node, *parent;
> >       struct hyp_shared_pfn *this;
> > -     int ret = 0;
> >
> > -     mutex_lock(&hyp_shared_pfns_lock);
> > +     guard(mutex)(&hyp_shared_pfns_lock);
> >       this = find_shared_pfn(pfn, &node, &parent);
> >       if (this) {
> >               this->count++;
> > -             goto unlock;
> > +             return 0;
> >       }
> >
> >       this = kzalloc_obj(*this);
> > -     if (!this) {
> > -             ret = -ENOMEM;
> > -             goto unlock;
> > -     }
> > +     if (!this)
> > +             return -ENOMEM;
> >
> >       this->pfn = pfn;
> >       this->count = 1;
> >       rb_link_node(&this->node, parent, node);
> >       rb_insert_color(&this->node, &hyp_shared_pfns);
> > -     ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> > -unlock:
> > -     mutex_unlock(&hyp_shared_pfns_lock);
> > -
> > -     return ret;
> > +     return kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
> >  }
> >
> >  static int unshare_pfn_hyp(u64 pfn)
> >  {
> >       struct rb_node **node, *parent;
> >       struct hyp_shared_pfn *this;
> > -     int ret = 0;
> >
> > -     mutex_lock(&hyp_shared_pfns_lock);
> > +     guard(mutex)(&hyp_shared_pfns_lock);
> >       this = find_shared_pfn(pfn, &node, &parent);
> > -     if (WARN_ON(!this)) {
> > -             ret = -ENOENT;
> > -             goto unlock;
> > -     }
> > +     if (WARN_ON(!this))
> > +             return -ENOENT;
> >
> >       this->count--;
> >       if (this->count)
> > -             goto unlock;
> > +             return 0;
> >
> >       rb_erase(&this->node, &hyp_shared_pfns);
> >       kfree(this);
> > -     ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
> > -unlock:
> > -     mutex_unlock(&hyp_shared_pfns_lock);
> > -
> > -     return ret;
> > +     return kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn);
> >  }
> >
> >  int kvm_share_hyp(void *from, void *to)
> > @@ -655,7 +636,7 @@ int hyp_alloc_private_va_range(size_t size, unsigned long *haddr)
> >       unsigned long base;
> >       int ret = 0;
> >
> > -     mutex_lock(&kvm_hyp_pgd_mutex);
> > +     guard(mutex)(&kvm_hyp_pgd_mutex);
> >
> >       /*
> >        * This assumes that we have enough space below the idmap
> > @@ -670,8 +651,6 @@ int hyp_alloc_private_va_range(size_t size, unsigned long *haddr)
> >       base = io_map_base - size;
> >       ret = __hyp_alloc_private_va_range(base);
> >
> > -     mutex_unlock(&kvm_hyp_pgd_mutex);
> > -
> >       if (!ret)
> >               *haddr = base;
> >
> > @@ -714,17 +693,16 @@ int create_hyp_stack(phys_addr_t phys_addr, unsigned long *haddr)
> >       size_t size;
> >       int ret;
> >
> > -     mutex_lock(&kvm_hyp_pgd_mutex);
> > -     /*
> > -      * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
> > -      * an alignment of our allocation on the order of the size.
> > -      */
> > -     size = NVHE_STACK_SIZE * 2;
> > -     base = ALIGN_DOWN(io_map_base - size, size);
> > +     scoped_guard(mutex, &kvm_hyp_pgd_mutex) {
> > +             /*
> > +              * Efficient stack verification using the NVHE_STACK_SHIFT bit implies
> > +              * an alignment of our allocation on the order of the size.
> > +              */
> > +             size = NVHE_STACK_SIZE * 2;
> > +             base = ALIGN_DOWN(io_map_base - size, size);
> >
> > -     ret = __hyp_alloc_private_va_range(base);
> > -
> > -     mutex_unlock(&kvm_hyp_pgd_mutex);
> > +             ret = __hyp_alloc_private_va_range(base);
> > +     }
>
> Not sure about that one, it's not shorter, doesn't remove any label but add
> a tab.

Ack.


>
> >
> >       if (ret) {
> >               kvm_err("Cannot allocate hyp stack guard page\n");
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index 053e4f733e4b..a39111b70f9f 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> > @@ -190,39 +190,33 @@ bool pkvm_hyp_vm_is_created(struct kvm *kvm)
> >
> >  int pkvm_create_hyp_vm(struct kvm *kvm)
> >  {
> > -     int ret = 0;
> > -
> >       /*
> >        * Synchronise with kvm_arch_prepare_memory_region(), as we
> >        * prevent memslot modifications on a pVM that has been run.
> >        */
> > -     mutex_lock(&kvm->slots_lock);
> > -     mutex_lock(&kvm->arch.config_lock);
> > -     if (!pkvm_hyp_vm_is_created(kvm))
> > -             ret = __pkvm_create_hyp_vm(kvm);
> > -     mutex_unlock(&kvm->arch.config_lock);
> > -     mutex_unlock(&kvm->slots_lock);
> > +     guard(mutex)(&kvm->slots_lock);
> > +     guard(mutex)(&kvm->arch.config_lock);
> >
> > -     return ret;
> > +     if (!pkvm_hyp_vm_is_created(kvm))
> > +             return __pkvm_create_hyp_vm(kvm);
> > +
> > +     return 0;
> >  }
> >
> >  int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
> >  {
> > -     int ret = 0;
> > +     guard(mutex)(&vcpu->kvm->arch.config_lock);
> >
> > -     mutex_lock(&vcpu->kvm->arch.config_lock);
> >       if (!vcpu_get_flag(vcpu, VCPU_PKVM_FINALIZED))
> > -             ret = __pkvm_create_hyp_vcpu(vcpu);
> > -     mutex_unlock(&vcpu->kvm->arch.config_lock);
> > +             return __pkvm_create_hyp_vcpu(vcpu);
> >
> > -     return ret;
> > +     return 0;
> >  }
> >
> >  void pkvm_destroy_hyp_vm(struct kvm *kvm)
> >  {
> > -     mutex_lock(&kvm->arch.config_lock);
> > +     guard(mutex)(&kvm->arch.config_lock);
> >       __pkvm_destroy_hyp_vm(kvm);
> > -     mutex_unlock(&kvm->arch.config_lock);
> >  }
> >
> >  int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
> > diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
> > index 3b5dbe9a0a0e..e1389c525e9d 100644
> > --- a/arch/arm64/kvm/psci.c
> > +++ b/arch/arm64/kvm/psci.c
> > @@ -62,7 +62,6 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
> >       struct vcpu_reset_state *reset_state;
> >       struct kvm *kvm = source_vcpu->kvm;
> >       struct kvm_vcpu *vcpu = NULL;
> > -     int ret = PSCI_RET_SUCCESS;
> >       unsigned long cpu_id;
> >
> >       cpu_id = smccc_get_arg1(source_vcpu);
> > @@ -78,14 +77,13 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
> >       if (!vcpu)
> >               return PSCI_RET_INVALID_PARAMS;
> >
> > -     spin_lock(&vcpu->arch.mp_state_lock);
> > +     guard(spinlock)(&vcpu->arch.mp_state_lock);
> > +
> >       if (!kvm_arm_vcpu_stopped(vcpu)) {
> >               if (kvm_psci_version(source_vcpu) != KVM_ARM_PSCI_0_1)
> > -                     ret = PSCI_RET_ALREADY_ON;
> > +                     return PSCI_RET_ALREADY_ON;
> >               else
> > -                     ret = PSCI_RET_INVALID_PARAMS;
> > -
> > -             goto out_unlock;
> > +                     return PSCI_RET_INVALID_PARAMS;
> >       }
> >
> >       reset_state = &vcpu->arch.reset_state;
> > @@ -113,9 +111,7 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
> >       WRITE_ONCE(vcpu->arch.mp_state.mp_state, KVM_MP_STATE_RUNNABLE);
> >       kvm_vcpu_wake_up(vcpu);
> >
> > -out_unlock:
> > -     spin_unlock(&vcpu->arch.mp_state_lock);
> > -     return ret;
> > +     return PSCI_RET_SUCCESS;
> >  }
> >
> >  static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
> > @@ -176,9 +172,8 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type, u64 flags)
> >        * re-initialized.
> >        */
> >       kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> > -             spin_lock(&tmp->arch.mp_state_lock);
> > +             guard(spinlock)(&tmp->arch.mp_state_lock);
> >               WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
> > -             spin_unlock(&tmp->arch.mp_state_lock);
> >       }
> >       kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
> >
> > diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> > index b963fd975aac..60969d90bdd3 100644
> > --- a/arch/arm64/kvm/reset.c
> > +++ b/arch/arm64/kvm/reset.c
> > @@ -193,10 +193,10 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >       bool loaded;
> >       u32 pstate;
> >
> > -     spin_lock(&vcpu->arch.mp_state_lock);
> > -     reset_state = vcpu->arch.reset_state;
> > -     vcpu->arch.reset_state.reset = false;
> > -     spin_unlock(&vcpu->arch.mp_state_lock);
> > +     scoped_guard(spinlock, &vcpu->arch.mp_state_lock) {
> > +             reset_state = vcpu->arch.reset_state;
> > +             vcpu->arch.reset_state.reset = false;
> > +     }
>
> Same, I don't find this one really interesting.

Ack.

Thanks!
/fuad

>
> >
> >       preempt_disable();
> >       loaded = (vcpu->cpu != -1);
> > --
> > 2.54.0.1136.gdb2ca164c4-goog
> >

