Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFAFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 03:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DTF91RjgvUm3CkB4plK9HEQr87d/ix1i757jTGkFXY=; b=CF/FNeMDfvZejM3PDn6C66Ni6Z
	qW2aPqsFj+zkmgyLNINan3aRQUAu2u4rS6MJPhZvAzyn3qNYEtQhnvI+u63w500t3g6ZtsfjwofYc
	oT6QGO2fOA6HLLhfoC5GP9k7qq0/EjfYjE2jn13Rj9jqWMBrcTBdoinE/aWlVy/yzLG9lKCDYP1ZG
	ffpWvKiAd7H4UjNk1i/cChjGreF09kwuuZpxOciN2T3trcasbPhFaS+WUI1FIbOoplsO0oJCqkI65
	lPhCumZUcCwquGKvLuiRSB8p5PzrcE8fIBH/Hupe5GMoPpmNKclJ+H+BzfORyqL2DNy59PxijMppE
	n9Ab7iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUGj-0000000AqJ2-0djy;
	Tue, 14 Jul 2026 03:57:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjUGi-0000000AqIv-0wyf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 03:57:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31EE8601DE;
	Tue, 14 Jul 2026 03:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0781F000E9;
	Tue, 14 Jul 2026 03:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784001434;
	bh=0DTF91RjgvUm3CkB4plK9HEQr87d/ix1i757jTGkFXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=liTaKP1CyQrmvF0csupiCFTNVzXrIF4DX9PY42lGELqbECDbZSqXHFZ9ZmTU2m0e9
	 5KWxINF9sfknPV5nVNQ1W/TliVFmJMCkEjFEYGHUfMP22YLVwQTk3GvT9OKdkoUmd7
	 O6t/MMHc03XpwRzKpXb5NBzNwRLz6dmuIH1uOX5bFJfbq9eOuqVSgWUPXIHBRMH22u
	 AmQ2hRYMtzI26BCCfdviKKLYvAzWyATOKECrGshO0bgqaHnTSbVIB7dcZWobY+G5/R
	 hXLxwzKEw2QW/46MBn1MokgBPlijaMw8orHsIzchJadQjcBC1HAK2Epj4bNYTUnO6g
	 2ZAHiwxtlSCjQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
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
Subject: Re: [PATCH v7 04/22] dma: free atomic pool pages by physical address
In-Reply-To: <20260713181059.GL3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-5-aneesh.kumar@kernel.org>
 <20260713181059.GL3133966@ziepe.ca>
Date: Tue, 14 Jul 2026 09:27:01 +0530
Message-ID: <yq5awluymdf6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Jul 01, 2026 at 11:19:08AM +0530, Aneesh Kumar K.V (Arm) wrote:
>> dma_direct_alloc_pages() may satisfy atomic allocations from the coherent
>> atomic pools. The pool allocation is keyed by the virtual address stored in
>> the gen_pool, but the pages API returns only the backing struct page.
>> 
>> On architectures with CONFIG_DMA_DIRECT_REMAP, atomic pool chunks are added
>> to the gen_pool using their remapped virtual address.
>> dma_direct_free_pages() reconstructs a linear-map address with
>> page_address(page) and passes that to dma_free_from_pool(). That address
>> does not match the gen_pool virtual range, so the pool lookup can fail and
>> the code can fall through to freeing a pool-owned page through the normal
>> page allocator path.
>> 
>> Add a page-based pool free helper that looks up the owning pool chunk by
>> physical address, translates it back to the gen_pool virtual address, and
>> frees that address to the pool. Use it from dma_direct_free_pages() while
>> keeping the existing virtual-address helper for coherent allocation frees.
>> 
>> Tested-by: Michael Kelley <mhklinux@outlook.com>
>> Tested-by: Mostafa Saleh <smostafa@google.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  include/linux/dma-map-ops.h |  1 +
>>  kernel/dma/direct.c         |  4 +--
>>  kernel/dma/pool.c           | 54 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 57 insertions(+), 2 deletions(-)
>
> This seems pretty suboptimal?
>
> If !CONFIG_DMA_DIRECT_REMAP then page_to_virt() was used to compute
> the genpool's addr so dma_free_from_pool_page() can use the same
> logic, which is how things must be working at all today
>
> The CONFIG_DMA_DIRECT_REMAP scenario does look broken, so I'm
> surprised there isn't a Fixes line on this commit? I don't have an
> opinion on the search, but since alloc_pages() is used there is 8
> bytes in the struct page that could be used to store the remapped
> vaddr to avoid the search if someday someone wants to improve
> this. Maybe a small comment hinting that direction would be a nice
> addition.
>
> Jason
>

Something like

+/*
+ * FIXME!! We could avoid this by storing the remapped virtual address in
+ * struct page and using that for lookup.
+ */
 bool dma_free_from_pool_page(struct device *dev, struct page *page, size_t size)

-aneesh

