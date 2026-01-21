Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CDBC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 13:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9j0aEnPsFf4ht23DVuEjYMMqdJpKWzWkgwC3q2GqT3A=; b=p3HMnfQY5chxpnMhnQK0FT3yMH
	/g1fEvWbZdjGyJBteB8Z/YbmE6VFKSjwA24rLTV7z/lDQA6VWCLJEvCWkw39svTwTbmR8gWS0x27a
	OMf3bTzuNg2D5lU+nDzxvhUsILs9+UuP5ya6IkUdLh9dJTohX3E2uY2frQ2ad1LIzj9agRGT0kyRv
	D91wyXydE2jLS1+AJJ6b9lgKA0nUjv3MRxDhhvjm03Bt35xq3ESlTB61/pHKa1/53VdWTqoug+gs3
	Fq19R7mdG4wfXhF6b3/G4NxUT2iQ6hAG8MdjY4cbSSOCGvXCjnrfjjEZuB2WkArppTH4dMTA8DIo5
	1rwLC8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYba-00000005YCX-3G7y;
	Wed, 21 Jan 2026 13:50:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viYbX-00000005YBx-30Y1;
	Wed, 21 Jan 2026 13:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769003425; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oMD3DvxuLuEzLSKEQ+n7wJ4m/xJbJL42ySs6VOCov2+etqD4CgyPmKR8dkzx4g41ouAyqQO62NoJmbCaOtROJc7sd0f6R40oSBIx78qL6ybgkLBuv2rDFMaO/5EhdG55m8UuI97tr7tzCiQJSiJ39lWOQviRPlrDP3vbU1zyLJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003425; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9j0aEnPsFf4ht23DVuEjYMMqdJpKWzWkgwC3q2GqT3A=; 
	b=AbgOsVL6Ef6WBq9f5iily7oU2CPu1sGMgiO0qjOsCI5xkur+8tRusuPAKEHZUEZ3V2aO1UJnSxkwDDRRNxoSiDYCwg7T835rgSWb67ZqHx9iJM1AxWy6Cv+DWVpo8cmOYYzFz3NM0AiKfr7u4ZoWj6luSFuJlyp8HjLuMnUGV10=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003425;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9j0aEnPsFf4ht23DVuEjYMMqdJpKWzWkgwC3q2GqT3A=;
	b=FgHTyAymulI5Ru9lYKyZMIbtyQLW1up5yzp5g/XMCPX5Snig5KqTiaTFvUb2GMG7
	AWA2tt6krbxfxurKZ0M2qTryuy+IwA/fgwMmdmw+uDE94mfzKFW4cGkVOfXbRGgfVsh
	qlJrHcSEgf5HEUGrk7+QkMbz0DL7z037nqsloBQM=
Received: by mx.zohomail.com with SMTPS id 1769003423843237.2758502026851;
	Wed, 21 Jan 2026 05:50:23 -0800 (PST)
Message-ID: <4b33b50f-f0c3-4db8-b394-dd2d4d6e3a55@collabora.com>
Date: Wed, 21 Jan 2026 14:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 kernel@collabora.com
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
 <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
 <aWeTQ50DOtntcniN@willie-the-truck>
 <db0950f1-b357-47c2-9829-e33262ab456d@collabora.com>
 <aW4kb5EbxbrhTOxK@willie-the-truck>
 <b8f43fe8-3e07-4d98-a50d-817c31370710@collabora.com>
 <aXDL2JH_4RCDmAJv@willie-the-truck>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aXDL2JH_4RCDmAJv@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_055039_778476_5CD1FAD8 
X-CRM114-Status: GOOD (  22.18  )
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


Le 21/01/2026 à 13:51, Will Deacon a écrit :
> On Mon, Jan 19, 2026 at 03:03:44PM +0100, Benjamin Gaignard wrote:
>>>>>>>> +static const struct iommu_ops vsi_iommu_ops = {
>>>>>>>> +	.identity_domain = &vsi_identity_domain,
>>>>>>>> +	.release_domain = &vsi_identity_domain,
>>>>>>>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>>>>>>>> +	.of_xlate = vsi_iommu_of_xlate,
>>>>>>>> +	.probe_device = vsi_iommu_probe_device,
>>>>>>>> +	.release_device = vsi_iommu_release_device,
>>>>>>>> +	.device_group = generic_single_device_group,
>>>>>>>> +	.owner = THIS_MODULE,
>>>>>>>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>>>>>>>> +		.attach_dev		= vsi_iommu_attach_device,
>>>>>>>> +		.map_pages		= vsi_iommu_map,
>>>>>>>> +		.unmap_pages		= vsi_iommu_unmap,
>>>>>>>> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
>>>>>>> This has no callers and so your unmap routine appears to be broken.
>>>>>> It is a leftover of previous attempt to allow video decoder to clean/flush
>>>>>> the iommu by using a function from the API.
>>>>>> Now it is using vsi_iommu_restore_ctx().
>>>>>> I while remove it in version 12.
>>>>> Don't you still need some invalidation on the unmap path?
>>>> In vsi_iommu_unmap_iova() page is invalided by calling vsi_mk_pte_invalid().
>>> But that just writes an invalid descriptor and doesn't appear to invalidate
>>> the TLB at all.
>>>
>>>> That clear BIT(0) so the hardware knows the page is invalid.
>>>> Do I have miss something here ?
>>> Yes, the TLB structure needs to be invalidated so that the page-table
>>> walker sees the new value that you have written in memory.
>>>
>>> The rockchip driver gets this correct...
>> Rockchip hardware have a ZAP_ONE_LINE register which didn't exist on Verisilicon
>> hardware.
> Presumably you have some sort of Verisilicon datasheet or downstream driver
> from which you can infer the TLB invalidation runes?

I have only this downstream driver:
https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c
No datasheet...

>
>> I have tried to use VSI_MMU_BIT_FLUSH on VSI driver after unmapping iova
>> but it doesn't work.
> What do you mean by "doesn't work"? If it works without doing any
> invalidation at all, then it's very peculiar that adding the invalidation
> would introduce issues.

I mean VSI_MMU_BIT_FLUSH register can't be used to invalid the TLB.
I think the hardware iterates over the pages tables in memory and
check the valid/invalid bit.

Benjamin

>
>> So far calling dma_sync_single_for_device() seems to be enough to make iommu
>> and video decoder work together.
> I don't think we should settle for "seems to enough"! If we can reason
> about the operation of the hardware then the driver will be undebuggable
> when it eventually goes wrong.
>
> Will
>

