Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B59CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fFxYGiMqgI5PBut/uEZfu2ICiowv3oLmyA1gY5kjNo=; b=y4KGsSWQX6rkN/zNHst+rN+BMy
	BklrvD8zagSYOEFHAyc0aGW5WSwukkM2A9tMsp0yzD0zmsRMv/Bb8wUmEYHVNZlYtLU4vKlrLFv5V
	OZIbFJaAvWJl90iRWNOyBJtqZOobvVab45xn0EljFRrJwRJVAVw3n1lBTLzmwSwlAoo4Dj7rezRCi
	AvPCS7Lwvuw5ox1vvI0kGNwBaIAJDN1kWYOUm/L6SM4koEnm2KfVEn3f3MYBaPYXrWMEyVNIHx+dv
	Y7Gxl/IS+hwbO7AHM36p0E+xRs0MimiEvQ/YOmU/hl0/voRbxi0GzmuZjCzJh8t4mIyqNZ7Ods9C1
	HLpJaXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzE2P-0000000HRLI-48TN;
	Thu, 18 Sep 2025 12:47:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzE2O-0000000HRKd-0CMo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:47:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F3FB1A25;
	Thu, 18 Sep 2025 05:46:50 -0700 (PDT)
Received: from [10.163.74.75] (unknown [10.163.74.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B5693F673;
	Thu, 18 Sep 2025 05:46:52 -0700 (PDT)
Message-ID: <41443985-341b-4139-ab20-be2ac96e31d4@arm.com>
Date: Thu, 18 Sep 2025 18:16:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Elide TLB flush in certain pte protection
 transitions
To: Kefeng Wang <wangkefeng.wang@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, ryan.roberts@arm.com, baohua@kernel.org,
 pjaroszynski@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250918103638.77282-1-dev.jain@arm.com>
 <2bd52a76-c92a-431d-a26a-ad98ede14431@huawei.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <2bd52a76-c92a-431d-a26a-ad98ede14431@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_054700_202025_6FC52FCC 
X-CRM114-Status: GOOD (  16.65  )
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


On 18/09/25 5:52 pm, Kefeng Wang wrote:
>
>
> On 2025/9/18 18:36, Dev Jain wrote:
>> Currently arm64 does an unconditional TLB flush in mprotect(). This 
>> is not
>> required for some cases, for example, when changing from PROT_NONE to
>> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to 
>> emulate
>> growing into the non-main heaps), and unsetting uffd-wp in a range.
>>
>> Therefore, implement pte_needs_flush() for arm64, which is already
>> implemented by some other arches as well.
>>
>> Running a userspace program changing permissions back and forth between
>> PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time 
>> taken
>> for the none->rw transition, I get a reduction from 3.2 microseconds to
>> 2.95 microseconds, giving an 8.5% improvement.
>>
>
> Hi Dev，
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>> mm-selftests pass. Based on 6.17-rc6.
>>
>>   arch/arm64/include/asm/tlbflush.h | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h 
>> b/arch/arm64/include/asm/tlbflush.h
>> index 18a5dc0c9a54..4a566d589100 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -524,6 +524,35 @@ static inline void 
>> arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
>>   {
>>       __flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
>>   }
>> +
>> +static inline bool __pte_flags_need_flush(pteval_t oldval, pteval_t 
>> newval)
>> +{
>> +    pteval_t diff = oldval ^ newval;
>> +
>> +    /* invalid to valid transition requires no flush */
>> +    if (!(oldval & PTE_VALID) || (oldval & PTE_PRESENT_INVALID))
>> +        return false;
>> +
>> +    /* Transition in the SW bits and access flag requires no flush */
>> +    diff &= ~(PTE_SWBITS_MASK | PTE_AF);
>> +
>> +    if (!diff)
>> +        return false;
>> +    return true;
>> +}
>> +
>
> LibMicro mprotect testcase show 3~5% improvement with different size in
> old kernel(we did this before, but only check PTE_VALID and 
> PTE_PROT_NONE in our kernel), it seems that no one change other sw bit 
> by mprotect?

Not mprotect, but when unsetting uffd-wp, we do mwriteprotect_range -> 
uffd_wp_range -> change_protection() with MM_CP_UFFD_WP_RESOLVE set.


>
> Anyway, Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Thanks!


>
>> +static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
>> +{
>> +    return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
>> +}
>> +#define pte_needs_flush pte_needs_flush
>> +
>> +static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
>> +{
>> +    return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
>> +}
>> +#define huge_pmd_needs_flush huge_pmd_needs_flush
>> +
>>   #endif
>>     #endif
>

