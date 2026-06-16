Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57C1CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 04:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3qbKHAVahng5GrMogMAAtOsCj0tjb4+VDCvf04byPU=; b=xM8ZHwL8PMNM3p3CYIEKlhqIUP
	NPOQK6ZNopFkdBoGw5nBXvBYOmMxNy56dlA4ND+iyo1ONOYVtoNgIDBYBcflMfQWb4eBwKlaj7mp1
	9nO6DgMRCi3P2+ahDc9YGevw6b9ZNFTWtSnxzT2vZJp/ckTS+EdJyC52ZrcYAqMbI0NCY8+PbjLIm
	pez18muW8xgp0jaNsp5DD/bu4jWisGz6Zcr/PkIygjnj5hnJkLxoN7r6UJ9xmyl5RqAdFxsRZGQri
	RlWr02WbM4vnH6kuBwq9qrokzxqpeMCecKv787L7T4x9n8NEXcilJibkkJx7VwCNKAxtJItDIMt5g
	+GEoB/YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLp8-0000000FDf6-1ibl;
	Tue, 16 Jun 2026 04:54:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZLp6-0000000FDec-0nUf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 04:54:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B957C3D4B;
	Mon, 15 Jun 2026 21:54:43 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF8433F915;
	Mon, 15 Jun 2026 21:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781585688; bh=oKz+HJ9pfRoiE5HleCp1vs2MiUNVGxNe7CgkVBr+6fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fntFIproCDmJJPxD2df3CzDmzl1XA/tWcXEQadLNp20l+9amK/EPUn88T43eEdW8G
	 KL67ttC9Ysk9/U8QlSk+elYsz/H0nFLuEc50bndsxtlwFtEKqIgjhgIhwQ7FlIQ11n
	 pb04an62webziHWqcsbMiizgPYujU2i5f1eJaO8o=
Date: Tue, 16 Jun 2026 10:24:44 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tlbflush: Don't broadcast if mm was only
 active on local cpu
Message-ID: <ajDXFER9jQ-27JyO@a079125.arm.com>
References: <20260523134710.3827956-1-linu.cherian@arm.com>
 <ai6KzFgfMAxqplcr@willie-the-truck>
 <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc8803d-b375-477e-bba7-806edaf86578@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_215452_496455_C302342C 
X-CRM114-Status: GOOD (  25.35  )
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

On Mon, Jun 15, 2026 at 12:21:19PM +0100, Ryan Roberts wrote:
> On 14/06/2026 12:04, Will Deacon wrote:
> > On Sat, May 23, 2026 at 07:17:10PM +0530, Linu Cherian wrote:
> >> From: Ryan Roberts <ryan.roberts@arm.com>
> >>
> >> There are 3 variants of tlb flush that invalidate user mappings:
> >> flush_tlb_mm(), flush_tlb_page() and __flush_tlb_range(). All of these
> >> would previously unconditionally broadcast their tlbis to all cpus in
> >> the inner shareable domain.
> >>
> >> But this is a waste of effort if we can prove that the mm for which we
> >> are flushing the mappings has only ever been active on the local cpu. In
> >> that case, it is safe to avoid the broadcast and simply invalidate the
> >> current cpu.
> >>
> >> So let's track in mm_context_t::active_cpu either the mm has never been
> >> active on any cpu, has been active on more than 1 cpu, or has been
> >> active on precisely 1 cpu - and in that case, which one. We update this
> >> when switching context, being careful to ensure that it gets updated
> >> *before* installing the mm's pgtables. On the reader side, we ensure we
> >> read *after* the previous write(s) to the pgtable(s) that necessitated
> >> the tlb flush have completed. This guarrantees that if a cpu that is
> >> doing a tlb flush sees it's own id in active_cpu, then the old pgtable
> >> entry cannot have been seen by any other cpu and we can flush only the
> >> local cpu.
> >>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> >> Tested-by: Huang Ying <ying.huang@linux.alibaba.com>
> >> [linu.cherian@arm.com: Adapted for v7.1 flush tlb API changes]
> >> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> >> ---
> >> Changelog from RFC v1:
> >> - Adapted for v7.1 flush tlb API changes
> >>   No changes in core logic
> >> - Collected Rb and Tb tags
> >> - lat_mmap benchmark showed dsb(ishst) performs better than dsb(ish),
> >>   hence retained dsb(ishst) in flush_tlb_user_pre	
> >>
> >>
> >> Testing with 7.1-rc4 :
> >> +-----------------------+---------------------------------------------------+-------------+
> >> | Benchmark             | Result Class                                      |  Improvement|  
> >> +=======================+===================================================+=============+
> >> | perf/syscall          | fork (ops/sec)                                    |   (I) 3.25% |
> >> +-----------------------+---------------------------------------------------+-------------+
> >> | pts/memtier-benchmark | Protocol: Redis Clients: 100 Ratio: 1:5 (Ops/sec) |   (I) 2.70% |
> >> | 			| Protocol: Redis Clients: 100 Ratio: 5:1 (Ops/sec) |   (I) 2.13% |
> >> +-----------------------+---------------------------------------------------+-------------+
> > 
> > I think we need a much more comprehensive set of benchmarks before we can
> > begin to consider a change like this.
> 
> I believe that Linu ran a wider set of benchmarks and didn't find any
> regressions. These are just the ones that show improvement (Linu, please correct
> me and/or provide details).

Yes, thats correct.


--
Thanks,
Linu Cherian.

