Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E2ED2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxGELJiW39YSBH6yCtCMZHPxIbPOubG0p87HEjV4ICI=; b=Z1/GmMxtfNUjX6lG7D20iPDpH4
	fu+58VL0oypFgyjXDAdpW/nRzhtNW5B0pIFn4cG7fyQtcYAaWClc349KSWHN+5jwCtzN6kH+NOcc8
	Ol6aDUO1qvD4nNJCjEaYM+VniYYwpsEpRRxKJ2dOw3HtZG5YDLx7peqAkesWwcUNrxH+uJM+UAlGV
	i7ckJ2Ie6dmvy6SCXygcb5mlFR+BBf+X+hzHeZojVJAFdMryYPluPLJrbrdFnDeGCjkMktCRJbZmX
	RftfVhEKiY9NAY8ck9OqqcsRkmEH8tJVMlPJuSltPBT8W0Roz0UCIFQHYs0USbzhYz6Cc/WzWDoo/
	iZ2gDrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9A7-00000003dZw-2wbx;
	Tue, 20 Jan 2026 10:40:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9A4-00000003dZV-3n9P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:40:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19AAF1476;
	Tue, 20 Jan 2026 02:40:28 -0800 (PST)
Received: from [10.1.39.200] (XHFQ2J9959.cambridge.arm.com [10.1.39.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9D393F694;
	Tue, 20 Jan 2026 02:40:31 -0800 (PST)
Message-ID: <baa46ea0-737b-4d9e-b4f4-2eee1476da95@arm.com>
Date: Tue, 20 Jan 2026 10:40:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: mmu: avoid allocating pages while splitting
 the linear mapping
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 catalin.marinas@arm.com, akpm@linux-oundation.org, david@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, mhocko@suse.com
References: <20260105202328.2418990-1-yeoreum.yun@arm.com>
 <20260105202328.2418990-3-yeoreum.yun@arm.com>
 <aW5p1ylQBNXTEmmq@willie-the-truck> <aW6hISBu3hNYS771@e129823.arm.com>
 <2619166b-13ef-4daa-82c7-1d44035a8d6c@arm.com>
 <aW9LCX92T9t8iDco@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aW9LCX92T9t8iDco@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_024037_027984_ED4AFAC1 
X-CRM114-Status: GOOD (  35.94  )
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

On 20/01/2026 09:29, Yeoreum Yun wrote:
> Hi Ryan
>> On 19/01/2026 21:24, Yeoreum Yun wrote:
>>> Hi Will,
>>>
>>>> On Mon, Jan 05, 2026 at 08:23:27PM +0000, Yeoreum Yun wrote:
>>>>> +static int __init linear_map_prealloc_split_pgtables(void)
>>>>> +{
>>>>> +	int ret, i;
>>>>> +	unsigned long lstart = _PAGE_OFFSET(vabits_actual);
>>>>> +	unsigned long lend = PAGE_END;
>>>>> +	unsigned long kstart = (unsigned long)lm_alias(_stext);
>>>>> +	unsigned long kend = (unsigned long)lm_alias(__init_begin);
>>>>> +
>>>>> +	const struct mm_walk_ops collect_to_split_ops = {
>>>>> +		.pud_entry	= collect_to_split_pud_entry,
>>>>> +		.pmd_entry	= collect_to_split_pmd_entry
>>>>> +	};
>>>>
>>>> Why do we need to rewalk the page-table here instead of collating the
>>>> number of block mappings we put down when creating the linear map in
>>>> the first place?
>>
>> That's a good point; perhaps we can reuse the counters that this series introduces?
>>
>> https://lore.kernel.org/all/20260107002944.2940963-1-yang@os.amperecomputing.com/
>>
>>>
>>> First, linear alias of the [_text, __init_begin) is not a target for
>>> the split and it also seems strange to me to add code inside alloc_init_XXX()
>>> that both checks an address range and counts to get the number of block mappings.
>>>
>>> Second, for a future feature,
>>> I hope to add some code to split "specfic" area to be spilt e.x)
>>> to set a specific pkey for specific area.
>>
>> Could you give more detail on this? My working assumption is that either the
>> system supports BBML2 or it doesn't. If it doesn't, we need to split the whole
>> linear map. If it does, we already have logic to split parts of the linear map
>> when needed.
> 
> This is not for a linear mapping case. but for a "kernel text area".
> As a draft, I want to mark some of kernel code can executable
> both kernel and eBPF program.
> (I'm trying to make eBPF program non-executable kernel code directly
> with POE feature).
> For this "executable area" both of kernel and eBPF program
> -- typical example is exception entry, It need to split that specific
> range and mark them with special POE index.

Ahh yes, I recall you mentioning this a while back (although I confess all the
deatils have fallen out of my head). You'd need to make sure you're definitely
not splitting an area of text that the secondary CPUs are executing while they
are being held in the pen, since at least one of those CPUs doesn't support BBML2.

> 
>>
>>>
>>> In this case, it's useful to rewalk the page-table with the specific
>>> range to get the number of block mapping.
>>>
>>>>
>>>>> +	split_pgtables_idx = 0;
>>>>> +	split_pgtables_count = 0;
>>>>> +
>>>>> +	ret = walk_kernel_page_table_range_lockless(lstart, kstart,
>>>>> +						    &collect_to_split_ops,
>>>>> +						    NULL, NULL);
>>>>> +	if (!ret)
>>>>> +		ret = walk_kernel_page_table_range_lockless(kend, lend,
>>>>> +							    &collect_to_split_ops,
>>>>> +							    NULL, NULL);
>>>>> +	if (ret || !split_pgtables_count)
>>>>> +		goto error;
>>>>> +
>>>>> +	ret = -ENOMEM;
>>>>> +
>>>>> +	split_pgtables = kvmalloc(split_pgtables_count * sizeof(struct ptdesc *),
>>>>> +				  GFP_KERNEL | __GFP_ZERO);
>>>>> +	if (!split_pgtables)
>>>>> +		goto error;
>>>>> +
>>>>> +	for (i = 0; i < split_pgtables_count; i++) {
>>>>> +		/* The page table will be filled during splitting, so zeroing it is unnecessary. */
>>>>> +		split_pgtables[i] = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
>>>>> +		if (!split_pgtables[i])
>>>>> +			goto error;
>>>>
>>>> This looks potentially expensive on the boot path and only gets worse as
>>>> the amount of memory grows. Maybe we should predicate this preallocation
>>>> on preempt-rt?
>>>
>>> Agree. then I'll apply pre-allocation with PREEMPT_RT only.
>>
>> I guess I'm missing something obvious but I don't understand the problem here...
>> We are only deferring the allocation of all these pgtables, so the cost is
>> neutral surely? Had we correctly guessed that the system doesn't support BBML2
>> earlier, we would have had to allocate all these pgtables earlier.
>>
>> Another way to look at it is that we are still allocating the same number of
>> pgtables in the existing fallback path, it's just that we are doing it inside
>> the stop_machine().
>>
>> My vote would be _not_ to have a separate path for PREEMPT_RT, which will end up
>> with significantly less testing...
> 
> IIUC, Will's mention is additional memory allocation for
> "split_pgtables" where saved "pre-allocate" page tables.
> As the memory increase, definitely this size would increase the cost.

Err, so you're referring to the extra kvmalloc()? I don't think that's a big
deal is it? you get 512 pointers per page. So the amortized cost is 1/512= 0.2%?

I suspect we have both misunderstood Will's point...

Thanks,
Ryan

> 
> And this cost need not to burden for !PREEMPT_RT since
> it can use memory allocation in stop_machine() with GFP_ATOMIC.
> 
> But I also agree in the aspect that if that cost not much of huge,
> It's also convincing and additionally, as I mentioned in another thread,
> It would be good not to give a hallucination GFP_ATOMIC is fine for
> everywhere even in the PREEMPT_RT.
> 
> --
> Sincerely,
> Yeoreum Yun


