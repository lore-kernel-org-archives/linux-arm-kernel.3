Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF5ACD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOJ1V4ifTqP/cJ4OegoGALC8/FhHM+q5oHSuYMNp5js=; b=ZljCT6urb5CLT3mLw4bE8qoiwD
	khty5dTzx+1Tb9HyobP3jPVYobCoCGbE2IUVBNQa2Kg5N89ApcAbsfDafkqyQBg7IVGwy23d875wO
	LoX37E0qrAN9JosXG0VNldYWDe4gJNQhFtDwpKwDqCyaxWWrPcgWD7DUBxZMXpipmLi/W0WYLz/Vp
	OMDOe55fNXsdGzCv6z2ZooL8rjI7ceOOBu+Ew7Uq2dcndRlSkVUnddmMVw0q/5cHdw0kYPlWoqi74
	snK5x3uAcQMSPOTO5cMRNM2me8iC9nkaTqTef0YeWjBxe9MutrNLIzE2OFS5ujvF/5A13ivI7OCeG
	PAN/ziFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL00y-000000045yn-1fFe;
	Thu, 07 May 2026 14:47:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL00v-000000045y3-0ciq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:47:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D39315F;
	Thu,  7 May 2026 07:47:36 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D11C43F763;
	Thu,  7 May 2026 07:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778165262; bh=i3owsY/+oXUlrOEzPMd95B5YMU8jZAMY2STW0oTZHr8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gtVe0tCZhXfitC5cNR5oLS4Itl1ViKnX/RdnkkwvXSspbw4Qja0B4d+oICIcuzcxU
	 Y+b2xi4mr31KS2oqujVgdhS8xTYVNeb77wnBKIeWZVaf7xvwQ5+7jdPhKubUdDbrfQ
	 gMG2hfB/lwk/4gp0yzmFoNePWFxYiVqe3p9lsyz0=
Message-ID: <d071cc86-0449-430f-a572-4f43c3440748@arm.com>
Date: Thu, 7 May 2026 15:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in
 set_ttbr0_cfg
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_074745_280167_8C000C11 
X-CRM114-Status: GOOD (  24.04  )
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

On 25/03/2026 9:11 pm, Anna Maniscalco wrote:
> Previously the device was being accessed while potentially in a
> suspended state.

The SMMU driver's own write_context_bank() calls all look to be safely 
within arm_smmu_rpm_get() scopes that are holding an RPM count when 
relevant (or the one at probe time before RPM is activated at all), so 
indeed this seems like the appropriate solution for here where we're 
free to assume that Adreno platforms must always have a power domain.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

Just a minor nit: it's probably OK in this case (unless Will disagrees), 
but for future patches, it's preferable for the commit message to be 
self-contained, so as to give a sufficiently clear description of the 
problem, and summary of the solution, without having to be read in the 
context of the title and the whole diff to make sense. For example, if I 
were writing this I'd put it something like:

"
   iommu/arm-smmu-qcom: Ensure SMMU is powered up in set_ttbr0_cfg

   arm_smmu_write_context_bank() assumes it is being called with RPM
   active, but it turns out that is not guaranteed in the path from
   qcom_adreno_smmu_set_ttbr0_cfg(), so it's possible for the the
   register accesses to lead to an [external abort/hang/whatever] when
   [doing whatever it is] while the GPU is idle. Add the RPM calls here
   to make sure the SMMU is active before we touch it.
"

Thanks,
Robin.

> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Changes in v2:
> - Simplify patch by acquiring device just around the call that needs it
> - Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b7143ac053@gmail.com
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..cab7d110aaf5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>   	struct io_pgtable *pgtable = io_pgtable_ops_to_pgtable(smmu_domain->pgtbl_ops);
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>   	struct arm_smmu_cb *cb = &smmu_domain->smmu->cbs[cfg->cbndx];
> +	int ret;
>   
>   	/* The domain must have split pagetables already enabled */
>   	if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
>   		cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg->asid);
>   	}
>   
> +	ret = pm_runtime_resume_and_get(smmu_domain->smmu->dev);
> +	if (ret < 0) {
> +		dev_err(smmu_domain->smmu->dev, "failed to get runtime PM: %d\n", ret);
> +		return -ENODEV;
> +	}
> +
>   	arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>   
> +	pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
> +
>   	return 0;
>   }
>   
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
> 
> Best regards,


