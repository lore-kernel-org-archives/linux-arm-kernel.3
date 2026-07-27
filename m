Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04740C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gn0Vn9z/RrzBL1Vp4ooUdad4+XvB5QureDLm9Fs9FIk=; b=Ik+A7NeS6t4aiJLvL4aVfPD5Vr
	Iyht0ZZCW0ZITatb2xtHZcQ6BApG/tMz+6l7MlubnK42d18Tu2jbuoK1GR3z0tDhTn7uRmtwoPd1T
	W6w1E6jQwrYAXS+zD0WIp1aLC9KPxiPjeqVeDOUhNbAMw7ENLtrEBgagF3dC6yRilvK4htWCn8neX
	lQW20O2Hvy/yHSo/DsyNdOiHxnPToPZlT+DOyq1cz7XpiRB1MQPzvfpkahVnkgd56x0uVvQJFWI2n
	hL4Xlq0mrn7KtxSEeBZGtfH3TXJtQ3k1hGftXnbcWOCI/02BLEYNhaYS5j+EYslgrUZsjBbP3Gyve
	orO73HmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIYv-00000002Ujr-0gBm;
	Mon, 27 Jul 2026 10:27:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIYs-00000002Uil-2DOs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:27:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6645143D;
	Mon, 27 Jul 2026 03:27:45 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC6B53FA21;
	Mon, 27 Jul 2026 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785148070; bh=q0EI4rNp2Py4ipVMPcubth22UfENKlUF51C+O+Q0xL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rQreKK17p11RuffLSZL52pe4G7oyjENlF76bAH8Tc0miNBvJGEdSJrVFAZ2U69EzS
	 YFJhBYHt4KuU4N6RuXOVNOGOMUBT+gBi2uH6OWdLEzrjSQadWgTd6NRuxZsl5lTdbY
	 pMpI/WRQiaPODBFdKuph2q5yqgUrw17w3Trm+aIs=
Message-ID: <0a10a19d-690c-42ee-aedc-83906b9fd9e0@arm.com>
Date: Mon, 27 Jul 2026 11:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
To: Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Cc: catalin.marinas@arm.com, joro@8bytes.org, jpb@kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <cover.1784814923.git.robin.murphy@arm.com>
 <57ae366ec501a142bd20f2cc7d18b3eca8eeac25.1784814923.git.robin.murphy@arm.com>
 <amTH7xHBY2ol4LHw@nvidia.com> <amX25rcF-ETdnUPj@willie-the-truck>
 <amYxa51b2j/Cdw/6@nvidia.com> <amcTBlw16RKuZC8y@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <amcTBlw16RKuZC8y@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_032754_693321_337398BE 
X-CRM114-Status: GOOD (  17.02  )
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

On 27/07/2026 9:12 am, Will Deacon wrote:
> On Sun, Jul 26, 2026 at 01:10:19PM -0300, Jason Gunthorpe wrote:
>> On Sun, Jul 26, 2026 at 01:00:38PM +0100, Will Deacon wrote:
>>> On Sat, Jul 25, 2026 at 11:27:59AM -0300, Jason Gunthorpe wrote:
>>>> On Thu, Jul 23, 2026 at 03:19:44PM +0100, Robin Murphy wrote:
>>>>> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
>>>>> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
>>>>> @@ -102,6 +102,8 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
>>>>>   			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
>>>>>   		if (master->smmu->features & ARM_SMMU_FEAT_HD)
>>>>>   			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);
>>>>> +		if (master->smmu->features & ARM_SMMU_FEAT_HAFT && system_supports_haft())
>>>>> +			target->data[1] |= cpu_to_le64(CTXDESC_CD_1_HAFT);
>>>>>   	} else {
>>>>>   		target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_EPD0);
>>>>
>>>> Based on the Sashiko remark and your note you should lift all the
>>>> HA/HD/HAFT bits outside this if (mm) block.
>>>>
>>>> AFAICT it is fine for HA/HD/HAFT to be set with EPD0, the HW won't
>>>> process any PTEs so they won't have any effect.
>>>
>>> I'm not sure about that. The spec says this about CD.HAFT:
>>
>> Sorry I see this was unclear
>>
>> I ment to move all *three* bits outside the if.
>>
>> There is no reason for EPD0 to also require setting any of those three
>> bits to zero, AFAICT.
> 
> Ah, gotcha! And even if we did want to get to that configuration, I
> guess you could set EPD0, then clear HAFT, then clear HA+HD?

Indeed, it also occurred to me on the way home on Friday that in this 
case we probably could get away with just setting HA/HD/HAFT 
consistently in all SVA CDs irrespective of the mm. Strictly, EPD0 only 
forbids *new* walks from using TTB0, so there might potentially be some 
outstanding PTE updates still made in the window between the config 
update and the TLBI at the end of arm_smmu_mm_release(), but that 
shouldn't be harmful.

Lemme spin a v3...

Cheers,
Robin.


