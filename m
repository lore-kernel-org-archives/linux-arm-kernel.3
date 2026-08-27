Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43086C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wdt982Ce9e2WW4tML2j2T0NI00NUsPFfLNhjKnr4OFo=; b=I/UgFCc5lb2XghHd8RSt//XAAh
	p6ko+vWSbF/RT3+WHBEMyxlIJg/Qxq3lPNixzBk7fwgj8BSSU5r4SVB4k/Jbbna9FoWzoOwIMKPgs
	YOWRiLnrdu6fu2fjHywiOazZEqo7vG/BerdfYR0madPEFqMGVEpXdft37XEOUgVdgeBB9OPXyrKym
	iHA+x1gGIYXPW7lZZ4+H9fUHdZ0gJmFly8j1SZzjEOUMcDMFSeC6kQuaV3TO4gyVYTV5ZE3wvLAtU
	kEd1Wok5Y4SPZkZZ1/DkfJ0P2QNeOLouFSUJ7rkgKY9AqosKt5t1bqbzKskXRkH6kPfWO8nkTFcf8
	LSmEgpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdqg-00000004SYD-0NLY;
	Thu, 27 Aug 2026 17:25:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdqf-00000004SXo-2M4D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:25:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 248CD40A7C;
	Thu, 27 Aug 2026 17:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83331F00A3A;
	Thu, 27 Aug 2026 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787851509;
	bh=Wdt982Ce9e2WW4tML2j2T0NI00NUsPFfLNhjKnr4OFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dPenraVinfjcty4s5td0FqGWCFsJkSJ65bWQuXhjRMdfS0uSF6F5PGp34m4B42Wkr
	 oCmTBl+hQaKD/H/roiP9jEYPS7YLapVB8wJXCRi9qF9eJ2iZ9cGkxsiMS6g4g/diDe
	 yf2iTSZGu+vzg00TiwKIPJdFLjRabj39FPx9Mc9vU6dpdpEdyoC3CONUMb6ONBvE2y
	 IebdRfZ9Gtlxt/+Qrsq9F01qvpU2OxB+gtLZQrP2T9QTKcvwDxMiSDp9A0cGrYRx3f
	 0H6OVSzOdivo7gzWsrdxkUFEY443EwHvyMdApVKgL/hA29VFpoo5ouKwuozWcuJQqC
	 Xd4du+WOIj5ug==
Date: Thu, 27 Aug 2026 18:25:01 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: artem.kuzin@huawei.com
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org, 
	vbabka@kernel.org, cl@gentwo.org, linux@armlinux.org.uk, will@kernel.org, 
	mark.rutland@arm.com, liam@infradead.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com, panov.nikita@huawei.com
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Message-ID: <apBqjq24aG_s2ZTM@gremlin>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
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

Hi,

On Fri, Aug 28, 2026 at 12:11:40AM +0800, Nikita Panov wrote:
> Current status:
>
> There were several prior submissions with some sort of replication
> for NUMA systems, including one from our side for the x86_64 platform.
> In the last couple years, several research articles related to solving
> locality issues on NUMA machines through replication emerged as well.
>
> [1]  - arm64 kernel text replication
> [2]  - x86 NUMA-aware kernel replication
> [3]  - x86 kernel text replication
> [4]  - NUMA replication of user data
> [5]  - Mitosis: Transparently Self-Replicating Page-Tables for Large-Memory Machines
> [6]  - WASP: Workload-Aware Self-Replicating Page-Tables for NUMA Servers
> [7]  - PaCaR: Improved Buffered I/O Locality on NUMA Systems with Page Cache Replication
> [8]  - Memory page replication for Linux on X86 processors

(What happened to 9-11? :P)

> [12] - Optimize this_cpu_*() ops for non-x86 (ARM64 for this series)
>
> As of today, none of it was merged into mainline.

I mean :) maybe take that as a hint? If a number of series trying to do X get
rejected by upstream, that is maybe suggestive of barking up the wrong tree?

> However, after thorough re-evaluation, we were not able to observe
> performance improvement for the x86 platform, so we have decided to stop this
> direction and switch on arm64.

I mean, why? You should provide details here, this is quite hand-wavey. You are
also proposing core mm changes for something that seems specific to unique
hardware as far as I can tell, which is a big ask.

<snip>

> Known problems:
>
> 1. Other combinations of base page size and va size (especially with 16K pages)
>    should be adapted and verified.

Umm, yeah this is basic stuff for upstreamability :)

> 2. Replicated translation tables for the vmalloc region are not local right now.
>    Allocation performed with default memory policy, so translation tables
>    for kernel modules will not be local. However,
>    replicated text and rodata of the modules are local.
>    In general, vmalloc patch should be cleaned up.

Again, this is really more of an alpha pre-RFC I'd say.

> 3. Any modifications of kernel PGD level. These modifications
>    should be synchronized across all replicated tables.
>    Right now, for example, memory hotplug/hotunplug
>    lacks this support, vmemmap and kasan regions for
>    added memory might not be observed correctly. This could be fixed
>    by patching all places in the kernel where swapper_pg_dir
>    is modified, or by "lazy" propagation on kernel faults in the pgd-level.
>    Propagation approach will not help in the case of pgd_clear()
>    on swapper_pg_dir though.

Yeah OK this suggests to me you've got the locking and synchronisation all wrong
and it's worrying :)

In general I really oppose anything that adds additional kernel page tables or
complicates kernel page table handling.

We already have singificant complexity and bugs/races emerging from people doing
odd things with kernel page tables on assumption that it's 'safe'.

You'll need very compelling evidence to justify anything that touches such
sensitive stuff.

