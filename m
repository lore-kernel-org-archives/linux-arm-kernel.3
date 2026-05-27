Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A09CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPGqASysxQ9lW9Lpvsz70pXUSRn6+VAlLH7uoaKEAbI=; b=O94HNPxIrXMk1LJtauRY2dCjcT
	ZfpkDqyGx4Ipt89txD4TW5g5K+1me5F/4892CZBvPLOOgI20ycXuON3PteQ2TfoYeDc3X42Y4VhS0
	UdbIDE82gWJrKwO4yqp9Cusy5d1IvoZKxFV0FzdMKhoaF8RWkHMqA3Kxo2+CMFQJTRhILzh0TMNJC
	8cxbRUp+hZOzZiAhGpQ8wH7WRpTk6uo3h2zwbtnAkvgUYhOdpx96mQ1gew6G75fhhH1UfGuM9InoE
	FwGj6ZIftKeqQUprmLayKKcWAEZDmDBpR8Z7c+GNmeCINf7qw2+kf9dcjXF0Gh5pDOhuX+Sw/5L8z
	LNfB4nSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8o3-00000003TbH-0icj;
	Wed, 27 May 2026 07:35:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8o0-00000003TaY-3Kam
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 07:35:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FF8027DC;
	Wed, 27 May 2026 00:35:50 -0700 (PDT)
Received: from [10.57.93.47] (unknown [10.57.93.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 616C73F632;
	Wed, 27 May 2026 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779867355; bh=PdNASjHzMFcTuvj2O7glLeKGsNZHbnvtXnjzn6isxgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e8mQOnEn2+oYphGx+uDlYnYs9VLRpw312YQn0n6jfNrmHENZB5GLwydumToXyGc+M
	 fs4ywuXgUPm+W9ui68dzf6q+eitrm/9SlD45ExCS+KUh0ulqDpc62NGqrAeQUKDemZ
	 aA9u3+ZbfAXqJdsCwQUVOPcq/KLO2WVJl5clNdDQ=
Message-ID: <423a2656-e1a3-473e-abeb-5e301c6f7c2a@arm.com>
Date: Wed, 27 May 2026 09:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
To: Will Deacon <will@kernel.org>
Cc: Vishal Moola <vishal.moola@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com> <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
 <ahW3QYiYjjVB4Knv@willie-the-truck>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <ahW3QYiYjjVB4Knv@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_003556_885250_3E306B2C 
X-CRM114-Status: GOOD (  18.91  )
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

On 26/05/2026 17:07, Will Deacon wrote:
> On Tue, May 26, 2026 at 01:54:00PM +0200, Kevin Brodsky wrote:
>> On 22/05/2026 11:36, Vishal Moola wrote:
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index 4c8959153ac4..9d42cbddce27 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>>>>  
>>>>  static void free_hotplug_pgtable_page(struct page *page)
>>>>  {
>>>> +	if (folio_test_pgtable(page_folio(page)))
>>> This should work.
>>>
>>>> +		pagetable_dtor(page_ptdesc(page));
>>>> +
>>>>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
>>> In the case we presumably have a page table page (ptdesc) at this
>>> point, we should really be freeing it with pagetable_free() as well.
>> Agreed, I think this is the right thing to do, something like:
>>
>> if (folio_test_pgtable(page_folio(page)))
>> pagetable_dtor_free(page_ptdesc(page)); else
>> free_hotplug_page_range(page, PAGE_SIZE, NULL);
>>
>>
>> Strangely enough x86 calls pagetable_free() in both cases.
>>
>> My series protecting page tables with pkeys has a patch [1] to get
>> vmemmap to allocate page tables with pagetable_alloc(). The diff above
>> will require pagetable_*_ctor() to be called as well, but I think that's
>> the right thing to do anyway. That could be posted as a separate series,
>> but I'm hesitant due to the lack of NUMA awareness in pagetable_alloc().
> I agree that calling the ctor()/dtor() functions consistently is the
> cleanest approach and that will need something like your patch to call
> the constructor from vmemmap_alloc_block_zero(). Trying to elide these
> calls for the page-table pages used to map the altmap just feels odd to
> me, as there isn't anything particularly special about them afaik.

I don't think they're really special either, most likely they just got
missed/ignored for the purpose of ctor/dtor like many other kernel page
tables (until recently).

I'll prepare a series refactoring that code then - that will also
require changing most arch implementations of vmemmap_free() to call
pagetable_dtor_free().

In the meantime we should probably use the logic above to avoid the BUG
that Alistair reported.

- Kevin

