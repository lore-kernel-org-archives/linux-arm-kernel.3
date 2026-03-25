Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61762106B50C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPc4STJE/x6x8Oul04qpR4/yHv8YWznPcxuIhmSRqjU=; b=Ftz7vFJgGoB03bHX+Oi6foMZdQ
	Ncs7J3JlifAHMzrMC9tigZl3NR/4CmzJx6tldEPUTYKAu7Fjuj4vPYH8YY1Fv0EOZvyqaE8ZnzBq9
	ALPZaCQD0vQ0csF4NjFZH41ZZuBkc4BBkwfv5Qli3LU7EHnr9SK3RxHOpa93sZ+G5I1ZdN+9DtQCj
	d1qV9NudQbU47YT97BpKBggPiGWPYzn5xDXG5bQ9q5yqhfWIKei/r99YFZ02cZuqO1/p5cOuEpvxT
	x1Xvsmr0bh1F0twituQn8ssJlyn+kaUy9xM+pQTgI1lUtYGRuVfFAqZ+jz5PbX9mApHm9qkqmme4p
	3xzhKLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Myn-00000003LQK-2XJj;
	Wed, 25 Mar 2026 12:04:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mym-00000003LQ9-0Lvd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEB7F60123;
	Wed, 25 Mar 2026 12:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CEDC4CEF7;
	Wed, 25 Mar 2026 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774440294;
	bh=0JxGquwGllu59MQoMGnhiUMWHEi9Fyc1zjuGzrsi+B4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKN7uXIuWvlHJ/5PE2WPFEYpSParsl4Z7AKaTvPjdBvZC7+6cTZrqJmJ8YLHDkODx
	 /O4KXHUR34WALHdQQDAzH1utYjBSUzH2P8NET1PhjNycSpjGovsx8xc1Sy/jd9fxtE
	 7DHupDdP4zWZbgdcoqoshqM4OodcyERX6Z6Wninx9o4kEl7T1il17jXVqps1x4fWbJ
	 1LFZO0DM8DcyW9Y+RkhSaIM2adSCeNhmI47dX00oFVwrqFRVYdusD8hkIOiPhVtO4r
	 dtW4kRwIp8K+84wZpzyAxwr0U3rcuBNeXpuwNDZz+HXQlP+3rzBqmQoffQvVGH4v5B
	 RSsPuuQoyZCuQ==
Date: Wed, 25 Mar 2026 12:04:51 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com, 
	catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org, willy@infradead.org, 
	hughd@google.com, baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
Message-ID: <e93fb7ea-b838-4724-959c-212fa3513b20@lucifer.local>
References: <20260217145026.3880286-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217145026.3880286-1-dev.jain@arm.com>
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

Sorry if I repeat points others have raised, but I've just not had the time to
look at LSF/MM topics.

On Tue, Feb 17, 2026 at 08:20:26PM +0530, Dev Jain wrote:
> Hi everyone,
>
> We propose per-process page size on arm64. Although the proposal is for
> arm64, perhaps the concept can be extended to other arches, thus the
> generic topic name.

Well it's inevitably going to interact with core mm right and be super invasive?
So it's not just an arm64-only thing unless you feel you can keep it all in
arch/arm?

So you're asking essentially core mm to be radically altered to support an
arch-dependent feature.

I think we should be clear about that.

>
> -------------
> INTRODUCTION
> -------------
> While mTHP has brought the performance of many workloads running on an arm64 4K

Honestly this whole suggestion to me - instinctively - feels like 'mTHP doesn't
do what we want, so let's work around it'.

Wouldn't it be better to improve mTHP to provide what you are looking for?

> kernel closer to that of the performance on an arm64 64K kernel, a performance
> gap still remains. This is attributed to a combination of greater number of
> pgtable levels, less reach within the walk cache and higher data cache footprint
> for pgtable memory. At the same time, 64K is not suitable for general

This all sounds like things mTHP can address.

> purpose environments due to it's significantly higher memory footprint.
>
> To solve this, we have been experimenting with a concept called "per-process
> page size". This breaks the historic assumption of a single page size for the
> entire system: a process will now operate on a page size ABI that is greater

Fundamentally you'd be adding a great deal more complexity into mm, so the
trade-off has to be really excellent for that to be worthwhile.

It also essentially, to me, spells a giving up on mTHP ever being something that
automatically gives us what we want in these regards.

> than or equal to the kernel's page size. This is enabled by a key architectural
> feature on Arm: the separation of user and kernel page tables.

