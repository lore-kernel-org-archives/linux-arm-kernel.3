Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C75C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVGVg+OYlp1Qk6fmw5rcJaBayL/Ch3LmOzOtD7sBbTQ=; b=sVIU2HcOd+QL6ZJ+fl74ff1QDI
	bKuUsOXK6jMwgpXEVmeiy9qgK/Evo6i3ClbgY66pxHG9zjnt/q5MJJT0qKcf30oTgu9agSsgGDHkL
	vBhWoNTLfHHXkLwfItd1Mfu3TSPIhMl+DwUGp4ycjz3zoRdCzXADihcK49xi7Q6weP3LRz9spQMyR
	dL6vDlvm7KE4ZEJjuRNqX0qzwvo8jU4owR6DJCazPnzKv1ED8hRo+bSeg4aW7gN+9A/OjODSx9H5C
	xYI3M4qGdSv3rUmx9uyGgzTDI7ELeimI2dojKY+ahvx/+PgnGQUFOzJOaWYiuw7sg27ncuHlxx6de
	DdX3ZTFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKBO-0000000Dy0G-1f2R;
	Thu, 19 Jun 2025 18:40:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSI7b-0000000DcVL-13KK;
	Thu, 19 Jun 2025 16:28:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750350477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cv7cshst83TrnjaCmvllkmN1E3sluuWfbFU/aFnHdPxoIiZ74Loz0kiUfgovvgZ9sJYPLVZZ5KaCsNfmfW/eD4viLVe3FzHDtRCrLauA6KTwCPETGX6LMA+xfQWDd/8+AjJwT6ATyCi6mJUwnB067uUd3H/aKvuOEef0p2yENNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750350477; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rVGVg+OYlp1Qk6fmw5rcJaBayL/Ch3LmOzOtD7sBbTQ=; 
	b=B0fqkAYa1GChomZVAEO8hfuVtA/6ws8c7t3h8M1AMqoAjq7gj9nw2PVe8pTi9l1if57Q9V1dfbjTA8gXgrjMOPTMmc8xyQE9IgicFCC2pty4fyQcBfXe9BDZJNR/vOJ9NmbER7U2d12zDxTtQ6yfZ7H+j/HR7Z8PZQ9Skg1GPWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750350477;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rVGVg+OYlp1Qk6fmw5rcJaBayL/Ch3LmOzOtD7sBbTQ=;
	b=dvQ7yEn2PkcD9rwE4l1CKHMASbvPLEKc8iMdkF4UT5JFyJbQth2T7ltguaEV52P+
	w6omdqpFnEr5iFwF9Bq66ybOCsFCGpaWNv0ptKQhpWkcujvJm6vvRypW8BxGu7AXeKT
	k9M6aG032aBMEPm9XL3CX86YUj+7zt54lbzahZHM=
Received: by mx.zohomail.com with SMTPS id 1750350476585176.7450336893728;
	Thu, 19 Jun 2025 09:27:56 -0700 (PDT)
