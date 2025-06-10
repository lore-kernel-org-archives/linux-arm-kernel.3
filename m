Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED365C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k23bRCy5ODOVKdBZNsm3TcbtzWdAHnh5DKm06mTznP0=; b=y+hInoz+tbx4cTeUwX5vnElo3m
	B/fvkjDs/Zcgjzhh2J+CppTm4wZPv9D/VPRcu+Vt1E99CU3Ock7Q2j8IxP9kHmgiX9Cn1zOgQEWUB
	eaYDgSMKB8erPw3sOFxSVncssn1oVK6uGvzqRb0xYKukkZ2R1girbsJ0IctkXMafr0y1xdsVYWmo2
	pQqXEo4SrRPnDFAEtX8o4F1vgDS7nucriCvUI4CVGqBWt11KHQjWoQw1c9Z7inqlIe32SzHTJVB5R
	hxH0/c8j+ub1goY1NgefHA2gijRo/tAkUJl3Rw0Uy94Ly2ydLNdcP2R4IRL+WS4nF1EgGTbY6DJOz
	NDsDIMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3Yo-00000007mNe-28St;
	Tue, 10 Jun 2025 18:18:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0a0-00000007EYQ-1ZoU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A67C629C8;
	Tue, 10 Jun 2025 15:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BB4C4CEED;
	Tue, 10 Jun 2025 15:07:56 +0000 (UTC)
Date: Tue, 10 Jun 2025 16:07:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Message-ID: <aEhKSq0zVaUJkomX@arm.com>
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com>
 <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
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

On Tue, Jun 10, 2025 at 02:41:01PM +0100, Ryan Roberts wrote:
> On 10/06/2025 13:00, Catalin Marinas wrote:
> > On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
> >> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> >> provided a quick fix to ensure that lazy_mmu_mode continues to work when
> >> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
> >> nest.
> >>
> >> The solution in that patch is the make the implementation tolerant to
> > 
> > s/is the make/is to make/
> > 
> >> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
> >> exit becomes a nop. But this sacrifices the optimization opportunity for
> >> the remainder of the outer user.
> > [...]
> >> I wonder if you might be willing to take this for v6.16? I think its a neater
> >> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
> >> lazy_mmu_mode to be nested") - which is already in Linus's master.
> >>
> >> To be clear, the current solution is safe, I just think this is much neater.
> > 
> > Maybe better, though I wouldn't say much neater. One concern I have is
> > about whether we'll get other such nesting in the future and we need to
> > fix them in generic code. Here we control __kernel_map_pages() but we
> > may not for other cases.
> > 
> > Is it the fault of the arch code that uses apply_to_page_range() via
> > __kernel_map_pages()? It feels like it shouldn't care about the lazy
> > mode as that's some detail of the apply_to_page_range() implementation.
> > Maybe this API should just allow nesting.
> 
> I don't think it is possible to properly support nesting:
> 
> enter_lazy_mmu
>     for_each_pte {
>         read/modify-write pte
> 
>         alloc_page
>             enter_lazy_mmu
>                 make page valid
>             exit_lazy_mmu
> 
>         write_to_page
>     }
> exit_lazy_mmu
> 
> This example only works because lazy_mmu doesn't support nesting. The "make page
> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
> page can be accessed in write_to_page. If nesting was supported, the inner
> exit_lazy_mmu would become a nop and write_to_page would explode.

What I meant is for enter/exit_lazy_mmu to handle a kind of de-nesting
themselves: enter_lazy_mmu would emit the barriers if already in lazy
mode, clear pending (well, it doesn't need to do this but it may be
easier to reason about in terms of flattening). exit_lazy_mmu also needs
to emit the barriers but leave the lazy mode on if already on when last
entered. This does need some API modifications to return the old mode on
enter and get an argument for exit. But the correctness wouldn't be
affected since exit_lazy_mmu still emits the barriers irrespective of
the nesting level.

> So the conclusion I eventually came to (after being nudged by Mike Rapoport at
> [1]) is that this _is_ arm64's fault for creating a loop via
> apply_to_page_range(). So I'm trying to fix this by breaking the loop.
> 
> [1] https://lore.kernel.org/all/aDqz7H-oBo35FRXe@kernel.org/

If the only such loop is the arm64 code, fine by me to fix it this way.
Your series above had 6 patches and I thought there's more to fix.

> We could alternatively use some per-cpu storage for a nest count, but that gets
> ugly quite quickly I suspect.

Yeah, the thread flag is much nicer.

> But regardless, I'm not convinced the semantics of a properly nested
> lazy_mmu are safe.

I think we can make them safe but there would be opposition from the mm
people and it may not be trivial on x86. So, I'm fine with this arm64
specific change:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

