Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F97C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X++hZ4+dEJl4ObWugqXpG1frU7CRMDZfyzObRO+HN4k=; b=VgFjGCZYRfo+lJMGFSydyDJsgD
	M4ON1F2espwxB6oK/qF9R0MiZgAFreWPyyyLQzsUjAYvkY+yxW8lN3EdrujpVUCAF9V7fmhFYQURD
	j7v43cgywch4TuRJmw64vXsvCBgiW3l8EoTBz6s9FBeWH9wpaxZ0qyhyyTRnF2Xllw5XoOOQXy0dR
	3y2La1h/7nlOmbQFsPAxWCpu0yxE1n9KcKx3V8RvHBMLwhZWxsbKAgiaTxG7hsfKuNdGIC/+YxfgF
	jJoRDlgCvuJnVHTjUXyqo4+jOK8w2gOg18ONK33Hzw2CmTATcGL/SfSGImm75j9A7zoIP7KykKHY5
	3ZdxO1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5D7-00000005VTk-0mYj;
	Mon, 17 Feb 2025 17:47:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk40T-00000005Gi1-08Yk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:30:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C364152B;
	Mon, 17 Feb 2025 08:30:23 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 766D73F5A1;
	Mon, 17 Feb 2025 08:29:54 -0800 (PST)
Message-ID: <f882ec8a-c577-4487-bf46-8c406c60aa67@arm.com>
Date: Mon, 17 Feb 2025 16:29:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iommu: Handle race with default domain setup
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nipun Gupta
 <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org
References: <cover.1739486121.git.robin.murphy@arm.com>
 <87bd187fa98a025c9665747fbfe757a8bf249c18.1739486121.git.robin.murphy@arm.com>
 <2a090f80-e145-410d-8d02-efdaf324c8c9@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <2a090f80-e145-410d-8d02-efdaf324c8c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083005_169064_C9B3571F 
X-CRM114-Status: GOOD (  25.30  )
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

On 14/02/2025 12:57 pm, Charan Teja Kalla wrote:
> Thanks a lot for posting these patches, Robin.
> 
> On 2/14/2025 5:18 AM, Robin Murphy wrote:
>>   drivers/iommu/iommu.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 870c3cdbd0f6..2486f6d6ef68 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -3097,6 +3097,11 @@ int iommu_device_use_default_domain(struct device *dev)
>>   		return 0;
>>   
>>   	mutex_lock(&group->mutex);
>> +	/* We may race against bus_iommu_probe() finalising groups here */
>> +	if (!group->default_domain) {
>> +		ret = -EPROBE_DEFER;
>> +		goto unlock_out;
>> +	}
> 
> We just hit the issue again even after picking up this patch, though
> very hard to reproduce, on 6.6 LTS.
> 
> After code inspection, it seems the issue is that - default domain is
> setup in the bus_iommu_probe() before hitting of this replay.
> 
> A:async client probe in platform_dma_configure(), B:bus_iommu_probe() :-
> 
> 1) A: sets up iommu_fwspec under iommu_probe_device_lock.
> 
> 2) B: Sets the dev->iommu_group under iommu_probe_device_lock. Domain
> setup is deferred.
> 
> 3) A: Returns with out allocating the default domain, as
> dev->iommu_group is set, whose checks are also made under the same
> 'iommu_probe_device_lock'. __This miss setting of the valid dev->dma_ops__.
> 
> 4) B: Sets up the group->default_domain under group->mutex.
> 
> 5) A: iommu_device_use_default_domain(): Relies on this
> group->default_domain, under the same mutex, to decide if need to go for
> replay, which is skipped. This is skipping the setting up of valid
> dma_ops and that's an issue.
> 
> But I don't think that the same issue exists on 6.13 because of your
> patch, b67483b3c44e ("iommu/dma: Centralise iommu_setup_dma_ops()").
> bus_iommu_probe():
>       list_for_each_entry_safe(group, next, &group_list, entry) {
> 		mutex_lock(&group->mutex);
> 		for_each_group_device(group, gdev)
> 			iommu_setup_dma_ops(gdev->dev);
> 		mutex_unlock(&group->mutex);
>       }
> 
> This makes the step4 above force to use the valid dma_iommu api, thus I
> see no issue when there is no probe deferral.
> 
> So, I think we are good with this patch on 6.13.
> 
> Now coming back to 6.6 LTS, any ideas you have here, please?

Thanks for the analysis once again! I've not looked closely at 6.6 yet, 
but if we're all happy this looks like the right fix for mainline then 
I'll start having a look at the backport as soon as I can (so much for 
hoping it would be simple...)

Cheers,
Robin.

> 
>>   	if (group->owner_cnt) {
>>   		if (group->domain != group->default_domain || group->owner ||
>>   		    !xa_empty(&group->pasid_array)) {
> 
> 
> Thanks,
> Charan

