Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B816C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQq6DUgZdQL+RcasDRk4IXcqMmO/pJN3bgwv4895caA=; b=wI6p92Ul+SLP7A6MOtbq48qiwK
	DFJk+PI/3bIQsGfXQvwDvdbQmXNuNf2oR+QLVvE8Jm/RQjGsHWHwElRVXg2WvLpUlXkLp1c6XR1Ik
	J6WnQCehNCHpxMk/VCInohkdLAiI9FOkvpDs2b3SaQr1RE7o7sjeoMCrMMfiKGjHM1NqVqrpvHXqv
	Fu5UqURfHyRXiIqjhneQF17YW5Mq8hW2VV0GJSQAz6sk9lODEiNYrFClThJeotlVBT4w5iei84sLv
	PmW69mgcpYS6BR0piNgdcyBVMFYqF3mP1Pfn0I/128lkvQNJTxVtrU8UnlnBh3VOF0WJ8blX0hOUI
	08RNvqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSr5-00000009xfo-0VTc;
	Thu, 13 Feb 2025 06:37:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSpe-00000009xY3-21CX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:36:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AD961756;
	Wed, 12 Feb 2025 22:36:38 -0800 (PST)
Received: from [10.162.16.135] (a077893.blr.arm.com [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 502343F6A8;
	Wed, 12 Feb 2025 22:36:12 -0800 (PST)
Message-ID: <d4fcf981-ea24-4892-9173-2c6f4046c7c1@arm.com>
Date: Thu, 13 Feb 2025 12:06:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/16] mm/vmalloc: Warn on improper use of
 vunmap_range()
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
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-11-ryan.roberts@arm.com>
 <3bbae070-1ae3-4f5d-86ab-b3221425a1cb@arm.com>
 <faa89fec-4b02-4844-859e-3b0e7f402d89@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <faa89fec-4b02-4844-859e-3b0e7f402d89@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_223618_616694_9E00B3AC 
X-CRM114-Status: GOOD (  19.61  )
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



On 2/7/25 16:29, Ryan Roberts wrote:
> On 07/02/2025 08:41, Anshuman Khandual wrote:
>> On 2/5/25 20:39, Ryan Roberts wrote:
>>> A call to vmalloc_huge() may cause memory blocks to be mapped at pmd or
>>> pud level. But it is possible to subsquently call vunmap_range() on a
>>
>> s/subsquently/subsequently
>>
>>> sub-range of the mapped memory, which partially overlaps a pmd or pud.
>>> In this case, vmalloc unmaps the entire pmd or pud so that the
>>> no-overlapping portion is also unmapped. Clearly that would have a bad
>>> outcome, but it's not something that any callers do today as far as I
>>> can tell. So I guess it's jsut expected that callers will not do this.
>>
>> s/jsut/just
>>
>>>
>>> However, it would be useful to know if this happened in future; let's
>>> add a warning to cover the eventuality.
>>
>> This is a reasonable check to prevent bad outcomes later.
>>
>>>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>  mm/vmalloc.c | 8 ++++++--
>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index a6e7acebe9ad..fcdf67d5177a 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -374,8 +374,10 @@ static void vunmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>>>  		if (cleared || pmd_bad(*pmd))
>>>  			*mask |= PGTBL_PMD_MODIFIED;
>>>  
>>> -		if (cleared)
>>> +		if (cleared) {
>>> +			WARN_ON(next - addr < PMD_SIZE);
>>>  			continue;
>>> +		}
>>>  		if (pmd_none_or_clear_bad(pmd))
>>>  			continue;
>>>  		vunmap_pte_range(pmd, addr, next, mask);
>>> @@ -399,8 +401,10 @@ static void vunmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>>>  		if (cleared || pud_bad(*pud))
>>>  			*mask |= PGTBL_PUD_MODIFIED;
>>>  
>>> -		if (cleared)
>>> +		if (cleared) {
>>> +			WARN_ON(next - addr < PUD_SIZE);
>>>  			continue;
>>> +		}
>>>  		if (pud_none_or_clear_bad(pud))
>>>  			continue;
>>>  		vunmap_pmd_range(pud, addr, next, mask);
>> Why not also include such checks in vunmap_p4d_range() and __vunmap_range_noflush()
>> for corresponding P4D and PGD levels as well ?
> 
> The kernel does not support p4d or pgd leaf entries so there is nothing to check.> 
> Although vunmap_p4d_range() does call p4d_clear_huge(). The function is a stub
> and returns void (unlike p[mu]d_clear_huge()). I suspect we could just remove
> p4d_clear_huge() entirely. But that would be a separate patch to mm tree I think.
> 
> For pgd, there isn't even an equivalent looking function.
> 
> Basically at those 2 levels, it's always a table.

Understood, thanks !

