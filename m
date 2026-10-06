Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D82CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/mhq+95raDf+UhtEe5bOyCKcwW4YD3MC/mW/GGLuh0=; b=Q6we8OZ6S3EnZ1NK+JNueMNj2T
	DFxjySNwNbkHRiJUWJGX8anqJqwGTkQVV21EOzFRn5v9dd6/+54pk+DxNSLhXHb6aMM430UvpKE0S
	FTwEOSuxEBfbf7cofOKxG5MaYnmDovxQ5hV9QF4LSxZVgKwhNqPHYqfIm+PHaRaKDANPPbUTPKV1+
	POdqD19Yfei2/tkBMlvT1CU80ibXOHgJlEJQXo6NxkzGNMbqMtMt48F4WPrzN3wUoCi8YFdEqRiFZ
	bFogugvPMc8ufyXCMTyDAzi9vOBNuvlI6wrgm2VpVc65u2W2U6el8JLihwgbFAA2O4d99Cb5vFoI7
	2gkiwC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4Pj-00000000mFB-3akB;
	Tue, 06 Oct 2026 12:36:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4Pg-00000000mEI-22EY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:36:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFD51516;
	Tue,  6 Oct 2026 05:36:51 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86AD73F66F;
	Tue,  6 Oct 2026 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791290215; bh=HEC1onotm9kW6QKrnzD0dawCfe6JSLioR7zbkY+XEdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cmJHBHd/tPoaiaFDB+pHi4cdyG3iQqM8NNm9D0s0e54/KwUvvrB7GTB3RL6cbWQUN
	 uoQM/Uh3rx22FzyshOZ6d1yBpYp3ImxJ5asGG1AEspVgFgpMXPSikCEiVc/7247Qbr
	 RS8u+Ae3LpsMoBx8dZxP19enp8JguDuXyDk06wKg=
Message-ID: <71ceb680-e168-450e-99e0-7a8cf4160bba@arm.com>
Date: Tue, 6 Oct 2026 14:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 23/23] KVM: arm64: CCA: Control user register access
 for Realms
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-24-suzuki.poulose@arm.com>
 <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
 <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
 <6bd785aa-4693-407d-b70a-39b1d0eda63e@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <6bd785aa-4693-407d-b70a-39b1d0eda63e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_053656_605274_144EDA17 
X-CRM114-Status: GOOD (  21.07  )
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

On 06/10/2026 07:16, Gavin Shan wrote:
> On 10/6/26 4:01 PM, Suzuki K Poulose wrote:
>> On 06/10/2026 06:47, Gavin Shan wrote:
>>> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>>>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>>
>>>> The RMM restricts the access to the register states that the host can
>>>> read/modify for a given Realm.
>>>>
>>>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>>>        requests.
>>>>        MMIO emulation in the unprotected space.
>>>>
>>>> Additionally we use the sysreg configuration to advertise/configure the
>>>> following Realm parameters, which are required before the Realm 
>>>> Descriptor
>>>> is created:
>>>>   - SVE Vector Length
>>>>   - Number of HW Breakpoints/Watchpoints
>>>>   - PMU Counters.
>>>>
>>>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and 
>>>> SVE_VLS for
>>>> the configuration of Realm creation parameters. We don't support 
>>>> PMUs for
>>>> the Realm VMs yet, so PMCR is not exposed.
>>>>
>>>> The RMM makes similar restrictions for reading of the guest's registers
>>>> (this is *confidential* compute after all), however we don't impose the
>>>> restriction here. This allows the VMM to read (stale) values from the
>>>> registers which might be useful to read back the initial values even if
>>>> the RMM doesn't provide the latest version. For migration of a realm 
>>>> VM,
>>>> a new interface will be needed so that the VMM can receive an
>>>> (encrypted) blob of the VM's state.
>>>>
>>>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.
>>
>>>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, 
>>>> u64 off)
>>>>   {
>>>>       int size;
>>>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct 
>>>> kvm_vcpu *vcpu,
>>>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>>>           int size = core_reg_size_from_offset(vcpu, i);
>>>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>>>> +            continue;
>>>> +
>>>>           if (size < 0)
>>>>               continue;
>>>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct 
>>>> kvm_vcpu *vcpu)
>>>>       if (!vcpu_has_sve(vcpu))
>>>>           return 0;
>>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>> +

This could be vcpu_is_rec().
>>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>>>
>>>
>>> Aren't above two checks conflicting to each other?
>>
>> Do they? We allow SVE_VLS only for the Realms and we allow that
>> before the vCPUs are finalized. For normal VMs, depending on
>> whether the vcpus are finalized, we either send 1 or the full list.
>>
> 
> num_sve_regs() can be called for 3 cases: (a) non-finalized RECs; (b) 
> finalized
> RECs; (c) Other finalized vCPUs, correct? "if (kvm_vm_is_realm(vcpu- 
>  >kvm))", which
> would be "if (vcpu_is_rec(vcpu))", covers (a) and (b). We needn't the 
> excessive
> check "if (!kvm_arm_vcpu_sve_finalized(vcpu))". So the check would be 
> something
> as below after this series is applied:
> 
>      /*
>       * KVM_REG_ARM64_SVE_VLS is visible on realm vCPU no matter if it
>       * has been finalized.
>       */
>      if (vcpu_is_rec(vcpu))
>          return 1;
> 
> This check "if (vcpu_is_rec(vcpu))" belongs to PATCH[22]. Hope I make 
> myself
> clear this time :)

Sure, these two patches are closely related and may be even could be
folded in. I split it out to make it easier to review.

22: Allow exposing SVE_VLS for unfinalized VCPU RECs
23: Control register accesses includingthe SVE_VLS, but prevent
everything else

Does it help ?

Cheers
Suzuki


> 
>>>
>>>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct 
>>>> kvm_vcpu *vcpu,
>>>>           return -EFAULT;
>>>>       ++num_regs;
>>>> +    /* For Realms only support SVE_VLS */
>>>> +    if (kvm_vm_is_realm(vcpu->kvm))
>>>> +        return num_regs;
>>>> +
>>>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>>>           return num_regs;
>>>
>>> Same question here.
>>
>> As above.
>>
>> Suzuki
> 
> Thanks,
> Gavin
> 


