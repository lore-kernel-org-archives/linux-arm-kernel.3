Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31304C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7iE/7SX2gO6QBT2EKt/EXBIxabMBibRZNzbUQmAwfg=; b=1uVzlknoubOdJZtdmy4jIv4ari
	2GHmcJ3b6rxR/ZFj+yVg2PNFhYPHg3gxHsEa0F+SlymS9wtQxzPdZbNaec3hNYxbFPeghQ0VbModu
	yN32zD+6Rn81omT3VDJvnb5dgL59BIs4ZNzAZMJVqIVqfWQpB1cJ4FpvwhNP8gzCoDWjycWyG8G1m
	/3SNJYDkWEQBc5R2p/hs2+U6MxJkUKqXVACfoi4r/6pUScTth73/WlfYy8q1NITwDjWor57fxUlTw
	ZhNeu4UGOit8puM+07dcf2HMb7PQheKc+SUnWyOqP4aO8loDWhg/oOEhWw8OKTsB5YVsOmkVAmJGT
	1yPFBjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1Jb-00000000mqv-1qQI;
	Thu, 07 Aug 2025 14:09:55 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk1H3-00000000mZi-3Zs4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 14:07:19 +0000
Received: from [192.168.10.111] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 577E6LlB000918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 7 Aug 2025 23:06:21 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=i7iE/7SX2gO6QBT2EKt/EXBIxabMBibRZNzbUQmAwfg=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=Message-ID:Date:Subject:To:From;
        s=rs20250326; t=1754575582; v=1;
        b=wHpaSRxJE1Sxz4oyxTr3tKGmb4Jo1/LL0dOVh4CtMYBkyuY+Nc4cEjg8BfgFfk4m
         GlO70nONuAf3bqAlG1Pd0+yeAZ+VqxsQ4xOOWcoTdCNf1R84yWPWilddv5sdwqcE
         8tXz1EgvguhKzp1Oov9ypd8bZrbUnf894eFL7lJK44ehZIuIwdvoCDQFWYfIQ5yP
         Rv1KOztHFGVRzoq1XVKneYqnMNI/uKyCRICiylBQ9BrZWs+d0l5EXPuKuXM1+x0J
         3C/diag1x4lfCjqlii+SyHolIsB654VtvOIUdWsYS8xm5QrPCihlgMHmMRVD6OGm
         oY80A1gZ1HqxCNI2QdCwcw==
Message-ID: <62494f54-13c6-4b9f-86a1-9a19ce58e91f@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 7 Aug 2025 23:06:21 +0900
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
 <276fdfb8-f1ca-44ad-b310-a811684b265a@rsg.ci.i.u-tokyo.ac.jp>
 <aJQJdElbZJ6KzQxD@linux.dev>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aJQJdElbZJ6KzQxD@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_070718_128120_A38BF998 
X-CRM114-Status: GOOD (  57.54  )
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

