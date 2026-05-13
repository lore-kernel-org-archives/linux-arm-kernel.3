Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3BACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC0MVOdN5acyyI+7Hj0grkgWIyN6rVofWs5PThfM++E=; b=jBShBpWHa/xjUMmeF6NEP5sg99
	WoEs7tZz4Ntqw/seDUjRAx9LPm493swDnRkIk1JrZjtDqJuqQsAorrOkdcXimrZ8MDrexgjdJHzPm
	7nVYkwmVzjHizrx+hgk8OeJKhw927luWPV++kQjoKviLq32qFT7rl2EooOTqmHm+Z9c4+B5smtk+S
	B+XtAmuRiHhHTr+WeGt2kFXjOPeGMtUtqLdfHtd3xwkywBHD4ryAqYkVdmMqcVZGy+DZg2lpIcU+3
	fR4id/niFUX9jXxyKQMeECO+SPEpRW+rs7gtsGmFfs6jneHW+BMBMU7Mit48ET/YV8L7ZSG3ixtmN
	MQGjZS1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA5c-00000002qSI-2Ngs;
	Wed, 13 May 2026 13:57:32 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNA5a-00000002qRK-3Bu8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:57:32 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-515548f390fso7201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778680649; x=1779285449; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RC0MVOdN5acyyI+7Hj0grkgWIyN6rVofWs5PThfM++E=;
        b=v0y/k5+fi5A0xpO6gp5BdtWSj00kWcjeEzIFiDzzwNIQlqk+sZlzjrqt7Tok0Fuf2S
         65UL/8v8AeSd8gfDaOKo5e4hk4iKS6ZYMUNVm8KKFKGjXi7TA1dXN55Mq6JYYZFzuXaJ
         JIgIY/poJaUbE/AvIW1N9pSimtSL05zcURsCfVmQWXVah1lAU+fvot6sEuaYJVpfVIhc
         4SHYBEGPkmRV8sO/LT/TSliJcArgqSPyNnIBrkHUTlzttxmSWluUCv85N3BS6zxHuUbR
         eFcPZh8AOBKFXiGmgXm/9NH4pBNbghs4ok3cBhXc/bfvsnDlml7s6CaZFfgAmkPqQSlM
         XtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680649; x=1779285449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RC0MVOdN5acyyI+7Hj0grkgWIyN6rVofWs5PThfM++E=;
        b=dSr+aXNapKtxDsuCe7mkpCDpExuf0oclNWUc6fPA1CCD0mFTltqKYYIczPsOgBtvgt
         Z3wibp4upBbN0HUdVFtLpUG6MLhd3YMrOKSfY0BLebuJhH7Wf8dbDVVpTAq/F+FTTtYJ
         9cGtSnGj+DpbImhNKU2APKEpwuOcIV1YMsoiP6nP43/dLIpZPnskN9x7cmInGE/JsliI
         gHnV+HYu/rEiPc+0GvLRtQmoJsOAeO0RTxHAQEJP031eUpG/SD53wrpMzvmIknQBfo9y
         QyoqXro4JrqdjdFukf9IWixi5HM1RFwd1zeD2IPv3YkrjdJ+IfkwpJ/zHmSGchFJkY49
         yyWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g0bpnj1mY6dT2bSHKd3oFxJSHY9bMHl3f/lI7Q9h93U77YFfqwKQUHu4snk4in2LvsjYNVmSE17CvBcpXXF+R@lists.infradead.org
X-Gm-Message-State: AOJu0YwXAYzf5mNKroUlAxh9fR3wOaOtsuuf+/dAPs87qJMTy9nHa0M5
	sAxLOMGwdigdITFOday1Np76BwGrn6q28e/453GWS9WTs/gIgzvyzdF6p79cY5NItMDEEX82OJU
	l8sFZPA==
X-Gm-Gg: Acq92OHyV1w2hMF9FJjPCyd4RPivpsJ9ZT3CIkU3LUNAqljGBygeM1GwCdZrO4hmIT1
	QuACrdnUvwIVZ5LoiIQr9+ULqggBgiywSF/mGGeQ6EMlClpwvkEywEKcj/rTNGeY5u4pcUCtrnS
	3o7oa5jH/Z/uwuHQoyzkzeNX90DZk+2hpUL6tCAB8bf9DFxfRhe1O4oMVzDrzOqp6UOGnnizybo
	6I6sW6umtAsbtOk3zar7Vfjg4sj/x6LpZyj1y22K1/j7mEFXERykIakJtXUnZtcWkwQY1fJ7bhG
	LD8VU1L/Ztn/Fa5QrI3KNH6LTX4ogchaTyCtpVGoR9XtzM4bn0FG0NT83tBOzhv9+gsfc+/8cIl
	evUGYJ7lzwwUKJGDjHefZxPbG+JvHxXNIWAKu6wG94p/HQV8oOY6c1SMOBJ+m/bkrh3xxRdnAZK
	7s7Qwf24x/FbMVEb9oxFrMocgckEKhB2EHFLf5/I1YdMmFpunQFEhluS3+K9npb1sBBwpc
