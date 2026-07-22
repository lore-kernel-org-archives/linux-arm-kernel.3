Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD81C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3BAwkX4e0yTBdzLE/9XMWKMSFzQsojzSVvnX9l/QZo=; b=bvAUndeBK7B1sptRBBZZRw7gaq
	uE+uMoTlcoxycCIkyqLmobWso3bV189c4rwY+JkHJPUaPAnyz/Y7EXyMOQOF0bFIl5JyBT8lESmRy
	yV5bvIFPjBVcL+NNHXQ69TlJY1Mdd9r4tUF2EjT0xLnFZaR/c2SVWX65hNpYUQY584/sAEVOeNKBm
	PhEOZlmQVcmGCxhaFOa2SJEI9t1LbMOCAccnRDdX0gXFikRD/4iAV2gSgtCQ+pZhZUz9o4FnvtSjr
	VisAqEcFLT6t/dGNVhABHC4aKlHJQir0KHSPQ1nki/mcR0JN/Y+GrlB/9dazUj1b9lJy8VofvlJKv
	o3Yuor/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTNE-0000000BQwC-158T;
	Wed, 22 Jul 2026 09:36:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTNA-0000000BQvL-1HqH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:36:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B22441595;
	Wed, 22 Jul 2026 02:36:10 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60C193F86F;
	Wed, 22 Jul 2026 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784712974; bh=O7EJYDmByoTpsITBBymwn3nowadBexEAS2hMkYKxPgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+96pLlSDOM6+k2/MeXzTMznCRtWimKXzB4tZA92QDqgSOl1NjfUhJS9lG6GG2p5N
	 bi0O/7yZ1vIOSsokI2+i6rrzLGeAR0mlIrLwTZfXK87JhsURFk+oz8FzSyeN1Ge4FY
	 mHRsI05xgc+t/aDcEBztVuIkH8Y7lIyPqamtbWMk=
Date: Wed, 22 Jul 2026 10:36:06 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, cl@gentwo.org, dennis@kernel.org,
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
	will@kernel.org, david@kernel.org, akpm@linux-foundation.org,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <amCPBrdltFSE_fEf@J2N7QTR9R3>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_023616_426820_65DE05A2 
X-CRM114-Status: GOOD (  45.26  )
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

On Tue, Jul 21, 2026 at 04:20:50PM -0700, Yang Shi wrote:
> On 7/16/26 6:23 AM, Ryan Roberts wrote:
> > On 15/07/2026 19:04, Yang Shi wrote:
> > But I think that there are other issues with this concept that likely block it
> > from being accepted upstream; see below...

> > We have observed a few performance regressions recently, for which the root
> > cause is increased use of this_cpu_*. We have somebody at Arm about to start an
> > investigation into whether in-kernel rseq can solve the problem.
> 
> It is good to know someone is exploring the alternative path. But I doubt
> restart sequence can really boost the performance. It needs check whether
> preemption (or cpu migration) happens in the middle of percpu operations
> then manipulate the ip to restart the operation.

With the rseq approach, that check happens out-of-line in exception
handling code, *only* when preemption occurs, so in the fast path there
is *no code whatsoever* to check for preemption/migration, and no
branches to cause a restart.

Please note that with the approach I've prototyped, the exception
handling code doesn't even adjust the PC; we just adjust a GPR
containing the address. The forward progress guarantees (and behaviour
under contention) should be the same as a single instruction. The fixup
logic itself is trivial.

Please see my message where I outlined that approach in detail:

  https://lore.kernel.org/linux-arm-kernel/al_DpFJFcmVhxpvW@J2N7QTR9R3/

I expect that should come with a reasonable benefit, but I don't have
benchmark figures yet as I haven't finished converting the xchg and
cmpxchg implementations.

> It sounds like it just moved the cost from one place to the other
> place and it also seems hacky TBH.

The existing (high) cost is removed from the fast path. A new (low) cost
is added to the rare path where we perform an exception return into the
middle of a critical section.

