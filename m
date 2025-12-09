Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A30D3B99E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RGs/QJR7c2TF54hcUD4pm2RyZcfoi4x+ys7DhcmLK4=; b=dfNCin+4qyBddkBH0oj+rrFTZp
	wE4XyyWn3vEygxU/vC6oAqnAJg2p/v+vnitXaqHgKIXS5vdhlSe4ra6d2PhYASHu1fXV1ybBVAK/p
	dzQ25Oxh+tJqVoebXg4J+II1oahV6akQqM68kJzwzkcANLyYtSk9IPlnYUxl7yM+evg6/PZt714Mo
	6kuDYip4+Uhjd+JoQKs90rorQq0gK65dbYBzmAtigNzE+B2ocFnLESXv/ByW3T7lA9J92DdMx+nYH
	ckXOUvQByXf2iLodn655N9DES236Kj6JZ/ZXLJM70ErXdEKfcREcW6tKZe2BlR7YAlONRr7DduFWJ
	qmuazRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5rG-0000000Equ7-0LR3;
	Tue, 09 Dec 2025 22:06:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT5rE-0000000Eqtv-0kP5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D7D56017B;
	Tue,  9 Dec 2025 22:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC2BC4CEF5;
	Tue,  9 Dec 2025 22:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765318015;
	bh=hJlyVUcqwe/6I5rw8HcTwWNqs3JR5pxz8OctmF8nuHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Em8ivC6cdTSKDYgeEVhdAvnJtZvxHovwnqqy4edM8a1JYCcXWTSmWGTRxGNjRUa9H
	 S3k7L+RcEKd7ztjWq17ETvXgbZCmP+XH8GsI1z1s6OPWlXMi1QShYGw7WGZdnkLUAu
	 U2ChGGJzz9FUb9m4VqcIrYo+2jsJ3ZsQz84un5mp1WZMxYjTa6IBkNqPoSSs+9zi5e
	 /HROCoKUbOBd85CXFw+uvxQ7eHNLM40dAF5ZdUc7S665pdG8Q0tzMk0AlMMtFH5gyH
	 ZWjYFDEQmeZZOimoUOWtNnOwElSn/sP09OAnaDJc/twYOZOr+NJpser5835S75zblY
	 6fkwt+14oY2VA==
Date: Tue, 9 Dec 2025 14:06:53 -0800
From: Oliver Upton <oupton@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 19/24] KVM: arm64: Implement lazy PMU context swaps
Message-ID: <aTidfRwYLYwTfmK_@kernel.org>
References: <20251209205121.1871534-1-coltonlewis@google.com>
 <20251209205121.1871534-20-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209205121.1871534-20-coltonlewis@google.com>
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

On Tue, Dec 09, 2025 at 08:51:16PM +0000, Colton Lewis wrote:
> +enum vcpu_pmu_register_access {
> +	VCPU_PMU_ACCESS_UNSET,
> +	VCPU_PMU_ACCESS_VIRTUAL,
> +	VCPU_PMU_ACCESS_PHYSICAL,
> +};

This is confusing. Even when the guest is accessing registers directly
on the CPU I'd still call that "hardware assisted virtualization" and
not "physical".

> +#endif /* _ASM_ARM64_KVM_TYPES_H */
> diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
> index 0ab89c91e19cb..c2cf6b308ec60 100644
> --- a/arch/arm64/kvm/debug.c
> +++ b/arch/arm64/kvm/debug.c
> @@ -34,7 +34,7 @@ static int cpu_has_spe(u64 dfr0)
>   *  - Self-hosted Trace Filter controls (MDCR_EL2_TTRF)
>   *  - Self-hosted Trace (MDCR_EL2_TTRF/MDCR_EL2_E2TB)
>   */
> -static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
> +void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
>  {
>  	int hpmn = kvm_pmu_hpmn(vcpu);
>  
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index bde79ec1a1836..ea288a712bb5d 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -963,6 +963,8 @@ static bool kvm_hyp_handle_pmu_regs(struct kvm_vcpu *vcpu)
>  	if (ret)
>  		__kvm_skip_instr(vcpu);
>  
> +	kvm_pmu_set_physical_access(vcpu);
> +
>  	return ret;
>  }
>  
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 8d0d6d1a0d851..c5767e2ebc651 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -73,6 +73,7 @@ bool kvm_vcpu_pmu_use_fgt(struct kvm_vcpu *vcpu)
>  	u8 hpmn = vcpu->kvm->arch.nr_pmu_counters;
>  
>  	return kvm_vcpu_pmu_is_partitioned(vcpu) &&
> +		vcpu->arch.pmu.access == VCPU_PMU_ACCESS_PHYSICAL &&
>  		cpus_have_final_cap(ARM64_HAS_FGT) &&
>  		(hpmn != 0 || cpus_have_final_cap(ARM64_HAS_HPMN0));
>  }
> @@ -92,6 +93,26 @@ u64 kvm_pmu_fgt2_bits(void)
>  		| HDFGRTR2_EL2_nPMICNTR_EL0;
>  }
>  
> +/**
> + * kvm_pmu_set_physical_access()
> + * @vcpu: Pointer to vcpu struct
> + *
> + * Reconfigure the guest for physical access of PMU hardware if
> + * allowed. This means reconfiguring mdcr_el2 and loading the vCPU
> + * state onto hardware.
> + *
> + */
> +
> +void kvm_pmu_set_physical_access(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_vcpu_pmu_is_partitioned(vcpu)
> +	    && vcpu->arch.pmu.access == VCPU_PMU_ACCESS_VIRTUAL) {
> +		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_PHYSICAL;
> +		kvm_arm_setup_mdcr_el2(vcpu);
> +		kvm_pmu_load(vcpu);
> +	}

It isn't immediately obvious how this guards against preemption.

Also, the general approach for these context-loading situations is to do
a full load/put on the vCPU rather than a directed load.

> +static void kvm_pmu_register_init(struct kvm_vcpu *vcpu)
> +{
> +	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_UNSET)
> +		vcpu->arch.pmu.access = VCPU_PMU_ACCESS_VIRTUAL;

This is confusing. The zero value of the enum should be consistent with
the "unloaded" state.

> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index f2ae761625a66..d73218706b834 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1197,6 +1197,8 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  		p->regval = __vcpu_sys_reg(vcpu, reg);
>  	}
>  
> +	kvm_pmu_set_physical_access(vcpu);
> +
>  	return true;
>  }
>  
> @@ -1302,6 +1304,8 @@ static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  		p->regval = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
>  	}
>  
> +	kvm_pmu_set_physical_access(vcpu);
> +
>  	return true;
>  }

Aren't there a ton of other registers the guest may access before
these two? Having generic PMU register accessors would allow you to
manage residence of PMU registers from a single spot.

Thanks,
Oliver

