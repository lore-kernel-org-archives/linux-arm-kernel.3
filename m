Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C668C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfa02w+2R7v85UsHbfc8c8fBDDDTcGtnNT9og3+/x+Y=; b=SY3qxc/9Lis6HHrlEXAHcYfD+V
	wwO1QFPmLNVX/a++GYHZL4WHpKe5Y12WKup1JtWTmsK0Bx3nAL9jM6xLnYV9VhdfEdgBtLDryQHBl
	Udq1mvjCk3nV89z2JX+4blKPg0xWSKKFOna2sY0gdxtJ1Z4YHYHPUWsdjKSFH44y0EXN+riOwLheg
	d7h7MmMNI9M0x70ZiEe1Fh+NY0nOt/l3mwxFBLWB0dB0umS7XcQmzAvXgpG67S0OW+doSdMJooGDt
	bQXCeipOYtcpuV+mI6Z3wrdV5tI+osohYo5aISUlbksaW4TN4RmvLsZ0YdwA44HLuLaU9nYy7qytp
	oMbAbDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnaH-0000000DH9J-2nHG;
	Mon, 06 Jul 2026 17:58:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnaF-0000000DH8y-0HZ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 389A9600AE;
	Mon,  6 Jul 2026 17:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83771F000E9;
	Mon,  6 Jul 2026 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783360697;
	bh=Xfa02w+2R7v85UsHbfc8c8fBDDDTcGtnNT9og3+/x+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l/EoXkqEqLzf/RmDFKoleUlyWGN8jKQKxq88TU+k7AINCMlouqbeFvDNtMG1ujBD0
	 daO+DPr9pYbKdvKxoQu38X0ZYp1smDFej9Nm24s6FwslOX+7mIbZnPFTFajOX3N+Lx
	 uHvR+9g0G8rKkVBPNnzYKihpTCv8aP4sg0oR4ct0Xw7Oy7bpgmGTdHo24nyLjp+uTQ
	 SxzKfmEUvtM8MGXPQbAL4s27RmkpJ9I3v9p3/nrB1Ubo+h+TUiFVG27qZJcqGAvCI1
	 aKXOvLUS0HrAjs7XNVArgFq+aXnLaJEkr0mQZzY11Yfvlti/0vf1GKWx7Rh2OgdSmU
	 ui4UATs+PWTKA==
Date: Mon, 6 Jul 2026 10:58:16 -0700
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
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 6/7] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
Message-ID: <akvsuBcqCCzlrBLk@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-6-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-hybrid-v8-6-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
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

On Mon, Jul 06, 2026 at 07:03:29PM +0900, Akihiko Odaki wrote:
> +1.6 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
> +------------------------------------------------------
> +
> +:Parameters: no additional parameter in kvm_device_attr.addr
> +
> +:Returns:
> +
> +	 =======  ==================================================
> +	 -EBUSY   PMUv3 already initialized, a VCPU has already run,
> +		  an event filter has already been set or
> +		  a hardware PMU has already been specified
> +	 -ENXIO   Attempted to get before setting
> +	 -ENODEV  Attempted to set while PMUv3 not supported
> +	 =======  ==================================================
> +
> +If set, KVM emulates PMUv3 without programmable event counters. Only fixed
> +counters are exposed to the guest: the cycle counter today, and the instruction
> +counter if support for FEAT_PMUv3_ICNTR is added.

Drop the mention of cycle counter and FEAT_PMUv3_ICNTR, I want to avoid
the argument later down the line when ICNTR support is added to this
mode.

The expectation is that the VMM discovers the feature set using the ID
registers just like every other CPU feature. KVM documentation doesn't
need to describe the architecture.

> +With programmable counters disabled, the VCPU can run on any physical CPU.
> +This is particularly useful on heterogeneous systems where different hardware
> +PMUs cover different physical CPUs. All VCPUs in a VM share this attribute.

  When this attribute is enabled, the vCPU can run on any physical CPU
  that has a PMU, regardless of the underlying implementation. This
  attribute is VM-scoped.

The documentation is focused on unambiguously representing the UAPI, not
providing application recommendations.

>  2. GROUP: KVM_ARM_VCPU_TIMER_CTRL
>  =================================
>  
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 1c13bfa2d38a..39a1a1e412e6 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -437,6 +437,7 @@ enum {
>  #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
>  #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
>  #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
> +#define   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY	5
>  #define KVM_ARM_VCPU_TIMER_CTRL		1
>  #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 40cad183376c..ad9ff4d0d89c 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -1149,11 +1149,13 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>  		arm_pmu = entry->arm_pmu;
>  		if (arm_pmu->pmu.type == pmu_id) {
>  			if (kvm_vm_has_ran_once(kvm) ||
> +			    kvm_pmu_fixed_counters_only(kvm) ||
>  			    (kvm->arch.pmu_filter && kvm->arch.arm_pmu != arm_pmu)) {
>  				ret = -EBUSY;
>  				break;
>  			}
>  
> +			set_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags);

Why is this flag necessary? kvm->arch.arm_pmu is NULL if no PMU
implementation was selected by userspace.

>  			kvm_arm_set_pmu(kvm, arm_pmu);
>  			cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
>  			ret = 0;
> @@ -1164,6 +1166,22 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>  	return ret;
>  }
>  
> +static int kvm_arm_pmu_v3_set_pmu_fixed_counters_only(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	if (kvm_vm_has_ran_once(kvm) || kvm->arch.pmu_filter ||
> +	    test_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags))
> +		return -EBUSY;
> +
> +	set_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags);
> +	kvm_arm_set_nr_counters(kvm, 0);
> +
> +	return 0;
> +}
> +
>  static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>  {
>  	struct kvm *kvm = vcpu->kvm;
> @@ -1238,7 +1256,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  		     filter.action != KVM_PMU_EVENT_DENY))
>  			return -EINVAL;
>  
> -		if (kvm_vm_has_ran_once(kvm))
> +		if (kvm_vm_has_ran_once(kvm) || kvm_pmu_fixed_counters_only(kvm))

There's no reason for doing this, just let userspace create an event
filter. Even with the current PMU implementation it's possible that the
fixed cycle counter gets filtered.

Thanks,
Oliver

