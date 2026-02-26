Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53878FCE09B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U6yxzdjHPJtMPBuIvp6F14KKaiWFcbdjaF+l9vhFiI=; b=at6NpmD7IPtvmRgKiH8Ep96muC
	NajeZDVcgFrOdQGSfyoUdMy0AeJv1VDaxQ/ExzFUTRtZzwur4QiNGSHi6AQfjAiShX9j40rslcK8R
	rimTRqYKDqF2gL8lzPZ3okfKdNaGcAPXLwQU4133Tv9KRz0yXLGQ3xgxfPSmBN7stfLaIaYGpavLv
	kHeIz8XI2uZvWMoYfOag2utl6qtD8Rp5PEZ5BIjULqypoUGCOCtUjxk7bt/Qd/xWcBbsFsqjFcJ23
	xq/r8faoO6hihQcIb3M+UTY8Ht8PeCdQ1qUKeCqpI316uaI+xFJBHSwQlyphchr4TlFhnGOKEciP4
	hRQqyuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcgJ-00000006NSV-1cht;
	Thu, 26 Feb 2026 14:49:35 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcgG-00000006NPV-1pvV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 14:49:34 +0000
Received: from [192.168.10.111] (p865013-ipoe.ipoe.ocn.ne.jp [153.242.222.12])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 61QEhMY7067270
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 26 Feb 2026 23:43:40 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=8U6yxzdjHPJtMPBuIvp6F14KKaiWFcbdjaF+l9vhFiI=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1772117020; v=1;
        b=rbCWqsHs8qkR6pEdW97cLAFO0Ot06Rag+z/McXKclYvbL+T77+rFesyNtzSiVXvH
         7jF3qzzM6bnqtpmwPbdKeansx5vJoCirV9AN+Z2gkS14Baf1Vfsz1ihODsx1/43h
         q/GygGV7h8fymcUC8xP2ah9xzOrzU25GEIt89iWGLpEFXsZ1E4KX4C9G+gtU13aU
         Wnt/4+y0At3KxDSjC3JmAs0zeqtmf+hF19RVvKsxaZ2Cb5MOOiuYei0/OuHwSGZP
         O5LyQvp9qqTax+U+eF1HOVuwg/K1KxvT6ZR4xMvb+hoKfRW4bWnvza/8JdWLWE/g
         poBoZEw7feXAlNJmErX89Q==
Message-ID: <fbcadab4-676b-44e4-8afa-b8bd095f8981@rsg.ci.i.u-tokyo.ac.jp>
Date: Thu, 26 Feb 2026 23:43:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Subject: Re: [PATCH v3 1/2] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
To: Oliver Upton <oupton@kernel.org>
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
References: <20260225-hybrid-v3-0-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
 <20260225-hybrid-v3-1-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
 <aaA0gn9O8QAf9Gpu@kernel.org>
Content-Language: en-US
In-Reply-To: <aaA0gn9O8QAf9Gpu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_064932_918211_9CFB42EE 
X-CRM114-Status: GOOD (  32.66  )
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

On 2026/02/26 20:54, Oliver Upton wrote:
> Hi Akihiko,
> 
> On Wed, Feb 25, 2026 at 01:31:15PM +0900, Akihiko Odaki wrote:
>> @@ -629,6 +629,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>>   		kvm_vcpu_load_vhe(vcpu);
>>   	kvm_arch_vcpu_load_fp(vcpu);
>>   	kvm_vcpu_pmu_restore_guest(vcpu);
>> +	if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &vcpu->kvm->arch.flags))
>> +		kvm_make_request(KVM_REQ_CREATE_PMU, vcpu);
> 
> We only need to set the request if the vCPU has migrated to a different
> PMU implementation, no?

Indeed. I was too lazy to implement such a check since it won't affect 
performance unless the new feature is requested, but having one may be 
still nice.

> 
>>   	if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>   		kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>>   
>> @@ -1056,6 +1058,9 @@ static int check_vcpu_requests(struct kvm_vcpu *vcpu)
>>   		if (kvm_check_request(KVM_REQ_RELOAD_PMU, vcpu))
>>   			kvm_vcpu_reload_pmu(vcpu);
>>   
>> +		if (kvm_check_request(KVM_REQ_CREATE_PMU, vcpu))
>> +			kvm_vcpu_create_pmu(vcpu);
>> +
> 
> My strong preference would be to squash the migration handling into
> kvm_vcpu_reload_pmu(). It is already reprogramming PMU events in
> response to other things.

