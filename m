Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1417C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAtVm0nKN1t8bJ7OQtStF8q2ULpMIH6eJ6NiwCWHqPI=; b=X8dMCipcESV4uuLJALb137BPSL
	eXwdJjs2knHgBsXxvYzAgh8ySzNhfqGKVDvCuCUPjiBK2B5duxoN6XiiJ3lmjMZuO2DgfesKB7mIr
	8OgQSFP0Bob/+YVbsHXdspU7xoU3ecjFWtguuPxCMKEGLPzJChFKCwCXtHyZz5eMhlOxrQh4lGksF
	sme9CzxesZyLNflUucKwBNOKDgZyge5KT0nMJ4IJf7xrFVYHNJuh6g3HqOnjeiCMs67hR+BnQNzTP
	XI1pBPEWUE4cXljkJMszemQh9rVZOAYPz+yU/8BIMcSNomMamEqId4oM/8uEtcxWCVAPj8RGphKYD
	7tM8lBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4buU-0000000E2LT-0EUr;
	Thu, 10 Sep 2026 10:21:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4buS-0000000E2L3-0bz7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:21:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51C7D143D;
	Thu, 10 Sep 2026 03:21:31 -0700 (PDT)
Received: from [10.0.129.245] (unknown [10.0.129.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 899BA3F7B4;
	Thu, 10 Sep 2026 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789035695; bh=NdJwICU4hKphndkhJfKo4meJGdIZvN650SafLlOB/BM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k//7Ud38dQTnvnKQxVZAcd73FhyR9Iv9bKLlrmoT04DSSuniGXJGJi8nFSmCLEuE8
	 fX11Ow/pTfdIBC/fgh+DTGC9ZRproSkmFOyVb9rmmwngQfXyaH/MYJCYNZcxFenoQH
	 YnDm/TS+rtBLyZhhM83WRgOUSjTOe3zhZn+o0zjo=
Message-ID: <b7a8e864-d7a3-4765-8b62-c5452766769d@arm.com>
Date: Thu, 10 Sep 2026 11:21:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 04/20] KVM: arm64: Refactor the vcpu_load to allow for
 VM specific callbacks
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-5-suzuki.poulose@arm.com>
 <a0c5c373-b5c2-4ad2-9e53-ede58c392972@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a0c5c373-b5c2-4ad2-9e53-ede58c392972@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_032136_278340_FA047FD4 
X-CRM114-Status: GOOD (  19.27  )
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

On 10/09/2026 05:00, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
>> Based on a work by Marc Zyngier
>>
>> To keep the VCPU load/put handling cleaner with the different kinds of 
>> VM types,
>> we are about to introduce VM specific callbacks to do just the right 
>> thing.
>> In preparation for that, make some refactoring to add the change easier.
>>
>> No functional changes intended.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c | 46 +++++++++++++++++++++++++++-----------------
>>   1 file changed, 28 insertions(+), 18 deletions(-)
>>
> 
> Nitpicks below, none of them are introduced by this patch itself. In 
> either way:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>

Thank you !

> 
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 67f1ff9bc4fbe..51fc651267157 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -683,14 +683,11 @@ static bool kvm_vcpu_should_clear_twe(struct 
>> kvm_vcpu *vcpu)
>>       return single_task_running();
>>   }
>> -void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>> +static void vcpu_prepare_mmu(struct kvm_vcpu *vcpu)
>>   {
>>       struct kvm_s2_mmu *mmu;
>>       int *last_ran;
>> -    if (is_protected_kvm_enabled())
>> -        goto nommu;
>> -
>>       if (vcpu_has_nv(vcpu))
>>           kvm_vcpu_load_hw_mmu(vcpu);
>> @@ -720,10 +717,33 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, 
>> int cpu)
>>           kvm_call_hyp(__kvm_flush_cpu_context, mmu);
>>           *last_ran = vcpu->vcpu_idx;
>>       }
>> +}
>> +
>> +static void vcpu_set_wfx_traps(struct kvm_vcpu *vcpu)
>> +{
>> +    if (kvm_vcpu_should_clear_twe(vcpu))
>> +        vcpu->arch.hcr_el2 &= ~HCR_TWE;
>> +    else
>> +        vcpu->arch.hcr_el2 |= HCR_TWE;
>> +
>> +    if (kvm_vcpu_should_clear_twi(vcpu))
>> +        vcpu->arch.hcr_el2 &= ~HCR_TWI;
>> +    else
>> +        vcpu->arch.hcr_el2 |= HCR_TWI;
>> +}
>> +
> 
> It seems FIELD_MODIFY() can be applied here if no visible constraints 
> exist:
> 
>      FIELD_MODIFY(HCR_TWE, vcpu->arch.hcr_el2, ! 
> kvm_vcpu_should_clear_twe(vcpu));
>      FIELD_MODIFY(HCR_TWI, vcpu->arch.hcr_el2, ! 
> kvm_vcpu_should_clear_twi(vcpu));

I would leave this out for now. Can be a separate patch

> 
>> +static void vcpu_load_pvtime(struct kvm_vcpu *vcpu)
>> +{
>> +    if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>> +        kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>> +}
>> +
>> +void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>> +{
>> +    if (!is_protected_kvm_enabled())
>> +        vcpu_prepare_mmu(vcpu);
>>
> 
> I think we probably try to depend on kvm->arch.vm_flavor instead
> of !is_protected_kvm_enabled().
> 
>      struct kvm *kvm = vcpu->kvm;
> 
>      if (kvm_vm_is_protected(kvm) || kvm_vm_flavor_eq(kvm, VM_PKVM))
>          vcpu_prepare_mmu(vcpu);

This will be removed as part of the call back in the next patch.

Cheers
Suzuki

