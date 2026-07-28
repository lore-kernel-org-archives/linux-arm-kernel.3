Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CA8C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCZrUOE9kwIF4hUfSxEIdPGLi7SYMbxXEbVOya3wkPE=; b=I1SU29Ryg1/P+zJrDMybTZhp3V
	AHWNT5Gz2uPdBZcZLtEnq1In9QA9b8CeL9UZLpHoy6Bn1MUVU7tx538DS4dpXg52Wi7EAsyFOiup6
	hiO7/mYno632ABIKFa4K0/RVnBewh7IqqAZ0iEAP5cR58/XqJCiq3qpIqEZ70ZAmXdak4BXK+N7N1
	h570ksQukPP7mQO558rPywKpbQ9AzCrNNtdeh6SUSIXz7HeuRGbQalZcN8GIH3+LixrL4i1qIsxkD
	yIG3C3lqg/ec4C/MPILeaX/a2QlEZRppIfwo3dH85XEPPqw3bWK3siUApgQUmJSj1d0vKop8ryq0v
	fOSJw0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woj02-00000005X9l-0QaI;
	Tue, 28 Jul 2026 14:41:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woizz-00000005X8l-2fqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:41:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-495509b08ebso51265e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785249698; x=1785854498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JCZrUOE9kwIF4hUfSxEIdPGLi7SYMbxXEbVOya3wkPE=;
        b=K1HnoQ2pVHZWHBANb+5k6ycw9+cSoAab+akAXLbfnynIHVfG6W2KB8VZSo/KT2Nibg
         b/Er8NvULWvqalODjKAEGJFpR5hbQbrq3d3Etg1CYMbyZDVIC1cZhKljLCPKMSN5M0Ib
         CmAxRnqIeRBnYFYHbRJYLKz9MbKM5m9sRwqkMx77QhHn0TlbMPmxSsX3ctNY/7HuKf9d
         bwo+QjJsLOKDB2VA0ppjr9PvYcIBi/l69rnnoX1K6OXtiBGENi95Y+pGRw7VnMOeLduU
         bMQJlnxMZJZgCFCEz5Xu/8st5SR7QDCc0/cat26IJ7A4vVNumgZDZhJd4Ifvsl2lUQUc
         RpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249698; x=1785854498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCZrUOE9kwIF4hUfSxEIdPGLi7SYMbxXEbVOya3wkPE=;
        b=IdlTaibM9m1T6EqODIXM8SdO0ZXDuP0ncRILqespsqeHI+FmkMKzt7DbYGYqe5VG9P
         ZXU59Yeo3ErAl3KGMPN90HaCH/uONP5HpSM1cWhqWoj8RH5b1deJ9O5nMsP549N/S3D3
         0fYKP31q2suWwRik0ydigBCwk1YtTs5usUH3pM+tegl4RsxselTFo2tUCD4IYdcg5BpF
         s2yYd+4znY0A1Za5YL1gOKGU3td31yWIzXyv2OLlLhcaOSrDRYZU6u/+YLEOo0VAzaJn
         /eTuxZ6aamZo68zuHC5niUyeb0PT9510mQ5C19gF+pLf0a0Ab/qUBKBihf+yA2XQKrnn
         t15A==
X-Forwarded-Encrypted: i=1; AHgh+RoVDGoCYhrQ+XLVnK0eT1dBZYwl+dcUi8U2Lzdy4Y6DB/9BDglyxIfiHtwMj51mwc3WY4UXglNsP7YYjS5v9okh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr10pG3BgouzqNo7w17+qHv+V1m/NgujlPat9ExGTnzHKu+6Og
	3l9dWvYeI/JwRKPVC0ikMo5d9Lp49M3VKWYNYUO5HOKPL9LzJBDK/MRvWzzIWIf2kQ==
