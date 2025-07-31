Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644A0C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 17:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpKzVEWrznttY/lytAsOYrnf77U95szFwJAKgUAZLqQ=; b=BkMac6GZvVQg8o0sIq9fq8ASNl
	5wt4etZJb5N/+D67QGJYIcMFJrIZqgXAgijfqXUEyv1zHLuSWWPd+8aDiENBbQ78xdtClSIeEDLXS
	B2n6diOzVPeBgBBda7SHqlVF+IJeCPmpc9B9a4KV712yd5z9aflxkOf2cb6TrnhPqMa4hVPpFp2qr
	1gAqoTQpfJAtNLIChRGqp24o7bbSrUbf63eshoC8h6K9o88/jcTUvexLpzCM7p1B4biUq5vGEFOmO
	RWEcFxVSEy8tFCunf236s9l3cyiBOGXvVik2LlQI1pUakJ/+uHAXUNgSrMnc8DlFu2FjP52668p3t
	bRIGGEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWm5-00000004900-3XuZ;
	Thu, 31 Jul 2025 17:09:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWjW-000000048qx-2fBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 17:06:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5BDDD5C6301;
	Thu, 31 Jul 2025 17:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A24C4CEEF;
	Thu, 31 Jul 2025 17:06:16 +0000 (UTC)
Date: Thu, 31 Jul 2025 18:06:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dev Jain <dev.jain@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
	ryan.roberts@arm.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com, mark.rutland@arm.com, urezki@gmail.com
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aIuihRzw1xvZ-PaY@arm.com>
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aIpPsg1Kij8Knnjl@arm.com>
 <9169f4a1-1ad3-4ef0-8d16-eabebfa64cf0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9169f4a1-1ad3-4ef0-8d16-eabebfa64cf0@arm.com>
X-TUID: jV4/sQUEdPmd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_100622_757222_C7107625 
X-CRM114-Status: GOOD (  46.71  )
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

On Thu, Jul 31, 2025 at 12:42:21PM +0530, Dev Jain wrote:
> On 30/07/25 10:30 pm, Catalin Marinas wrote:
> > On Wed, Jul 23, 2025 at 09:48:27PM +0530, Dev Jain wrote:
> > > +	 * Case 2: The static branch is not visible to T2.
> > > +	 *
> > > +	 * Since static_branch_enable() (via dmb(ish)) and mmap_write_lock()
> > > +	 * have acquire semantics, it is guaranteed that the static branch
> > > +	 * will be visible to all CPUs before T1 can enter CS. The static
> > 
> > Does static_branch_disable() have release semantics? I think it does via
> > some atomic_cmpxchg() but it's worth spelling it out.
> 
> Yes it *should* have, but this proof is already getting complicated so I thought,
> let's not mention anything which is not required in the reasoning of the proof :)

The static branch observability relative to the mmap_lock is essential,
both when enabling and disabling the static key (i.e. you don't want the
static branch to be seen disabled while T1 is in the critical section).
That's why it's worth mentioning.

On the static_branch_enable() path, we have a kick_all_cpus_sync(), so
the T1 update of mmap lock will become visible after the branch update
(of course, also subject to correct ordering on T2, see more at the end
of the email).

On the static_branch_disable() path, we need it to have release
semantics _prior_ to disabling the key. We get this via the
atomic_cmpxchg() in static_key_disable_cpuslocked().

So I think it's all good here from the T1 perspective, just capture this
in a comment so that we remember in a couple of months time.

> > As I mentioned on a previous version, this visibility is not absolute.
> > You could say that it will be observed by other CPUs before they observe
> > the write_lock.
> 
> Hmm. I probably am bad at explaining all of this in English :)

It's the other way around - I don't think English is appropriate for
explaining this ;).

