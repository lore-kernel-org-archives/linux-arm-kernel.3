Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B48EC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWdukw8Lwo5D178NeO++XInMp2aCtmIcsueteb32N9I=; b=goJ9K7BE66KA9+JIgmnaI6pAMe
	nwbfnsNxxP5E5yxDl8PVC7Ml7g4v/EOOxzSMqGnnKUbpoohL4mzSmz+NPbuHAA/DQMP18ypfWH/R3
	Y+i8RrchOxbsjXalHETxNvspEo49tKjZeawtC9TVkgpNRCQSkBJY3kqU4czg5Wah8pLYTJpUXmUqh
	oO+iMlN1JQcr5yoBWcfySQH3PZNrDMCjAtE7rCcMQFUuI4PtQJUsjdRHYbF6l6xKuqkN/rzpPREne
	LdCreupb4nCkUZjRxWuymLlha7imf84xH8hlWdCmNi4eYrPY50YCZf2MBsJoxxgPGwcyicJGjj6wm
	pT+wT6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wa5-00000004rkF-0BXz;
	Tue, 22 Sep 2026 09:14:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wa3-00000004rju-3obF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 09:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qWdukw8Lwo5D178NeO++XInMp2aCtmIcsueteb32N9I=; b=j7LRsMgQ/cF2tuDnOGgmvzd5pu
	j/jxbBt/DJgnWbceIgw9MYOp0aqUJoHEjQdDmE8SSr/Z2p7M+3F+rsm59B51sndWpibxzJiBN8wZx
	oH5PbP6tqQDCATwW40C9TOanWQNfrlA9TJUoDLnl+RpODf0PKfoJ7llTHRDQFLfO5QEOydSszSImt
	mPJ8NJQXcUyD1yE+95LIdpFictYuBY30zN0f0BIgb0S50Ae5Vd6/nzwQzd+SxNv3LCq+Eg7He7Chs
	ujktoH7fZjXPAQW1G7MZXZLbx4Jw00h7qovCZjdUtBgc8KOmVRxjk8RW7I6TCwgEjKppoM9WeNlhS
	Mbzxiq6Q==;
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8wZy-0000000DLM2-3XFF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 09:14:26 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 68M9DR7H021356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 22 Sep 2026 18:13:27 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=qWdukw8Lwo5D178NeO++XInMp2aCtmIcsueteb32N9I=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1790068407; v=1;
        b=r18MYRiHmKiGcRo1ZPIgYuDx5mT4Drk6ugS5wVEuTfrZQkbGInaUGH+XIPh/w69U
         EaZH2vvrBWmoDHnWpbISp25FtvQA2v0gjQ5yon66dc1n3QEib6WWio7l4+4L7FEv
         DXKAd/bZ53zq5YqBBzHqZPhMypM/YuZpMZLe69B9n87ojxufmhNquUSW+GtAzRUz
         DVeO5038q+phoXydYDcRNPXK/KEmg7rhveGLZ0Xx6uV7GcRz/ZsMTG11Vibs+A9D
         L/owohAYoUw2rEZrcuw9ml3lcEy++eoq9besVkLLO/rmSspTSt1Kt7GqlRbzLvo+
         C/E2ZOEmuixnNMsre8OiWw==
Message-ID: <b9c1b996-2c01-4889-8f93-154ceb58c529@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 22 Sep 2026 18:13:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 20/21] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
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
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
        Sean Christopherson <seanjc@google.com>,
        Shannon Zhao <shannon.zhao@linaro.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <20260920-hybrid-v11-20-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <arIqMO-f8X0gCzjA@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <arIqMO-f8X0gCzjA@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101424_873121_FEAAB3C7 
X-CRM114-Status: GOOD (  28.91  )
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

