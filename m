Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D0FCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y47BTKkIONM0+RQeKdRPDrTRuu7HqPM7iSbtp8PzT1o=; b=PXFqdi3K24ToLZXqvzJMaPJr72
	w7H1QkeIACtMWK69HeeS+WWzxHsZs2hcnhHa5GR9lRmzUKWpea8IRdxLojRRUvxH0X84hkU34rtmA
	MN99rrnNyDfCQ1OAde91muqYJ8Wi7rk8XeXnnIKvJsN00c03AwTpWvMM+duoLKkHDe6SwkZDA1BOz
	JiV6Pyx4eG2/X9V/7/5OyJ6vAerEdhnojxJMkfCWWOL6Bc9FnLEv53p3TokVsHRRnDL6yt8J6xE3S
	MpVlEVjlepl05xYkYmhML6UwDILgt1jQqcLodTMT06R14auz61cufi947BEpKTMuWEaJXZ873dAgi
	U9RJcdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvSf-00000005W6G-1fWt;
	Tue, 09 Jun 2026 12:21:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvSc-00000005W5R-0zU1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:21:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ef4332d89so339913f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781007696; x=1781612496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y47BTKkIONM0+RQeKdRPDrTRuu7HqPM7iSbtp8PzT1o=;
        b=VygjzUOsS4Okp3EtQo99GlUnewr/rCeB41VKJY8TYTRhMsR9cpZrloxQNNBs3Z+FFn
         4SQ9K4SpJQJES1ChO45R2E804X+KySb00LpAHZPQzNGtufujbcekd3mECM9PoYHInuTC
         xTu9QIkTRPdeE58kiO606IQR+WxKz5GxgYG0+RM/kZd5XdHU3Rf+b3bYaM/DR8stWxQZ
         8dyPVpNIP2WnmOn4VuiFXod0Snpir+/hKNktBKj4DOQ3Oajj2aRgcz0EYpfC4b0fVnFZ
         QdBK8b25Un9nAoGD3kVCY/1AqxJ/t0t9DFllmH+FlG++CNjYDegNT664Uj+s0nBPLFhR
         t/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007696; x=1781612496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y47BTKkIONM0+RQeKdRPDrTRuu7HqPM7iSbtp8PzT1o=;
        b=TLdBUZD/NASh/T4Go/QsP3QUN9Xn3cK6kywUEO/TaHllI2D1YMXwUpWYE4JDt7AY/c
         vI6Si6LZjNFtvQ6pkyKpakmiVxpuB2JZsW0v6mgQqc8n1hoh6NcwYcAT6brmwCum4PZq
         OSCk5pKcyKSZH/QqUUwDDycPm6fd2iOhVWvSUbDgU1s/6r4tkJ+mckS7hjsOJHGxNJIZ
         xVYn8DXSqHhC+7qlySLUdj6I22+mLBjIAazVVwtwI0invQOsaYpgwQFkPPl31ZGhUmyT
         Jqg/ZsSx8EhT/Mrx4vNdYdhsyLOi6qhL1lHfS6KCNv3FQBm6DbPdLw78e7WUgV5Y8Lg3
         ik+w==
X-Forwarded-Encrypted: i=1; AFNElJ/tI0Kphu4uv9Q3ZX+8cx4ZoRH3DLUQ6p90kBqCT0ygncRWrlP2MKNJmtSjVyxhpagvYuXL1MZ26fgLv0XYeujF@lists.infradead.org
X-Gm-Message-State: AOJu0YxzFohxjGe4lDlaiPmaRcoizhmmnlPmfk+hVVZgwakNKb2c+8oH
	40STfMLv/nighwcIDyxLbEoe6bsW43F+vDHUV70aPG4S030aFZgMCXxY49yuWFkDn7Y=
X-Gm-Gg: Acq92OEhXqdgpcNIkl8A18eAYqry4QFA8Kj31DUVuO2yTSefuzUBmGbM84mfvjSxDuH
	3jaxUaMunOBUafjfzPhCCFsQiMucaesPNndFi6PYU+lio+cRtHzfm3vqHLZVk+CEMeYtnGlxrfA
	8KKvgUa7QjYr4vvUrArXDfy0SsTeUhJ9tJtdIohaQRy3tu/tz/4Uzx6mE9y6sR4vx2vRoVQSGlg
	2v4Stjl9NHiAWDz/1pjLmqFVNY4oFoPyUCrJqjGRuOo8NI/+Qm5lr3WWcq6jE5gEzi/CUSHrw0S
	xk40/7YaHF62YHAPXcMmNOBoESGyCjDEJ9l45/mnAk8fpbCtKKd7alad3v8bfjTYk2ylnQM61TT
	I5EAgnB7fmsxOAq5QXxyzRnbiw/U060zuGSHRNCPIkkDOCiDSaW4FRi3nPp7oywsdf+h6HdWo8c
	yZSXcyRJYJ7JfbxV4e2/E4udE=
