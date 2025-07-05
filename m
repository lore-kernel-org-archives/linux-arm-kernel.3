Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2DEC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 10:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RviDwvDQqjYXFY5scaKMdpbhX+ttH9CgIKwYVhmfk4c=; b=KxKl2X49ukfIKMwyb0DCBuK7sd
	4wE1txBqtdyaVkIaCJM21iUKwg3yH5zyWONKukSTlvIS2axpmllS82Z9fbugGn82nleM8Bqk4GTQI
	8T/3QVylVGntc3F/liSb2hhHdUnqolnxc0OHnwWd0nFm4hfNokBuToLHjSmT8f4OQCX5QF9zl1//6
	URENhRK6BhO48fknqr5AxaeMyYgzHvq1R7HiZijIRwot/UFATGa4Zs6UU/416voXcXWTMruoQlZ8t
	rLmUcFVtS+xxf201TGjWipsir/fzE5g9UqbjDtTPu+4INsK3sC0LeuCpXqd3nIiuoCZkHWxdOXZa0
	n1YyTsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXznT-0000000GO5B-3PtC;
	Sat, 05 Jul 2025 10:07:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzl0-0000000GNf7-3uho;
	Sat, 05 Jul 2025 10:04:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751709851; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XuHk2ri8GSG4lBxChP/+R6h/v0JjJM7fresgHKd0dLQn7uzcCA0hY+emJrQhYBCdOSc1ZM+3CQfTZ51403WyvoVQyaVlV8C1KuhVhrRyyQ/q4h6xdYleLuY9wCU4wCYYQKmDFDpn+onBU63L3ZpmEm2vlSZtRNA8gRSK7vxB068=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751709851; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RviDwvDQqjYXFY5scaKMdpbhX+ttH9CgIKwYVhmfk4c=; 
	b=GpxsAABxo7BDZ6TD42gmws+/uPa4EuRGWNAbg3Rha+bP6/vul0ntR2oOKCf9Be0LOVfVit1MF1q+uARLbBFIGS8RsjHocvx/pdESm12H9czkFj+qz7IaymK1tkvgqkmSBVqs4fYBu49sGBPo9FF28P+l2nOlkgWBPwD7Ve9VFXw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751709851;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=RviDwvDQqjYXFY5scaKMdpbhX+ttH9CgIKwYVhmfk4c=;
	b=Z5qpHdf60CuJzdWjIWkZgUznVTXkHbdc/Pd/98TEepfRGmwJBpxsOnPmOJd4VJcM
	gvGlpvMDBtOfKFQsL2IIU4x5AjB+k/uBMIE2mos1U25Y8u2LY+n3gClKyXzFeaUFYfS
	LrwqKZSuON4ppy5BZR7SqslbdI6ChRjO+DRCEjWs=
Received: by mx.zohomail.com with SMTPS id 1751709849751114.53291093115388;
	Sat, 5 Jul 2025 03:04:09 -0700 (PDT)
Message-ID: <62cead85-2d50-45f1-8020-7aea77f6833b@collabora.com>
Date: Sat, 5 Jul 2025 12:04:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20250623153931.158765-1-benjamin.gaignard@collabora.com>
 <20250623153931.158765-4-benjamin.gaignard@collabora.com>
 <20250704175425.GM904431@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250704175425.GM904431@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_030431_049950_3C514BC3 
X-CRM114-Status: GOOD (  19.52  )
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


Le 04/07/2025 à 19:54, Jason Gunthorpe a écrit :
> On Mon, Jun 23, 2025 at 05:39:27PM +0200, Benjamin Gaignard wrote:
>> The Verisilicon IOMMU hardware block can be found in combination
>> with Verisilicon hardware video codecs (encoders or decoders) on
>> different SoCs.
>> Enable it will allow us to use non contiguous memory allocators
>> for Verisilicon video codecs.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> ---
>> change in version 4:
>> - Kconfig dependencies
>> - Fix the remarks done by Jason and Robin: locking, clocks, macros
>>    probing, pm_runtime, atomic allocation.
> It broadly seems OK to me
>
> Though I did notice this:
>
>> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
>> +{
>> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>> +	struct vsi_iommu_domain *vsi_domain;
>> +
>> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
>> +	if (!vsi_domain)
>> +		return NULL;
>> +
>> +	vsi_domain->iommu = iommu;
> So we store the iommu in the domain? And use the iommu->lock all over
> the place
>
>> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
>> +				   struct device *dev)
>> +{
>> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>> +	unsigned long flags;
>> +	int ret = 0;
>> +
>> +	ret = pm_runtime_resume_and_get(iommu->dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	spin_lock_irqsave(&iommu->lock, flags);
>> +	/* iommu already attached */
>> +	if (iommu->domain == domain)
>> +		goto unlock;
> But here we don't check that the domain matches the iommu of dev.
>
> This seems a bit weird to me, I didn't quite get why the domain uses
> iommu->lock instead of just having its own per-domain lock?
>
> But if it does use iommu->lock then this does need to prevent using
> domains with the wrong iommu because the also use the wrong lock and
> then this:

I would like to avoid that but maybe a static spinlock can solve that problem ?

Regards,
Benjamin

>
>> +
>> +	vsi_iommu_enable(iommu, domain);
>> +	list_add_tail(&iommu->node, &vsi_domain->iommus);
> Is not safe?
>
> Jason

