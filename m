Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6271C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxEosmWi5O/qFkDQu71/Iw7c2qkTVCRnclLNDE8xNec=; b=f5C2IKYETPc5fKb/vBKUs76mPt
	HFQW9Ushxsm2ZO6X3zIy5IUYBOCkZVkPChQSuIlJ6tvBrHkpwlfwNYj1/EI0woGzEyVQEk5uzIbkb
	qsiccfspnD/lyLU5cKkrbenflH520nlu/Hu4j5RCMC9B4Pgy9ziZBrPHMvMfAVk5urKsVj5Cnq22k
	9ePDvW/ytiTESMmFZI3t7DvV5ndR4tObk7XoMyWvgO2gVnIQVBHHZpWBUuhxvTtcD13TpzG7G5TG3
	7AC6lDTqBgRZcRaQxBGQwQl13ni0EADVR1sr7FVjRdOeWBPQ8+alO/YTaPSFW1ZhRO9CPxQiXk2Ib
	lv1QWPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKkl-0000000HC79-24Dw;
	Thu, 16 Jul 2026 11:59:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkKki-0000000HC6V-2UZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 11:59:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0641476;
	Thu, 16 Jul 2026 04:59:38 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA1DB3F905;
	Thu, 16 Jul 2026 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784203182; bh=CWyPb+R0+N4Z/Vgs9/kGkVD+YdhxfJbynRCEFK6cF/M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b+npfWF0cfwHFNmNPVct1qEf8bMDflTEDKtn/6W+8HEmGJEQFI2AB7iHaQl1AuZ3f
	 aiFRBinnnhNQ3KY6tEKkSjcZbXMyJ/Jwa79wtrNwVm7NexbCKYlwF+1uXXYGHvaZ3m
	 uogedz+vvjuCpxLSCy1zzsNDYFUg6xuzKgx99j6s=
Message-ID: <787fa0d3-c1d4-442e-beaa-91a03238f511@arm.com>
Date: Thu, 16 Jul 2026 12:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
 Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com> <ald3CuddY6I7gml1@willie-the-truck>
 <2ce09e84-c57f-4087-9dda-07245fadfc02@arm.com>
 <20260715125039.GA50536@nvidia.com>
 <d20d258d-d970-4ef1-bbb6-cdc83fc20c9d@arm.com>
 <20260715180949.GD3775915@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260715180949.GD3775915@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_045944_829281_CFD67D20 
X-CRM114-Status: GOOD (  32.94  )
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

On 15/07/2026 7:09 pm, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 06:45:09PM +0100, Robin Murphy wrote:
> 
>>> AFAICR the biggest issue with arm-smmu was it using IO_PGTABLE_ARMV7S
>>> as well. I think it would be fine to implement all the unique LPAE
>>> features it needs in iommupt, I did most of them already.
>>>
>>> I do have an ARMV7S implementation for iommupt, but I did not solve
>>> the sub page problem. So while it is functionally working it is not
>>> usable since it wastes so much memory. That's a tricky problem to
>>> solve since the algorithms depend on the gather->freelist.
>>>
>>> I didn't spend any time trying to do anything about this as I was not
>>> intending to touch arm-smmu
>>
>> Indeed between the irregular table sizes (before you even get to the
>> Mediatek shenanigans...), and the awkward GFP_DMA limitations and/or reality
>> that many of the systems using it really don't have memory to waste, I'd
>> have considered v7s pretty much terminally incompatible with iommu_pages and
>> the abstraction that iommupt is trying to be... :/
> 
> At least Matthew has talked about having a sub page allocator with
> meta data, maybe with the memdesc support someday. Even today we could
> have iommu-pages allocate a companion struct pointed to from struct
> page that was sized 4x so it could be used for the freelist.
> 
> There are some other options for alterantive algorithms that could
> work without requiring the free list. I had some thoughts about placing
> the free list inside the data itself as a non-present entry.
> 
> It is not insolvable, I'm just not sure it is worth doing vs leaving
> arm-smmu to keep using iopgtable from ARMv7.

Yeah, if you did want to keep bashing at it, then ultimately there are 
at least a couple more short-descriptor inspired implementations in 
exynos and omap too, however at this point I don't see the cost:benefit 
ratio looking at all favourable...

> Otherwise to have arm-smmu use iommupt you'd end up with two
> iommu_domains specialized to 32 and 64 bit page tables, with their own
> ops and a shared invalidation like how the tlbi struct is providing
> for smmuv3.
> 
> It is not outrageously bad, but it certainly is a chunk of work.
> 
> If the goal is arm-smmu support of CONT then maybe there is some merit
> in doing iopgtable as a one off feature. But there have been many
> attempts so far to add CONT and they all had troubles, I had the
> impression is is not so easy..

I think now that partial unmaps are firmly ruled out and we already have 
the multi-page map/unmap design it should be pretty minor. I'm also more 
than happy to stop there, have dirty tracking, splitting/merging and all 
the fancy new IOMMUFD stuff require iommupt, and keep io-pgtable 
strictly for the GPUs and "media" IOMMUs that only need to keep 
providing map/unmap/iova_to_phys for iommu-dma or equivalent usage. By 
now I'd also say we can reasonably park arm-smmu in the latter category 
- while technically it could try to support stuff like nesting and 
vIOMMU (at least on MMU-500), the hardware is in embedded platforms 
which either don't care at all, or at worst where virtualisation is 
Xen's problem not ours. As far as I'm aware even the NXP Layerscape 
platforms are happy with the status quo of just basic VFIO type 1 for DPDK.

Thanks,
Robin.

