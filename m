Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A808CC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coBQCYguauEUFlE+zRehCazJ7YtpgsT9g1InCofXSTM=; b=Io9w0Fuhzkalq7baSuGgTCVNwO
	bK8LmBPT5F2hUr11hlgTdoM5YM+UB+Eu7Wch6pXqlbx6kWXjDXTTZaTJOvisXB+oeaM263A6fOV2v
	nrwBqK0wjLeRc4C8dGsOp6wh9EacF7PMuFVWtIVIS8cSsAt2vWOsI0jzkaZSiwVHr0VXsU02l4ZAA
	GpeUwcfYF+bOhjhD/DYtslm/u1UI9vcD+sm6ScYSRlJXCFCW9ii0MLE+7qagIJpX8b3utT/O149Te
	+NGi2Y6SZOnAKcQRzuPqnLYbrlfPBfxYGqVVg75KN9Pdn66+GYJJ2lMKcpcXwHmSAcq0t1JpoKz9O
	vXlHZImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogcP-00000005CNE-0aHK;
	Tue, 28 Jul 2026 12:09:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogcK-00000005CMp-2g8M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:09:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 164A9436F6;
	Tue, 28 Jul 2026 12:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BC31F000E9;
	Tue, 28 Jul 2026 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240544;
	bh=coBQCYguauEUFlE+zRehCazJ7YtpgsT9g1InCofXSTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eGXgV9YQEy+iglnVsOeKzzWKZ51pMguT48dsQ8WNzvcPPyWqhIhse1zFPQy9NWsIF
	 qR86lFypyCG8ra+bC1hW5gF+wH7jsWK+lPfg1wkaIotLjtodukmtZKhhq2BTpfMRqr
	 b6nawRofbM/q0NSkooh8JKp2tFvaigsqZ+dWMTjlIt4LBQNzlxyMoGVcVH690kopwH
	 UgyTOkip3FZucPLm+wg1g8QucTaKogZr3lUhBbGPAfFYJhINOM6jVtCQ2tdXv4+/ye
	 7aVrMzkj2hvtxI5Ig/pW5pIHk/4IhA3fmIR44zXT3CU1PIARgFC1Qbfu4pB2rE1PtI
	 aWsWTI5hPg5ig==
Date: Tue, 28 Jul 2026 13:08:57 +0100
From: Will Deacon <will@kernel.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, david@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, Wen Jiang <jiangwen6@xiaomi.com>,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
Message-ID: <amib2d8um2ZwsMDU@willie-the-truck>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-3-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715120813.3609949-3-jiangwen6@xiaomi.com>
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

On Wed, Jul 15, 2026 at 08:08:08PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
> blocks, reducing both PTE setup and TLB flush iterations.
> 
> For CONT_PTE_SIZE-aligned ranges, return a power-of-two mapping size that
> may cover multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes
> are vmalloc mapping spans, not HugeTLB hstate sizes.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 4ec1acd3c1b34..d665f9d687422 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  						unsigned long end, u64 pfn,
>  						unsigned int max_page_shift)
>  {
> +	unsigned long size;
> +
>  	/*
>  	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
>  	 * aligned in both virtual and physical space, then we can pte-map the
>  	 * block using the PTE_CONT bit for more efficient use of the TLB.
> +	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
> +	 * capped below PMD_SIZE.
>  	 */
>  	if (max_page_shift < CONT_PTE_SHIFT)
>  		return PAGE_SIZE;
> @@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>  	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>  		return PAGE_SIZE;
> 
> -	return CONT_PTE_SIZE;
> +	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
> +	size = rounddown_pow_of_two(size);
> +	return size;

Why does this have to be a power of two? We should be able to work with
regions where the start and end are suitably aligned. Is it because the
hugetlb code works in terms of shifts?

Will

