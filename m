Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F684C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTT4VlJeLCC6/l/jodN5fkT+Y2Y1zsiD3qYQ2wYCV1c=; b=UHQJTzqTDq8NkkAF9+Fgd8gzGu
	Y+Ft/NAD5L1MA36RgNmq4o8Lyk/L2AlztNqPs1R9/OtekA4TmIZwBI7ENDozHSD/gUFFalG/obAP7
	+yrZi8+1tfgHf5vGlMJn6fOAa32KBC2Vl9s2PAY/Rx3p8VZ/tkYnKKXa9h0TTD+ccPzcGBG5ZNaea
	xuRmCisIiAa2PybSA9WC50x04zkci0mVGjc8whP6HdvEEMlMfUSpXbAo0sY8fMQW90jC2ayBza+Us
	yDUJ3maKV6s1cTtQ4ksgc4wMWv/fybVG59m6yIqrQiBiJpy4ge6Jgt60IYhQVAshAZVvAADjTUSbn
	2Fj2K77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvCZ-00000009C1i-0oed;
	Wed, 05 Mar 2025 20:18:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpty9-000000090D4-33Wl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:59:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA10DA45F6E;
	Wed,  5 Mar 2025 18:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADD8C4CED1;
	Wed,  5 Mar 2025 18:59:45 +0000 (UTC)
Date: Wed, 5 Mar 2025 18:59:43 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: anshuman.khandual@arm.com, david@redhat.com, will@kernel.org,
	ardb@kernel.org, ryan.roberts@arm.com, mark.rutland@arm.com,
	joey.gouly@arm.com, dave.hansen@linux.intel.com,
	akpm@linux-foundation.org, chenfeiyang@loongson.cn,
	chenhuacai@kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	quic_tingweiz@quicinc.com, stable@vger.kernel.org
Subject: Re: [PATCH v9] arm64: mm: Populate vmemmap at the page level if not
 section aligned
Message-ID: <Z8ifH6HILN_7sZDk@arm.com>
References: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304072700.3405036-1-quic_zhenhuah@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105949_834635_C4C9258F 
X-CRM114-Status: GOOD (  23.17  )
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

On Tue, Mar 04, 2025 at 03:27:00PM +0800, Zhenhua Huang wrote:
> On the arm64 platform with 4K base page config, SECTION_SIZE_BITS is set
> to 27, making one section 128M. The related page struct which vmemmap
> points to is 2M then.
> Commit c1cc1552616d ("arm64: MMU initialisation") optimizes the
> vmemmap to populate at the PMD section level which was suitable
> initially since hot plug granule is always one section(128M). However,
> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> introduced a 2M(SUBSECTION_SIZE) hot plug granule, which disrupted the
> existing arm64 assumptions.
> 
> The first problem is that if start or end is not aligned to a section
> boundary, such as when a subsection is hot added, populating the entire
> section is wasteful.
> 
> The next problem is if we hotplug something that spans part of 128 MiB
> section (subsections, let's call it memblock1), and then hotplug something
> that spans another part of a 128 MiB section(subsections, let's call it
> memblock2), and subsequently unplug memblock1, vmemmap_free() will clear
> the entire PMD entry which also supports memblock2 even though memblock2
> is still active.
> 
> Assuming hotplug/unplug sizes are guaranteed to be symmetric. Do the
> fix similar to x86-64: populate to pages levels if start/end is not aligned
> with section boundary.
> 
> Cc: <stable@vger.kernel.org> # v5.4+
> Fixes: ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> ---
>  arch/arm64/mm/mmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Will, another bug that has been around for ages. Do you want to take it
as a fix?

> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b4df5bc5b1b8..1dfe1a8efdbe 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1177,8 +1177,11 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
>  		struct vmem_altmap *altmap)
>  {
>  	WARN_ON((start < VMEMMAP_START) || (end > VMEMMAP_END));
> +	/* [start, end] should be within one section */
> +	WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct page));
>  
> -	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES))
> +	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
> +	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))
>  		return vmemmap_populate_basepages(start, end, node, altmap);
>  	else
>  		return vmemmap_populate_hugepages(start, end, node, altmap);
> -- 
> 2.25.1
> 

-- 
Catalin