Isn't that true of every architecture? I mean we map userland and kernel memory
separately everywhere right?

Presumably you mean that arm64 has a feature whereby there are always entirely
separate page table structures for each.

But the kernel _regularly_ manipulates userland memory mappings, directly via
uaccess, via GUP, page table set up and manipulation via rmap etc. etc. etc.

uaccess means the kernel uses the same page tables that userland uses.

So is the proposed mechanism contpte or actually having a base page size at
higher granularity? Presumably the latter.

GUP fast as well is another concern - how can that be kept working with all
this?

And TLB maintenance, now you're dealing with fundamentally different
granularity, the kernel will have to surely become 'enlightened' somehow
(IOW - radically altered adding further complexity and bug risk) to handle
that?

>
> This can also lead to a future of a single kernel image instead of 4K, 16K
> and 64K images.

Except then every bit of kernel memory is at what 4K? Surely there's perf impact
there too..

I wonder about how on earth pageblocks are supposed to work in this
mechanism. Because now the whole heuristic means of avoiding fragmentation for
PMD sized pages won't work anywhere, because any given process might need more.

And pageblocks are currently broken for 64KB page size anyway, as the reserves
required are huge due to 64KB PMD size being gigantic (512GB isn't it?)

And then, there's the page cache :) but I guess we address that below.

I do wonder how this is supposed to interact with THP and mTHP which now
will have to maintain entirely separate PMD sizes depending on process
surely?

I mean correct me if I've misinterpreted and you intend to implement this
using contpte's or something, but if you are I'd ask why don't we just
improve mTHP?

>
> --------------
> CURRENT DESIGN
> --------------
> The design is based on one core idea; most of the kernel continues to believe
> there is only one page size in use across the whole system. That page size is
> the size selected at compile-time, as is done today. But every process (more
> accurately mm_struct) has a page size ABI which is one of the 3 page sizes
> (4K, 16K or 64K) as long as that page size is greater than or equal to the
> kernel page size (kernel page size is the macro PAGE_SIZE).
>
> Pagesize selection
> ------------------
> A process' selected page size ABI comes into force at execve() time and
> remains fixed until the process exits or until the next execve(). Any forked
> processes inherit the page size of their parent.
> The personality() mechanism already exists for similar cases, so we propose
> to extend it to enable specifying the required page size.

Well it's designed for providing basic compatibility layers and address
space limits and so on, this feels like something _hugely_ more impactful.

Doesn't personality() _immediately_ change the current process's state? I
don't think we should implement that that way.

If we were to do this, I'd say something like a clone flag would be better
maybe? or an elf setting.

I also wonder the degree to which kernel mechanisms already assume
PAGE_SIZE == userland PAGE_SIZE.

We'd have to rework all of the page table walkers for one no?

>
> There are 3 layers to the design. The first two are not arch-dependent,
> and makes Linux support a per-process pagesize ABI. The last layer is
> arch-specific.
>
> 1. ABI adapter
> --------------
> A translation layer is added at the syscall boundary to convert between the
> process page size and the kernel page size. This effectively means enforcing
> alignment requirements for addresses passed to syscalls and ensuring that
> quantities passed as “number of pages” are interpreted relative to the process
> page size and not the kernel page size. In this way the process has the illusion
> that it is working in units of its page size, but the kernel is working in
> units of the kernel page size.

I mean I think we'd also need to radically alter a lot of other things. But
this is already adding a bunch of complexity and ways for things to be
buggy and broken.

>
> 2. Generic Linux MM enlightenment
> ---------------------------------
> We enlighten the Linux MM code to always hand out memory in the granularity
> of process pages. Most of this work is greatly simplified because of the
> existing mTHP allocation paths, and the ongoing support for large folios
> across different areas of the kernel. The process order will be used as the
> hard minimum mTHP order to allocate.

I mean, this is again another radical change everywhere. I don't understand
'the process order will be used as the hard minimum mTHP order to
allocate'.

So now we're allocating all physical memory for these processes using mTHP
somehow? How does the mTHP mechanism interact with this?

What will `cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size` show?
And HugePageSize in /proc/meminfo?

Presumably:

sysconf(_SC_PAGESIZE); / getconf PAGE_SIZE/PAGESIZE

Also there's the thorny thing of in /proc/$pid/smaps 'MMUPageSize'
vs. 'KernelPageSize', which was instituted to handle some PPC-specific I
think variation in the two.

This was updated after recent discussions by David at:

https://lore.kernel.org/linux-mm/20260306081916.38872-1-david@kernel.org/

"KernelPageSize" always corresponds to "MMUPageSize", except when a larger
kernel page size is emulated on a system with a smaller page size used by the
MMU, which is the case for some PPC64 setups with hugetlb."

This will be invalidated if we change these, but surely you'd have to?

Also w.r.t. hugetlb how will PMD sharing work across processes with
different page size?

And what about drivers that allocate PAGE_SIZE memory to share with
userland? This does happen, or at the wrong granularity?

How can they be 'educated' to allocate the right amount of memory? I don't
see a way around one that actually.

Also what about bounce buffers for e.g. /proc/kcore?

And talking about proc, what about procfs interfaces that count per-page,
except they won't be counting per-page any more, they'll be counting
per-kernel page...?

What about bpf hooks that rely on page size? Surely we're potentially
breaking things there?

(Sorry just asking questions as they come up in my mind)

THP now surely has multiple different PMD sizes to contend with, but is
also being used to provide the mTHP-sized folios to the process?...

I mean unless you intend that these processes are just implementing page
table size via contpte only, and keep userland page size = kernel page size
except for this, but then the question again becomes 'what in mTHP is not
working such that you feel you need to do this'?

>
> File memory
> -----------
> For a growing list of compliant file systems, large folios can already be
> stored in the page cache. There is even a mechanism, introduced to support
> filesystems with block sizes larger than the system page size, to set a
> hard-minimum size for folios on a per-address-space basis. This mechanism
> will be reused and extended to service the per-process page size requirements.
>
> One key reason that the 64K kernel currently consumes considerably more memory
> than the 4K kernel is that Linux systems often have lots of small
> configuration files which each require a page in the page cache. But these
> small files are (likely) only used by certain processes. So, we prefer to
> continue to cache those using a 4K page.
> Therefore, if a process with a larger page size maps a file whose pagecache
> contains smaller folios, we drop them and re-read the range with a folio
> order at least that of the process order.

Yeah this is surely terrible? One process can cause evictions from the page
cache for others, then when they get scheduled they drop them again and
again over and over and over just because files are being accessed by
different processes no?

I don't think this is at all workable, unless I'm missing something?

This feels like you need a complete rework of the page cache to implement
this really, and I wonder at that being a realistic goal.

>
> 3. Translation from Linux pagetable to native pagetable
> -------------------------------------------------------
> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
> Now that enlightenment is done, it is guaranteed that every single mapping
> in the 4K pagetable (which we call the Linux pagetable) is of granularity
> at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
> mm_struct, which is based off a 64K geometry. Because of the guarantee

I mean yeah, this 'enlightenment' feels a lot more like - radically
altering a ton of mm code and never quite being sure it will all work :)

