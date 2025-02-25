Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130DEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QsQ+WiC3O/tHbReBhmMj/V7ymYehocIIWbsM5O+taz4=; b=YCtVs2xfwV8xeOrO+iIQPdDD+D
	JNvawp1wTLTcQpejeVxKnsPs/jq90ng7z1BL0+bIZ0yhl0scVtwUgFfz82F/0yto4QjaRevS29E1U
	L/9TM8L6gGjZo5ifO/gkYcYrg3+b23/CwDq3SV1/IRwkYErjjt+4Gjh0tPDCjMT+Fz63hr5aS3LuW
	ApMvqI+AbXz6rjsKdlrA9+mM2RG/SAGwzlYDvGvmojmPHTVcIS+a2gFyDp3K0q8wh4s1SmWYtJUke
	ZN46mlzquFsCc+P3mLNGypeYRv/WShGvplziEgYL9TLng5OXldNCafc2ohWNZa3Rl43WA6JxbNcW5
	wT6EVmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyMo-00000000XDj-0qNk;
	Tue, 25 Feb 2025 17:05:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzj-00000000JgE-1sh2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Feb 2025 16:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QsQ+WiC3O/tHbReBhmMj/V7ymYehocIIWbsM5O+taz4=; b=Xt916aeWYZ0YMaqImIKDiYpKt1
	UVseBIGzYhS5Cm9qH2oYH7zE02o8tbVtdlAih9ocuiJh38StJL8PZ/RUWIfdqRHxg/SEbazBvcYAp
	lbtfuMSInVm5oNjgqNChPnb6sll2gzH4MDgoV9BspoPZQYvksA+gas6lnee7BarhBJ4/9VblaoBDd
	oXJtQfB6NEULedcFNVIVfHNtF24TZbS1vZG42AkM3BrCapmAjlD7uwnWD4yw6kNsCHf7vCazG/aW0
	vQPcZEC/X3nWv+9dOJlcLRtT80jFz+VaxfgT64XsKCQ/uFoqs0lMSdnvPPkD5H6+Qna61CiJjD/Jt
	vxPd9Sfg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzg-00000003Mco-0UzB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:41:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70A6628C7;
	Tue, 25 Feb 2025 08:41:29 -0800 (PST)
