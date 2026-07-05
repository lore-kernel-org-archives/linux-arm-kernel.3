Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B36C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSUmvuRPVl9U9TACBIYiWbf4aORkyvu1is7CpbgFQ6k=; b=MpBdW7OJ0b0Jh7L5VBDDsQ7o0F
	YUItp2yOsB9KgamfTtS5rsbCyKRUtzD/GboYrZetli+3DiNR1ZWUpfQPlK/qGTRlKnDNvLblI6b5W
	SBnEhc+m0wOBy8pPD3k55iRdCXeOYEuk+EWm4AzMbs+39ruQexYSYmSiFwVRRqCwPygbegkfYQ5ZW
	R+ybNJhVPk/WrOyxYDQ1NVGTOf49KoE/cjLk6a3+MrHavQlJ+X/PM+HOJNCga6BTq3wr+NVhz4YP8
	Bwqo0OHUirWkwlh4bwHZYcf9qmUThXWQOOeYPY/JoJ8HifBA+ZXEJMMGaEwtRIrwl82ulxI8FJBbs
	KQILj7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHuP-000000095qE-22S1;
	Sun, 05 Jul 2026 08:09:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHuN-000000095pk-27XV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:09:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA63B1D70;
	Sun,  5 Jul 2026 01:08:50 -0700 (PDT)
Received: from [10.57.73.18] (unknown [10.57.73.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC3F53F905;
	Sun,  5 Jul 2026 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783238935; bh=cIrRmXjneRyxZCYVtjOisOC7Q6AqKSJ27U6Pgn9w7QE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FqQCx48UJNUfeHogU9/y9HwEqlbbhAQ6HAGisLpAoZ06/5JM87N/K8zIXSOkQS9Lo
	 tzFVemZDjh6FMqDs/3oBIzs/gxTzjo2BY91OzyLW22GOwYSGCjWr8ywmF0OCMoI9D1
	 02im7RrlbLfHvqkoRtrjjP2YXspf26q5PHLafXU8=
Message-ID: <8fdbe0d6-87fd-441c-b6d2-baac380f6fb3@arm.com>
Date: Sun, 5 Jul 2026 13:38:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: make huge_ptep_get handled unaligned
 addresses
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
 anshuman.khandual@arm.com, stable@vger.kernel.org
References: <20260703114202.365553-1-dev.jain@arm.com>
 <20260703114202.365553-2-dev.jain@arm.com>
 <20260705003559.8b124d2b94b685cc2e4e77ae@linux-foundation.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260705003559.8b124d2b94b685cc2e4e77ae@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010859_707840_D0237265 
X-CRM114-Status: GOOD (  11.38  )
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



On 05/07/26 1:05 pm, Andrew Morton wrote:
> On Fri,  3 Jul 2026 11:41:54 +0000 Dev Jain <dev.jain@arm.com> wrote:
> 
>> huge_ptep_get() can be handed a virtual address pointing to the middle of
>> a contpmd/contpte mapped hugetlb folio (examples of callers are
>> pagemap_hugetlb_range, page_mapped_in_vma).
>>
>> The arm64 helper rewalks the pgtables in find_num_contig to answer whether
>> the huge pte we have maps a contpmd or a contpte hugetlb folio, and
>> returns CONT_PMDS or CONT_PTES, so that it can collect a/d bits over the
>> contiguous ptes. We can falsely return CONT_PTES instead of CONT_PMDS
>> if the addr is not aligned.
>>
>> Fix this by aligning the pmdp pointer down to a contpmd base before
>> checking equality with the passed huge pte pointer, to correctly answer
>> whether the huge pte is the base of a contpmd block.
>>
>> Fixes: 29cb80519689 ("arm64: hugetlb: Cleanup huge_pte size discovery mechanisms")
>> Cc: stable@vger.kernel.org
> 
> Please describe the userspace-visible effects of bugs when fixing them.
> Particularly when cc:stable is proposed.  Thanks.

Forgot for this one. It should be, on systems where CONT_PTES != CONT_PMDS
(meaning page size is 16K) we could collect excess a/d bit state, meaning
extra work for the kernel.


> 


