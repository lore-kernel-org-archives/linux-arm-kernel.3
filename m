Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7E6CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7sN51CIvQwRuTJi3qMza06o4wJMznBiMEkiJVIlNBs=; b=mBjr1+EsN9F+d2nId3JDdXAlW5
	/noPG7ZdRrpeinOpRekF+KVx7TSUumWc8zGjWW40y3lnA3L8mpcnRjSEpcDbnHJlS8/EshRMOiGe2
	VcqFoF+S+bKtY3srHQxr1sF/bZJLr+8j+tE4ncRSMEhAnLcD5DA2s3DFG1nMIWtbTdOPPa7jdm6z7
	tT9rR7CbF9Z/51v5/bRwasD02i6drE4aqCdb4lzqcfr2daX3mXDhCGsfLfuZU3szsM3HzmoTVu/YO
	54JvRVlKF7lsO6zAacuwg73vLALZCcYDHlDOEzIE2epvnOhQwo7uR02AsbNq9yFpI60IV3kNVGgyf
	neMAGvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvNC-00000005VQx-09DP;
	Tue, 09 Jun 2026 12:16:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvN9-00000005VPO-252Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:16:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490b1aefe1cso5820325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781007357; x=1781612157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7sN51CIvQwRuTJi3qMza06o4wJMznBiMEkiJVIlNBs=;
        b=GB0K4ICrEptSJpVODo1GEt5gdWQOwihNX0WZUYFqT1u3NQQJKYbBZ/1BNdcx36bqvL
         qqIGPUMJjP3bmsCScdfwzbDgg2UiAVn5pqJMzvYmZs7n0/Jbl3Uhvm5htGfKi5BMdxlp
         C+hCZSCQgNIL4gDiogIVEZRy1M2MKVqwIWt6jJRPjToNkwKnGzTpKLzNtgoo9ih42m63
         ga9egUtoGNRI/wKTbecB7amJ6qbfOPO95X6kKFjva7+olK+Lk/ZUOvR7Zqj/G2F3p8Fi
         FqEPDj3Pqrza47Ki6PqGfDHHuM4O+8DLxcDppX5pZfK807vX5Xb0KFzX0XlRhIpsRswg
         5R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007357; x=1781612157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d7sN51CIvQwRuTJi3qMza06o4wJMznBiMEkiJVIlNBs=;
        b=Zwc/l0mAMB5WubiV9T1uiN39+rvjgP38gbzsLvILJOG8kVuSxIuyk83XS9vqutoAGM
         qwITksS1wXCKsLHfM019dkCACNmkI4jWz9fyEoPbrBKMUudBuOHUN9sO9YN3f+zOIRUf
         B4e2Y8G9uKMaLQd2EjTEV1/i1K9L+mtymXtQfIW323jo77Ich+sY9d0Y5LKlU+zBI8Lj
         1kd6O/pQMuh99WIOBRAukfCPuKvMRdMi04p3r59Vs+AwSmNnAYJbNyvE3JJ2HbP/u3Mj
         eFGGgVMeqPa0adexsx2lWM6tkJGAwHyCTSbsSbUdZMmVX9AU9zBqAAUGRtf12AV+IzsO
         02rA==
X-Forwarded-Encrypted: i=1; AFNElJ/cCEFzdcOLgFvU3ntSNJ1WTvx/E4/Hp7shluG9++S9JUjxV1/UZhjyiqRoHR4GOkR/8BSAbvM//xhS5tmlXw5K@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ4tnEpf+bknPgNvGPH1Ek98pmGXszOYcojix4XlWBtZ/yfJ1i
	bNiQajzOXz4vTBVdET+lvMEKYzvFn/P9ek3Wd8lhlhpWsXyIAiMQqq/UlV+gfchkZE0=
X-Gm-Gg: Acq92OEQ8kEn/gLukvpDNMn3WcYRnqxzChcfk2/KKF4TZWXt+wMkv73i7hwfQQkeZSL
	IaipdjQBPF/4nt2Kj0dgIkhA73K2g34WwIXhk158pI39q8im3+MIFLVzD+k9RTYj73nHcFdfQat
	uT3Tg+bI8VcmBfXu8I37+D8hjeisEWdiW2XKyduPGZMwcnp93qfHW9R1kIbdYUl5oMli4fufY/5
	4JQPPbh+AY9Y9kbtOsul5fqkernAJIAJQNexDK8TteF14vJrl/l7xpvZ+OTLZGgKjsD44mvJ0xD
	EsvamyykZ4ktAHepryCmLLMDELxEQTTJAtaaoyr7GNQL5JH7S205w2QNtZV4b5GPCXcA3X9Q69p
	Mf0GjuLmkpsBUJHJ2g6EEIlRn0+OlsZjHZ7k8hIKB2rNqmamtn8CHXb6yhyZCtwcXgH4uPOO5W5
	mZE8eSu7V8St/ZjyTlo5x2f94=
