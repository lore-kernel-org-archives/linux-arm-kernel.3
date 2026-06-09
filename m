Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523FECD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkYHspRdfakTgJWTmfOhWR71X/NTXsb3/ZhoDPOxGQs=; b=pAGF8WgkAJqiZaa7kRkqsXwDNJ
	zwZQ4y1HHyXVtVsl3mpwU8ZATVzz/8hh68r2Qt3r7wMmK4b1K2n2WUpFs+Kqn01UPEazzdLdAaEN8
	Kw6XBtKiIoJZ82XAUyabFai3/JiuYdH3DlrxRMqoPRmDPwJOATaT6Hhl3mjGSRGjRMuF84GuhlrOE
	+jjs3cNemL/LxTibI1g7fZ+5/VflzHTlqz3WPbAlZQo/qiSBMZUHoI3uy8keKIGhi/FPR//xN3XMH
	GXAD372m2WA0pa9J3hzjdItQBtun96KD6fUIgS5Blmx+9kne7ojBLP4zJ0/lHaWm8/M+jN4csU9I5
	cVIOjMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvyr-00000005bf9-0A2T;
	Tue, 09 Jun 2026 12:54:57 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvym-00000005beH-39Bk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:54:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-45ef5b33e73so372797f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781009691; x=1781614491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkYHspRdfakTgJWTmfOhWR71X/NTXsb3/ZhoDPOxGQs=;
        b=Pvw5laPNoYlbpvxqZDnEnFQ2AO/EiBkhJJHy/X5d3z8xZ7hoMa7flrO4qktHVb+01I
         xeo0Oub+liXMNCcUWMvCc21b92ZYwxZeaCD+QNyah6E7El30WxXG91pCceP3kTaDUttc
         Y64JOUo5l1Y9eI3guhXogbBs1s9dV7GfkwIHYQNZpVwd2ni7Kb8pEhw9vwl91VATU+OO
         nxjSZ8nII6A5CboZk3Iyfpgrhl+dtMPoYCKDRiEgFEAUW50RMOJnJJlF2Kw2x+mTpnFz
         vpTq5gR7uA4/ZSp4Itf2j6HY/leHhxZMt7j0dTbJAIbub6kECBzpogaS3V0hss9Kv2LK
         lVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009691; x=1781614491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vkYHspRdfakTgJWTmfOhWR71X/NTXsb3/ZhoDPOxGQs=;
        b=lx2RbbMzvCAHBsunyKJPZrYG3/zQLkVyW1CqFc/2Yw6w0lBadzdhIln+UvyOJnojOE
         98PUKPEkb80KORD1ItbbEyyXjw1CyOiaHtKrG2qwThD5s70ROq9Fa9xaFxao6Fkp0CT3
         AMWTd0c1dkEC/zStcsR8xqg7argBv65zXLp1enH617RzP9Uy/dRiYrPle5BnQL70QZEW
         1R3xrdp0N391AOqImE0fJ/PApKAvdFSYGUa6E12gVlhaCgW2wJCLPXotk57YmV1Yb/j/
         4RaVPYbb7WdzpbTMEHadlvJf0rYtG2CZZfsBigGUmnqNwRocffmHQvJagbBW5hpdThbx
         npeg==
X-Forwarded-Encrypted: i=1; AFNElJ+k8sKuoymorpupOXj1sYhJ3YCIhWtz0F6n/OaFVI330tjUM9v6XhQKP+GPWYNoxXRcSjnK4MM/ZTK/LQZxwprM@lists.infradead.org
X-Gm-Message-State: AOJu0YzUJ+f7JHVkkV7b5It+rfoxfDC+DB17QcnKyvLpGeCIXqcR//Qz
	SCj7oyObHWRMPt7ARfO3cqXZ/Iwugs/4eFj6CV6ApqnSS6XSCKIgBpxYOCr2v/oEiiA=
X-Gm-Gg: Acq92OGRSlGb2vKr7IHcWhZcf88ZA5dJHQCx1OoYkY4mSLm0N6pLzCyE1bFPzEGBTTf
	7RZliHlI5Ofvx7QCQAZTDqRrzAUqAjcnYE/wcSUczhf5lcHDTBJ4RrZZ5BH0KrRe/ZLlr/1LmfD
	qxgtsh8wy+wfx+SOCkFTYTt3+5e1roa0iGPxh2rBa4L04APqDeBKKGAaLxGYoEZv9hOrEOuqU7i
	jo9cF5g8v7Phrv5xlhsFCB75JORMgmaxXh0QXkSKPNVLrbRpmTTCdCRa1khqTrLUed6qAH5vzi1
	d6GxLsRrgN00ty5IvlVlk1KfsHqAofcB9OWvQlK7KP/1kKDvfxVAYahEGND0R2Y2ImN2dFvqSAO
	fNfle6cua4qE3hmYNjdLiP4VJ4PJQGvr7blAiJoLqtmpfDz5+Sps2dj/VyEcrW2ZY58MFLFE3ER
	g09VZc9/LwrARWDU8X3j159ZU=
