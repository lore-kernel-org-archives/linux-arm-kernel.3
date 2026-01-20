Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D223CA5FB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crVnzsCErSfSIQHn5cdUAJLRGiZia2qKEwZxjfV4oDo=; b=DQWHNlEeQYsMHttPoTgXAgdZbi
	bukjNjiC22abZyIku43zMyTkhqsIA6gSF5glUxbv3OG9HzFHvw5phuwV/Zlpn6YCBQmIUOqnhX/rA
	8BkZGxdTDa0SaI1zmuOU+/oXxGNAu5QttLkyq++JcQXDyb82ZG73xNplDFiiFdOZWW1RyelEvLeC6
	/wdzo64C8Oc+pI9nKs70MR+26m3QAQ7vdEbsln+/yHtLqJjjEN29szF/iSVdJR0nbTnlU9X8fyST9
	jpPETW85geuVexo8H52g7ey/sQrNcO7oCvGxCEubP/61mKooFh+DiKaFVABjhxktx9KBo0zdngb3W
	Pr6RPjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFe9-00000004FJs-1Dsf;
	Tue, 20 Jan 2026 17:36:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFe5-00000004FJM-26cK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:36:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 580AC1476;
	Tue, 20 Jan 2026 09:35:48 -0800 (PST)
Received: from [10.1.39.200] (XHFQ2J9959.cambridge.arm.com [10.1.39.200])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F7B73F632;
	Tue, 20 Jan 2026 09:35:51 -0800 (PST)
Message-ID: <11a01f4e-9ae5-4001-9f9c-74a746f898cd@arm.com>
Date: Tue, 20 Jan 2026 17:35:50 +0000
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
 <baa46ea0-737b-4d9e-b4f4-2eee1476da95@arm.com>
 <aW-k_D1Q8jpYMPoI@willie-the-truck>
 <a6c1f21f-43e4-41d2-adb6-c5f9985b3abd@arm.com>
 <aW+t8S1LfwX3LjRi@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aW+t8S1LfwX3LjRi@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_093601_640191_98937A33 
X-CRM114-Status: GOOD (  41.90  )
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

