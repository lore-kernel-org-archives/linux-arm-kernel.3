Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789DFCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jba/OcUQqUC+iKtXDpfu65FCyEQVy/d/ssT/VTffXaE=; b=X0RrxWPQdfH5VWGrZ0czmMUxrp
	uldIyZbyDDkKRoWGHlSCNoN4O+RTWXT4ps9Ah6/WlMQg227jgcrmXPCqgu3TU/u4fH6pHaEN/aHsI
	TPsFcQiC1TE8inTM+dOEAcV2HsZeRXy2Fpyv5J6qzLtYP5YDuyQaWBGwUCa5dmfRWuY9LCyrX6ewt
	kpUoJ/HTZVM8PpMcPnxxcPo71Xf0pS+iuSXN3SRNuralOjzTv5ptQ6gxk61XkzyX/zxXraGequbIm
	01dVEH8dCFdQ6npN1dbUlvNJffhCWdti3JwapcJsV5m5H06BUMnqacbdkegHC17bKbWPAOJzea64Q
	LwnSQfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Pq-0000000BFxa-3ZES;
	Mon, 01 Jun 2026 14:14:54 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Pm-0000000BFwc-2j5K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780323283; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Jba/OcUQqUC+iKtXDpfu65FCyEQVy/d/ssT/VTffXaE=;
	b=JDL2lfAoBtaJyXEbnGmCiNQvAQmNDPT9Ti1hYdbBSKY9GCc3B0z2FlXRxQyX8x2jV3JzlYYv6ipuHU+aVPkOJf1bQAgdhOrV7v+CrkMdbhxX9i2J90hKZ+4oSioMP3dGLQBKEN+1JGSCp9Fch8BBGz1IjyjySLEjReL7Gr5c26A=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X40RrRa_1780323268;
Received: from 30.221.133.117(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X40RrRa_1780323268 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 01 Jun 2026 22:14:37 +0800
Message-ID: <ff2a4364-8463-42cb-9a2b-fae1ef64c423@linux.alibaba.com>
Date: Mon, 1 Jun 2026 22:14:27 +0800
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
 <a0875d9f-4aed-4164-861c-6fbbdfe04080@linux.alibaba.com>
 <20260601134322.GY2487554@ziepe.ca>
From: "guanghuifeng@linux.alibaba.com" <guanghuifeng@linux.alibaba.com>
In-Reply-To: <20260601134322.GY2487554@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071451_419527_B613F84C 
X-CRM114-Status: GOOD (  16.53  )
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


在 2026/6/1 21:43, Jason Gunthorpe 写道:
> On Mon, Jun 01, 2026 at 04:41:48PM +0800, guanghuifeng@linux.alibaba.com wrote:
>>>> +/**
>>>> + * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
>>>> + * @domain: IOMMU domain to query
>>>> + * @iova: IO virtual address to translate
>>>> + * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
>>>> + *
>>>> + * Like iommu_iova_to_phys() but additionally returns the page size of the
>>>> + * PTE mapping at @iova through @mapped_length.
>>>> + *
>>>> + * Return: The physical address for the given IOVA, or 0 if no translation.
>>>> + */
>>> When introducing the new function I would like to fix this 0 error as
>>> well, it should return PHYS_MAX for error
>> Implementations such as arm_smmu_iova_to_phys/DOMAIN_NS(iova_to_phys)
>> all use a return value of 0 as an invalid state, so 0 is used as the
>> representation of an invalid state to maintain compatibility.
> I know, but this bad choice has already caused bugs so if we are
> changing everything I would prefer we fix it.

OK, there are a lot of changes in the current commit. This issue will be 
fixed in a subsequent series patch.

>>>> +phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
>>>> +				       dma_addr_t iova,
>>>> +				       size_t *mapped_length)
>>>>    {
>>>> +	if (mapped_length)
>>>> +		*mapped_length = 0;
>>>> +
>>>>    	if (domain->type == IOMMU_DOMAIN_IDENTITY)
>>>>    		return iova;
>>>>    	if (domain->type == IOMMU_DOMAIN_BLOCKED)
>>>>    		return 0;
>>> Any domain that doesn't have an op should fail, blocked is one example
>> In accordance with the implementation of iommu_iova_to_phys, it returns a
>> phy value of 0 in invalid states.
> Detect the invalid states by looking at ops not domain->type
>
>>> I suggest you approach the patch plan a little differently, the first
>>> patches should implement the new function and an iommput
>>> implementation
>>>
>>> Arrange things so the normal iova_to_phys calls the new function if it
>>> is available and discards the length.
>>>
>>> Then convert callers that can take advantage of it. Have the fallback
>>> path also compute the length by iterating internally.
>>>
>>> Finally one patch per driver implementing the new op, this could even
>>> be a second series.
>>>
>>> Don't remove iova_to_phys(), it is fine for things that don't need the
>>> length.
>> Does this mean retaining the iommu_iova_to_phys implementation but
>> implementing it through domain->ops->iova_to_phys_length (mapped_length is
>> NULL)?
> Yes
>
> Jason

