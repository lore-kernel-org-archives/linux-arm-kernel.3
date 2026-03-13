Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCC9107BCE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 20:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXlJyvFaDSUeU2InKFWUTUR4qu/Qcpq4+p/Os9IN1Fw=; b=PZeuzZll4+s2vGV45HaP/utSKv
	we65vdUc3KCmCKOCHIEULS2UA3RbPovFcSkGsw79sVa0xK5ifAfm90xV7R7AWZ+VhrVznOyj8odSq
	L9ZTUNNJ7LYw4e5FxbKQCqJjwELxTTNKr73NzOZJlJaLBrtweX5HVvt71Gj1aAEAtDAg0Kck99jsX
	5T7QOBmk6tWl6uwpMmfamSKPXmzHdfb0DB+CPfPE421zX6x1UB0v4fF/XDuy+f0LAgjXtug5fbafi
	1izmB2vGjtJoizp9d8xJLqennSrBSyCaD6tZBqpQYN8OCUz2qTGCOCvcJ6uPxt+NNEqPLymbuu+kY
	AZJhi9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19Y4-00000001Bx5-1mij;
	Fri, 13 Mar 2026 20:55:56 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w19Y0-00000001Bvo-2kFy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 20:55:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773435348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXlJyvFaDSUeU2InKFWUTUR4qu/Qcpq4+p/Os9IN1Fw=;
	b=ApaiXJQFxRXVAx9DDLq9RZwe4REbPzug7MwIVwkyVrwgGTTKM067WGOEC1OvqGMuKccV1z
	4g+PUS+RPIbPSGHphASw8n44kNhZovGOMPS5Qm8Eg7gpxLAZ6e84OCytvss97G1SO6utJ/
	Q8z40Og4I69boCHij4m6ZmAFUR1ertQ=
From: Usama Arif <usama.arif@linux.dev>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	david@kernel.org,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	dev.jain@arm.com,
	jack@suse.cz,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	Liam.Howlett@oracle.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	rmclure@linux.ibm.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com,
	hannes@cmpxchg.org,
	kas@kernel.org,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Fri, 13 Mar 2026 13:55:38 -0700
Message-ID: <20260313205541.3830595-1-usama.arif@linux.dev>
In-Reply-To: <cfdfca9c-4752-4037-a289-03e6e7a00d47@arm.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_135553_398353_E9B740E7 
X-CRM114-Status: GOOD (  42.64  )
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

On Fri, 13 Mar 2026 16:33:42 +0000 Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 10/03/2026 14:51, Usama Arif wrote:
> > On arm64, the contpte hardware feature coalesces multiple contiguous PTEs
> > into a single iTLB entry, reducing iTLB pressure for large executable
> > mappings.
> > 
> > exec_folio_order() was introduced [1] to request readahead at an
> > arch-preferred folio order for executable memory, enabling contpte
> > mapping on the fault path.
> > 
> > However, several things prevent this from working optimally on 16K and
> > 64K page configurations:
> > 
> > 1. exec_folio_order() returns ilog2(SZ_64K >> PAGE_SHIFT), which only
> >    produces the optimal contpte order for 4K pages. For 16K pages it
> >    returns order 2 (64K) instead of order 7 (2M), and for 64K pages it
> >    returns order 0 (64K) instead of order 5 (2M). 
> 
> This was deliberate, although perhaps a bit conservative. I was concerned about
> the possibility of read amplification; pointlessly reading in a load of memory
> that never actually gets used. And that is independent of page size.
> 
> 2M seems quite big as a default IMHO, I could imagine Android might complain
> about memory pressure in their 16K config, for example.
> 

The force_thp_readahead path in do_sync_mmap_readahead() reads at
HPAGE_PMD_ORDER (2M on x86) and even doubles it to 4M for
non VM_RAND_READ mappings (ra->size *= 2), with async readahead
enabled. exec_folio_order() is more conservative. a single 2M folio
with async_size=0, no speculative prefetch. So I think the memory
pressure would not be worse than what x86 has?

For memory pressure on Android 16K: the readahead is clamped to VMA
boundaries, so a small shared library won't read 2M.
page_cache_ra_order() reduces folio order near EOF and on allocation
failure, so the 2M order is a preference, not a guarantee with the
current code?

