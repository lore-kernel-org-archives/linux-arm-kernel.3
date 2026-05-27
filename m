Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2625CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 07:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWcI+z0XH0AfAPpv/XGcENdcfelIfuJvkL3Jp4qgI2o=; b=An92ajd2XKpDGYy/BLRPmWq9pn
	sIb0PsY1z3/cDeJnUFFy9DH9GUqV0Oe+kyzMzwgI90cSVQ127RtWOLkjNJeiZNdk6Hg3pk01Os/qL
	e48J7PyOjgoOZVj3TdB1QeMNxoqmU+yIdJSyO0pN4x0ju5YR9d6OosxV4Y5xK/4A6Ah9dQGdQp3+h
	O961X3GmcFduJXRC86fGzt4DFjhv9r+zmabyR6kpZ7zWqlZX2yUP1eASw2goNxi/2l8HPx8zdFflR
	zJ8jo2mdUOvGiD9gBGv34GEL3tyi60yIEDUKH5DbVDKal4kNuxPUdS3OwHaarir1VNrRTs6O2bdmS
	5p7KowzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8ma-00000003TLV-3a2H;
	Wed, 27 May 2026 07:34:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8mY-00000003TL0-2Q4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 07:34:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCDA827DC;
	Wed, 27 May 2026 00:34:19 -0700 (PDT)
Received: from [10.57.93.47] (unknown [10.57.93.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8928C3F632;
	Wed, 27 May 2026 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779867264; bh=HVqcxI1GFbCS7c35naKWqhplQ5379bUFtfju52VKNUI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lhpGYhy9mzLM0aQ1LmEdrgC7rB9SgaM2E0euQSb2IyT0zWRqzHJdbHCQvPWYTWPEz
	 P7TxGZIzx/4bnsXReJ1v8DM+/x5k4r9aS3DnmQY5y6dTDxqa0kFbXyRop06qe/gjVs
	 u16UwYDXRXQBF7Yv8VbCdByU0IIzdtVpVZ2FuHmg=
Message-ID: <db11078b-a283-4717-bed2-da56e77c7132@arm.com>
Date: Wed, 27 May 2026 09:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Vishal Moola <vishal.moola@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, will@kernel.org
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com> <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
 <1be38262-53de-4a27-9841-393e12fc1475@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <1be38262-53de-4a27-9841-393e12fc1475@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_003426_772627_B2BC6A73 
X-CRM114-Status: GOOD (  12.47  )
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

On 26/05/2026 14:31, David Hildenbrand (Arm) wrote:
> On 5/26/26 13:54, Kevin Brodsky wrote:
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
> That code pattern is wrong.
>
> folio_test_pgtable() shouldn't exist.
>
> In the future, something is either a pgtable or a folio, not both.
>
> So check the type against the page, not the folio.

In other words use PageTable(page) instead? Interestingly I can see a
few calls to folio_test_pgtable() across the kernel but none to
PageTable(), maybe just an antipattern then? The ctor/dtor also use
__folio_{set,clear}_pgtable().

- Kevin

