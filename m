Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5F7C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke6DjCyaP7vOxWtOciiiccwnDSX9qVcT4xq6J7xFe0g=; b=nya5ZtVUzInJ3MWvK9CHQFOAkx
	Q6k2YeAqARRKhCa4/JcSbvS+bRMG0DkCPac9hT/1jeQGIlpAkqyE71gPsePqHexLLvnkR2MBvH237
	o6elYe5D/H42iQx9y/USE+rDoVLsmpaoDVFuA0oEgGd9rAUtf/0/e05kmCAYvRQaAxGk0A8VYrGBH
	wlDCd4p0/s3dnc+1a4ddm27xoDXZPHuJg6JPYtd2QI8PoGsEbyoBYScnkUzAEnctEzscaUbq43GJc
	dKavu1i2N48MTb6LuCK/Cge9B62fO55CvcaWkd/k27U43hYWDzD2Db2GweghBoh6xBKjvVRq+Zpy/
	VyV807kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvagq-0000000EgFi-0hFs;
	Fri, 21 Mar 2025 11:37:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaez-0000000Eg1x-2eQl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:35:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2800D106F;
	Fri, 21 Mar 2025 04:35:40 -0700 (PDT)
Received: from [10.57.40.79] (unknown [10.57.40.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CF453F673;
	Fri, 21 Mar 2025 04:35:31 -0700 (PDT)
Message-ID: <fe800f66-ed99-49ed-8010-67702ab4542d@arm.com>
Date: Fri, 21 Mar 2025 11:35:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Split out and tidy up Arm Kconfig
To: Pranjal Shrivastava <praan@google.com>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <a614ec86ba78c09cd16e348f633f6bb38793391f.1742480488.git.robin.murphy@arm.com>
 <Z90St0D6hyphtOID@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z90St0D6hyphtOID@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_043533_723171_0DC2291C 
X-CRM114-Status: GOOD (  22.29  )
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

On 2025-03-21 7:18 am, Pranjal Shrivastava wrote:
> On Thu, Mar 20, 2025 at 02:21:28PM +0000, Robin Murphy wrote:
>> There are quite a lot of options for the Arm drivers, still all buried
>> in the top-level Kconfig. For ease of use and consistency with all the
>> other subdirectories, break these out into drivers/arm. For similar
>> clarity and self-consistency, also tweak the ARM_SMMU sub-options to use
>> "if" instead of "depends", to match ARM_SMMU_V3. Lastly also clean up
>> the slightly messy description of ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT as
>> highlighted by Geert - by now we really shouldn't need commentary on
>> v4.x kernel behaviour anyway - and downgrade it to EXPERT as the first
>> step in the 6-year-old threat to remove it entirely.
>>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/Kconfig     | 157 +-------------------------------------
>>   drivers/iommu/arm/Kconfig | 144 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 145 insertions(+), 156 deletions(-)
>>   create mode 100644 drivers/iommu/arm/Kconfig
>>
> 
> Thanks for this! It looks good.
> I was able to toggle configs and build for arm64.
> 
>> +
>> +config QCOM_IOMMUa
> Nit: I don't have much context but:
> 
> 1. Shall this be in .../arm/Kconfig?

Yes, it represents arm/arm-smmu/qcom-iommu.c

> Is this an custom
> implementation of some arm-smmu version? If yes, then maybe we can
> update the help string while at it?

It's based on driving preconfigured SMMU S1 contexts individually, but 
with Qualcomm-specific bindings and usage flavour, hence why it lives 
next to arm-smmu to share code, but remains its own distinct thing.

>> +	# Note: iommu drivers cannot (yet?) be built as modules
> 
> 2. I don't think this is true now? Shall we remove this comment?

Indeed it's out of date now, but I see that in itself still serving some 
purpose as an indicator that nobody's yet looked to see if this driver 
*could* be made modular, so I chose to leave it as-is.

>> +	bool "Qualcomm IOMMU Support"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on !GENERIC_ATOMIC64	# for IOMMU_IO_PGTABLE_LPAE
>> +	select QCOM_SCM
>> +	select IOMMU_API
>> +	select IOMMU_IO_PGTABLE_LPAE
>> +	select ARM_DMA_USE_IOMMU
>> +	help
>> +	  Support for IOMMU on certain Qualcomm SoCs.
>>
> 
> With the above nits:
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks!

Robin.

