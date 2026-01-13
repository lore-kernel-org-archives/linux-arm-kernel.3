Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860AED2F33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MTiHfloStfO84sC7uhvGAOAjhnPQBxw01aUbUwJ3uE=; b=VxCodz5jNcSBG2C3OKzcFeAmAa
	ZvyGYNaM92B3wqk+Sxb0FYinpODXcrn0zOvg1troMdlekgaixrh7Yi2RoMNh6X++sK0Ib86d4qdaN
	/oYXCvbIihqV3CehMsf600LPUQa7nFRwvEhFg/DnC+OHAtdKamB6G5tAVKST6RyFd8hwoY3RmlC7B
	MfTmhSBGQVKNaLBg+aEGIlRGz35NPioXq70jxaTZbd2t4tchdTJIM9S38eUtCWNO3bYOLhUydYAdo
	839Qv5INdj7y0DOhHYNnlayKNz1ab+93s3hM+kfT2pifROaUIlaRL9GtmdVWxilhuUDtsGvil01bT
	RyHH+G4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhDW-00000007T3o-0cmf;
	Tue, 13 Jan 2026 16:26:02 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfhDU-00000007T2x-1scU;
	Tue, 13 Jan 2026 16:26:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768321546; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DLH1LzOnCusazCYXX75NuMLJP83JxGsgedB7KGa2sOKG+ZQh30Ix6X7QNmnVES7B4DAWPiylYujhrPJE9ePCwSkntdEA5nL1CVKVfteb1RaoOj1wF2i9iVWdBt5d3+qpkgc3kik760CsUjrhjGNU/rcCApQeFD8K33jsNJx3dpY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768321546; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8MTiHfloStfO84sC7uhvGAOAjhnPQBxw01aUbUwJ3uE=; 
	b=SIsa1Y1QhTpfxhlrqSjL11vkUWAxF4a14NFrBtl6MFGqPyH+MBBvJ1Pq0koF5F3ZfIv9DRZV/OGVvAP6TphHRk/eY/Nxj3li1dCQKtyGDIZPNXrrMsAcaK8AFQByg4q3VTz2Nn+c++AEG3M962pc0JuQ7h+kt4LacuI63sX/hVU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768321546;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8MTiHfloStfO84sC7uhvGAOAjhnPQBxw01aUbUwJ3uE=;
	b=bFsn/J3vxgypV86zjeTIuOFJba9OL7HTRMgwvfjDsAWBPlJqF5E9KD/xVc6mLg/A
	z699RwO9we9zu32cwiVCaTr0RyW756EanyoVO6BITFHOkh7cbSZHv6VO63qwc4PN1T8
	v4A4I79/8OHgO7pEwg7pT5zNNzTrbj1vp17KxPV4=
Received: by mx.zohomail.com with SMTPS id 1768321544021680.0980354267477;
	Tue, 13 Jan 2026 08:25:44 -0800 (PST)
Message-ID: <68a49f8b-178c-4fa2-b4a9-315ad602271d@collabora.com>
Date: Tue, 13 Jan 2026 17:25:38 +0100
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
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <aWZui-rn5RDPwpEO@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_082600_536142_27D81A2B 
X-CRM114-Status: GOOD (  28.22  )
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


Le 13/01/2026 à 17:10, Will Deacon a écrit :
> Hi Benjamin,
>
> Thanks for posting a v11.
>
> On Wed, Jan 07, 2026 at 11:09:53AM +0100, Benjamin Gaignard wrote:
>> The Verisilicon IOMMU hardware block can be found in combination
>> with Verisilicon hardware video codecs (encoders or decoders) on
>> different SoCs.
>> Enable it will allow us to use non contiguous memory allocators
>> for Verisilicon video codecs.
>> If both decoder and this iommu driver are compiled has modules
>> there is undefined symboles issues so this iommu driver could
>> only be compiled has built-in.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> changes in version 11:
>> - Fix dependency issue when decoder driver is build as module.
>>
>>   drivers/iommu/Kconfig     |  11 +
>>   drivers/iommu/Makefile    |   1 +
>>   drivers/iommu/vsi-iommu.c | 808 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/vsi-iommu.h |  21 +
>>   4 files changed, 841 insertions(+)
>>   create mode 100644 drivers/iommu/vsi-iommu.c
>>   create mode 100644 include/linux/vsi-iommu.h
> Based on your reply to v9:
>
> https://lore.kernel.org/all/0eff8b1a-c45f-47b1-a871-59f4a0101f0f@collabora.com/
>
> I took another look at this to see whether it had changed significantly
> from v6 when compared to the rockchip driver. Sadly, they still look
> very similar to me and I continue to suspect that the hardware is a
> derivative. I really don't understand why having a shared implementation
> of the default domain ops is difficult or controversial. Have you tried
> to write it?
>
> However, given that nobody from the Rockchip side has contributed to the
> discussion and you claim that this is a distinct piece of IP, I don't
> want to block the merging of the driver by leaving the conversation
> hanging.
>
> There is still one thing I don't understand (which, amusingly, the
> rockchip driver doesn't seem to suffer from):
>
>> +static void vsi_iommu_flush_tlb_all(struct iommu_domain *domain)
>> +{
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	struct list_head *pos;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&vsi_domain->lock, flags);
>> +
>> +	list_for_each(pos, &vsi_domain->iommus) {
>> +		struct vsi_iommu *iommu;
>> +		int ret;
>> +
>> +		iommu = list_entry(pos, struct vsi_iommu, node);
>> +		ret = pm_runtime_resume_and_get(iommu->dev);
>> +		if (ret < 0)
>> +			continue;
>> +
>> +		spin_lock(&iommu->lock);
>> +
>> +		writel(VSI_MMU_BIT_FLUSH, iommu->regs + VSI_MMU_FLUSH_BASE);
>> +		writel(0, iommu->regs + VSI_MMU_FLUSH_BASE);
>> +
>> +		spin_unlock(&iommu->lock);
>> +		pm_runtime_put_autosuspend(iommu->dev);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&vsi_domain->lock, flags);
>> +}
> [...]
>
>> +static const struct iommu_ops vsi_iommu_ops = {
>> +	.identity_domain = &vsi_identity_domain,
>> +	.release_domain = &vsi_identity_domain,
>> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
>> +	.of_xlate = vsi_iommu_of_xlate,
>> +	.probe_device = vsi_iommu_probe_device,
>> +	.release_device = vsi_iommu_release_device,
>> +	.device_group = generic_single_device_group,
>> +	.owner = THIS_MODULE,
>> +	.default_domain_ops = &(const struct iommu_domain_ops) {
>> +		.attach_dev		= vsi_iommu_attach_device,
>> +		.map_pages		= vsi_iommu_map,
>> +		.unmap_pages		= vsi_iommu_unmap,
>> +		.flush_iotlb_all	= vsi_iommu_flush_tlb_all,
> This has no callers and so your unmap routine appears to be broken.

It is a leftover of previous attempt to allow video decoder to clean/flush
the iommu by using a function from the API.
Now it is using vsi_iommu_restore_ctx().
I while remove it in version 12.

Thanks for your review.
Benjamin

>
> Will

