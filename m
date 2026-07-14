Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52759C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUra5EJSRaUGl/khGQ/hVpRAn7fp80t3QbcNAonpnHo=; b=Vi+MR/udkyiccXbDztTuPvOMJU
	YLyhTMMiaDtmkCvgSPyH+sObohuA2QXT/Rz14ud896oelcuJ4VpNHJQZZZRclN2dA7GLo0yZen/HH
	fwSTFu08zaRWFYpVgw5p7N7DbdYxLokIqCnoGlMqepyo4gavOSeyz+wZLOa2gc+qWYyLmjMs1akTy
	DU86k9+O1lrFstYOYKgJCyrUAWABAM8SNqJ2+U6VVULCq2jD65p5ozOJ+/JAOea1rWtZZr0B3kkBf
	g3wdLp6qiTaqUa6abGwyBEcg7lRJ2NVAPnfOzMGaG37dEGv47OPWtF8er4uFERLerGvdpabo6xcEO
	eMqSGVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZwD-0000000BWBx-3JmB;
	Tue, 14 Jul 2026 10:00:29 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZw7-0000000BWAu-39MG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 10:00:28 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260714100016euoutp010b64ed20ec9ba1c6447f10b7abae08b8~CH6nFLiNZ1160011600euoutp01a;
	Tue, 14 Jul 2026 10:00:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260714100016euoutp010b64ed20ec9ba1c6447f10b7abae08b8~CH6nFLiNZ1160011600euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1784023216;
	bh=IUra5EJSRaUGl/khGQ/hVpRAn7fp80t3QbcNAonpnHo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NMjfCsqZ5hnUEU0WETu01Q9nOdFTV987l1OyEpSxVC3qsrjuo+pdKGHJOn1P/uqy9
	 0ML3iTMDQp8jsFJA5eqo2WdyOclP9r+hDHP0Qb9E1dtE0XTKwa/FLLs+p4+9q/ScPz
	 8vhb3Wq8om+OapgJr8LiPPxclNzpInm/pkQwvQpQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260714100016eucas1p2bbfe02d5fc02fcf561dc5409c7ecb5ab~CH6mtujgB0401004010eucas1p2d;
	Tue, 14 Jul 2026 10:00:16 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260714100014eusmtip1f8ce1c67533271011f679d0bcf054f91~CH6lJz-Yt2122621226eusmtip1M;
	Tue, 14 Jul 2026 10:00:14 +0000 (GMT)
Message-ID: <6f35eaae-f3d2-48fb-abce-9a2cc124b0ef@samsung.com>
Date: Tue, 14 Jul 2026 12:00:13 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 00/22] dma-mapping: Track shared DMA state through
 direct, pool and swiotlb paths
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jason Gunthorpe
	<jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, Robin Murphy
	<robin.murphy@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Steven Price <steven.price@arm.com>, Suzuki K Poulose
	<Suzuki.Poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Jiri
	Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>, Petr Tesarik
	<ptesarik@suse.com>, Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, Madhavan
	Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
	<chleroy@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald
	Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
	Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
	<svens@linux.ibm.com>, x86@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <yq5aldbdnbj8.fsf@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260714100016eucas1p2bbfe02d5fc02fcf561dc5409c7ecb5ab
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1
X-EPHeader: CA
X-CMS-RootMailID: 20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
	<CGME20260707080628eucas1p13fa8a57e60ef5dd3ec651e19e42af0a1@eucas1p1.samsung.com>
	<yq5av7argr65.fsf@kernel.org>
	<fc804746-4fb8-4ea9-997f-a4cae9ba8c14@samsung.com>
	<20260713194323.GC3133966@ziepe.ca>
	<cd5d0504-1592-4b48-89ea-1efe8aa57968@samsung.com>
	<yq5aldbdnbj8.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_030024_385438_CDA1F3A4 
X-CRM114-Status: GOOD (  14.06  )
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

On 14.07.2026 11:52, Aneesh Kumar K.V wrote:
> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>> On 13.07.2026 21:43, Jason Gunthorpe wrote:
>>> On Tue, Jul 07, 2026 at 03:03:48PM +0200, Marek Szyprowski wrote:
>>>> I'm fine with merging on top of the topic branch and I assume that this
>>>> patchset is mature enough to give it a try in linux-next, but first I
>>>> would like to get a review or at least acks from others with good CC
>>>> knowledge or experience.
>>> I think it is good to go from a CC perspective, there are still some
>>> more items to fix up (like the MMIO) but I'd rather they be followups
>>> at this point.
>> Great. Aneesh, any chance You could send v8 with the remaining items
>> fixed till end of this week? I will be happy to push it to
>> dma-mapping-for-next for testing in linux-next asap.
>>
> Sure. You need this rebased on top of the pKVM changes, right?
> Otherwise, we'll end up with conflicts when you do the final pull
> request.
Ah, indeed. I forgot about the pKVM changes. If there is a stable
branch with those patches, please base v8 on top of it.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