X-Received: by 2002:a05:622a:5885:b0:50e:5e19:587a with SMTP id d75a77b69052e-5162f6cdb43mr14055691cf.3.1778680648735;
        Wed, 13 May 2026 06:57:28 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6652744asm186174597b3.1.2026.05.13.06.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:57:27 -0700 (PDT)
Date: Wed, 13 May 2026 13:57:16 +0000
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 01/13] dma-direct: swiotlb: handle swiotlb alloc/free
 outside __dma_direct_alloc_pages
Message-ID: <agSDPJMZkcI-uH8f@google.com>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512090408.794195-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_065730_816061_7D5502F7 
X-CRM114-Status: GOOD (  29.63  )
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

On Tue, May 12, 2026 at 02:33:56PM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c | 44 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index ec887f443741..b958f150718a 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -125,9 +125,6 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
>  
>  	WARN_ON_ONCE(!PAGE_ALIGNED(size));
>  
> -	if (is_swiotlb_for_alloc(dev))
> -		return dma_direct_alloc_swiotlb(dev, size);
> -
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
>  	page = dma_alloc_contiguous(dev, size, gfp);
>  	if (page) {
> @@ -204,6 +201,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
>  {
>  	bool remap = false, set_uncached = false;
> +	bool mark_mem_decrypt = true;
>  	struct page *page;
>  	void *ret;
>  
> @@ -250,11 +248,21 @@ void *dma_direct_alloc(struct device *dev, size_t size,
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
> @@ -281,7 +289,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  			goto out_free_pages;
>  	} else {
>  		ret = page_address(page);
> -		if (dma_set_decrypted(dev, ret, size))
> +		if (mark_mem_decrypt && dma_set_decrypted(dev, ret, size))

I am ok with that approach, but Jason was mentioning we shouldn’t
special case swiotlb and make the allocator return the memory state
(similar to the dma_page [1]) . I am also OK if you want to merge that
part of my series with is.

[1] https://lore.kernel.org/linux-iommu/20260408194750.2280873-1-smostafa@google.com/

>  			goto out_leak_pages;
>  	}
>  
> @@ -298,7 +306,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	return ret;
>  
>  out_encrypt_pages:
> -	if (dma_set_encrypted(dev, page_address(page), size))
> +	if (mark_mem_decrypt && dma_set_encrypted(dev, page_address(page), size))
>  		return NULL;
>  out_free_pages:
>  	__dma_direct_free_pages(dev, page, size);
> @@ -310,6 +318,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  void dma_direct_free(struct device *dev, size_t size,
>  		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
>  {
> +	bool mark_mem_encrypted = true;
>  	unsigned int page_order = get_order(size);
>  
>  	if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> @@ -338,12 +347,15 @@ void dma_direct_free(struct device *dev, size_t size,
>  	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
>  		return;
>  
> +	if (swiotlb_find_pool(dev, dma_to_phys(dev, dma_addr)))
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
> @@ -359,6 +371,19 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
>  		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>  
> +	if (is_swiotlb_for_alloc(dev)) {
> +		page = dma_direct_alloc_swiotlb(dev, size);
> +		if (!page)
> +			return NULL;
> +
> +		if (PageHighMem(page)) {

My understanding is that rmem_swiotlb_device_init() asserts that there
is no PageHighMem()? Also a similar check doesn’t exist in
dma_direct_alloc().

Thanks,
Mostafa


> +			swiotlb_free(dev, page, size);
> +			return NULL;
> +		}
> +		ret = page_address(page);
> +		goto setup_page;
> +	}
> +
>  	page = __dma_direct_alloc_pages(dev, size, gfp, false);
>  	if (!page)
>  		return NULL;
> @@ -366,6 +391,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	ret = page_address(page);
>  	if (dma_set_decrypted(dev, ret, size))
>  		goto out_leak_pages;
> +setup_page:
>  	memset(ret, 0, size);
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
>  	return page;
> @@ -378,13 +404,17 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>  		enum dma_data_direction dir)
>  {
>  	void *vaddr = page_address(page);
> +	bool mark_mem_encrypted = true;
>  
>  	/* If cpu_addr is not from an atomic pool, dma_free_from_pool() fails */
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
>  	    dma_free_from_pool(dev, vaddr, size))
>  		return;
>  
> -	if (dma_set_encrypted(dev, vaddr, size))
> +	if (swiotlb_find_pool(dev, page_to_phys(page)))
> +		mark_mem_encrypted = false;
> +
> +	if (mark_mem_encrypted && dma_set_encrypted(dev, vaddr, size))
>  		return;
>  	__dma_direct_free_pages(dev, page, size);
>  }
> -- 
> 2.43.0
> 

