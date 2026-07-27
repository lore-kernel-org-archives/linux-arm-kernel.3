Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0CBC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2qS5mLYUTp7Uhtq7TiQK32AVf+rs7o35+jqHSIQjdw=; b=q/Ql1MiHlOs7JM9mFZf53W4DtO
	4Sc9hLdrzRx713hx3ZHJu18v00RES4BnuD2qS/GBb7ZpygRepOTk/PebbRT9em9OAipaFWH4Ypue2
	2+56MwFkV6aXQWKeesMzn9ticxcVVp7sj8AostSdEFEl5GWeuqIzRhyoZ4Rcy/bxvFs2CVNgCgjT8
	7KYNordQodtD3WqNo+bNCtEl9khv4ifjXpauUMJ8KvUPmG3r5ybt8BKJ9fGlEAZJKVdsNZEpkI9Va
	aYEk+gvdAOVQmKNIh44E2cfutsnQidPUWLLQYt6YJPUJxCM29Td8TTFiVSZ+JeRCtWqyA23zMID8S
	67dgdCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJh2-00000002bTE-1m6i;
	Mon, 27 Jul 2026 11:40:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJh1-00000002bT7-1vHK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:40:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E42B64387E;
	Mon, 27 Jul 2026 11:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970C81F000E9;
	Mon, 27 Jul 2026 11:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785152422;
	bh=n2qS5mLYUTp7Uhtq7TiQK32AVf+rs7o35+jqHSIQjdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T7OMLWX0gYiwKXEiXgssU5fPiaQe6F++mUD+fwHLVNHIk9HOv1Yvhh9ZRchQz32Nt
	 LnQ5LDiAdizYA+qmqA1SVxRHHAR0hoEt/bd4mCi8k6Hq/JFkP6WuOj8ApoNfm3Ly9K
	 iuAxRMvaicTI+NcpJiKAWEuPtZCNJ1uOO9vIJPigpr6q+2V+HODr643mVFec0Q3OrI
	 XE3oGi3J/mM0RfCrQrwZDKOfBEgBLA8zQrBUI4xB2kD+tO8gQRyhCXqmt6Oi4fDDXH
	 nqQ7sees8iukt4+eTNpLhy3yicdte/VE2pqIL3ZlBXQZzdpHfIAHUuH8PK7DK1aaWx
	 A5wogUb8a0VKg==
Date: Mon, 27 Jul 2026 14:40:15 +0300
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
Message-ID: <20260727114015.GL12003@unreal>
References: <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
 <20260723075704.GC110966@unreal>
 <amTJY_CdE-uDgoGG@ziepe.ca>
 <20260726081753.GD12003@unreal>
 <ambdXXcfgK+cxqxa@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ambdXXcfgK+cxqxa@ziepe.ca>
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

On Mon, Jul 27, 2026 at 01:23:57AM -0300, Jason Gunthorpe wrote:
> On Sun, Jul 26, 2026 at 11:17:53AM +0300, Leon Romanovsky wrote:
> 
> > Currently, the phys type universally describes memory and can be
> > reliably translated into any required representation. It is the most
> > fundamental type we have.
> 
> You cannot go from phys to page reliably unless you make assumptions
> about the phys, that's the whole issue here. If the callchain expects
> and intends to use a page it should really stay in a page and not take
> a side trip to phys.
> 
> I agree it would help to have some helpers that were more phys based
> for the callchains that want that since we are mixing two fairly
> different activities in these functions..

Yes, we are agreed here.

> 
> But making phys the only output out of the pool isn't going to be an
> improvement.

I don't know, phys was natural suggestion due to multiple
page_to_phys/phys_to_page conversions down the road.

> 
> BTW how does a struct page even work for decrypted memory? You can't
> actually use it that way right? If you try to access it then you'll
> get the wrong IPA and it should explode?
> 
> Maybe we should be blocking the struct page path entirely for CC
> shared?

It will simplify things. Ultimately, this series demonstrates that
CC users must be aware of the memory attribute (CC_SHARED) and struct
page is too generic.

Thanks

> 
> Jason
> 

