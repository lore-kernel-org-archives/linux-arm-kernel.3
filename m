Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DF1CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOb0YWdrCyqRf70PqWxcCcSyY2RJrYltX6EkSx4+w3M=; b=0MMIh9gHzvyFGSXM2GYT6Qbp9x
	fBncJxunnia4PRY54sMwvVuA7RObrOR1poGU7aWrpPJx+jElKZ3MdTBOw714g3yZ5ML6p3oc0NT6D
	GcEvqJ/HBMZMmCLWgsxKfkdqPKk2eOaJ5Mo+FtDTY+tGDc+la/6BQ+055T0hqD8cLZP1PrQ76Tg6E
	ZW6gbTkP1MbYBK6Z+oae05fruWneW8E+u78xG+0euvEd8AViCG9YR24BDeyclWh9c0N6O9vTeJeKp
	ZjLDoA3tpPrcdqei0bjjsHGnxMmIlTD+NqsK1R1kWYjbOVZ0kvmFavvTlfB64yZE8nR0kbDNfakPA
	0fJkqFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwFz-00000005dIt-2dkZ;
	Tue, 09 Jun 2026 13:12:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwFv-00000005dIT-2jdv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:12:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490a78fbd7bso6635085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 06:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781010754; x=1781615554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOb0YWdrCyqRf70PqWxcCcSyY2RJrYltX6EkSx4+w3M=;
        b=UdRFt3XsgDSRyIa17PziTfVUr017/Ur7a+2dQmUFoPGQg1bP8G73duUKZ5ouHRguFo
         qNla7KNpoKROUyhsKy8O2X+OcCta8EV3gru+etb2SzS3SizF+Lo8rq72GyPsPiaGqLLY
         9eEh3zdgELULmvIVyOZggciH18CdpSLnBzSXXbl5hk1vSIJZ/dC9ENSHhHCJTdzBFEhV
         OJYWgNgM/DI98gUnDb1Pd5jhQC787lod4mP5yxXc/EBdKkXK7Dw1+CjMBMDiifLiVPS8
         Zoh413n36j2kWfC/VBpBwyZK2ZvmBrq+Ufnn5LA2s+9aaVEpdPQIpEs+wQtfO1FUd5Yn
         W5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010754; x=1781615554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOb0YWdrCyqRf70PqWxcCcSyY2RJrYltX6EkSx4+w3M=;
        b=l+sgPM1G+Ilv8aZyp1lcc2vRZm8zeYs0ENxYNIVYjaGz7KflhrfGxQ5pD9VR9lhwgU
         JQ+r0yzSGp3C1Wt0YqXp/U0urUI2xTLKn0r5t5kLUGzKNNpjt+tOQrkojIhv66eV1S9c
         Qk3DMxpM0l+W5BbbPwRY50Gou3NPBmSe+ccygEVH8L2W9mqWq3KaK24WqjvX9OckTnCO
         2pY31/zYyfdB0SMyNPjezs1CRQPKkwuHzGW2fg7Xh+AvdSndNr+FKgYL0BqW//n97071
         Wo2aLTE0S95ImYF/twnhiyPhu5BAAi2SkeHy4ysdroWX5VXUEyUCIrfuyXicQbn1Ga1a
         +q1A==
X-Forwarded-Encrypted: i=1; AFNElJ+U7E7G6HuW90BwjjK6fl60KrBSkDVzjnHPHLODIaXbUMa8Z9it3xtDuR2QMPyLlHdja+2/15qJ+H/WHon5uqae@lists.infradead.org
X-Gm-Message-State: AOJu0YxRQOwCFZR23zAGreSy2n2VeNC/5vEOMwWQ0KmNjvP6qc2ySB7+
	kcpuPdXFLbG9ZEZJ/md+3JcKX8LrPCIv9X9MvZB6DBLXA3AQDyT/ASJ5cPjm9Szgk/4=