X-Received: by 2002:a05:600c:620d:b0:48d:1021:e5d1 with SMTP id 5b1f17b1804b1-490c25f597emr139602585e9.3.1781007356518;
        Tue, 09 Jun 2026 05:15:56 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e5a00sm473055565e9.15.2026.06.09.05.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:15:55 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:15:48 +0200
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
 <svens@linux.ibm.com>, x86@kernel.org, Jiri Pirko <jiri@nvidia.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 02/20] dma-direct: swiotlb: handle swiotlb alloc/free
 outside __dma_direct_alloc_pages
Message-ID: <20260609141548.70a5848d@mordecai>
In-Reply-To: <20260604083959.1265923-3-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-3-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_051559_595048_07F55BCA 
X-CRM114-Status: GOOD (  33.25  )
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

On Thu,  4 Jun 2026 14:09:41 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> Move swiotlb allocation out of __dma_direct_alloc_pages() and handle it in
> dma_direct_alloc() / dma_direct_alloc_pages().
> 
> This is needed for follow-up changes that simplify the handling of
> memory encryption/decryption based on the DMA attribute flags.
> 
> swiotlb backing pages are already mapped decrypted by
> swiotlb_update_mem_attributes() and rmem_swiotlb_device_init(), so
> dma-direct should not call dma_set_decrypted() on allocation nor
> dma_set_encrypted() on free for swiotlb-backed memory.
> 
> Update alloc/free paths to detect swiotlb-backed pages and skip
> encrypt/decrypt transitions for those paths. Keep the existing highmem
> rejection in dma_direct_alloc_pages() for swiotlb allocations.
> 
> Only for "restricted-dma-pool", we currently set `for_alloc = true`, while
> rmem_swiotlb_device_init() decrypts the whole pool up front. This pool is
> typically used together with "shared-dma-pool", where the shared region is
> accessed after remap/ioremap and the returned address is suitable for
> decrypted memory access. So existing code paths remain valid.
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  include/linux/swiotlb.h |  6 ++++
>  kernel/dma/direct.c     | 71 ++++++++++++++++++++++++++++++-----------
>  kernel/dma/swiotlb.c    |  6 ++++
>  3 files changed, 65 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3dae0f592063..133bb8ca9032 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -284,6 +284,8 @@ extern void swiotlb_print_info(void);
>  #ifdef CONFIG_DMA_RESTRICTED_POOL
>  struct page *swiotlb_alloc(struct device *dev, size_t size);
>  bool swiotlb_free(struct device *dev, struct page *page, size_t size);
> +void swiotlb_free_from_pool(struct device *dev, phys_addr_t tlb_addr,
> +		size_t size, struct io_tlb_pool *pool);
>  
>  static inline bool is_swiotlb_for_alloc(struct device *dev)
>  {
> @@ -299,6 +301,10 @@ static inline bool swiotlb_free(struct device *dev, struct page *page,
>  {
>  	return false;
>  }
> +static inline void swiotlb_free_from_pool(struct device *dev, phys_addr_t tlb_addr,
> +		size_t size, struct io_tlb_pool *pool)
> +{
> +}
>  static inline bool is_swiotlb_for_alloc(struct device *dev)
>  {
>  	return false;
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 583c5922bca2..a741c8a2ee66 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -96,14 +96,6 @@ static int dma_set_encrypted(struct device *dev, void *vaddr, size_t size)
>  	return ret;
>  }
>  
> -static void __dma_direct_free_pages(struct device *dev, struct page *page,
> -				    size_t size)
> -{
> -	if (swiotlb_free(dev, page, size))
> -		return;
> -	dma_free_contiguous(dev, page, size);
> -}
> -
>  static struct page *dma_direct_alloc_swiotlb(struct device *dev, size_t size)
>  {
>  	struct page *page = swiotlb_alloc(dev, size);
> @@ -125,9 +117,6 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>  
>  	WARN_ON_ONCE(!PAGE_ALIGNED(size));
>  
> -	if (is_swiotlb_for_alloc(dev))
> -		return dma_direct_alloc_swiotlb(dev, size);
> -
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
>  	page = dma_alloc_contiguous(dev, size, gfp);
>  	if (page) {
> @@ -204,6 +193,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	bool remap = false, set_uncached = false;
> +	bool mark_mem_decrypt = true;
>  	struct page *page;
>  	void *ret;
>  
> @@ -250,11 +240,21 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	    dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
> +	if (is_swiotlb_for_alloc(dev)) {
> +		page = dma_direct_alloc_swiotlb(dev, size);
> +		if (page) {
> +			mark_mem_decrypt = false;
> +			goto setup_page;
> +		}
> +		return NULL;
> +	}
> +
>  	/* we always manually zero the memory once we are done */
>  	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
>  	if (!page)
>  		return NULL;
>  
> +setup_page:
>  	/*
>  	 * dma_alloc_contiguous can return highmem pages depending on a
>  	 * combination the cma= arguments and per-arch setup.  These need to be
> @@ -281,7 +281,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  			goto out_free_pages;
>  	} else {
>  		ret = page_address(page);
> -		if (dma_set_decrypted(dev, ret, size))
> +		if (mark_mem_decrypt && dma_set_decrypted(dev, ret, size))
>  			goto out_leak_pages;
>  	}
>  
> @@ -298,10 +298,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	return ret;
>  
>  out_encrypt_pages:
> -	if (dma_set_encrypted(dev, page_address(page), size))
> +	if (mark_mem_decrypt && dma_set_encrypted(dev, page_address(page), size))
>  		return NULL;
>  out_free_pages:
> -	__dma_direct_free_pages(dev, page, size);
> +	if (!swiotlb_free(dev, page, size))
> +		dma_free_contiguous(dev, page, size);
>  	return NULL;
>  out_leak_pages:
>  	return NULL;
> @@ -310,6 +311,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  void dma_direct_free(struct device *dev, size_t size,
>  		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>  {
> +	phys_addr_t phys;
> +	bool mark_mem_encrypted = true;
> +	struct io_tlb_pool *swiotlb_pool;
>  	unsigned int page_order = get_order(size);
>  
>  	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> @@ -338,16 +342,25 @@ void dma_direct_free(struct device *dev, size_t size,
>  	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
>  		return;
>  
> +	phys = dma_to_phys(dev, dma_addr);
> +	swiotlb_pool = swiotlb_find_pool(dev, phys);
> +	if (swiotlb_pool)
> +		/* Swiotlb doesn't need a page attribute update on free */
> +		mark_mem_encrypted = false;
> +
>  	if (is_vmalloc_addr(cpu_addr)) {
>  		vunmap(cpu_addr);
>  	} else {
>  		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
>  			arch_dma_clear_uncached(cpu_addr, size);
> -		if (dma_set_encrypted(dev, cpu_addr, size))
> +		if (mark_mem_encrypted && dma_set_encrypted(dev, cpu_addr, size))
>  			return;
>  	}
>  
> -	__dma_direct_free_pages(dev, dma_direct_to_page(dev, dma_addr), size);
> +	if (swiotlb_pool)
> +		swiotlb_free_from_pool(dev, phys, size, swiotlb_pool);
> +	else
> +		dma_free_contiguous(dev, dma_direct_to_page(dev, dma_addr), size);
>  }
>  
>  struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
> @@ -359,6 +372,15 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
> +	if (is_swiotlb_for_alloc(dev)) {
> +		page = dma_direct_alloc_swiotlb(dev, size);
> +		if (!page)
> +			return NULL;
> +
> +		ret = page_address(page);
> +		goto setup_page;
> +	}
> +
>  	page = __dma_direct_alloc_pages(dev, size, gfp, false);
>  	if (!page)
>  		return NULL;
> @@ -366,6 +388,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	ret = page_address(page);
>  	if (dma_set_decrypted(dev, ret, size))
>  		goto out_leak_pages;
> +setup_page:
>  	memset(ret, 0, size);
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
>  	return page;
> @@ -377,16 +400,28 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>  		struct page *page, dma_addr_t dma_addr,
>  		enum dma_data_direction dir)
>  {
> +	phys_addr_t phys;
>  	void *vaddr = page_address(page);
> +	struct io_tlb_pool *swiotlb_pool;
> +	bool mark_mem_encrypted = true;
>  
>  	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
>  	    dma_free_from_pool(dev, vaddr, size))
>  		return;
>  
> -	if (dma_set_encrypted(dev, vaddr, size))
> +	phys = page_to_phys(page);
> +	swiotlb_pool = swiotlb_find_pool(dev, phys);
> +	if (swiotlb_pool)
> +		mark_mem_encrypted = false;
> +
> +	if (mark_mem_encrypted && dma_set_encrypted(dev, vaddr, size))
>  		return;
> -	__dma_direct_free_pages(dev, page, size);
> +
> +	if (swiotlb_pool)
> +		swiotlb_free_from_pool(dev, phys, size, swiotlb_pool);
> +	else
> +		dma_free_contiguous(dev, page, size);
>  }
>  
>  #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 1abd3e6146f4..ac03a6856c2e 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1809,6 +1809,12 @@ bool swiotlb_free(struct device *dev, struct page *page, size_t size)
>  	return true;
>  }
>  
> +void swiotlb_free_from_pool(struct device *dev, phys_addr_t tlb_addr, size_t size,
> +		struct io_tlb_pool *pool)

What's the reason to pass the buffer size if it's not used?

Other than that, this patch looks good to me.

Petr T

> +{
> +	swiotlb_release_slots(dev, tlb_addr, pool);
> +}
> +
>  static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
>  				    struct device *dev)
>  {

