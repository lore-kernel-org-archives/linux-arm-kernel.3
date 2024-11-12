Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFFAD42BBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSX5kVx/kK64TFAmRzo+QJMjvf56Eh3nCHsVd7SrkVU=; b=v8fIrPu0NefluQNF1+5fifGCL8
	8RPO+XuoVSbJm6hK3hVsmoSvT7hOdBa6Jn8gtX7VW7oJ2Ld3v85KJk48fPrZz8rYopSyL3UwuZ6Wh
	CoOvlZgSmmHOBHBMLvjpSy2OqcDkQM6HPOMDWDGCygQLNBorh61RavsPVvFvwtnqYCfu40M2Z1Rar
	+ClifR+K6C9CgiossV7AaPW6iEnDTRzKP1/cw+cpNYooAWtT4I5gHUcBStTiF66BPX2Ef8xaTS9hT
	aa1Z3V08ERl1/mzR6U+Pqgfvce7RRurD3lv9RKa1xbCXIS7/M2ZOoyuOf6Ut7nuD8YPNUi8uUWzeF
	c4XpX5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvDM-00000004TfR-2tT7;
	Tue, 12 Nov 2024 18:02:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuJ0-00000004HLS-40YS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:03:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B1D025E0;
	Tue, 12 Nov 2024 09:04:23 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2C2A3F6A8;
	Tue, 12 Nov 2024 09:03:52 -0800 (PST)
Message-ID: <8cb6b8e2-3a01-49a1-b34a-67b4671356fe@arm.com>
Date: Tue, 12 Nov 2024 17:03:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] iommu/arm-smmu-v3: Clean up iopf queue on probe
 failure
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <cover.1731088789.git.robin.murphy@arm.com>
 <161cf3bfde2993cc29e82589df947ff23fb82845.1731088789.git.robin.murphy@arm.com>
 <20241112155525.GB21479@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241112155525.GB21479@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090355_076404_A26B714B 
X-CRM114-Status: GOOD (  21.14  )
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

On 12/11/2024 3:55 pm, Will Deacon wrote:
> On Fri, Nov 08, 2024 at 06:30:16PM +0000, Robin Murphy wrote:
>> kmemleak noticed that the iopf queue allocated deep down within
>> arm_smmu_init_structures() can be leaked by a subsequent error return
>> from arm_smmu_device_probe(). Hardly a big deal when probe failure
>> represents something much more seriously wrong in the first place,
>> but on principle, adopt a dedicated cleanup path for those.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index b7dcb1494aa4..7908fca962fe 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -4609,7 +4609,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	/* Initialise in-memory data structures */
>>   	ret = arm_smmu_init_structures(smmu);
>>   	if (ret)
>> -		return ret;
>> +		goto free_iopf;
>>   
>>   	/* Record our private device structure */
>>   	platform_set_drvdata(pdev, smmu);
>> @@ -4620,22 +4620,27 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	/* Reset the device */
>>   	ret = arm_smmu_device_reset(smmu);
>>   	if (ret)
>> -		return ret;
>> +		goto free_iopf;
>>   
>>   	/* And we're up. Go go go! */
>>   	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
>>   				     "smmu3.%pa", &ioaddr);
>>   	if (ret)
>> -		return ret;
>> +		goto free_iopf;
>>   
>>   	ret = iommu_device_register(&smmu->iommu, &arm_smmu_ops, dev);
>>   	if (ret) {
>>   		dev_err(dev, "Failed to register iommu\n");
>> -		iommu_device_sysfs_remove(&smmu->iommu);
>> -		return ret;
>> +		goto free_sysfs;
>>   	}
>>   
>>   	return 0;
>> +
>> +free_sysfs:
>> +	iommu_device_sysfs_remove(&smmu->iommu);
>> +free_iopf:
>> +	iopf_queue_free(smmu->evtq.iopf);
>> +	return ret;
>>   }
> 
> Thanks. I think this is correct (and iopf_queue_free() checks for NULL,
> so we're good there) but I just wonder whether it would be more
> consistent to use devm_add_action_or_reset(), like we do for the MSIs.

Yeah, I did consider it, but in the end I had a hunch that we were 
liable to end up with more cleanup steps on this path anyway. Which then 
conveniently came true this morning when I realised why the box still 
wasn't seeing its disk even with the SATA probe un-deferred by patch #3.

(For reference I'm provoking an error from arm_smmu_probe_device() 
intentionally, by virtue of having a PCIe-to-PCI bridge aliasing two 
devices to the same StreamID - adding group support to make that 
actually work is still on the "maybe one day" list...)

Cheers,
Robin.

