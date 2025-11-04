Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59D4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=385F7cTMmhFyxlBRMIzk6fEXBq4PBgQgfNrBa3aUr0U=; b=bjHYsfMDsKsMyQQGKix96YqLjv
	lqyNW4qJSZBBCRzak5iuAHfxuFqq6ofdBecSKWAV+sLFCRE4QQlHDYhKl3FsQDUmr33m0Ek51RZDp
	iuGJvl7I7Z/XhphP+zDFEQFHsqk2SJuY56nqOxKf94OfeK+kn4WfDFpgm3bejg9NFNQyQrxmISebC
	acTOmWqfc9UvLluwAtltCjM5FAZSwVeOtIFCRoau32713cKjXHXgXwjuNBx073pckN4h+mLau3JuG
	5ioPVh9/ylRkIrNmpz++duuUrdo6kN9Ky1xMx/UbMQfcW/aAItuV9h36x4aeYbllipJ8c77Tw4uf4
	r14BqnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGLf-0000000Bnpn-2Z2z;
	Tue, 04 Nov 2025 12:41:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGLd-0000000BnpO-0JC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D10141920;
	Tue,  4 Nov 2025 12:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F71C4CEF7;
	Tue,  4 Nov 2025 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762260076;
	bh=8ymZxzZATI0ystLlUvVFK/P2C6papBtYAEpeRGinXiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmzUcDrmIdY5KiWMDwfs92R2YM6cNepuEvZMrrs8BMxPUVX8h7zve3MLDkvWTvQZB
	 s6UfrJZCWdja9bAwSULLEvgR46b0sbn0FI6cq9Hks6j6G4qywl1xCvKZoFqGqmeek+
	 X4E2An3nCUoYp1mzypCPpBZp4W4XhTUUG7q9nK1kJ2pDxcS5wI/hsJnzQNOcK2KDAR
	 ujfOAeSy5U80PWzVDTRBlSibuVNF/+g2HYQPGM2NDB9UqTH/YeNlf9BiDjgr5ukAQ1
	 o6FjAgNyWXNNNu+I2VscTRx4esBXFv6MChFOriOYLCFILrfGl7FaomZnK/QT3oO1pp
	 2e3xNtkGOwt/Q==
Date: Tue, 4 Nov 2025 12:41:10 +0000
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, yang@os.amperecomputing.com, david@redhat.com,
	ardb@kernel.org, dev.jain@arm.com, scott@os.amperecomputing.com,
	cl@gentwo.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <groeck@google.com>
Subject: Re: [PATCH v1] arm64: mm: Don't sleep in split_kernel_leaf_mapping()
 when in atomic context
Message-ID: <aQn0ZqCPSA61QmDI@willie-the-truck>
References: <20251103125738.3073566-1-ryan.roberts@arm.com>
 <aQjMUhspJrRQn5Ew@willie-the-truck>
 <3611cfeb-53d5-4db5-95a1-1d095edfc3c9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3611cfeb-53d5-4db5-95a1-1d095edfc3c9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_044117_141980_ECA9E4F7 
X-CRM114-Status: GOOD (  19.71  )
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

Hey Ryan,

On Mon, Nov 03, 2025 at 04:28:44PM +0000, Ryan Roberts wrote:
> On 03/11/2025 15:37, Will Deacon wrote:
> > On Mon, Nov 03, 2025 at 12:57:37PM +0000, Ryan Roberts wrote:
> >> +static int range_split_to_ptes(unsigned long start, unsigned long end, gfp_t gfp)
> >> +{
> >> +	int ret;
> >> +
> >> +	arch_enter_lazy_mmu_mode();
> >> +	ret = walk_kernel_page_table_range_lockless(start, end,
> >> +					&split_to_ptes_ops, NULL, &gfp);
> >> +	arch_leave_lazy_mmu_mode();
> > 
> > Why are you entering/leaving lazy mode now? linear_map_split_to_ptes()
> > calls flush_tlb_kernel_range() right after this so now it looks like
> > we have more barriers than we need there.
> 
> Without the lazy mmu block, every write to every pte (or pmd/pud) will cause a
> dsb and isb to be emitted. With the lazy mmu block, we only emit a single
> dsb/isb at the end of the block.
> 
> linear_map_split_to_ptes() didn't previously have a lazy mmu block; that was an
> oversight, I believe. So when refactoring I thought it made sense to make it
> common for both cases.
> 
> Yes, the flush_tlb_kernel_range() also has the barriers, so the lazy mmu mode is
> reducing from a gazillion barriers to 2. We could further optimize from 2 to 1,
> but I doubt the performance improvement will be measurable.
> 
> Perhaps I've misunderstood your point...?

I was just trying to understand whether this was a functional thing (which
I couldn't grok) or an optimisation. Sounds like it's the latter, but I'd
prefer not to mix optimisations with fixes.

Will