Received: from [10.1.27.154] (XHFQ2J9959.cambridge.arm.com [10.1.27.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B0BE3F6A8;
	Tue, 25 Feb 2025 08:41:10 -0800 (PST)
Message-ID: <baa34c09-48a1-4835-842b-4612e3f632f8@arm.com>
Date: Tue, 25 Feb 2025 16:41:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/14] arm64/mm: Avoid barriers for invalid or
 userspace mappings
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-8-ryan.roberts@arm.com> <Z7nOe78W4JXFAkMb@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z7nOe78W4JXFAkMb@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_164116_541664_24B0917B 
X-CRM114-Status: GOOD (  45.97  )
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

On 22/02/2025 13:17, Catalin Marinas wrote:
> On Mon, Feb 17, 2025 at 02:07:59PM +0000, Ryan Roberts wrote:
>> __set_pte_complete(), set_pmd(), set_pud(), set_p4d() and set_pgd() are
>> used to write entries into pgtables. And they issue barriers (currently
>> dsb and isb) to ensure that the written values are observed by the table
>> walker prior to any program-order-future memory access to the mapped
>> location.
>>
>> Over the years some of these functions have received optimizations: In
>> particular, commit 7f0b1bf04511 ("arm64: Fix barriers used for page
>> table modifications") made it so that the barriers were only emitted for
>> valid-kernel mappings for set_pte() (now __set_pte_complete()). And
>> commit 0795edaf3f1f ("arm64: pgtable: Implement p[mu]d_valid() and check
>> in set_p[mu]d()") made it so that set_pmd()/set_pud() only emitted the
>> barriers for valid mappings.
> 
> The assumption probably was that set_pmd/pud() are called a lot less
> often than set_pte() as they cover larger address ranges (whether table
> or leaf).

Yes you're probably right. From an optimization perspective I doubt we are
seeing much improvement from the reduction in barriers for pmd/pud/p4d/pgd
levels. I made the change more for the benefit of uniformity.

> 
>> set_p4d()/set_pgd() continue to emit the barriers unconditionally.
> 
> We probably missed them, should have been the same as set_pmd().

So perhaps the middle ground is for pmd/pud/p4d/pgd to all have the same
implementation (emit barriers for valid mappings only). And then let pte level
continue with the additional optimization of only emitting barriers for valid
*kernel* mappings.

The only problem there is that it gets confusing when you bring set_pmd_at() and
set_pud_at() into the picture, which today end up calling __set_pte(). So
pmds/puds set by that route *already* has the same optimizations applied as ptes
today.

Personally, I'd prefer to have a single pattern for all levels.

> 
>> This is all very confusing to the casual observer; surely the rules
>> should be invariant to the level? Let's change this so that every level
>> consistently emits the barriers only when setting valid, non-user
>> entries (both table and leaf).
> 
> Also see commit d0b7a302d58a ("Revert "arm64: Remove unnecessary ISBs
> from set_{pte,pmd,pud}"") why we added back the ISBs to the pmd/pud
> accessors and the last paragraph on why we are ok with the spurious
> faults for PTEs.

Yes, I was already aware of that behaviour (thanks to MarkR for patiently
explaining it to me!). But my changes should still be compatible with that
requirement; we always issue an ISB after updating the page table with a valid,
kernel mapping.

As an aside, my understanding is that if the system supports FEAT_ETS2, then the
CPU promises not to store that "faulting" state in the pipeline, and the ISB
should not be needed; we could patch that out in future with an alternative.

> 
> For user mappings, the translation fault is routed through the usual
> path that can handle mapping new entries, so I think we are fine. But
> it's worth double-checking Will's comment (unless he only referred to
> kernel table entries).
> 
>> It seems obvious that if it is ok to elide barriers all but valid kernel
>> mappings at pte level, it must also be ok to do this for leaf entries at
>> other levels: If setting an entry to invalid, a tlb maintenance
>> operation must surely follow to synchronise the TLB and this contains
>> the required barriers.
> 
> Setting to invalid is fine indeed, handled by the TLB flushing code,
> hence the pmd_valid() checks.
> 
>> If setting a valid user mapping, the previous
>> mapping must have been invalid and there must have been a TLB
>> maintenance operation (complete with barriers) to honour
>> break-before-make.
> 
> That's not entirely true for change_protection() for example or the
> fork() path when we make the entries read-only from writeable without

For fork() we use ptep_set_wrprotect() (or these days, wrprotect_ptes(), right?)

> BBM. We could improve these cases as well, I haven't looked in detail.
> ptep_modify_prot_commit() via change_pte_range() can defer the barriers
> to tlb_end_vma(). Something similar on the copy_present_ptes() path.

But yes, I agree my comments are not fully correct for all corner cases. But the
point is that for all of these corner cases, the higher level causes appropriate
TLBI operations to be issued, which include the appropriate barriers.

> 
>> So the worst that can happen is we take an extra
>> fault (which will imply the DSB + ISB) and conclude that there is
>> nothing to do. These are the arguments for doing this optimization at
>> pte level and they also apply to leaf mappings at other levels.
> 
> It's worth clarifying Will's comment in the commit I mentioned above.

By my interpretation of Will's comment, it agrees with what I'm trying to say
here. Perhaps I've missed something?

> 
>> For table entries, the same arguments hold: If unsetting a table entry,
>> a TLB is required and this will emit the required barriers. If setting a
>> table entry, the previous value must have been invalid and the table
>> walker must already be able to observe that. Additionally the contents
>> of the pgtable being pointed to in the newly set entry must be visible
>> before the entry is written and this is enforced via smp_wmb() (dmb) in
>> the pgtable allocation functions and in __split_huge_pmd_locked(). But
>> this last part could never have been enforced by the barriers in
>> set_pXd() because they occur after updating the entry. So ultimately,
>> the wost that can happen by eliding these barriers for user table
>> entries is an extra fault.
>>
>> I observe roughly the same number of page faults (107M) with and without
>> this change when compiling the kernel on Apple M2.
> 
> That's microarch specific, highly dependent on timing, so you may never
> see a difference.

Fair. Are you advocating for keeping the higher levels not conditional on user
vs kernel? If so, then my preference would be to at least simplfy to 2 patterns
as I describe above.

> 
>> +static inline bool pmd_valid_not_user(pmd_t pmd)
>> +{
>> +	/*
>> +	 * User-space table entries always have (PXN && !UXN). All other
>> +	 * combinations indicate it's a table entry for kernel space.
>> +	 * Valid-not-user leaf entries follow the same rules as
>> +	 * pte_valid_not_user().
>> +	 */
>> +	if (pmd_table(pmd))
>> +		return !((pmd_val(pmd) & (PMD_TABLE_PXN | PMD_TABLE_UXN)) == PMD_TABLE_PXN);
>> +	return pte_valid_not_user(pmd_pte(pmd));
>> +}
> 
> With the 128-bit format I think we lost the PXN/UXNTable bits, though we
> have software bits if we need to. 

Indeed. I've already fed back to Anshuman that in my opinion, those bits need to
be maintained as SW bits. Otherwise it all gets a bit fragile if a SW agent
tries to check the value of those bits in D128 mode vs D64 mode.

> I just wonder whether it's worth the
> hassle of skipping some barriers for user non-leaf entries. Did you see
> any improvement in practice?

As I said, I doubt there is much of a performance improvement in practice, my
main motivation was unifying around a single pattern to simplify.

Thanks,
Ryan



