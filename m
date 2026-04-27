Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DD2FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 13:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PYGlOXEG6E9/P2t0qYpdnkfCSnyFBuw0mLKh5MPI4E=; b=bnkeO1ujoS0yt1CnWbFXdj5x68
	V1AClHyrr1gsYrA+W6TREjDnPyNu/teJVGgcDmf237+DBprKhIcMQM4LozvF7+xJsJpinDVS7bV1q
	2Q3RfDRFRDIkvmmgImzL6lDnRHKD+eOrX0OAuFEr7IbG/llTgmmdk0hcBiO8HmcNscvwG2o87/Udh
	xooIVMIkT4lS5B4e+Xe0OfAHhZqC3x/e1+nfI9lb8qUs57jtrAGyFZbIm2fJw3dbHqzlynYi8k+u9
	IyvLmE/kk+xJr+MogfJDoNsyTb4NrP/qpE91SbdH1T1d68AfsmusDHYj0YVR7GIEhvJJ+ipctpjr1
	2RAu5HqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMKk-0000000H1fb-0K4X;
	Mon, 27 Apr 2026 13:49:10 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMKh-0000000H1fD-1k6m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 13:49:08 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8a5800772f3so75623946d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777297745; x=1777902545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PYGlOXEG6E9/P2t0qYpdnkfCSnyFBuw0mLKh5MPI4E=;
        b=GgpcP1qL1GRU44YXJ6EYxs/mK6Xlwv7tPqw6PkkFaz2YCO3iw31FWQzKqdkQZMnGRr
         26R3tl2ijoDh9O4RlwwKyR4JlA6uuDsZLKJk7R7Zka1BWUFyeDgajrNVlV9G03I9wUtQ
         H4iIkD9kd2FSYSQ329Zby5/bDSXnky587dh9kaTBcy4ML0exNQri3U6PNvbG+12Lzut2
         LgD6R4YfwmVLvIR/sgljLtIAYWUf0bTkQPrfd+5Oe6RzzF52JmFg8puipAmfS7Wy5KmN
         FwXyc0NLeOGonow9Ydmz5aZ+Fs1OoaPdftnlUsNJDwYvQJcpORTMLJ90gBnLNEJOPNXR
         roKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777297745; x=1777902545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PYGlOXEG6E9/P2t0qYpdnkfCSnyFBuw0mLKh5MPI4E=;
        b=NjUlhkBz+d6U8TTmJJ9xFP8gJzYeLxFeTSweCxsm0BV05KZt+SuI1+RYudkCqFelOk
         s2no46uWGHvEkB6iyK7SwOCNGAqF4YBGeRxOoR/6ySX5n04+Iy41j1pJdCT+tXRHeL99
         3V+QWv03nosV1il19cPSUa9GToFKuge/z5dUtkqZYDfTcQEys+7k83useWvOEZKsSvLe
         Zrz++V5+5AyVko14SFsX9yazlgYZzVNqDQukd3Nzs35X3n31IzRfNDDagCtSd5Eh8eE1
         Uf4oltFeAOsA3w878OGIqFv+5Sox045tlWk88ILYev43ypvQkXKULL2XOHuSZxnkgn7b
         wkEQ==
X-Forwarded-Encrypted: i=1; AFNElJ88Q/uDGY0cQqPPD+sUEBi+MKQzIrVSVjwfdzvbcDi//2LBt232rd9iABzpp+dEpmM3T3zxN03VPqa8VRK74Vlg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwwyct3+IDYbnofpoOh0XpvoRBrjAh9hIfATY/6vIQwzZ7lOWO
	9ZjMofAzV8UEuXg16ad9/1zvR8jNvLs69edkTrE1xfAqyfq8wshbzicBJM/qhtYE5rQ=
X-Gm-Gg: AeBDievbszs3OmUJZlp1gprZBAiUKm/b3BZQunxmVLmPcHUqm2S7xvzsiWdbvSD5HMQ
	aIBSfRtJWugbOF5Nbsx/O4krCf7sW7BbMlM8Uuoz7Qu/m52gg0UID/icFBKi3OFyqGbASlGNIVF
	DstY3kTR+B6TapA7fQzfseZDwp+gUYUk2MyQASD8FXw5PNobPbP3h6bxFVGKbwGB4pQ6zsNzkNX
	GKeON8Dfclomx+q3mIRBdTx3qQ30pi/3JdafznPmHdLcEjh8SCNmiD2lH+jXjgDDawZgHI+V4SW
	9wAvHFDwGE4WGcqVlKaDbnrWR9MLu8s08ZUU7T7h35BDAzew11q55ldFUB7F55U8OoNmtLRa8OZ
	fdE4ECC8+HOyF/uuvplJ/+0QFYj1Bd2sBaosowMqoiI0hvEFHthSsSKjyJz9Y/rzxukgw0g5fN6
	xtfrw9jGUatPMXCtlaPLtNipD4/QkbTjMTeE9u2z/E4ZdNFXeKRdKNVQSASAMgMzaWcCNnwJ3l8
	6fKkxNK71zouztP
