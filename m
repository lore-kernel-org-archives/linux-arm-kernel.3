Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5037DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dUDLiien/zpwIROubssZuGWeEVVoYJJ5rQHBIGtt0Y=; b=dFBcbe/5E9pHdnRAW58owOIhba
	9s45ay5B1r+nd0+EHkIj1ZFP1i4O554CR35H4JaEhYehuOSrlW+djFS2hJde84DDVTRp2axU/kHg8
	lncAjEETUlFpqQjZV4M4ArOGxbOpc1clLR8tIp/3PH2wLyOb7N9PiwKS/eOi/O4NB4Ijvmnh3nBT4
	qtrIGazojTf66UzFoa5eATYq43FeqacJOtuW0VxDoujAuZGaheLoVaSC2Kv71+xGsOUX+VmHgaMDA
	b80i6vmgSsXRPwMykbApJ5SO97/XWC2q3di7q5i44wR4pgWAWNCcblqVTo+97/1uELk2+p1m3arMy
	BIa5hyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavm3-0000000COZU-0II5;
	Thu, 23 Jan 2025 11:53:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavkC-0000000COJV-0nWV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:51:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5C31063;
	Thu, 23 Jan 2025 03:51:59 -0800 (PST)
Received: from [10.57.6.148] (unknown [10.57.6.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFE1D3F5A1;
	Thu, 23 Jan 2025 03:51:28 -0800 (PST)
Message-ID: <b593ac5e-cb29-473a-af1b-214168968679@arm.com>
Date: Thu, 23 Jan 2025 11:51:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with
 stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_035132_317176_27B5382E 
X-CRM114-Status: GOOD (  24.31  )
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

On 2025-01-23 11:10 am, Prakash Gupta wrote:
> On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
>   
>> @@ -125,12 +125,25 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>   	struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>   	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>   	struct arm_smmu_device *smmu = smmu_domain->smmu;
>> -	u32 reg = 0;
>> +	u32 reg = 0, sctlr;
>> +	unsigned long flags;
>>   
>>   	if (terminate)
>>   		reg |= ARM_SMMU_RESUME_TERMINATE;
>>   
>> +	spin_lock_irqsave(&smmu_domain->cb_lock, flags);
>> +
>>   	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>> +
> At this point further transaction can be processed but SCTLR.CFIE is
> cleared so subequent context fault will not generate interrupt till
> SCTLR.CFIE is set.
> 
>> +	/*
>> +	 * Re-enable interrupts after they were disabled by
>> +	 * arm_smmu_context_fault().
>> +	 */
>> +	sctlr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR);
>> +	sctlr |= ARM_SMMU_SCTLR_CFIE;
>> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_SCTLR, sctlr);
>> +
>> +	spin_unlock_irqrestore(&smmu_domain->cb_lock, flags);
>>   }
>>   
>>   static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 79afc92e1d8b984dd35c469a3f283ad0c78f3d26..ca1ff59015a63912f0f9c5256452b2b2efa928f1 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -463,13 +463,52 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
>>   	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>>   		return IRQ_NONE;
>>   
>> +	/*
>> +	 * On some implementations FSR.SS asserts a context fault
>> +	 * interrupt. We do not want this behavior, because resolving the
>> +	 * original context fault typically requires operations that cannot be
>> +	 * performed in IRQ context but leaving the stall unacknowledged will
>> +	 * immediately lead to another spurious interrupt as FSR.SS is still
>> +	 * set. Work around this by disabling interrupts for this context bank.
>> +	 * It's expected that interrupts are re-enabled after resuming the
>> +	 * translation.
>> +	 *
>> +	 * We have to do this before report_iommu_fault() so that we don't
>> +	 * leave interrupts disabled in case the downstream user decides the
>> +	 * fault can be resolved inside its fault handler.
>> +	 *
>> +	 * There is a possible race if there are multiple context banks sharing
>> +	 * the same interrupt and both signal an interrupt in between writing
>> +	 * RESUME and SCTLR. We could disable interrupts here before we
>> +	 * re-enable them in the resume handler, leaving interrupts enabled.
>> +	 * Lock the write to serialize it with the resume handler.
>> +	 */
>> +	if (cfi.fsr & ARM_SMMU_CB_FSR_SS) {
>> +		u32 val;
>> +
>> +		spin_lock(&smmu_domain->cb_lock);
>> +		val = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_SCTLR);
>> +		val &= ~ARM_SMMU_SCTLR_CFIE;
>> +		arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, val);
>> +		spin_unlock(&smmu_domain->cb_lock);
>> +	}
>> +
>> +	/*
>> +	 * The SMMUv2 architecture specification says that if stall-on-fault is
>> +	 * enabled the correct sequence is to write to SMMU_CBn_FSR to clear
>> +	 * the fault and then write to SMMU_CBn_RESUME. Clear the interrupt
>> +	 * first before running the user's fault handler to make sure we follow
>> +	 * this sequence. It should be ok if there is another fault in the
>> +	 * meantime because we have already read the fault info.
>> +	 */
> The context would remain stalled till we write to CBn_RESUME. Which is done
> in qcom_adreno_smmu_resume_translation(). For a stalled context further
> transactions are not processed and we shouldn't see further faults and
> or fault inerrupts. Do you observe faults with stalled context?

This aspect isn't exclusive to stalled contexts though - even for 
"normal" terminated faults, clearing the FSR as soon as we've sampled 
all the associated fault registers is no bad thing, since if a second 
fault does occur while we're still reporting the first, we're then more 
likely to get a full syndrome rather than just the FSR.MULTI bit.

>> +	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
>> +
>>   	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>>   		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
>>   
>>   	if (ret == -ENOSYS && __ratelimit(&rs))
>>   		arm_smmu_print_context_fault_info(smmu, idx, &cfi);
>>   
>> -	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_FSR, cfi.fsr);
>>   	return IRQ_HANDLED;
>>   }
>>   
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> index 2dbf3243b5ad2db01e17fb26c26c838942a491be..789c64ff3eb9944c8af37426e005241a8288da20 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>> @@ -216,7 +216,6 @@ enum arm_smmu_cbar_type {
>>   					 ARM_SMMU_CB_FSR_TLBLKF)
>>   
>>   #define ARM_SMMU_CB_FSR_FAULT		(ARM_SMMU_CB_FSR_MULTI |	\
>> -					 ARM_SMMU_CB_FSR_SS |		\
> Given writing to FSR.SS doesn't clear this bit but write to CBn_RESUME
> does, this seems right. This but can be taken as separate patch.

This change on its own isn't really useful - all that would achieve is 
that instead of constantly re-reporting the FSR.SS "fault", the 
interrupt goes unhandled and the IRQ core ends up disabling it 
permanently. If anything that's arguably worse, since the storm of 
context fault reports does at least give a fairly clear indication of 
what's gone wrong, rather than having to deduce the cause of an "irq n: 
nobody cared" message entirely by code inspection.

Thanks,
Robin.

> 
>>   					 ARM_SMMU_CB_FSR_UUT |		\
>>   					 ARM_SMMU_CB_FSR_EF |		\
>>   					 ARM_SMMU_CB_FSR_PF |		\
>>
>> -- 
>> 2.47.1
>>


