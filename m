Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41A7C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXqe2wlo2yiPOh072n71Jij5i60MC3cIjM/IN/S3eis=; b=RVyF177/lPdrMSD0Sm+Hwi/otP
	ToIJgCwrMReh7aUzYaOJFDh4naW/h58yG4VdYQ1CExEHMK++IL9yoQ9L/kl0+6rNu3Ikmu+pksEco
	ZOUlrZx1jZ6XJjEz/e9gKzoXG2slhsMbnR1RNfo3msIpodynsObU65qx5PUnOAtWBWAmLT8OGg3/t
	3v/f4LKEOMSPfh5u3oPM/Vfr6dFGKKBO8Co11boxzmMeBEr1G4u7Pkbjnmb3oSsoVSilVw03og8C0
	419zMzjCa8n7OCous826QqESmKOVcwo/YsLZE2AbSoz5+jiwPVeXbA3MGOyTynaDhjUHJuntcSEfK
	Z4dHCqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiqn-00000005VcM-0DBa;
	Tue, 28 Jul 2026 14:32:09 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiqK-00000005VTw-1u4N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:32:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-495509b08ebso50185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785249098; x=1785853898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXqe2wlo2yiPOh072n71Jij5i60MC3cIjM/IN/S3eis=;
        b=G46hoDEFzXFnqs4PCwPvsOfAqzS5Pnx6Kp+0TnEzQ3x2ybJoWCvnY4Mnxni1pPe+nD
         hvSpr4xjfYIBUDTfwJWRJFMIf5jH5Nhus8wZdeTRcAsgg044fvdK94XbKwQ5FqCwnf/W
         6eX2tsaEhsQyBzIRz+4VUYvAds0/Rr0ITAXHVRm0lV6ayvuSwKoSmwy3hnGMGQQc0DjW
         cEtHlqJnOz+IkfHpFicGnbto7Y/DwJjBgXlbHzF5egRY8mKTjgGhjPt7S3hOTIR0t1o0
         yLJFB//87rBOnaOYbP6xz3jw1p0FautGXV2swEViaHZgpAuTfxgTsH4py1wPEVy1unpd
         eH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249098; x=1785853898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXqe2wlo2yiPOh072n71Jij5i60MC3cIjM/IN/S3eis=;
        b=cuRR/9opeXDJmQnUJxIuThK7QkC90fePgzloI8jOCjyHjbmrboXaD88KbCJXrroSGZ
         nHXC+/ZYS7oxbHcY4xdkO9eHB2n8a0+mezM/qWXZfDlFYLozH11bFqkgso075pyKi6g5
         8dsxN1EYhObQtLguP34jQwNhxFQ2t+ZlnJXdAEQxu6Xo158YCs6bH9+pPs/UTSBTLMP8
         qHY6OgusOftxvDN0+T9c3+tOGTet9kXeqsH7VcSOk4k2GjKcU5vMHrpx8JLjcRmcXPyf
         nomZkBOf51BdPJEv2DF1X6mPjRNwevo8ggtDiGTjgFgrWOws8usiA/HBiaAP7dM4gNL/
         rrVw==
X-Forwarded-Encrypted: i=1; AHgh+RpQi1HR1HFg31j/9ipQij9wuzho0nNhLcXl4f4TnVlF+RO9izs5xhYm4gAC1AblZHgYt3uHYPAL7kABeRl+E3id@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc84rblovdI4WJTIhFn6bIEwNpnk/qSbfpMBTLYWiIdKOcVbe+
	SPTf0lDd5hV0gVbMvUA4FI6pNwqE3YxhsfGLYCyG5JJf7L1WQi2ynQo+VRhMW6pg3g==
X-Gm-Gg: AR+sD10RhG4HuB0rrh3c9fLHiXZVVPt49HnWygDeXDBef5oNTgkOX3i5g1WLAXP/s+q
	7Fphx8I6pwKLRBll2129YzcqwKcFyDmg0jS+Lpf366jOw1AOMW0w5nUYLmoQH2MC+sGadSH/wid
	vg/NN7BfdSV2yZBNFfnvnsY9xlQBNP5knIweNFZR14VyGXHnle6LvA3iawwzmZzo1tH99uL+q3H
	l102lgWrql7G77LQLc7eKD0rBs91Da5ePnsL3jea0hRKaYsGADuK+DB+NTsMi0bMOWD5QOkNVcW
	1LTYXKgEboVpelAOUfu4YVyTfJPKLzjS3YVDP8wQLVqF/klFTTSnXM+jLOJykCBW4qhS9gAh9Aq
	1xVenMngYeupuTB0tVlV2CIfG8z3pCFjB+grZwBxiEM9CKad2qdfTqMqWpAhcHaotwfc1j5psoB
	AQk3huXNnFrSf0yJG0nAQLpQLX9GbWIePGxt+19Fhlcfg=
X-Received: by 2002:a05:600d:6405:20b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-496b53e888dmr48025e9.1.1785249097771;
        Tue, 28 Jul 2026 07:31:37 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6ef25sm54228115f8f.36.2026.07.28.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:31:36 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:31:30 +0000
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
	Jason Gunthorpe <jgg@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 19/23] dma-direct: select DMA address encoding from
 __DMA_ATTR_ALLOC_CC_SHARED