> aforementioned, any pagetable operation on the Linux pagetable
> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to happen
> at a granularity of at least 16 PTEs - therefore we can translate this
> operation to modify a single PTE entry in the native pagetable.
> Given that enlightenment may miss corner cases, we insert a warning in the
> architecture code - on being presented with an operation not translatable

Yeah this is already hugely concerning, introducing subtle ways to break
things.

> into a native operation, we fallback to the Linux pagetable, thus losing
> the benefits borne out of the pagetable geometry but keeping
> the emulation intact.

I really dislike the idea of maintaining an 'emulation' between userland
and the kernel on a fundamental basis. The kernel is supposed to deal with
the system 'as it is'.

Adding layers of abstraction just adds ever more possibilities of ever more
subtle and difficult-to-solve bugs.

>
> -----------------------
> What we want to discuss
> -----------------------

I think we also need to discuss whether this is generally viable or a good
idea :)

I suppose that is implicit.

>  - Are there other arches which could benefit from this?
>  - What level of compatibility we can achieve - is it even possible to
>    contain userspace within the emulated ABI?
>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>    example, what happens when a 64K process opens a procfs file of
>    a 4K process?
>  - native pgtable implementation - perhaps inspiration can be taken
>    from other arches with an involved pgtable logic (ppc, s390)?
>
> -------------
> Key Attendees
> -------------
>  - Ryan Roberts (co-presenter)
>  - mm folks (David Hildenbrand, Matthew Wilcox, Liam Howlett, Lorenzo Stoakes,
>              and many others)

Thanks :)

>  - arch folks

Overall this feels like a workaround for mTHP not doing what you want, and
to me that speaks to us needing to improve mTHP rather than add a ton of
complexity.

I fear we are only touching the tip of the iceberg of ways in which this
could break.

Regards, Lorenzo

