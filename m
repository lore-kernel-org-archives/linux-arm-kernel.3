Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E76ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 04:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sq8Z7h0Ngl+qetDhFQzeGHuYXo5r4T1RmJdj0hNSgIE=; b=XgY7AXfha9svc9PIB0aBokUBKw
	D53eTm6ICXi2/sYb4ActqJ/h9iuS3xyPQzGFfSt/0ys+QD+GwOxFapU7h+S1wIUwezgN3kinW4R2c
	UpGnQpt8NnVhVKyn/VkonS/Sj3cRyxbMTWNWHVWK9Bxbnz5KOWR+Qx+Swlj2/Jpic7Wm7cLkQOSQA
	Xw8t24MgI4gWae9J/vEZIo+FtzmwOH/2v3xxFlKjwsdwD6xciKbcDu7xNmu2TDydFiQeysbxFFolZ
	Y3iVm/CS+KTSN01ajiBbB0GqwBjGQmW34z+WJjS7Ay+qqA10DiJ1RiajynLoLN5P/gNr9xGFodl4D
	DK13ahBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2q2-000000088be-1Q7k;
	Wed, 12 Nov 2025 04:52:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2py-000000088bF-34tN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 04:52:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD9971515;
	Tue, 11 Nov 2025 20:51:56 -0800 (PST)
Received: from [10.164.18.56] (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7B2A3F66E;
	Tue, 11 Nov 2025 20:52:01 -0800 (PST)
Message-ID: <24887a95-8959-4ae7-a8f3-6d5ce6ad6e41@arm.com>
Date: Wed, 12 Nov 2025 10:21:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND] [PATCH v2] arm64/mm: Elide TLB flush in certain pte
 protection transitions
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: wangkefeng.wang@huawei.com, ryan.roberts@arm.com, baohua@kernel.org,
 pjaroszynski@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251017160251.96717-1-dev.jain@arm.com>
 <fcb92f87-063e-4042-8313-0154941404fa@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <fcb92f87-063e-4042-8313-0154941404fa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_205206_896726_5185305B 
X-CRM114-Status: GOOD (  16.18  )
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


On 04/11/25 5:45 am, Anshuman Khandual wrote:
>
> On 17/10/25 9:32 PM, Dev Jain wrote:
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
>> 2.85 microseconds, giving a 12.3% improvement.
>>
>> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> mm-selftests pass. Based on 6.18-rc1.
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
> Using pte_valid() helper would be better.
>
> 	if (!pte_valid(oldval))
> 		return false;

Unfortunately, that would need asm/pgtable.h, which already includes asm/tlbflush.h,
leading to circular include.

If I put all this code into asm/pgtable.h, then pte_valid() needs a pte_t or a pmd_t
to work on, which forces us to break away from the nice abstraction of directing
both pte_needs_flush and huge_pmd_needs_flush to __pte_flags_need_flush.


>> +		return false;
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

