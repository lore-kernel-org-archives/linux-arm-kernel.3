Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2112BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pXyGCmuZ2dd2pCX0ADJkgnLvZuWQnMbV/mJUc5jL2g=; b=SXXc6OA7XsTHfivrFGFWACa/zl
	b/M7PzfPP7ZnCbGcylU7T1Pk6Q31GidTTLkI4QtayVRnlgQ+UaKR/Tt1CUiNN7/MxpU7WgDrZGlSb
	MeV2HBakUbMqUiZJjyG1eyYIb1ABS2gtCROxoDfYte6Eib4x+G34w+KS91DOGw0eyYNmmHufvD9q7
	MaZMKMIiFPxC2nQcxbg3b0+GtjW5MQDuTXPnKFeTrwH5PDWDkdcQml1pe4gzzzNKUycHgzVlKEyv+
	LRu9qUytqpRmiVxKPy3DrtqtcPaQc7nyc+rrtNa55OBcVWmO6YEyohndRbEVIwKtQNvIsvO7QEE25
	chJlA/5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Sx-0000000F13A-1Jfz;
	Tue, 07 Jul 2026 13:03:59 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5St-0000000F11u-023U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:03:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260707130350euoutp01816b7aba68f35cc361a12757e4960321~AA55SXF0N2589025890euoutp01R;
	Tue,  7 Jul 2026 13:03:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260707130350euoutp01816b7aba68f35cc361a12757e4960321~AA55SXF0N2589025890euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783429431;
	bh=1pXyGCmuZ2dd2pCX0ADJkgnLvZuWQnMbV/mJUc5jL2g=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bIpgAugumnJ+vFbRlkBo8FzRtO/g5MYRDHE2BlHryQsTPFMC5fInDzKCOAgZ1npra
	 WjvJ/rWNe/t/bQYYXvdlEuuxIM77d/dc9M35H15wIneXXtBw3nINopT0vdG4B55jJi
	 2Rm+c3z4Adg15mIXdYkxRRDiDG8vmD3c75cZpyvY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707130350eucas1p1721c804c0be9f8bcca8c74b90c602459~AA55DsDSM2891728917eucas1p1P;
	Tue,  7 Jul 2026 13:03:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707130349eusmtip16fa04cbe7458b13574cd93f920780ed5~AA53jcBbZ1173511735eusmtip1K;
	Tue,  7 Jul 2026 13:03:49 +0000 (GMT)
Message-ID: <fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
Date: Tue, 7 Jul 2026 15:03:48 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
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
In-Reply-To: <yq5av7argr65.fsf@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707130350eucas1p1721c804c0be9f8bcca8c74b90c602459
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1
X-EPHeader: CA
X-CMS-RootMailID: 20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
	<CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
	<yq5av7argr65.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_060355_605884_41ABE69D 
X-CRM114-Status: GOOD (  20.47  )
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

On 07.07.2026 10:06, Aneesh Kumar K.V wrote:
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> writes:
>
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
> A rebased tree on top of the dependent pKVM changes can be found at:
> https://gitlab.arm.com/linux-arm/linux-cca/-/tree/scratch/pkvm/testing?ref_type=heads
>
> The patches had minor conflicts. I am not sure how we want to get this
> merged.
>
> Should we ask the pKVM maintainers for a topic branch, and then I can
> repost the updated series on top of that?
I'm fine with merging on top of the topic branch and I assume that this
patchset is mature enough to give it a try in linux-next, but first I
would like to get a review or at least acks from others with good CC
knowledge or experience.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