I don't think this is any more hacky than percpu page tables. It's far
more contained to the relevant pieces of code (only the this_cpu_*() ops
and exception entry/return).

> It may reduce the preempt_disable/preempt_enable cost somehow for some
> less contended cases, but it may be worse for high contended cases.
> The percpu page table can work well for both.

It entirely removes the preempt_disable/preempt_enable cost.

I don't follow your concern with contention. Any contention on the
memory location is going to be independent of preemption, and if a
thread is preempted mid-operation, the impact is going to be the same
with either the adress fixup or percpu page tables -- I don't think you
avoid that.

> S390 implemented restart sequence. Heiko didn't share too much benchmark
> data, just confirmed there is no regression and I had a lengthy discussion
> with him
> (https://lore.kernel.org/lkml/20260520092243.264847-1-hca@linux.ibm.com/).

As above, for s390 Heiko didn't implement a restart sequence; he
implemented an address fixup sequence. There is no restart.

The discussion you had there seemed to focus on the s390 implementation
details (e.g. why he used an address fixup rather than a restart), and
the benefits of removing the preempt_count manipulation (which all the
approaches, including mine, do).

Am I missing some key detail?

> Improving this_cpu performance is just one of the usecase of percpu page
> table. The other potential usecase is kernel text replication I mentioned at
> LSFMM. The idea is not new, someone else has explored it, see https://lore.kernel.org/linux-arm-kernel/ZMKNYEkM7YnrDtOt@shell.armlinux.org.uk/.

That was looked at in the past, but people weren't keen given the
complexity it would lead to, which is why it never saw much traction.

> Percpu page table can make kernel support it more naturally.

Perhaps, but the only difference is that you've moving the support code
into the core kernel mm code. I think the general concerns people have
with percpu page tables still apply.

[...]

> > > Known Issues
> > > ============

> > > 3. Shared TLB machines
> > > ----------------------
> > > Some machines may share TLB between CPUs, for example, SMT machines may share
> > > TLB between the two hardware threads in one core.
> > > The per cpu page table just can't work with it. Maybe we need a new
> > > cpufeature to indicate whether per cpu page table is allowed or not. Then
> > > just enable it for not-shared-TLB machines.
> > The architectural feature you're referring to here is FEAT_TTCNP (common not
> > private). There are many CPUs out there that use this feature (not just those
> > that support SMT).
> > 
> > FEAT_TTCNP is mandatory from Armv8.2 and the presence of the feature only tells
> > you whether you can legally set the CnP bit - it doesn't actually tell you if
> > the HW does any sharing - there is no way to detect this. So making per-cpu
> > pgtables mutually exclusive with CNP is a non-starter as all CPUs from v8.2
> > onwards advertise CNP.
> > 
> > Even ignoring the CNP problem, you'll end up installing the per-cpu TLB entries
> > tagged with whatever user ASID happens to be installed at the time. Which means
> > you could end up with lots of duplicated TLB entries all differing only by ASID.
> > It's probably not the end of the world, but it seems... inefficient.
> 
> Really? I thought ASID will be ignored if nG == 0.

The nG bit only applies to leaf entries (Page or Block descriptors). All
intermediate entries (Table descriptors) are ASID tagged.

> > The only way I can see to make this work fully is to rely on FEAT_ASID2, which
> > allows specifying separate ASIDs for TTBR0 and TTBR1. Then each CPU can have
> > it's own (permanently installed) ASID for local mappings in TTBR1. That would
> > solve the CNP issue. FEAT_ASID2 is optional from v9.4 and mandatory from v9.5.
> 
> I agree it is safer to handle CNP problem by depending on FEAT_ASID2.

I think that depending on FEAT_ASID2 is a non-starter.

There is no extant hardware with FEAT_ASID2, and I don't think we want
to maintain distinct versions of hte percpu code accross architecture
versions.

Mark.

