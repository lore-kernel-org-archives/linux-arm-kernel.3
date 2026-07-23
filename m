Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B49EC44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS1NMvx865gW2UoErMylGfTUK0dtoB1K+HlWaCkJDOs=; b=a4GDs4K44EAPeN7em84JCtOIoB
	MG82Bfq7/6kXffErprW+E5ip8kWUvdVqRElPnMiuPWZUCIp5JaUuGqN/Wk6p7Y3/LYszitzNam5n/
	wdh7XTSC9bmmoDGr/l6KgaoMSkbcdDLOvZnHtwtJKzTADaAcl0In+A05scuhO9PSJyul0kV2nuey9
	qlCzPpXau9IAxbpt4C8GOkfrKSs6BftQivlfNJClA7Q7Ufe8u7qHjmTY8JtXbE2TlWegyyRg1Tr04
	yIDUuwV0k37YMGMWSNMaJIQc6vJBseIEmAwG7ytuzdCjBH6BJ+E00QC07pRAr5Zg160ywthu0dJmA
	FHfYTKZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoDD-0000000Dg3N-46np;
	Thu, 23 Jul 2026 07:51:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmoDC-0000000Dg2y-23d9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:51:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 587A360A6C;
	Thu, 23 Jul 2026 07:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBAF1F000E9;
	Thu, 23 Jul 2026 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784793081;
	bh=oS1NMvx865gW2UoErMylGfTUK0dtoB1K+HlWaCkJDOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C5yVtX07ZkUJj3b2b+kYtfuR23XpTFRkdHRdENTWAARDLYmTf2IRILt6XAP3lcQ3i
	 guxWOSpqvbZxIkPudGanZc9oRLKmaWg7jWE5nWdWWffLISp3ZQ+ad4Ihoe02/FYjI0
	 zawcqNvZ4YMD98rRRw9KmxbnYTZO2a2pevFxO+lic7WvlenUPBRb/qjJSo021Hq+fK
	 RnJUL29qw9dIMmgyNVWejeSnfUWslCr7nlHO+wb/2jqEuc0/cAk14jRWF5Uc2ySZeT
	 fSQ5DwAeoStwg7yjuT2gjGQyNTVPQV9uRZe39mcHkbKAqEo5c/lhrEDQ+DHZjlr32v
	 nL9nveFp0YtMA==
Date: Thu, 23 Jul 2026 10:51:08 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <20260723075108.GB110966@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260721124056.GK110966@unreal>
 <amEglRH3u6UFFnIQ@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amEglRH3u6UFFnIQ@ziepe.ca>
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

On Wed, Jul 22, 2026 at 04:57:09PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 21, 2026 at 03:40:56PM +0300, Leon Romanovsky wrote:
> 
> > Why don't we continue the effort to remove "struct page" entirely
> > from the DMA API internals?
> > 
> > IMHO, everything not exposed to DMA API users should use
> > phys_addr_t, including the DMA address pool.
> 
> The alloc interfaces return a struct page, that is why this stuff is
> organized like this. Look at dma_alloc_pages()

And I didn't say that we should change dma_alloc_pages(). It is external
API, which needs to be struct *page. I'm talking about internals.

Even dma_alloc_pages() flow shows how convoluted and non-uniform
the code underneath which performs translations all the time.

dma_alloc_pages()
	->  __dma_alloc_pages()
		-> dma_direct_alloc_pages()
....
	ret = page_address(page);             <--- here we need virt address
	if (dma_set_decrypted(dev, ret, size))
		goto out_leak_pages;
	memset(ret, 0, size);
	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page)); <- and here we need phys address
	return page;

So my point is that internal flows should not require struct page
and should not depend on it.

> 
> There is also an API that forms a scatterlist that has to be struct
> page as well
> 
> Jason
> 

