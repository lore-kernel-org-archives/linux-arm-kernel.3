Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B49C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kekZYZNc2HULcFXRWQtxXNVLPrL3Z9GBbHLrRK7U5m8=; b=dpt70mIYbo3yG7mJ9MMO3l9GfL
	hgF/ypt/aFVd4pzdYdQnb6lr8IGf3vWh9PRU77jus21l5D/YWwStT1lQ8rmuleI+39dF+6KwtrsAZ
	xXrk6EVS4qrXAP3pf/d2aVKNUD4C0q4g59ZjatVyQ8DRzSM3BVQ2613HvNze9R0zX182UM4WmLadX
	KXex985gWW7GNVr3uimCF4KbR+Wzam/ChboVbCzq9deSVyKtwI0HKGB9G7IP0qszeYnDkkmzrYVLb
	PNG3Cs+3B2yFjr4mQEbdyrlmrospRLYYxE0ih8sNlR61X+4bLoL6eGomznHuKTg3BjZKSWK0uRxce
	TtcWthkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggyj-0000000CHPd-11Cz;
	Mon, 06 Jul 2026 10:55:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggyh-0000000CHOk-1mjf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:55:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4572C3297;
	Mon,  6 Jul 2026 03:55:02 -0700 (PDT)
Received: from [10.164.148.41] (MacBook-Pro.blr.arm.com [10.164.148.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302593F85F;
	Mon,  6 Jul 2026 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783335306; bh=kUg3SSlZYOMQVG94aHXp/3YGAOJyzCEBoYwrgN+THCA=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=shX+3OKH0GDEBl7HPAkKvHndWQPXZWFDYKZCnRDHc9zSOZOlyrOtxtPdT7WkUnZn6
	 drCorekkLPZ520O6dDK+omcH6IgAdV1z6HYRZqrAw98nqbl8DNSHUS0Yu7Cfzw9nSQ
	 K3tyrSAYUqGV2vp3jALusUBwt8fqAi6J+2p6EhJA=
Message-ID: <7ac558fd-1081-456b-b997-c7321241cf8c@arm.com>
Date: Mon, 6 Jul 2026 16:24:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: make huge_ptep_get handled unaligned
 addresses
From: Dev Jain <dev.jain@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, osalvador@suse.de, ljs@kernel.org,
 liam@infradead.org, riel@surriel.com, vbabka@kernel.org, harry@kernel.org,
 jannh@google.com, lance.yang@linux.dev, kas@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, apopple@nvidia.com, rcampbell@nvidia.com,
 ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
 rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
 ying.huang@linux.alibaba.com, ak@linux.intel.com, nao.horiguchi@gmail.com,
 mel@csn.ul.ie, j-nomura@ce.jp.nec.com, pfalcato@suse.de, tglx@kernel.org,
 dave.hansen@intel.com, jpoimboe@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, stable@vger.kernel.org
References: <20260703114202.365553-1-dev.jain@arm.com>
 <20260703114202.365553-2-dev.jain@arm.com>
 <20260705003559.8b124d2b94b685cc2e4e77ae@linux-foundation.org>
 <8fdbe0d6-87fd-441c-b6d2-baac380f6fb3@arm.com>
 <4b4e8007-3747-457a-85cc-d1003e1c8fe2@kernel.org>
 <39a13445-dc6f-4a75-92b8-f4a122c63b89@arm.com>
Content-Language: en-US
In-Reply-To: <39a13445-dc6f-4a75-92b8-f4a122c63b89@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_035507_545909_4ACB517E 
X-CRM114-Status: GOOD (  18.69  )
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



On 06/07/26 4:22 pm, Dev Jain wrote:
> 
> 
> On 06/07/26 2:15 pm, David Hildenbrand (Arm) wrote:
>> On 7/5/26 10:08, Dev Jain wrote:
>>>
>>>
>>> On 05/07/26 1:05 pm, Andrew Morton wrote:
>>>> On Fri,  3 Jul 2026 11:41:54 +0000 Dev Jain <dev.jain@arm.com> wrote:
>>>>
>>>>> huge_ptep_get() can be handed a virtual address pointing to the middle of
>>>>> a contpmd/contpte mapped hugetlb folio (examples of callers are
>>>>> pagemap_hugetlb_range, page_mapped_in_vma).
>>>>>
>>>>> The arm64 helper rewalks the pgtables in find_num_contig to answer whether
>>>>> the huge pte we have maps a contpmd or a contpte hugetlb folio, and
>>>>> returns CONT_PMDS or CONT_PTES, so that it can collect a/d bits over the
>>>>> contiguous ptes. We can falsely return CONT_PTES instead of CONT_PMDS
>>>>> if the addr is not aligned.
>>>>>
>>>>> Fix this by aligning the pmdp pointer down to a contpmd base before
>>>>> checking equality with the passed huge pte pointer, to correctly answer
>>>>> whether the huge pte is the base of a contpmd block.
>>>>>
>>>>> Fixes: 29cb80519689 ("arm64: hugetlb: Cleanup huge_pte size discovery mechanisms")
>>>>> Cc: stable@vger.kernel.org
>>>>
>>>> Please describe the userspace-visible effects of bugs when fixing them.
>>>> Particularly when cc:stable is proposed.  Thanks.
>>>
>>> Forgot for this one. It should be, on systems where CONT_PTES != CONT_PMDS
>>> (meaning page size is 16K) we could collect excess a/d bit state, meaning
>>> extra work for the kernel.
>>
>> Even worse, right? We could walk 128 entries, when we really should just walk 16
>> (IIRC) entries, possibly reading garbage or even worse, into a memory hole at
>> the end of memory?
> 
> Hmm I was thinking that the checks pte_dirty() and pte_young() wouldn't care whether
> the pte is garbage. But, we could actually dereference a ptep pointer not having
> backing memory at all.
> 
> Does the following sound good?
> 
> "On systems where CONT_PTES != CONT_PMDS (meaning page size is 16K), we could collect
> excess a/d bit state, meaning extra work for the kernel. Even worse, we may iterate
> beyond the PTE table and dereference a garbage ptep pointer to access physical
> memory we don't own. Since the ptep pointer is a linear map address, we may run off
> the end of the linear map, dereference a VA not mapped into the kernel pgtables and
> cause kernel panic."
> 
> Although I checked on arm64, there is no case in which there is a hole after the
> linear map, but still that assumption shouldn't be made.

Oh but we could access a linear map address which corresponds to a DRAM hole, meaning
there is no entry in the kernel pgtable.


> 
> 
>>
> 
> 