> Additionally, ELF files are normally only aligned to 64K and you can only get
> the TLB benefits if the memory is aligned in physical and virtual memory.
> 
> > Patch 1 fixes this by
> >    using ilog2(CONT_PTES) which evaluates to the optimal order for all
> >    page sizes.
> > 
> > 2. Even with the optimal order, the mmap_miss heuristic in
> >    do_sync_mmap_readahead() silently disables exec readahead after 100
> >    page faults. The mmap_miss counter tracks whether readahead is useful
> >    for mmap'd file access:
> > 
> >    - Incremented by 1 in do_sync_mmap_readahead() on every page cache
> >      miss (page needed IO).
> > 
> >    - Decremented by N in filemap_map_pages() for N pages successfully
> >      mapped via fault-around (pages found in cache without faulting,
> >      evidence that readahead was useful). Only non-workingset pages
> >      count and recently evicted and re-read pages don't count as hits.
> > 
> >    - Decremented by 1 in do_async_mmap_readahead() when a PG_readahead
> >      marker page is found (indicates sequential consumption of readahead
> >      pages).
> > 
> >    When mmap_miss exceeds MMAP_LOTSAMISS (100), all readahead is
> >    disabled. On 64K pages, both decrement paths are inactive:
> > 
> >    - filemap_map_pages() is never called because fault_around_pages
> >      (65536 >> PAGE_SHIFT = 1) disables should_fault_around(), which
> >      requires fault_around_pages > 1. With only 1 page in the
> >      fault-around window, there is nothing "around" to map.
> > 
> >    - do_async_mmap_readahead() never fires for exec mappings because
> >      exec readahead sets async_size = 0, so no PG_readahead markers
> >      are placed.
> > 
> >    With no decrements, mmap_miss monotonically increases past
> >    MMAP_LOTSAMISS after 100 faults, disabling exec readahead
> >    for the remainder of the mapping.
> >    Patch 2 fixes this by moving the VM_EXEC readahead block
> >    above the mmap_miss check, since exec readahead is targeted (one
> >    folio at the fault location, async_size=0) not speculative prefetch.
> 
> Interesting!
> 
> > 
> > 3. Even with correct folio order and readahead, contpte mapping requires
> >    the virtual address to be aligned to CONT_PTE_SIZE (2M on 64K pages).
> >    The readahead path aligns file offsets and the buddy allocator aligns
> >    physical memory, but the virtual address depends on the VMA start.
> >    For PIE binaries, ASLR randomizes the load address at PAGE_SIZE (64K)
> >    granularity, giving only a 1/32 chance of 2M alignment. When
> >    misaligned, contpte_set_ptes() never sets the contiguous PTE bit for
> >    any folio in the VMA, resulting in zero iTLB coalescing benefit.
> > 
> >    Patch 3 fixes this for the main binary by bumping the ELF loader's
> >    alignment to PAGE_SIZE << exec_folio_order() for ET_DYN binaries.
> > 
> >    Patch 4 fixes this for shared libraries by adding a contpte-size
> >    alignment fallback in thp_get_unmapped_area_vmflags(). The existing
> >    PMD_SIZE alignment (512M on 64K pages) is too large for typical shared
> >    libraries, so this smaller fallback (2M) succeeds where PMD fails.
> 
> I don't see how you can reliably influence this from the kernel? The ELF file
> alignment is, by default, 64K (16K on Android) and there is no guarrantee that
> the text section is the first section in the file. You need to align the start
> of the text section to the 2M boundary and to do that, you'll need to align the
> start of the file to some 64K boundary at a specific offset to the 2M boundary,
> based on the size of any sections before the text section. That's a job for the
> dynamic loader I think? Perhaps I've misunderstood what you're doing...
>

I only started looking into how this works a few days before sending these
patches, so I could be wrong (please do correct me if thats the case!)

For the main binary (patch 3): load_elf_binary() controls load_bias.
Each PT_LOAD segment is mapped at load_bias + p_vaddr via elf_map().
The alignment variable feeds directly into load_bias calculation.
If p_vaddr=0 and p_offset=0, mapped_addr = load_bias + 0 = load_bias. By
ensuring load_bias is folio size aligned, the text segment's virtual address
is also folio size aligned.

For shared libraries (patch 4): ld.so loads these via mmap(), and the
kernel's get_unmapped_area callback (thp_get_unmapped_area for ext4,
xfs, btrfs) picks the virtual address. The existing code tries
PMD_SIZE alignment first (512M on 64K pages), which is too large for
typical shared libraries and always fails. Patch 4 adds a fallback
that tries folio-size alignment (2M), which is small enough to succeed
for most libraries.

> > 
> > I created a benchmark that mmaps a large executable file and calls
> > RET-stub functions at PAGE_SIZE offsets across it. "Cold" measures
> > fault + readahead cost. "Random" first faults in all pages with a
> > sequential sweep (not measured), then measures time for calling random
> > offsets, isolating iTLB miss cost for scattered execution.
> > 
> > The benchmark results on Neoverse V2 (Grace), arm64 with 64K base pages,
> > 512MB executable file on ext4, averaged over 3 runs:
> > 
> >   Phase      | Baseline     | Patched      | Improvement
> >   -----------|--------------|--------------|------------------
> >   Cold fault | 83.4 ms      | 41.3 ms      | 50% faster
> >   Random     | 76.0 ms      | 58.3 ms      | 23% faster
> 
> I think the proper way to do this is to link the text section with 2M alignment
> and have the dynamic linker mark the region with MADV_HUGEPAGE?
> 

On arm64 with 64K pages, the force_thp_readahead path triggered by
MADV_HUGEPAGE reads at HPAGE_PMD_ORDER (512M). Even with file and
anon khugepaged support aded for khugpaged, the collapse won't happen
form the start.

Yes I think dynamic linker is also a good alternate approach from Wangs
patches [1]. But doing it in the kernel would be more transparent?

[1] https://sourceware.org/pipermail/libc-alpha/2026-March/175776.html

> Thanks,
> Ryan
> 
> 
> > 
> > [1] https://lore.kernel.org/all/20250430145920.3748738-6-ryan.roberts@arm.com/
> > 
> > Usama Arif (4):
> >   arm64: request contpte-sized folios for exec memory
> >   mm: bypass mmap_miss heuristic for VM_EXEC readahead
> >   elf: align ET_DYN base to exec folio order for contpte mapping
> >   mm: align file-backed mmap to exec folio order in
> >     thp_get_unmapped_area
> > 
> >  arch/arm64/include/asm/pgtable.h |  9 ++--
> >  fs/binfmt_elf.c                  | 15 +++++++
> >  mm/filemap.c                     | 72 +++++++++++++++++---------------
> >  mm/huge_memory.c                 | 17 ++++++++
> >  4 files changed, 75 insertions(+), 38 deletions(-)
> > 
> 
> 

