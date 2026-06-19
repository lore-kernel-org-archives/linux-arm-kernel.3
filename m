Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D770CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 12:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrOJsDp07RvjHOd4cMkZps4YSuiVy126p7RvYOPP0A8=; b=ZuxdN0IYSGuOTF/RCLDs5FkTJl
	eTK/e0prSsGJGICZ+Hc4LSJjs1Dl1N7FAeGKVOc0F1KZsU6jyeyetb1AaKRI/kuNyM+3RbKYXktre
	ic3qcyuf+rz4iPqngfq8SCpFMIjVdQl57mbQrMmwHRijPDLJcEbbcY9808ppLwmnrurZ+9VNLAdZw
	j7vrTNyrvLG2s47ukJZYKwCaCgjCRaEa9WNd01JXb0hav53sBfh3XOLkxCpY5WoDhY0iiag48UA4N
	a44Fhb2YrRY/p+9eSj3TxQ8J1N3nqy8nu1PVbR4CJCWz0TUy+4W6sGF1Ea5ynh/Gj4FP3mezhf+9G
	RGnaQ3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waY76-00000002NMo-3suL;
	Fri, 19 Jun 2026 12:14:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waY75-00000002NMa-3dfJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 12:14:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4482243F15;
	Fri, 19 Jun 2026 12:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9471F000E9;
	Fri, 19 Jun 2026 12:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871263;
	bh=KrOJsDp07RvjHOd4cMkZps4YSuiVy126p7RvYOPP0A8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Rt0NaddySWLItBMWeGU37cEP6ghBwAiCgFoVL/yDeYKFrgWjjOXw5fnpeRkuQFogY
	 CLQbZdwDh+aShieCJXxvlci/ACzTq16EHZ6mSrAk3gTro6XT5InFDGLxT0cVRcEqfb
	 FihgVAzw/GPJ10OXjcrRrP/594+fy9kNP/aeuNTCXdZBvKOKjXYtpHsmL/+1mwrFLv
	 oVkEnkNi8gubNsQu/SLW3F9g7CDV8OKpc/DTxyw/Rmn+RCGXkd42YTjCTaq4zmSo9u
	 5ej1hm8jG9aoxWXPIhtGGBmT2MJcNjAicaMSdL3a0XPTJmSSxFB09c0n1Sp7+9yfRg
	 /ADZdG2vuqkog==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
In-Reply-To: <20260618153705.GH231643@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <aigYbK12D8uKQvJF@arm.com> <20260609144746.GL2764304@ziepe.ca>
 <2ecfa1a8-6202-4319-9692-a6ffeb5a3dbf@amd.com>
 <yq5aqzm4dz25.fsf@kernel.org> <20260618153705.GH231643@ziepe.ca>
Date: Fri, 19 Jun 2026 13:14:13 +0100
Message-ID: <yq5ao6h6enhm.fsf@kernel.org>
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

> On Thu, Jun 18, 2026 at 09:37:22AM +0100, Aneesh Kumar K.V wrote:
>> Alexey Kardashevskiy <aik@amd.com> writes:
>> 
>> > On 10/6/26 00:47, Jason Gunthorpe wrote:
>> >> On Tue, Jun 09, 2026 at 02:43:08PM +0100, Catalin Marinas wrote:
>> >>> On Thu, Jun 04, 2026 at 02:09:39PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> >>>> This series propagates DMA_ATTR_CC_SHARED through the dma-direct,
>> >>>> dma-pool, and swiotlb paths so that encrypted and decrypted DMA buffers
>> >>>> are handled consistently.
>> >>>>
>> >>>> Today, the direct DMA path mostly relies on force_dma_unencrypted() for
>> >>>> shared/decrypted buffer handling. This series consolidates the
>> >>>> force_dma_unencrypted() checks in the top-level functions and ensures
>> >>>> that the remaining DMA interfaces use DMA attributes to make the correct
>> >>>> decisions.
>> >>>
>> >>> Please check Sashiko's reports, it has some good points:
>> >>>
>> >>> https://sashiko.dev/#/patchset/20260604083959.1265923-1-aneesh.kumar@kernel.org
>> >>>
>> >>> I think the main one is the swiotlb_tbl_map_single() changes which break
>> >>> AMD SME host support. There cc_platform_has(CC_ATTR_MEM_ENCRYPT) is true
>> >>> but force_dma_unencrypted() is false. Normally you'd not end up on this
>> >>> path but you can have swiotlb=force.
>> >> 
>> >> IMHO that's an AMD issue, not with the design of this series..
>> >> 
>> >> The series is right, a device that is !force_dma_decrypted() must be
>> >> considerd to be a trusted device and we must never place any DMA
>> >> mappings for a trusted device into shared memory.
>> >
>> > swiotlb=force forces swiotlb, not decryption.
>
> If force_dma_decrypted() == true then swiotlb must allocate from a
> decrypted memory pool. It is right there in the name!
>
> The hypervisor environment should *never* set force_dma_decrypted()
> because all devices can access all hypervisor memory, up to their IOVA
> limits.
>
>> > So when I try "mem_encrypt=on iommu=pt swiotlb=force" with this
>> > patchset, it fails to boot. But it boots with a hack like this:
>
> On the host side I expect this to cause swiotlb to allocate encrypted
> memory and bounce to it.
>
>>  		u64 dma_enc_mask = DMA_BIT_MASK(__ffs64(sme_me_mask));
>>  		u64 dma_dev_mask = min_not_zero(dev->coherent_dma_mask,
>>  						dev->bus_dma_limit);
>> +		/*
>> +		 * With memory encryption enabled, SWIOTLB is marked decrypted.
>> +		 * If SWIOTLB bouncing is forced, treat the device as requiring
>> +		 * decrypted DMA.
>> +		 */
>
> And this is more insane logic. The right fix is to allocate the
> swiotlb bounce from the *encrypted* pools when running on the
> hypervisor which requires undoing this abuse of force_dma_decrypted().
>

Agreed. If the device can do encrypted DMA and requires bouncing, it
should bounce through encrypted pools. We don't support encrypted pools
now and that means, we mark the option ("mem_encrypt=on iommu=pt
swiotlb=force") not supported for now? 

-aneesh

