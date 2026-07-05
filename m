Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0341C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzujVr18fVNG1CGW2r+8XijcSr52A2RjAyJBa5BWDew=; b=AT7FAgEeVjwMNzjCm3BwzIzX2Y
	kEfh5WpVwvG78kPVPTMGSCee/iclGupm9O3eGyGOIIAIfE9wm8IX+nyiZ3LeCaZVzqXFOwEimfIo9
	BoL+fbxjh7HP9/0f2LC0UwSMFZUH2U1bfmjMeytSANvk5bhIGB+CODHIgS7EFgsBtDKRhVNz9UU7M
	5jU/rDek/DXxeDUGekZusFpYTFCXCVRl4M2hXCEQt9XxdKTCveVk1gYh/jqAoMxhyRICe9Ahr5h6I
	ZpBltWIyKgTTjRFFyPsEY4lBkF+P1Kzi4uWX0qpD4JHajbn3qoYzHROiKU7R2PG5ffCrEx5BESn4I
	FCcvH4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIW6-00000009A84-1iN5;
	Sun, 05 Jul 2026 08:47:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgIW4-00000009A7h-1jEm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:47:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D28A61BC0;
	Sun,  5 Jul 2026 01:47:49 -0700 (PDT)
Received: from [10.57.73.18] (unknown [10.57.73.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B2283F905;
	Sun,  5 Jul 2026 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783241274; bh=JsVD3xgu8GOXprojLDEYGOUJZZvxJv3jyyYwMODAXWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iS9CEnHSna+motWt1dFRve7lVcWw4D/qHVvqh/moS5wd0vM7yPfDA+kl9rn6sVGFU
	 H+hSdKJhV/DbM0rzW+yGzlZalReY3W32e5l6Dq5j2Qfbhz2RzJgZkt7Jk1cj9hsAfQ
	 dx0nYjG6ApWeQU85l/W+hKapct41k6XhsIkYVXVA=
Message-ID: <e4513917-e02a-4e60-9df5-f90085d6193d@arm.com>
Date: Sun, 5 Jul 2026 14:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] mm/mprotect: use huge_ptep_get() for hugetlb
To: Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 david@kernel.org, liam@infradead.org, riel@surriel.com, vbabka@kernel.org,
 harry@kernel.org, jannh@google.com, lance.yang@linux.dev, kas@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
 rcampbell@nvidia.com, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 gourry@gourry.net, ying.huang@linux.alibaba.com, ak@linux.intel.com,
 nao.horiguchi@gmail.com, mel@csn.ul.ie, j-nomura@ce.jp.nec.com,
 pfalcato@suse.de, tglx@kernel.org, dave.hansen@intel.com,
 jpoimboe@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com
References: <20260703114202.365553-1-dev.jain@arm.com>
 <20260703114202.365553-7-dev.jain@arm.com>
 <20260705013337.2bbc075b508b5db36b954051@linux-foundation.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260705013337.2bbc075b508b5db36b954051@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_014756_531081_8F23469A 
X-CRM114-Status: GOOD (  14.57  )
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



On 05/07/26 2:03 pm, Andrew Morton wrote:
> On Fri,  3 Jul 2026 11:41:59 +0000 Dev Jain <dev.jain@arm.com> wrote:
> 
>> prot_none_hugetlb_entry() is the hugetlb callback for the early
>> mprotect(PROT_NONE) PFN permission walk on x86.
>>
>> The callback passes the decoded PFN to pfn_modify_allowed(). For a
>> hugetlb callback, the pte pointer refers to a hugetlb entry. On
>> architectures where hugetlb entries need huge_ptep_get(), reading that
>> entry with ptep_get() can make the permission check use the wrong PFN.
>>
>> Use huge_ptep_get() before decoding the hugetlb PFN.
>>
>> Currently there is no path which can trigger a bug: huge_ptep_get() is a
>> simple ptep_get() for x86, and the prot_none walk occurs only for x86.
>>
>> So no need to backport - use the correct helper anyways.
>>
>> ...
>>
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -699,14 +699,20 @@ static int prot_none_pte_entry(pte_t *pte, unsigned long addr,
>>  		0 : -EACCES;
>>  }
>>  
>> +#ifdef CONFIG_HUGETLB_PAGE
>>  static int prot_none_hugetlb_entry(pte_t *pte, unsigned long hmask,
>>  				   unsigned long addr, unsigned long next,
>>  				   struct mm_walk *walk)
>>  {
>> -	return pfn_modify_allowed(pte_pfn(ptep_get(pte)),
>> -				  *(pgprot_t *)(walk->private)) ?
>> -		0 : -EACCES;
>> +	const pte_t entry = huge_ptep_get(walk->mm, addr, pte);
>> +
>> +	if (pfn_modify_allowed(pte_pfn(entry), *(pgprot_t *)(walk->private)))
>> +		return 0;
>> +	return -EACCESS;
> 
> "EACCES".
> 
>>  }
>> +#else
>> +#define prot_none_hugetlb_entry	NULL
>> +#endif
> 
> Presumably your .config resulted in this change not being tested...

Thanks for folding in the fix!

On arm64, this entire path does not exist. The prot none pagewalk is
only done on x86. Also before sending patches I do an LLM review and
very surprisingly the "language" model did not catch a language issue ...

On the other thing by Sashiko, that looks wrong. There are existing
huge_ptep_get callers not taking the lock. And, there won't be a torn
read because we are using __ptep_get() instead of *ptep.