On 20/01/2026 16:31, Yeoreum Yun wrote:
> Hi Ryan,
> 
>> On 20/01/2026 15:53, Will Deacon wrote:
>>> On Tue, Jan 20, 2026 at 10:40:30AM +0000, Ryan Roberts wrote:
>>>> On 20/01/2026 09:29, Yeoreum Yun wrote:
>>>>> Hi Ryan
>>>>>> On 19/01/2026 21:24, Yeoreum Yun wrote:
>>>>>>> Hi Will,
>>>>>>>
>>>>>>>> On Mon, Jan 05, 2026 at 08:23:27PM +0000, Yeoreum Yun wrote:
>>>>>>>>> +static int __init linear_map_prealloc_split_pgtables(void)
>>>>>>>>> +{
>>>>>>>>> +	int ret, i;
>>>>>>>>> +	unsigned long lstart = _PAGE_OFFSET(vabits_actual);
>>>>>>>>> +	unsigned long lend = PAGE_END;
>>>>>>>>> +	unsigned long kstart = (unsigned long)lm_alias(_stext);
>>>>>>>>> +	unsigned long kend = (unsigned long)lm_alias(__init_begin);
>>>>>>>>> +
>>>>>>>>> +	const struct mm_walk_ops collect_to_split_ops = {
>>>>>>>>> +		.pud_entry	= collect_to_split_pud_entry,
>>>>>>>>> +		.pmd_entry	= collect_to_split_pmd_entry
>>>>>>>>> +	};
>>>>>>>>
>>>>>>>> Why do we need to rewalk the page-table here instead of collating the
>>>>>>>> number of block mappings we put down when creating the linear map in
>>>>>>>> the first place?linear_map_maybe_split_to_ptes(
>>>>>>
>>>>>> That's a good point; perhaps we can reuse the counters that this series introduces?
>>>>>>
>>>>>> https://lore.kernel.org/all/20260107002944.2940963-1-yang@os.amperecomputing.com/
>>>>>>
>>>>>>>
>>>>>>> First, linear alias of the [_text, __init_begin) is not a target for
>>>>>>> the split and it also seems strange to me to add code inside alloc_init_XXX()
>>>>>>> that both checks an address range and counts to get the number of block mappings.
>>>>>>>
>>>>>>> Second, for a future feature,
>>>>>>> I hope to add some code to split "specfic" area to be spilt e.x)
>>>>>>> to set a specific pkey for specific area.
>>>>>>
>>>>>> Could you give more detail on this? My working assumption is that either the
>>>>>> system supports BBML2 or it doesn't. If it doesn't, we need to split the whole
>>>>>> linear map. If it does, we already have logic to split parts of the linear map
>>>>>> when needed.
>>>>>
>>>>> This is not for a linear mapping case. but for a "kernel text area".
>>>>> As a draft, I want to mark some of kernel code can executable
>>>>> both kernel and eBPF program.
>>>>> (I'm trying to make eBPF program non-executable kernel code directly
>>>>> with POE feature).
>>>>> For this "executable area" both of kernel and eBPF program
>>>>> -- typical example is exception entry, It need to split that specific
>>>>> range and mark them with special POE index.
>>>>
>>>> Ahh yes, I recall you mentioning this a while back (although I confess all the
>>>> deatils have fallen out of my head). You'd need to make sure you're definitely
>>>> not splitting an area of text that the secondary CPUs are executing while they
>>>> are being held in the pen, since at least one of those CPUs doesn't support BBML2.
>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>> In this case, it's useful to rewalk the page-table with the specific
>>>>>>> range to get the number of block mapping.
>>>>>>>
>>>>>>>>
>>>>>>>>> +	split_pgtables_idx = 0;
>>>>>>>>> +	split_pgtables_count = 0;
>>>>>>>>> +
>>>>>>>>> +	ret = walk_kernel_page_table_range_lockless(lstart, kstart,
>>>>>>>>> +						    &collect_to_split_ops,
>>>>>>>>> +						    NULL, NULL);
>>>>>>>>> +	if (!ret)
>>>>>>>>> +		ret = walk_kernel_page_table_range_lockless(kend, lend,
>>>>>>>>> +							    &collect_to_split_ops,
>>>>>>>>> +							    NULL, NULL);
>>>>>>>>> +	if (ret || !split_pgtables_count)
>>>>>>>>> +		goto error;
>>>
>>> Just noticed this, but why do we check '!split_pgtables_count' here?
>>> if the page-table is already somehow mapped at page granularity, that
>>> doesn't necessarily sound like a fatal error to me.
>>>
>>>>>>>>> +
>>>>>>>>> +	ret = -ENOMEM;
>>>>>>>>> +
>>>>>>>>> +	split_pgtables = kvmalloc(split_pgtables_count * sizeof(struct ptdesc *),
>>>>>>>>> +				  GFP_KERNEL | __GFP_ZERO);
>>>>>>>>> +	if (!split_pgtables)
>>>>>>>>> +		goto error;
>>>>>>>>> +
>>>>>>>>> +	for (i = 0; i < split_pgtables_count; i++) {
>>>>>>>>> +		/* The page table will be filled during splitting, so zeroing it is unnecessary. */
>>>>>>>>> +		split_pgtables[i] = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
>>>>>>>>> +		if (!split_pgtables[i])
>>>>>>>>> +			goto error;
>>>>>>>>
>>>>>>>> This looks potentially expensive on the boot path and only gets worse as
>>>>>>>> the amount of memory grows. Maybe we should predicate this preallocation
>>>>>>>> on preempt-rt?
>>>>>>>
>>>>>>> Agree. then I'll apply pre-allocation with PREEMPT_RT only.
>>>>>>
>>>>>> I guess I'm missing something obvious but I don't understand the problem here...
>>>>>> We are only deferring the allocation of all these pgtables, so the cost is
>>>>>> neutral surely? Had we correctly guessed that the system doesn't support BBML2
>>>>>> earlier, we would have had to allocate all these pgtables earlier.
>>>>>>
>>>>>> Another way to look at it is that we are still allocating the same number of
>>>>>> pgtables in the existing fallback path, it's just that we are doing it inside
>>>>>> the stop_machine().
>>>>>>
>>>>>> My vote would be _not_ to have a separate path for PREEMPT_RT, which will end up
>>>>>> with significantly less testing...
>>>>>
>>>>> IIUC, Will's mention is additional memory allocation for
>>>>> "split_pgtables" where saved "pre-allocate" page tables.
>>>>> As the memory increase, definitely this size would increase the cost.
>>>>
>>>> Err, so you're referring to the extra kvmalloc()? I don't think that's a big
>>>> deal is it? you get 512 pointers per page. So the amortized cost is 1/512= 0.2%?
>>>
>>> Right, it was the page-table pages I was worried about not the array of
>>> pointers.
>>>
>>>> I suspect we have both misunderstood Will's point...
>>>
>>> I probably just got confused by linear_map_free_split_pgtables() as it
>>> has logic to free unused page-table pages between 'split_pgtables_idx'
>>> and 'split_pgtables_count', implying that we can over-allocate.
>>>
>>> If that is only needed for the error path in
>>> linear_map_prealloc_split_pgtables(), then perhaps that part should be
>>> inlined to deal with the case where we fail to allocate part way through.
>>
>> I was originally concerned [1] that there could be a race where another CPU
>> caused the normal splitting machinery to kick in after this cpu determined the
>> number of required page tables, so there could be some left over in that case.
>>
>> On reflection, I guess (hope) that's not possible because we've determined that
>> some CPUs don't support BBML2. I'm guessing the secondaries haven't been
>> released to do general work yet?
> 
> I don't think so, since the linear_map_maybe_split_to_ptes() called
> in smp_cpus_done() but in here, secondary cpus already on and
> it seems schedulable.
> 
> That's why although, This is unlikely, after collecting the number of
> splitiing by other cpu have a possibility to *split* which was counted
> and at that time I agreed for your comments because of this *low
> possiblity*.
> 
>>
>> In which case, I agree, this could be simplified and we could just assert that
>> all pre-allocated pages get used up if there is no error?
>>
>> [1] https://lore.kernel.org/all/73ced1db-a2e2-49ea-927e-9fc4a30e771e@arm.com/
> 
> So with above reason, I still think it need to sustain the free
> unused pagetable.
> 
> Am I missing something?

My concern is that if a secondary CPU can race and cause a split, that is
unsound because we have determined that although the primary CPU supports BBML2,
at least one of the secondary CPUs does not. So splitting a live mapping is unsafe.

I just had a brief chat with Rutland, and he agrees that this _could_ be a
problem. Basically there is a window between onlining the secondary cpus and
entering the stop_machine() where one of those cpus _could_ end up doing
something that causes us to split the linear map.

I'm not immediately sure how to solve that.

> 
> --
> Sincerely,
> Yeoreum Yun


