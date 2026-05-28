Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F5CCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvUp2WE4NRfIp2nl9XGNBy0iKarZdKYxJdNZYx9xR2I=; b=XL82l3M0aombo1iDPNe9kRisQd
	xl1ma97kK3ConEUz9TtIWT3GxHmN6gSvTqRe9nbrfQa8dTZfSuen4aluYgmnj8Bo8YIOSSkqZ7Drk
	/qp6TcUZ2gVg8XasJIQGWHp7uu8W7nopiyh90odR96dzy7wg0t/U7UxDboaw67m/D8wcbg+Pk4m8Y
	xDHwpZD142bJKAzFYXmxxRR0U1sGSb+3Pmh8hbuF+O3mPezyIO2r+XcYlKRe4Z60BMSDHC/Bk2aom
	wLXP/AfiGUSh8tTOGYqKO36fihepeSKxifk+aKcKdWLB1q7qhfiYVHmfQ5q4e01Tcnmns0MJ8SPWt
	qEm91AKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVkF-00000005LCV-2si3;
	Thu, 28 May 2026 08:05:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVkC-00000005LBi-1ogZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:05:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C752522EE;
	Thu, 28 May 2026 01:05:22 -0700 (PDT)
Received: from [10.57.93.112] (unknown [10.57.93.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B4D53F905;
	Thu, 28 May 2026 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779955527; bh=qc2m1Ro4tsasKKh7m1ERSxkzDtjwNkTw7WOQcFs2l+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JOBb7famIPNptjHwcOfdiS9+PoHZz/46QZ+nvB6L2cHKpDuU+BPPF+CJCpsgICZ/Q
	 47qo21i6t5dGT5rBtZqk+BMAi2prTImKC4R8XqCQ/zP5HHjZnZRrQR/uBPHSfibHi9
	 d9p1JXouhYK52CpfqUgq2kq9j4Qhl7TleZoeSApM=
Message-ID: <83d168c1-fed9-4301-8d0e-ffd133df90bb@arm.com>
Date: Thu, 28 May 2026 10:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
To: Vishal Moola <vishal.moola@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, david@kernel.org
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com> <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
 <ahW3QYiYjjVB4Knv@willie-the-truck>
 <423a2656-e1a3-473e-abeb-5e301c6f7c2a@arm.com> <aha5w_WRTmtb6O-B@fedora>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aha5w_WRTmtb6O-B@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010532_573692_64820C8D 
X-CRM114-Status: GOOD (  21.92  )
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

On 27/05/2026 11:30, Vishal Moola wrote:
> On Wed, May 27, 2026 at 09:35:50AM +0200, Kevin Brodsky wrote:
>> On 26/05/2026 17:07, Will Deacon wrote:
>>> On Tue, May 26, 2026 at 01:54:00PM +0200, Kevin Brodsky wrote:
>>>> On 22/05/2026 11:36, Vishal Moola wrote:
>>>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>>>> index 4c8959153ac4..9d42cbddce27 100644
>>>>>> --- a/arch/arm64/mm/mmu.c
>>>>>> +++ b/arch/arm64/mm/mmu.c
>>>>>> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>>>>>>  
>>>>>>  static void free_hotplug_pgtable_page(struct page *page)
>>>>>>  {
>>>>>> +	if (folio_test_pgtable(page_folio(page)))
>>>>> This should work.
>>>>>
>>>>>> +		pagetable_dtor(page_ptdesc(page));
>>>>>> +
>>>>>>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
>>>>> In the case we presumably have a page table page (ptdesc) at this
>>>>> point, we should really be freeing it with pagetable_free() as well.
>>>> Agreed, I think this is the right thing to do, something like:
>>>>
>>>> if (folio_test_pgtable(page_folio(page)))
>>>> pagetable_dtor_free(page_ptdesc(page)); else
>>>> free_hotplug_page_range(page, PAGE_SIZE, NULL);
>>>>
>>>>
>>>> Strangely enough x86 calls pagetable_free() in both cases.
>>>>
>>>> My series protecting page tables with pkeys has a patch [1] to get
>>>> vmemmap to allocate page tables with pagetable_alloc(). The diff above
>>>> will require pagetable_*_ctor() to be called as well, but I think that's
>>>> the right thing to do anyway. That could be posted as a separate series,
>>>> but I'm hesitant due to the lack of NUMA awareness in pagetable_alloc().
>>> I agree that calling the ctor()/dtor() functions consistently is the
>>> cleanest approach and that will need something like your patch to call
>>> the constructor from vmemmap_alloc_block_zero(). Trying to elide these
>>> calls for the page-table pages used to map the altmap just feels odd to
>>> me, as there isn't anything particularly special about them afaik.
>> I don't think they're really special either, most likely they just got
>> missed/ignored for the purpose of ctor/dtor like many other kernel page
>> tables (until recently).
>>
>> I'll prepare a series refactoring that code then - that will also
>> require changing most arch implementations of vmemmap_free() to call
>> pagetable_dtor_free().
> Take a look at Matthew's series[1]. I think thats the ideal approach for
> page table accounting. He hasn't had time to iterate on it though. I
> doubt he'd mind if someone picked it up.

I recall this series. Are you suggesting that we would no longer need to
call the ctor/dtor for kernel page tables with this approach? That
leaves us with the weird case of ptdesc_set_kernel(), which is called
from *_alloc_one() while ptdesc_clear_kernel() is called from
pagetable_free(), but that's only an optimisation so we can probably
live with it.

If we go down this route, I would suggest we inline what's left of the
ctor/dtor, i.e. ptlock, in {pte,pmd}_alloc_one() and {pte,pmd}_free().
This way it is clear that everything applicable to all page tables
(kernel+user) should go directly into pagetable_{alloc,free}.

Happy to post something along those lines (patch 2/3 of Matthew's series
+ removing ctor/dtor completely) if that sounds sensible.

- Kevin

