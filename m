Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A1CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7RbkRN3yZb2Hlv6o9dZUygfpvfrIaKIiCXYFA2pOLM=; b=TVnnZY4XuGvIH967gJy7pNtzCc
	T/LYjrT3CL7+uV5UZ0ct/bPQfBqEircsmiMDo8TjLGQr/kASzzHfxOC/4P85wZ0Gg9JaETbMQhAMz
	Q460rLAVGZLhlhOpFSkV1VzRvsrGZSZuQxRoVUNWDZyPCSC9Sv4JupqzEaJmfH6hua5LC4GOn78+d
	RbhJTq+6XGWpfg36YIhL4N0Pa6vEy8hHx5ZCRWyJvBAAV25fpHE32gi3JcvwywcybxiPZSbHZawWn
	laD2j65TIW3zkPuTKfUKZjNwPKsh1SeUHto9NzLHj/iA8WU5kXrG21lVbIrHb3Itdtr2/jES6bOy6
	AlRSgvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkhU-0000000F4Mb-3Vld;
	Wed, 03 Jun 2026 12:28:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkhU-0000000F4MR-0IsR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:28:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E23C560221;
	Wed,  3 Jun 2026 12:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2791F00893;
	Wed,  3 Jun 2026 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780489678;
	bh=M7RbkRN3yZb2Hlv6o9dZUygfpvfrIaKIiCXYFA2pOLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YniE05VOnZmg4pkXpu+yYNZSZ9ryY0GDjoSkbpJxvAE9HMQ1BBwOHejqcBxA+5NmU
	 Ruyxs7iBaTJe8yp/1QOmY7IoG1mepkhGvHdLkgLnJDD9gv3p8UO2BJBtJVUCfVhVOf
	 roAYR6dwN7YeppTly/aOCckZKRGHDne9gFnah+mDrgtIJ9kYx9JyxbTlHWvf2RMxBA
	 u3l2sEgVOZA2Xy9mgIRfvEdiT8+vXnjnv4JwbrQn/GSlNELQKFW8K4gXKshgfYBgKc
	 28bU34XIYLXU6jZ5SStyJ/2n6FynFlCiieTBepNrcbmIH8WdtSV8nXPfKNj/n+nY7F
	 GZHfk2l+GIAow==
Date: Wed, 3 Jun 2026 15:27:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	maz@kernel.org, aneesh.kumar@kernel.org
Subject: Re: [PATCH 1/3] arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
Message-ID: <aiAdyLKSRGjV4_r3@kernel.org>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603110522.3331819-2-smostafa@google.com>
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

On Wed, Jun 03, 2026 at 11:05:20AM +0000, Mostafa Saleh wrote:
> At the moment, arch_mm_preinit() checks if the system has limited
> addressing or is running under CCA to enable SWIOTLB, only after to
> be forced to true anyway if it was false due to
> CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC being unconditionally true for
> arm64.
> 
> Simplify this logic, by making it clear that SWIOTLB is always used
> but its size depends on the address layout of the system.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/mm/init.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 97987f850a33..fcc9c05a8fe6 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -336,25 +336,22 @@ void __init arch_setup_zero_pages(void)
>  void __init arch_mm_preinit(void)
>  {
>  	unsigned int flags = SWIOTLB_VERBOSE;
> -	bool swiotlb = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
> +	bool limited_addressing = max_pfn > PFN_DOWN(arm64_dma_phys_limit);
>  
>  	if (is_realm_world()) {
> -		swiotlb = true;
>  		flags |= SWIOTLB_FORCE;
> -	}
> -
> -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
> +	} else if (!limited_addressing) {

Can realm_world() coexist with limited_addressing? Then the size adjustment
is still required.

I'd also make this more explicit:

	if (max_pfn > PFN_DOWN(arm64_dma_phys_limit))

>  		/*
>  		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>  		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
>  		 */
>  		unsigned long size =
>  			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
> +
>  		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
> -		swiotlb = true;
>  	}
>  
> -	swiotlb_init(swiotlb, flags);
> +	swiotlb_init(true, flags);
>  
>  	/*
>  	 * Check boundaries twice: Some fundamental inconsistencies can be
> -- 
> 2.54.0.1032.g2f8565e1d1-goog
> 

-- 
Sincerely yours,
Mike.

