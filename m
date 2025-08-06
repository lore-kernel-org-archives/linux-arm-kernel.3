Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E2FC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXEzdvjKc1frf74KZZ2Dk9UeoT9Qj8s/haDO00iYsCY=; b=XAzBPes6b7AubzKNpyxkHaM8r5
	9RQWjphB0Y1SlYgHYZ2pNgljTeFM1X9BmZMbWpl1V4HRxkjMgtSr7ksoaeX+DhMvwD2tnDl7DDfR9
	dwxFEN2R3KDGK0HVSS9Igzt4R+qv/LOc64pSrRcFjMCGAY7BBkGYJcLApMWtRQ0XGN7/zRsRuOKp7
	+gwT08fHQ5wI3dy9408eJkKIYvKBCgzZb6dezRLrYhVPwaDkkqVgL8QWJkT1otk7MowoUsHvjZv8O
	ZSPyaAh1RxsSaxGl/J2LoYfWjQddJvGZsgUzD3/a9xPa+q1nbxHUV1jkBYJ8zv/E76vnY7EMCfT8u
	++5cK68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhvK-0000000Fvey-2Fib;
	Wed, 06 Aug 2025 17:27:34 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhpA-0000000FucK-1RdD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:21:15 +0000
Date: Wed, 6 Aug 2025 10:20:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754500867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LXEzdvjKc1frf74KZZ2Dk9UeoT9Qj8s/haDO00iYsCY=;
	b=VtkQ++7b2u/bXmsWSk18w3r7GM1P5JVR7OF9qYXkJUdtUAb1xF+174eBKK9E0p7iYnpU9o
	qMZ/Jn24nSr9r2S/3tLcPCdxS8TX5DhSvQ3mumqS7+RSehNtdiprcMvvWdydZeJAT64sl/
	DZOMHF4WOTVO1Lqo5qTY5dzVsOhTh5M=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
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
Subject: Re: [PATCH RFC v2 1/2] KVM: arm64: PMU: Introduce
 KVM_ARM_VCPU_PMU_V3_COMPOSITION
Message-ID: <aJOO99xUrhsrvLwl@linux.dev>
References: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <20250806-hybrid-v2-1-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-hybrid-v2-1-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_102112_979642_D5BC1E07 
X-CRM114-Status: GOOD (  27.15  )
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

This is an unreasonably large patch that needs to be broken down into
smaller patches, ideally one functional change per patch. We need this
even for an RFC for the sake of reviews.

On Wed, Aug 06, 2025 at 06:09:54PM +0900, Akihiko Odaki wrote:
> +static u64 kvm_pmu_get_pmc_value(struct kvm_vcpu *vcpu, u8 idx)
>  {
> -	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
> +	struct kvm_pmc *pmc = *kvm_vcpu_idx_to_pmc(vcpu, idx);
>  	u64 counter, reg, enabled, running;
> +	unsigned int i;
>  
> -	reg = counter_index_to_reg(pmc->idx);
> +	reg = counter_index_to_reg(idx);
>  	counter = __vcpu_sys_reg(vcpu, reg);
>  
>  	/*
>  	 * The real counter value is equal to the value of counter register plus
>  	 * the value perf event counts.
>  	 */
> -	if (pmc->perf_event)
> -		counter += perf_event_read_value(pmc->perf_event, &enabled,
> -						 &running);
> +	if (pmc)
> +		for (i = 0; i < pmc->nr_perf_events; i++)
> +			counter += perf_event_read_value(pmc->perf_events[i],
> +							 &enabled, &running);

I'm concerned that this array of events concept you're introducing is
going to be error-prone. An approach that reallocates a new PMU event in
the case of a vCPU migrating to a new PMU implementation would be
desirable.

> +static void reset_sample_period(struct perf_event *perf_event)
> +{
> +	struct kvm_pmc **pmc = perf_event->overflow_handler_context;
> +	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
> +	struct arm_pmu *cpu_pmu = to_arm_pmu(perf_event->pmu);
> +	u64 period;
> +
> +	cpu_pmu->pmu.stop(perf_event, PERF_EF_UPDATE);
> +
> +	/*
> +	 * Reset the sample period to the architectural limit,
> +	 * i.e. the point where the counter overflows.
> +	 */
> +	period = compute_period(pmc, kvm_pmu_get_pmc_value(vcpu, (*pmc)->idx));
> +
> +	local64_set(&perf_event->hw.period_left, 0);
> +	perf_event->attr.sample_period = period;
> +	perf_event->hw.sample_period = period;
> +
> +	cpu_pmu->pmu.start(perf_event, PERF_EF_RELOAD);
> +}

No, we can't start calling into the internal driver interfaces. The fact
that we have a pointer to the PMU is an ugly hack and shouldn't be used
like this.

> @@ -725,8 +729,8 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>  	attr.type = arm_pmu->pmu.type;
>  	attr.size = sizeof(attr);
>  	attr.pinned = 1;
> -	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
> -	attr.exclude_user = !kvm_pmc_counts_at_el0(pmc);
> +	attr.disabled = !kvm_pmu_counter_is_enabled(vcpu, (*pmc)->idx);
> +	attr.exclude_user = !kvm_pmc_counts_at_el0(vcpu, (*pmc)->idx);
>  	attr.exclude_hv = 1; /* Don't count EL2 events */
>  	attr.exclude_host = 1; /* Don't count host events */
>  	attr.config = eventsel;

Can we just special-case the fixed CPU cycle counter to use
PERF_TYPE_HARDWARE / PERF_COUNT_HW_CPU_CYCLES? That _should_ have the
intended effect of opening an event on the PMU for this CPU.

> +	/*
> +	 * If we have a filter in place and that the event isn't allowed, do
> +	 * not install a perf event either.
> +	 */
> +	if (vcpu->kvm->arch.pmu_filter &&
> +	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
> +		return;
> +
> +	if (arm_pmu) {
> +		*pmc = kvm_pmu_alloc_pmc(idx, 1);
> +		if (!*pmc)
> +			goto err;
> +
> +		kvm_pmu_create_perf_event(pmc, arm_pmu, eventsel);
> +	} else {
> +		guard(mutex)(&arm_pmus_lock);

This is a system-wide lock, the need for which is eliminated if you go
for the reallocation approach I mention.

> +static int kvm_arm_pmu_v3_set_pmu_composition(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct arm_pmu_entry *entry;
> +	struct arm_pmu *arm_pmu;
> +
> +	lockdep_assert_held(&kvm->arch.config_lock);
> +
> +	if (kvm_vm_has_ran_once(kvm) ||
> +	    (kvm->arch.pmu_filter && !kvm->arch.nr_composed_host_pmus))
> +		return -EBUSY;

I'm not sure there's much value in preventing the user from configuring
the PMU event filter. Even in the case of the fixed CPU cycle counter we
allow userspace to filter the event.

It is much more important to have mutual exclusion between this UAPI and
userspace explicitly selecting a PMU implementation.

> @@ -1223,6 +1328,8 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>  
>  		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
>  	}
> +	case KVM_ARM_VCPU_PMU_V3_COMPOSITION:
> +		return kvm_arm_pmu_v3_set_pmu_composition(vcpu);

I'd prefer naming this something like 'KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY'.
We will have the fixed instruction counter eventually which is another
event we could potentially provide system-wide.

Thanks,
Oliver