The code is also fiddling with PGD assignment in a way that could interact badly
with how these PGDs are synchronised. These things are very subtle, and even if
it's limited to one arch the core mm code is not.

>
> Overall, this patch set in an early PoC stage and require some improvements.
>
> Overhead:
>
> Memory overhead for the kernel itself is about 30MB per NUMA node
>   on our deployment. For kernel modules - depends on their sizes, but text
>   and ro-data are not that big.
> CPU overhead - replication performed on the boot stage. After boot
>   only "rare" operations are slowed down -
>   module loading, text patching, kernel table pgd-level modifications.

Hmm. I wonder if they're as rare as you think though? It all depends also on how
slowed down they are, how that manifests, etc.

>
> Performance evaluation:
>
> Our local testing was performed on
> Kunpeng 920, 128 CPU, 4 nodes, 100Gb for each node.

Thanks for providing details of the hardware used!

>
> Microbenchmark:
> Kernel module with a huge text section (~50MB) filled with CPU-bound
> instructions. For each NUMA node thread is spawned, each thread in a loop
> executes isntructions. Total execution time of each thread is measured.
> The insmod call bound to node 0 through numactl (less time is better).

So wait, you bound it to node 0, then rely on kernel text replication to improve
performance due to a bad hint?

That seems like you could fix the issue by binding correctly? :)

>
> node                 0        1        2        3
> Before time, s     5.567    7.598   13.294   18.905
> After  time, s     5.469    6.960    6.777    5.531
>
> Diff               ~0%      -8.5%    -49%     -70%
> In this benchmark, interconnect was not used by any other actors,
> so microbenchmark numbers might be significantly improved.

This benchmark seems entirely synthetic and it seems odd to me, prima facie, to
implement a feature to correct for incorrect NUMA binding?

Maybe I'm missing something though.

>
> Customer's evaluation:
> We were provided with the following feedback on this patch set
> directly from our customers. Unfortunately, we do not have details
> regarding how these measurements were done other than it was
> a production setup.
> Evaulation was performed on Kunpeng 920 and 920B platforms:
> CEPH distributed storage +5%
> StarRocksDB              +5%

This isn't hugely encouraging.

>
> Couple more words about patch set and technology:
>
> This patchset was merged into the innovative branch of
> the openEuler distributive 1.5 year ago (openEuler-25.03)
> and was actively tested in production environment [9], [10].
> In addition, besides the kernel part, we have published
> user space replication (for translation tables and rodata) as well,
> but it is very complex and experimental
> even compared to this patch set [11]. With replication in user
> space, we were able to achieve the following numbers in
> performance improvement:
> MySQL + sysbench      1-6%
> Spark TPC-H           4-20%
> Phoronix test-suite   0-25%

These seem very vague and wide-ranged, I'm not sure they're really saying much
at all?

>
> Discussion:
>
> The main question we'd like to discuss is the following:
> Should the kernel replication feature be merged into the Linux
> somewhere in the future? In any form, not specifically this patch set,
> but the core concept itself.

I will leave the broader topic to the NUMA experts.

>
> If the answer is yes, please share your thoughts on this patch set. What else
> should be fixed (or reimplemented and redsigned completly) in this patch
> for mainline in your opinion? We'd be glad to do it, and in that case
> I'll send an updated version in the near future.

Glancing thorugh, The patch set seems very far from being upstreamable:

	if (kernel_replication_enabled)
		pr_info("WARNING! WARNING! WARNING! Kernel replication enabled WARNING! WARNING! WARNING!\n");

For instance... this really shouts some alpha effort.

Annnd :) this:

	if (rwsem_is_locked(&mm->mmap_lock))
		locked = true;
	else
		mmap_read_lock(mm);

is just utterly, utterly broken.

rwsem_is_locked() can be raced at any time, you don't own the lock so it can
just be unlocked underneath you.

That you do that suggests to me you've not thought about locks correctly _at
all_ here.

And as I said above, locking issues around page table walking and manipulation
is very subtle and difficult to manage correctly.

Then there's stuff like this:

		/* TODO: remove last condition and do something better
		 * In the case of a folded P4D level, pgd_none and pgd_huge
		 * always return 0, so we might start to replicate empty entries.
		 * We obviously want to avoid this, so the last check is performed here.
		 */
		if (pgd_none(*orig_pgd) || pgd_val(*orig_pgd) == 0)
			goto skip;

This whole block seems confused, and it's nitty but you're using completely
incorrect comment style for the linux kernel which again doesn't fill me with
confidence that you've really thought things through or understand mm code
correctly.

Your replicate_memory() function seems to not synchronise _at all_, but you do
for some reason synchronise on dumping memory, bizarely.

You write a ton of duplicative page table code that doesn't seem to handle huge
pages at all, again doesn't seem to be performing any locking correctly at all,
and yeah the list goes on.

In general the code looks like an alpha experimental thing and a million miles
away from anything even vaguely upstreamable.

And in general for this kind of thing - the devil is in the detail.

So if you want to assert that something is viable, you need code that at
least looks _vaguely_ upstreamable and demonstates understanding of the
issues at play here, and you are not doing so.

In conclusion:

- 12 (or is it 9? :) attempts have been made at this kind of thing and all
  were rejected - this isn't an encouraging sign that the approach is
  viable.

- You've already found it has limited use, and your benchmark numbers seem
  either entirely synthetic or bordeline not statistically significant.

- The code is, as discussed, not even vaguely close to being upstreamable.

So overall it seems to me that perhaps better NUMA policy decisions could
solve your problems.

But yeah, what's presented in this series doesn't seem like a worthwhile
road to travel down to me.

--
Cheers, Lorenzo

