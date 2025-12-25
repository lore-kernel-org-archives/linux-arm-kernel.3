Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3F8E7AD43
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52OMyis1hK3e8tyxRKg13XnUv2UzYGhF2+CoNDgnfxk=; b=BbfUCdXtJ3DPYwsBY2Rkv2buID
	4Fr4af6jKFSjW8n6bRH6YISFjvCOmQMLXekknCT9Us0doSQGx7nP9TMQ5DKPRycsOeH4tbWByNY8c
	nrfc9DAmoP8XFN6YNev8BuzvysoR3n1+OVBsCpx2Ja69pk2DvGRTCLNk+y2rv5k7tPmY0aC1h7Xb9
	mXlTacheG7X5Z688VRfxCy2C0NBEjMxupcxqkamfzGkACvjSLZUOo4pQKRSWqlDGTxl7mIGVqgQSX
	LqyjYOfa5JBPuneTLCYdGFY5zykuF3OS5u6t1FeqlOg0Q7ANSgLjuOC0viOZGgnCdFFZHzAylzKMt
	BdE4IvKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYkaU-00000000PDD-0SIl;
	Thu, 25 Dec 2025 12:37:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYkaO-00000000PCk-3iE6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 12:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 804AE43982;
	Thu, 25 Dec 2025 12:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC11C4CEF1;
	Thu, 25 Dec 2025 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766666215;
	bh=WzoONx4GwRY0HIt+QGBq0NrV6ZYzdLYx41h6bExqSyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GH64681eyxF/5e2195mhPnPO3YGodiwCuyr6x+WjMJS2vhlRlwCZ0KBL5qyx0ZzZN
	 uMqLbqEY7wyKIKJ34IM/sKcD2GND2sPGJqtihi1U7olo/bB6RcVON7wqml+zGVjX+f
	 FMRgavhp0mrbhVKMf7UEdZxhcwWx5RkcaBa01Dgzdj+8Yb1IbV0q2ED/F3s5wSAWhx
	 la9VBLsEhLqKRATnzaYYi4QGqE+tIcoKnJzW/bXb0hAZR1/SRFYgy35lUZo/AK6sLi
	 SO3MQstr7qy5yT4mBaNueQTsVGINVdFwy92Vmkzk/tJO0dLya093ww8C3lErecBdMf
	 4twp/pZ1CFIug==
Date: Thu, 25 Dec 2025 14:36:50 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [PATCH 5/6] dma-mapping: Allow batched DMA sync operations if
 supported by the arch
Message-ID: <20251225123650.GJ11869@unreal>
References: <20251224085145.GF11869@unreal>
 <20251225054509.39917-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225054509.39917-1-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_043657_022570_7B667395 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, will@kernel.org, anshuman.khandual@arm.com, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, surenb@google.com, iommu@lists.linux.dev, maz@kernel.org, robin.murphy@arm.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 25, 2025 at 06:45:09PM +1300, Barry Song wrote:
> > > >
> > >
> > > OK. Could you take a look at [1] and see if any further
> > > improvements are needed before I send v2?
> >
> > Everything looks ok, except these renames:
> > -                       arch_sync_dma_for_cpu(paddr, sg->length, dir);
> > +                       arch_sync_dma_for_cpu_batch_add(paddr, sg->length, dir);
> 
> Thanks!
> I'm happy to drop the rename as outlined below-feedback welcome :-)
> 
> diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
> index dd2c8586a725..487fb7c355ed 100644
> --- a/arch/arm64/include/asm/cache.h
> +++ b/arch/arm64/include/asm/cache.h
> @@ -87,6 +87,12 @@ int cache_line_size(void);
>  
>  #define dma_get_cache_alignment	cache_line_size
>  
> +static inline void arch_sync_dma_flush(void)
> +{
> +	dsb(sy);
> +}
> +#define arch_sync_dma_flush arch_sync_dma_flush
> +
>  /* Compress a u64 MPIDR value into 32 bits. */
>  static inline u64 arch_compact_of_hwid(u64 id)
>  {
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index b2b5792b2caa..ae1ae0280eef 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -17,7 +17,7 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>  {
>  	unsigned long start = (unsigned long)phys_to_virt(paddr);
>  
> -	dcache_clean_poc(start, start + size);
> +	dcache_clean_poc_nosync(start, start + size);
>  }
>  
>  void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> @@ -28,7 +28,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  	if (dir == DMA_TO_DEVICE)
>  		return;
>  
> -	dcache_inval_poc(start, start + size);
> +	dcache_inval_poc_nosync(start, start + size);
>  }
>  
>  void arch_dma_prep_coherent(struct page *page, size_t size)
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index 4809204c674c..e7dd8a63b40e 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -361,6 +361,12 @@ static inline void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  }
>  #endif /* ARCH_HAS_SYNC_DMA_FOR_CPU */
>  
> +#ifndef arch_sync_dma_flush

You likely need to wrap this in "#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FLUSH"
as done in the surrounding code.

Thanks

> +static inline void arch_sync_dma_flush(void)
> +{
> +}
> +#endif
> +
>  #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
>  void arch_sync_dma_for_cpu_all(void);
>  #else
> 

