Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E608C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=550ooWT8542+63+b73F3KAgnV89CFJo9aC92rxEIRio=; b=HKDxXsF01nwA1xL3Mbt49uq1Xh
	2ENLbMHE5IhSfFCds+LDw8SX8HJMV4x/R4SErLuqLRmgv/+lGBnxvYBCTqbDq5yqpEhGINybzyPt2
	exxPUg63udF7/e/9l0ipBy2Ts57h+1CknxUznHeErVaUVZQwNIp70BqFlmdj29O7fdAWiJ35MN2nV
	xLG17v47q3EcVDnqbTSSRRBUQOxsLib9c+uBYvmwh3K9bxw7cNrmip62X2mo+yyjXvlYHPLA/Vijy
	gLeqp3vVkvValFCSxqnLb37owAxJS0xq9aLZ5a5m308OiEwNyV3fj7gglLZ+fy+BgFS2e0AKhhh/K
	kxxe/cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3ha-00000004Bxw-25xO;
	Fri, 10 Jul 2026 05:23:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3hZ-00000004Bxj-1m64
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:23:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 400E16001A;
	Fri, 10 Jul 2026 05:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EBD1F000E9;
	Fri, 10 Jul 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783660984;
	bh=550ooWT8542+63+b73F3KAgnV89CFJo9aC92rxEIRio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bNlSVXT3ETCHbdeWOabjzODZivq8U9g4F7kEA6Aw4NSN7/iClos+6FnnRkEloBTQx
	 kYDdZ5It6cK3pDU1sVLNfVvyp92GT9KnRBSjY45JIhg78l32NwyF7rJpiRPqj0BVUP
	 8ZguLouhrS8wYHspEicQcK61eLs15Bcqz/9u2KhrJQJk4XgUD2q/0h/z4hDga0v9QI
	 eMeQxwFokadPjLOrsMZkF6JDmQ/8georqPF7vU27VTFLhMKBvJISPjIM8Mrs4P/TXt
	 yOJTeULh173Hgo7dKmAW3nhIaq8VFpWH+iVqc4tNoqbH1ucJJsZH4f7Af8vl/d9ed7
	 nijIDYfIjO2vw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
	Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 16/22] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
In-Reply-To: <20260709181336.GM118978@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-17-aneesh.kumar@kernel.org>
 <ak42F240d-53QeFN@arm.com> <yq5apl0xgy89.fsf@kernel.org>
 <ak-CT3oanlDfgTy4@arm.com> <20260709181336.GM118978@ziepe.ca>
Date: Fri, 10 Jul 2026 10:52:49 +0530
Message-ID: <yq5ajyr3h106.fsf@kernel.org>
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

> On Thu, Jul 09, 2026 at 12:13:19PM +0100, Catalin Marinas wrote:
>> > > For AMD/SME, on host with memory encryption we now end up setting the C
>> > > bit for DMA_ATTR_MMIO. This is fine for RAM but not sure whether
>> > > some other MMIO bus understands this attribute. Maybe we should stick to
>> > > something like __phys_to_dma() for the !CC_SHARED && MMIO path. Or,
>> > > since this is not universally defined, just use the old dma_addr = phys
>> > > if MMIO and ignore any unlikely DMA offsets.
>> > >
>> > 
>> > Considering for AMD/SME system an unencrypted dma addr is one without C
>> > bit, will this be good?
>> > 
>> > 	/*
>> > 	 * For host memory encryption and device requiring unencrypted DMA,
>> > 	 * MMIO memory is treated as shared by default.
>> > 	 */
>> > 	if (attrs & DMA_ATTR_MMIO) {
>> > 		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) || force_dma_unencrypted(dev))
>> > 			attrs |= DMA_ATTR_CC_SHARED;
>> > 	}
>> 
>> Yes, I think it does the trick, preserves the current semantics for AMD.
>> I guess you could use a single 'if' for all checks (up to you).
>
> Please don't change it, MMIO P2P is broken on CC systems today and it
> should stay broken. Passing DMA_ATTR_MMIO with DMA_ATTR_CC_SHARED is
> an error that we need to correct in the drivers not make work in the
> core code.
>

But the above changes are intended to handle HOST_MEM_ENCRYPT. In v7, we
had the following diff:

@@ -88,37 +88,40 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
 {
 	dma_addr_t dma_addr;
 
+	/*
+	 * For a device requiring unencrypted DMA, MMIO memory is treated
+	 * as shared by default.
+	 */
+	if (force_dma_unencrypted(dev) && (attrs & DMA_ATTR_MMIO))
+		attrs |= DMA_ATTR_CC_SHARED;
+

This is now getting updated to

@@ -624,37 +626,44 @@ dma_addr_t dma_direct_map_phys(struct device *dev, phys_addr_t phys,
 {
 	dma_addr_t dma_addr;
 
+	if (attrs & DMA_ATTR_MMIO) {
+		/*
+		 * For host memory encryption and device requiring
+		 * unencrypted DMA, MMIO memory is treated as shared by
+		 * default.
+		 */
+		if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT) ||
+		    force_dma_unencrypted(dev))
+			attrs |= DMA_ATTR_CC_SHARED;
+	}
+

I agree that we need to move that DMA_ATTR_CC_SHARED setting to 

modified   drivers/pci/p2pdma.c
@@ -285,6 +285,11 @@ int pcim_p2pdma_init(struct pci_dev *pdev)
 			continue;
 
 		p2p->mem[i].owner = &pdev->dev;
+
+		p2p->mem[i].dma_mapping_flags = DMA_ATTR_MMIO;
+		if (force_dma_unencrypted(dev))
+			p2p->mem[i].dma_mapping_flags |= DMA_ATTR_CC_SHARED;
+

As we discussed [1], that can come in a later patch. In the meantime, adding
the HOST_MEM_ENCRYPT check preserves the previous behavior for SME.

[1] https://lore.kernel.org/all/20260522132240.GD7702@ziepe.ca/

-aneesh

