Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5C1C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHxBcaT+E/DCwf1hXM+vR64jW2mqPlUKi1FRji6ZfJg=; b=q6RJzzikZvSLKfprMjp1P2F33v
	WcWJnhtVatmDvTP9HuJJUEeptCM9RVJoPrQkFJW2JuQ73nkaxfHWKhUFBJR9cqwmtCzx9oLhfG02G
	+IKvx3Et+R2yGn9i+TUmtzF33CUN9HgjNv3+rHUJNl2yX4k7KTMsNMTuVtqEeht+MAFyul6nY4VnI
	7tWrGdsL4/V3rDbmUFcSz4mFaXVqo5e4QlPJEuDk/UrhNLtCrmYH/bGOvLh77hRxqUPx+/WDo6WwT
	ShuZ+HqLwPyxScIl4oSfX1psfcm7QtW4mjnyb1O0AoVEocAWME7AHN9bE1wIMeGgqOs4GMpyJxxBM
	wT8AMu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMeU-0000000HQVn-3IEp;
	Thu, 16 Jul 2026 14:01:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMeQ-0000000HQUA-1msu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:01:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B112600BC;
	Thu, 16 Jul 2026 14:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BFC1F00A3A;
	Thu, 16 Jul 2026 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784210481;
	bh=xHxBcaT+E/DCwf1hXM+vR64jW2mqPlUKi1FRji6ZfJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jEqOoKBg9/LL9mp6utQwe8HtDiiRDdYQ1D9x2HpJGEETCbxjFHZDg/6ehbwgoC5x1
	 YRgtOxUQBvwF36yaLFbvrKvMsCd2zyk8yxccyZQgh456v2DoAFMg6FAQFI9ssXooTy
	 Tv4ZnV4r3lsSlmEwvkv7QcZE5IuY3Lipyzl0KP2ote0ttp/aGtvdr0gnCbDpPZVmNt
	 95lWhigYClA2/zbOmjdqcpibc6wSHPKaE9JMO1+Jia+p0t4LVmBeVcO4Wyz8JTL7DK
	 CTZYptBUjY4mkP3umvmxLvww/Sj+6/ApyeXxTPuqavtL4F0v6FfCbqocmFwlClPqGe
	 ZIF4ztpZu5XcA==
Date: Thu, 16 Jul 2026 15:01:16 +0100
From: Will Deacon <will@kernel.org>
To: liulhong617@163.comm, ardb@kernel.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liulhong617 <liulhong617@gmail.com>
Subject: Re: [PATCH] arm64: mm: fix accidental linear mapping of no-map
 reserved memory
Message-ID: <aljkLPTfyAbPaT98@willie-the-truck>
References: <20260513010255.3764038-1-liulhong617@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513010255.3764038-1-liulhong617@163.com>
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

[+Ard]

On Wed, May 13, 2026 at 09:02:55AM +0800, liulhong617@163.com wrote:
> From: liulhong617 <liulhong617@gmail.com>
> 
> When reserved-memory regions with the "no-map" property are not
> page-aligned, the kernel may accidentally map them into the linear
> mapping, contradicting the no-map semantics.

Crikey, I wonder what the semantics are for "no-map" if the region isn't
page aligned? If the remaining part of the page is advertised as memory
but doesn't have the "no-map" property, then we can't really satisfy
what we're being asked to do.

> The root cause is a mismatch between /proc/iomem's address boundaries
> and the actual page table mapping boundaries:
> 
> 1. /proc/iomem derives its ranges from memblock via
>    memblock_region_reserved_base_pfn/memblock_region_reserved_end_pfn,
>    which perform PFN rounding so the displayed boundaries are
>    page-aligned. This gives the impression that the no-map region
>    occupies whole pages.
> 
> 2. However, memblock_mark_nomap() splits memblock.memory regions at
>    exact byte boundaries (memblock_isolate_range preserves raw DT
>    base/size with no alignment). When for_each_mem_range iterates the
>    non-NOMAP regions adjacent to a no-map region, it returns start/end
>    values that are NOT page-aligned — they are the precise byte
>    boundaries from the memblock split.
> 
> 3. These sub-page-aligned values are passed to
>    __create_pgd_mapping_locked(), which does:
>      phys &= PAGE_MASK;
>      addr = virt & PAGE_MASK;
>      end = PAGE_ALIGN(virt + size);
>    The downward rounding of phys via PAGE_MASK extends the mapped
>    range backward into the adjacent no-map region, effectively
>    including no-map memory in the linear mapping.
> 
> For example, with 64K pages, reserved_region@A2000000 (base=0xA2000000,
> size=0x8000, no-map) causes for_each_mem_range to return
> start=0xA2008000 for the next mappable region. After phys &= PAGE_MASK,
> the actual mapping starts at 0xA2000000 — the entire no-map region is
> incorrectly mapped.
> 
> Fix this by rounding the mappable range inward to PAGE_SIZE boundaries
> before passing it to __map_memblock: start is rounded UP and end is
> rounded DOWN. This ensures the mapped area never overlaps with adjacent
> no-map regions. The cost is at most one page of unmapped gap at each
> boundary, which is preferable to violating no-map semantics.
> 
> Signed-off-by: liulhong617 <liulhong617@gmail.com>
> ---
>  arch/arm64/mm/mmu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index dd85e093f..bc8ac7622 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1175,6 +1175,20 @@ static void __init map_mem(pgd_t *pgdp)
>  	for_each_mem_range(i, &start, &end) {
>  		if (start >= end)
>  			break;
> +		/*
> +		 * for_each_mem_range may return sub-page-aligned boundaries
> +		 * after memblock_mark_nomap() splits regions at byte precision.
> +		 * __create_pgd_mapping_locked aligns phys down to PAGE_MASK,
> +		 * which could accidentally map no-map memory on the boundary.
> +		 * Round the mappable range inward: start UP, end DOWN, so
> +		 * that the mapped area never overlaps with adjacent no-map
> +		 * regions. The cost is at most one page of unmapped gap at
> +		 * each boundary.
> +		 */
> +		start = PAGE_ALIGN(start);
> +		end = end & PAGE_MASK;
> +		if (start >= end)
> +			continue;

Maybe I'm over-worrying here, but I've seen firmware describe parts of
memory as lots of small, adjacent regions in some cases and so I'm
worried we'd fail to map the pages with this change.

I'd be more in favour of detecting sub-page sized "no-map" regions that
are adjacent to normal memory regions, emitting a warning/firmware taint
and then doing... precisely nothing about it. What practical issues are
you seeing on your system?

Will

