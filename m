Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D97D46BEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5kIABxxpIaoUdYn8/J+1frPfNWCWM1i0JmQkE2NR0A=; b=FwXuq/AsnBNsKPpzAOk8lPbBHg
	+hCzLZe7ca8BwRn55o8wu0uZuHQ0GPIqm4t4cRKtrCIcy4mVL8LNWxIm7K2hRiyUGcRHah8iHl0mJ
	UjTfVKAGrzrzr7b53A1E67qH6rhpxCrLaPq+Fsea/8oKO2iFaeK8nRHx+93dHy7zQL5vYlY8JVyw7
	5mY4DYQYZ69cypRcC8tLaUDqBlyVt/UIUGCC0ZHBKeIwV6K1Khzd29jNKaNVMtIt5oFxKHeMhr52Z
	8n+PCYoffpR0OIuAifJWEGIZ65yy1mtLbDkxR8XMtxhzS8rx+quIOO37se5aiqkOCTR+O9P1Vs3Bf
	M44ulSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAXD-0000000GdYl-36gs;
	Wed, 28 Jan 2026 18:44:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlAXA-0000000GdYP-2k35
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:44:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C644B1516;
	Wed, 28 Jan 2026 10:44:46 -0800 (PST)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12D3B3F5CA;
	Wed, 28 Jan 2026 10:44:47 -0800 (PST)
Message-ID: <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
Date: Wed, 28 Jan 2026 18:44:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_104456_784930_F221C140 
X-CRM114-Status: GOOD (  29.25  )
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

[ +Pranjal as this might matter for v3 too... ]

On 28/01/2026 5:56 am, Prakash Gupta wrote:
> 
> On 1/27/2026 9:35 PM, Robin Murphy wrote:
>> On 2026-01-27 12:11 pm, Prakash Gupta wrote:
>>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the
>>> driver")
>>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>>> sits in a power domain, all register accesses must be done while the
>>> device is runtime-resumed to avoid unclocked register reads and
>>> potential NoC errors.
>>>
>>> So far, this has not been an issue for most SMMU clients because
>>> stall-on-fault is enabled by default. While a translation fault is
>>> being handled, the SMMU stalls further translations for that context
>>> bank, so the fault handler would not race with a powered-down
>>> SMMU.
>>>
>>> Adreno SMMU now disables stall-on-fault in the presence of fault
>>> storms to avoid saturating SMMU resources and hanging the GMU. With
>>> stall-on-fault disabled, the SMMU can generate faults while its power
>>> domain may no longer be enabled, which makes unclocked accesses to
>>> fault-status registers in the SMMU fault handlers possible.
>>
>> At face value, that sounds wrong - how does an SMMU generate a fault,
>> or indeed do anything, when it's powered off? In principle it's
>> possible that the SMMU might signal an interrupt, and is _then_
>> suspended (with the interrupt line somehow remaining asserted, so
>> probably more clock-gated than completely powered down) before the
>> interrupt hander runs, but we rather assume that we're not going to
>> have an unhandled hardware IRQ hanging around for longer than the
>> autosuspend delay.
>>
>> So, judging by the diff below, I guess what you really mean is that in
>> the case of a threaded context IRQ handler, it can take long enough
>> between handling the hardware IRQ and the thread actually running that
>> the SMMU may have suspended in between?
> 
> You are correct that the SMMU cannot generate a fault while powered
> down. A more accurate description of the race condition is as follows:
> When stall-on-fault is disabled, the faulting transaction does is
> terminated. This allows the master (the GPU) to complete its work, drop
> its power vote for the SMMU, and allow the SMMU to suspend. However, the
> SMMU fault handler may still be waiting to execute on the CPU.
> If the SMMU suspends before the handler reads the fault registers, an
> unclocked access occurs. This scenario is significantly more likely when
> using threaded IRQs due to the scheduling latency involved. I will
> update the next iteration to reflect this.
> 
>>
>>> Guard the context and global fault handlers with arm_smmu_rpm_get() /
>>> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
>>> with the SMMU powered.
>>>
>>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault
>>> after a page fault")
>>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>> ---
>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53
>>> ++++++++++++++++++++++--------
>>>    2 files changed, 43 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> index 573085349df3..2d03df72612d 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>> @@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct
>>> arm_smmu_domain *smmu_domain,
>>>        struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>        struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>        const struct of_device_id *client_match;
>>> +    const struct arm_smmu_impl *impl = qsmmu->data->impl;
>>>        int cbndx = smmu_domain->cfg.cbndx;
>>>        struct adreno_smmu_priv *priv;
>>>    @@ -350,10 +351,12 @@ static int
>>> qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>        priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>>        priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>>>        priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>> -    priv->set_stall = qcom_adreno_smmu_set_stall;
>>>        priv->set_prr_bit = NULL;
>>>        priv->set_prr_addr = NULL;
>>>    +    if (impl->context_fault_needs_threaded_irq)
>>> +        priv->set_stall = qcom_adreno_smmu_set_stall;
>>> +
>>>        if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>            !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
>>>            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index 5e690cf85ec9..183f12e45b02 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int
>>> irq, void *dev)
>>>        int idx = smmu_domain->cfg.cbndx;
>>>        int ret;
>>>    +    if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq) {
>>
>> Why is this conditional on being threaded, if the global fault handler
>> that can never be threaded at all apparently needs it unconditionally?
> Synchronous runtime PM calls can sleep, which would cause issue if
> called within a hard IRQ context. This is why I added the conditional
> check for threaded IRQs.
> Furthermore, this change only allow the driver to override the
> stall-on-fault setting when context_fault_needs_threaded_irq is true.
> Since the unclocked access issue is tied to disabling stall-on-fault,
> the fix is only logically required for the threaded IRQ path.
> For the Global Fault handler, which runs in a hard IRQ context, you are
> right—we cannot safely vote for power there. I will remove the runtime
> PM call from that section.

Hmm, but then how *do* we actually guarantee that autosuspend doesn't 
happen to kick in and power down the SMMU just as a hardirq handler 
runs, when there's some unexpected event? I fear there's a horrible can 
of worms here...

Thanks,
Robin.

