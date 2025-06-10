Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D534C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW7fEA0/+GCy2w4JQMTEby+P0Mr8y+F/kZw1UCiIKt0=; b=yGp2rw4EH8N/bwwa0SY6RBMOiS
	vPkX/kPF0Gdrmk/0XupsX5sne6VhjisEYTqOQ4OTlkSM3DXdA3+yFRIvvyEOD3G/HUQZamhrK0NGa
	95zEZ9NZDOQm3xVthOe8JoMNvNnk/VuTOwqrZksZ+B+wk2uu8RpgdadKSgv1zvoxkXjtx5bk8rQMW
	vtVR3B1Hv24m5P4pAfcCInXRfyT4vnexMaL+16gcaZI2Bde5J597tqWvWJcU2awCDeUyfEbIercip
	VGRm9xMan8wXn68f12Xes/JoZAhnM8BUmVxhQMfN/GP+tg/PomnZ4NGz44+2i/7BhQgYQWpf4lQdg
	oN4xJ0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lD-00000008EdT-0dnF;
	Tue, 10 Jun 2025 22:48:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2Uo-00000007aD3-1F8A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F7F1A514F6;
	Tue, 10 Jun 2025 17:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554CDC4CEED;
	Tue, 10 Jun 2025 17:10:43 +0000 (UTC)
Date: Tue, 10 Jun 2025 18:10:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH RFC] arm64/mm: Lift the cma address limit when
 CONFIG_DMA_NUMA_CMA=y
Message-ID: <aEhnELJQLw8S8Bho@arm.com>
References: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521014701.73046-1-feng.tang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_101046_401208_943C1AA7 
X-CRM114-Status: GOOD (  25.01  )
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

On Wed, May 21, 2025 at 09:47:01AM +0800, Feng Tang wrote:
> When porting an cma related usage from x86_64 server to arm64 server,
> the "cma=4G" setup failed on arm64, and the reason is arm64 has 4G (32bit)
> address limit for cma reservation.
> 
> The limit is reasonable due to device DMA requirement, but for NUMA
> servers which have CONFIG_DMA_NUMA_CMA enabled, the limit is not required
> as that config already allows cma area to be reserved on different NUMA
> nodes whose memory very likely goes beyond 4G limit.
> 
> Lift the cma limit for platform with such configuration.

I don't think that's the right fix. Those devices that have a NUMA node
associated may be ok to address memory beyond 4GB. The default for
NUMA_NO_NODE devices is still dma_contiguous_default_area. I also don't
like to make such run-time decisions on the config option.

That said, maybe we should make the under-4G CMA allocation a best
effort. In the arch code, if that failed, attempt the allocation again
with a limit of 0 and maybe do a pr_notice() that CMA allocation in the
DMA zone failed.

Adding Robin in case he has a different view.

> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>  arch/arm64/mm/init.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index b99bf3980fc6..661758678cc4 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -312,6 +312,7 @@ void __init arm64_memblock_init(void)
>  void __init bootmem_init(void)
>  {
>  	unsigned long min, max;
> +	phys_addr_t cma_limit;
>  
>  	min = PFN_UP(memblock_start_of_DRAM());
>  	max = PFN_DOWN(memblock_end_of_DRAM());
> @@ -343,8 +344,14 @@ void __init bootmem_init(void)
>  
>  	/*
>  	 * Reserve the CMA area after arm64_dma_phys_limit was initialised.
> +	 *
> +	 * When CONFIG_DMA_NUMA_CMA is enabled, system may have CMA reserved
> +	 * area in different NUMA nodes, which likely goes beyond the 32bit
> +	 * limit, thus use (PHYS_MASK+1) as cma limit.
>  	 */
> -	dma_contiguous_reserve(arm64_dma_phys_limit);
> +	cma_limit = IS_ENABLED(CONFIG_DMA_NUMA_CMA) ?
> +			(PHYS_MASK + 1) : arm64_dma_phys_limit;
> +	dma_contiguous_reserve(cma_limit);
>  
>  	/*
>  	 * request_standard_resources() depends on crashkernel's memory being
> -- 
> 2.39.5 (Apple Git-154)

