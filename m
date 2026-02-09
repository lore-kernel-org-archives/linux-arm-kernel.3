Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EC6E7E0B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMfba3FsPq67LjQUu31a/lCSuc8jZcI3oJ1xSlSxWtI=; b=KSxld+pTGszd8v8j2zRYn+ds++
	tD+W+ZCnvcSvvkMGvZ5vzgPHxPLZA8mVgzdWhvznBnLdgDI4OFm7kQHls6zijL9jxpI6paBw5Rg6I
	WAw7AQn375/pS9hBUIDC5MzWdUZGBvc2IIy/HSl8QN+FgCbPi/Ecel1gsiAt+ixYiGCIk0IEX89ot
	i79nvARenEGMD2Zldt4nPxhC74r9/qwj1HlFN9fcE+WSEgcWRNYN23176vD5465PeD4TKDLfXvU+R
	g9nifjs1hwhncCrIRuz/MuMacTpKyHadEbeXc0aP3aT6ukP87uBgDr6uj7ZIIVO2IPomZkePqmFsH
	nI/uSRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNhY-0000000F9V6-30xg;
	Mon, 09 Feb 2026 09:37:04 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNhU-0000000F9Th-2Fhq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770629817; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=cMfba3FsPq67LjQUu31a/lCSuc8jZcI3oJ1xSlSxWtI=;
	b=MCYxIBI/yFb2t84oZWB0/nnRfrtEPFazz6f4DcCv4JizTYM+yTnHZ75/Y19G3YTiWkW9QHLSoqlqss+lPzxTaX4WgAtMQDuXm4HPdFtfI/SsmfWCVNJJraQXUUeoisDW6RE3m7SNP2jLZ8wa8iHz2JRBnh6vtUZ1dfkVsLIUN04=
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WyqQrzH_1770629815 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 17:36:56 +0800
Message-ID: <280ae63e-d66e-438f-8045-6c870420fe76@linux.alibaba.com>
Date: Mon, 9 Feb 2026 17:36:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
To: "David Hildenbrand (Arm)" <david@kernel.org>, Chris Mason <clm@meta.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260128114936.72280-1-clm@meta.com>
 <de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com>
 <07d55759-a50a-457a-badd-85697174116f@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <07d55759-a50a-457a-badd-85697174116f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_013701_517195_5E7BC8BB 
X-CRM114-Status: GOOD (  17.08  )
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



On 2/9/26 5:09 PM, David Hildenbrand (Arm) wrote:
> On 1/29/26 02:42, Baolin Wang wrote:
>>
>>
>> On 1/28/26 7:47 PM, Chris Mason wrote:
>>> Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
>>>> Implement the Arm64 architecture-specific clear_flush_young_ptes() 
>>>> to enable
>>>> batched checking of young flags and TLB flushing, improving 
>>>> performance during
>>>> large folio reclamation.
>>>>
>>>> Performance testing:
>>>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, 
>>>> and try to
>>>> reclaim 8G file-backed folios via the memory.reclaim interface. I 
>>>> can observe
>>>> 33% performance improvement on my Arm64 32-core server (and 10%+ 
>>>> improvement
>>>> on my X86 machine). Meanwhile, the hotspot folio_check_references() 
>>>> dropped
>>>> from approximately 35% to around 5%.
>>>
>>> Hi everyone, I ran mm-new through my AI review prompts and this one was
>>> flagged.  AI review below:
>>>
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/ 
>>>> asm/pgtable.h
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -1838,6 +1838,17 @@ static inline int 
>>>> ptep_clear_flush_young(struct vm_area_struct *vma,
>>>>       return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>>>>   }
>>>>
>>>> +#define clear_flush_young_ptes clear_flush_young_ptes
>>>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>>> +                     unsigned long addr, pte_t *ptep,
>>>> +                     unsigned int nr)
>>>> +{
>>>> +    if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
>>>> +        return __ptep_clear_flush_young(vma, addr, ptep);
>>>
>>> Should this be checking !pte_valid_cont() instead of !pte_cont()?
>>>
>>> The existing ptep_clear_flush_young() above uses !pte_valid_cont() to
>>> determine when to take the fast path. The new function only checks
>>> !pte_cont(), which differs when handling non-present PTEs.
>>>
>>> Non-present PTEs (device-private, device-exclusive) can reach
>>> clear_flush_young_ptes() through folio_referenced_one()->
>>> clear_flush_young_ptes_notify(). These entries may have bit 52 set as
>>> part of their encoding, but they aren't valid contiguous mappings.
>>>
>>> With the current check, wouldn't such entries incorrectly trigger the
>>> contpte path and potentially cause contpte_clear_flush_young_ptes() to
>>> process additional unrelated PTEs beyond the intended single entry?
>>
>> Indeed. I previously discussed with Ryan whether using pte_cont() was 
>> enough, and we believed that invalid PTEs wouldn’t have the PTE_CONT 
>> bit set. But we clearly missed the device-folio cases. Thanks for 
>> reporting.
>>
>> Andrew, could you please squash the following fix into this patch? If 
>> you prefer a new version, please let me know. Thanks.
> 
> Isn't the real problem that we should never ever ever ever, try clearing 
> the young bit on a non-present pte?
> 
> See damon_ptep_mkold() how that is handled with the flushing/notify.
> 
> There needs to be a pte_present() check in the caller.

The handling of ZONE_DEVICE memory in check_pte() makes me me doubt my 
earlier understanding. And I think you are right.

	} else if (pte_present(ptent)) {
		pfn = pte_pfn(ptent);
	} else {
		const softleaf_t entry = softleaf_from_pte(ptent);

		/* Handle un-addressable ZONE_DEVICE memory */
		if (!softleaf_is_device_private(entry) &&
		    !softleaf_is_device_exclusive(entry))
			return false;

		pfn = softleaf_to_pfn(entry);
	}


> BUT
> 
> I recall that folio_referenced() should never apply to ZONE_DEVICE 
> folios. folio_referenced() is only called from memory reclaim code, and 
> ZONE_DEVICE pages never get reclaimed through vmscan.c

Thanks for clarifying. So I can drop the pte valid check.

