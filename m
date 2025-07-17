Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8F8C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 06:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXr2e9539IDLWE6BwA3P6pUOhfIwjBSRbIyfoPl3QUo=; b=PLSk8Q2Fg9daE2TKBFPY/jLe1h
	mFn1sWh7xTOr8WJRygONicwDyo7aPAZm8yAX3Rq3ULoWrglO6W8If+Y6OVPanHCq0gCL98SAvQ+vu
	dqc/ITs/Kimu2sa7NfLPB3aS1sWdQYBPQVXdb9tCSdAXl5Zv7CjhA/orUNOp/IaoLlu3jEnRlxLh5
	2feKiEZHCT3UwoW8A41oDED/1Q2zvPBjmzEKrsxzDqjY8kAvDl2IHibI15vQd1c+itCKSBmaVqxTP
	5cUSCca8ohgUbpcLAljCmOWmdbQXEBhKcTerai0UiHha7X0IXFdIxCVuf5v/YYJcwl6Sg/MGp28JU
	chwXmhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHiz-00000009FsZ-3DgC;
	Thu, 17 Jul 2025 06:04:09 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHgY-00000009FfC-1VPP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 06:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1752732095; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=EXr2e9539IDLWE6BwA3P6pUOhfIwjBSRbIyfoPl3QUo=;
	b=xBgXhFb/5b5gPSDDpw4eVVo907em44Lo2FwrbQ+ZfPXkzLCa0/QBaTzsHDzJMGBFUQspO8U0IWhljT5VLc5TRolCQSC/SiBp0IVKm+j26yBd2topVAPuyQkqopsXntSswH7m2vRIrt85UfkDeZITdbFQxIo4bfkS8WlQlxt+G/4=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Wj70AqW_1752732092 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 17 Jul 2025 14:01:32 +0800
Date: Thu, 17 Jul 2025 14:01:32 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 3/4] KVM: Implement barriers before accessing
 kvm->buses[] on SRCU read paths
Message-ID: <ndwhwg4lmy22vnqy3yqnpdqj7o366crbrhgj5py5fm3g3l2ow3@5s24dzpkswa2>
References: <20250716110737.2513665-1-keirf@google.com>
 <20250716110737.2513665-4-keirf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716110737.2513665-4-keirf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_230138_538042_308BDA17 
X-CRM114-Status: GOOD (  25.96  )
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

On Wed, Jul 16, 2025 at 11:07:36AM +0800, Keir Fraser wrote:
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
> index 191a9ed0da22..425e3d8074ab 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -5861,6 +5861,13 @@ static int handle_invalid_guest_state(struct kvm_vcpu *vcpu)
>  		if (kvm_test_request(KVM_REQ_EVENT, vcpu))
>  			return 1;
>
> +		/*
> +		 * Ensure that any updates to kvm->buses[] observed by the
> +		 * previous instruction (emulated or otherwise) are also
> +		 * visible to the instruction we are about to emulate.
> +		 */
> +		smp_rmb();
> +
>  		if (!kvm_emulate_instruction(vcpu, 0))
>  			return 0;
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3bde4fb5c6aa..9132148fb467 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -965,11 +965,15 @@ static inline bool kvm_dirty_log_manual_protect_and_init_set(struct kvm *kvm)
>  	return !!(kvm->manual_dirty_log_protect & KVM_DIRTY_LOG_INITIALLY_SET);
>  }
>
> +/*
> + * Get a bus reference under the update-side lock. No long-term SRCU reader
> + * references are permitted, to avoid stale reads vs concurrent IO
> + * registrations.
> + */
>  static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
>  {
> -	return srcu_dereference_check(kvm->buses[idx], &kvm->srcu,
> -				      lockdep_is_held(&kvm->slots_lock) ||
> -				      !refcount_read(&kvm->users_count));
> +	return rcu_dereference_protected(kvm->buses[idx],
> +					 lockdep_is_held(&kvm->slots_lock));

I want to consult the true reason for using protected version here,
save unnecessary READ_ONCE() ?

>  }
>
>  static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 222f0e894a0c..9ec3b96b9666 100644
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
> @@ -5838,6 +5847,18 @@ static int __kvm_io_bus_write(struct kvm_vcpu *vcpu, struct kvm_io_bus *bus,
>  	return -EOPNOTSUPP;
>  }
>
> +static struct kvm_io_bus *kvm_get_bus_srcu(struct kvm *kvm, enum kvm_bus idx)
> +{
> +	/*
> +	 * Ensure that any updates to kvm_buses[] observed by the previous VCPU
> +	 * machine instruction are also visible to the VCPU machine instruction
> +	 * that triggered this call.
> +	 */
> +	smp_mb__after_srcu_read_lock();
> +
> +	return srcu_dereference(kvm->buses[idx], &kvm->srcu);
> +}
> +
>  int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>  		     int len, const void *val)
>  {
> @@ -5850,7 +5871,7 @@ int kvm_io_bus_write(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>  		.len = len,
>  	};
>
> -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
>  	if (!bus)
>  		return -ENOMEM;
>  	r = __kvm_io_bus_write(vcpu, bus, &range, val);
> @@ -5869,7 +5890,7 @@ int kvm_io_bus_write_cookie(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx,
>  		.len = len,
>  	};
>
> -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
>  	if (!bus)
>  		return -ENOMEM;
>
> @@ -5919,7 +5940,7 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>  		.len = len,
>  	};
>
> -	bus = srcu_dereference(vcpu->kvm->buses[bus_idx], &vcpu->kvm->srcu);
> +	bus = kvm_get_bus_srcu(vcpu->kvm, bus_idx);
>  	if (!bus)
>  		return -ENOMEM;
>  	r = __kvm_io_bus_read(vcpu, bus, &range, val);
> @@ -6028,7 +6049,7 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm *kvm, enum kvm_bus bus_idx,
>
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
>
> -	bus = srcu_dereference(kvm->buses[bus_idx], &kvm->srcu);
> +	bus = kvm_get_bus_srcu(kvm, bus_idx);
>  	if (!bus)
>  		goto out_unlock;
>
> --
> 2.50.0.727.gbf7dc18ff4-goog
>

