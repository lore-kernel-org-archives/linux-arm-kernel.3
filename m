Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EDDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbPusrcXPnpYFyMiIMTwRTROLwgbaX8b1Agwe0KIe8E=; b=Zbtih7p7Fdhj3n2ItXC9wUT9vT
	Nv7RtqpNgJz0xF5ycUu+jDAgDfhdMdsJY+gi+mL09gTF9B70LYNMJvuhOLGfbsJMQpj6OUYo7RRMa
	iiq1pF3xNxlxEwUMMpwcuxI6YJ0DzRSRhvSJlhbPVPK4pA5Spw+pxYvhLVdmkv1YAkQO/OKHPAl1V
	ddLBizHY71MYkAcr+vbrs/P1uQ6FWd8eoooaJa2FaWuF8bh5E5P/Zk2e8e15jTqS1X6eG22OOZoEB
	RyWnCiSf30RQGKd1JD7cGdAsDpiZpz5FiXmRn0K+21G4oWylOzhlMLL5QUc1+ePLD7ZYpRrt4jA4f
	bHKLPmHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3zD-0000000Eqx2-11cA;
	Tue, 07 Jul 2026 11:29:11 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh3zA-0000000Eqw2-2QM4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:29:09 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 667BNfJs005495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 7 Jul 2026 20:23:42 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=FbPusrcXPnpYFyMiIMTwRTROLwgbaX8b1Agwe0KIe8E=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783423422; v=1;
        b=pUJ/OyF7ICHeyUEuLdKMr4YCFsLqDapVuMRnLQ1VG7qoZLxt4aFcFeO4o7kJliWn
         H3b7btpDubqYTMc9GZCHY5WXZStHC0PvxFiMDD07iruin19bvrgV4oOrmbqrFwGL
         2e6SFbIbSZA2dMHu2Ue3tvi0icj3flekDGu400ANaIoILfDXU2YSG92LLbGEfKwY
         qeakxzWWZshEsXfQfd+3pw9cJNbdEwZEsTMAMFX1PtjbqZUypMMGWCmgWfK2C6AI
         gS95j9Ph4YatoHewtYhkaTotazxRpdOEUFGz1u8zd/R7Fg7xuNZKLxD6q/fhCtwI
         dK+JUrYcPvBaufMKvSU3Lw==
Message-ID: <cb5d5f13-a1a9-47dd-a717-5533a8b32b20@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 7 Jul 2026 20:23:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-5-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvyvclUQ2b2YHiU@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <akvyvclUQ2b2YHiU@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_042908_852181_7F7FDA67 
X-CRM114-Status: GOOD (  31.12  )
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

