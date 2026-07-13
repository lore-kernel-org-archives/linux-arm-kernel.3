Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E3BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI/VqVGbyjLJTRr9oYnYDAONmrfr0w8bRuYGoSNi5Tw=; b=rgDboR4wTXM6FmjOXR1KHw+i60
	JAjoSvsk2neiB/hV+PZ5qGDCScjkgi+CLzV85aGlkoqGMH6EAanJdcWpMBN22pPfTbPx/eaJnYfyG
	xdTt6jio+/fngeCrx+9wz8GpSqXhU2rPrUc0q3Ppgi101fhGqXRrI89KxTaBLedihslTrKHX19RlZ
	FbFcjxSIEoGqFoSro9eKOi45fQIkb1tTGeY6m4Mu68XiVdmwkvthHV0GGQKl+ys9jBI71EZSByvE9
	BHF+S+W6GobMtydrTUHon2+2oE7QV7joaOXuorRyZhq8nq2FhYUMSVlwxQlbbzcqHM17Wpj+KW8Ca
	xIL06XGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjM1A-0000000AFsn-2kEM;
	Mon, 13 Jul 2026 19:08:40 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjM17-0000000AFsP-2fWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:08:39 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so2168176d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783969716; x=1784574516; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xI/VqVGbyjLJTRr9oYnYDAONmrfr0w8bRuYGoSNi5Tw=;
        b=UgbMiG6dyNReDJtY4zhxBxKdO4zGbtEdKhZUY0eDAYGoJC6YZqA3TjXJ9Z+BiCVJbz
         NSVW9gzaqVH8INCi2pKgQRnSFL9Wum4kWgeN1REVwnOawfX/K+rs93C4/mNGbphEazZX
         wy8hp2j1aJc+vodUmF/Ns2aaO19YHEZDqRNHVMSXneQCDwzimXupHEYRm1qLOtlkZd0w
         UAQlyhQ00OjRZ/Kgr2gY9uE0WyJq5dQeBVyMPmIXjR9mSFg+2OKu5+LMyf+u+4UfNrOr
         d79MAd/3+weEMezwre7oS8jjnOKQdVNfd7IbqmgKToXj7DMYWH2GIHMP/ocOd+Jskk7b
         B/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783969716; x=1784574516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xI/VqVGbyjLJTRr9oYnYDAONmrfr0w8bRuYGoSNi5Tw=;
        b=WUji8VhhByS2LSyWgM5LjLdNmjHvnmm3mfHM1wd742s77iz85CBix1j3g6xkMr9Hi1
         oVuI72OPPdGzmYeHfzFrY6JdK/V0Mw5axbwYwywrWdbX7pMAbZhVZ9MdD0o5NQ/enSTO
         0lvEbUyvLR4QmlPXVarlhLyL27dz9ptdBVic9fRDpylXOEw8vc1w7xBpn/E6atp+p6Wx
         +FfyIyjBSLnV66isYshhF161bMWlDsUjhuU3kxroJAPnzTYWpCo8UvvltzLuDzYSlDrj
         15eM1buUmIdc2/EOLH7jBEyt2s9HaKZ+hAICIpN14x+Gz4OwYz4a9unZ5H0AKZTj4W9h
         X6Cg==
X-Forwarded-Encrypted: i=1; AHgh+RqbkL48I9rZmigoHSPdM3bahBpOOCeS8mYQAxN5OOPACL04EyEZlO9Uscz2nZzAO/oJ965ITHAmhcN0FEZsRC9X@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0RIDZ3D8EYtsMaEAUJG+/I47dbxnsTD6MxA2u4QIFGTFeEYur
	6PWht4bEzDf2mYVKXuTmhXxQZ1Eat0qCr9IovHOtU3xg2c15GvH4Z2l/BBgjkbofuuY=
X-Gm-Gg: AfdE7ckEG2F4YjaIYAxUsWCKIv5oekCef7C+N+Th8I71+6GZM/usKwVqSYqoM23ris+
	b8WqAM9rxDCLlKiUbqjkmjrheyzfim/fCCfPdG5Tllc/QYKBpvi5Sq54U+1zBlk+dP3qUFTPKfc
	FhENRODtQLonhFgdDJJWKH53D1vZlr7s6ApQP3LgOIEEQajH58MzJM6FAkKMLepm+zX+URDwoni
	B3y5PMoQMALQ1OCTuq5s8r0+shZz+m2sZuq2TMTgmh3r/n3X+eEZTiUmjukksM1mXMgRC2sfQhz
	GrKZRezO3dKr5mJ0tJ6VZolihO5l0O7I4SO8EzYTAhN2GMv72Q8BP6TzupDDyMiOz2CW5Sj52AA
	he/PWtb5ipd+AFSkuLKCv40VaJlBG8sb69ctwp1m8hyGhmA+uM6KyCxKa1Vzy
X-Received: by 2002:a05:6214:419c:b0:8ef:6c8a:e8db with SMTP id 6a1803df08f44-9040206aa9fmr110916776d6.47.1783969715612;
        Mon, 13 Jul 2026 12:08:35 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e0811sm137651756d6.3.2026.07.13.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:08:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjM14-0000000E3qf-1Q0G;
	Mon, 13 Jul 2026 16:08:34 -0300
Date: Mon, 13 Jul 2026 16:08:34 -0300
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
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 05/22] swiotlb: Preserve allocation virtual address
 for dynamic pools
Message-ID: <20260713190834.GN3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-6-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-6-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_120837_686702_501B4D0F 
X-CRM114-Status: GOOD (  14.28  )
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

On Wed, Jul 01, 2026 at 11:19:09AM +0530, Aneesh Kumar K.V (Arm) wrote:
> swiotlb_alloc_tlb() can allocate from the DMA atomic pool when a decrypted
> pool is needed from atomic context. With CONFIG_DMA_DIRECT_REMAP, the
> atomic pool is backed by remapped virtual addresses, which are not the same
> as the direct-map addresses returned by phys_to_virt().
> 
> swiotlb_init_io_tlb_pool() currently reconstructs the pool virtual address
> from the physical start address. For atomic-pool backed allocations this
> stores the wrong address in pool->vaddr. Later, swiotlb_free_tlb() passes
> that address to dma_free_from_pool(), which will fail to recognize the
> chunk
> 
> Pass the virtual address returned by the allocation path into
> swiotlb_init_io_tlb_pool(), and store that address in pool->vaddr. This
> keeps the pool free path using the same virtual address as the allocator.
> 
> Fixes: 79636caad361 ("swiotlb: if swiotlb is full, fall back to a transient memory pool")
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Reviewed-by: Petr Tesarik <ptesarik@suse.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/swiotlb.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

