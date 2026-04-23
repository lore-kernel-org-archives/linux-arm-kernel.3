Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2026FDEE27
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCgFqZVqIAWSpFFfn/jPbzSNh+LqQs3VNNLI1iMj91M=; b=2gJi9sxZyRY1ylBm/rcWVqs8GB
	lzFAyst4KYuBaxCtUu1c6mEr+aZw8ttHTgdUT4NDVIdpuP8e/xfaHenPpEO365DXlqVsi6px+5g64
	LJ87y/CaXhIL06KLUXD8kR1DszK5gMme/oeq2e2o31iuu3XjzBzynKnJb/BDR8ChM06k8nnv+Wsj2
	kyHPAulLBGdLyi0dGCPiU0Rm7yUtQO6PQuGaeqfKHoAHes1REvRFz/RAljmCF4orXKDqJqI1Bs0Iq
	wQAaqUq1D/3VabS1S11NnlYNb8x3Gr+bln4ZiL9XxNu9S9CuNdczHN8DZwRMSGRBWmSsCc9lYuMr3
	utdVJ/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxWV-0000000C0e7-0OI7;
	Thu, 23 Apr 2026 17:07:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxWT-0000000C0dp-29qx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:07:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EDFF16024D;
	Thu, 23 Apr 2026 17:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58981C2BCAF;
	Thu, 23 Apr 2026 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776964048;
	bh=bpyG8Btdh6BDiGfO3BSWxQDL30rjJqk/bMNxx7Ud5QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPgi62/6RS/ULQQ1DWDQi8BI2xx0yjO4nC3QcOtec4V9l+ZP0j2WhS9h6tvsyJcyi
	 XCh1Cdw+IGLveT4iBd+Pqcamk9HZ5bRCSpL9Z1tGmzBlMPhx1r+8h0arvJ122oH7R5
	 1CibfZIv9vCZbB7Pti2paUL2cHa2A6vdB6xsJHgkkYuq6BbrRM6DjseCnXYmMoy0Gt
	 7v+YyffYMupkOK3sbeF2DlwQS7PpMmpYWc8VMawu27QsPjK6kQsuAAEHP1X0k+ooJb
	 uDLZT1WUbKpao73u+/zQmVSci/dzS8NAHmhgSNwR+ML1LPfV1EgmkNDRCUXUrXtI5i
	 pnPY1wiXjqg/A==
Date: Thu, 23 Apr 2026 18:07:23 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Evangelos Petrongonas <epetron@amazon.de>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <aepRy7Gp7Ng85Zr7@willie-the-truck>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423142326.GP3611611@ziepe.ca>
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

On Thu, Apr 23, 2026 at 11:23:26AM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 23, 2026 at 10:47:49AM +0100, Will Deacon wrote:
> > > Does iommu-pages provide a mechanism to map the memory as non-cacheable
> > > if the SMMU isn't coherent? 
> 
> No, it has to use CMOs today.
> 
> It looks like all the stuff dma_alloc_coherent does to make a
> non-cached mapping are pretty arch specific. I don't know if there is
> a way we could make more general code get a struct page into an
> uncached KVA and meet all the arch rules?
> 
> I also think dma_alloc_coherent is far to complex, with pools and
> more, to support KHO.

I wonder if there's scope for supporting just some subset of it?

> > > I really don't want to entertain CMOs for > the queues.
> > 
> > Sorry, I said "queues" here but I was really referring to any of the
> > current dma_alloc_coherent() allocations and it's the CDs that matter
> > in this thread.
> 
> queues shouldn't change they are too performance sensitive
> 
> > The rationale being that:
> > 
> > 1. A cacheable mapping is going to pollute the cache unnecessarily.
> > 2. Reasoning about atomicity and ordering is a lot more subtle with CMOs.
> 
> The page table suffers from all of these draw backs, and the STE/CD is
> touched alot less frequently. It is kind of odd to focus on these
> issues with STE/CD when page table is a much bigger problem.

I don't think it's that odd given that the STE/CD entries are bigger
than PTEs and the SMMU permits a lot more relaxations about how they are
accessed and cached compared to the PTW.

Having said that, the page-table code looks broken to me even in the
coherent case:

	ptep[i] = pte | paddr_to_iopte(paddr + i * sz, data);

as the compiler can theoretically make a right mess of that.

The non-coherent case looks more fragile, because I don't _think_ the
architecture provides any ordering or atomicity guarantees about cache
cleaning to the PoC. Presumably, the correct sequence would be to write
the PTE with the valid bit clear, do the CMO (with completion barrier),
*then* write the bottom byte with the valid bit set and do another CMO.
Sounds great!

> STE/CD is pretty simple now, there is only one place to put the CMO
> and the ordering is all handled with that shared code. We no longer
> care about ordering beyond all the writes must be visible to HW before
> issuing the CMDQ invalidation command - which is the same environment
> as the pagetable.

You presumably rely on 64-bit single-copy atomicity for hitless updates,
no?

> > 3. It seems like a pretty invasive driver change to support live update,
> >    which isn't relevant for a lot of systems.
> 
> That's sort of the whole story of live update.. Trying to keep it
> small means using the abstractions that support it like iommu-pages.
> 
> IMHO live update is OK to require coherent only, so at worst it could
> use iommu-pages on coherent systems and keep using the
> dma_alloc_coherent() for others.

That would be unfortunate, but if we can wrap the two allocators in
some common helpers then it's probably fine.

> I also don't like this "lot of systems thing". I don't want these
> powerful capabilities locked up in some giant CSP's proprietary
> kernel.  I want all the companies in the cloud market to have access
> to the same feature set. That's what open source is supposed to be
> driving toward. I have several interesting use cases for this
> functionality already.

Sorry, the point here was definitely _not_ about keeping this out of
tree, nor was I trying to say that this stuff isn't important. But the
mobile world doesn't give a hoot about KHO and _does_ tend to care about
the impact of CMO, so we have to find a way to balance the two worlds.

> It will run probably $50-100B of AI cloud servers at least, I think
> that is enough justification.

I wasn't asking for justification but I honestly don't care about the
money involved :) People need this, so we should find a way to support
it -- it just needs to fit in with everything else.

Will

