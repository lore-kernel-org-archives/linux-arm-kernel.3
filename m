Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDEEFC5938
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40VIG24tpJeh5i39RXmYjBY6fqW+qVmqY7Pqx08EiQ4=; b=2FH/cVEbuQSHIQwxoJDRJiaCU0
	vC8UHujzlI6mhPdjw6+SGVEJtuHbdREX+MeBzfa/prcJYqPOTCJf96nNUby7KJcLB+OdPG9OxqCaR
	H4SMr0lTetJNfKh4aaZL+jrrNGGRHmH2+RleVSvY/DOioZKKIcMcim2Ea2nLbTYuJWXczQ4aGzf48
	v2Y794/HONNrwTYfO+24Cn85wbEsdr7qRyEfnoZsCzclcVR+JWinjKBYqOVX7qvrIlUnReqby/7OS
	k8tuGm4Mtf9+jePFwVY5ymRyNVstcJEEQsyzGkwqIYuNEcHHccvyKR5yTkIWxfj/ql+U7N9gGvD//
	6c9jbjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZx9-000000064LW-0l2W;
	Thu, 26 Feb 2026 11:54:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZx7-000000064LJ-2QM6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B188A60054;
	Thu, 26 Feb 2026 11:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F171C116C6;
	Thu, 26 Feb 2026 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772106884;
	bh=OyAr9XFcljdspYg5t17dcELHy4wQhUIdS4b5HT4e440=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjOyB6TkX+EEVepdSNPexvT+s7nDTrYLKVA41GUwq8DTQAD6f3c7ZIkWTjYHwyAk5
	 bzHTpCvYiK5azhCJvNTYXSBqxhWun4OudCC5gpFxkQLFgAHsg1NknF5MP4qvqv/rrB
	 HLHysS4LqC/u1qhq0d7tjX1VCgfVaaX2JiIKglFivWhx1X/NMKkxBlx6knYGuWrRoG
	 Pec22q6Ev86r+TqNbafl03Z/gM9gMCEOgfb0gWOD4zItvoHJx0xEihu4Dv7qgBMz7i
	 5xznQyEETiC0hzTXlHftorZASsOojgkmiw25lD0U9bjsmMhbRyn3Tfb+yN6tQxYkEF
	 FQE75YhVWy1Yg==
Date: Thu, 26 Feb 2026 03:54:42 -0800
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
Message-ID: <aaA0gn9O8QAf9Gpu@kernel.org>
References: <20260225-hybrid-v3-0-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
 <20260225-hybrid-v3-1-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-hybrid-v3-1-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
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

Hi Akihiko,

On Wed, Feb 25, 2026 at 01:31:15PM +0900, Akihiko Odaki wrote:
> @@ -629,6 +629,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  		kvm_vcpu_load_vhe(vcpu);
>  	kvm_arch_vcpu_load_fp(vcpu);
>  	kvm_vcpu_pmu_restore_guest(vcpu);
> +	if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &vcpu->kvm->arch.flags))
> +		kvm_make_request(KVM_REQ_CREATE_PMU, vcpu);

We only need to set the request if the vCPU has migrated to a different
PMU implementation, no?

>  	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>  		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>  
> @@ -1056,6 +1058,9 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
>  		if (kvm_check_request(KVM_REQ_RELOAD_PMU, vcpu))
>  			kvm_vcpu_reload_pmu(vcpu);
>  
> +		if (kvm_check_request(KVM_REQ_CREATE_PMU, vcpu))
> +			kvm_vcpu_create_pmu(vcpu);
> +

My strong preference would be to squash the migration handling into
kvm_vcpu_reload_pmu(). It is already reprogramming PMU events in
response to other things.

>  		if (kvm_check_request(KVM_REQ_RESYNC_PMU_EL0, vcpu))
>  			kvm_vcpu_pmu_restore_guest(vcpu);
>  
> @@ -1516,7 +1521,8 @@ static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
>  	 * When the vCPU has a PMU, but no PMU is set for the guest
>  	 * yet, set the default one.
>  	 */
> -	if (kvm_vcpu_has_pmu(vcpu) && !kvm->arch.arm_pmu)
> +	if (kvm_vcpu_has_pmu(vcpu) && !kvm->arch.arm_pmu &&
> +	    !test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags))
>  		ret = kvm_arm_set_default_pmu(kvm);

I'd rather just initialize it to a default than have to deal with the
field being sometimes null.

> -static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
> +static u64 kvm_pmu_enabled_counter_mask(struct kvm_vcpu *vcpu)
>  {
> -	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
> -	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +	u64 mask = 0;
>  
> -	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
> -		return false;
> +	if (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HPME)
> +		mask |= kvm_pmu_hyp_counter_mask(vcpu);
>  
> -	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
> -		return mdcr & MDCR_EL2_HPME;
> +	if (kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E)
> +		mask |= ~kvm_pmu_hyp_counter_mask(vcpu);
>  
> -	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
> +	return __vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & mask;
> +}
> +
> +static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
> +{
> +	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
> +
> +	return kvm_pmu_enabled_counter_mask(vcpu) & BIT(pmc->idx);
>  }

You're churning a good bit of code, this needs to happen in a separate
patch (if at all).

> @@ -689,6 +710,14 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>  	int eventsel;
>  	u64 evtreg;
>  
> +	if (!arm_pmu) {
> +		arm_pmu = kvm_pmu_probe_armpmu(vcpu->cpu);

kvm_pmu_probe_armpmu() takes a global mutex, I'm not sure that's what we
want.

What prevents us from opening a PERF_TYPE_RAW event and allowing perf to
work out the right PMU for this CPU?

> +		if (!arm_pmu) {
> +			vcpu_set_on_unsupported_cpu(vcpu);

At this point it seems pretty late to flag the CPU as unsupported. Maybe
instead we can compute the union cpumask for all the PMU implemetations
the VM may schedule on.

> @@ -1249,6 +1299,10 @@ int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  		irq = vcpu->arch.pmu.irq_num;
>  		return put_user(irq, uaddr);
>  	}
> +	case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
> +		lockdep_assert_held(&vcpu->kvm->arch.config_lock);
> +		if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &vcpu->kvm->arch.flags))
> +			return 0;

We don't need a getter for this, userspace should remember how it
provisioned the VM.

Thanks,
Oliver

