Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9ACCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 05:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Btgtg1poIkNnvGPTui9h2tnatScqNgw6uszc+qHkl6k=; b=FE6WTbGIZkweFHPUB98T7BYeWU
	FCo5GI9/C9YqI4qFSEocli6M7RnlmmR8uSFGfYMCltfO6cnrj0nEfGI9jO9aWU4UlYiBckjqN/KCy
	abb7rjdAUOWVAUwrCpbBnLuKqMwoSJWSdVCyHFIs3/76ijnDIrcP1bRmZgNO6iwPY6gSrqJh0UqjH
	OL7V5CpAzg/llIoKPEKX2pY659Ro+Vp8FtxJCuk7/T6iBYGIhtki6k1VJOU9LPQDyvADiM09k3jJq
	id13+2PXDi69pmtaKEkojbZFO5jjNWNq7S5ZOdbjz/DfR3o7u4OvUNsCLJe/dhWF2nyu66j3i0yyo
	f5ojw+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLz6-0000000FELU-0lW8;
	Tue, 16 Jun 2026 05:05:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLz3-0000000FEKn-3oWl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 05:05:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23EFA3D4B;
	Mon, 15 Jun 2026 22:05:03 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187113F763;
	Mon, 15 Jun 2026 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781586307; bh=D/9HJFpUNMpcCkN9FqIfh+9VPZAZqrqcS/9NB3Rxa5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjX6cxxIZFSQEfj7cqCLztKDM4yqaSGDhtX7m0aoXHydV3IEUranR2l0vIZk0Hx46
	 o/W36pQ2owpZNdez0wHy5qn88mBSzW5BPHMdc1v7fxEhUCevg+WBxSXKsyjNhIl3LN
	 DvrAVMBCfb/ujhKRK3MJVfOcpRqmCWuJVgVn4kqQ=
Date: Tue, 16 Jun 2026 10:35:04 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajDZgPAYlecHFEdl@a079125.arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
 <ajAPnahwTe1OHQDp@willie-the-truck>
 <4aa78619-5a79-4fd0-aaac-a990b8c3fd05@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aa78619-5a79-4fd0-aaac-a990b8c3fd05@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_220510_092472_91D2D353 
X-CRM114-Status: GOOD (  45.37  )
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

On Mon, Jun 15, 2026 at 04:41:04PM +0100, Ryan Roberts wrote:
> On 15/06/2026 15:43, Will Deacon wrote:
> > On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
> >> On 14/06/2026 12:04, Will Deacon wrote:
> >>> On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> >>>> From: Ryan Roberts <ryan.roberts@arm.com>
> >>>>
> >>>> Testing with 7.1-rc4 :
> >>>> +-----------------------+---------------------------------------------------+-------------+
> >>>> | Benchmark             | Result Class                                      |  Improvement|  
> >>>> +=======================+===================================================+=============+
> >>>> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> >>>> +-----------------------+---------------------------------------------------+-------------+
> >>>> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> >>>> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> >>>> +-----------------------+---------------------------------------------------+-------------+
> >>>
> >>> I think we need a much more comprehensive set of benchmarks before we can
> >>> begin to consider a change like this.
> >>
> >> I believe that Linu ran a wider set of benchmarks and didn't find any
> >> regressions. These are just the ones that show improvement (Linu, please correct
> >> me and/or provide details).
> > 
> > I think it's important to show the ones that suffer as well... and also
> > look at different configurations (e.g. preemptible settings) and different
> > environments (e.g. native vs in a VM).
> > 
> >> Additionally Huang Ying did some testing against the RFC and reported 4.5%
> >> improvement with Redis:
> >>
> >> https://lore.kernel.org/linux-arm-kernel/87segumv6w.fsf@DESKTOP-5N7EMDA 
> > 
> > To be clear: I'm not disputing that some benchmarks appear to show a small
> > boost from this series. I'm just worried that's not the whole story.
> > 
> >>>>  arch/arm64/include/asm/mmu.h         |  12 +++
> >>>>  arch/arm64/include/asm/mmu_context.h |   2 +
> >>>>  arch/arm64/include/asm/tlbflush.h    | 127 +++++++++++++++++++++------
> >>>>  arch/arm64/mm/context.c              |  30 ++++++-
> >>>>  4 files changed, 141 insertions(+), 30 deletions(-)
> >>>
> >>> Doesn't this break BTM/SVM with the SMMU? I think that's a non-starter
> >>> even if you can provide some more compelling numbers.
> >>
> >> AIUI, we don't support BTM upstream - the SMMU uses private ASIDs and implements
> >> MMU notifiers to forward the TLBIs via its command queue interface.
> >>
> >> I was also under the impression that supporting BTM upsteam was not desired;
> >> Please correct me if that's not accurate or if you're aware of plans to add
> >> support. I've been (coincidentlly) looking at some other stuff that could
> >> benefit from BTM but had concluded it wouldn't be an acceptable approach upstream.
> >>
> >> If we did ever want to add SMMU BTM support though, I think it would be simple
> >> enough to add an interface to allow the SMMU to disable the optimization (i.e.
> >> force active_cpu to ACTIVE_CPU_MULTIPLE)?
> > 
> > We used to have some initial BTM support in the SMMUv3 driver but the
> > main problem was finding an upstream driver/soc that can use it properly
> > and so it was ultimately removed in d38c28dbefee ("iommu/arm-smmu-v3: Put
> > the SVA mmu notifier in the smmu_domain") because it was getting in the
> > way of wider driver rework and we couldn't test it.
> > 
> > However, there *is* work to re-enable it on top of that rework (and other
> > changes):
> > 
> >   https://lore.kernel.org/linux-iommu/20250319173202.78988-6-shameerali.kolothum.thodi@huawei.com/
> > 
> > although I don't know if Shameer intends to repost that...
> 
> Thanks for the pointers; That's very interesting feedback. I'll take a closer
> look :)
> 
> > 
> >>>> +static inline bool flush_tlb_user_pre(struct mm_struct *mm, tlbf_t flags)
> >>>> +{
> >>>> +	unsigned int self, active;
> >>>> +	bool local;
> >>>> +
> >>>> +	migrate_disable();
> >>>> +
> >>>> +	if (flags & TLBF_NOBROADCAST) {
> >>>> +		dsb(nshst);
> >>>> +		return true;
> >>>> +	}
> >>>
> >>> Why does the NOBROADCAST case need migration disabled? It didn't before...
> >>
> >> The existing semantic for TLBF_BOBROADCAST is that it emits a local TLBI on
> >> whatever CPU we happen to be executing on. It's used for lazily fixing up
> >> spurious faults (i.e. hitting RO TLB entries when the PTE has been relaxed to
> >> RW). So it's still functionally correct if the thread migrates CPU between
> >> taking the fault and issuing the local TLBI - in the worst case it just leads to
> >> another spurious fault.
> >>
> >> For this new case, we need to ensure we don't get migrated between reading
> >> active_cpu and issuing the local TLBI, otherwise we would only issue a local
> >> TLBI when a broadcast was required.
> > 
> > Sounds like those two users probably need separating out, then?
> 
> Ahh, I see; I'll admit I hadn't actually reviewed the new integration part. I
> agree - NOBROADCAST is different to to this. This is an optimization for the
> "not NOBROADCAST" case. We need to avoid disabling migration in the NOBROADCAST
> case.
> 

Ack. 


