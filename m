Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B5E10706E8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgT48koR2AFBfU9d+XRES0muWQ8eJqKljwuWM5+7rPc=; b=ZMgLcA1d7cBYKpLHB62A0lLdNT
	AY1N9Wus8neYwDmiKJRz/J6/rQYllQ+3aY0b7cAImthlIXf7HLaC4LxrqA1mD2KkkyeH81FyXGAhe
	i7lurIutUF9ogHTaAfK+xT7Bcq8hd9MONNPCmRH0ygaTyq1Nl47CbYqF/tSK7Bh85P738J/s/SJ9w
	ENFzskEvow34mOxp71byGnrO+yYQtK9GP4KG2LAmV9NguvA6r41AELtxQPHvJ/pRxwe0Gs2UejReb
	WCyW2GUjfU0O/PotpO+YyGzY05f1Ol//L7yzwl+1wh2ZlaD8ktp6bovrTm1/pszWp0ZE0xYfJBkGY
	+FXPeCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oLt-00000008DzQ-1del;
	Wed, 18 Mar 2026 10:42:13 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oLq-00000008DyQ-2M5r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:42:12 +0000
Message-ID: <562fb349-c2d2-4fbe-83f9-75c26cc4b7ae@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773830516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgT48koR2AFBfU9d+XRES0muWQ8eJqKljwuWM5+7rPc=;
	b=fj8auFFdVi5ti/XLJTBpcsBC0Gd/J4LPBvkAKdEy6ilHFgLsYQJbQpBt2vecZloUmBB1Hf
	AszJSJP7VAGpLAbWtHz5Nnz/RKvxbtLm3xGTgoBvc2USbtjb9KJ/Ifu/x8TVzCKgs8RAhC
	CqGlKjvmllPI+s4y7ToX198UHOa06Fc=
Date: Wed, 18 Mar 2026 13:41:33 +0300
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K
 pages
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ryan.roberts@arm.com
Cc: ajd@linux.ibm.com, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, brauner@kernel.org,
 catalin.marinas@arm.com, dev.jain@arm.com, jack@suse.cz, kees@kernel.org,
 kevin.brodsky@arm.com, lance.yang@linux.dev, Liam.Howlett@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, npache@redhat.com, rmclure@linux.ibm.com,
 Al Viro <viro@zeniv.linux.org.uk>, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, shakeel.butt@linux.dev,
 kernel-team@meta.com, WANG Rui <r@hev.cc>
References: <20260310145406.3073394-1-usama.arif@linux.dev>
 <608c87ce-10d9-4012-b6e9-298d5a356801@kernel.org>
 <9e9edebb-3953-4bcd-80e2-614dcec5b402@linux.dev>
 <be65e710-997c-413c-8455-2d687fc51fc6@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <be65e710-997c-413c-8455-2d687fc51fc6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_034210_785359_98B3708C 
X-CRM114-Status: GOOD (  21.01  )
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



