Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95019C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 00:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFUVXzwlU9/Ndl4WZUiDxPXF594aEmGbVfz+CvRfdkw=; b=ecpKvCxz6ING3VXR3Pv3XMzn3t
	dTvGc0eYTujCHubJxyPdLUihLfW1B31+vpIRAOEk6smHYpEZ/QkoXjdPF67rNj95H2F2mmQWneolD
	eb9Z3O2Fr6hyKthB/fN/k/UmzaNvCU3mpNG0l9pM2sQ3t9hexuMcsHIogSOn3u1wMtO64SF3eG5Zr
	ijMykw/CIofoiWq/ryNCfjst4YH3o6y7Sh3ErZCQ7jzpJKMSSK84ZWI1YwbOM/gmFtGzlzZTbmRI6
	L7yYctKO8L1+mDQzJaREMZpdqglIi3QupfvRwuqO/3urLZuzxioYCr01tU7aKw3xRI3OP72P7VApm
	h6PyeFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYa0d-000000012hr-37JR;
	Mon, 07 Jul 2025 00:47:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYZyJ-000000012SW-0135
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 00:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B40FB5C5530;
	Mon,  7 Jul 2025 00:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E1DC4CEED;
	Mon,  7 Jul 2025 00:44:25 +0000 (UTC)
Date: Sun, 6 Jul 2025 19:44:23 -0500
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aGsYZ7W0yunbeqQV@arm.com>
References: <20250626052524.332-1-dev.jain@arm.com>
 <aGe5XjWKhgjzcw7L@arm.com>
 <bc201f93-7743-4d9d-a62e-3c8ea22e2cfd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc201f93-7743-4d9d-a62e-3c8ea22e2cfd@arm.com>
X-TUID: Ld5c6jqIQp3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_174439_127960_6FB1314B 
X-CRM114-Status: GOOD (  41.01  )
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

On Fri, Jul 04, 2025 at 05:12:13PM +0530, Dev Jain wrote:
> On 04/07/25 4:52 pm, Catalin Marinas wrote:
> > On Thu, Jun 26, 2025 at 10:55:24AM +0530, Dev Jain wrote:
> > > @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> > >   	}
> > >   	table = pmd_offset(pudp, addr);
> > > +	/*
> > > +	 * Isolate the PMD table; in case of race with ptdump, this helps
> > > +	 * us to avoid taking the lock in __pmd_free_pte_page().
> > > +	 *
> > > +	 * Static key logic:
> > > +	 *
> > > +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> > > +	 * execute the if block, then this patches in the read lock, ptdump has
> > > +	 * the write lock patched in, therefore ptdump will never read from
> > > +	 * a potentially freed PMD table.
> > > +	 *
> > > +	 * Case 2: If the if block starts executing before ptdump's
> > > +	 * static_branch_enable(), then no locking synchronization
> > > +	 * will be done. However, pud_clear() + the dsb() in
> > > +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
[...]
> > I don't get case 2. You want to ensure pud_clear() is observed by the
> > ptdump code before the pmd_free(). The DSB in the TLB flushing code
> > ensures some ordering between the pud_clear() and presumably something
> > that the ptdump code can observe as well. Would that be the mmap
> > semaphore? However, the read_lock would only be attempted if this code
> > is seeing the static branch update, which is not guaranteed. I don't
> > think it even matters since the lock may be released anyway before the
> > write_lock in ptdump.
> > 
> > For example, you do a pud_clear() above, skip the whole static branch.
> > The ptdump comes along on another CPU but does not observe the
> > pud_clear() since there's no synchronisation. It goes ahead and
> > dereferences it while this CPU does a pmd_free().
> 
> The objective is: ptdump must not dereference a freed pagetable.
> So for your example, if the static branch is not observed by
> pud_free_pmd_page, this means that ptdump will take the write lock
> after the execution of flush_tlb_kernel_pagetable completes (for if ptdump takes
> the write lock before execution of flush_tlb_kernel_pagetable completes, we have
> executed static_branch_enable(), contradiction).

I don't see why the write lock matters since pud_free_pmd_page() doesn't
take the read lock in the second scenario. What we need is acquire
semantics after the static branch update on the ptdump path but we get
it before we even attempt the write lock.

For simplicity, ignoring the observability of instruction writes and
considering the static branch a variable, if pud_free_pmd_page() did not
observe the static branch update, is the ptdump guaranteed to see the
cleared pud subsequently?

With initial state pud=1 (non-zero), stb=0 (static branch):

P0 (pud_free_pmd_page)		P1 (ptdump)

    W_pud=0			   W_stb=1
    DSB				   barrier/acq
    R_stb=0			   R_pud=?

The write to the static branch on P1 will be ordered after the read of
the branch on P0, so the pud will be seen as 0. It's not even worth
mentioning the semaphore here as the static branch update has enough
barriers for cache flushing and kick_all_cpus_sync().


The other scenario is P0 (pud_free_pmd_page) observing the write to the
static branch (that's case 1 in your comment). This doesn't say anything
about whether P1 (ptdump) sees a clear or valid pud. What we do know is
that P0 will try to acquire (and release) the lock. If P1 already
acquired the write lock, P0 will wait and the state of the pud is
irrelevant (no freeing). Similarly if P1 already completed by the time
P0 takes the lock.

If P0 takes the lock first, the lock release guarantees that the
pud_clear() is seen by the ptdump code _after_ it acquired the lock.


W.r.t. the visibility of the branch update vs pud access, the
combinations of DSB+ISB (part of the TLB flushing) on P0 and cache
maintenance to PoU together with kick_all_cpus_sync() on P1 should
suffice.

I think the logic works (though I'm heavily jetlagged and writing from a
plane) but the comments need to be improved. As described above, case 1
has two sub-cases depending on when P0 runs in relation to the write
lock (before or during/after). And the write lock doesn't matter for
case 2.

> > And I can't get my head around memory ordering, it doesn't look sound.
> > static_branch_enable() I don't think has acquire semantics, at least not
> > in relation to the actual branch update. The static_branch_unlikely()
> > test, again, not sure what guarantees it has (I don't think it has any
> > in relation to memory loads). Maybe you have worked it all out and is
> > fine but it needs a better explanation and ideally some simple formal
> > model. Show it's correct with a global variable first and then we can
> > optimise with static branches.
> 
> What do you suggest? As in what do you mean by showing its correct with
> a global variable first...and, for the formal model thingy, do you
> want mathematical rigor similar to what you explain in [1] :P, because unfortunately
> (and quite embarrassingly) I didn't have formal methods in college : )

Neither did I ;) (mostly analogue electronics). I was thinking something
like our cat/herd tools where you can write some simple assembly. It's a
good investment if you want to give it a try.

-- 
Catalin

