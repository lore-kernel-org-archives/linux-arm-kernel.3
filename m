Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A80FC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9czfARorSYkXhn7wtuTfT0BpH91+/rvPllJAwe14Ukg=; b=ojl6opZupRGuDram8TonXBeOx7
	7aRHqEnGCww6XJJpelAz2sTrkQI7XsaINxPwfIZqBIzw+Oe2aZXRZX68rn3k1MRaHShhA2e6wPDGY
	M76dtQUwGXu46B9fqJauKgSMrq2gsrvNgYwIUoa+tZCJlZMldCDi/E3p4broKwiXkjPDAp4fDoMg9
	pveIaiRftlIWlMP/E3XOZXVPwlw6FnENvLCTL5MpIYzf5hWNg+LGxrzR/lcZaGHwQc+achsBQRPzO
	ZLNFoVz/5LrjU0V2Hw/B0JH3JbiBdnYn9nWOVqGSKDXjTVDXx7JnvBLd1N9O1W9vgVS9Vs9tM3bkH
	3ZELEnHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jCk-00000003BSf-3z8y;
	Mon, 21 Sep 2026 18:57:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jCj-00000003BS8-0zAz;
	Mon, 21 Sep 2026 18:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9czfARorSYkXhn7wtuTfT0BpH91+/rvPllJAwe14Ukg=; b=i07QEUr7FLrPNOasfEwFBQXlUm
	R1FAx/bprujw+QWlcEP1wKK2utSRNCm6Mg8mI1/NCcBmOt+MIfycEGWY2mOLy3WjtOt9bAO6jeil5
	ddfvZ4bYMZ+vykKvCJVEkNA1Ashmbg/kQxveGBb1l8ejcILd77zkYO70Lk1IsIo8OOvu+SR1lNSgi
	wSm3i7/AVKsyc8U9vsa8i10CgDa/W+91OL6ReG9VjqtconeMcEWRBUIos9N2Iug5cAu6uPQrciUZC
	P0JHDC3c+7azzmazJKmBqnrj9lYDDuScU6QAYzE/ubDDgwDXKcd1B6TvhcvGIi+8Jthe8rrPfPtFQ
	unARWs7g==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jCd-000000054KL-1SFt;
	Mon, 21 Sep 2026 18:57:23 +0000
Date: Mon, 21 Sep 2026 19:57:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, baohua@kernel.org,
	surenb@google.com, david@kernel.org, liam@infradead.org,
	mhocko@suse.com, rppt@kernel.org, shakeel.butt@linux.dev,
	vbabka@kernel.org, zhaonanzhe@xiaomi.com, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, chenhuacai@kernel.org,
	kernel@xen0n.name, loongarch@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	linux-s390@vger.kernel.org, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	Hongru Zhang <zhanghongru@xiaomi.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
Message-ID: <arF-E3Nsw9ZliH0t@casper.infradead.org>
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFYRAa-i7CIwmHL@gremlin>
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

On Mon, Sep 21, 2026 at 06:54:25PM +0100, Lorenzo Stoakes (ARM) wrote:
> OK I finally got to this...

Brave ;-)

> I fear we're going to go round in circles on this/have endless revisions of
> the same thing.
> 
> So 2 things the patch needs to answer, more or less right away:
> 
> 1. What are you actually optimising for?
> 
> 2. Where does the hurt happen?
> 
> Your patch does neither, then goes on to arm wave away all the complexity
> and presents a 'simple' solution that I feel brushes a lot under the rug.
> 
> Answer to 1 is 'cold app startup time for a specific set of apps'
> 2 is filemap_fault() AFAICT.
> 
> You should definitely be stating this upfront.
> 
> And I also seem to remember that zygote + multi-threaded apps = fork
> blocking is part of the problem here, which is why there was push-back on
> just holding the VMA lock over I/O.
> 
> Looking through filemap_fault() makes me want to cry and looking through
> the other retry logic in the fault code makes me want to live on an island
> with parakeets and coconuts forgetting any of this even exists...

I think that's the right response.  It's why all the feedback from people
who haven't even tried to follow the fault path (eg the session at LSFMM)
is completely useless.  The fault path is WAY TOO COMPLEX.  I'll have
more to say on this in two weeks at Plumbers.

> VM_FAULT_RETRY can mean a million different things:
> 
> 1. I dropped the lock and waited for the folio to be unlocked.
> 
> do_swap_page(), remove_device_exclusive_entry() -> folio_lock_or_retry()
> 
> 2. I dropped the lock to start I/O it may or may not be ready when you come
>    back.
> 
> filemap_fault() after do_sync_mmap_readahead() or page not uptodate
> synchronous read with lock dropped <- what you are optimising for, or
> shmem_falloc_wait() waiting for a hole punch.
> 
> The maybe_unlock_mmap_for_io() stuff.

I think these two are the same case?  At least by my reading, case 2
also waits for the folio to be unlocked (ie the read completed).
do_sync_mmap_readahead() doesn't do that, but we then call
__filemap_get_folio() which shuld return the appropriate folio,
then we call __folio_lock_killable() or __folio_lock().

> 3. I dropped the lock and nothing was waited for, OOM me on retry!
> 
> filemap_fault() allocation failure, gotta retry because we dropped the
> lock!

Oh, yeah, that's icky.  Hadn't even crawled onto my list of problems
with this function.

