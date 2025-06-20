Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC8CC77B7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V459JMUmyF9w2CF7odfd6vdr2BDTmJkRuH7Scgg3lLo=; b=ZDkgQEi0iNUGtVsFTUtoqJ2Rv2
	BNSq1Y3UvAIVPs8P4U1WlBU7lj76oL1LbPsnVZtz49XV7x3HOz5loYzVMBzUb369myhdULspONd9W
	COHIOi6MznJJMvn6Wd6RDpg7Ew2kQSLA51hnLy7VhB4MfeXV2qGE/hu+xOpeHOibLmMJiTYG8Vqjn
	zSOM2QWHbt0LpEkycJKuusPclONmZcJ2fYv9fb2hxfWYiI//vLBDlF+MfXYCKbr+7iWHXu5mP5pia
	CnIZjK7Q/fHl4ofiZ4YVXbm3ubvFN1om8tCROi4M8jW57Ta1dDB+bb2CuyJazRlrXZK+PHUk3HY6U
	Oyzi5XqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSdFu-0000000FvRM-23MN;
	Fri, 20 Jun 2025 15:02:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScBA-0000000FmWu-08rk;
	Fri, 20 Jun 2025 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V459JMUmyF9w2CF7odfd6vdr2BDTmJkRuH7Scgg3lLo=; b=j5q/qeHn35vvt61rCxqD3JulCI
	rim6hGFkc9llnzO2yN0xJVF6ZQN0o6vtSD44eWLHPNMEinnCWn7W3sJFkgi35ciFQ5nxBAsN7YT8M
	Y8XCe5ibLC4trza4ucv6+tXo+Kcb8tq8I0ybhoiFKnVBt/PF4suk1vh/ZmbV6aYsmTkqpc/1jY2XV
	rwo/pV8EG3aq+rHZ1E2ZEQ07Kd89yTqy/Q/dFlAwtQ1NSInWjY745jXM2CqsV2zf0zTrPZOlIWCLh
	ThXyK0KazmctwMga+kjXuXA9o1XpkookzRRyl2i+sWvo9y5gWcr7rgfWTzhIIsujkwppycbHLdKpK
	+bQSXXxA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uScB7-00000004knf-137z;
	Fri, 20 Jun 2025 13:53:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750427571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TXFOrOvEz7z1ai2laSiHdc57LGo4WZ9k8SJkVhzrfhqnwR0b1rPncIkqMG4VX7ZpvyYelO0JBnkmhrDGjgGNrpwvL0TZWo94GZaOUrP9myK6Isj2y5llSo/uUrvLQed+opagwHRuo6jvJ5DavjSyw1jIYOsgxMftmwnigA714k0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750427571; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V459JMUmyF9w2CF7odfd6vdr2BDTmJkRuH7Scgg3lLo=; 
	b=MMTZaNXtnwEFO2WRdtoGadqLqAnzc/YzvA/W7Z2ArWiZ9cqNU/hUQfcLQz7ulhlcUlCExzCFwcpkxKIRch4wnIQqGxO8FpNFOfKNOtYKSO5v+JHODAaPbzxqXk0EJgb8OY3pLxG0u5SR9olb2fiMMO990y9JuMXKp99EdfKR/90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750427571;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V459JMUmyF9w2CF7odfd6vdr2BDTmJkRuH7Scgg3lLo=;
	b=XMz83gLGVocBQQxhMXW3P41Im4nz6IP8qnRncCfexbBczpHYl1RS8MFGcilrvPYa
	gCE6lYBG8nfrS65sPW5tCrhl4mTSHQSVEhOyY6KOT13Ijf6FE/ha3v2o/A2qCdvvEkw
	32AsJPhSZf6Hzk8n3E2138cANxh3Z8xrQfCPOdmQ=
Received: by mx.zohomail.com with SMTPS id 1750427570159193.5196944847704;
	Fri, 20 Jun 2025 06:52:50 -0700 (PDT)
Message-ID: <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>
Date: Fri, 20 Jun 2025 15:52:46 +0200
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
 <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
 <20250620120509.GA39770@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250620120509.GA39770@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_145313_707601_F53AAE94 
X-CRM114-Status: GOOD (  36.81  )
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


