Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEB9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkBzytCk5YZvg/bmDrF9IH7a2g7JbGD+pvF2VkeRHmc=; b=g0oOnNFa4ZfWDucYsMwkjjIk4b
	vlpo1BD33XxK3hAg0O3MrlJ8uIAguroRairZ2B/2oWqbmm6dY3WcCBSAAo5rX/8x8a0lwZZSpcfCb
	wiIRTEYPWKieIZEDauJ9w75RZwOPXH51Nl29P/LtORjhpwzZ5Th81NlhiEK0fqNuJDocP5s8bcIAD
	+O7C7sXvqPqSKHCd80xBH8BHud7lmHIxZMFoN3vC/p8TcfKxUub70okunV5uEEAXdu0xeG/wY69t2
	qCUTpqoqDDfYKDwRj02vZDkPZJ7XxqVOHEEcWsDTXtmPQPAX0CWHxG1U/80vG346rW662SwWHk0AQ
	ZbOTwu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65rH-00000003ZS3-3Xym;
	Mon, 14 Sep 2026 12:32:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65rF-00000003ZRK-2QFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:32:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 856191570;
	Mon, 14 Sep 2026 05:32:18 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC8D3F86F;
	Mon, 14 Sep 2026 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789389142; bh=//mVfT+cS6bsEEtaMcIXiUoj03Wbk2JdXzrCu9QKdyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vzKnHSdKbin0VxCTUDozy936CXwnZ/R6yHiNneZhuEooJRckC2b3b/3cDvQz6g7NQ
	 EDbJ4v+G1Disjqeycfm076iot2cIQi216QhEGxfBgTwPMeZPQww1CDLP4/uTNYKQ3/
	 9uIii6KCKAS7CGPMY9JU2rgfVNqlhesVxcszDx6M=
Message-ID: <fe22fb3d-77dd-4b34-9dd8-aafe11f36988@arm.com>
Date: Mon, 14 Sep 2026 13:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: arm-smmu-qcom: Skip fault-info reads when
 suspended
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260912-priv_call_runtime_handlers-v1-1-fc0c3a17523f@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260912-priv_call_runtime_handlers-v1-1-fc0c3a17523f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_053225_703226_6B2F939B 
X-CRM114-Status: GOOD (  24.12  )
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

On 11/09/2026 11:25 pm, Bibek Kumar Patro wrote:
> qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
> holding a runtime PM reference. A fault is raised while the SMMU is
> active, but the GPU may drop its power vote before the threaded fault
> handler reaches the callback, allowing the SMMU to runtime suspend.
> 
> Accessing the SMMU registers after suspend has started is unsafe and
> may cause subsequent register accesses during runtime resume to fail
> with a NoC error and an asynchronous SError.

But hang on, if I'm following the code correctly, the callchain would be:

arm_smmu_context_fault
   report_iommu_fault
     msm_gpu_fault_handler
      qcom_adreno_smmu_get_fault_info

and from here we still need to return to arm_smmu_context_fault() to 
clear the FSR, so surely that still has the same problem in itself?

Thanks,
Robin.

> Use pm_runtime_get_if_active() to keep the SMMU active while collecting
> the fault information, and skip the register reads if suspend has
> already started.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
> qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
> holding a runtime PM reference. A fault is raised while the SMMU is
> active, but the GPU may drop its power vote before the threaded fault
> handler reaches the callback, allowing the SMMU to runtime suspend.
> 
> The failure sequence:
> 
>    GPU context fault
>            |
>            v
>    qcom_adreno_smmu_get_fault_info()
>            |
>            | GPU drops its power vote
>            | SMMU starts runtime suspend
>            v
>    SMMU register access without an active RPM reference
>            |
>            v
>    later Adreno PRR private-interface operation
>            |
>            v
>    pm_runtime_resume_and_get()
>            |
>            v
>    arm_smmu_runtime_resume()
>            |
>            v
>    arm_smmu_device_reset()
>            |
>            v
>    SMMU register access
>            |
>            v
>    NoC error / asynchronous SError
> 
> Use pm_runtime_get_if_active() to keep the SMMU active while collecting
> the fault information. If suspend has already started, skip the register
> reads instead of accessing the SMMU while it is being powered down.
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 795e8ec7e8fa..b1787a4ba0d3 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -129,6 +129,18 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>   
> +	/*
> +	 * A fault can only fire while the SMMU is active (GPU is issuing
> +	 * transactions). Use get_if_active so that if by a rare race the
> +	 * device has already suspended, we skip the register reads rather
> +	 * than triggering a cold resume which would call device_reset and
> +	 * destroy the fault state we are trying to capture.
> +	 */
> +	if (pm_runtime_get_if_active(smmu->dev) <= 0) {
> +		dev_warn(smmu->dev, "get_fault_info: device not active, skipping\n");
> +		return;
> +	}
> +
>   	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
>   	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
>   	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
> @@ -136,6 +148,8 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>   	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
>   	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
>   	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
> +
> +	pm_runtime_put_autosuspend(smmu->dev);
>   }
>   
>   static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> 
> ---
> base-commit: f61bb3920fa8cb44b84d32e0fa9fbaab4eb00c80
> change-id: 20260912-priv_call_runtime_handlers-7f3547544040
> 
> Best regards,
> --
> Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 