X-Gm-Gg: Acq92OFgIoCBsH5OwUF8d9eLbFkCamRF0JfObs05VoV2KgiRI7ZOchseq49i/V03nG+
	LEFQNgevdTInNQJ93gRW1X6AJ95kpKg5XLQT7sogyMMjQAPaM7a2+K06sSrdlwg+pEQtAmIDfK3
	031UibP5XlvkSWlgJKgMuUjTdGyTL2hUTXoQw5wdRyYtn92urO8I1AWTaUU89BF8jxQFD/5y0u6
	YUA6KdUNVKKLakyjGspekTxjYLj32aRArAM3t1YaRDDHfoY2+GTWD+6SN7N3cb16MBawgeOMPRR
	811lxe9B8uoheIcNbxWDBP88wQM3xpqduitCP0t+Jv9o3BpUgmGmm76c5eJamws06RoRLJlSfpH
	q5TE5KJGixS0+I+XjZI5CmsTnz+3VYkg42hSfMq66tU8cW4KLw/NVDpAxhGLbJCLdoY8T0ejG1R
	tsyyL06HkKe4L1xt97p1qlyDQ=
X-Received: by 2002:a05:600c:8b65:b0:490:b4d4:5c16 with SMTP id 5b1f17b1804b1-490d72759f0mr16962775e9.8.1781010753634;
        Tue, 09 Jun 2026 06:12:33 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d69sm111677469f8f.29.2026.06.09.06.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:12:26 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:12:22 +0200
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
 <svens@linux.ibm.com>, x86@kernel.org, stable@vger.kernel.org, Michael
 Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 14/20] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <20260609151222.476a5521@mordecai>
In-Reply-To: <20260604083959.1265923-15-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-15-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_061236_092689_BF48C702 
X-CRM114-Status: GOOD (  22.31  )
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

On Thu,  4 Jun 2026 14:09:53 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Commit 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool
> helper") changed dma_direct_alloc_from_pool() to return the CPU address
> from dma_alloc_from_pool(). That fits dma_direct_alloc(), but
> dma_direct_alloc_pages() also uses the helper and expects a struct page *.
> 
> Fix this by making dma_direct_alloc_from_pool() return the struct page *
> again, and pass the CPU address back through an out-parameter for the
> dma_direct_alloc() caller.
> 
> Fixes: 5b138c534fda ("dma-direct: factor out a dma_direct_alloc_from_pool helper")
> Cc: stable@vger.kernel.org

While I totally agree with the reasoning and the fix, it's interesting
that this bug has been apparently present in the kernel for 5+ years
without anybody hitting nasty memory corruption bugs.

How can it be? Is the buggy code path never actually used in practice?
Does it hint at a missed opportunity to simplify the code?

Anyway, these these thoughts are intended for a possible future
cleanup. For now, let's apply the fix as is, of course.

Petr T

> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4e446aa4130e..e0ab9ff3f1d6 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -157,24 +157,24 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
>  	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
>  }
>  
> -static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
> +static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, void **cpu_addr, gfp_t gfp,
> +		unsigned long attrs)
>  {
>  	struct page *page;
>  	u64 phys_limit;
> -	void *ret;
>  
>  	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
>  		return NULL;
>  
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
> -	page = dma_alloc_from_pool(dev, size, &ret, gfp, attrs,
> +	page = dma_alloc_from_pool(dev, size, cpu_addr, gfp, attrs,
>  				   dma_coherent_ok);
>  	if (!page)
>  		return NULL;
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
>  					 !!(attrs & DMA_ATTR_CC_SHARED));
> -	return ret;
> +	return page;
>  }
>  
>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
> @@ -270,9 +270,12 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
>  	if ((remap || (attrs & DMA_ATTR_CC_SHARED)) &&
> -	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> -						  gfp, attrs);
> +	    dma_direct_use_pool(dev, gfp)) {
> +		page = dma_direct_alloc_from_pool(dev, size,
> +					dma_handle, &cpu_addr,
> +					gfp, attrs);
> +		return page ? cpu_addr : NULL;
> +	}
>  
>  	if (is_swiotlb_for_alloc(dev)) {
>  		page = dma_direct_alloc_swiotlb(dev, size, attrs);
> @@ -445,7 +448,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  
>  	if ((attrs & DMA_ATTR_CC_SHARED) && dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle,
> -						  gfp, attrs);
> +						  &cpu_addr, gfp, attrs);
>  
>  	if (is_swiotlb_for_alloc(dev)) {
>  		page = dma_direct_alloc_swiotlb(dev, size, attrs);