Le 20/06/2025 à 14:05, Jason Gunthorpe a écrit :
> On Fri, Jun 20, 2025 at 10:57:49AM +0200, Benjamin Gaignard wrote:
>> Le 19/06/2025 à 18:59, Jason Gunthorpe a écrit :
>>> On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
>>>> Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :
>>>>> Ugh. This ignores the gfp flags that are passed into map because you
>>>>> have to force atomic due to the spinlock that shouldn't be there :(
>>>>> This means it does not set GFP_KERNEL_ACCOUNT when required. It would
>>>>> be better to continue to use the passed in GFP flags but override them
>>>>> to atomic mode.
>>>> I will add a gfp_t parameter and use it like that:
>>>> page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC | GFP_DMA32, SPAGE_SIZE);
>>> This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
>>> works..
>> I have test it, I don't see conflicts or errors. What worries you ?
> Just looking at the bitmaps I'm not sure? Did you run with lockdep?

Yes and it complains about that.
I see that sun50i driver have more less the same struct than my driver
but doesn't use lock. I will try see if I can remove the lock.

>>>>>> +static int vsi_iommu_attach_device(struct iommu_domain *domain,
>>>>>> +				   struct device *dev)
>>>>>> +{
>>>>>> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
>>>>>> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
>>>>>> +	unsigned long flags;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	if (WARN_ON(!iommu))
>>>>>> +		return -ENODEV;
>>>>>> +
>>>>>> +	/* iommu already attached */
>>>>>> +	if (iommu->domain == domain)
>>>>>> +		return 0;
>>>>>> +
>>>>>> +	ret = vsi_iommu_identity_attach(&vsi_identity_domain, dev);
>>>>>> +	if (ret)
>>>>>> +		return ret;
>>>>> Hurm, this is actually quite bad, now that it is clear the HW is in an
>>>>> identity mode it is actually a security problem for VFIO to switch the
>>>>> translation to identity during attach_device. I'd really prefer new
>>>>> drivers don't make this mistake.
>>>>>
>>>>> It seems the main thing motivating this is the fact a linked list has
>>>>> only a single iommu->node so you can't attach the iommu to both the
>>>>> new/old domain and atomically update the page table base.
>>>>>
>>>>> Is it possible for the HW to do a blocking behavior? That would be an
>>>>> easy fix.. You should always be able to force this by allocating a
>>>>> shared top page table level during probe time and making it entirely
>>>>> empty while staying always in the paging mode. Maybe there is a less
>>>>> expensive way.
>>>>>
>>>>> Otherwise you probably have work more like the other drivers and
>>>>> allocate a struct for each attachment so you can have the iommu
>>>>> attached two domains during the switch over and never drop to an
>>>>> identity mode.
>>>> I will remove the switch to identity domain and it will works fine.
>>> You'll loose invalidations..
>>>
>>> Maybe the easiest thing is to squish vsi_iommu_enable() and reorganize
>>> it so that the spinlock is held across the register programming and
>>> then you can atomically under the lock change the registers and change
>>> the linked list. The register write cannot fail so this is fine.
>>>
>>> This should probably also flush the iotlb inside the lock.
>> I will try to summarize:
>> in vsi_iommu_attach_device() I should:
>> - take the lock
>> - do nothing if the domain is the same.
>> - if iommu is used (ie powered up):
>>    - update the registers to enable the iommu
>>    - flush
>>    - update the link list
>> - update iommu->domain
>> - release the lock
> That sounds believable, yes.. Though can you do the "powered up" checks
> inside the spinlock - are they sleeping? Can they be done before the
> spinlock?
>
>> in vsi_iommu_identity_attach() I should:
>> - take the lock
>> - do nothing if the domain is the same.
>> - if iommu is used (ie powered up):
>>    - disable the iommu
>>    - remove the node from the list
>> - update iommu->domain
>> - release the lock
> And maybe flush too? How does the caching hw work at this point? You
> can't have stale entries in the cache when you switch back to an
> enabled/translating configuration. So either the HW flushes implicitly
> or you need to add a flush somewhere..

I do not have the documentation for the hardware but it seems that
enable/disable are enough to do the job.
  

>   
>> vsi_iommu_suspend() and vsi_iommu_resume() will also have to take the lock
>> before calling vsi_iommu_disable() and vsi_iommu_enable().
> Yes, if they use iommu->domain that seems good
>
> If the above locking is a problem then I'd use the group mutex instead
> during resume/suspend. The attach functions are already called with
> the group mutex held.

Does group mutex is also called when using vsi_iommu_map or vsi_iommu_unmap ?

>
>> Do I have to switch to identity domain in vsi_iommu_attach_device()
>> before applying the requested domain ?
> No, that is what creates the security problem. What you want is to
> update the HW registers in a way that the HW just changes hitlessly
> from one translation to another, then flush the cache.
>
> Jason

