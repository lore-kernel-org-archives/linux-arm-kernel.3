Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92FCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/wrHcKHA68TkDcKIgsJLD5FCo0DNb4FA5MINQ+2Q20=; b=1d8CE38z8w4qjQS4EJvC0Zl/l/
	9YmErZdlE4uhXCFQ7I/CTBIYjGhAUu6+IPJBiuledSMvUYs7m5Aa+TXRvHSm8QRVn93ZD+PJzWmpA
	fU1M7qg+j8+qpoaJGGRemzON7gmcGboz45yKeSyaEF4ePh3cfGmJcihzeBNQR25OWf7d3VzppCKY9
	zkp1P5qiuCIiTqUtJm4YYBh3d/Y/1f1NhwXaSjttjNY37XvdqfzpmFFnrSK88kLUOtbWs58XT8Exp
	HU3kyNriu78NErSQVyetz17bOtRtVkaAcCrR/7yTf2O5rz+xRseIiKhxqnmuGvHsuR1TV1F5JTkNH
	MxxG9N8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKtC-0000000A9f7-0KXN;
	Mon, 13 Jul 2026 17:56:22 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKt9-0000000A9eh-2Oq7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:56:20 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51bf2479349so25478411cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783965378; x=1784570178; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/wrHcKHA68TkDcKIgsJLD5FCo0DNb4FA5MINQ+2Q20=;
        b=DC6oZN5VhOqFTj2vY/5pobdzj2VXY4wMkFFOAx9JbU4WX+LeAJcX61snve20e/5gOO
         xmFLjBZhu8Wbei6BbDtqGu2JbBEsKA578xbaJi0o34rzrLhlZyCLEjPVZnd9mN5+2fXW
         MOoZnHC+eEEMQslC14LSqTyE2yD/ITdmuJ1EIJCavnNeNCZqsPelOdwUFS9d1oOw/1gq
         sc8h7OZi9hMoR0WIaRTYdZM9tFdoRFaMfKH3pmks8adbtAvQypJr34PKeWdFbIrCuYAS
         3ukcimK01+D8r6ll5tENvswJ6VgwakOrZmSxAmunwhj2oK93IqAZlJ3lWQfQOtRML0iu
         cRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965378; x=1784570178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/wrHcKHA68TkDcKIgsJLD5FCo0DNb4FA5MINQ+2Q20=;
        b=WbDMaz5k8C+BuCnut4iJXziRDHAiabZpIRIqqPBftreGBlk4+9XWCutguaprMNcy7+
         kxZ7H58VW4+SZSHc8T8OUpMTHQN6/5oQRx7jHPAgMC5PGsiEXf6nX2WKxBptNIgcO5Ac
         tydFDu6//GFGKhxD05c1LXBKpb4VftyNct5ZdmHwMSd/b8ru4TcrPUTVK4grqx52ALV7
         Gvm6xP4eU0bSCE9sv1bGijZ94tDDTHW4ONqkzzleRKEJC9eKqsXp55pgIWiSpG4Yqrja
         6HRPuWzStoVFKDTjvfuksPPMcF1jM1sAal8e0xzb6dowNe/enEWFmxDXG5yxEmtlOd+v
         fDAg==
X-Forwarded-Encrypted: i=1; AHgh+RoYPpWSxxbjH5cHZ7WXTdJUbWmQijWG/z2e/ahynaVGoNpeMkoR1UcVFf5R+GZOMW81V9DjI7+EvjHf98Jk+JRd@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdXYjNKqzvhBYFD+nQhLo6/GH11jAZhAr3qY8iA4iY3kC9WPj
	ZiptCYsRTuht3IiDXdLx4HPP9C8JIPRXvJxOfZ6sNZ+gdCZFymaD47qgDHs8TF0r7JUHrHMjwbp
	DsCnD
X-Gm-Gg: AfdE7clnyOuuLp5DcxmrMRbx2fXoPI1uQMGU9llVUAH4P9gVBbkLC7/Uyi6vcCHG+HQ
	Z0xLGCLlZT4zy7qOP1BJd/MWcBpxcjubqb48jMxCnrMhoLq/5LpZhvoMnSMD5JCYmbXkddoqdk5
	pIZ8bZJToybYFBTms/d4WoA0UHQhowasdFXY1RpQpyKpf+rWVEmcmIRJhPk12T23s9H+LiV6U0g
	/euVCrZOzSua5WgmIgXuC7TQYhI2ytry/lwux05JDYnvBIrcNgfIR5nXzjXkPIn3yzSARAuoIsX
	Ipq/1hPQldbAKRsgG0h0uQm7CgixqcDUM5IXatUOGu746IGZb7FLfL3YhwwQcYKdtkTVLQ/dYGO
	8IepAXiAa0TdaFSLGiCfA+JECUVvWF6Lhz9jxM4RwYKKHqoeYk/dQ/2weGrW0
X-Received: by 2002:ac8:584d:0:b0:51a:8945:3141 with SMTP id d75a77b69052e-51cbf1faa3dmr98217881cf.55.1783965378189;
        Mon, 13 Jul 2026 10:56:18 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm91065131cf.22.2026.07.13.10.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:56:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjKt6-0000000Dx9V-2ddz;
	Mon, 13 Jul 2026 14:56:16 -0300
Date: Mon, 13 Jul 2026 14:56:16 -0300
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
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260713175616.GJ3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-12-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_105619_622072_E508C58B 
X-CRM114-Status: GOOD (  13.03  )
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

On Wed, Jul 01, 2026 at 11:19:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> -static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
> +static int atomic_pool_expand(struct dma_gen_pool *dma_pool, size_t pool_size,
>  			      gfp_t gfp)
>  {
>  	unsigned int order;
> @@ -114,14 +120,17 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>  	 * shrink so no re-encryption occurs in dma_direct_free().
>  	 */
> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (ret) {
> -		leak_pages = true;
> -		goto remove_mapping;
> +	if (dma_pool->cc_shared) {
> +		ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> +					   1 << order);
> +		if (ret) {
> +			leak_pages = true;
> +			goto remove_mapping;
> +		}
>  	}
> -	ret = gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
> -				pool_size, NUMA_NO_NODE);
> +
> +	ret = gen_pool_add_virt(dma_pool->pool, (unsigned long)addr,
> +				page_to_phys(page), pool_size, NUMA_NO_NODE);
>  	if (ret)
>  		goto encrypt_mapping;
>  
> @@ -129,12 +138,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>  	return 0;
>  
>  encrypt_mapping:
> -	ret = set_memory_encrypted((unsigned long)page_to_virt(page),
> -				   1 << order);
> -	if (WARN_ON_ONCE(ret)) {
> -		/* Decrypt succeeded but encrypt failed, purposely leak */
> +	if (dma_pool->cc_shared &&
> +	    set_memory_encrypted((unsigned long)page_to_virt(page), 1 << order))
>  		leak_pages = true;
> -	}
> +

Was it intentional to remove the WARN_ON and comment ?

Jason

