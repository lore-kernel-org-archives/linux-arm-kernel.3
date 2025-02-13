Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97FBC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 05:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMQidJxq5pOpDUJEPxMXD+3QeoOWt7cGeE2UAXIIdt8=; b=vri0cYpl6IcQbX+DTzEDQMxAlN
	0XJkkQRZfc5B9lDlL6wJ27jZ+veN5MFb79pkcy1C6yHjjXpPhm454NaOtHLNGjO02lHjCawbdVAum
	Raqmt5Ukkp14hX++Br1xJk59e1J8EtIYGNhNfRn9AD7JG/Aj8q39dD29Nu61V3CuJJ9CeWC8B3ms4
	RjpGZnv5pqoF6VNID/+7qhO3fwP5DAApGxs1OHjgmIQc0miH0ScXUKNSa0uhMSwzM8EfvuOE+ukiF
	ygJcsCvaolM3yZWe40YOK3N/cJ/smG5IgShjPM/oa67Cyb3zhGiwROMwHadT/QN+kL2T8UuWXotDv
	XoWwCoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRM2-00000009lt6-3qsR;
	Thu, 13 Feb 2025 05:01:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiRIL-00000009lRM-2AZE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 04:57:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 914621756;
	Wed, 12 Feb 2025 20:58:08 -0800 (PST)
Received: from [10.162.16.135] (a077893.blr.arm.com [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFAC93F6A8;
	Wed, 12 Feb 2025 20:57:42 -0800 (PST)
Message-ID: <49149fa7-4775-4d44-91f6-ce67c1b0ac2c@arm.com>
Date: Thu, 13 Feb 2025 10:27:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/16] arm64: hugetlb: Fix flush_hugetlb_tlb_range()
 invalidation level
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-4-ryan.roberts@arm.com>
 <e2809c59-6453-4a90-88ad-0b22e82f869f@arm.com>
 <b2485f33-73fb-44b3-be36-9c5b6bae4d09@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b2485f33-73fb-44b3-be36-9c5b6bae4d09@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_205749_700121_E2B84BF5 
X-CRM114-Status: GOOD (  20.97  )
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



On 2/6/25 18:34, Ryan Roberts wrote:
> On 06/02/2025 06:46, Anshuman Khandual wrote:
>>
>>
>> On 2/5/25 20:39, Ryan Roberts wrote:
>>> commit c910f2b65518 ("arm64/mm: Update tlb invalidation routines for
>>> FEAT_LPA2") changed the "invalidation level unknown" hint from 0 to
>>> TLBI_TTL_UNKNOWN (INT_MAX). But the fallback "unknown level" path in
>>> flush_hugetlb_tlb_range() was not updated. So as it stands, when trying
>>> to invalidate CONT_PMD_SIZE or CONT_PTE_SIZE hugetlb mappings, we will
>>> spuriously try to invalidate at level 0 on LPA2-enabled systems.
>>>
>>> Fix this so that the fallback passes TLBI_TTL_UNKNOWN, and while we are
>>> at it, explicitly use the correct stride and level for CONT_PMD_SIZE and
>>> CONT_PTE_SIZE, which should provide a minor optimization.
>>>
>>> Cc: <stable@vger.kernel.org>
>>> Fixes: c910f2b65518 ("arm64/mm: Update tlb invalidation routines for FEAT_LPA2")
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>  arch/arm64/include/asm/hugetlb.h | 20 ++++++++++++++------
>>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
>>> index 03db9cb21ace..8ab9542d2d22 100644
>>> --- a/arch/arm64/include/asm/hugetlb.h
>>> +++ b/arch/arm64/include/asm/hugetlb.h
>>> @@ -76,12 +76,20 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
>>>  {
>>>  	unsigned long stride = huge_page_size(hstate_vma(vma));
>>>  
>>> -	if (stride == PMD_SIZE)
>>> -		__flush_tlb_range(vma, start, end, stride, false, 2);
>>> -	else if (stride == PUD_SIZE)
>>> -		__flush_tlb_range(vma, start, end, stride, false, 1);
>>> -	else
>>> -		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 0);
>>> +	switch (stride) {
>>> +	case PUD_SIZE:
>>> +		__flush_tlb_range(vma, start, end, PUD_SIZE, false, 1);
>>> +		break;
>>
>> Just wondering - should not !__PAGETABLE_PMD_FOLDED and pud_sect_supported()
>> checks also be added here for this PUD_SIZE case ?
> 
> Yeah I guess so. TBH, it's never been entirely clear to me what the benefit is?
> Is it just to remove (a tiny amount of) dead code when we know we don't support
> blocks at the level? Or is there something more fundamental going on that I've
> missed?

There is a generic fallback for PUD_SIZE in include/asm-generic/pgtable-nopud.h when
it is not defined on arm64 platform and pud_sect_supported() might also get optimized
by the compiler.

static inline bool pud_sect_supported(void)
{
        return PAGE_SIZE == SZ_4K;
}

IIUC this just saves dead code from being compiled as you mentioned.

> 
> We seem to be quite inconsistent with the use of pud_sect_supported() in
> hugetlbpage.c.

PUD_SIZE switch cases in hugetlb_mask_last_page() and arch_make_huge_pte() ? Those
should be fixed.

> 
> Anyway, I'll add this in, I guess it's preferable to follow the established pattern.

Agreed.

> 
> Thanks,
> Ryan
> 
>>
>>> +	case CONT_PMD_SIZE:
>>> +	case PMD_SIZE:
>>> +		__flush_tlb_range(vma, start, end, PMD_SIZE, false, 2);
>>> +		break;
>>> +	case CONT_PTE_SIZE:
>>> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, 3);
>>> +		break;
>>> +	default:
>>> +		__flush_tlb_range(vma, start, end, PAGE_SIZE, false, TLBI_TTL_UNKNOWN);
>>> +	}
>>>  }
>>>  
>>>  #endif /* __ASM_HUGETLB_H */
> 

