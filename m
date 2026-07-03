Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBFEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4iIBY89FDo1UzdzB/uBcAQK/RPNiJ0sNDuJsScMG6k=; b=nOALjs/ItsV55hqI412ISaqQel
	BEuoGI7dD34H0/adB+sVwQU+AufsdZX5ijIDqVC6tHwwv2ZntF9k30VimuSV1Mq/XUcYQqznoEcjH
	e9AVa4Sior/++OdAFmMks4Jag7ENf4of/738ETMLL9HGywoCOUv8Wv9dgT1K38ZYjYfBozmROItV3
	uXAEIl1lFfyJ6Ub0+cxlYsra28325liNIO0SaRuU2cEsvmZwHzInZ35C2T7OGhua1l83CuTkAGs5K
	oGKHrCAApIR39V2pWOqnqpHpZ5BzLP153qEm/xyhpRjKbQuSio64VtvDI+B5UuntQYxh1nhXQeHaq
	iOl8FUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWTp-000000064C9-2lYM;
	Fri, 03 Jul 2026 05:30:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWTk-000000064Bl-2jTj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:30:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22BD51D14;
	Thu,  2 Jul 2026 22:30:09 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C07E3F673;
	Thu,  2 Jul 2026 22:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783056613; bh=UFr9Wdq1njDGvt6poz4+T8rHJby7UnZmUIqtj/UdkVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YtDDG9+n6E2IK/NpzkunB8X0k+Xu7zlG2Mf5SenOvVidxgMMYHZg26V+CGrvrecH6
	 Phd+lP85qg5BeenR7AD3hjvJsYiHZNu7FLsqlY3Hi9oaCyU7BotAHiGSuPCbr1ubOC
	 BlLtVt9t0QMmj5jX0Bv5+rJ7pk5lVZwwL53kf6vU=
Message-ID: <1b1f6281-2a46-4811-bbea-24a666c0a772@arm.com>
Date: Fri, 3 Jul 2026 11:00:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mm/rmap: use huge_ptep_get() in try_to_unmap_one()
To: "David Hildenbrand (Arm)" <david@kernel.org>, muchun.song@linux.dev,
 osalvador@suse.de, akpm@linux-foundation.org, ljs@kernel.org,
 liam@infradead.org
Cc: riel@surriel.com, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, kas@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, rcampbell@nvidia.com, apopple@nvidia.com,
 ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, j-nomura@ce.jp.nec.com,
 nao.horiguchi@gmail.com, ak@linux.intel.com, mel@csn.ul.ie,
 pfalcato@suse.de, jpoimboe@kernel.org, dave.hansen@intel.com,
 tglx@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, stable@vger.kernel.org
References: <20260702051341.126509-1-dev.jain@arm.com>
 <20260702051341.126509-3-dev.jain@arm.com>
 <00d6e0fb-dcba-45d5-98c0-f5ed81604ca0@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <00d6e0fb-dcba-45d5-98c0-f5ed81604ca0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223020_852814_021E9056 
X-CRM114-Status: GOOD (  17.64  )
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



On 02/07/26 9:02 pm, David Hildenbrand (Arm) wrote:
> On 7/2/26 07:13, Dev Jain wrote:
>> try_to_unmap_one() handles hugetlb folios when memory failure needs
>> to replace a poisoned hugetlb mapping with a hwpoison entry. In that
>> case page_vma_mapped_walk() returns the pte pointer to the hugetlb folio
>> in pvmw.pte, but the code reads it with ptep_get().
>>
>> On arches which provide their own huge_ptep_get() to dereference a huge
>> pte pointer, accessing via ptep_get() would cause pte_pfn(), pte_present()
>> etc to misbehave.
>>
>> It is not clear whether this has a trivially visible effect to userspace.
>>
>> Just use huge_ptep_get() for dereferencing a huge pte pointer.
>>
>> Fixes: c7ab0d2fdc84 ("mm: convert try_to_unmap_one() to use page_vma_mapped_walk()")
>> Cc: stable@vger.kernel.org
>> Reported-by: David Hildenbrand <david@kernel.org>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  include/linux/hugetlb.h |  3 +++
>>  mm/rmap.c               | 16 ++++++++++------
>>  2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 2abaf99321e90..fdb7bdf7645c5 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -1261,6 +1261,9 @@ static inline void hugetlb_count_sub(long l, struct mm_struct *mm)
>>  {
>>  }
>>  
>> +pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr,
>> +		    pte_t *ptep);
> 
> Two tabs, or just in a single line.
> 
> If others prefer a stub, I don't care. This here is shortest to let the linker
> bail out.
> 
>> +
>>  static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>>  					  unsigned long addr, pte_t *ptep)
>>  {
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 1c77d5dc06e9f..aa8a254efaecc 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2095,11 +2095,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>>  		/* Unexpected PMD-mapped THP? */
>>  		VM_BUG_ON_FOLIO(!pvmw.pte, folio);
>>  
>> -		/*
>> -		 * Handle PFN swap PTEs, such as device-exclusive ones, that
>> -		 * actually map pages.
>> -		 */
> 
> That comment now actually belongs above the pte_present() check below.

Oops I mindlessly just copied the comment.

I will then rather put it in the else block which gets the pfn from the softleaf,
that is the most appropriate.

> 
> 


