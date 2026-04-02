Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E854D6AAF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 18:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+vUQDHri7FGqvpXcgQszhGVHZtJpJaVkpSiBZB0GfM=; b=Mr8GiEd86JyBRC756dIuexVOrE
	BeSBHOx6JyikvXDtzHPHjC6VtoEFB2zn7Hm8KQZ10B5PZx/WF95JWSLGv0YcOJx2/0N+hTdV99xcs
	LkP4NBSAraz8NCjkbK0sEZw1yt0o9jK9ZG6IgtfpUqwWB1G3SlAcUyr6OsCKgiWoy159NufIIIvm1
	dtqiHxK1levApd6dKB9YdjFnMrVskx4nZ6/7xdrhIob0wpOzLIOlzR4GcSCk+ZAA9Yp/AdEQ4fGj1
	oZEcppH/CttvVVQAQp2+NpLR62Ztqqypm4cMDVJlvEtNq81/UNxiYeiIUu+fyLQeeGf8X7Ty6M62a
	zN5v+1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MVr-00000000dev-3LwQ;
	Thu, 02 Apr 2026 18:11:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8MVo-00000000deQ-0Vxq;
	Thu, 02 Apr 2026 18:11:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 978AE1570;
	Thu,  2 Apr 2026 11:11:16 -0700 (PDT)
Received: from [10.57.75.194] (unknown [10.57.75.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0787B3F915;
	Thu,  2 Apr 2026 11:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775153482; bh=lWwySeUuucnSqrRMaEssqv+qa77TPxUWW5jml+8ovZo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nI+zbstndSHKJ/mynYHRuC64m8Z4xHAi45TXEjGH5rMJxTMtKiuXxjyjbxLarmMYn
	 hXXkhX8l35nrPiZyzp+ZgYDe4uw+iI8Bv/L+f2xWNIa+OiQyxnU8y+avrnVGEPKVGX
	 +wUG0AxZTOalhJkOHOlwae27JD/n0ccdlbnChrhg=
Message-ID: <ec51ef14-e360-43a6-ae62-44a939ec8027@arm.com>
Date: Thu, 2 Apr 2026 19:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Always fill in gather when unmapping
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Sven Peter <sven@kernel.org>, virtualization@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Joerg Roedel <joerg.roedel@amd.com>, Jon Hunter <jonathanh@nvidia.com>,
 patches@lists.linux.dev, Samiullah Khawaja <skhawaja@google.com>,
 stable@vger.kernel.org, Vasant Hegde <vasant.hegde@amd.com>
References: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
 <ee2c2044-e329-4cdd-ac35-9365824d3677@arm.com>
 <20260401173650.GD310919@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260401173650.GD310919@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_111124_351539_43368D3B 
X-CRM114-Status: GOOD (  30.47  )
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

On 2026-04-01 6:36 pm, Jason Gunthorpe wrote:
> On Wed, Apr 01, 2026 at 05:33:28PM +0100, Robin Murphy wrote:
>>> io-pgtable might have intended to allow the driver to choose between
>>> gather or immediate flush because it passed gather to
>>> ops->tlb_add_page(), however no driver does anything with it.
>>
>> Apart from arm-smmu-v3...
> 
> Bah, I did my research on the wrong tree and missed this.
> 
>>> mtk uses io-pgtable-arm-v7s but added the range to the gather in the
>>> unmap callback. Move this into the io-pgtable-arm unmap itself. That
>>> will fix all the armv7 using drivers (arm-smmu, qcom_iommu,
>>> ipmmu-vmsa).
>>
>> io-pgtable-arm-v7s != io-pgtable-arm. You're *breaking* MTK (and failing
>> to fix the other v7s user, which is MSM).
> 
> I was very confused what you were talking about, but I see now that
> the hunk adding iommu_iotlb_gather_add_range() to v7 got lost somehow!
> 
> @@ -596,6 +596,9 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
>   
>                  __arm_v7s_set_pte(ptep, 0, num_entries, &iop->cfg);
>   
> +               if (!iommu_iotlb_gather_queued(gather))
> +                       iommu_iotlb_gather_add_range(gather, iova, size);
> +
>                  for (i = 0; i < num_entries; i++) {
>                          if (ARM_V7S_PTE_IS_TABLE(pte[i], lvl)) {
>                                  /* Also flush any partial walks */
> 
>>> arm-smmu uses both ARM_V7S and ARM LPAE formats. The LPAE formats
>>> already have the gather population because SMMUv3 requires it, so it
>>> becomes consistent.
>>
>> Huh? arm-smmu-v3 invokes iommu_iotlb_gather_add_page() itself, because
>> arm-smmu-v3 uses gathers
> 
> Yeah, I missed this whole bit, it needs some changes.
> 
>> Invoking add range before add_page will end up defeating the
>> iommu_iotlb_gather_is_disjoint() check and making SMMUv3
>> overinvalidate between disjoint ranges.
> 
> Right, that flow needs fixing.
> 
>> I guess now I remember why we weren't validating gathers in core code
>> before :(
> 
> My point is not filling the gather is a micro-optimization that
> benefits a few drivers. I think it is so small compared to an IOTLB
> flush that it isn't worth worrying about.

It's hardly a "micro-optimisation" for drivers to just not touch an 
optional mechanism which offers no benefit to them, especially when in 
many cases said mechanism is newer than the code that isn't using it 
anyway. The only required semantic of .iotlb_sync is to ensure that any 
previous .unmap_pages calls are complete and their associated 
translations invalidated. The entire concept of gathering and deferred 
invalidation is irrelevant to many IOMMU designs where it would only 
stand to make overall invalidation performance worse.

I'm starting to wish I'd been able to page all this context back in 
before reviewing the first patch, as I too only really had Intel and 
SMMUv3 in mind at the time... :(

> So, I'd like to make everything the same and populate the gather
> correctly in all flows. I'll fix the SMMUv3 thing and lets look again,
> this patch is not so scary to make me think we shouldn't do that.
> 
>> @@ -2714,6 +2714,10 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
>>   		pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
>>   			 iova, unmapped_page);
>> +		/* If the driver itself isn't using the gather, mark it used */
>> +		if (iotlb_gather->end <= iotlb_gather->start)
>> +			iommu_iotlb_gather_add_range(&iotlb_gather, iova, unmapped_page);
> 
> The gathers can be joined across unmaps and now we are inviting subtly
> ill-formed gathers as only the first unmap will get included.

Ill-formed? It's a perfectly valid range for the purposes of any 
subsequent generic check - which couldn't realistically be anything 
beyond empty vs. non-empty anyway - and it's only being set at all in 
the case where we know the driver doesn't care, because if the driver 
*was* going to look at gather->start or gather->end in its .iotlb_sync 
then it must have already set them to meaningful values in the prior 
successful .unmap_pages call. I think we can safely consider it invalid 
for a driver to suddenly decide to start using a gather mid-way through 
an unmap (or indeed to use start/end in any intentionally non-obvious 
manner either).

> We do have error cases where the gather is legitimately empty, and
> this would squash that, it probably needs to check unmapped_page for 0
> too, at least.

Maybe try looking at the rest of the code around these lines...

Thanks,
Robin.