Message-ID: <ami9QgMEfCcU0ToH@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-20-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-20-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_073140_542080_02E9FD19 
X-CRM114-Status: GOOD (  24.36  )
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

On Fri, Jul 17, 2026 at 11:34:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Make the dma-direct helpers derive the DMA address encoding from
> __DMA_ATTR_ALLOC_CC_SHARED instead of implicitly relying on
> force_dma_unencrypted() inside phys_to_dma_direct()
> 
> Pass an explicit unencrypted/decrypted state into phys_to_dma_direct(),
> make the alloc paths return DMA addresses that match the requested buffer
> encryption state. Also only call dma_set_decrypted() when
> __DMA_ATTR_ALLOC_CC_SHARED is actually set.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  kernel/dma/direct.c | 43 ++++++++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index f7f064323bd9..eb0ce0787885 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -26,11 +26,11 @@
>  u64 zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
>  
>  static inline dma_addr_t phys_to_dma_direct(struct device *dev,
> -		phys_addr_t phys)
> +		phys_addr_t phys, bool unencrypted)
>  {
> -	if (force_dma_unencrypted(dev))
> +	if (unencrypted)
>  		return phys_to_dma_unencrypted(dev, phys);
> -	return phys_to_dma(dev, phys);
> +	return phys_to_dma_encrypted(dev, phys);
>  }
>  
>  static inline struct page *dma_direct_to_page(struct device *dev,
> @@ -41,8 +41,9 @@ static inline struct page *dma_direct_to_page(struct device *dev,
>  
>  u64 dma_direct_get_required_mask(struct device *dev)
>  {
> +	bool require_decrypted = force_dma_unencrypted(dev);
>  	phys_addr_t phys = ((phys_addr_t)max_pfn << PAGE_SHIFT) - 1;
> -	u64 max_dma = phys_to_dma_direct(dev, phys);
> +	u64 max_dma = phys_to_dma_direct(dev, phys, require_decrypted);
>  
>  	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
>  }
> @@ -71,7 +72,8 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>  
>  bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>  {
> -	dma_addr_t dma_addr = phys_to_dma_direct(dev, phys);
> +	bool require_decrypted = force_dma_unencrypted(dev);
> +	dma_addr_t dma_addr = phys_to_dma_direct(dev, phys, require_decrypted);
>  
>  	if (dma_addr == DMA_MAPPING_ERROR)
>  		return false;
> @@ -81,17 +83,18 @@ bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>  
>  static int dma_set_decrypted(struct device *dev, void *vaddr, size_t size)
>  {
> -	if (!force_dma_unencrypted(dev))
> -		return 0;
> -	return set_memory_decrypted((unsigned long)vaddr, PFN_UP(size));
> +	int ret;
> +
> +	ret = set_memory_decrypted((unsigned long)vaddr, PFN_UP(size));
> +	if (ret)
> +		pr_warn_ratelimited("leaking DMA memory that can't be decrypted\n");
> +	return ret;
>  }
>  
>  static int dma_set_encrypted(struct device *dev, void *vaddr, size_t size)
>  {
>  	int ret;
>  
> -	if (!force_dma_unencrypted(dev))
> -		return 0;
>  	ret = set_memory_encrypted((unsigned long)vaddr, PFN_UP(size));
>  	if (ret)
>  		pr_warn_ratelimited("leaking DMA memory that can't be re-encrypted\n");
> @@ -171,7 +174,8 @@ static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
>  				   dma_coherent_ok);
>  	if (!page)
>  		return NULL;
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 attrs & __DMA_ATTR_ALLOC_CC_SHARED);
>  	return page;
>  }
>  
> @@ -187,9 +191,11 @@ static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
>  	/* remove any dirty cache lines on the kernel alias */
>  	if (!PageHighMem(page))
>  		arch_dma_prep_coherent(page, size);
> -
> -	/* return the page pointer as the opaque cookie */
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	/*
> +	 * return the page pointer as the opaque cookie.
> +	 * Never used for unencrypted allocation
> +	 */
> +	*dma_handle = phys_to_dma_encrypted(dev, page_to_phys(page));
>  	return page;
>  }
>  
> @@ -329,7 +335,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		ret = uncached_cpu_addr;
>  	}
>  
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 attrs & __DMA_ATTR_ALLOC_CC_SHARED);
>  	return ret;
>  
>  
> @@ -450,11 +457,13 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  		return NULL;
>  
>  	ret = page_address(page);
> -	if (dma_set_decrypted(dev, ret, size))
> +	if ((attrs & __DMA_ATTR_ALLOC_CC_SHARED) &&
> +	    dma_set_decrypted(dev, ret, size))
>  		goto out_leak_pages;
>  setup_page:
>  	memset(ret, 0, size);
> -	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
> +					 attrs & __DMA_ATTR_ALLOC_CC_SHARED);
>  	return page;
>  out_leak_pages:
>  	return NULL;
> -- 
> 2.43.0
> 

