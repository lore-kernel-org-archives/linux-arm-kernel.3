Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F6BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Vc6Y+34DoHf9KvelGXYXSEIFKxVelF1v+ZsJHAVBGE=; b=Y/IL9F3SReWlu1JEPuofi0agBB
	nBVmWbrlM2cc5TgMj7sOI8LchyBvQ00IzgXbnL6kclWN3Og6vszXYmpTlEOA4KPavDnOYt+Tnov18
	G+Q4j4eNqljMq3DKPm5LW8TibHRzKT+a22GJ4Sj9rdXFaUTqYg6XvXclmFylKB1iuN8XcQuOzHfxi
	hbwOfwnJGMD0y7sEd71KSmu8bSC4U8QdxEQui+vhOo04c0HgXRLTvU1W8HZsG5UQxaYdy6TrmMl2d
	n4C4WUGJeCd8Dwd48r4x5yJ/BARXLmk9HFNN6gQZM6LkVFgdKabRGoflnw1LjXhRqf4GJkJ3euvhd
	xN9mia2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpv0E-00000009Ada-2HRm;
	Wed, 05 Mar 2025 20:06:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpuX8-000000095JW-3yvc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74929A45C66;
	Wed,  5 Mar 2025 19:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF4BC4CEE0;
	Wed,  5 Mar 2025 19:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741203357;
	bh=opvlMC7/dJjo3sftbWz3StojmcMoaNBHavqjKNA8v6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DlI0YgwRiawZxVfrzvh4EJlkNqVQ1InEA61nj5QxoxVAjruJi1q2XRqZC7mlmXb1Q
	 a+xEx2hFlaU+nsxDoVMo26p5IUrVsnpaAqNXcoT3WKFjo2PVyFA4RneQVwmOjqclqU
	 RFmHzOxsMcNiNG3HSoCU/AslAXoM/l8y0dDxq5virnG8fZInzdVcZO8ivDc8npM1b1
	 j9FkaqKHxs7W+AJ5v8+pMpWDkqnBuZJhceyCj2IMjl5d1dAbig0QCpplvQ5y+Zy25T
	 LOlrl5dZWUq7BWZgaCSpPiayGmXJrhqnTpQcfeEw3WjdAQVX/YmljeMmjwjv+YjgLk
	 cL8L7w0omJlPw==
Date: Wed, 5 Mar 2025 19:35:52 +0000
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Piotr Jaroszynski <pjaroszynski@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>,
	Alistair Popple <apopple@nvidia.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	SeongJae Park <sj@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] [arm64/tlb] Fix mmu notifiers for range-based invalidates
Message-ID: <20250305193551.GB32246@willie-the-truck>
References: <20250304085127.2238030-1-pjaroszynski@nvidia.com>
 <Z8iccxCo7tkqvE_p@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8iccxCo7tkqvE_p@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_113559_052655_F01C8553 
X-CRM114-Status: GOOD (  20.32  )
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

On Wed, Mar 05, 2025 at 06:48:19PM +0000, Catalin Marinas wrote:
> On Tue, Mar 04, 2025 at 12:51:27AM -0800, Piotr Jaroszynski wrote:
> > Update the __flush_tlb_range_op macro not to modify its parameters as
> > these are unexepcted semantics. In practice, this fixes the call to
> > mmu_notifier_arch_invalidate_secondary_tlbs() in
> > __flush_tlb_range_nosync() to use the correct range instead of an empty
> > range with start=end. The empty range was (un)lucky as it results in
> > taking the invalidate-all path that doesn't cause correctness issues,
> > but can certainly result in suboptimal perf.
> > 
> > This has been broken since commit 6bbd42e2df8f ("mmu_notifiers: call
> > invalidate_range() when invalidating TLBs") when the call to the
> > notifiers was added to __flush_tlb_range(). It predates the addition of
> > the __flush_tlb_range_op() macro from commit 360839027a6e ("arm64: tlb:
> > Refactor the core flush algorithm of __flush_tlb_range") that made the
> > bug hard to spot.
> 
> That's the problem with macros.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Will, do you want to take this as a fix? It's only a performance
> regression, though you never know how it breaks the callers of the macro
> at some point.

Yeah, I'll pick it up but I'm travelling atm so it may have to wait until
next week.

Will

