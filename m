Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7E2CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 04:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5AH8qGUT4np4Y2Lgf4BNWvf4FP304S3GaOYN/oOaQE=; b=elKL3jgEpXHmYH0mXDG6RNBjen
	GWXPeDLweaI1RzxW2jxkBCKf55R/AbA0X34WqGXbGA5sFuexJqQbgaocJddHdmbShYZ3hw1ggUckP
	1qVgKraLiDoowsWoSjw27ribJtFZxFSdeKFpuSxnvCJ5LGBW/5OjfkxsHerfuxT8+B5ZEJCL2s2uJ
	57WLsXgZ5yxh0VJjkzlQ3JDAfvSOJKXBSfGpDKXYRqqLDr2bjAA4UBo6p5DxPVqpYYr3HdvjE6wEl
	M6MzvQq9ssMGb3FAYJOmrRh1ba3+C9V/CH+zd7EKV8tBa/QsY1EWiZqrusxAjfDwxHZE/PmnXLF+S
	MAEmVO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Xpp-00000008ksa-0YmP;
	Mon, 22 Sep 2025 04:07:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Xpl-00000008ksA-0f2D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 04:07:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EED841515;
	Sun, 21 Sep 2025 21:07:11 -0700 (PDT)
Received: from [10.164.18.52] (MacBook-Pro.blr.arm.com [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B35693F5A1;
	Sun, 21 Sep 2025 21:07:17 -0700 (PDT)
Message-ID: <3911c239-8945-46aa-8ca8-52ea16221b1a@arm.com>
Date: Mon, 22 Sep 2025 09:37:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64/mm: Elide TLB flush in certain pte protection
 transitions
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: wangkefeng.wang@huawei.com, ryan.roberts@arm.com, baohua@kernel.org,
 pjaroszynski@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250920051043.16421-1-dev.jain@arm.com>
 <d84eef92-115e-4b71-9146-86fc91244c15@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <d84eef92-115e-4b71-9146-86fc91244c15@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_210725_323131_5845B3ED 
X-CRM114-Status: GOOD (  23.89  )
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


On 21/09/25 5:53 pm, Anshuman Khandual wrote:
> On 20/09/25 10:40 AM, Dev Jain wrote:
>> Currently arm64 does an unconditional TLB flush in mprotect(). This is not
>> required for some cases, for example, when changing from PROT_NONE to
>> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulate
> The following transition does not require a TLB flush on all
> architectures ? In which case, should not this check be part
> of generic mprotect() itself.

You are probably correct - there should be some common transitions
like these which won't require flush on all arches. But that should
be part of a wider cleanup :) And, in the ppc version of this function,
I see that it returns true in the case of !radix_enabled(). So not
very sure.
  

>
> PROT_NONE ---> PROT_READ | PROT_WRITE
>> growing into the non-main heaps), and unsetting uffd-wp in a range.
>>
>> Therefore, implement pte_needs_flush() for arm64, which is already
>> implemented by some other arches as well.
> Agreed, defining pte_needs_flush() on the platform does make
> sense, if it brings some perf improvement without additional
> cost.
>> Running a userspace program changing permissions back and forth between
>> PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time taken
>> for the none->rw transition, I get a reduction from 3.2 microseconds to
>> 2.85 microseconds, giving a 12.3% improvement.
> But that's a very specific workload intended to demonstrate
> the use case for this change. Hence the improvement claimed
> here is not representative of real world work loads.

True, but as I state, glibc malloc commonly uses this protection
transition to extend the heap.

>> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> mm-selftests pass.
>>
>> v1->v2:
>>   - Drop PTE_PRESENT_INVALID and PTE_AF checks, use ptdesc_t instead of
>>     pteval_t, return !!diff (Ryan)
>>
>>   arch/arm64/include/asm/tlbflush.h | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index 18a5dc0c9a54..40df783ba09a 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -524,6 +524,33 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>>   {
>>   	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>>   }
>> +
>> +static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
>> +{
>> +	ptdesc_t diff = oldval ^ newval;
>> +
>> +	/* invalid to valid transition requires no flush */
>> +	if (!(oldval & PTE_VALID))
>> +		return false;
> Is not this true for all platforms which could be checked via
> pte_present() helper ? Hence should not this be moved inside
> the caller itself in generic MM ? I guess probably the above
> mentioned transition should be moved as well.
>
> PROT_NONE ---> PROT_READ | PROT_WRITE
>> +
>> +	/* Transition in the SW bits requires no flush */
>> +	diff &= ~PTE_SWBITS_MASK;
>> +
>> +	return !!diff;
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

