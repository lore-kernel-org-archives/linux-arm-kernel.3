Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A76CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9KAUhO8tYdZLzMRayCE9PmCg2//sOlzvRLMvdEyREI=; b=alDNKQQybMB6FqM/zUm4emQykP
	Lm7z0jlOSaQjZYWv2NRpwy/WGrzDGmITI/MgdM1D1r090suFDCFtMnL567dYq9QENSxELpPPF5gQZ
	Wa+bPr9AlU+RGsulEvE5HRm+Qh9f+PH03MY6jf7Un6BKc0pX90k04V5L6iZyTJU6xMVRzDXGRfknI
	f2O/hW9S8rgFRZ9DRkmp7HMfVa4ttWc5DRIah0dmDqsvTIAifnXrbLOX/Xh9C6LTa69VKTUa9jWp9
	V6Y4Q4C+iUUhCB/oqrdi0sqFCKRk2TTGgWkB8YhXLr5+R3BxYIKDgwOuiirDGcSsKzrkEInA656Fq
	uEANT4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxVY-00000005mqK-1kyf;
	Tue, 09 Jun 2026 14:32:48 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxVV-00000005mpz-3qU2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:32:47 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-91563382bcfso646319485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1781015564; x=1781620364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D9KAUhO8tYdZLzMRayCE9PmCg2//sOlzvRLMvdEyREI=;
        b=muDoGXs34cRz+cITFXQzwDkw1eU9zxmhjshNf+yojTX694wqcc9P5lTMs+UrlZFGXP
         dNEQQRe/b4w8y8ZBIydveMDcZG40TRC50M9S8y+oU4aDul15xszEwKtdq4xDMVFlRNEq
         sNoFKjwa/afYWo0+egsLdQ4LSBGIe1jWc+GnljyvSdBtXeZouCeu1CXlht4xwXVosx8y
         YatG+j4F/GhOtFvTnj/0WN5teCfpTb0wafxdvGx3TrfcFu48xpXwbKK7uv4bCDWYyash
         RKJKuduMs6r2nxRcli4E+QPA62H49rjW5/mytUYn3D+93bu9lAbj0ifAOD/gwgOjt6fV
         ObJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015564; x=1781620364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9KAUhO8tYdZLzMRayCE9PmCg2//sOlzvRLMvdEyREI=;
        b=sm2xCnuefh+0ARWcDS66F8IpZ6H4ghKBy6KAwls9vWJnA4svq11GsaGrSBTRgGS7nt
         0nol8NTUKClflBVHQTirw+9QNoGZe1HlGOpfB5g5vF4/UoQ1CjAgSlyD+xvPeNBf0IaW
         tihuGbc6hGQbdxtxD5iM2UgBvPNxYSchgQXv5qFizzqSZXsKeMAa904RaENAVHOZsZbx
         EweWq/CJMnw+zMSzTl0fCivkNcTuI6OaEukqcJqzeLVCJ3yfG1Tk8WN9H9NWGRTjLnCE
         egkAi1MTr7cDl1KlxiaLyEFYLSFFUAOTxRabEH0TGXCfyUf+J++XSpjMlLtm3gTCJ2ZL
         EENg==
X-Forwarded-Encrypted: i=1; AFNElJ8m2417ZJbJ7N8/o7fdNb8hfRQz+jq3Wb5SOa3XsVRQuzrxGslYsIGOBDyYPU57onCSft/Vij8xZgjWhsuFIi0c@lists.infradead.org
X-Gm-Message-State: AOJu0YyDeP/NE/ofXGt57+jWVuzuMf28R1hK1SACyhbcUZeYJ2HonyJ9
	NNcV0M3HwvJo7oumf7eqlhcGoEB9GM4GcfRlJ/3ts3idLcqofk67YTq68Ah15K0vSKg=
X-Gm-Gg: Acq92OEDDcRAfO1YLphSgJbsDJ8uwdze1AavDeYrN/dZw08+MCH31NXu4OCAVJxVFjv
	nEHrloq46fVkyjqVC1n2RbfbUrC7ph12Gax5pleVxZusHJmAKZGMkzdcNkCClZPrdlqe6SUP4uQ
	Z6JMe4b/8NKJeBAP7dHeHk28Aw9rJ5bt3BfkBM91nxG1rDyQb4FA4HIMXkEdzp8NcwKroQWDskw
	pTxicu3+FfV6YtKPTlF1WuTCf0iWBW0Gnc25uLH3qhhQ2zSuySFy2T84hlL2XU5+kidI+8mcE31
	jIUGsjlcYx7GT9hyUMQkRNSCmJwXBOLpPaBJ5tJ1e3iTiNNibS3yfiHi5aOSv3EdNnfuWr7HL96
	vfmk87PValO8cJT6h9MJ4qc3GP6Y+daycdoKTP2+r5h2kIeAYnpuk+oH2qnzMrm8vcQKCTkfJ9e
	IIjxurxjNoHf2ntFgA6DcXiQvx6ibkaPU48dxLRkvy6NXhotSOglfgKpFf1p5bs0kuIluV4+esD
	T11tPH0EqUMpZS3
X-Received: by 2002:a05:620a:c46:b0:915:9f28:6748 with SMTP id af79cd13be357-915a9cdcf02mr3443110085a.23.1781015564257;
        Tue, 09 Jun 2026 07:32:44 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2106743685a.2.2026.06.09.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:32:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wWxVS-0000000241b-3Vv0;
	Tue, 09 Jun 2026 11:32:42 -0300
Date: Tue, 9 Jun 2026 11:32:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
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
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260609143242.GK2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083959.1265923-5-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073245_987846_7D34D612 
X-CRM114-Status: GOOD (  15.85  )
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

On Thu, Jun 04, 2026 at 02:09:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
> -		void **cpu_addr, gfp_t gfp,
> +		void **cpu_addr, gfp_t gfp, unsigned long attrs,
>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>  {
> -	struct gen_pool *pool = NULL;
> +	struct dma_gen_pool *dma_pool = NULL;
>  	struct page *page;
>  	bool pool_found = false;
>  
> -	while ((pool = dma_guess_pool(pool, gfp))) {
> +	while ((dma_pool = dma_guess_pool(dma_pool, gfp))) {
> +
> +		if (dma_pool->unencrypted != !!(attrs & DMA_ATTR_CC_SHARED))
> +			continue;

I don't think you should be overloading DMA_ATTR_CC_SHARED like this.

	/*
	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
	 * attribute. The direct allocator uses it internally after it has
	 * decided that the backing pages must be shared/decrypted, so the
	 * rest of the allocation path can consistently select DMA addresses,
	 * choose compatible pools and restore encryption on free.
	 */
	if (attrs & DMA_ATTR_CC_SHARED)
		return NULL;

	if (force_dma_unencrypted(dev)) {
		attrs |= DMA_ATTR_CC_SHARED;
		mark_mem_decrypt = true;
	}

It is fine to have a bit inside the attrs that is only used by the
internal logic, but it needs to have a clearer name
__DMA_ATTR_REQUIRE_CC_SHARED perhaps.

The sashiko note does look legit though:

	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
	    !gfpflags_allow_blocking(gfp) && !coherent) {
		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
					   gfp, attrs, NULL);
		if (!page)
			return NULL;

I don't see anything doing the force_dma_unencrypted test along this
callchain..

I guess it should be done one step up in dma_alloc_attrs() instead of
in dma_direct_alloc()?

Jason

