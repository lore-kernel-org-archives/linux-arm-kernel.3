Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNiAIZ534OAkHW760LdNnX/2crMlNmddevik7+U7zcg=; b=kGZXYRGL2Vie6NA82aokY7ZGas
	WWKbqYdaFbHf3lfTW2vp5vpHxg0ZmjewNWKJ0bRr/939mexUGpUrY/OOys645DVRJ4104FwUwRz6/
	DGI9LmSQfe4TqiSk+j3R5KlJ7DDyiEuU8EiLl+bNe9DNmRsv+oy/dKfvBlbXbu/orU1PvdVN9nyej
	7qy46Y2Mfw7qWfqSEjYsoPy8XajyFr/KWhBifLnR+Ge3xd0ZVeI1vzSdDCH2z3xlJEqc8Hipe/hRn
	IALJ/4flpM/K09ZjX+YeU0cNGFD5BWP9IyRxpKp7u2NnX8xSc6a7rnID+27upDlX36UrPjPEbXGd4
	aR/B/V8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFG-000000005xW-3qTg;
	Tue, 06 Oct 2026 06:01:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFE-000000005wY-2mnW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:01:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EF9C168F;
	Mon,  5 Oct 2026 23:01:40 -0700 (PDT)
Received: from [10.57.10.233] (unknown [10.57.10.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B4BA3F763;
	Mon,  5 Oct 2026 23:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791266503; bh=K5ZbFg0ad6QXuzcRw9vXkYN2H3KpO+AxVP0d6o2ZYfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KNxGHj4Y75GUVXBSpnYDZyrtIb1rQQbHv6uTZZCgA/BESWq1aQW6vGKVGXtGY5vTi
	 PuyO5ciX1UcbAZyJj47gAMCVKSWouSxeeczjXlIHisWimYRAu/6rME70AwIDc+9flR
	 WtQFpbIOAe90/rA6C1Fvdp3clq1F+u9TDpsPZi20=
Message-ID: <7b6ed626-eca4-41f2-ae56-0af59a931b29@arm.com>
Date: Tue, 6 Oct 2026 08:01:37 +0200
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
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <52e3e45a-751e-40b2-8dd3-3db589ddebee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_230144_782455_FD8710F2 
X-CRM114-Status: GOOD (  17.23  )
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

On 06/10/2026 06:47, Gavin Shan wrote:
> On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> The RMM restricts the access to the register states that the host can
>> read/modify for a given Realm.
>>
>> e.g., At VCPU creation, can modify GPRS (x0-x30) and PC.
>>        While servicing SMCCC calls via RSI_HOST_CALL or servicing PSCI
>>        requests.
>>        MMIO emulation in the unprotected space.
>>
>> Additionally we use the sysreg configuration to advertise/configure the
>> following Realm parameters, which are required before the Realm 
>> Descriptor
>> is created:
>>   - SVE Vector Length
>>   - Number of HW Breakpoints/Watchpoints
>>   - PMU Counters.
>>
>> Thus KVM also additionally allows access to ID_AA64DFR0_EL1 and 
>> SVE_VLS for
>> the configuration of Realm creation parameters. We don't support PMUs for
>> the Realm VMs yet, so PMCR is not exposed.
>>
>> The RMM makes similar restrictions for reading of the guest's registers
>> (this is *confidential* compute after all), however we don't impose the
>> restriction here. This allows the VMM to read (stale) values from the
>> registers which might be useful to read back the initial values even if
>> the RMM doesn't provide the latest version. For migration of a realm VM,
>> a new interface will be needed so that the VMM can receive an
>> (encrypted) blob of the VM's state.
>>
>> Reflect the above in KVM_GET_REG_LIST, KVM_SET_ONE_REG calls.

>>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, 
>> u64 off)
>>   {
>>       int size;
>> @@ -553,6 +572,9 @@ static int copy_core_reg_indices(const struct 
>> kvm_vcpu *vcpu,
>>           u64 reg = KVM_REG_ARM64 | KVM_REG_ARM_CORE | i;
>>           int size = core_reg_size_from_offset(vcpu, i);
>> +        if (vcpu_is_rec(vcpu) && !kvm_realm_validate_core_reg(i))
>> +            continue;
>> +
>>           if (size < 0)
>>               continue;
>> @@ -598,6 +620,9 @@ static unsigned long num_sve_regs(const struct 
>> kvm_vcpu *vcpu)
>>       if (!vcpu_has_sve(vcpu))
>>           return 0;
>> +    if (kvm_vm_is_realm(vcpu->kvm))
>> +        return 1; /* KVM_REG_ARM64_SVE_VLS */
>> +
>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>           return 1; /* KVM_REG_ARM64_SVE_VLS */
>>
> 
> Aren't above two checks conflicting to each other?

Do they? We allow SVE_VLS only for the Realms and we allow that
before the vCPUs are finalized. For normal VMs, depending on
whether the vcpus are finalized, we either send 1 or the full list.

> 
>> @@ -625,6 +650,10 @@ static int copy_sve_reg_indices(const struct 
>> kvm_vcpu *vcpu,
>>           return -EFAULT;
>>       ++num_regs;
>> +    /* For Realms only support SVE_VLS */
>> +    if (kvm_vm_is_realm(vcpu->kvm))
>> +        return num_regs;
>> +
>>       if (!kvm_arm_vcpu_sve_finalized(vcpu))
>>           return num_regs;
> 
> Same question here.

As above.

Suzuki

