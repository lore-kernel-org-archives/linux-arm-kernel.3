Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76E2D42BA2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZrBDaY4vXm5Jj9GW9tRjcAMrXjoTnlFWYTP+8acgd4=; b=GPnnbQsFFO6MBupMZ/z1sAyOLw
	AS+ZG8HhpL5ySyndTTI91nisyikTlK+J+hqrMM4XTDvtmOEhuXZ0tHZlkySXooIzzzNjdH92KWVGx
	tSuPzgGXgLXYJkPdWJAdUO/rMQDfZ5lU2rOHleNK8EnSdBeVh9PZlD74MF12ECNw1135XSYBpE9ig
	uga4DQbNQaNHI6fmelGuFF0fEMftf/9oLHDuNypKh7Qz7PHf4w0dM3/Cl792BJikqjXMD72J9Iqxf
	LsgcvJ88rzAsf1h5A6BVHZv3oTWjazbuIR9wmBjtBIbZny8e7KkLIKJK90vLo5v+AVWT2BBK3sNFt
	TiibUGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtRt-000000045CL-0pXI;
	Tue, 12 Nov 2024 16:09:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtOU-000000044Tn-01pM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:05:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5EE21516;
	Tue, 12 Nov 2024 08:05:57 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFF4D3F6A8;
	Tue, 12 Nov 2024 08:05:26 -0800 (PST)
Message-ID: <46ccf0f1-58f8-4861-85f1-7cb562af23f6@arm.com>
Date: Tue, 12 Nov 2024 16:05:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] iommu/arm-smmu: Make instance lookup robust
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <cover.1731088789.git.robin.murphy@arm.com>
 <9d2ec624a640c421e97334deff537a2e899356c7.1731088789.git.robin.murphy@arm.com>
 <20241112154358.GA21479@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241112154358.GA21479@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080530_128719_4A584C93 
X-CRM114-Status: GOOD (  22.59  )
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

On 12/11/2024 3:43 pm, Will Deacon wrote:
> On Fri, Nov 08, 2024 at 06:30:15PM +0000, Robin Murphy wrote:
>> Relying on the driver list was a cute idea for minimising the scope of
>> our SMMU device lookups, however it turns out to have a subtle flaw. The
>> SMMU device only gets added to that list after arm_smmu_device_probe()
>> returns success, so there's actually no way the iommu_device_register()
>> call from there could ever work as intended, even if it wasn't already
>> hampered by the fwspec setup not happening early enough.
>>
>> Switch both arm_smmu_get_by_fwnode() implementations to use a platform
>> bus lookup instead, which *will* reliably work. Also make sure that we
>> don't register SMMUv2 instances until we've fully initialised them, to
>> avoid similar consequences of the lookup now finding a device with no
>> drvdata. Moving that code is also a perfect excuse to give it a little
>> dev_err_probe() tidyup as well.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>
>> This should in theory replace 229e6ee43d2a ("iommu/arm-smmu: Defer
>> probe of clients after smmu device bound"), or at least allow it to be
>> reverted going forward.
> 
> Let's revert that as part of this series, then?

Sure, at time of posting I wasn't entirely sure where we'd stand on 
replace vs. revert (TBH I'd lost track and didn't even realise we're at 
rc7 already...)

>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  4 +--
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 31 ++++++++++-----------
>>   2 files changed, 16 insertions(+), 19 deletions(-)
> 
> [...]
> 
>> @@ -2255,6 +2240,18 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	arm_smmu_device_reset(smmu);
>>   	arm_smmu_test_smr_masks(smmu);
>>   
>> +	err = iommu_device_sysfs_add(&smmu->iommu, smmu->dev, NULL,
>> +				     "smmu.%pa", &smmu->ioaddr);
>> +	if (err)
>> +		return dev_err_probe(dev, err, "Failed to register iommu in sysfs\n");
>> +
>> +	err = iommu_device_register(&smmu->iommu, &arm_smmu_ops,
>> +				    using_legacy_binding ? NULL : dev);
>> +	if (err) {
>> +		iommu_device_sysfs_remove(&smmu->iommu);
>> +		return dev_err_probe(dev, err, "Failed to register iommu\n");
> 
> Why is dev_err_probe() better here? I've not seen it before, so I was
> trying to figure out what it does. It mainly looks to be handling
> the EPROBE_DEFER case, but after your other changes to use
> bus_find_device_by_fwnode() I'm wondering whether we actually hit that
> (particularly in iommu_device_sysfs_add())?
> 
> I'm not saying there's a problem, just that I'm not sure why
> dev_err_probe() is tidier than dev_err().

Just that it's more concise and convenient, and as such becoming an 
established pattern for returning errors from driver probe routines, 
even in cases which don't defer.

Cheers,
Robin.

