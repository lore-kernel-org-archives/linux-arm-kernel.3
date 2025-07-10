Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353C3C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E84MMCBx0xpgoES+NnhMP12vSRnynaQmVJ5b2UIKw+U=; b=yfovZ+HbZ1XgbYoQ9WfXeFT78H
	pA71qnyn/FzDY93G9a9Nl4CYJzGV392XGw4FoRuAXX2KKIiUvdc5OhtJhgOiU6BqZCzkuVOoBZtV7
	2NwciAK8RqHF5ccAPTaqwmFHtPNCY8m8OidKpU9QhOUZX6mLbjgk2qvb3FqDLHA07BLniexauxz/F
	dH23rDMjeKQW25WaghRJdLcVtjWZBvhrxcmgZX8TdKnRX2sWXSpfetGIW2rQB6CpcUCpXUCW7bLIF
	RA1BZ1JUmSETaLZ6VO90gWwku4JYe0ZZ30u1zlc4nWnCWgj/37hwbKapdEQmr4HEkBgLpEa7kQbmv
	L0zMQbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnyB-0000000BOWz-04qg;
	Thu, 10 Jul 2025 09:53:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmcH-0000000BAU5-0rQP;
	Thu, 10 Jul 2025 08:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752135991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UIVN/T8EgEA8ZWRjjnBLTVntc+IxhfMD6aHGUKeTQA/zAkWRha78G3UIhtJBF//0ZfU3UWy6WaTFa4uTCQU7+GQz42g5/fWmVMb0jC0f7Y1nsnOQkT6rZ6jJKnxJqdC49jJH0yKPlK9Xg9X1Zw4bPy0BlZLkUkWbbWA1frJS6QU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752135991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E84MMCBx0xpgoES+NnhMP12vSRnynaQmVJ5b2UIKw+U=; 
	b=JNywPzIAPiI4UaBnIxo40F7/q6agriArIReObqRi0c8C9xz8hej1juBMEARZ4TcOcJSt5OShK4lFRoDjol74+qfMS4ljVFNcxJCGsfy5WMnOjcDoXPlBD3qPc5xGi8Qbf43habnd6zlVucM+pPmE70MWnBKDej459OMr7XmA89k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752135991;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=E84MMCBx0xpgoES+NnhMP12vSRnynaQmVJ5b2UIKw+U=;
	b=SxXMR1Oij/dhJgr72YZNsBIf4bcHJllEF32lheb7Utsm0k/TWQ3ktodpS6VK9SXf
	mvpvDjhX4Jawd8e++ylmEVlybocCRm6Erb3iu3aTeM0YB8sOMlF9HhldjWbAW+5xFTy
	Tip3nmb/EOq2mFGzBYGMFm5qVzWLnphv2pFm/LS4=
Received: by mx.zohomail.com with SMTPS id 1752135988944558.2751903621047;
	Thu, 10 Jul 2025 01:26:28 -0700 (PDT)
Message-ID: <2759380e-51a5-4437-8caa-0039ccd79559@collabora.com>
Date: Thu, 10 Jul 2025 10:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] iommu: Add verisilicon IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
References: <20250709085337.53697-1-benjamin.gaignard@collabora.com>
 <20250709085337.53697-4-benjamin.gaignard@collabora.com>
 <20250709164533.GA1759573@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250709164533.GA1759573@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_012653_302863_FC2C6BD2 
X-CRM114-Status: GOOD (  18.44  )
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


Le 09/07/2025 à 18:45, Jason Gunthorpe a écrit :
> On Wed, Jul 09, 2025 at 10:53:28AM +0200, Benjamin Gaignard wrote:
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
>> +
>> +	vsi_iommu_enable(iommu, domain);
>> +	list_add_tail(&iommu->node, &vsi_domain->iommus);
>> +	iommu->domain = domain;
>> +
>> +unlock:
>> +	spin_unlock_irqrestore(&iommu->lock, flags);
>> +	pm_runtime_put_autosuspend(iommu->dev);
>> +	return ret;
> I thought this was mentioned before, but this doesn't handle
> attach_device being called twice without an identity attach in
> between.
>
> And now the new locking doesn't protect concurrent invalidation races,
> the lock is in the wrong place.
>
> hold the domain lock across the whole sequence to hold off any
> invalidation until the linked list is consistent with the HW
> programming:
>
>   spin_lock_irqsave(&vsi_domain->lock, flags2); // Prevent invalidation
>
>   vsi_iommu_enable(iommu, domain);
>   list_del(&iommu->node);
>   list_add_tail(&iommu->node, &vsi_domain->iommus);
>
>   spin_unlock_irqrestore(&vsi_domain->lock, flags);
>
> Then remove this:
>
>   +	/* iommu already attached */
>   +	if (iommu->domain == domain)
>   +		goto unlock;
>
> Since the fix above makes it safe regardless.
>
> And, also feels like again, but vsi_iommu_enable() needs to fully
> flush the cache since the translation is being changed, shouldn't
> there also be writes to VSI_MMU_FLUSH_BASE ?
>
> Otherwise the locking change looks OK and I don't have other comments.

I have fix that in v6.

Thanks a lot for your review.

Benjamin

>
> Jason