On 2025/08/07 11:03, Oliver Upton wrote:
> On Thu, Aug 07, 2025 at 03:24:43AM +0900, Akihiko Odaki wrote:
>> On 2025/08/07 2:20, Oliver Upton wrote:
>>> Hi Akihiko,
>>>
>>> This is an unreasonably large patch that needs to be broken down into
>>> smaller patches, ideally one functional change per patch. We need this
>>> even for an RFC for the sake of reviews.
>>>
>>> On Wed, Aug 06, 2025 at 06:09:54PM +0900, Akihiko Odaki wrote:
>>>> +static u64 kvm_pmu_get_pmc_value(struct kvm_vcpu *vcpu, u8 idx)
>>>>    {
>>>> -	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>>>> +	struct kvm_pmc *pmc = *kvm_vcpu_idx_to_pmc(vcpu, idx);
>>>>    	u64 counter, reg, enabled, running;
>>>> +	unsigned int i;
>>>> -	reg = counter_index_to_reg(pmc->idx);
>>>> +	reg = counter_index_to_reg(idx);
>>>>    	counter = __vcpu_sys_reg(vcpu, reg);
>>>>    	/*
>>>>    	 * The real counter value is equal to the value of counter register plus
>>>>    	 * the value perf event counts.
>>>>    	 */
>>>> -	if (pmc->perf_event)
>>>> -		counter += perf_event_read_value(pmc->perf_event, &enabled,
>>>> -						 &running);
>>>> +	if (pmc)
>>>> +		for (i = 0; i < pmc->nr_perf_events; i++)
>>>> +			counter += perf_event_read_value(pmc->perf_events[i],
>>>> +							 &enabled, &running);
>>>
>>> I'm concerned that this array of events concept you're introducing is
>>> going to be error-prone. An approach that reallocates a new PMU event in
>>> the case of a vCPU migrating to a new PMU implementation would be
>>> desirable.
>>
>> I avoided allocation at migration because I was worried with disabled
>> preemption. perf_event_create_kernel_counter() internally takes a mutex so
>> it cannot be used if preemption is disabled.
>>
>> I wonder if it is guaranteed that kvm_arch_vcpu_load() executes with
>> preemption. If so, I can add a hook there to call
>> perf_event_create_kernel_counter().
> 
> You don't need to allocate the event at vcpu_load(). The only guarantee
> we need is that an event has been attached to the PMC prior to entering
> the guest, for which the KVM_REQ_* infrastructure is quite useful.

I see that kvm_arch_vcpu_load() makes a KVM_REQ_RECORD_STEAL request. 
Indeed I can add another request for PMC handling.

I'm a bit concerned with the overhead of allocation, but perhaps 
migration between heterogeneous cores is rare.

> 
>>>
>>>> +static void reset_sample_period(struct perf_event *perf_event)
>>>> +{
>>>> +	struct kvm_pmc **pmc = perf_event->overflow_handler_context;
>>>> +	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>>>> +	struct arm_pmu *cpu_pmu = to_arm_pmu(perf_event->pmu);
>>>> +	u64 period;
>>>> +
>>>> +	cpu_pmu->pmu.stop(perf_event, PERF_EF_UPDATE);
>>>> +
>>>> +	/*
>>>> +	 * Reset the sample period to the architectural limit,
>>>> +	 * i.e. the point where the counter overflows.
>>>> +	 */
>>>> +	period = compute_period(pmc, kvm_pmu_get_pmc_value(vcpu, (*pmc)->idx));
>>>> +
>>>> +	local64_set(&perf_event->hw.period_left, 0);
>>>> +	perf_event->attr.sample_period = period;
>>>> +	perf_event->hw.sample_period = period;
>>>> +
>>>> +	cpu_pmu->pmu.start(perf_event, PERF_EF_RELOAD);
>>>> +}
>>>
>>> No, we can't start calling into the internal driver interfaces. The fact
>>> that we have a pointer to the PMU is an ugly hack and shouldn't be used
>>> like this.
>>
>> This function was extracted from kvm_pmu_perf_overflow() and is not a new
>> addition (which should have been clear if I would have split the patch as
>> you noted).
> 
> Yuck, then forgive my whining.
> 
>> I thought of replacing it with perf_event_period(), but there is a catch: it
>> returns -EINVAL if the 63th bit of the sample period number is set. Perhaps
>> we can just specify ((1ULL << 63) - 1) if the sample period is going to be
>> so long, but I conservatively avoided that. I can change it if you prefer
>> that way or have an alternative idea.
> 
> Let's keep it as-is then. Sorry about the noise.
> 
>>> Can we just special-case the fixed CPU cycle counter to use
>>> PERF_TYPE_HARDWARE / PERF_COUNT_HW_CPU_CYCLES? That _should_ have the
>>> intended effect of opening an event on the PMU for this CPU.
>>
>> I have an impression that perhaps this emulation can be more generic by
>> converting eventsel to PERF_COUNT_HW_* numbers with armv8_pmuv3_perf_map in
>> drivers/perf/arm_pmuv3.c, but it is not in scope of this change. The current
>> code is sufficient for now.
> 
> The only cross-PMU events we will support are the fixed counters, my
> strong preference is that we do not reverse-map architectural events to
> generic perf events for all counters.

I wonder if there is a benefit to special case PERF_COUNT_HW_CPU_CYCLES 
then; the current logic of kvm_map_pmu_event() looks sufficient for me.

> 
>>> I'm not sure there's much value in preventing the user from configuring
>>> the PMU event filter. Even in the case of the fixed CPU cycle counter we
>>> allow userspace to filter the event.
>>
>> It is possible to configure the PMU event filter, but it needs to be done
>> after setting the attribute. This behavior is aligned with
>> KVM_ARM_VCPU_PMU_V3_SET_PMU.
> 
> That's fine then, I missed that detail.
> 
>> They are mutually exclusive and the latest configuration takes effect.
>>
>> If you set SET_PMU after COMPOSITION, SET_PMU will take effect.
>> If you set COMPOSITION after SET_PMU, COMPOSITION will take effect.
>>
>> I'll note that in the documentation.
> 
> This isn't what I meant. What I mean is that userspace either can use
> the SET_PMU ioctl or the COMPOSITION ioctl. Once one of them has been
> used the other ioctl returns an error.
> 
> We're really bad at getting ioctl ordering / interleaving right and
> syzkaller has a habit of finding these mistakes. There's zero practical
> value in using both of these ioctls on the same VM, let's prevent it.

The corresponding RFC series for QEMU uses KVM_ARM_VCPU_PMU_V3_SET_PMU 
to probe host PMUs, and falls back to KVM_ARM_VCPU_PMU_V3_COMPOSITION if 
none covers all CPUs. Switching between SET_PMU and COMPOSITION is 
useful during such probing.

COMPOSITION is designed to behave like just another host PMU that is set 
with SET_PMU. SET_PMU allows setting a different host PMU even if 
SET_PMU has already been invoked so it is also allowed to set a host PMU 
even if COMPOSITION has already been invoked, maintaining consistency 
with non-composed PMUs.

You can find the QEMU patch at:
https://lore.kernel.org/qemu-devel/20250806-kvm-v1-1-d1d50b7058cd@rsg.ci.i.u-tokyo.ac.jp/

(look up KVM_ARM_VCPU_PMU_V3_SET_PMU for the probing code)

> 
>>>> +	case KVM_ARM_VCPU_PMU_V3_COMPOSITION:
>>>> +		return kvm_arm_pmu_v3_set_pmu_composition(vcpu);
>>>
>>> I'd prefer naming this something like 'KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY'.
>>> We will have the fixed instruction counter eventually which is another
>>> event we could potentially provide system-wide.
>>
>> The design decision to expose the cycle counter is driven by the motivation
>> to satisfy FEAT_PMU for the guest rather than the host capability.
>>
>> When we implement FEAT_PMUv3_ICNTR in the future, I think we will need to
>> add KVM_ARM_VCPU_PMU_V3_COMPOSITION_ICNTR or something. The resultig
>> emulated PMU will work only on host CPUs that have instruction counters; a
>> host CPU may lack one because it doesn't implement FEAT_PMUv3_ICNTR or has a
>> third-party PMU like apple-m1-cpu-pmu (this particular PMU has an
>> instruction counter fortunately).
> 
> No, this is at odds with the way we handle CPU features in KVM/arm64.
> 
> Ignoring this ioctl, the goal is that after KVM_ARM_VCPU_INIT the vCPU
> is initialized to the maximum possible feature set. If userspace wants
> to de-feature the VM it can do so by modifying the ID registers.
> 
> OTOH, your ioctl is dealing with something structural in how we
> support PMUs on the system. It should be defined as exposing all fixed
> counters that we support on a given piece of hardware. On systems
> without FEAT_PMUv3_ICNTR, the result should be a vPMU that only has the
> CPU cycle counter.
> 
> On a system that has FEAT_PMUv3_ICNTR, userspace can still use this
> ioctl and explicitly de-feature ICNTR by writing to the ID register
> after initialization.

Now I understand better.

Currently, KVM_ARM_VCPU_PMU_V3_COMPOSITION sets supported_cpus to ones 
that have cycle counters compatible with PMU emulation.

If FEAT_PMUv3_ICNTR is set to the ID register, I guess 
KVM_ARM_VCPU_PMU_V3_COMPOSITION will set supported_cpus to ones that 
have compatible cycle and instruction counters. If so, the naming 
KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY indeed makes sense.

Regards,
Akihiko Odaki

