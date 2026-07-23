Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CFAC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MV/ddKhkOPrQoZ9vfnIwVbLJK9zML3biWg/uhRgYT0U=; b=SrUe6hMwqLunlJgMkCRLQ36eIT
	l9xX9lF3+Y/BB8tiB1nWW4oADH/VKN5G7+iwhKDnaFhaQdymKX/tu26/eiCaNoOOM3iGJi+Sx+KTz
	9V1uHJ9vVnu/Xp0L/Vao6kl75cdLGtzi/JuxMae0fF5lQMgbZWVeebTGYT56/joTEGXfYGHQWTYDy
	1f108DaMy2SeZr5fokRyYCvQsYqPitHreh8Nn8NGEPXa0zUx/9zmnNsEhiKSl/TFWFfaUe1JukxQr
	3XJaGyNfxiM2N/Rtu7qydqa1iNzg5ESEFINWMESPJ5n5wldaFlQHKiFgP+jRxpVwwU/WXGANRnvsO
	XMJkh/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoIo-0000000DgX1-0yk5;
	Thu, 23 Jul 2026 07:57:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoIn-0000000DgWt-2tL8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:57:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C5024047E;
	Thu, 23 Jul 2026 07:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF221F000E9;
	Thu, 23 Jul 2026 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793429;
	bh=MV/ddKhkOPrQoZ9vfnIwVbLJK9zML3biWg/uhRgYT0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3xmLXvwi2GMENZnteIxAJT9s/vth/ydaB8jnGiDbnoJQUcvxVpdQ4CJ0u/BR5Y29
	 qaZW01Tiv8f4zxAh9MGXy85RlTXDqDPcKcAejcfjjHjyYTYGbVh/52WQY1d0+CsjH4
	 ZXpYH0x/j/a+NIv+xUiENTmrpZC3T7+frmDwNIUG6kyP4miDxfjWLm2Kn7T3DD2S1N
	 Rr5EEKagMJePKW4DfUuaR2sNSURnR2wMcS+E4LnTti/I86ga4mpseDz/aSW2/dFH2l
	 lQt2pE4DfhbMPDcGZRVqphfYVCpTaURvHtyxvsl8CTFjve+0WEFD5IouvdUm0NhOK9
	 QYRocdPIUyYIw==
Date: Thu, 23 Jul 2026 10:57:04 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
	stable@vger.kernel.org, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 01/23] dma-direct: return struct page from
 dma_direct_alloc_from_pool()
Message-ID: <20260723075704.GC110966@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amEhEKQW0_HJ9cLN@ziepe.ca>
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

On Wed, Jul 22, 2026 at 04:59:12PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 21, 2026 at 06:33:21PM +0300, Leon Romanovsky wrote:
> 
> > Something like, but probably void* needs to be phys_addr_t:
> > 
> > static inline struct page *dma_phys_to_page(void *addr)
> > {
> > #ifdef CONFIG_DMA_DIRECT_REMAP
> > 	return vmalloc_to_page(addr);
> > #else
> > 	return virt_to_page(addr);
> > #endif
> > }
> 
> I don't like this, we don't know for sure the addr will be in a vmap
> and this will fail if it isn't.

Of course we know. The existing "#ifdef CONFIG_DMA_DIRECT_REMAP" is
relevant for addresses acquired from pool.

dma_phys_to_page() is a bad name for some low-level conversion function.
It needs to be internal to DMA logic, in the level when we convert from
phys to page.

Thanks

> 
> Jason
> 

