Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842FC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngSI3Q4vIhFKWjmDx5jZEvBPeOv5VUXzzg0prABQgHM=; b=zf1VU4V58U0B6RU22lQhz0v6Up
	CcMayE2MflNogptCDqd5ZwFCNmEiWpDMGJVoU4htjqQ46A34AZeJqOkOyYaWxPifCdOdGnGvy15CB
	ZwBnNKiCdiEsDrBqtlDjukZTWLwYv8feLjXeTAtwtNaUgW+j3p2VbMI6IU02TNehTZk/ARndeyeQw
	mctQ1Tm8MvocTS/kMc6fixREKn/HHhVyUkF6truFxrVx7p84GHkBho5K2MdVHlCINrpf/AV9/p4mH
	5vTBPV88W8ZyzNd1PbHxNLSlg0RLOxmtMnf31aFSDu6fmBFdoeCAFULICGeHPDhHhlBBsL6gF0bmy
	XpUeCQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogWZ-00000005BJR-37Ai;
	Tue, 28 Jul 2026 12:03:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogWT-00000005BAU-2qHb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:03:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69293438D4;
	Tue, 28 Jul 2026 12:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230131F000E9;
	Tue, 28 Jul 2026 12:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240181;
	bh=ngSI3Q4vIhFKWjmDx5jZEvBPeOv5VUXzzg0prABQgHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kJT3l3QX0SOCL0bfIt294zpl70CdxnCDhs43jrRz5jlxB5zOfFptE41eAqWlCMn8B
	 pfsuwwn1vgSr2MObaC2UlPqlj6Z8RSdDJMA42cAiRnkYhLCquk0hvu1A5SLuRkKcwW
	 x0UAdTzr/a4HRssfbPQA0+RQV2Zgc+AShibCbTRQ4V7hBbUSCnwEjaLUKA6kkjcP4h
	 jJz7VDcmINqhx3QHd5Z+6FXUek2qTlnb2K9dGhL/ckYlVqgJxrLWngwxP1pnNqHWok
	 NcSA8mYorOqBkGj6uPp2dKvdujI5hjNkaFzA70ytIz0gRBiSDOwXiq5aVCYnVDZ/Jo
	 EdM1gq39lqYmg==
Date: Tue, 28 Jul 2026 13:02:54 +0100
From: Will Deacon <will@kernel.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, david@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, Wen Jiang <jiangwen6@xiaomi.com>,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v7 1/7] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
Message-ID: <amiabgyHSz3ZYY5k@willie-the-truck>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-2-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715120813.3609949-2-jiangwen6@xiaomi.com>
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

On Wed, Jul 15, 2026 at 08:08:07PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> we can handle CONT_PTE_SIZE groups together.
> 
> These additional sizes are mapping spans used by non-hugetlbfs(vmalloc)
> mm code, not new HugeTLB hstate sizes.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index a42c05cf56408..7ce159483a354 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -94,6 +94,11 @@ static int find_num_contig(struct mm_struct *mm, unsigned long addr,
>  	return CONT_PTES;
>  }
> 
> +/*
> + * num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte() can be
> + * used by non-hugetlbfs(vmalloc) mm code to set multiple huge mappings
> + * at the PTE level.
> + */
>  static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
>  {
>  	int contig_ptes = 1;
> @@ -110,6 +115,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
>  		contig_ptes = CONT_PTES;
>  		break;
>  	default:
> +		if (size > 0 && size < PMD_SIZE &&
> +				IS_ALIGNED(size, CONT_PTE_SIZE)) {
> +			*pgsize = PAGE_SIZE;
> +			contig_ptes = size >> PAGE_SHIFT;
> +			break;
> +		}

Under which circumstances would you get a size of 0 here?

Given that you're relying on arch_vmap_pte_range_map_size() to give you
a well-formed size, why isn't if sufficient to check only the alignment?

>  		WARN_ON(!__hugetlb_valid_size(size));

I agree with David that it's messy having hugetlb tangled up in here.
It means this validity check is now going to miss some genuinely bogus
cases for the hugetlb path (as opposed to the vmalloc path).

Will

