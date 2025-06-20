Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F23C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzBawclOe43ERcZy7J4jDWUUu+0y9y9V1OwtTyJQ2WE=; b=x8p4E709PlMZyLtUZSAOQmaIl8
	K0sEr5S0hyuZwYVIDEK1idbJycFuIJKs6Afli9TPXKbGID1FwyHqmNPTdQao1f5/9IGx6pYknGbU/
	4eGG7McUI6dzyL+4U0gXF2Zpgbwp98f6xecZXAjuKM9+f5ThzmXI+hT7i+GBNlbbEDDh2H7a5fcdh
	Hhj1MBGERw1H0YAK08WvZamweisy3G3vbpeOutVVYBHbtUrFBsCB2sgIywegY0rIuVtLGUQB0AWGQ
	+q4yKoFxOZeq+i341PL3TNQgJMNF34ODYgHuAR9SHzoDcVE9wwWQGdvUDthZyAIwWnBrBw/8Y77HY
	QHtlTOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYme-0000000FJPO-3Ud0;
	Fri, 20 Jun 2025 10:15:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXZg-0000000F8WR-2q6Y;
	Fri, 20 Jun 2025 08:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750409876; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mq3qTKsL5r1KYcnnjvTDAVHYvEnt0aED5H4duJSo8Gy3Y4nAktucNzBe6vU584JxxysFh6zFY+1XBQzt8Wxfuj+0Hf9MlqPJ46hnJKtxB+O7iAk5ZbbuCwyIf4ZyKe3tJ7++JEAO/O6TAK1u9fXinPeYZPL8l25i4m9zkaZEJds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750409876; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tzBawclOe43ERcZy7J4jDWUUu+0y9y9V1OwtTyJQ2WE=; 
	b=D/fZcV0UdEQw+4qwX4OqmMXSs0MvYyzyvYX5wxA4GQ3P4vWtjPs/S8479qdqXGVzGGHWeJA1AFeimwwgoJCP0VEX27zqV5szIQYGNZLe00Uo+LNJ2nNUeN8Pkjm2uKHMDh0eR0NNGjWvjV9Cb+V/YJANaFNiQS7sM4X9LAidunc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750409876;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tzBawclOe43ERcZy7J4jDWUUu+0y9y9V1OwtTyJQ2WE=;
	b=bwu7KTuZfvrC6M7JAww+/apj+S39B/ZUCQlkizCi0hoEqEvcD8DWsicieWYggztI
	L0Z+CZATiGgkNIGp9rJCu9TLMH9CVWL+zFBlj2KqZGvg1h4NLCsim1UcT4BCWj/Bvu5
	7d3ebBG98Fdlk5gIDwlxGSW9js6BXjudO5fcdcqk=
Received: by mx.zohomail.com with SMTPS id 1750409873940494.49871510642583;
	Fri, 20 Jun 2025 01:57:53 -0700 (PDT)
Message-ID: <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
Date: Fri, 20 Jun 2025 10:57:49 +0200
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
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
 <20250619165928.GA10257@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250619165928.GA10257@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_015816_787695_D2BD7831 
X-CRM114-Status: GOOD (  27.87  )
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


Le 19/06/2025 à 18:59, Jason Gunthorpe a écrit :
> On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
>> Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :
>>> Ugh. This ignores the gfp flags that are passed into map because you
>>> have to force atomic due to the spinlock that shouldn't be there :(
>>> This means it does not set GFP_KERNEL_ACCOUNT when required. It would
>>> be better to continue to use the passed in GFP flags but override them
>>> to atomic mode.
>> I will add a gfp_t parameter and use it like that:
>> page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);
> This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
> works..

I have test it, I don't see conflicts or errors. What worries you ?

>
>>>> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
>>>> +				   struct device *dev)
>>>> +{
>>>> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>>>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>>>> +	unsigned long flags;
>>>> +	int ret;
>>>> +
>>>> +	if (WARN_ON(!iommu))
>>>> +		return -ENODEV;
>>>> +
>>>> +	/* iommu already attached */
>>>> +	if (iommu->domain == domain)
>>>> +		return 0;
>>>> +
>>>> +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
>>>> +	if (ret)
>>>> +		return ret;
>>> Hurm, this is actually quite bad, now that it is clear the HW is in an
>>> identity mode it is actually a security problem for VFIO to switch the
>>> translation to identity during attach_device. I'd really prefer new
>>> drivers don't make this mistake.
>>>
>>> It seems the main thing motivating this is the fact a linked list has
>>> only a single iommu->node so you can't attach the iommu to both the
>>> new/old domain and atomically update the page table base.
>>>
>>> Is it possible for the HW to do a blocking behavior? That would be an
>>> easy fix.. You should always be able to force this by allocating a
>>> shared top page table level during probe time and making it entirely
>>> empty while staying always in the paging mode. Maybe there is a less
>>> expensive way.
>>>
>>> Otherwise you probably have work more like the other drivers and
>>> allocate a struct for each attachment so you can have the iommu
>>> attached two domains during the switch over and never drop to an
>>> identity mode.
>> I will remove the switch to identity domain and it will works fine.
> You'll loose invalidations..
>
> Maybe the easiest thing is to squish vsi_iommu_enable() and reorganize
> it so that the spinlock is held across the register programming and
> then you can atomically under the lock change the registers and change
> the linked list. The register write cannot fail so this is fine.
>
> This should probably also flush the iotlb inside the lock.

I will try to summarize:
in vsi_iommu_attach_device() I should:
- take the lock
- do nothing if the domain is the same.
- if iommu is used (ie powered up):
   - update the registers to enable the iommu
   - flush
   - update the link list
- update iommu->domain
- release the lock

in vsi_iommu_identity_attach() I should:
- take the lock
- do nothing if the domain is the same.
- if iommu is used (ie powered up):
   - disable the iommu
   - remove the node from the list
- update iommu->domain
- release the lock

vsi_iommu_suspend() and vsi_iommu_resume() will also have to take the lock
before calling vsi_iommu_disable() and vsi_iommu_enable().

sound good for you ?

Do I have to switch to identity domain in vsi_iommu_attach_device()
before applying the requested domain ?

Regards,
Benjamin

>
>>> Which will cause the core code to automatically run through to
>>> vsi_iommu_disable() prior to calling vsi_iommu_release_device(), which
>>> will avoid UAF problems.
>>>
>>> Also, should the probe functions be doing some kind of validation that
>>> there is only one struct device attached?
>> which kind of validation ?
> That only one device probed to the iommu?
>
> Jason