X-Gm-Gg: AR+sD12zpW//6Eq55SPdtlBRXLom4mLF5D3Pun1Dyd8Ig+zyi6YfUaI9+19LW+CeaXT
	HAF1cZvVD6He0NaJwf7nkWol+h8HpF0pPBIytKBfXiU2m24nc46mpNtsmcxoPCd+Tu3N5QCA+2G
	LJzbFvVgDiYCdrN9/HtLLdw1jIJTaBU9fc6I9ZZK+1iokWwSFhIauF4bXac3Ty68Dc+dTWtHnPu
	sSfNDrbC35h1zpui01JtlkEChO04Rk46U1sudu1mclzYwy0Lbx+YvVyxWYFNKsz/RJdKizrYRcG
	NkUF05uPGKnjzn4CsYfrI7/cpu5utVGNScqZWm4UbFGsqFPd63qzLmKEI+l62ljjMhreVNEDcOb
	KvddS1qXX9lE/t61RjatuYuqptx18QBxcknqsB3yX4RLRpxkIsoNA7VlaFMVvNYYHseb6IxLXvt
	cWCY5fO3/PYIGqGhWbs/TMxnHKXh63CJlyA/Ch6paRcmc=
X-Received: by 2002:a05:600c:528c:b0:490:ab15:b9e8 with SMTP id 5b1f17b1804b1-496b944f535mr5111045e9.2.1785249696887;
        Tue, 28 Jul 2026 07:41:36 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c338fsm83874795e9.8.2026.07.28.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:41:36 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:41:30 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 12/23] dma: swiotlb: pass mapping attributes by
 reference
Message-ID: <ami_mpd_1pF4Tmdu@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-13-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-13-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_074139_713773_D5B8E4A8 
X-CRM114-Status: GOOD (  24.47  )
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

On Fri, Jul 17, 2026 at 11:34:30PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Change swiotlb_tbl_map_single() to take the DMA mapping attributes by
> reference and update the direct callers accordingly.
> 
> This is a preparatory change for a follow-up patch which updates the
> attributes based on the selected swiotlb pool. Keeping the signature change
> separate makes the follow-up patch easier to review.
> 

I do not understand the point of this, why would
swiotlb_tbl_map_single() force attrs over the caller which should
already know the context (whether DMA is shared or not) which case
would this be useful to force from the SWIOTLB code?

Thanks,
Mostafa


> No functional change in this patch.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  drivers/xen/swiotlb-xen.c | 2 +-
>  include/linux/swiotlb.h   | 2 +-
>  kernel/dma/swiotlb.c      | 6 +++---
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 83bf15ae9777..c42e40e60575 100644
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
> index c92ff6791595..ea4c0a292dea 100644
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
> index 908de28aceb2..046ae92c4832 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1396,7 +1396,7 @@ static unsigned long mem_used(struct io_tlb_mem *mem)
>   */
>  phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		size_t mapping_size, unsigned int alloc_align_mask,
> -		enum dma_data_direction dir, unsigned long attrs)
> +		enum dma_data_direction dir, unsigned long *attrs)
>  {
>  	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned int offset;
> @@ -1430,7 +1430,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	size = ALIGN(mapping_size + offset, alloc_align_mask + 1);
>  	index = swiotlb_find_slots(dev, orig_addr, size, alloc_align_mask, &pool);
>  	if (index == -1) {
> -		if (!(attrs & DMA_ATTR_NO_WARN))
> +		if (!(*attrs & DMA_ATTR_NO_WARN))
>  			dev_warn_ratelimited(dev,
>  	"swiotlb buffer is full (sz: %zd bytes), total %lu (slots), used %lu (slots)\n",
>  				 size, mem->nslabs, mem_used(mem));
> @@ -1609,7 +1609,7 @@ dma_addr_t swiotlb_map(struct device *dev, phys_addr_t paddr, size_t size,
>  
>  	trace_swiotlb_bounced(dev, phys_to_dma(dev, paddr), size);
>  
> -	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, attrs);
> +	swiotlb_addr = swiotlb_tbl_map_single(dev, paddr, size, 0, dir, &attrs);
>  	if (swiotlb_addr == (phys_addr_t)DMA_MAPPING_ERROR)
>  		return DMA_MAPPING_ERROR;
>  
> -- 
> 2.43.0
> 