On 16/03/2026 19:06, David Hildenbrand (Arm) wrote:
> On 3/13/26 20:59, Usama Arif wrote:
>>
>>
>> On 13/03/2026 16:20, David Hildenbrand (Arm) wrote:
>>> On 3/10/26 15:51, Usama Arif wrote:
>>>> On arm64, the contpte hardware feature coalesces multiple contiguous PTEs
>>>> into a single iTLB entry, reducing iTLB pressure for large executable
>>>> mappings.
>>>>
>>>> exec_folio_order() was introduced [1] to request readahead at an
>>>> arch-preferred folio order for executable memory, enabling contpte
>>>> mapping on the fault path.
>>>>
>>>> However, several things prevent this from working optimally on 16K and
>>>> 64K page configurations:
>>>>
>>>> 1. exec_folio_order() returns ilog2(SZ_64K >> PAGE_SHIFT), which only
>>>>    produces the optimal contpte order for 4K pages. For 16K pages it
>>>>    returns order 2 (64K) instead of order 7 (2M), and for 64K pages it
>>>>    returns order 0 (64K) instead of order 5 (2M). Patch 1 fixes this by
>>>>    using ilog2(CONT_PTES) which evaluates to the optimal order for all
>>>>    page sizes.
>>>>
>>>> 2. Even with the optimal order, the mmap_miss heuristic in
>>>>    do_sync_mmap_readahead() silently disables exec readahead after 100
>>>>    page faults. The mmap_miss counter tracks whether readahead is useful
>>>>    for mmap'd file access:
>>>>
>>>>    - Incremented by 1 in do_sync_mmap_readahead() on every page cache
>>>>      miss (page needed IO).
>>>>
>>>>    - Decremented by N in filemap_map_pages() for N pages successfully
>>>>      mapped via fault-around (pages found in cache without faulting,
>>>>      evidence that readahead was useful). Only non-workingset pages
>>>>      count and recently evicted and re-read pages don't count as hits.
>>>>
>>>>    - Decremented by 1 in do_async_mmap_readahead() when a PG_readahead
>>>>      marker page is found (indicates sequential consumption of readahead
>>>>      pages).
>>>>
>>>>    When mmap_miss exceeds MMAP_LOTSAMISS (100), all readahead is
>>>>    disabled. On 64K pages, both decrement paths are inactive:
>>>>
>>>>    - filemap_map_pages() is never called because fault_around_pages
>>>>      (65536 >> PAGE_SHIFT = 1) disables should_fault_around(), which
>>>>      requires fault_around_pages > 1. With only 1 page in the
>>>>      fault-around window, there is nothing "around" to map.
>>>>
>>>>    - do_async_mmap_readahead() never fires for exec mappings because
>>>>      exec readahead sets async_size = 0, so no PG_readahead markers
>>>>      are placed.
>>>>
>>>>    With no decrements, mmap_miss monotonically increases past
>>>>    MMAP_LOTSAMISS after 100 faults, disabling exec readahead
>>>>    for the remainder of the mapping.
>>>>    Patch 2 fixes this by moving the VM_EXEC readahead block
>>>>    above the mmap_miss check, since exec readahead is targeted (one
>>>>    folio at the fault location, async_size=0) not speculative prefetch.
>>>>
>>>> 3. Even with correct folio order and readahead, contpte mapping requires
>>>>    the virtual address to be aligned to CONT_PTE_SIZE (2M on 64K pages).
>>>>    The readahead path aligns file offsets and the buddy allocator aligns
>>>>    physical memory, but the virtual address depends on the VMA start.
>>>>    For PIE binaries, ASLR randomizes the load address at PAGE_SIZE (64K)
>>>>    granularity, giving only a 1/32 chance of 2M alignment. When
>>>>    misaligned, contpte_set_ptes() never sets the contiguous PTE bit for
>>>>    any folio in the VMA, resulting in zero iTLB coalescing benefit.
>>>>
>>>>    Patch 3 fixes this for the main binary by bumping the ELF loader's
>>>>    alignment to PAGE_SIZE << exec_folio_order() for ET_DYN binaries.
>>>>
>>>>    Patch 4 fixes this for shared libraries by adding a contpte-size
>>>>    alignment fallback in thp_get_unmapped_area_vmflags(). The existing
>>>>    PMD_SIZE alignment (512M on 64K pages) is too large for typical shared
>>>>    libraries, so this smaller fallback (2M) succeeds where PMD fails.
>>>>
>>>> I created a benchmark that mmaps a large executable file and calls
>>>> RET-stub functions at PAGE_SIZE offsets across it. "Cold" measures
>>>> fault + readahead cost. "Random" first faults in all pages with a
>>>> sequential sweep (not measured), then measures time for calling random
>>>> offsets, isolating iTLB miss cost for scattered execution.
>>>>
>>>> The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
>>>> 512MB executable file on ext4, averaged over 3 runs:
>>>>
>>>>   Phase      | Baseline     | Patched      | Improvement
>>>>   -----------|--------------|--------------|------------------
>>>>   Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
>>>>   Random     | 76.0 ms      | 58.3 ms      | 23% faster
>>>
>>> I'm curious: is a single order really what we want?
>>>
>>> I'd instead assume that we might want to make decisions based on the
>>> mapping size.
>>>
>>> Assume you have a 128M mapping, wouldn't we want to use a different
>>> alignment than, say, for a 1M mapping, a 128K mapping or a 8k mapping?
>>>
>>
>> So I see 2 benefits from this. Page fault and iTLB coverage. IMHO page
>> faults are not that big of a deal? If the text section is hot, it wont
>> get flushed after faulting in. So the real benefit comes from improved
>> iTLB coverage.
>>
>> For a 128M mapping, 2M alignment gives 64 contpte entries. Aligning
>> to something larger (say 128M) wouldn't give any additional TLB
>> coalescing, each 2M-aligned region independently qualifies for contpte.
>>
>> Mappings smaller than 2M can't benefit from contpte regardless of
>> alignment, so falling back to PAGE_SIZE would be the optimal behaviour.
>> Adding intermediate sizes (e.g. 512K, 128K) wouldn't map to any
>> hardware boundary and adds complexity without TLB benefit?
> 
> I might be wrong, but I think you are mixing two things here:
> 
> (1) "Minimum" folio size (exec_folio_order())
> 
> (2) VMA alignment.
> 
> 
> (2) should certainly be as large as (1), but assume we can get a 2M
> folio on arm64 4k, why shouldn't we align it to 2M if the region is
> reasonably sized, and use a PMD?
> 
> 

So this series is tackling both (1) and (2). When I started making changes
to the code, what I wanted was 2M folios at fault with 64K base page size
to reduce iTLB misses. This is what patch 1 (and 2) will achieve.

Yes, completely agree, (2) should be as large as (1). I didn't think about
PMD size on 4K which you pointed out. do_sync_mmap_readahead can give
that with force_thp_readahead, so this should be supported.

But we shouldn't align to PMD size for all base page sizes. As Rui pointed
out, increasing alignment size reduces ASLR entropy [1]. Should we max alignement
to 2M?

[1] https://lore.kernel.org/all/20260313144213.95686-1-r@hev.cc/

