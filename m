Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ACCCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu/JOyC84tVJBCUkG+lF/hJMdSljFsmWBlUj9ii2JRE=; b=zHViXaZSJi25G5u4bcojbpvBG2
	Qzepo60zt3EKBonUdHeTFsIZt77i+hZ4kmEGiTWiAYCf/oyDuWVZY14mTweMtvqmaA/n+GvjnwgNw
	difKB1lcDQ4dayIt0CK90/IBlFWgbhz7fPzxWML760D95fqih83/uvKgTxfjIKD+JxjSROFM9oTI6
	FjwQNHiz1dDypriSQv8wi6DcfCIsbXM6MCLpUNi4pBLz3sVwjwpSCqCY3UaK0ICWUgvi9HaC1lXsD
	TpWpdEAjfUKxsb/HZGmZeAWiJ+bxnUmIsQzj6sGqFeaXYy/s1Dg1uiyW7uDQ+MeMgt3Ea2u9FxbRV
	iln44E5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwji-00000005gkD-2e18;
	Tue, 09 Jun 2026 13:43:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwjf-00000005gjm-0DfJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:43:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6BB2437;
	Tue,  9 Jun 2026 06:43:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8BBF3F905;
	Tue,  9 Jun 2026 06:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781012596; bh=gsPLZ/6wNx5smfboDFDZbwlQNRoOq0tSh+FJ8vH4Sq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VdePvHJgxJOe1dY8fL/GyRImPjZC211XqLf1CRh8e+OlR7sAHSTSRvm/CDfHIje1r
	 LphvOA/eLEwMoTILXuNzkRN89nvHyZofNbc5Tgstwe+A12chZvnn1N4E+yvrRZI/gN
	 M3BSKz50eWnASlzIVYiwpL5xaVu6OizZaXiJJOk4=
Date: Tue, 9 Jun 2026 14:43:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
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
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <aigYbK12D8uKQvJF@arm.com>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064319_310827_5679B565 
X-CRM114-Status: GOOD (  15.52  )
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

On Thu, Jun 04, 2026 at 02:09:39PM +0530, Aneesh Kumar K.V (Arm) wrote:
> This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
> dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
> are handled consistently.
> 
> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
> shared/decrypted buffer handling. This series consolidates the
> force_dma_unencrypted() checks in the top-level functions and ensures
> that the remaining DMA interfaces use DMA attributes to make the correct
> decisions.

Please check Sashiko's reports, it has some good points:

https://sashiko.dev/#/patchset/20260604083959.1265923-1-aneesh.kumar@kernel.org

I think the main one is the swiotlb_tbl_map_single() changes which break
AMD SME host support. There cc_platform_has(CC_ATTR_MEM_ENCRYPT) is true
but force_dma_unencrypted() is false. Normally you'd not end up on this
path but you can have swiotlb=force.

> Aneesh Kumar K.V (Arm) (20):
>   s390: Expose protected virtualization through cc_platform_has()
>   dma-direct: swiotlb: handle swiotlb alloc/free outside
>     __dma_direct_alloc_pages
>   dma-direct: use DMA_ATTR_CC_SHARED in alloc/free paths
>   dma-pool: track decrypted atomic pools and select them via attrs
>   dma: swiotlb: pass mapping attributes by reference
>   dma: swiotlb: track pool encryption state and honor DMA_ATTR_CC_SHARED
>   dma-mapping: make dma_pgprot() honor DMA_ATTR_CC_SHARED
>   dma-direct: pass attrs to dma_capable() for DMA_ATTR_CC_SHARED checks
>   dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED
>   dma-direct: set decrypted flag for remapped DMA allocations

Patch 10 above...

>   dma-direct: select DMA address encoding from DMA_ATTR_CC_SHARED
>   dma-pool: fix page leak in atomic_pool_expand() cleanup

Patch 12...

>   dma-direct: rename ret to cpu_addr in alloc helpers
>   dma-direct: return struct page from dma_direct_alloc_from_pool()
>   iommu/dma: Check atomic pool allocation result directly

and I think patches 14, 15 are independent fixes. Some of them even have
Fixes: tags and Cc: stable. Please move them to the beginning of the
series to avoid inadvertent dependencies and make them harder to
backport. It's also easier to follow the series without random fixes for
mainline in the middle.

>   dma: swiotlb: free dynamic pools from process context
>   dma: swiotlb: handle set_memory_decrypted() failures
>   dma: free atomic pool pages by physical address
>   swiotlb: Preserve allocation virtual address for dynamic pools
>   swiotlb: remove unused SWIOTLB_FORCE flag

-- 
Catalin