X-Received: by 2002:a05:6214:6107:b0:8a5:bd5b:e5f with SMTP id 6a1803df08f44-8b02817a4a5mr537295746d6.51.1777297745279;
        Mon, 27 Apr 2026 06:49:05 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02aa4f1f9sm257474006d6.0.2026.04.27.06.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 06:49:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHMKd-00000003T5r-43dX;
	Mon, 27 Apr 2026 10:49:03 -0300
Date: Mon, 27 Apr 2026 10:49:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 2/3] swiotlb: dma: its: Enforce host page-size
 alignment for shared buffers
Message-ID: <20260427134903.GA740385@ziepe.ca>
References: <20260427063108.909019-1-aneesh.kumar@kernel.org>
 <20260427063108.909019-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427063108.909019-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_064907_650085_E9FBE209 
X-CRM114-Status: GOOD (  23.10  )
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

On Mon, Apr 27, 2026 at 12:01:07PM +0530, Aneesh Kumar K.V (Arm) wrote:
> When running private-memory guests, the guest kernel must apply additional
> constraints when allocating buffers that are shared with the hypervisor.

This patch has way too much stuff in it.

I think your patch structure should be changed around

1) Patch to add mem_decrypt_granule_size(), and explain it as
   the alignment & size of what can be passed to
   set_memory_encrypted/decrypted()

2) Add support for mem_decrypt_granule_size() to ARM

Then patches going caller by caller of set_memory_decrypted() to make
them follow the new rule:

3) its

4) swiotlb 

3) dma_alloc_coherent

etc.

don't forget about the new dma buf heaps too:

drivers/dma-buf/heaps/system_heap.c:    ret = set_memory_decrypted(addr, nr_pages);

It is worth calling out in the cover letter that all the ARM CCA
relevant places are fixed but drivers/hv/ is left for future.

> @@ -33,18 +32,30 @@ int arm64_mem_crypt_ops_register(const struct arm64_mem_crypt_ops *ops)
>  
>  int set_memory_encrypted(unsigned long addr, int numpages)
>  {
> -	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
> +	if (likely(!crypt_ops))
>  		return 0;
>  
> +	if (WARN_ON(!IS_ALIGNED(addr, mem_decrypt_granule_size())))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!IS_ALIGNED(numpages << PAGE_SHIFT, mem_decrypt_granule_size())))
> +		return -EINVAL;
> +
>  	return crypt_ops->encrypt(addr, numpages);
>  }
>  EXPORT_SYMBOL_GPL(set_memory_encrypted);
>  
>  int set_memory_decrypted(unsigned long addr, int numpages)
>  {
> -	if (likely(!crypt_ops) || WARN_ON(!PAGE_ALIGNED(addr)))
> +	if (likely(!crypt_ops))
>  		return 0;
>  
> +	if (WARN_ON(!IS_ALIGNED(addr, mem_decrypt_granule_size())))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!IS_ALIGNED(numpages << PAGE_SHIFT, mem_decrypt_granule_size())))
> +		return -EINVAL;
> +
>  	return crypt_ops->decrypt(addr, numpages);
>  }
>  EXPORT_SYMBOL_GPL(set_memory_decrypted);

This should go in the ARM patch adding mem_decrypt_granule_size() to CCA

> diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
> index 07584c5e36fb..1e01c9ac697f 100644
> --- a/include/linux/mem_encrypt.h
> +++ b/include/linux/mem_encrypt.h
> @@ -11,6 +11,8 @@
>  #define __MEM_ENCRYPT_H__
>  
>  #ifndef __ASSEMBLY__
> +#include <linux/align.h>
> +#include <vdso/page.h>
>  
>  #ifdef CONFIG_ARCH_HAS_MEM_ENCRYPT
>  
> @@ -54,6 +56,18 @@
>  #define dma_addr_canonical(x)		(x)
>  #endif
>  
> +#ifndef mem_decrypt_granule_size
> +static inline size_t mem_decrypt_granule_size(void)
> +{
> +	return PAGE_SIZE;
> +}
> +#endif
> +
> +static inline size_t mem_decrypt_align(size_t size)
> +{
> +	return ALIGN(size, mem_decrypt_granule_size());
> +}
> +
>  #endif	/* __ASSEMBLY__ */
>  
>  #endif	/* __MEM_ENCRYPT_H__ */

I know it seems a bit small, but put this in its own patch and explain
how it works. I'd also like to see a kdoc here, and add a kdoc to
set_memory_decrypted() that links back so people have a better chance
to know about this.

Jason

