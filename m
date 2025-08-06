Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EAFC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phX34nUYLjHESXOAqkOcxwCZETbFegwkz1f4cCdWzzU=; b=iYC9kj55k/Mqq0YpzBQ0qfBUlo
	HAIi6+m5hIpZsK6XIa6kLHGndprLexibXXq2ZPHNqNEEeWC0kfcY7piWRYmfvfbU+9yVOp83i+YlE
	hDuuND4p8WwqI33m/Yp9HjA4SLmrd4Jd9SCruS8McH6gQr8gweuskLQ+FvspOZajh5nCdoOpI0C4k
	Du4kFNU4yGeFOOIYDuJUqCOhojaOnaarILoHN0vRGfGWmZHWDtoYvUVKASVNxnjdwuozNpwG3bVhR
	q+CEWLuoR0pelx13I2PRtUGLZLt+amnQ14JTAAVLtYEnREunTXsCyOGEAUKOJL/yk2stnlJ30mWbn
	cU692vEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujj3J-0000000G65E-1P0Y;
	Wed, 06 Aug 2025 18:39:53 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujipE-0000000G3x0-2mF7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:25:22 +0000
Received: from [192.168.10.111] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 576IOhK2054951
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 7 Aug 2025 03:24:43 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=phX34nUYLjHESXOAqkOcxwCZETbFegwkz1f4cCdWzzU=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1754504684; v=1;
        b=s0tTe+KMI7swBAP+Xt3bupx/k9JygXTou5eGqet3hy78WwzAvwG1SEDUkFmJGKPm
         Fmt1e2dmZ/6uqTJCyxyx7OKvs+36JfYyb+5vNIrCdRnWbBwiOBsvMo8ip/+h8uUa
         W9iuQh0EGDAjQ/Kh3yRFezjno6q6ySoWUdO3rBWBtqbFzP1qd42be8gifZ+wE4s1
         l0st77DdTCQazNwWW4YnxkDeAOHCt7rS3l1EkcErRWYpFE9FniE9fskIAB+mLZAV
         +SoeBkfdAgu4MxJfQiCaTtgBLsqDSUko1PpPKlXc6EnigstQE8M4uOgF+38XxVnC
         xxaZlbY4fLVTMYeXJyWZWA==
Message-ID: <276fdfb8-f1ca-44ad-b310-a811684b265a@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 7 Aug 2025 03:24:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] KVM: arm64: PMU: Introduce
 KVM_ARM_VCPU_PMU_V3_COMPOSITION
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250806-hybrid-v2-0-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <20250806-hybrid-v2-1-0661aec3af8c@rsg.ci.i.u-tokyo.ac.jp>
 <aJOO99xUrhsrvLwl@linux.dev>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aJOO99xUrhsrvLwl@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_112520_924633_FFA7A6F4 
X-CRM114-Status: GOOD (  45.72  )
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