On 2026/09/22 16:11, Oliver Upton wrote:
> On Sun, Sep 20, 2026 at 08:16:01PM +0900, Akihiko Odaki wrote:
>> Introduce the KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY attribute to
>> create a "fixed-counters-only" PMU.
>>
>> Much like KVM_ARM_VCPU_PMU_V3_IRQ and other read-write attributes, this
>> attribute provides a getter that facilitates kernel and userspace
>> debugging/testing.
>>
>> Allow strict PMUv3 vCPUs to initialize the PMU after selecting
>> fixed-counters-only mode, without selecting a VM-wide hardware PMU.
>>
>> Assisted-by: Codex:gpt-5.6-sol
>> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
>> ---
>>   Documentation/virt/kvm/api.rst          |  8 +++++--
>>   Documentation/virt/kvm/devices/vcpu.rst | 42 ++++++++++++++++++++++++++-------
>>   arch/arm64/include/uapi/asm/kvm.h       |  1 +
>>   arch/arm64/kvm/pmu-emul.c               | 34 ++++++++++++++++++++++----
>>   tools/arch/arm64/include/uapi/asm/kvm.h |  1 +
>>   5 files changed, 71 insertions(+), 15 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 1a90598901c5..a6aef405ef87 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -3531,9 +3531,13 @@ Possible features:
>>   
>>   	    * Userspace must explicitly select a PMU implementation before
>>   	      initializing the PMU or configuring a PMU event filter
>> +	      (KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY also satisfies the
>> +	      initialization requirement; event filtering remains unavailable
>> +	      in that mode)
>>   
>> -	    * If the PMU implements FEAT_PMUv3p4, PMMIR_EL1.SLOTS provides the
>> -	      hardware value of the underlying implementation
>> +	    * If a hardware PMU is selected and implements FEAT_PMUv3p4,
>> +	      PMMIR_EL1.SLOTS provides its hardware value. In fixed-counters-only
>> +	      mode, PMMIR_EL1 reads as zero
>>   
>>   	    * Writes to PMCR_EL0.N via KVM_SET_ONE_REG are ignored
>>   
>> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
>> index a3f20a4ee4b1..41f6d708ff43 100644
>> --- a/Documentation/virt/kvm/devices/vcpu.rst
>> +++ b/Documentation/virt/kvm/devices/vcpu.rst
>> @@ -53,9 +53,9 @@ Returns:
>>   	 =======  ======================================================
>>   	 -EEXIST  Interrupt number already used
>>   	 -ENODEV  PMUv3 not supported or GIC not initialized
>> -	 -ENXIO   PMUv3 not supported, missing VCPU feature, missing
>> -                  hardware PMU, or interrupt number not set (non-GICv5
>> -                  guests, only)
>> +	 -ENXIO   PMUv3 not supported, missing VCPU feature,
>> +		  neither hardware PMU nor FIXED_COUNTERS_ONLY selected,
>> +		  or interrupt number not set (non-GICv5 guests only)
>>   	 -EBUSY   PMUv3 already initialized
>>   	 =======  ======================================================
>>   
>> @@ -64,7 +64,8 @@ virtual GIC implementation, this must be done after initializing the in-kernel
>>   irqchip.
>>   
>>   When the KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature is enabled this must be done
>> -after selecting a hardware PMU.
>> +after selecting a hardware PMU or enabling
>> +KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY.
>>   
>>   1.3 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_FILTER
>>   -----------------------------------------
>> @@ -78,7 +79,8 @@ after selecting a hardware PMU.
>>   	 -ENODEV  PMUv3 not supported or GIC not initialized
>>   	 -ENXIO   PMUv3 not properly configured or in-kernel irqchip not
>>   	 	  configured as required prior to calling this attribute
>> -	 -EBUSY   PMUv3 already initialized or a VCPU has already run
>> +	 -EBUSY   PMUv3 already initialized, a VCPU has already run or
>> +		  FIXED_COUNTERS_ONLY has already been set
>>   	 -EINVAL  Invalid filter range
>>   	 =======  ======================================================
>>   
>> @@ -123,14 +125,14 @@ after selecting a hardware PMU.
>>   
>>   :Returns:
>>   
>> -	 =======  ====================================================
>> +	 =======  ===========================================================
>>   	 -EBUSY   PMUv3 already initialized, a VCPU has already run or
>> -                  an event filter has already been set
>> +                  an event filter or FIXED_COUNTERS_ONLY has already been set
>>   	 -EFAULT  Error accessing the PMU identifier
>>   	 -ENXIO   PMU not found
>>   	 -ENODEV  PMUv3 not supported or GIC not initialized
>>   	 -ENOMEM  Could not allocate memory
>> -	 =======  ====================================================
>> +	 =======  ===========================================================
>>   
>>   Request that the VCPU uses the specified hardware PMU when creating guest events
>>   for the purpose of PMU emulation. The PMU identifier can be read from the "type"
>> @@ -172,6 +174,30 @@ explicitly selected, or the number of counters is out of range for the
>>   selected PMU. Selecting a new PMU cancels the effect of setting this
>>   attribute.
>>   
>> +1.6 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
>> +------------------------------------------------------
>> +
>> +:Parameters: no additional parameter in kvm_device_attr.addr
>> +
>> +:Returns:
>> +
>> +	 =======  ==================================================
>> +	 -EBUSY   PMUv3 already initialized, a VCPU has already run,
>> +		  an event filter has already been set or
>> +		  a hardware PMU has already been specified
>> +	 -ENXIO   Attempted to get before setting
>> +	 -ENODEV  Attempted to set while PMUv3 not supported
>> +	 =======  ==================================================
>> +
>> +If set, KVM emulates PMUv3 without programmable event counters.
>> +
>> +With KVM_ARM_VCPU_PMU_V3_STRICT, enabling this attribute satisfies the
>> +PMU selection requirement for KVM_ARM_VCPU_PMU_V3_INIT.
>> +
>> +When this attribute is enabled, the vCPU can run on any physical CPU
>> +that has a PMU, regardless of the underlying implementation. This
>> +attribute is VM-scoped.
>> +
>>   2. GROUP: KVM_ARM_VCPU_TIMER_CTRL
>>   =================================
>>   
>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
>> index 65ee09bd1463..7a6a0af14f5a 100644
>> --- a/arch/arm64/include/uapi/asm/kvm.h
>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>> @@ -453,6 +453,7 @@ struct kvm_vgic_v5_ist {
>>   #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
>>   #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
>>   #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
>> +#define   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY	5
>>   #define KVM_ARM_VCPU_TIMER_CTRL		1
>>   #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
>>   #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
>> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
>> index 9c1e2f3e41db..ebb648eabdc6 100644
>> --- a/arch/arm64/kvm/pmu-emul.c
>> +++ b/arch/arm64/kvm/pmu-emul.c
>> @@ -1017,8 +1017,8 @@ int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
>>   
>>   static int kvm_arm_pmu_v3_init(struct kvm_vcpu *vcpu)
>>   {
>> -	/* Only possible when using KVM_ARM_VCPU_PMU_V3_STRICT */
>> -	if (!vcpu->kvm->arch.arm_pmu)
>> +	/* Strict PMUv3 requires a hardware PMU or fixed-counters-only mode. */
>> +	if (!vcpu->kvm->arch.arm_pmu && !kvm_pmu_fixed_counters_only(vcpu->kvm))
>>   		return -ENXIO;
>>   
>>   	if (irqchip_in_kernel(vcpu->kvm)) {
>> @@ -1153,8 +1153,8 @@ int kvm_arm_set_default_pmu(struct kvm *kvm)
>>   	 * affines the VMM to a particular cluster of cores.
>>   	 *
>>   	 * In any case, userspace should just do the sane thing and use the UAPI
>> -	 * to select a PMU type directly. But, be wary of the baggage being
>> -	 * carried here.
>> +	 * to select a PMU type directly, or request fixed-counters-only
>> +	 * emulation. But, be wary of the baggage being carried here.
>>   	 */
>>   	struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu(raw_smp_processor_id());
>>   
>> @@ -1179,11 +1179,13 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>>   		arm_pmu = entry->arm_pmu;
>>   		if (arm_pmu->pmu.type == pmu_id) {
>>   			if (kvm_vm_has_ran_once(kvm) ||
>> +			    kvm_pmu_fixed_counters_only(kvm) ||
>>   			    (kvm->arch.pmu_filter && kvm->arch.arm_pmu != arm_pmu)) {
>>   				ret = -EBUSY;
>>   				break;
>>   			}
>>   
>> +			set_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags);
>>   			kvm_arm_set_pmu(kvm, arm_pmu);
>>   			cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
>>   
>> @@ -1205,6 +1207,22 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>>   	return ret;
>>   }
>>   
>> +static int kvm_arm_pmu_v3_set_pmu_fixed_counters_only(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm *kvm = vcpu->kvm;
>> +
>> +	lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +	if (kvm_vm_has_ran_once(kvm) || kvm->arch.pmu_filter ||
>> +	    test_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags))
>> +		return -EBUSY;
>> +
>> +	set_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags);
>> +	kvm->arch.nr_pmu_counters = 0;
>> +
>> +	return 0;
>> +}
>> +
> 
> I'd rather that FIXED_COUNTERS_ONLY depend on the KVM_ARM_VCPU_PMU_V3_STRICT
> feature flag. The expectation of that flag is that userspace specifies a
> backing PMU implementation; your FIXED_COUNTERS_ONLY could just be seen
> as one such PMU implementation.

Hi Oliver,

Agreed. That will make the kernel code simpler by removing the need to 
track explicit hardware PMU selection separately with 
KVM_ARCH_FLAG_PMU_V3_EXPLICIT, since STRICT does not select a default 
PMU. Hopefully, it will also make maintaining the code a bit easier by 
reducing possible configuration combinations and encourage userspace to 
use STRICT.

I'll make this change for v2.

Regards,
Akihiko Odaki