> > > +	 * branch not being visible to T2 therefore guarantees that T1 has
> > > +	 * not yet entered CS .... (i)
> > > +	 * The sequence of barriers via __flush_tlb_kernel_pgtable() in T2
> > > +	 * implies that if the invisibility of the static branch has been
> > > +	 * observed by T2 (i.e static_branch_unlikely() is observed as false),
> > > +	 * then all CPUs will have observed an empty PUD ... (ii)
> > > +	 * Combining (i) and (ii), we conclude that T1 observes an empty PUD
> > > +	 * before entering CS => it is impossible for the CS to get hold of
> > > +	 * the address of the isolated PMD table. Q.E.D
> > 
> > OK, I nearly got lost. That's not a straightforward memory ordering with
> > as we have instruction updates with ISB as part of the TLB flushing. I
> > concluded last time I looked that this branch patching part works
> > because we also have kick_all_cpus_sync() as part of the static branch
> > update.
> > 
> > Stepping back to a simpler model, let's say that the static key is a
> > variable. I wrote this quick test for herd7 and the Linux kernel memory
> > model (fairly easy to play with):
> > 
> > -------------------------------------8<---------------------------------------
> > C pte_free_ptdump
> > 
> > (*
> >   * $ cd tools/memory-model
> >   * $ herd7 -conf linux-kernel.cfg path/to/pte_free_ptdump.litmus
> >   *)
> > 
> > {
> > 	pmd = 1;				(* allocated pmd *)
> > 	pte_page = 1;				(* valid pte page pointed at by the pmd *)
> > }
> > 
> > // pmd_free_pte_page()
> > P0(spinlock_t *init_mm, int *ptdump_lock_key, int *pmd, int *pte_page)
> > {
> > 	WRITE_ONCE(*pmd, 0);			// pmd_clear()
> > 	smp_mb();
> > 	if (READ_ONCE(*ptdump_lock_key)) {	// static_branch() approximation
> > 		spin_lock(init_mm);		// mmap_read_lock()
> > 		spin_unlock(init_mm);		// mmap_read_unlock()
> > 	}
> > 	smp_mb();
> > 	WRITE_ONCE(*pte_page, 0);		// pte_free_kernel()
> > }
> > 
> > // ptdump_walk_pgd()
> > P1(spinlock_t *init_mm, int *ptdump_lock_key, int *pmd, int *pte_page)
> > {
> > 	int val;
> > 	int page;
> > 
> > 	WRITE_ONCE(*ptdump_lock_key, 1);	// static_branch_enable()
> > 	smp_mb();
> > 	spin_lock(init_mm);			// mmap_write_lock()
> > 	val = READ_ONCE(*pmd);
> > 	page = READ_ONCE(*pte_page);		// freed pte page?
> > 	spin_unlock(init_mm);			// mmap_write_unlock()
> > 	smp_mb();
> > 	WRITE_ONCE(*ptdump_lock_key, 0);	// static_branch_disable()
> > }
> > 
> > exists(1:val=1 /\ 1:page=0)
> > -------------------------------------8<---------------------------------------
> > 
> > I sprinkled some necessary smp_mb() but in most cases we have
> > release/acquire semantics. It does show that we need a barrier before
> > the page freeing. We also need to acquire for enabling the static key
> > and release for disabling it.

The smp_mb() before the write to *pte_page in the model above is only
needed on the static key disabled path. As Ryan pointed out, on the
other path we take the mmap_lock and we have acquire semantics.

> > Next step is to assess that replacing the static key variable read/write
> > with code patching preserves the model.
> 
> Thanks for the litmus test!
> I ran it and I get the same result. But I still cannot figure out where is the hole
> in my proof.

TBH, I couldn't fully follow the proof. The arm memory model is based on
relations between accesses (e.g. read-from, coherence order) rather than
timestamps. They may be equivalent but that's a whole new (and complex)
proof to write.

So I'm happy with a simple English explanation and a formal model along
the lines of the one I posted as the equivalent of a proof.

> I think you raise an objection to Case 2:

Let's follow your approach, you are missing some timestamps, adding them
below:

> T1:						T2:
> 
> WRITE_ONCE(*pmd, 0) : t1			WRITE_ONCE(*ptdump_lock_key, 1) : t3
> smp_mb() // flush_tlb_kernel_pgtable		cmpxchg(acquire write lock)
						^^^ : t3'
> 						smp_mb()
> READ_ONCE(*ptdump_lock_key) = 0 : t2		val = READ_ONCE(*pmd) : t4
> WRITE_ONCE(*pte_page, 0)			page = READ_ONCE(*pte_page)
  ^^^ : t2'					^^^ : t4'
> 						smp_mb()
> 						cmpxchg(release write lock)
						^^^ : t5
						smp_mb()
						WRITE_ONCE(*ptdump_lock_key, 0): t6

> Let t_i be the global timestamps of the execution of the labelled instructions
> (note that each labelled instruction is atomic so assigning a timestamp makes sense).
> 
> The fact that we read ptdump_lock_key as 0 implies that
> t2 < t3 ... (i)

Or that t2 > t6, a plausible scenario in the litmus test above.

> Now,
> t1 < t2 because of barrier (ii)
> t3 < t4 because of barrier (iii)
> 
> So we conclude that t1 < t4, so val will be observed as 0.

Without a barrier between t2 and t2', there's no guarantee that t2' >
t2. If you remove the last smp_mb() on P0 in my litmus test, you'll see
it failing (run herd7 with something like "-view evince -show prop" for
a visualisation of the transitions and relations; you need graphviz
installed as well).

The way it fails is that t4 is seeing the pmd=1 prior to t1, t2 is
reading from the t6 write and t4' is reading pte_page=0 from t2' (since
t2' < t2 is possible without a barrier).

A control dependency would work as well without a barrier, i.e.:

	if (READ_ONCE(*ptdump_lock_key)) {
		mmap_lock();
		mmap_unlock();
		WRITE_ONCE(*pte_page, 0);
	} else {
		WRITE_ONCE(*pte_page, 0);
	}

but the compiler is probably free to only issue a single WRITE_ONCE()
irrespective of the ptdump_lock_key check.

Of course, using smp_load_acquire(ptdump_lock_key) would also work.

However, things get fuzzier as we don't have a classic load from the
ptdump_lock_key but rather a patched instruction. We need to guarantee
that t2' is issued after the t2 branch when the instruction is patched.
The kick_all_cpus_sync() on the static key disable path doesn't help us
since P0 (T2 in your description) may see the patched branch/nop and go
straight to the WRITE_ONCE(*pte_page). Not sure what barrier helps here
(after more sleep, I may have a better idea tomorrow).

-- 
Catalin

