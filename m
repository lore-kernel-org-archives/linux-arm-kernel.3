Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F81AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Kt8lFenThYgu8kxIOK07B+P0mLU/h1dSlx04CNKmQo=; b=xytTKdUOW5+cnbai89X+RE1zWF
	cxsbyldxgDSuQhUhs/6r3jjKzU2kTfbt9rGx1SyJB4udhdxpBuC5XEZF5au2L9Ds65SW6bUXeV16S
	PfgDUuBLjLeKR84d8+6EJBntF0XUh1GZtGU0sLEkzVoH4+8yK7XwJChQmk+VX25WXytOtG7qCVSHR
	efMCc7QAvRVy/zdnrKj8lK1/U0WN/nqFgNy2UP3VxpBDhpOV5Q/QeEYsFjY+POwcvLkSK3LH4/KMr
	WvySLIIioIjEoML2fz//Vq5rMSVay0RdJsPZO7xh3Yojj6VNFfO4gbmcUlWlcTKEVXajrQBT2uJfE
	CsrEkedA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6S4-000000002Do-3F9Q;
	Mon, 28 Sep 2026 08:11:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Rr-0000000028y-3ldj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:10:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BAE01570;
	Mon, 28 Sep 2026 01:10:50 -0700 (PDT)
Received: from [10.57.12.79] (unknown [10.57.12.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5A2C3F86F;
	Mon, 28 Sep 2026 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790583053; bh=iX0JHr3OaK1F907tUkdtLXi8iMAHjfLYQ9uHjk2hIIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ItMPqOtowS0ZHlYRac5WKIgJ9uZtyWAWWq3/qzMaPipTg35S8D4i59hxkFzWQ0PAZ
	 MY0/f8DdQORcc2licSIabU2dBhHPp3dzpUT5etsrc/ndkO6ywv+1PRsBkvsMtYTQsJ
	 23fq3M4L2W07KsDbGcAExLWRwXfeOQKulXsWeHms=
Message-ID: <01361954-ad51-46ec-a9a1-89413fbb6084@arm.com>
Date: Mon, 28 Sep 2026 09:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-10-suzuki.poulose@arm.com>
 <647ae455-4175-4070-a40e-d2d89f18971f@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <647ae455-4175-4070-a40e-d2d89f18971f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_011056_037087_90C6DF46 
X-CRM114-Status: GOOD (  21.65  )
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

On 28/09/2026 02:09, Gavin Shan wrote:
> On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
>> Add VM type specific S2 MMU operation backends which can be 
>> initialized per
>> VM flavor, to keep the handling cleaner.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/include/asm/kvm_host.h |  15 ++++
>>   arch/arm64/kvm/mmu.c              | 137 +++++++++++++++++++++++++-----
>>   2 files changed, 131 insertions(+), 21 deletions(-)
>>
> 
> Apart from the comments from Jonathan, some nitpicks and questions below.
> 
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/ 
>> asm/kvm_host.h
>> index 149f4582c8b6a..7664d8b8cce5a 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -155,6 +155,19 @@ struct kvm_vcpu_ops {
>>       void (*vcpu_put)(struct kvm_vcpu *vcpu);
>>   };
>> +struct kvm_gfn_range;
>> +
>> +struct kvm_vm_s2_ops {
>> +    bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>> +    bool (*vm_test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range 
>> *range);
>> +    int (*vm_flush_remote_tlbs)(struct kvm *kvm);

...

>> @@ -166,6 +168,18 @@ static bool memslot_is_logging(struct 
>> kvm_memory_slot *memslot)
>>       return memslot->dirty_bitmap && !(memslot->flags & 
>> KVM_MEM_READONLY);
>>   }
>> +static int pkvm_flush_remote_tlbs(struct kvm *kvm)
>> +{
>> +    kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
>> +    return 0;
>> +}
>> +
>> +static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
>> +{
>> +    kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
>> +    return 0;
>> +}
>> +
>>   /**
>>    * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>>    * @kvm:    pointer to kvm structure.
>> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct 
>> kvm_memory_slot *memslot)
>>    */
>>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>>   {
>> -    if (is_protected_kvm_enabled())
>> -        kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
>> -    else
>> -        kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
>> -    return 0;
>> +    if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
>> +        return 1;
> 
> For the return value, I'm wandering if 0 should be returned. More details
> can be found below.

Answered below.

> 

...

>> +static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
>> +                     gfn_t gfn, u64 nr_pages)
>>   {
>>       u64 size = nr_pages << PAGE_SHIFT;
>>       u64 addr = gfn << PAGE_SHIFT;
>> -    if (is_protected_kvm_enabled())
>> -        kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
>> -    else
>> -        kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
>> +    kvm_tlb_flush_vmid_range(&kvm->arch.mmu, addr, size);
>>       return 0;
>>   }
>> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
>> +                     gfn_t gfn, u64 nr_pages)
>> +{
>> +    if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs_range)
>> +        return 1;
>> +
> 
> Realm would the only case where vm_s2_ops->vm_flush_remote_{tlbs, 
> tlbs_range) 
> are NULL. On request to flush remote TLBs by 
> kvm_flush_remote_tlbs_range(), it
> ends up with event KVM_REQ_TLB_FLUSH queued for each vCPU. How this 
> queued event
> is linked to a remote TLB flush for realm? The problem is TLBs are owned 
> by EL2
> realm and there are no RMI calls for the management. So I'm wandering we 
> should
> return 0 here?

Please note that, the Realm s2 callbacks are not NULL for 
flush_remote_tlb*. They all return 0, indicating that everything
is taken care of. (See Patch 14/20: KVM: arm64: CCA: Add bare minimal S2 
operations for Realm)
...

>> +
>> +#define KVM_VM_S2_OPS(flavor, ops)        \
>> +        [flavor] = ops
> 
> Parentheses are needed, to be consistent with KVM_VCPU_OPS at least.
> 
> #define KVM_VM_S2_OPS(flavor, ops)        \
>          [(flavor)] = (ops)
> 

Ack


> Actually, KVM_{VCPU, VM_S2}_OPS() can be combined to one in kvm_host.h 
> as below.
> 
> #define KVM_FLAVOR_OPS() [(flavor)] = (ops)

I would leave it as they are to avoid confusion.

Cheers
Suzuki



