Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF5C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 23:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx+7Cvg8isUxFeH6z2WpSGZoa4DTH5Yv66dUqJWf0oQ=; b=Ymks9HMZeEKHpBjpR5R6yXtRv4
	HLKUUgto8ZQzhOe+iTgEggTtIhbR9ZVKIGmxcqUOxCd4P6S5XrMqGbtIFgVHGZ5RsUINLt4LXdZtq
	jTn7vGHKkjkUWf7nxXxh5DyHbA+dojBevfm7WFDDpBh/5zyJowuRhOJIm5ex7FZnaEF3FPT6NA0iN
	OZQ3f35gvmip9w3idE5Jr+F9+8LuABcRF89ZcfAxt/LsPtOUe+6mOFoKmMbiID29mwvfCnyDlgKWN
	eBIU+v6u036XrssAjrG1g+ub4X25ou7eQQxxTY3Fd5cnoWI8xach1Y8OjI7cwjcOrYUMC9M7T/ejA
	uSX+TxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99oM-00000006j4N-4B88;
	Tue, 22 Sep 2026 23:22:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99oK-00000006j41-3Hp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 23:22:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B612F1576;
	Tue, 22 Sep 2026 16:21:59 -0700 (PDT)
Received: from [10.57.9.113] (unknown [10.57.9.113])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330CD3F86C;
	Tue, 22 Sep 2026 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790119323; bh=GV243Sx6YfNX1IPtn1LPRMxHhv8ZInKwRMvRpathHgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r7gUcOdOMOv1C/gWWu4mGGBEYrSaMXwZ8mqRjH60TE1NhqM7SW3se092K96TED1kO
	 oGmPi80Hqpj9IzN3/jCQ+CMl6IIMqzxJFMaGpkPDTStiWR6MXH2jzOf8pSghDBk5Ot
	 8KUfSwZMPtnWO5Z5uFTvyQ+vHqVT8a4EG5itKM0I=
Message-ID: <0d5201f0-359e-4748-92da-946dedf51bcf@arm.com>
Date: Wed, 23 Sep 2026 00:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2 MMU
 operations
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-10-suzuki.poulose@arm.com>
 <20260922152914.00001221@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260922152914.00001221@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_162204_916554_C9601B2B 
X-CRM114-Status: GOOD (  17.18  )
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

On 22/09/2026 23:29, Jonathan Cameron wrote:
> On Sun, 20 Sep 2026 22:28:34 +0100
> Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> 
>> Add VM type specific S2 MMU operation backends which can be initialized per
>> VM flavor, to keep the handling cleaner.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> A small suggestion inline that makes it explicit when there isn't
> range operation and a full flush of tlb is needed.
> 
> I don't mind either way, but thought I'd mention it anyway in case
> you hadn't already dismissed it.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> 
> 
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index 03f2017a7404a..d97a4a1bca23f 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
>>   
>>   #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
>>   
> 
>>   /**
>>    * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
>>    * @kvm:	pointer to kvm structure.
>> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
>>    */
>>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>>   {
>> -	if (is_protected_kvm_enabled())
>> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
>> -	else
>> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
>> -	return 0;
>> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
>> +		return 1;
> 
> For consistency with other cases and because it looks nicer
> blank line here.

Ack

> 
>> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
>>   }
>>   
>> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
>> -				      gfn_t gfn, u64 nr_pages)
>> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
>> +					gfn_t gfn, u64 nr_pages)
>> +{
>> +	return pkvm_flush_remote_tlbs(kvm);
> 
> For the cases where there isn't a range call, perhaps you should just
> not provide the op and have the wrapper fall back to
> calling the 'flush all' variant if there is no range one available?

The core KVM falls back to flushing all TLBs if the range one
returns true anyways. So, I would leave it as it is.

Cheers
Suzuki


> 
>> +}
> 
> 


