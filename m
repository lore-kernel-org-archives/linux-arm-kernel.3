Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD6CC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 08:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV3KV7vBjyfzuXzvKP70K3FcZTJiIsGPcCYGDQB6sAE=; b=ySMxwcCz8yT5BkzAlrMM0Lgu7O
	qcqvjTo4KYYl6c3vTvC3EZxwluX4qiU1k7TgZBPNDlMBtf2U5eQcJnec2mtydE+GfVHmPyYoe6ShV
	u5nnQx90B+KfZYlPICSS+xv21X0jvB4slXoALelytDLJ2lFsIQGztVez1KfffU0p36fD6n08Bt+DO
	ZC4UC064oN0ksedaz2E4EXuVJJ3qAQ2OttTDDoIf67Gs6SpOr59YWy/CHH9l0mkO4B/aYGn1ZVemM
	gjer2Jdj25QiuM1/IwQPtX87gkMNKtexPFeYKeB3yk4OEqs0R4pNwWdRXPiIxntRVhrf9Ft3noxDg
	kZeql9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnu3d-000000010Uc-2gSx;
	Sun, 26 Jul 2026 08:18:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnu3c-000000010UW-3Ldj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 08:18:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F349B432FC;
	Sun, 26 Jul 2026 08:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CAF1F000E9;
	Sun, 26 Jul 2026 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785053879;
	bh=rV3KV7vBjyfzuXzvKP70K3FcZTJiIsGPcCYGDQB6sAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QSh6v7LnboLYO6xF16A2+7oGN8HoXODtGw5S8YO/FkrMU2s6CN6sTfDR1dR/lfKoz
	 2qUJFoixbeZXmsG6d/uilEjj2PxxfrzsGPE5BQ6jhQ7HBFfdBcaRGpQouUb6azeUgi
	 n34cs0woLHoRxqtxV+r8p4J5+gDE7MQ2o8/RgCRL+DPKTM2UP/nwvcwVwn7QnpLOsV
	 UEkEXGiiy6JDqh7Ys0iN1ikcBqAGMSkjH68/0zQ4NQTKpbdrGGQ02iEM4JloZieZQY
	 oOKoUoPlmPX5blblYslJfGJhkNgUevihiOHrfRA+gi9U3BaHvOnD+uI6bcD17dyw+v
	 MOsVc9tnoXHPw==
Date: Sun, 26 Jul 2026 11:17:53 +0300
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
Message-ID: <20260726081753.GD12003@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-2-aneesh.kumar@kernel.org>
 <20260721115456.GI110966@unreal>
 <yq5atsps77c5.fsf@kernel.org>
 <20260721142921.GN110966@unreal>
 <yq5ao6g0750v.fsf@kernel.org>
 <20260721153321.GO110966@unreal>
 <amEhEKQW0_HJ9cLN@ziepe.ca>
 <20260723075704.GC110966@unreal>
 <amTJY_CdE-uDgoGG@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amTJY_CdE-uDgoGG@ziepe.ca>
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

On Sat, Jul 25, 2026 at 11:34:11AM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 23, 2026 at 10:57:04AM +0300, Leon Romanovsky wrote:
> > On Wed, Jul 22, 2026 at 04:59:12PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Jul 21, 2026 at 06:33:21PM +0300, Leon Romanovsky wrote:
> > > 
> > > > Something like, but probably void* needs to be phys_addr_t:
> > > > 
> > > > static inline struct page *dma_phys_to_page(void *addr)
> > > > {
> > > > #ifdef CONFIG_DMA_DIRECT_REMAP
> > > > 	return vmalloc_to_page(addr);
> > > > #else
> > > > 	return virt_to_page(addr);
> > > > #endif
> > > > }
> > > 
> > > I don't like this, we don't know for sure the addr will be in a vmap
> > > and this will fail if it isn't.
> > 
> > Of course we know. The existing "#ifdef CONFIG_DMA_DIRECT_REMAP" is
> > relevant for addresses acquired from pool.
> 
> Yeah, but I still don't like it :) It is hard to follow if you make
> those kinds of leaps, someone will call this new helper on something
> they shouldn't

This issue is straightforward to address today. Limit the scope, use
an appropriate function name, and add a comment indicating that the
function is local to and specific to the pool. The latter helps
AI-based review tools flag incorrect usage outside the intended scope.

> 
> > dma_phys_to_page() is a bad name for some low-level conversion function.
> > It needs to be internal to DMA logic, in the level when we convert from
> > phys to page.
> 
> I think we should not convert from phys to page, that's also easy to
> do wrong

Perhaps I'll reiterate my complaint. DMA internals are already hard to
understand. Part of that complexity is necessary to support every
possible use case, but another part comes from a maze of types that is
entirely self-inflicted. I think this code only makes the latter worse.

Currently, the phys type universally describes memory and can be
reliably translated into any required representation. It is the most
fundamental type we have.

Thanks

> 
> Jason
> 