On 2025/08/07 2:20, Oliver Upton wrote:
> Hi Akihiko,
> 
> This is an unreasonably large patch that needs to be broken down into
> smaller patches, ideally one functional change per patch. We need this
> even for an RFC for the sake of reviews.
> 
> On Wed, Aug 06, 2025 at 06:09:54PM +0900, Akihiko Odaki wrote:
>> +static u64 kvm_pmu_get_pmc_value(struct kvm_vcpu *vcpu, u8 idx)
>>   {
>> -	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>> +	struct kvm_pmc *pmc = *kvm_vcpu_idx_to_pmc(vcpu, idx);
>>   	u64 counter, reg, enabled, running;
>> +	unsigned int i;
>>   
>> -	reg = counter_index_to_reg(pmc->idx);
>> +	reg = counter_index_to_reg(idx);
>>   	counter = __vcpu_sys_reg(vcpu, reg);
>>   
>>   	/*
>>   	 * The real counter value is equal to the value of counter register plus
>>   	 * the value perf event counts.
>>   	 */
>> -	if (pmc->perf_event)
>> -		counter += perf_event_read_value(pmc->perf_event, &enabled,
>> -						 &running);
>> +	if (pmc)
>> +		for (i = 0; i < pmc->nr_perf_events; i++)
>> +			counter += perf_event_read_value(pmc->perf_events[i],
>> +							 &enabled, &running);
> 
> I'm concerned that this array of events concept you're introducing is
> going to be error-prone. An approach that reallocates a new PMU event in
> the case of a vCPU migrating to a new PMU implementation would be
> desirable.

I avoided allocation at migration because I was worried with disabled 
preemption. perf_event_create_kernel_counter() internally takes a mutex 
so it cannot be used if preemption is disabled.

I wonder if it is guaranteed that kvm_arch_vcpu_load() executes with 
preemption. If so, I can add a hook there to call 
perf_event_create_kernel_counter().

> 
>> +static void reset_sample_period(struct perf_event *perf_event)
>> +{
>> +	struct kvm_pmc **pmc = perf_event->overflow_handler_context;
>> +	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>> +	struct arm_pmu *cpu_pmu = to_arm_pmu(perf_event->pmu);
>> +	u64 period;
>> +
>> +	cpu_pmu->pmu.stop(perf_event, PERF_EF_UPDATE);
>> +
>> +	/*
>> +	 * Reset the sample period to the architectural limit,
>> +	 * i.e. the point where the counter overflows.
>> +	 */
>> +	period = compute_period(pmc, kvm_pmu_get_pmc_value(vcpu, (*pmc)->idx));
>> +
>> +	local64_set(&perf_event->hw.period_left, 0);
>> +	perf_event->attr.sample_period = period;
>> +	perf_event->hw.sample_period = period;
>> +
>> +	cpu_pmu->pmu.start(perf_event, PERF_EF_RELOAD);
>> +}
> 
> No, we can't start calling into the internal driver interfaces. The fact
> that we have a pointer to the PMU is an ugly hack and shouldn't be used
> like this.

This function was extracted from kvm_pmu_perf_overflow() and is not a 
new addition (which should have been clear if I would have split the 
patch as you noted).

I thought of replacing it with perf_event_period(), but there is a 
catch: it returns -EINVAL if the 63th bit of the sample period number is 
set. Perhaps we can just specify ((1ULL << 63) - 1) if the sample period 
is going to be so long, but I conservatively avoided that. I can change 
it if you prefer that way or have an alternative idea.

> 
>> @@ -725,8 +729,8 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>>   	attr.type = arm_pmu->pmu.type;
>>   	attr.size = sizeof(attr);
>>   	attr.pinned = 1;
>> -	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
>> -	attr.exclude_user = !kvm_pmc_counts_at_el0(pmc);
>> +	attr.disabled = !kvm_pmu_counter_is_enabled(vcpu, (*pmc)->idx);
>> +	attr.exclude_user = !kvm_pmc_counts_at_el0(vcpu, (*pmc)->idx);
>>   	attr.exclude_hv = 1; /* Don't count EL2 events */
>>   	attr.exclude_host = 1; /* Don't count host events */
>>   	attr.config = eventsel;
> 
> Can we just special-case the fixed CPU cycle counter to use
> PERF_TYPE_HARDWARE / PERF_COUNT_HW_CPU_CYCLES? That _should_ have the
> intended effect of opening an event on the PMU for this CPU.

I have an impression that perhaps this emulation can be more generic by 
converting eventsel to PERF_COUNT_HW_* numbers with armv8_pmuv3_perf_map 
in drivers/perf/arm_pmuv3.c, but it is not in scope of this change. The 
current code is sufficient for now.

> 
>> +	/*
>> +	 * If we have a filter in place and that the event isn't allowed, do
>> +	 * not install a perf event either.
>> +	 */
>> +	if (vcpu->kvm->arch.pmu_filter &&
>> +	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
>> +		return;
>> +
>> +	if (arm_pmu) {
>> +		*pmc = kvm_pmu_alloc_pmc(idx, 1);
>> +		if (!*pmc)
>> +			goto err;
>> +
>> +		kvm_pmu_create_perf_event(pmc, arm_pmu, eventsel);
>> +	} else {
>> +		guard(mutex)(&arm_pmus_lock);
> 
> This is a system-wide lock, the need for which is eliminated if you go
> for the reallocation approach I mention.
> 
>> +static int kvm_arm_pmu_v3_set_pmu_composition(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm *kvm = vcpu->kvm;
>> +	struct arm_pmu_entry *entry;
>> +	struct arm_pmu *arm_pmu;
>> +
>> +	lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +	if (kvm_vm_has_ran_once(kvm) ||
>> +	    (kvm->arch.pmu_filter && !kvm->arch.nr_composed_host_pmus))
>> +		return -EBUSY;
> 
> I'm not sure there's much value in preventing the user from configuring
> the PMU event filter. Even in the case of the fixed CPU cycle counter we
> allow userspace to filter the event.

It is possible to configure the PMU event filter, but it needs to be 
done after setting the attribute. This behavior is aligned with 
KVM_ARM_VCPU_PMU_V3_SET_PMU.

> 
> It is much more important to have mutual exclusion between this UAPI and
> userspace explicitly selecting a PMU implementation.

They are mutually exclusive and the latest configuration takes effect.

If you set SET_PMU after COMPOSITION, SET_PMU will take effect.
If you set COMPOSITION after SET_PMU, COMPOSITION will take effect.

I'll note that in the documentation.

> 
>> @@ -1223,6 +1328,8 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>   
>>   		return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
>>   	}
>> +	case KVM_ARM_VCPU_PMU_V3_COMPOSITION:
>> +		return kvm_arm_pmu_v3_set_pmu_composition(vcpu);
> 
> I'd prefer naming this something like 'KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY'.
> We will have the fixed instruction counter eventually which is another
> event we could potentially provide system-wide.

The design decision to expose the cycle counter is driven by the 
motivation to satisfy FEAT_PMU for the guest rather than the host 
capability.

When we implement FEAT_PMUv3_ICNTR in the future, I think we will need 
to add KVM_ARM_VCPU_PMU_V3_COMPOSITION_ICNTR or something. The resultig 
emulated PMU will work only on host CPUs that have instruction counters; 
a host CPU may lack one because it doesn't implement FEAT_PMUv3_ICNTR or 
has a third-party PMU like apple-m1-cpu-pmu (this particular PMU has an 
instruction counter fortunately).

Regards,
Akihiko Odaki

