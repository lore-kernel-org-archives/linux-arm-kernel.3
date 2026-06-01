Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0B4CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klc98YH+ItkJ3emUHfiBibK7AzKrV+4NC80O7N82uMI=; b=UGCvpBoQyRSrPuKopwwGs3+Gz1
	YWhuhLWZKHtuxYboV52cQ65QwmcETYSvEJKbeS4tWyaarHbw48Wj1WsWF+FhdgW1m6j20J7hWn2UI
	ZMOZjokHGfBpHShf5LJQpo6CNfX/z0w3ihldxapFZ5fjLjd60gZ/IeNqGr7WSz0C6K4cBZV7lJX7g
	mphiRKtNiY1b0LjgA+KaV2/END2NfLVp1BS6qe0Q7JDT67awyN56tdV7OhF+gpET6Ous71uGp8GJx
	ibymzOIdV+kKVqkenUCtnqUL4iobGLkeNgBeNb8eoHpBdLkR63iNCqyYNyNgdlc37poOI7XFRzKWq
	/2P7evIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyDq-0000000ANoo-161z;
	Mon, 01 Jun 2026 08:42:10 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyDn-0000000ANnq-41wk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780303324; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=klc98YH+ItkJ3emUHfiBibK7AzKrV+4NC80O7N82uMI=;
	b=N8YfZhO0qDcbvkK6ZHdgijCClsRz7B6DDFuADuJxhMS0sFBOAe7RG70xlw/bzYSGak33Rqt/yQoZgNVU5pMBJYiU76UM1c3YiH8C3JjCjblWwhxba8pJe6mv5WLz0STMa5LPBhwhQ0mPHG2UVAmC/kwTWFCzSIQQH++32VpdOSE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X3zThL._1780303309;
Received: from 30.221.133.117(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X3zThL._1780303309 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 01 Jun 2026 16:42:00 +0800
Message-ID: <a0875d9f-4aed-4164-861c-6fbbdfe04080@linux.alibaba.com>
Date: Mon, 1 Jun 2026 16:41:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 alex@shazbot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
 baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
 dwmw2@infradead.org, xlpang@linux.alibaba.com,
 oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
 wei.guo.simon@linux.alibaba.com,
 alikernel-developer <alikernel-developer@linux.alibaba.com>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-2-guanghuifeng@linux.alibaba.com>
 <20260531235148.GV2487554@ziepe.ca>
From: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
In-Reply-To: <20260531235148.GV2487554@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014208_369971_B6E8A3CD 
X-CRM114-Status: GOOD (  27.46  )
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


在 2026/6/1 7:51, Jason Gunthorpe 写道:
> On Sun, May 31, 2026 at 05:36:29PM +0800, Guanghui Feng wrote:
>> Add iova_to_phys_length callback to struct iommu_domain_ops alongside
>> the existing iova_to_phys. The new callback returns both the physical
>> address and the PTE mapping page size in a single page table walk.
>>
>> Add iommu_iova_to_phys_length() core function that:
>> - Checks ops->iova_to_phys_length first (preferred path)
>> - Falls back to ops->iova_to_phys for unmigrated drivers
>>
>> This enables callers like VFIO to efficiently traverse IOVA space
>> by actual mapping granularity instead of fixed PAGE_SIZE steps.
>>
>> Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
>> Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
>> Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
>> ---
>>   drivers/iommu/iommu.c | 34 ++++++++++++++++++++++++++++++++--
>>   include/linux/iommu.h |  9 +++++++++
>>   2 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index d1a9e713d3a0..43323229a1df 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -2545,15 +2545,45 @@ void iommu_detach_group(struct iommu_domain *domain, struct iommu_group *group)
>>   }
>>   EXPORT_SYMBOL_GPL(iommu_detach_group);
>>   
>> -phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
>> +/**
>> + * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
>> + * @domain: IOMMU domain to query
>> + * @iova: IO virtual address to translate
>> + * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
>> + *
>> + * Like iommu_iova_to_phys() but additionally returns the page size of the
>> + * PTE mapping at @iova through @mapped_length.
>> + *
>> + * Return: The physical address for the given IOVA, or 0 if no translation.
>> + */
> When introducing the new function I would like to fix this 0 error as
> well, it should return PHYS_MAX for error

Implementations such as arm_smmu_iova_to_phys/DOMAIN_NS(iova_to_phys)

all use a return value of 0 as an invalid state, so 0 is used as the 
representation

of an invalid state to maintain compatibility.

>
>> +phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
>> +				       dma_addr_t iova,
>> +				       size_t *mapped_length)
>>   {
>> +	if (mapped_length)
>> +		*mapped_length = 0;
>> +
>>   	if (domain->type == IOMMU_DOMAIN_IDENTITY)
>>   		return iova;
>>   
>>   	if (domain->type == IOMMU_DOMAIN_BLOCKED)
>>   		return 0;
> Any domain that doesn't have an op should fail, blocked is one example

In accordance with the implementation of iommu_iova_to_phys, it returns 
a phy value of 0 in invalid states.

>
>>   
>> -	return domain->ops->iova_to_phys(domain, iova);
>> +	if (domain->ops->iova_to_phys_length)
>> +		return domain->ops->iova_to_phys_length(domain, iova,
>> +							mapped_length);
>> +
>> +	/* Fallback to legacy iova_to_phys without length info */
>> +	if (domain->ops->iova_to_phys)
>> +		return domain->ops->iova_to_phys(domain, iova);
> If it falls back it should return something sensible for the length.
>
> I suggest you approach the patch plan a little differently, the first
> patches should implement the new function and an iommput
> implementation
>
> Arrange things so the normal iova_to_phys calls the new function if it
> is available and discards the length.
>
> Then convert callers that can take advantage of it. Have the fallback
> path also compute the length by iterating internally.
>
> Finally one patch per driver implementing the new op, this could even
> be a second series.
>
> Don't remove iova_to_phys(), it is fine for things that don't need the
> length.

Does this mean retaining the iommu_iova_to_phys implementation but

implementing it through domain->ops->iova_to_phys_length (mapped_length 
is NULL)?

>
> Jason

