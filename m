Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B610C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+vMZjC6xxNpIpgNOscrmsGFDoKnecoDkfgYlhZhUcA=; b=ENrC7+KXm0CiKhf61q3LRgYx8i
	qaWLCMaoLA1tzDyhpCD4WdDAFaWs6ZvJpXl2LM0NnX3nYVdbK5xQkNiMnihOlgzthy5NwbgJYdnqO
	rN6TrwTLaXm5Bbc1L7nqSvi7vb3l69Z+8RJYbSWwmG8LXWjbat2oRCZQT0DKg81aTM15Yq7X1P2P1
	IzvRLxJcIpnHRo+2B4cTQ+rLRJ/LHeKQ9iUlDK3BOeYoJOTADsaCvkHvlTbC6fgTCfl9LRj5xTEGS
	v6XLmXotxipZymHva/d2GrXgRcdy1qQ3VVHmyh4m/uTiFUDQzFUsUwkdIDeUy4+CNbT3ut0EMOSNE
	M3Lccdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0U4-0000000BoVa-447o;
	Wed, 30 Apr 2025 05:59:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0FD-0000000Bmvt-196b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:44:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F4D106F;
	Tue, 29 Apr 2025 22:44:23 -0700 (PDT)
Received: from [10.163.79.251] (unknown [10.163.79.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FC553F5A1;
	Tue, 29 Apr 2025 22:44:22 -0700 (PDT)
Message-ID: <c7629a41-4069-4206-ae70-ec145a70fc67@arm.com>
Date: Wed, 30 Apr 2025 11:14:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
 <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_224431_406170_4F85A31D 
X-CRM114-Status: GOOD (  20.51  )
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



On 29/04/25 7:27 pm, Lorenzo Stoakes wrote:
> On Tue, Apr 29, 2025 at 11:27:43AM +0200, David Hildenbrand wrote:
>> On 29.04.25 11:19, David Hildenbrand wrote:
>>>
>>>>     #include "internal.h"
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -			     pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +			      pte_t pte, struct folio *folio, unsigned int nr)
>>>>     {
>>>>     	struct page *page;
>>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>>     		 * write-fault handler similarly would map them writable without
>>>>     		 * any additional checks while holding the PT lock.
>>>>     		 */
>>>> -		page = vm_normal_page(vma, addr, pte);
>>>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +		if (!folio)
>>>> +			folio = vm_normal_folio(vma, addr, pte);
>>>> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
>>>
>>> Oh no, now I spot it. That is horribly wrong.
>>>
>>> Please understand first what you are doing.
>>
>> Also, would expect that the cow.c selftest would catch that:
>>
>> "vmsplice() + unmap in child with mprotect() optimization"
>>
>> After fork() we have a R/O PTE in the parent. Our child then uses vmsplice()
>> and unmaps the R/O PTE, meaning it is only left mapped by the parent.
>>
>> ret = mprotect(mem, size, PROT_READ);
>> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>
>> should turn the PTE writable, although it shouldn't.
> 
> This makes me concerned about the stability of this series as a whole...
> 
>>
>> If that test case does not detect the issue you're introducing, we should
>> look into adding a test case that detects it.
> 
> There are 25 tests that fail for the cow self-test with this series
> applied:
> 
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with base page
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (2048 kB)
> 
> 
> Dev, please take a little more time to test your series :) the current
> patch set doesn't compile and needs fixes applied to do so, and we're at
> v2, and you've clearly not run self-tests as these also fail.
> 
> Please ensure you do a smoke test and check compilation before sending out,
> as well as running self tests also.

Apologies, I over-confidently skipped over selftests, and didn't build 
for x86 :( Shall take care.

> 
> Thanks, Lorenzo
> 
>>
>> --
>> Cheers,
>>
>> David / dhildenb
>>