X-Received: by 2002:a05:6000:4a02:b0:45e:ced1:19c1 with SMTP id ffacd0b85a97d-4603063eee7mr14300728f8f.3.1781009690891;
        Tue, 09 Jun 2026 05:54:50 -0700 (PDT)
Received: from mordecai ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm63402978f8f.3.2026.06.09.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:50 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:54:45 +0200
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
Subject: Re: [PATCH v6 13/20] dma-direct: rename ret to cpu_addr in alloc
 helpers
Message-ID: <20260609145445.6144add4@mordecai>
In-Reply-To: <20260604083959.1265923-14-aneesh.kumar@kernel.org>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
	<20260604083959.1265923-14-aneesh.kumar@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_055452_821979_FF6C31F8 
X-CRM114-Status: GOOD (  21.99  )
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

On Thu,  4 Jun 2026 14:09:52 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> ret in dma_direct_alloc() and dma_direct_alloc_pages() holds the returned
> CPU mapping, not a generic return value. Rename it to cpu_addr and update
> the remaining uses to match.
> 
> This makes the allocation paths easier to follow and keeps the local naming
> consistent with what the variable actually represents.
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

I wondered if cpu_addr is descriptive enough (a CPU address could
theoretically be virtual or physical), but I can see that a few other
places already use cpu_addr to hold virtual addresses, so yeah, let's
keep this name.

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

> ---
>  kernel/dma/direct.c | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index aa3489aa10a0..4e446aa4130e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -204,7 +204,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	bool mark_mem_decrypt = false;
>  	bool allow_highmem = true;
>  	struct page *page;
> -	void *ret;
> +	void *cpu_addr;
>  
>  	/*
>  	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> @@ -318,34 +318,33 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  		arch_dma_prep_coherent(page, size);
>  
>  		/* create a coherent mapping */
> -		ret = dma_common_contiguous_remap(page, size, prot,
> -				__builtin_return_address(0));
> -		if (!ret)
> +		cpu_addr = dma_common_contiguous_remap(page, size, prot,
> +					__builtin_return_address(0));
> +		if (!cpu_addr)
>  			goto out_encrypt_pages;
>  	} else {
> -		ret = page_address(page);
> +		cpu_addr = page_address(page);
>  	}
>  
> -	memset(ret, 0, size);
> +	memset(cpu_addr, 0, size);
>  
>  	if (set_uncached) {
>  		void *uncached_cpu_addr;
>  
>  		arch_dma_prep_coherent(page, size);
> -		uncached_cpu_addr = arch_dma_set_uncached(ret, size);
> +		uncached_cpu_addr = arch_dma_set_uncached(cpu_addr, size);
>  		if (IS_ERR(uncached_cpu_addr))
>  			goto out_free_remap_pages;
> -		ret = uncached_cpu_addr;
> +		cpu_addr = uncached_cpu_addr;
>  	}
>  
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
>  					 !!(attrs & DMA_ATTR_CC_SHARED));
> -	return ret;
> -
> +	return cpu_addr;
>  
>  out_free_remap_pages:
>  	if (remap)
> -		dma_common_free_remap(ret, size);
> +		dma_common_free_remap(cpu_addr, size);
>  
>  out_encrypt_pages:
>  	if (mark_mem_decrypt &&
> @@ -439,7 +438,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  {
>  	unsigned long attrs = 0;
>  	struct page *page;
> -	void *ret;
> +	void *cpu_addr;
>  
>  	if (force_dma_unencrypted(dev))
>  		attrs |= DMA_ATTR_CC_SHARED;
> @@ -453,7 +452,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  		if (!page)
>  			return NULL;
>  
> -		ret = page_address(page);
> +		cpu_addr = page_address(page);
>  		goto setup_page;
>  	}
>  
> @@ -461,11 +460,11 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	if (!page)
>  		return NULL;
>  
> -	ret = page_address(page);
> -	if ((attrs & DMA_ATTR_CC_SHARED) && dma_set_decrypted(dev, ret, size))
> +	cpu_addr = page_address(page);
> +	if ((attrs & DMA_ATTR_CC_SHARED) && dma_set_decrypted(dev, cpu_addr, size))
>  		goto out_leak_pages;
>  setup_page:
> -	memset(ret, 0, size);
> +	memset(cpu_addr, 0, size);
>  	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
>  					 !!(attrs & DMA_ATTR_CC_SHARED));
>  	return page;


