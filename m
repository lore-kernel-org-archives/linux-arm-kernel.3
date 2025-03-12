Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF0FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+7y7J2QIq55q+y54akk7EgQKA9+hyCBnvOy0j+aR/M=; b=Pj5TlmrR6HsrhvMhy764iavAum
	MK00r0DJ42CLqFm3Z88g7PCAV8IePlUsUR0d71R4ZEceBrkGQTyGn1+CLrlD2yavL8E9+GyoQt0eu
	TJt4vLjT0ZrTwwEkYniGnhf5yloyHqFuJHMYZeVKJKG+veOSbJ21BSbXlRN/KiLd7IWnCti+/In9v
	FvrFZH1x1qYxTEk4i8XrcOLCwZFK+ODzxZppHPT5dvyMSaClEnJe9gMW5PN4ycr/DxbMDdtoHIC54
	/fP2QULkKHQEVp/gu2JcW8SUresSTsH/yADLcVsh+U+BfY8iD9n2vHv4Yk8OfYtFj+9i59hiftNgT
	/NFPLM1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQSS-00000009DX5-0Td6;
	Wed, 12 Mar 2025 18:05:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQOY-00000009Cum-1QoG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 18:01:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C93D41515;
	Wed, 12 Mar 2025 11:01:39 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FE553F5A1;
	Wed, 12 Mar 2025 11:01:27 -0700 (PDT)
Message-ID: <2d47815d-6bee-4d1f-8b60-854763794bf6@arm.com>
Date: Wed, 12 Mar 2025 18:01:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] iommu/arm-smmu: Save additional information on
 context fault
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org
References: <20250304-msm-gpu-fault-fixes-next-v4-0-be14be37f4c3@gmail.com>
 <20250304-msm-gpu-fault-fixes-next-v4-1-be14be37f4c3@gmail.com>
 <20250311180553.GB5216@willie-the-truck>
 <CACu1E7GzCiO2b7AFJSDC+pN2VD9VaD2aYz_GGymM3-xAUqd__A@mail.gmail.com>
 <20250312130525.GC6181@willie-the-truck>
 <CAF6AEGvqYithLFAKpfdkw35DEsUZ8rBt25-oWz3r=kaLt+RbQw@mail.gmail.com>
 <20250312164735.GA6561@willie-the-truck>
 <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAF6AEGskyoemQDrTXh=ewf61e-hVzWMjmqe=nX2J-65W5-M6Zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_110130_471757_87AD8BA5 
X-CRM114-Status: GOOD (  21.87  )
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

On 12/03/2025 5:23 pm, Rob Clark wrote:
> On Wed, Mar 12, 2025 at 9:47 AM Will Deacon <will@kernel.org> wrote:
>>
>> On Wed, Mar 12, 2025 at 07:59:52AM -0700, Rob Clark wrote:
>>> On Wed, Mar 12, 2025 at 6:05 AM Will Deacon <will@kernel.org> wrote:
>>>> On Tue, Mar 11, 2025 at 06:36:38PM -0400, Connor Abbott wrote:
>>>>> On Tue, Mar 11, 2025 at 2:06 PM Will Deacon <will@kernel.org> wrote:
>>>>>> On Tue, Mar 04, 2025 at 11:56:47AM -0500, Connor Abbott wrote:
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> index ade4684c14c9b2724a71e2457288dbfaf7562c83..a9213e0f1579d1e3be0bfba75eea1d5de23117de 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>> @@ -409,9 +409,12 @@ void arm_smmu_read_context_fault_info(struct arm_smmu_device *smmu, int idx,
>>>>>>>                                      struct arm_smmu_context_fault_info *cfi)
>>>>>>>   {
>>>>>>>        cfi->iova = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_FAR);
>>>>>>> +     cfi->ttbr0 = arm_smmu_cb_readq(smmu, idx, ARM_SMMU_CB_TTBR0);
>>>>>>>        cfi->fsr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSR);
>>>>>>> -     cfi->fsynr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
>>>>>>> +     cfi->fsynr0 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR0);
>>>>>>> +     cfi->fsynr1 = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_FSYNR1);
>>>>>>
>>>>>> We already have an implementation hook (->get_fault_info()) which the
>>>>>> qcom SMMU driver can override with qcom_adreno_smmu_get_fault_info().
>>>>>> That thing dumps these registers already so if we're moving that into
>>>>>> the core SMMU driver, let's get rid of the hook and move everybody over
>>>>>> rather than having it done in both places.
>>>>>
>>>>> As you probably saw, the next commit moves over
>>>>> qcom_adreno_smmu_get_fault_info() to use this. The current back door
>>>>> used by drm/msm to access these functions is specific to adreno_smmu
>>>>> and there isn't an equivalent interface to allow it to call a generic
>>>>> SMMU function so it isn't possible to move it entirely to the core. At
>>>>> least not without a bigger refactoring that isn't justified for this
>>>>> series that is just trying to fix things.
>>>>
>>>> Ok :(
>>>>
>>>>>>>        cfi->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(idx));
>>>>>>> +     cfi->contextidr = arm_smmu_cb_read(smmu, idx, ARM_SMMU_CB_CONTEXTIDR);
>>>>>>
>>>>>> I think the CONTEXTIDR register is stage-1 only, so we shouldn't dump
>>>>>> it for stage-2 domains.
>>>>>>
>>>>> Does it matter if we read the register though, as long as users are
>>>>> aware of this and don't use its value for anything?
>>>>
>>>> I think the contents are "UNKNOWN", so it could be hugely confusing even
>>>> if they just got logged someplace. Why is it difficult to avoid touching
>>>> it for stage-2?
>>>>
>>> Fwiw, we are only ever using stage-1
>>
>> Sure, but this is in arm-smmu.c which is used by other people and supports
>> both stages.
> 
> Sure, but no one else is using this field in the fault-info.  So maybe
> the addition of a comment in the struct would be enough if it isn't
> going to cause an SError/etc to read it for S2 cb?

Any worthwhile comment isn't going to be significantly shorter or 
clearer than 1 extra line of "if (smmu_domain->stage == 
ARM_SMMU_DOMAIN_S1)"...

TBH it's the Qualcomm register-middle-man firmware I'd be more worried 
about than real hardware, given how touchy it can be even with register 
accesses which *should* be well defined. But then I guess it also has 
the habit of killing the system if anything other than the GPU dares 
cause a fault in the first place, so maybe it OK?

If anyone still uses Arm Fast Models SMMUv1/2 components it'll probably 
squawk an annoying warning there too - ISTR I had at least one patch 
motivated by that in the past.

Thanks,
Robin.

