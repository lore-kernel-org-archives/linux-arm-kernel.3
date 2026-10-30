Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3289D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DXVIzWqn;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o7DNZa5W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XF7Kruz+VERXXGFD6bAbGW0IgqysTyfQGfE+6WQ3Rdc=; b=DXVIzWqn6aeww+ESeS2RrlpkDr
	MLt+4pG3LxwWLFbyfiqFxf4tI6/Ry90Zj8eKc3P37qxvARWVW+BaIwXvc1z4zOaO7FZj2Cyf1cvy5
	yDwSEbNSbSFeCD/OSYzpS15EeQOaVg0s/s95bTtuGVqpzen29MIehsw07jsNS4nXJqZMy+k9vicGS
	NrkyQ4zkJuaXTZG0klzfQxoWcJ5p39o5aZjRO6S99dsifWw0Fv3wufvUuSSqZvUriBcZr1V6QQyYN
	RiCvvtFTlrV7HXSoA6ASEsL4wWjV3bMcx4Gd3Xk4FbgBmGuErquTwm71JOpMTy0DCYvena30SdEMS
	9XQcWh3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlZI-0000000BfEN-2Nph;
	Fri, 30 Oct 2026 12:18:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlZF-0000000BfE2-1MMF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:18:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73AE51682;
	Fri, 30 Oct 2026 05:18:40 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F853F673;
	Fri, 30 Oct 2026 05:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793362723; bh=mr1vCM3m++CO0IeLTY678K5+pJpgcJelaLHGSOLgJ9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7DNZa5W8dfrCyTf2ZgrNZIvuu8obc5U5C1jkwLAnbAvVgeKwB8JmCLIDeB/wtVNE
	 CNqiM/jmsJVuclsTTf2gAYx24q09ZI0hj4JN1PIB0ts8iJsrdOXHnBgBJZrWjn/v+s
	 J9U4iDL/WTblD9WdYZHTd2inWTTqaOO/8BSS6do0=
Date: Fri, 30 Oct 2026 12:18:39 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Usama Anjum <usama.anjum@arm.com>, Linu Cherian <linu.cherian@arm.com>,
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
Message-ID: <auSLH65dv2nEctXd@arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <b6f0d10a-d098-43cc-b923-0245af5f51f0@arm.com>
 <auR9iDfUxqz3ExP8@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auR9iDfUxqz3ExP8@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_051845_472357_52F6C55A 
X-CRM114-Status: GOOD (  33.92  )
X-Spam-Score: -4.4 (----)
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

On Fri, Oct 30, 2026 at 11:20:40AM +0000, Will Deacon wrote:
> On Wed, Oct 28, 2026 at 02:47:19PM +0000, Usama Anjum wrote:
> > On 23/05/2026 2:47 pm, Linu Cherian wrote:
> > > From: Ryan Roberts <ryan.roberts@arm.com>
> > > 
> > > There are 3 variants of tlb flush that invalidate user mappings:
> > > flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> > > would previously unconditionally broadcast their tlbis to all cpus in
> > > the inner shareable domain.
> > > 
> > > But this is a waste of effort if we can prove that the mm for which we
> > > are flushing the mappings has only ever been active on the local cpu. In
> > > that case, it is safe to avoid the broadcast and simply invalidate the
> > > current cpu.
> > > 
> > > So let's track in mm_context_t::active_cpu either the mm has never been
> > > active on any cpu, has been active on more than 1 cpu, or has been
> > > active on precisely 1 cpu - and in that case, which one. We update this
> > > when switching context, being careful to ensure that it gets updated
> > > *before* installing the mm's pgtables. On the reader side, we ensure we
> > > read *after* the previous write(s) to the pgtable(s) that necessitated
> > > the tlb flush have completed. This guarrantees that if a cpu that is
> > > doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> > > entry cannot have been seen by any other cpu and we can flush only the
> > > local cpu.
> > > 
> > > Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> > > [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> > > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > > ---
> > > Changelog from RFC v1:
> > > - Adapted for v7.1 flush tlb API changes
> > >   No changes in core logic
> > > - Collected Rb and Tb tags
> > > - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> > >   hence retained dsb(ishst) in flush_tlb_user_pre	
> > > 
> > > 
> > > Testing with 7.1-rc4 :
> > > +-----------------------+---------------------------------------------------+-------------+
> > > | Benchmark             | Result Class                                      |  Improvement|  
> > > +=======================+===================================================+=============+
> > > | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> > > +-----------------------+---------------------------------------------------+-------------+
> > > | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> > > | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> > > +-----------------------+---------------------------------------------------+-------------+
> > 
> > I tested this patch using a synthetic Firecracker benchmark on a 192-CPU
> > arm64 host, with Linux v7.3 on both the host and guests. Each worker
> > repeatedly creates a fresh 1-vCPU microVM, boots Ubuntu, verifies an echo
> > response over the serial console, and shuts the guest down, waiting for
> > Firecracker to exit before starting the next VM. Each guest has 256 MiB of
> > RAM, with two VM slots per workload CPU.
> > 
> > With 4 KiB guests, the unpatched workload stops scaling between 64 and 96
> > CPUs: throughput falls from approximately 68 to 65 completed lifecycles/s
> > despite the additional CPUs.
> > 
> > Applying the patch to the guest substantially improves throughput at higher
> > concurrency. At 128 workload CPUs, I measured:
> > 
> >   Guest pages  Unpatched  Guest patched only  Host patched only
> >   -----------  ---------  ------------------  -----------------
> >   4 KiB        73.83/s    108.55/s (+47.0%)    74.09/s (+0.4%)
> >   64 KiB       86.46/s    105.04/s (+21.5%)    90.15/s (+4.3%)
> > 
> > The host uses 4 KiB pages throughout. The host-only difference with 4 KiB
> > guests is small enough that I would regard it as essentially unchanged.
> 
> Sorry, but I haven't understood the setup here. If each guest ("microVM")
> only has 1 vCPU, then why does this patch have any effect in the "guest
> patched only" case?

I wonder whether it's the repeat TLBI workaround just doing more DVM
traffic. Turned off when no broadcast is needed.

> Additionally, the non-broadcast TLB invalidation will
> be upgraded to broadcast by the hypervisor.

I have a hack that makes things even faster (opportunistic
HCR_EL2.FB=0). I may post it once I understand the implications
properly.

-- 
Catalin

