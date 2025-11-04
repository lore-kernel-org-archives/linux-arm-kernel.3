Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69F2CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2rL4n5HoHPkwxfKpHHv2TwjUsBcHJEWd2NJ2+HjPH0=; b=RTL/w7VEgP46ONMtJoqadgcrIB
	CxUNvI4hL2uxkYl/XcjPJII4vKvAPiUGD09D9H4x273MaiFR9v8+EJep24yGtNFm1mIb55KwEN2vf
	cD+rM9xJAJWSS1mLyJcpX4mgk0pcZ35E9ZVGo4ioVVd6F/pjh63bUibvG73a8lvT4uvKfWe3097mb
	4kvocjNOTCee72hRgTCp6oCjR+OdUPb2XyC5LqXIXEM5rHoL5GyV5pP/eox/1hQndvVXQ6lkuJ86E
	FTuSYXoB/LKAI0zpBYRTSFL9lgDLGUA2/TJDIV6yLSg2+cnaZ8L462tUqHtImfb9TyMCo9lPHT3Ih
	OrC07W3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGWc-0000000BoU9-3vco;
	Tue, 04 Nov 2025 12:52:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGWZ-0000000BoTe-3qRY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7286F1CE0;
	Tue,  4 Nov 2025 04:52:26 -0800 (PST)
Received: from [10.1.31.224] (XHFQ2J9959.cambridge.arm.com [10.1.31.224])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 734283F66E;
	Tue,  4 Nov 2025 04:52:32 -0800 (PST)
Message-ID: <cd64b1b6-4d5c-49f4-b87a-29c39bc33652@arm.com>
Date: Tue, 4 Nov 2025 12:52:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: mm: Don't sleep in split_kernel_leaf_mapping()
 when in atomic context
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, yang@os.amperecomputing.com, david@redhat.com,
 ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com,
 cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
References: <20251103125738.3073566-1-ryan.roberts@arm.com>
 <aQjMUhspJrRQn5Ew@willie-the-truck>
 <3611cfeb-53d5-4db5-95a1-1d095edfc3c9@arm.com>
 <aQn0ZqCPSA61QmDI@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aQn0ZqCPSA61QmDI@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_045236_037610_FA15BF46 
X-CRM114-Status: GOOD (  16.55  )
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

On 04/11/2025 12:41, Will Deacon wrote:
> Hey Ryan,
> 
> On Mon, Nov 03, 2025 at 04:28:44PM +0000, Ryan Roberts wrote:
>> On 03/11/2025 15:37, Will Deacon wrote:
>>> On Mon, Nov 03, 2025 at 12:57:37PM +0000, Ryan Roberts wrote:
>>>> +static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	arch_enter_lazy_mmu_mode();
>>>> +	ret = walk_kernel_page_table_range_lockless(start, end,
>>>> +					&split_to_ptes_ops, NULL, &gfp);
>>>> +	arch_leave_lazy_mmu_mode();
>>>
>>> Why are you entering/leaving lazy mode now? linear_map_split_to_ptes()
>>> calls flush_tlb_kernel_range() right after this so now it looks like
>>> we have more barriers than we need there.
>>
>> Without the lazy mmu block, every write to every pte (or pmd/pud) will cause a
>> dsb and isb to be emitted. With the lazy mmu block, we only emit a single
>> dsb/isb at the end of the block.
>>
>> linear_map_split_to_ptes() didn't previously have a lazy mmu block; that was an
>> oversight, I believe. So when refactoring I thought it made sense to make it
>> common for both cases.
>>
>> Yes, the flush_tlb_kernel_range() also has the barriers, so the lazy mmu mode is
>> reducing from a gazillion barriers to 2. We could further optimize from 2 to 1,
>> but I doubt the performance improvement will be measurable.
>>
>> Perhaps I've misunderstood your point...?
> 
> I was just trying to understand whether this was a functional thing (which
> I couldn't grok) or an optimisation. Sounds like it's the latter, but I'd
> prefer not to mix optimisations with fixes.

Ahh, yes fair enough. I'll send out a new version either tomorrow or Thursday.
In that I'll include 3 separate patches; the fix, this optimization and the tidy
up that David suggested. Ideally all 3 will go to 6.18, but if you only want to
push the fix to 6.18 and leave the rest for 6.19 fair enough.

Thanks,
Ryan

> 
> Will


