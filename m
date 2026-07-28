Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAA0C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLh0JMDAJYh72m8FtF6BfLrBflAoWAmkZ9Sv6YSjD4c=; b=kGSagJGIp+I3qB34Lg/4IpsJuv
	uxlrpGkYeLwGY5lfC+ms84JxbZbOqNEz3ARoIz+JaGziFLXzK2jeB2qWLHTDmfWgivwzN69tzYHI/
	CqKORo/8Jf0ay2cnSbR8n/LC+7ouWw7mSk8KKDe4jnfumDW39Or9z+ce/gDa1EsOkACBYTVqDJVJx
	r1VVo7S5ke+ATWtgL4NQmNkpk+KI1CVMHrXNimyE8FCknpGt7ZBtyRJgoxpFJUNk34VOdcpw8mldP
	K10wnY+3JMUj/e6n3z7dACUEwJuOnyJyRrXexfIu23rwxPvaKlVpf/XTLFlVKe1I/7QxxYn4H8UEH
	wV/5Wt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woijc-00000005TIm-1Mcj;
	Tue, 28 Jul 2026 14:24:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woija-00000005TIB-0syI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:24:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-495509b08ebso49175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785248680; x=1785853480; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLh0JMDAJYh72m8FtF6BfLrBflAoWAmkZ9Sv6YSjD4c=;
        b=QqgItz3LjRFAMSWiZE74YwZT57pomOlM6fGLd1sGUgCUK5FPOCSzxp+EyVSpCZZmSG
         XANWjoKx7jt302ZqOd18Rp2f9ZFgNFWcbbGa7Z6W3bc9/7EfHUrvEN8/GICOLnAqtL0q
         su3GjikEqKI8fvCYvNfoIq78V6pKonQ2q7FPsXJZSdv6lqHe1lQTnBl0ttD5DTcwt/Aa
         ukQ1FMYOehsszoBgpWL7murQAllpfIIYmXIBPICXoyaYxqQBhfEh2hG+kjv8dqOWNTKI
         uZmAbyCNe9ZwzJqvHDYsFDxSh/IRtJt1iZWb5JYNv2mJXlk8bFf94OTfmZs38dyGYhsz
         8orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248680; x=1785853480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLh0JMDAJYh72m8FtF6BfLrBflAoWAmkZ9Sv6YSjD4c=;
        b=XZ7hMBTy/hPcNDmNMITTlQf6ExuCn4Etm39L3d6NuPLtS1WWicHZtixrOk7ySUnGiy
         bRol/hRx47DkLDh1qjFVSNEP67VM4QcGnd2cb+rESfUNAriSQ4bcCrjrYOKa5EfeKIzV
         mLZnc+YgzO2x8yjlNsNzQJ8FSHYViVFE06+7hSXQUyf63gj+LTL6fSCfSiA8cCapu8Nn
         FyFhiUuDINfyPLIQOYaTeWsE01+8Ly5O+KQ4HhGkKww4TP7/AVfUnmddjnfVOOq0YzM9
         A7peGcKOv4WDUr3LVXhtfhGXpZ0S/YlVKx9YkKWh208u2soI9UBg5RWX4tUbtolKRuLO
         rtZw==
X-Forwarded-Encrypted: i=1; AHgh+RqLVYBNVFbYbjWVgkY9rs55jTkh9xlZqeicNlDe9Er+5el4BFf9DlBEeJAHbPI4FdXFU3/vY65+mhbTvfu+jam1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9cIFpk8te4pq9Vc/+5Ey5pNaFASV+vYL5JNKrVs7lpGD9tyg0
	6biU+WJTSV52qif5pGaExf0bFZPmKSkYammxIFmeQa1K3xwRxjg7x2MvvS7ybaibSQ==
X-Gm-Gg: AR+sD10kNCWyvv301xvxuhdBgKRRyBa3HwsxRlQ528e8isa43ij38BB5rpjk4kvR2tP
	C3ecyVTYc1b/wjGlLHbUZykfhYVaILvwGErGCvrDOyJoySZjwp9fFvtbHU3fGKWorwHljS3QEOU
	gO7y2yD02CylsXFTcgPoOx6cxA0GIT7xONYI4yB8I/fJw7Q71ZUwvi3+toMqwuArgSuaxfawjgt
	v+Vlun1Dinu4+BS56t4iQxK1V55eknt/5LNzz5WiX8gRbJR+kL2GPYAWsqbfENhaUrSfuvfoux9
	UF6ADOy8v5GRdwLz7az/ebymths6f/tCTCpsnjYWWg3QiuTUlpa9MFeQOnvsJZltW6F1txKMSim
	2RCC4Yg431ehVX/pJ1NpHpj4UrSbigUiFo6Su0JZTtqf8DpkxY5IGVkYlyXURLGvVQAns33MjEy
	0o8FwfQv1etSd4zpF07OMcHzO57YjuLsC8KyY1hSdTIGA=
X-Received: by 2002:a05:600c:35c2:b0:495:5515:3c00 with SMTP id 5b1f17b1804b1-496b53f7910mr71275e9.9.1785248679759;
        Tue, 28 Jul 2026 07:24:39 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm79447515e9.0.2026.07.28.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:24:39 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:24:30 +0000
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <ami7nhBTXzAfqoVE@google.com>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717180442.110954-2-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_072442_276084_2F901312 
X-CRM114-Status: GOOD (  21.73  )
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

On Fri, Jul 17, 2026 at 11:34:19PM +0530, Aneesh Kumar K.V (Arm) wrote:
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
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  kernel/dma/direct.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index d8219efe3273..363d984d90e7 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -164,22 +164,21 @@ static bool dma_direct_use_pool(struct device *dev, gfp_t gfp)
>  	return !gfpflags_allow_blocking(gfp) && !is_swiotlb_for_alloc(dev);
>  }
>  
> -static void *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> -		dma_addr_t *dma_handle, gfp_t gfp)
> +static struct page *dma_direct_alloc_from_pool(struct device *dev, size_t size,
> +		dma_addr_t *dma_handle, void **cpu_addr, gfp_t gfp)
>  {
>  	struct page *page;
>  	u64 phys_limit;
> -	void *ret;
>  
>  	if (WARN_ON_ONCE(!IS_ENABLED(CONFIG_DMA_COHERENT_POOL)))
>  		return NULL;
>  
>  	gfp |= dma_direct_optimal_gfp_mask(dev, &phys_limit);
> -	page = dma_alloc_from_pool(dev, size, &ret, gfp, dma_coherent_ok);
> +	page = dma_alloc_from_pool(dev, size, cpu_addr, gfp, dma_coherent_ok);
>  	if (!page)
>  		return NULL;
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
> -	return ret;
> +	return page;
>  }
>  
>  static void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
> @@ -247,8 +246,11 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	 * the atomic pools instead if we aren't allowed block.
>  	 */
>  	if ((remap || force_dma_unencrypted(dev)) &&
> -	    dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> +	    dma_direct_use_pool(dev, gfp)) {
> +		page = dma_direct_alloc_from_pool(dev, size, dma_handle,
> +						  &ret, gfp);
> +		return page ? ret : NULL;
> +	}
>  
>  	/* we always manually zero the memory once we are done */
>  	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO, true);
> @@ -357,7 +359,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	void *ret;
>  
>  	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
> -		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> +		return dma_direct_alloc_from_pool(dev, size, dma_handle, &ret, gfp);
>  
>  	page = __dma_direct_alloc_pages(dev, size, gfp, false);
>  	if (!page)
> -- 
> 2.43.0
> 

