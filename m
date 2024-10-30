Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A785D5CCB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouWtXqn/qdOIUeN46vnAvJwUGbMwbnmnh/Vfg61kGE4=; b=IInsjKOQOThdqBkcRXdMcki1uX
	LVce5d8ukzRuRdshPlKepq9MxCQJVThLbQPFx8dGjtQBQAUegMuWQ6WfZt06Nr5dd4ox8Nclb1I6L
	31YCv5WiNny3IF4xDTpfvtHNuxzW8LX4xrOdlv1Rq+QTwy/jQklW1PQDEyvylHhJfbnIhtQQFE3mH
	exFWsG7zuGqnCitIDMfOxNRBjvMJ7pwsHYFBiLuCwbRQLcWZODGwNxsUZverGlsatn8rfAoL1BATc
	xnE9X6sRNojXhCLLj1v1LayHJVoY2SXdWy6EN8Pwx9l+0uCUS2JMPBNaQE83IwrY91Gg6KrOwkHHS
	1n7rTqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AZV-00000000rxM-0mU5;
	Wed, 30 Oct 2024 15:25:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6AXn-00000000rWg-3k3S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 15:23:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63E83113E;
	Wed, 30 Oct 2024 08:24:01 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B80763F66E;
	Wed, 30 Oct 2024 08:23:29 -0700 (PDT)
Message-ID: <65132b36-49f6-4b08-8e7d-6d6cb8da5960@arm.com>
Date: Wed, 30 Oct 2024 15:23:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 3/5] iommu/arm-smmu: add support for PRR bit setup
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, robdclark@gmail.com,
 will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com,
 robh@kernel.org, krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
 <20241008125410.3422512-4-quic_bibekkum@quicinc.com>
 <2d651f1b-4f51-4984-903f-7f5a14151f84@arm.com>
 <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <531d0144-e027-4589-b4ef-79f02583df8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_082336_094827_2A1638B7 
X-CRM114-Status: GOOD (  21.83  )
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

On 30/10/2024 1:14 pm, Bibek Kumar Patro wrote:
> 
> 
> On 10/29/2024 6:59 PM, Robin Murphy wrote:
>> On 2024-10-08 1:54 pm, Bibek Kumar Patro wrote:
>>> Add an adreno-smmu-priv interface for drm/msm to call
>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>> sequence as per request.
>>>
>>> This will be used by GPU to setup the PRR bit and related
>>> configuration registers through adreno-smmu private
>>> interface instead of directly poking the smmu hardware.
>>>
>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>> ---
>>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>   drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>   include/linux/adreno-smmu-priv.h           | 10 +++++-
>>>   3 files changed, 48 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/ 
>>> iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index 6e0a2a43e45a..38ac9cab763b 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -25,6 +25,7 @@
>>>
>>>   #define CPRE            (1 << 1)
>>>   #define CMTLB            (1 << 0)
>>> +#define GFX_ACTLR_PRR        (1 << 5)
>>>
>>>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>   {
>>> @@ -109,6 +110,40 @@ static void 
>>> qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>   }
>>>
>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>> +{
>>> +    struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>> +    struct arm_smmu_device *smmu = smmu_domain->smmu;
>>> +    const struct device_node *np = smmu->dev->of_node;
>>> +    struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>> +    u32 reg = 0;
>>> +
>>> +    if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>> +            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>
>> These conditions aren't going to change between calls - wouldn't it 
>> make more sense to conditionally assign the callbacks in the first 
>> place? Not the biggest deal if this is a one-off context-setup type 
>> thing, just that it looks a little funky.
>>
> 
> Let me know if you want to pursue this still.
>  From the current PRR implementation in the graphics
> vendor layer, this seems to be just setup kind-of thing.
> Also if we keep this conditional check before assigning callbacks,
> and vendor layer caller won't be having any such check,
> wouldn't it be an issue in unsupported platforms (!qcom,smmu-500 or 
> !qcom,adreno-smmu)
> as the callbacks won't be assigned?
> So as per my understanding I think it would be safe to keep the 
> condition check here?

Like I say, it makes more sense to me personally if SMMUs which don't 
have a PRR don't offer a callback for setting the PRR which they don't 
have, and for it to be the caller's responsibility not to call a NULL 
callback where they wouldn't need to call one anyway. But the 
adreno_priv interface is kind of Rob's thing, so I'll leave it to his 
preference.

Thanks,
Robin.

