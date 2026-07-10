Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B38C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfTO3wFu/T6iZFaBLNDZLHaW6Mq653VUZn4uoRS7Zj4=; b=2f8UhNRxs6C/5sT/LlTIhzMCKt
	Cf7QGhplobTJhVJrh3kPCAeXeFTOMdAkSAcZ9FFscrjQRaviVncmESBST/gMwz8QNa4v3ZBoJF+CW
	9llhoUNU6I1uP1+l8DdhTW43yQ9C8GE0/95YRF0g6NMbD+i9nhsvDkv/MjuN1hBp5fWrPYfLxKaRu
	48uQp8vJrs+XEmH+ZQISughpxxVTFVb6Z1nRtKByM0c81HcdEcqrUWSM9m7P9znBfkdaCZ6zPlolt
	fFY3HMXyegVNUDJLkq5wGet1lPA2zf6R0/W1qeASYiufm/2HbXSxoh+nu5w5xtIRYBFg2J+eVtm4U
	CsoULUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8oJ-00000004jtu-1Gb6;
	Fri, 10 Jul 2026 10:50:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8oI-00000004jtl-24vk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:50:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6DCD40813;
	Fri, 10 Jul 2026 10:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4B11F000E9;
	Fri, 10 Jul 2026 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783680621;
	bh=hfTO3wFu/T6iZFaBLNDZLHaW6Mq653VUZn4uoRS7Zj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nYLQ+9PRsu6pTYa7XveNy4Y0cihb6Lvyb2okOddtnzEDFyhKZMoEp28hrsnAuSs1/
	 mZWLZmRgr8X2MEZjnVFnbhGNKuv/d+Kl4OD/zcri16TTTzcUSRPgbwYMsnlmQYVZ2Q
	 fSNn40vQEBtYdfiI8057+h/qZPp0qDO1qn8JAF++X66Q6YwXY6qHMbRN4akzlqykrG
	 X1sftYbJurNQTvVGQJCWWm50cIkILsstPYP8QSi2lEZ21NAzI0sqPbfqxqtElSQcNS
	 pnRxs8cUNLPGyy81RO4cJUiFw3EmrJ5RSS3AlI20Gr4GlHC1U07tf55AuvCMff4Rs3
	 VIJHcPWynLx/A==
Date: Fri, 10 Jul 2026 11:50:12 +0100
From: Will Deacon <will@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
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
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
Message-ID: <alDOZAK_reXPQJsN@willie-the-truck>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
 <yq5av7argr65.fsf@kernel.org>
 <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
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

On Tue, Jul 07, 2026 at 03:03:48PM +0200, Marek Szyprowski wrote:
> On 07.07.2026 10:06, Aneesh Kumar K.V wrote:
> > "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
> >
> >> This series tracks confidential-computing shared DMA state through the
> >> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
> >> DMA buffers are handled consistently.
> >>
> >> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> >> shared/decrypted buffer handling. This series consolidates the
> >> force_dma_unencrypted() checks in the top-level functions and ensures
> >> that the remaining DMA interfaces use DMA attributes to make the correct
> >> decisions.
> >>
> >> The series separates mapping and allocation state:
> >> - DMA_ATTR_CC_SHARED describes the DMA address attribute requested for a
> >>   mapping. It tells the DMA mapping path that the DMA address must target
> >>   shared/decrypted memory.
> >> - __DMA_ATTR_ALLOC_CC_SHARED is an internal DMA-mapping attribute used only
> >>   by allocation paths after the DMA core decides that the backing pages
> >>   must be allocated as shared/decrypted memory.
> >>
> >> The series:
> >> - moves swiotlb-backed allocations out of __dma_direct_alloc_pages(),
> >> - uses __DMA_ATTR_ALLOC_CC_SHARED through the dma-direct alloc/free paths
> >> - teaches the atomic DMA pools to track encrypted versus decrypted
> >>   state
> >> - tracks swiotlb pool encryption state and enforces strict pool
> >>   selection
> >> - centralizes encrypted/decrypted pgprot handling in dma_pgprot() using
> >>   DMA attributes
> >> - passes DMA attributes down to dma_capable() so capability checks can
> >>   validate whether the selected DMA address encoding matches
> >>   DMA_ATTR_CC_SHARED
> >> - makes dma_direct_map_phys() choose the DMA address encoding from
> >>   DMA_ATTR_CC_SHARED and fall back to swiotlb when a shared DMA request
> >>   cannot use the direct mapping, which lets arm64 and x86 CCA guests stop
> >>   relying on SWIOTLB_FORCE for DMA mappings
> >> - use the selected swiotlb pool state to derive the returned DMA
> >>   address
> >> - reports CC_ATTR_GUEST_MEM_ENCRYPT for arm64 Realms, powerpc secure
> >>   guests, and s390 protected virtualization guests.
> >>
> >> Dependency:
> >> This series depends on the pKVM changes posted at:
> >> https://lore.kernel.org/all/20260603110522.3331819-1-smostafa@google.com

FYI, I'll probably take the second patch there as a fix, then I can put
the other two on a topic branch in the arm64 tree.

Will

