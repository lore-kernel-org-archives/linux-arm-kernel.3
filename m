Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEBAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmNFIi7RnnrypKskw6fwxOk6ivWwb+ik3iVKHlwrVrI=; b=yhJ7IuwMAoa9oiIsE3qkMVjVx0
	OUgb1J7sn8Tkn6eadT87/MMZjLwlYNu9XRYRtaABjVQlPQpmby11Xr6BB/QM1cys1rxZNskB4M5rS
	ha12oGTCya8VXcZVURzAUNMxdtrw/HuzGspJ9q9x2Y1XO9reWdQa69da9aCdIcW3rft27le19VXXY
	v+prxj4SoiOMR8qxLwiH+rQyAAeN3cp9bMTkWAYAXlhE6TkTp5HwCGcO/+ZzlzfQ04TePDVqo4guL
	1gQjel0g/BQCXQ8lxmh/kpxwiavtqgIhZAwIVnzV5QFL/HV9RjsYDlSKgx2zysPoaYqQEoXnwBfUY
	I9LEiCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWUC-000000064G9-3Ed0;
	Fri, 03 Jul 2026 05:30:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWUA-000000064FU-1Nfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:30:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19BAB1D34;
	Thu,  2 Jul 2026 22:30:40 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93E953F673;
	Thu,  2 Jul 2026 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783056644; bh=x/FZbZRvlfgDKJ87XGqUbVjYmJN5YLYtikgDpbbk+3s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gRZT5Aycj8nb9nzE9CkfCAmO1Pk+zt96vwJ0a+6cKk6Wn/mIV1tYxcrUG/53HkHzj
	 hn2MLdJulVDpzweQyjtnhqxSXAs3RDgKOuCTNjnCpg+4zOinXDuxDvU/Xyloz5ww/k
	 V36SggskoTyyC6c++z8jGDd4uZBRW8buLuFGqQZY=
Message-ID: <1ef238fd-232c-4b8a-b28d-cd20db57bcfc@arm.com>
Date: Fri, 3 Jul 2026 11:00:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mm/mprotect: use huge_ptep_get() for hugetlb
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
 anshuman.khandual@arm.com
References: <20260702051341.126509-1-dev.jain@arm.com>
 <20260702051341.126509-7-dev.jain@arm.com>
 <f1bef34f-987a-4a47-99fb-acdeda1c072d@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f1bef34f-987a-4a47-99fb-acdeda1c072d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223046_420746_DAD386FB 
X-CRM114-Status: GOOD (  17.69  )
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



On 02/07/26 9:17 pm, David Hildenbrand (Arm) wrote:
> On 7/2/26 07:13, Dev Jain wrote:
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
>> Fixes: 42e4089c7890 ("x86/speculation/l1tf: Disallow non privileged high MMIO PROT_NONE mappings")
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  mm/mprotect.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 9cbf932b028cf..23779632d18bf 100644
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
>> +	pte_t entry = huge_ptep_get(walk->mm, addr, pte);
> 
> Nit: can be const :)
> 
>> +
>> +	return pfn_modify_allowed(pte_pfn(entry),
>>  				  *(pgprot_t *)(walk->private)) ?
>>  		0 : -EACCES;
> 
> Indentation is odd.
> 
> Can we just make this readable?
> 
> if (pfn_modify_allowed ...)
> 	return 0
> return -EACCESS;
> 

Sure I'll do this.


> 