> 4. I can't do this under the VMA lock, use an mmap lock
> 
> vmf_can_call_fault(), any vm_ops without ->map_pages, __vmf_anon_prepare()
> when mmap_read_trylock() lost, also hugetlb_fault() horror shows.
> 
> Also device-private swap entries.

This one really is my fault / Suren's fault / your fault ;-)

We should not have overloaded VM_FAULT_RETRY for this case.  We should
have had a distinct VM_FAULT_NEEDS_MMAP_LOCK code.  But I am *scared*
to try to separate the two at this point.  It was hard to make sure we
got all the cases as we pushed it down, and now it's going to be worse.

But I don't think that hugetlb_fault() deserves any stick here:
         * We must check to release the per-VMA lock. __vmf_anon_prepare() in
         * hugetlb_wp() is the only way ret can be set to VM_FAULT_RETRY.
is the comment on the only two mentions of VM_FAULT_RETRY in hugetlb.

I do have a plan to get rid of those two mentions actually ...
but let's talk about in in Prague.

> 5. Userfaultfd! Because of course!
> 
> Userspace has to do something.
> 
> handle_userfault() after sleeping for uffd handler, retry should succeed.
> 
> ctx->released -> yield to releasing thread.

I find it really hard to reason about uffd.

> 6. Fatal signal
> 
> Arch handlers rely on this, so retry also means 'check signals'. Fun.
> 
> 7. Some driver insanity
> 
> It means all things to all people. Used for waiting on stuff like
> 
> LLM says:
> 
> - TTM at drivers/gpu/drm/ttm/ttm_bo_vm.c:62 and 144, dma_resv contention
>   and GPU idle wait. Consumers in amdgpu, i915, nouveau, radeon and vmwgfx
>   re-derive "was the reservation unlocked" from ret == VM_FAULT_RETRY &&
>   !NOWAIT.
> 
> - xe_bo_cpu_fault_fastpath() at drivers/gpu/drm/xe/xe_bo.c:2021, where
>   RETRY is the default return value, including for "runtime PM not active".
> 
> - panthor at drivers/gpu/drm/panthor/panthor_gem.c:831 onwards, where
>   dma_resv_trylock() failure is RETRY and the same error is NOPAGE, SIGBUS
>   or RETRY depending on mmap_lock_held.
> 
> - sgx_vepc_fault() at arch/x86/kernel/cpu/sgx/virt.c:91, EBUSY from
>   __sgx_vepc_fault().  All of these call mmap_read_unlock() directly rather
>   than release_fault_lock(). They are only safe because none has
>   ->map_pages, so vmf_can_call_fault() bounces them before ->fault
>   runs. The VMA-lock design rests on that proxy.
> 
> So yeah. All that. Wow.
> 
> 8. Nothing!
> 
> LLM says:
> 
>   - page_mkwrite() returns in fs/exfat/file.c:951 (inode_trylock lost),

That's just wrong.  It turns the pagefault path into a spin on
the inode lock!

>     fs/nfs/file.c:699, fs/netfs/buffered_write.c:576 and
>     fs/orangefs/inode.c:635 onwards, including the combination
>     VM_FAULT_LOCKED | VM_FAULT_RETRY.

I think your AI is confused.  I don't see how nfs_vm_page_mkwrite()
can return VM_FAULT_LOCKED | VM_FAULT_RETRY.  Nor netfs.  Orangefs
is wrong and needs to be fixed ... once I figure out what it actually
wants.

>     do_page_mkwrite() at mm/memory.c only
>     passes through ERROR and NOPAGE, and do_shared_fault() and
>     wp_page_shared() then ignore the returned value entirely. The write
>     fault completes as if page_mkwrite had succeeded.

That's probably OK.  I think?

> And maybe I'm missing some stuff too.

There's also the VM_FAULT_COMPLETED insanity ...

> But I worry a LOT more that it's just a HACK (and I know Barry was nice
> about the idea and I appreciate it but I have to be honest).
> 
> Instead of dealing with any of the above, we just leave the mess in place +
> just retry the operation under VMA because we happen to know, for this ONE
> workload, it works out better.
> 
> And PROBABLY it doesn't add too much overhead to anything else.
> 
> SO.
> 
> I've written too much again, let's sum it up.
> 
> 1. WE HAVE TO DECIDE whether we want to accept the hack because it
>    helps in a known case and probably doesn't harm any other cases.
> 
> 2. WE HAVE TO FIX THIS DAMN MESS. Even if we take something like this WE
>    HAVE TO FIX IT.
> 
> I'm inclined to rip out the whole retry thing altogether one way or another
> but I leave that to Matthew to figure out :)

I think there's a bathtub with a baby in it over there ...

There's considerable scope for simplification here.
lock_folio_maybe_drop_mmap() makes my eyeballs bleed every time I look
at it.  But we do need smoe kind of restart-the-fault mechanism.

> If we decide we DO want the hack, then DEAR LORD can we not have this
> horrible duplication across arches? I seem to remember you agreed to take
> that out ([0]), and maybe it's pending what Matthew wants to do, but is
> there not a way to avoid that?

We desperately need to move more of the fault handling path out of the
architectures.

> I REALLY want to hear from Matthew on all this, I don't think we can move
> ahead without his clear feedback.

Thanks for dragging me back into this ;-)

