Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F12CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 05:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDuIn3y/rCO4r9DXHWsg+1RIZVo9GqzNtV1PP4apQRs=; b=PZTsxEPrpb+eftEMj4rf3XAGaQ
	ACnDYm1Zx7uu8kRuSYwmyQVq1r63uOO4NvUTR2z2F11WuHZJaf3P7aH68oARRkS3JBCdVwlMtoTLp
	KQFUOWa9YluM7TS2h3c8+uN9NNrB+FP0rTgmk85V+s4lhNPGJMuGzWPiTZOI9mrRVldCe2RvIHTsD
	WcSzTDl7sUcUr/7QLIyqjy0WfbYrdw6FvEGz/xgOAT7moIFzOBrP35UPDt4mvrhz2KCvmRT7eSVUx
	PE4jAgF4HLHeRZ38UqZTOuRPV0IB+1cerXOd8LjzncH6rKhQVPDLPYNxJJz12Id3ipUF/S5b+oCna
	R6S+phFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXvY-00000008j61-1IcV;
	Thu, 11 Jun 2026 05:26:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXvW-00000008j5n-2yGL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 05:26:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3DFF60209;
	Thu, 11 Jun 2026 05:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A794D1F00893;
	Thu, 11 Jun 2026 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781155561;
	bh=XDuIn3y/rCO4r9DXHWsg+1RIZVo9GqzNtV1PP4apQRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G3lWXQ1eDa81mBrJCkA/PCQooKDKZDvbt48avgp0O6fw29Xx6sKxbhO5qZnkxZ4u9
	 OxKbgbkMquVdngJ8SPiyWyre/tflzFPwaxG9vTOH79OGqlciuGssBF34DWyso1CHZw
	 aDVLXDoti3JcbI9D0Oi2cQfQuhj+pJ3kbX4EYy4Xe2MEKUwpaADT61w7nEgRm3kwLM
	 tSP+LAKWvEyh/ut0Dg4osfZsHaat6KgXBk/q1moX91KKeOfFQmsmWMabYftzxu7D6x
	 6RhvniODTNH6y39Z5sFE58ao01nIDFW6k3pW4yaiik4r+mgNv+m7xs7Nex2pRFVN0z
	 TxODrAxyW9DsA==
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
	Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
In-Reply-To: <20260609143242.GK2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca>
Date: Thu, 11 Jun 2026 10:55:47 +0530
Message-ID: <yq5aa4t1myw4.fsf@kernel.org>
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

> The sashiko note does look legit though:
>
> 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> 	    !gfpflags_allow_blocking(gfp) && !coherent) {
> 		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
> 					   gfp, attrs, NULL);
> 		if (!page)
> 			return NULL;
>
> I don't see anything doing the force_dma_unencrypted test along this
> callchain..
>
> I guess it should be done one step up in dma_alloc_attrs() instead of
> in dma_direct_alloc()?
>

I think we should do something similar to what dma_map_phys() does here,
considering that we only support DMA direct with DMA_ATTR_CC_SHARED/DMA_ATTR_ALLOC_CC_SHARED.

@@ -637,6 +637,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	void *cpu_addr;
+	bool is_cc_shared;
 
 	WARN_ON_ONCE(!dev->coherent_dma_mask);
 
@@ -657,8 +658,17 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	/* let the implementation decide on the zone to allocate from: */
 	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
 
+	if (force_dma_unencrypted(dev))
+		attrs |= DMA_ATTR_ALLOC_CC_SHARED;
+
+	is_cc_shared = attrs & DMA_ATTR_CC_SHARED;
+
 	if (dma_alloc_direct(dev, ops) || arch_dma_alloc_direct(dev)) {
 		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
+	} else if (is_cc_shared) {
+		trace_dma_alloc(dev, NULL, 0, size, DMA_BIDIRECTIONAL, flag,
+				attrs);
+		return NULL;
 	} else if (use_dma_iommu(dev)) {
 		cpu_addr = iommu_dma_alloc(dev, size, dma_handle, flag, attrs);
 	} else if (ops->alloc) {

-aneesh

