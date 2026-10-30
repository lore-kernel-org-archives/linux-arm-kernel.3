Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CC9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wTCOACif;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWKXDREp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5CuUDHSZWz+erT0w+UfPQPNxS4F/uosSHNPefWZBdyg=; b=wTCOACifDEGf6LK7y5eXIjpf5i
	z8VzM4D6KrwG+s3hr6HTo0mqS0N5Otqx3YXziMoHADRU9y7/qDd+Usw4bDqEKuOoFYL3UBFo48Fm0
	FAr8PYmEIrhHFPtGsaF6497+SVwavC6eTjJ54ZtLYKjpEu64dEf9yRoB5qlvKej0Ex5omoXBDTeXX
	+62WvfpMeuVeZNGz6TiinmTYDmGlQ2sPcJa97RnT3MHTIpt5NuLn0Pib5pkj7fiDpSOcE19p8Z5X1
	Qv85hk6kgllNFGb7Eyr3WYV09ID6HrY3k3zyNFYC5Lef+KXDjplMBEweEU6V1JWvsFyJ3kskY79Gf
	wQDbTu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkf9-0000000BXVG-46P9;
	Fri, 30 Oct 2026 11:20:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkf8-0000000BXUi-0ylX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 11:20:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0357F42A36;
	Fri, 30 Oct 2026 11:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BC01F00A02;
	Fri, 30 Oct 2026 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793359245;
	bh=5CuUDHSZWz+erT0w+UfPQPNxS4F/uosSHNPefWZBdyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWKXDREpHohFhFm/tgSgP271KsCBtGJ+juwgbl/qrlz1PNqk7lv3ChHCD8OrNiS5Y
	 DAnK6FDSSRb4ka31uJ7B3X6BB3YE3oBzbdMtVg79oZwdzcnI7puSmEWHj8molXBHWR
	 aPxAK4nlU6erZtS0QyO2mZ/2UeYPTdNpgAu4Mw1pojP7XtEl+UVJLAavpiM1M+WP8d
	 TmB7aOFiUVDQZgBtjm1N+ZYKaoyZgoOhAVw7vcBE2irOcBYPVEVx4TROUQL2AyD1gP
	 rkWFH1pbIIyJD71FjpFDjjuYkyULGQJ+LjBMCl6fLg/XpnjERoAaIsmDobBGHwBcH7
	 z2ivjfZCLxryQ==
Date: Fri, 30 Oct 2026 11:20:40 +0000
From: Will Deacon <will@kernel.org>
To: Usama Anjum <usama.anjum@arm.com>
Cc: Linu Cherian <linu.cherian@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maz@kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <auR9iDfUxqz3ExP8@willie-the-truck>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 02:47:19PM +0000, Usama Anjum wrote:
> On 23/05/2026 2:47 pm, Linu Cherian wrote:
> > From: Ryan Roberts <ryan.roberts@arm.com>
> > 
> > There are 3 variants of tlb flush that invalidate user mappings:
> > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > would previously unconditionally broadcast their tlbis to all cpus in
> > the inner shareable domain.
> > 
> > But this is a waste of effort if we can prove that the mm for which we
> > are flushing the mappings has only ever been active on the local cpu. In
> > that case, it is safe to avoid the broadcast and simply invalidate the
> > current cpu.
> > 
> > So let's track in mm_context_t::active_cpu either the mm has never been
> > active on any cpu, has been active on more than 1 cpu, or has been
> > active on precisely 1 cpu - and in that case, which one. We update this
> > when switching context, being careful to ensure that it gets updated
> > *before* installing the mm's pgtables. On the reader side, we ensure we
> > read *after* the previous write(s) to the pgtable(s) that necessitated
> > the tlb flush have completed. This guarrantees that if a cpu that is
> > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > entry cannot have been seen by any other cpu and we can flush only the
> > local cpu.
> > 
> > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> > Changelog from RFC v1:
> > - Adapted for v7.1 flush tlb API changes
> >   No changes in core logic
> > - Collected Rb and Tb tags
> > - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> >   hence retained dsb(ishst) in flush_tlb_user_pre	
> > 
> > 
> > Testing with 7.1-rc4 :
> > +-----------------------+---------------------------------------------------+-------------+
> > | Benchmark             | Result Class                                      |  Improvement|  
> > +=======================+===================================================+=============+
> > | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > +-----------------------+---------------------------------------------------+-------------+
> > | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > +-----------------------+---------------------------------------------------+-------------+
> 
> I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
> arm64 host, with Linux v7.3 on both the host and guests. Each worker
> repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
> response over the serial console, and shuts the guest down, waiting for
> Firecracker to exit before starting the next VM. Each guest has 256 MiB of
> RAM, with two VM slots per workload CPU.
> 
> With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
> CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
> despite the additional CPUs.
> 
> Applying the patch to the guest substantially improves throughput at higher
> concurrency. At 128 workload CPUs, I measured:
> 
>   Guest pages  Unpatched  Guest patched only  Host patched only
>   -----------  ---------  ------------------  -----------------
>   4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
>   64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)
> 
> The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
> guests is small enough that I would regard it as essentially unchanged.

Sorry, but I haven't understood the setup here. If each guest ("microVM")
only has 1 vCPU, then why does this patch have any effect in the "guest
patched only" case? Additionally, the non-broadcast TLB invalidation will
be upgraded to broadcast by the hypervisor.

But I'm certain I'm misunderstanding what you've tested here, as the
numbers indicate that something did change.

Will

