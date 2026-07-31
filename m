Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8D8C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3Jgur6eGpI5uF6i9kwDYaTQ48SNIpZ5QYt0ueN9Z1A=; b=tjpu30n9EYVEXf/1qsapoXuDXi
	JNzaNQN3Jws7cy7HcYjWazn4gjTo60FtK57MQ/nZj5TE/FwGfj0gXSdnKvYq9vCK4qQJmUfJCJSjP
	9s+ABsKoXA7DRTZ+ROqrguhRq9vJuS/76gtYXIkggfIYB/R4yHH7A/MJiUHyvXBURx4TxrqtLmfBg
	doonWtr0SZp6jWrAYL/0npoQnjv77jESbQAn6LaCU1PduKtG0Cbc57Hf6G5IOUhXH5mm3B3bK2uTk
	iCuUumZ0QX7ezaFvq/yc386VVK1lUq4JCnl9hxXiLhTKMf/1hh5UGpy+Cxe8xTLcW5XvJDHAk6f47
	C+icaOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphkx-0000000ByAx-1Csl;
	Fri, 31 Jul 2026 07:34:11 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphks-0000000ByAV-1UYO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:34:09 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260731073359euoutp01b326523e6f9dce2fa68dcdf5a4089e5b~HT4vhc6Cs1162311623euoutp01Z;
	Fri, 31 Jul 2026 07:33:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260731073359euoutp01b326523e6f9dce2fa68dcdf5a4089e5b~HT4vhc6Cs1162311623euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1785483239;
	bh=N3Jgur6eGpI5uF6i9kwDYaTQ48SNIpZ5QYt0ueN9Z1A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=h2vFzdGPU5rK6aIg9RL7QWF075tsWv+IJpqYD+rwoehY/vNWBMRBWGrq2fWusmWGk
	 J790EJlBOERW4eikBs6SJ0XQKF/mLNr0HDnXFmef70VwH7PnAlB0ueKl/8aXpOpDw3
	 NAWoNOdVoKDxcVtSBMhZr5p81NEbyYPO8PB+QGI0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260731073359eucas1p2ff8cd0f84dea171a8b4f0061154dc5ae~HT4vTnQXs1993519935eucas1p2y;
	Fri, 31 Jul 2026 07:33:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260731073350eusmtip181b6e9861358d1e9a24ec292d0634e20~HT4nVsXtj0839208392eusmtip1O;
	Fri, 31 Jul 2026 07:33:50 +0000 (GMT)
Message-ID: <85be992d-9567-433e-ae2e-64ae5483964d@samsung.com>
Date: Fri, 31 Jul 2026 09:33:47 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v8 00/23] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Marc
	Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>, Suzuki K
	Poulose <Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh
	<smostafa@google.com>, Petr Tesarik <ptesarik@suse.com>, Alexey
	Kardashevskiy <aik@amd.com>, Dan Williams <dan.j.williams@intel.com>, Xu
	Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <yq5azezfeeax.fsf@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260731073359eucas1p2ff8cd0f84dea171a8b4f0061154dc5ae
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb
X-EPHeader: CA
X-CMS-RootMailID: 20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
	<CGME20260725070930eucas1p16cbafb514de7a2e7531d0e4ae158acfb@eucas1p1.samsung.com>
	<yq5azezfeeax.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_003407_008031_75CF3BD7 
X-CRM114-Status: GOOD (  15.72  )
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

On 25.07.2026 09:09, Aneesh Kumar K.V wrote:
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
>> This series tracks confidential-computing shared DMA state through the
>> dma-direct, dma-pool, and swiotlb paths so that encrypted and decrypted
>> DMA buffers are handled consistently.
>>
>> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>> shared/decrypted buffer handling. This series consolidates the
>> force_dma_unencrypted() checks in the top-level functions and ensures
>> that the remaining DMA interfaces use DMA attributes to make the correct
>> decisions.
>>
>> The series separates mapping and allocation state:
>> - DMA_ATTR_CC_SHARED describes the DMA address attribute requested for a
>>   mapping. It tells the DMA mapping path that the DMA address must target
>>   shared/decrypted memory.
>> - __DMA_ATTR_ALLOC_CC_SHARED is an internal DMA-mapping attribute used only
>>   by allocation paths after the DMA core decides that the backing pages
>>   must be allocated as shared/decrypted memory.
>>
>> The series:
>> - moves swiotlb-backed allocations out of __dma_direct_alloc_pages(),
>> - uses __DMA_ATTR_ALLOC_CC_SHARED through the dma-direct alloc/free paths
>> - teaches the atomic DMA pools to track encrypted versus decrypted
>>   state
>> - tracks swiotlb pool encryption state and enforces strict pool
>>   selection
>> - centralizes encrypted/decrypted pgprot handling in dma_pgprot() using
>>   DMA attributes
>> - passes DMA attributes down to dma_capable() so capability checks can
>>   validate whether the selected DMA address encoding matches
>>   DMA_ATTR_CC_SHARED
>> - makes dma_direct_map_phys() choose the DMA address encoding from
>>   DMA_ATTR_CC_SHARED and fall back to swiotlb when a shared DMA request
>>   cannot use the direct mapping, which lets arm64 and x86 CCA guests stop
>>   relying on SWIOTLB_FORCE for DMA mappings
>> - use the selected swiotlb pool state to derive the returned DMA
>>   address
>> - reports CC_ATTR_GUEST_MEM_ENCRYPT for arm64 Realms, powerpc secure
>>   guests, and s390 protected virtualization guests.
>>
>> Dependency:
>> This series depends on the pKVM changes posted at:
>> https://lore.kernel.org/all/20260603110522.3331819-1-smostafa@google.com
>>
>> Please merge this series only after the pKVM changes above are merged.
>> Otherwise pKVM will be broken.
>>
> pKVM topic branch is now available 
>
> https://lore.kernel.org/all/178467286876.125042.12010461715645610054.b4-ty@kernel.org/
>
> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/coco
I've just got back from my holiday's and I see that there is everything ready to give
this patchset some tests in linux-next. I hope nothing will break.

I've applied this patchset to dma-mapping-for-next, on top of pKVM topic branch with
patch "[PATCH v8 17/23] dma-direct: make dma_direct_map_phys() honor DMA_ATTR_CC_SHARED"
rebased onto latest changes in arch/arm64/mm/init.c.

The remaining items pointed in the review can be fixed incrementally.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