On 2026/07/07 3:23, Oliver Upton wrote:
> On Mon, Jul 06, 2026 at 07:03:28PM +0900, Akihiko Odaki wrote:
>> Add internal state for PMUv3 emulation without programmable event
>> counters. When fixed-counters-only mode is active, KVM reports no
>> programmable counters and hides PMCEID, avoiding event-counter state
>> whose behavior can depend on the selected hardware PMU.
>>
>> The cycle counter still uses a host perf event. Unlike the normal PMU
>> path, fixed-counters-only mode may create that event from the hardware
>> PMU attached to the VCPU's current pCPU. If the VCPU later loads on a
>> pCPU that is not covered by the existing event's PMU, request a PMU
>> reload so the cycle counter can be recreated against the new pCPU's PMU.
>> Keep this affinity check limited to fixed-counters-only VMs; the normal
>> programmable-counter mode continues to use the VM-wide PMU and does not
>> need per-load reload decisions.
>>
>> Add a separate internal flag for explicit userspace PMU selection. The
>> UAPI wiring added later will use it to keep explicit PMU selection and
>> fixed-counters-only mode mutually exclusive while still allowing
>> fixed-counters-only mode to replace the default PMU selected during
>> KVM_ARM_VCPU_INIT.
>>
>> The UAPI wiring that sets the fixed-counters-only flag and records
>> explicit PMU selection is added later in the series.
>>
>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>> ---
>>   arch/arm64/include/asm/kvm_host.h |  4 ++++
>>   arch/arm64/kvm/arm.c              |  1 +
>>   arch/arm64/kvm/pmu-emul.c         | 43 +++++++++++++++++++++++++++++++++++++--
>>   include/kvm/arm_pmu.h             |  2 ++
>>   4 files changed, 48 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 0c39d9db7d57..aa07b05b8231 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -353,6 +353,10 @@ struct kvm_arch {
>>   #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS		10
>>   	/* Unhandled SEAs are taken to userspace */
>>   #define KVM_ARCH_FLAG_EXIT_SEA				11
>> +	/* PMUv3 is emulated with an explicitly specified hardware PMU */
>> +#define KVM_ARCH_FLAG_PMU_V3_EXPLICIT			12
>> +	/* PMUv3 is emulated without progammable event counters */
>> +#define KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY	13
>>   	unsigned long flags;
>>   
>>   	/* VM-wide vCPU feature set */
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 68767bb08285..1cc7754d5ace 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -687,6 +687,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>>   	if (has_vhe())
>>   		kvm_vcpu_load_vhe(vcpu);
>>   	kvm_arch_vcpu_load_fp(vcpu);
>> +	kvm_vcpu_load_pmu(vcpu);
>>   	kvm_vcpu_pmu_restore_guest(vcpu);
>>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
>> index e70628653e4b..40cad183376c 100644
>> --- a/arch/arm64/kvm/pmu-emul.c
>> +++ b/arch/arm64/kvm/pmu-emul.c
>> @@ -96,6 +96,11 @@ u64 kvm_pmu_evtyper_mask(struct kvm *kvm)
>>   	return mask;
>>   }
>>   
>> +static bool kvm_pmu_fixed_counters_only(struct kvm *kvm)
>> +{
>> +	return test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags);
>> +}
>> +
>>   /**
>>    * kvm_pmc_is_64bit - determine if counter is 64bit
>>    * @pmc: counter context
>> @@ -343,7 +348,11 @@ u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
>>   
>>   static void kvm_pmc_enable_perf_event(struct kvm_pmc *pmc)
>>   {
>> -	if (!pmc->perf_event) {
>> +	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>> +
>> +	if (!pmc->perf_event ||
>> +	    (kvm_pmu_fixed_counters_only(vcpu->kvm) &&
>> +	     !cpumask_test_cpu(vcpu->cpu, &to_arm_pmu(pmc->perf_event->pmu)->supported_cpus))) {
>>   		kvm_pmu_create_perf_event(pmc);
>>   		return;
>>   	}
>> @@ -720,6 +729,12 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>>   	int eventsel;
>>   	u64 evtreg;
>>   
>> +	if (kvm_pmu_fixed_counters_only(vcpu->kvm)) {
>> +		arm_pmu = kvm_pmu_probe_armpmu(vcpu->cpu);
>> +		if (WARN_ON_ONCE(!arm_pmu))
>> +			return;
>> +	}
>> +
>>   	evtreg = kvm_pmc_read_evtreg(pmc);
>>   
>>   	kvm_pmu_stop_counter(pmc);
>> @@ -748,7 +763,7 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>>   	 * Don't create an event if we're running on hardware that requires
>>   	 * PMUv3 event translation and we couldn't find a valid mapping.
>>   	 */
>> -	eventsel = kvm_map_pmu_event(vcpu->kvm->arch.arm_pmu, eventsel);
>> +	eventsel = kvm_map_pmu_event(arm_pmu, eventsel);
>>   	if (eventsel < 0)
>>   		return;
>>   
>> @@ -878,6 +893,9 @@ u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
>>   	u64 val, mask = 0;
>>   	int base, i, nr_events;
>>   
>> +	if (kvm_pmu_fixed_counters_only(vcpu->kvm))
>> +		return 0;
>> +
> 
> Even if we advertise bits in PMCEID, does it matter? There's no PMC that
> the guest could use to count it.
> 
> I understand it isn't aesthetic but I really want to minimize the
> special-casing that has to be done for this feature.

This strictly ensures that sysregs are stable after migrating across 
physical CPUs, which may have different PMCEID values.

> 
>> +void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu)
>> +{
>> +	/*
>> +	 * ARMV8_PMU_INSTR_IDX will need the same check once
>> +	 * FEAT_PMUv3_ICNTR is supported.
>> +	 */
>> +	struct kvm_pmc *pmc = kvm_vcpu_idx_to_pmc(vcpu, ARMV8_PMU_CYCLE_IDX);
>> +	struct arm_pmu *cpu_pmu;
>> +
>> +	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) ||
>> +	    !kvm_pmu_counter_is_enabled(pmc) || !pmc->perf_event)
>> +		return;
>> +
>> +	cpu_pmu = to_arm_pmu(pmc->perf_event->pmu);
>> +	if (!cpumask_test_cpu(vcpu->cpu, &cpu_pmu->supported_cpus))
>> +		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> 
> Just detect the changing PMU implementation here, KVM_REQ_RELOAD_PMU
> will need to detect the PMCs that require an update anyway. Stash the
> last cpu in kvm_arch_vcpu_load() and pass it to this:
> 
> void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
> {
> 	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu)
> 		return;
> 
> 	if (kvm_pmu_probe_armpmu(vcpu->cpu) != kvm_pmu_probe_armpmu(last_cpu))
> 		kvm_make_request(KVM_REQ_RELOAD_PMU);
> }

It is a nice way to simplify the code and to avoid hardcoding 
ARMV8_PMU_INSTR_IDX. I'll use the code for the next version.

Regards,
Akihiko Odaki

