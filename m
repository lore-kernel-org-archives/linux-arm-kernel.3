Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43035C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxElX9YxKbFisNFviTpgkAO3DOkqXKK5V9oY4nfD6fI=; b=0kCSBdVXJQ5DJ5KC/x0q8Lt0a2
	QleNqzE3BYKJScWC5ZlEeoMN6wc/mn8aTTaPtBB2PGahcgm4kwqXIp9UMk0jhgJTDx2kVJSBkrFgS
	+OaY2Gk/+/DXhAsIGsP3XjHmehf91zv2D5ubGe7XN01T2e5JkHMtes/B3nh+2lRD87+zLp6GJEfKU
	JVmxsQ5K7B7JT+n2Ef6h2WFCxLRxyDHtHmABhJeohL8OP69HRzU1kFmN/Zr6q0gwaT4afOHezvG17
	7J99MAYSU+urLdPf98B0ILLlstZl8EsXto7nucvzYkC4ZoLHG6PKSaF+xg3+ENN7OnI1ViG4QaOgZ
	4BSerR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggwg-0000000CH1d-3tZA;
	Mon, 06 Jul 2026 10:53:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggwe-0000000CH15-3ImB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:53:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9512BC4;
	Mon,  6 Jul 2026 03:52:53 -0700 (PDT)
Received: from [10.164.148.41] (MacBook-Pro.blr.arm.com [10.164.148.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F4B13F85F;
	Mon,  6 Jul 2026 03:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783335177; bh=5PDQKPlKrlK5mkq4F/AqOm5P1FJi9r8quvEcLVadPkI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y86LUQ/88wqr9q+XQgYX5M2rHKMDqwHVd78+V56i28vxi0bJqCg45smjItGSht6vM
	 LhTmj1Ma7QeT9qBKxDeVirPdzgpCOF1LMTwfCAoG4OkTwOZr6+PrXWwP5PvS1/LvOO
	 FD/IYsLJPBEPg9IDaQQJJIuEA9IW1pESzn+k4g/8=
Message-ID: <39a13445-dc6f-4a75-92b8-f4a122c63b89@arm.com>
Date: Mon, 6 Jul 2026 16:22:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: make huge_ptep_get handled unaligned
 addresses
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4b4e8007-3747-457a-85cc-d1003e1c8fe2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_035300_906751_237F9AAF 
X-CRM114-Status: GOOD (  15.07  )
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



On 06/07/26 2:15 pm, David Hildenbrand (Arm) wrote:
> On 7/5/26 10:08, Dev Jain wrote:
>>
>>
>> On 05/07/26 1:05 pm, Andrew Morton wrote:
>>> On Fri,  3 Jul 2026 11:41:54 +0000 Dev Jain <dev.jain@arm.com> wrote:
>>>
>>>> huge_ptep_get() can be handed a virtual address pointing to the middle of
>>>> a contpmd/contpte mapped hugetlb folio (examples of callers are
>>>> pagemap_hugetlb_range, page_mapped_in_vma).
>>>>
>>>> The arm64 helper rewalks the pgtables in find_num_contig to answer whether
>>>> the huge pte we have maps a contpmd or a contpte hugetlb folio, and
>>>> returns CONT_PMDS or CONT_PTES, so that it can collect a/d bits over the
>>>> contiguous ptes. We can falsely return CONT_PTES instead of CONT_PMDS
>>>> if the addr is not aligned.
>>>>
>>>> Fix this by aligning the pmdp pointer down to a contpmd base before
>>>> checking equality with the passed huge pte pointer, to correctly answer
>>>> whether the huge pte is the base of a contpmd block.
>>>>
>>>> Fixes: 29cb80519689 ("arm64: hugetlb: Cleanup huge_pte size discovery mechanisms")
>>>> Cc: stable@vger.kernel.org
>>>
>>> Please describe the userspace-visible effects of bugs when fixing them.
>>> Particularly when cc:stable is proposed.  Thanks.
>>
>> Forgot for this one. It should be, on systems where CONT_PTES != CONT_PMDS
>> (meaning page size is 16K) we could collect excess a/d bit state, meaning
>> extra work for the kernel.
> 
> Even worse, right? We could walk 128 entries, when we really should just walk 16
> (IIRC) entries, possibly reading garbage or even worse, into a memory hole at
> the end of memory?

Hmm I was thinking that the checks pte_dirty() and pte_young() wouldn't care whether
the pte is garbage. But, we could actually dereference a ptep pointer not having
backing memory at all.

Does the following sound good?

"On systems where CONT_PTES != CONT_PMDS (meaning page size is 16K), we could collect
excess a/d bit state, meaning extra work for the kernel. Even worse, we may iterate
beyond the PTE table and dereference a garbage ptep pointer to access physical
memory we don't own. Since the ptep pointer is a linear map address, we may run off
the end of the linear map, dereference a VA not mapped into the kernel pgtables and
cause kernel panic."

Although I checked on arm64, there is no case in which there is a hole after the
linear map, but still that assumption shouldn't be made.


> 


