Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DEEC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ndk+CSdaZy4NvR0JNGUHITO+GFMdv5tl9jqpuIW6UfM=; b=THKDTWcWi0ppX3Z5E7xSUKchhK
	T17Lw9j92xzWMUaWKCFOodf4ju9JrhnOaZaYU8iUhWpBNOECU70YUKXs/SFEkw2ZLIkYi93Ash9AF
	gAO3PzAYcrI1ykcvBB39B5xR7TpJPu9fUhWBQV8KsmrO8NcMLmo6Ad71XRHIOULg8pqazbE9g2wBv
	2TZgG/8AsQOIVHihe35e/OfioNcrOcDFSPvhu29Q7vM3n0nNSPTDQsS+u8TV6VUohvvUAlFK0s8EJ
	az2dEd4WjvAgEgPA5toW3E/khYazMGaRTl9B7bnd9sS/YV50CS5OpwacnuvBJv8/2yrY5D3c3znNq
	pZWS/bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFfV-0000000BafC-47rg;
	Tue, 06 May 2025 10:36:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEQI-0000000BKEk-2k0x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 09:17:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5216E113E;
	Tue,  6 May 2025 02:17:00 -0700 (PDT)
Received: from [10.162.43.13] (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF7EB3F5A1;
	Tue,  6 May 2025 02:17:02 -0700 (PDT)
Message-ID: <0857761c-bb4c-4ea5-a96a-90d555673527@arm.com>
Date: Tue, 6 May 2025 14:46:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_021710_819527_ECA50896 
X-CRM114-Status: GOOD (  17.29  )
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



On 29/04/25 2:57 pm, David Hildenbrand wrote:
> On 29.04.25 11:19, David Hildenbrand wrote:
>>
>>>    #include "internal.h"
>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> -                 pte_t pte)
>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned 
>>> long addr,
>>> +                  pte_t pte, struct folio *folio, unsigned int nr)
>>>    {
>>>        struct page *page;
>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct 
>>> *vma, unsigned long addr,
>>>             * write-fault handler similarly would map them writable 
>>> without
>>>             * any additional checks while holding the PT lock.
>>>             */
>>> -        page = vm_normal_page(vma, addr, pte);
>>> -        return page && PageAnon(page) && PageAnonExclusive(page);
>>> +        if (!folio)
>>> +            folio = vm_normal_folio(vma, addr, pte);
>>> +        return folio_test_anon(folio) && ! 
>>> folio_maybe_mapped_shared(folio);
>>
>> Oh no, now I spot it. That is horribly wrong.
>>
>> Please understand first what you are doing.
> 
> Also, would expect that the cow.c selftest would catch that:
> 
> "vmsplice() + unmap in child with mprotect() optimization"
> 
> After fork() we have a R/O PTE in the parent. Our child then uses 
> vmsplice() and unmaps the R/O PTE, meaning it is only left mapped by the 
> parent.
> 
> ret = mprotect(mem, size, PROT_READ);
> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
> 
> should turn the PTE writable, although it shouldn't.
> 
> If that test case does not detect the issue you're introducing, we 
> should look into adding a test case that detects it.
> 

Hi David, I am afraid I don't understand my mistake :( PageAnon(page) 
boils down to folio_test_anon(folio). Next we want to determine whether 
the page underlying a PTE is mapped exclusively or not. I approximate 
this by folio_maybe_mapped_shared -> if the folio => all pages are 
mapped exclusively, then I convert the entire batch to writable. If one 
of the pages is mapped shared, then I do not convert the batch to 
writable, thus missing out on the optimization. As far as I understand,
the test failure points out exactly this right?

Do you suggest an alternate way? My initial approach was to add a new 
flag to folio_pte_batch: FPB_IGNORE_ANON_EXCLUSIVE, but from an API 
design PoV Ryan pointed out that that looked bad.


