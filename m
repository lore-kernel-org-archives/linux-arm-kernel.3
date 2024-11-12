Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3189ED42BAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE3zwUm14OQNRprPuzd6uIlHjRxCh/7wkZ+N1EoE6s0=; b=n1DzEtMhH99r5uI+7K+YmEi4NL
	9WM0C0N0cEF5Q16aNVicX7W6T/k1nemhwBXQzqZc2cIYxBSFP3DT1BOxa0/a1rzunm1WfVAIRyCYp
	wa4AE8HanSSdx49wOtKhz1z+Rmh5Lo8kXsAk2oYn/pHoFH7XXp/mzpCVUQbgZeZYAxrk4YtLy89I/
	vvSiL2PTPSy4OcgRRNjIxJHn/YUZoNoAhpYix8yj9Pd0SI/ssjzjub0Fxhv0FmcaTunjJMhR7ne2p
	SE+AxGLwnxeMworGb85k5w4rqozz3mgF8jvp5J0ZyOPsYpOZUQGric7zsy9L459ipHcB24mzHaYGh
	SOrB1Eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAu2f-00000004CeJ-42Mw;
	Tue, 12 Nov 2024 16:47:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAthY-0000000489e-41Mv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:25:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24A3E1516;
	Tue, 12 Nov 2024 08:25:41 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AE513F6A8;
	Tue, 12 Nov 2024 08:25:10 -0800 (PST)
Message-ID: <cf5745db-6523-49ea-b21e-7cf51ff47a67@arm.com>
Date: Tue, 12 Nov 2024 16:25:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.5/3] iommu/arm-smmu-v3: Undo SMMU enable on probe
 failure
To: Will Deacon <will@kernel.org>
Cc: joro@8bytes.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <cover.1731088789.git.robin.murphy@arm.com>
 <0812e9f61234cbcdc5cab7de307e1c9a8e3c9498.1731422868.git.robin.murphy@arm.com>
 <20241112155750.GC21479@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241112155750.GC21479@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_082513_132710_D28A661D 
X-CRM114-Status: GOOD (  12.72  )
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

On 12/11/2024 3:57 pm, Will Deacon wrote:
> On Tue, Nov 12, 2024 at 02:49:59PM +0000, Robin Murphy wrote:
>> If SMMU probe fails afer arm_smmu_device_reset(), we leave the SMMU
>> enabled with an empty Stream Table, silently blocking all DMA. This
>> proves rather annoying for debugging said probe failure, so let's handle
>> it a bit better by putting the SMMU back into (more or less) the same
>> state as if it hadn't probed at all.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> index 7908fca962fe..566d66e9c91e 100644
>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
>> @@ -4640,6 +4640,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	iommu_device_sysfs_remove(&smmu->iommu);
>>   free_iopf:
>>   	iopf_queue_free(smmu->evtq.iopf);
>> +	arm_smmu_device_disable(smmu);
>>   	return ret;
>>   }
> 
> Heh, this is starting to look an awful lot like arm_smmu_device_remove()...

Indeed, functionally that's rather the point; implementation-wise, you 
know I'd branch straight into the middle of a different function if the 
language let me :)

Robin.

