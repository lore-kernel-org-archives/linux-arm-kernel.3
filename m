Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA10CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL0mSwKKFxekVSvkxHXaDoFzIgy3cAiSnzxZ+KTB+U0=; b=SZBcWC3gsn169kVJfG8lW/0abv
	LhwEnh3KMIqGWGKS9Qs+EFh7tvgueG9U4jZG+WB5n6FqKRls0tGTN0BDl602QIq3J5/xGcb3mFVse
	wsJhmxeckLhfVISoV7+HPDVdiqQHdXuu+6B0krHXsaO2g9hPGZossvP3+vsWImV6LFZDCqVaWHkEg
	cgaDJB1hBCOnHRvwIEFAIThjdcUf4ehaXGhQVdA/q2PqhLMIMrc1tr7UVG2DNFx1GFezwKDFs0h1i
	/vR+sVykUWHXCQEcXIA23aVJdYnHytbPXI6DuXJ4eUye2VGHEP67KzHU6nAfE8n8WYciQvYBZrxGG
	NY+HjlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbul-0000000AvGt-2zlk;
	Thu, 13 Nov 2025 18:19:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbuk-0000000AvGn-2N6w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B986360127;
	Thu, 13 Nov 2025 18:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39FAC4CEF1;
	Thu, 13 Nov 2025 18:19:18 +0000 (UTC)
Date: Thu, 13 Nov 2025 18:19:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Barry Song <21cnbao@gmail.com>
Subject: Re: [RFC PATCH 5/5] dma-mapping: Allow batched DMA sync operations
 if supported by the arch
Message-ID: <aRYhJO9_eR9W-EnZ@arm.com>
References: <20251029023115.22809-1-21cnbao@gmail.com>
 <20251029023115.22809-6-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029023115.22809-6-21cnbao@gmail.com>
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Will Deacon <will@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, Barry Song <v-songbaohua@oppo.com>, Marc Zyngier <maz@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 29, 2025 at 10:31:15AM +0800, Barry Song wrote:
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 1f9ee9759426..a0b45f84a91f 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -403,9 +403,16 @@ void dma_direct_sync_sg_for_device(struct device *dev,
>  		swiotlb_sync_single_for_device(dev, paddr, sg->length, dir);
>  
>  		if (!dev_is_dma_coherent(dev))
> -			arch_sync_dma_for_device(paddr, sg->length,
> -					dir);
> +#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
> +			arch_sync_dma_for_device_batch_add(paddr, sg->length, dir);
> +#else
> +			arch_sync_dma_for_device(paddr, sg->length, dir);
> +#endif
>  	}
> +#ifdef CONFIG_ARCH_WANT_BATCHED_DMA_SYNC
> +	if (!dev_is_dma_coherent(dev))
> +		arch_sync_dma_batch_flush();
> +#endif
>  }
>  #endif

Just a high-level comment for now. I'm not opposed to the idea of
batching the DSB barriers, we do this for ptes. However, the way it's
implemented in the generic files, with lots of #ifdefs, makes the code
pretty unreadable.

Can we have something like arch_sync_dma_begin/end() and let the arch
code handle the barriers as they see fit?

-- 
Catalin

