Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B77FD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 08:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ofm+KQE0HxEiv1Gq2GQLI51GgfEo/ZwflXsA1/quJH4=; b=JyhpXBR28xWwXgQY4VFbMhNLMI
	emZE4gkXqSBdKU+H1VrEBu7SptMMeqGg0v+VtRQWEDOyDhInBcwsBS+zYoWiEV8Szjcy838i0tesc
	fskHe23FuX612FiCsDFuS6M3aokMcL0irertvLgmzPeI+ZCckY84PcAuNn8HvOgAhU1OwyklQE7tk
	ZwzLGoKxzhoxyfMHMySxprA7cqN02H6+odtdBtHbcKS1F5o2X8uS2aic5KM06DkWouIVQGIEsIutB
	wKMHWB2V+U0VOzaeQpMg/a3SlHwAQ0egteBonNEHEN81hXwyhdnGjCtnRmQ2Se87X5hHLG9VA5hw+
	1HDQxfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7XC-00000003UnF-3L7N;
	Tue, 20 Jan 2026 08:56:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7X9-00000003Ulw-0hsQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 08:56:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFBC91476;
	Tue, 20 Jan 2026 00:56:10 -0800 (PST)
Received: from [10.57.93.204] (unknown [10.57.93.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2603C3F740;
	Tue, 20 Jan 2026 00:56:14 -0800 (PST)
Message-ID: <2619166b-13ef-4daa-82c7-1d44035a8d6c@arm.com>
Date: Tue, 20 Jan 2026 08:56:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: mmu: avoid allocating pages while splitting
 the linear mapping
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, catalin.marinas@arm.com,
 akpm@linux-oundation.org, david@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, dev.jain@arm.com, yang@os.amperecomputing.com,
 chaitanyas.prakash@arm.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, lorenzo.stoakes@oracle.com, ardb@kernel.org,
 jackmanb@google.com, vbabka@suse.cz, mhocko@suse.com
References: <20260105202328.2418990-1-yeoreum.yun@arm.com>
 <20260105202328.2418990-3-yeoreum.yun@arm.com>
 <aW5p1ylQBNXTEmmq@willie-the-truck> <aW6hISBu3hNYS771@e129823.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <aW6hISBu3hNYS771@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_005619_622250_2DCB3CE2 
X-CRM114-Status: GOOD (  28.19  )
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

On 19/01/2026 21:24, Yeoreum Yun wrote:
> Hi Will,
> 
>> On Mon, Jan 05, 2026 at 08:23:27PM +0000, Yeoreum Yun wrote:
>>> +static int __init linear_map_prealloc_split_pgtables(void)
>>> +{
>>> +	int ret, i;
>>> +	unsigned long lstart = _PAGE_OFFSET(vabits_actual);
>>> +	unsigned long lend = PAGE_END;
>>> +	unsigned long kstart = (unsigned long)lm_alias(_stext);
>>> +	unsigned long kend = (unsigned long)lm_alias(__init_begin);
>>> +
>>> +	const struct mm_walk_ops collect_to_split_ops = {
>>> +		.pud_entry	= collect_to_split_pud_entry,
>>> +		.pmd_entry	= collect_to_split_pmd_entry
>>> +	};
>>
>> Why do we need to rewalk the page-table here instead of collating the
>> number of block mappings we put down when creating the linear map in
>> the first place?

That's a good point; perhaps we can reuse the counters that this series introduces?

https://lore.kernel.org/all/20260107002944.2940963-1-yang@os.amperecomputing.com/

> 
> First, linear alias of the [_text, __init_begin) is not a target for
> the split and it also seems strange to me to add code inside alloc_init_XXX()
> that both checks an address range and counts to get the number of block mappings.
> 
> Second, for a future feature,
> I hope to add some code to split "specfic" area to be spilt e.x)
> to set a specific pkey for specific area.

Could you give more detail on this? My working assumption is that either the
system supports BBML2 or it doesn't. If it doesn't, we need to split the whole
linear map. If it does, we already have logic to split parts of the linear map
when needed.

> 
> In this case, it's useful to rewalk the page-table with the specific
> range to get the number of block mapping.
> 
>>
>>> +	split_pgtables_idx = 0;
>>> +	split_pgtables_count = 0;
>>> +
>>> +	ret = walk_kernel_page_table_range_lockless(lstart, kstart,
>>> +						    &collect_to_split_ops,
>>> +						    NULL, NULL);
>>> +	if (!ret)
>>> +		ret = walk_kernel_page_table_range_lockless(kend, lend,
>>> +							    &collect_to_split_ops,
>>> +							    NULL, NULL);
>>> +	if (ret || !split_pgtables_count)
>>> +		goto error;
>>> +
>>> +	ret = -ENOMEM;
>>> +
>>> +	split_pgtables = kvmalloc(split_pgtables_count * sizeof(struct ptdesc *),
>>> +				  GFP_KERNEL | __GFP_ZERO);
>>> +	if (!split_pgtables)
>>> +		goto error;
>>> +
>>> +	for (i = 0; i < split_pgtables_count; i++) {
>>> +		/* The page table will be filled during splitting, so zeroing it is unnecessary. */
>>> +		split_pgtables[i] = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
>>> +		if (!split_pgtables[i])
>>> +			goto error;
>>
>> This looks potentially expensive on the boot path and only gets worse as
>> the amount of memory grows. Maybe we should predicate this preallocation
>> on preempt-rt?
> 
> Agree. then I'll apply pre-allocation with PREEMPT_RT only.

I guess I'm missing something obvious but I don't understand the problem here...
We are only deferring the allocation of all these pgtables, so the cost is
neutral surely? Had we correctly guessed that the system doesn't support BBML2
earlier, we would have had to allocate all these pgtables earlier.

Another way to look at it is that we are still allocating the same number of
pgtables in the existing fallback path, it's just that we are doing it inside
the stop_machine().

My vote would be _not_ to have a separate path for PREEMPT_RT, which will end up
with significantly less testing...

Thanks,
Ryan

> 
> Thanks for your review.
> 
> --
> Sincerely,
> Yeoreum Yun


