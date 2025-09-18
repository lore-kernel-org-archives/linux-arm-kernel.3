Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+djpnHoJozcgIahD2M23dB8w8kdg6udbkfJtQ7PBTQ=; b=2KRUwP+skjW9TZ8oOmAFlQgF5H
	4+74Hmzyyib5+FIVdpRlZpdBsWZEv249YcC6nC4Z5Jz459RerAA+3FKBepYEGoSNwwk/XuaG9yK9C
	DQ6GTk/WusxEZdygqDSplKXuiGHvcrAuBi1/J1OsZsBGCjSHH2UNMqU02VGu/VMZ8czawPEsflAiX
	9REHZi3hRMUn4T+Rd9q94q6wMFRyImeabDBdTp7xOw3zCtdS9Cy4FyvONhHLtaqIX9itkc6exJ5vT
	FuKtNLugsCHj+SGcelt8Wb3xbqMt5XuU/frVgaG18YaSFomVl79qJfmSS2Wk5Auj4X4GCjxmErO3q
	6gCR41GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGBz-00000000GUa-2dli;
	Thu, 18 Sep 2025 15:05:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGBw-00000000GTP-48Ns
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:05:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B83001764;
	Thu, 18 Sep 2025 08:04:51 -0700 (PDT)
Received: from [10.163.74.75] (unknown [10.163.74.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E1B43F66E;
	Thu, 18 Sep 2025 08:04:54 -0700 (PDT)
Message-ID: <5f4037e3-7aaa-4919-9220-8989790c333b@arm.com>
Date: Thu, 18 Sep 2025 20:34:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Elide TLB flush in certain pte protection
 transitions
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, wangkefeng.wang@huawei.com, baohua@kernel.org,
 pjaroszynski@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250918103638.77282-1-dev.jain@arm.com>
 <fb5818ec-dde9-4d53-ab0f-e28e5c2cab33@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fb5818ec-dde9-4d53-ab0f-e28e5c2cab33@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_080501_162223_81B52AF3 
X-CRM114-Status: GOOD (  22.85  )
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


On 18/09/25 6:19 pm, Ryan Roberts wrote:
> On 18/09/2025 11:36, Dev Jain wrote:
>> Currently arm64 does an unconditional TLB flush in mprotect(). This is not
>> required for some cases, for example, when changing from PROT_NONE to
>> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulate
>> growing into the non-main heaps), and unsetting uffd-wp in a range.
>>
>> Therefore, implement pte_needs_flush() for arm64, which is already
>> implemented by some other arches as well.
>>
>> Running a userspace program changing permissions back and forth between
>> PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time taken
>> for the none->rw transition, I get a reduction from 3.2 microseconds to
>> 2.95 microseconds, giving an 8.5% improvement.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> mm-selftests pass. Based on 6.17-rc6.
>>
>>   arch/arm64/include/asm/tlbflush.h | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 18a5dc0c9a54..4a566d589100 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -524,6 +524,35 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>>   {
>>   	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>>   }
>> +
>> +static inline bool __pte_flags_need_flush(pteval_t oldval, pteval_t newval)
> ptdesc_t is the preferred any-level type.

I keep forgetting this :)

>
>> +{
>> +	pteval_t diff = oldval ^ newval;
>> +
>> +	/* invalid to valid transition requires no flush */
>> +	if (!(oldval & PTE_VALID) || (oldval & PTE_PRESENT_INVALID))
> Is the PTE_PRESENT_INVALID really required? If the oldval was invalid, there
> can't be a TLB entry for it, so no flush is required; that's it, I think?
>
> In fact, PTE_PRESENT_INVALID is overlaid with PTE_NG; it only means
> PTE_PRESENT_INVALID when PTE_INVALID=0, so I think this is broken as is. Valid
> user-space PTEs always have PTE_NG set, so you will never flush.

Not sure I get you. The condition as I wrote means

1. If PTE_VALID is not set, then do not flush.
2. If PTE_VALID is set, *and* PTE_PRESENT_INVALID is set, then do not flush.

So when you say "it only means PTE_PRESENT_INVALID when PTE_INVALID=0", the
second condition meets that.

>
>> +		return false;
>> +
>> +	/* Transition in the SW bits and access flag requires no flush */
>> +	diff &= ~(PTE_SWBITS_MASK | PTE_AF);
> Could you explain your thinking on why PTE_AF changes don't need a flush? I
> would have thought if we want to clear the access flag, that would definitely
> require a flush? Otherwise how would the MMU know to set the acccess bit on next
> access if it already has a TLB entry?

You are correct, but AFAIK losing access bit information is not fatal, it will only
mess with page aging. So potentially reclaim will lose some accuracy.

>
>> +
>> +	if (!diff)
>> +		return false;
>> +	return true;
> Perhaps just "return !!diff;" here?

Sure.

>
> Thanks,
> Ryan
>
>
>> +}
>> +
>> +static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
>> +{
>> +	return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
>> +}
>> +#define pte_needs_flush pte_needs_flush
>> +
>> +static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
>> +{
>> +	return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
>> +}
>> +#define huge_pmd_needs_flush huge_pmd_needs_flush
>> +
>>   #endif
>>   
>>   #endif