X-Received: by 2002:a05:6000:1a88:b0:460:11ac:d58 with SMTP id ffacd0b85a97d-4603064331fmr16626567f8f.3.1781007696224;
        Tue, 09 Jun 2026 05:21:36 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ec711sm60125048f8f.12.2026.06.09.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:21:35 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:21:22 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
 <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Will
 Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Steven Price
 <steven.price@arm.com>, Suzuki K Poulose <Suzuki.Poulose@arm.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Jiri Pirko <jiri@resnulli.us>, Jason
 Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Alexey
 Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
 Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, x86@kernel.org, Michael Kelley
 <mhklinux@outlook.com>
Subject: Re: [PATCH v6 05/20] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <20260609142122.7e721621@mordecai>
In-Reply-To: <20260604083959.1265923-6-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-6-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_052138_731559_DC02F05D 
X-CRM114-Status: GOOD (  21.63  )
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

On Thu,  4 Jun 2026 14:09:44 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> reference and update the direct callers accordingly.
> 
> This is a preparatory change for a follow-up patch which updates the
> attributes based on the selected swiotlb pool. Keeping the signature change
> separate makes the follow-up patch easier to review.
> 
> No functional change in this patch.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Thanks
Petr T

> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  drivers/xen/swiotlb-xen.c | 2 +-
>  include/linux/swiotlb.h   | 2 +-
>  kernel/dma/swiotlb.c      | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index c2595bee3d41..725c7adb0a8d 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1180,7 +1180,7 @@ static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
>  	trace_swiotlb_bounced(dev, phys, size);
>  
>  	phys = swiotlb_tbl_map_single(dev, phys, size, iova_mask(iovad), dir,
> -			attrs);
> +				      &attrs);
>  
>  	/*
>  	 * Untrusted devices should not see padding areas with random leftover
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2cbf2b588f5b..8c4abe65cd49 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -243,7 +243,7 @@ static dma_addr_t xen_swiotlb_map_phys(struct device *dev, phys_addr_t phys,
>  	 */
>  	trace_swiotlb_bounced(dev, dev_addr, size);
>  
> -	map = swiotlb_tbl_map_single(dev, phys, size, 0, dir, attrs);
> +	map = swiotlb_tbl_map_single(dev, phys, size, 0, dir, &attrs);
>  	if (map == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 133bb8ca9032..29187cec90d8 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -238,7 +238,7 @@ static inline phys_addr_t default_swiotlb_limit(void)
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
>  		size_t mapping_size, unsigned int alloc_aligned_mask,
> -		enum dma_data_direction dir, unsigned long attrs);
> +		enum dma_data_direction dir, unsigned long *attrs);
>  dma_addr_t swiotlb_map(struct device *dev, phys_addr_t phys,
>  		size_t size, enum dma_data_direction dir, unsigned long attrs);
>  
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index be4d418d92ac..78ce05857c00 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1391,7 +1391,7 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
>   */
>  phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		size_t mapping_size, unsigned int alloc_align_mask,
> -		enum dma_data_direction dir, unsigned long attrs)
> +		enum dma_data_direction dir, unsigned long *attrs)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned int offset;
> @@ -1425,7 +1425,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	size = ALIGN(mapping_size + offset, alloc_align_mask + 1);
>  	index = swiotlb_find_slots(dev, orig_addr, size, alloc_align_mask, &pool);
>  	if (index == -1) {
> -		if (!(attrs & DMA_ATTR_NO_WARN))
> +		if (!(*attrs & DMA_ATTR_NO_WARN))
>  			dev_warn_ratelimited(dev,
>  	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
>  				 size, mem->nslabs, mem_used(mem));
> @@ -1604,7 +1604,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  
>  	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
>  
> -	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, attrs);
> +	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, &attrs);
>  	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  