Message-ID: <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
Date: Thu, 19 Jun 2025 18:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250619134752.GB1643390@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_092815_363041_44D6AAD6 
X-CRM114-Status: GOOD (  39.06  )
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


Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :
> On Thu, Jun 19, 2025 at 03:12:24PM +0200, Benjamin Gaignard wrote:
>
>> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
>> +{
>> +	struct vsi_iommu *iommu = vsi_iommu_get_from_dev(dev);
>> +	struct vsi_iommu_domain *vsi_domain;
>> +
>> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
>> +	if (!vsi_domain)
>> +		return NULL;
>> +
>> +	vsi_domain->dma_dev = iommu->dev;
>> +	iommu->domain = &vsi_identity_domain;
> ?? alloc paging should not change the iommu.
>
> Probably this belongs in vsi_iommu_probe_device if the device starts
> up in an identity translation mode.

Your are right it useless here, I will remove it.

>
>> +static u32 *vsi_dte_get_page_table(struct vsi_iommu_domain *vsi_domain, dma_addr_t iova)
>> +{
>> +	u32 *page_table, *dte_addr;
>> +	u32 dte_index, dte;
>> +	phys_addr_t pt_phys;
>> +	dma_addr_t pt_dma;
>> +
>> +	assert_spin_locked(&vsi_domain->dt_lock);
>> +
>> +	dte_index = vsi_iova_dte_index(iova);
>> +	dte_addr = &vsi_domain->dt[dte_index];
>> +	dte = *dte_addr;
>> +	if (vsi_dte_is_pt_valid(dte))
>> +		goto done;
>> +
>> +	page_table = (u32 *)iommu_alloc_pages_sz(GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);
> Unnecessary casts are not the kernel style, I saw a couple others too
>
> Ugh. This ignores the gfp flags that are passed into map because you
> have to force atomic due to the spinlock that shouldn't be there :(
> This means it does not set GFP_KERNEL_ACCOUNT when required. It would
> be better to continue to use the passed in GFP flags but override them
> to atomic mode.

I will add a gfp_t parameter and use it like that:
page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);

>
>> +static int vsi_iommu_identity_attach(struct iommu_domain *domain,
>> +				     struct device *dev)
>> +{
>> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	if (WARN_ON(!iommu))
>> +		return -ENODEV;
> These WARN_ON's should be removed. ops are never called by the core
> without a probed device.

ok

>
>> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
>> +				   struct device *dev)
>> +{
>> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	if (WARN_ON(!iommu))
>> +		return -ENODEV;
>> +
>> +	/* iommu already attached */
>> +	if (iommu->domain == domain)
>> +		return 0;
>> +
>> +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
>> +	if (ret)
>> +		return ret;
> Hurm, this is actually quite bad, now that it is clear the HW is in an
> identity mode it is actually a security problem for VFIO to switch the
> translation to identity during attach_device. I'd really prefer new
> drivers don't make this mistake.
>
> It seems the main thing motivating this is the fact a linked list has
> only a single iommu->node so you can't attach the iommu to both the
> new/old domain and atomically update the page table base.
>
> Is it possible for the HW to do a blocking behavior? That would be an
> easy fix.. You should always be able to force this by allocating a
> shared top page table level during probe time and making it entirely
> empty while staying always in the paging mode. Maybe there is a less
> expensive way.
>
> Otherwise you probably have work more like the other drivers and
> allocate a struct for each attachment so you can have the iommu
> attached two domains during the switch over and never drop to an
> identity mode.

I will remove the switch to identity domain and it will works fine.

>
>> +	iommu->domain = domain;
>> +
>> +	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
>> +	list_add_tail(&iommu->node, &vsi_domain->iommus);
>> +	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);
>> +
>> +	ret = pm_runtime_get_if_in_use(iommu->dev);
>> +	if (!ret || WARN_ON_ONCE(ret < 0))
>> +		return 0;
> This probably should have a comment, is the idea the resume will setup
> the domain? How does locking of iommu->domain work in that case?
>
> Maybe the suspend resume paths should be holding the group mutex..
>
>> +	ret = vsi_iommu_enable(iommu);
>> +	if (ret)
>> +		WARN_ON(vsi_iommu_identity_attach(&vsi_identity_domain, dev));
> Is this necessary though? vsi_iommu_enable failure cases don't change
> the HW, and a few lines above was an identity_attach. Just delay
> setting iommu->domain until it succeeds, and this is a simple error.

I think I will change vsi_iommu_enable() prototype to:
static int vsi_iommu_enable(struct vsi_iommu *iommu, struct iommu_domain *domain)
and do iommu->domain = domain; at the end of the function if everything goes correctly.


> iommu->domain = domain;
>
>
>> +static struct iommu_ops vsi_iommu_ops = {
>> +	.identity_domain = &vsi_identity_domain,
> Add:
>
>    .release_domain = &vsi_identity_domain,
>
> Which will cause the core code to automatically run through to
> vsi_iommu_disable() prior to calling vsi_iommu_release_device(), which
> will avoid UAF problems.
>
> Also, should the probe functions be doing some kind of validation that
> there is only one struct device attached?

which kind of validation ?

>
> Jason