Can you share a reason for that?

In terms of complexity, I don't think it will help reducing complexity 
since the only common things between kvm_vcpu_reload_pmu() and 
kvm_vcpu_create_pmu() are the enumeration of enabled counters, which is 
simple enough.

In terms of performance, I guess it is better to keep 
kvm_vcpu_create_pmu() small since it is triggered for each migration.

> 
>>   		if (kvm_check_request(KVM_REQ_RESYNC_PMU_EL0, vcpu))
>>   			kvm_vcpu_pmu_restore_guest(vcpu);
>>   
>> @@ -1516,7 +1521,8 @@ static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
>>   	 * When the vCPU has a PMU, but no PMU is set for the guest
>>   	 * yet, set the default one.
>>   	 */
>> -	if (kvm_vcpu_has_pmu(vcpu) && !kvm->arch.arm_pmu)
>> +	if (kvm_vcpu_has_pmu(vcpu) && !kvm->arch.arm_pmu &&
>> +	    !test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags))
>>   		ret = kvm_arm_set_default_pmu(kvm);
> 
> I'd rather just initialize it to a default than have to deal with the
> field being sometimes null.

I agree. I'll change this with the next version.

> 
>> -static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
>> +static u64 kvm_pmu_enabled_counter_mask(struct kvm_vcpu *vcpu)
>>   {
>> -	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>> -	unsigned int mdcr = __vcpu_sys_reg(vcpu, MDCR_EL2);
>> +	u64 mask = 0;
>>   
>> -	if (!(__vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & BIT(pmc->idx)))
>> -		return false;
>> +	if (__vcpu_sys_reg(vcpu, MDCR_EL2) & MDCR_EL2_HPME)
>> +		mask |= kvm_pmu_hyp_counter_mask(vcpu);
>>   
>> -	if (kvm_pmu_counter_is_hyp(vcpu, pmc->idx))
>> -		return mdcr & MDCR_EL2_HPME;
>> +	if (kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E)
>> +		mask |= ~kvm_pmu_hyp_counter_mask(vcpu);
>>   
>> -	return kvm_vcpu_read_pmcr(vcpu) & ARMV8_PMU_PMCR_E;
>> +	return __vcpu_sys_reg(vcpu, PMCNTENSET_EL0) & mask;
>> +}
>> +
>> +static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
>> +{
>> +	struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>> +
>> +	return kvm_pmu_enabled_counter_mask(vcpu) & BIT(pmc->idx);
>>   }
> 
> You're churning a good bit of code, this needs to happen in a separate
> patch (if at all).

It makes sense. The next version will have a separate patch for this.

> 
>> @@ -689,6 +710,14 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>>   	int eventsel;
>>   	u64 evtreg;
>>   
>> +	if (!arm_pmu) {
>> +		arm_pmu = kvm_pmu_probe_armpmu(vcpu->cpu);
> 
> kvm_pmu_probe_armpmu() takes a global mutex, I'm not sure that's what we
> want.
> 
> What prevents us from opening a PERF_TYPE_RAW event and allowing perf to
> work out the right PMU for this CPU?

Unfortunately perf does not seem to have a capability to switch to the 
right PMU. tools/perf/Documentation/intel-hybrid.txt says the perf tool 
creates events for each PMU in a hybird configuration, for example.

> 
>> +		if (!arm_pmu) {
>> +			vcpu_set_on_unsupported_cpu(vcpu);
> 
> At this point it seems pretty late to flag the CPU as unsupported. Maybe
> instead we can compute the union cpumask for all the PMU implemetations
> the VM may schedule on.

This is just a safe guard and it is a responsibility of the userspace to 
schedule the VCPU properly. It is conceptually same with what 
kvm_arch_vcpu_load() does when migrating to an unsupported CPU.

> 
>> @@ -1249,6 +1299,10 @@ int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>   		irq = vcpu->arch.pmu.irq_num;
>>   		return put_user(irq, uaddr);
>>   	}
>> +	case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
>> +		lockdep_assert_held(&vcpu->kvm->arch.config_lock);
>> +		if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &vcpu->kvm->arch.flags))
>> +			return 0;
> 
> We don't need a getter for this, userspace should remember how it
> provisioned the VM.

The getter is useful for debugging and testing. The selftest will use it 
to query the current state.

Regards,
Akihiko Odaki

