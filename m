Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87804D6B084
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyivSQaAeplL2DqeJlvEVUsgok3cOG00ws0Eaoas/Os=; b=mYvmnNko4Djvlwbr9/FF46pf1g
	/lyTe77psEQCwMdOxKQOqwywKiNVg7tjcFarFQED62GEdXsJnP7mxRk8/boEfDfIFmwrxRZXk/o5Q
	J++WygvD/f7HDxVzUb7+5PGyeP1Qv/j8moinlGdq8wX123esYmdRyj18SBWUi6hXHNUIigKmtCghL
	b012NgDFy+sk0AJ1nHFizd4LbSLk3k8k7KKCioXrQaniXJtXkNUXRMDHVYIUsvGuLn29XCVX9KmXW
	8Hhe+XPLbjJ46LfzubjNZwJEGJZdFAA9uLIBmGrA1daGA8bVyCoY8ZVaWj5kMmaCWtn9iWgDPHl9c
	yoil7vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUUP-00000000JVL-0pNc;
	Thu, 29 Jan 2026 16:03:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUUM-00000000JUu-17zj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:03:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TAQwGs2501987
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 16:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyivSQaAeplL2DqeJlvEVUsgok3cOG00ws0Eaoas/Os=; b=P2F18T/YqLHFu8Zm
	1LDSblnkEZKcsAsv7CmJi6TkTm9fFt4YUo2Hm3L7ng69RmzkvQ+mVdkk1aaO32DT
	pLLueXKsW/S90xgSV9xC0M6OYXzF0rNViwKsT0vKGcGe/ssq9v67e3/f+cHcp3r6
	xcoIcLyf/mvdCNV4x7xjM44dInP4e8pq6QLsv488cZtKg89a1bubnUuSXXQ/rzBF
	QxruK7IAwpaNYIgObg2jjlUMnTLe2ERDBOT94v13y97o6AAhsRGi6Qda8pz0nb0P
	GfKR55zny2Szd5AjwJm8CMxBtkvnxvTnKRxW6Hn2JG6wtWI7JnCN2bBVwxYc5CZK
	+gNfAQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c05tbs2ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 16:03:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8227fdbc51cso673971b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 08:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769702600; x=1770307400; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyivSQaAeplL2DqeJlvEVUsgok3cOG00ws0Eaoas/Os=;
        b=NFfjxiBB/uoBBOh7Q8wPVbQl6Z/+3W/NGSkmcxiUa3GoZ6/Br0lrC36zPyALomCPNq
         FUlMF1m02H2DdP6B9tucYgLOHxmKTmqmNhJi5mAl+7+EdKCJORk2enJTYb3C63vv7y73
         RHeH+PQM4oqFsLRFChUlBOx9ayx7KxG4ZUpn4UnEYb2FF6eTl8DuY3uWiZDtmjQ/fm1W
         7tHH4dzEgByHSwIj2BeJO/cEI6Bp1mDUvBGHJiQsEwT//OtqGaWFa83hZPMM/uTA/C5n
         QOrGvlKu6TeMMP50rqXMlpcZNgeq0xsz+qLHL8hBGEsfoPV8yb4kReW3Ya6vQDssvsfX
         RnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702600; x=1770307400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IyivSQaAeplL2DqeJlvEVUsgok3cOG00ws0Eaoas/Os=;
        b=qakbwMnVwL3TugdDEHP4ob8WNoiKbdCKAnOmZOXYAXsar9c8687An0tPOUkJBKKaXG
         i+7vWtlrYxlsKRECKmqPXGd67iJcnhnXFtAjKsMNQpvGCtoX9lt4ErPCifBgZR3F1r1U
         1Q6znswl491m0g6L8AgrR5OHodGgnCygBsaCs4eTkviVyYcR0c9QEUhqy6lK+79SXFXM
         PFZVEZBp83z/iNxh3pGy24kAHggXHoDquesPWngerqPQehrlIwrYjQ2gqXmoahD/EQSs
         sFPJgCt+3ztjFqBsjpi4F+OWNlh/SjLU0WllDGnJ5m3gB2OMB6giZ4JadDiccJ4e36Uy
         T+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXeXDkMcSJSS8MC1kRuosUHTtmhSPO4sS4Q+iYazwBEmTjPbC1ESHk+ZdGkWrRQDw8XqcpPjiEgL6zqBArBBy7m@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf+I98Koi8+qMZXZpFu+rl2iAoM/FWJiPjbOniYjTSSLWNRDel
	Gx/4ZDIlG0EFsgcSwHnCPjWiYIw0kuh3RU9KInVKf4+L5TZAv62eJvTz2weLlB82EK+gwXtWxRX
	aw8HC86Q6aV07Q1YqFf27dIVrWJ7C3IeW1du9GNaeBgpbvqfZE/0fwsBj0ZzlYjyXql8vTIBfna
	Cs7g==
X-Gm-Gg: AZuq6aIGJCjlZhe7U/v01OSukWnkjw0UXO+fwCqc3y9dJfP5tCdq/y5vY06S7f2dmKm
	aEa2napqL2p8/r8hCbpYS8DRDDuGTS+3niacEszsGG23YoJA9mqdUQK3iLMIIncssEleyu1RMtY
	/gh73BRMyz2+TW58l20Q1QSggZaj70nbLYsyvQ0jhGcepbcg6N/hgCQzsCYSJtwlrsAEezirhmT
	AYbjIN7Ab0CHtM832I+R0Vqi818tDG9KaioZFsq5uehzMPfhZ9kf32ImUJfegPrLyTmb7TOMfZ6
	hW54sCfC9dbe1boju9Ku7yA606uJNKD13MrcV7/qKAZknTc4F/macdQK0TwZLT57RfpeM1x3XTU
	aWV0WJ/S6b7fH1CsbhmaW1gU4fFzx8Z6fFzUcnkNVhg==
X-Received: by 2002:a05:6a00:2d97:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-823692b7b4dmr8104924b3a.52.1769702598039;
        Thu, 29 Jan 2026 08:03:18 -0800 (PST)
X-Received: by 2002:a05:6a00:2d97:b0:823:1d05:1660 with SMTP id d2e1a72fcca58-823692b7b4dmr8104882b3a.52.1769702597325;
        Thu, 29 Jan 2026 08:03:17 -0800 (PST)
Received: from [192.168.1.6] ([122.177.240.208])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c54d4dsm6776135b3a.67.2026.01.29.08.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:03:16 -0800 (PST)
Message-ID: <bfa31c3c-f554-43ad-8286-78435e01591a@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 21:33:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        Pranjal Shrivastava <praan@google.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S1oEon1KSHnSoh2zfj7CxL4VMR6ES6Cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExMiBTYWx0ZWRfXxaEmV8jETqXe
 BVGENakbw8HF5fFj8LZ8pJ7l3sEW+2Q94WQKDY/Am5nxLda+yuFgAZ4yRniOwFHaLcYU87DmI18
 3tYgE+Hu5ReDjQg6+3ImsrEMS7eZcNPfBGg1MFrIpJeCFogCDQOHMtg/x2CiQrDWbKm+SXZtHHN
 2L7DIXxNNDFGqiPH01DihiYM5AuyPKmd/JaJdyNebFzplcjsQq5pzD/LVxOzm16ppgMT7Nc13iV
 huWmzd160chRd6JIDlE5jyIk1h19BbElpPjsQ+N/jMau3ZCEwqqoAT29z1oEQ5drLFH5aUXzTMJ
 KbMo+EqN4fHMVyz9fW1L2UNgW1Cnz4MRxDe81Ojm9LhU4iv2MsbYFwX4DHjfncS1io7OAa0rYm0
 NUg+NRkkSiO6J4wgQMweI0OeRwjPJljG7YTfDJ+SNtE6Hf/na1GArnMv8FSXwxU0KgCGNKzMMkA
 H+Sd1eIxd/7wI+nVdiA==
X-Proofpoint-ORIG-GUID: S1oEon1KSHnSoh2zfj7CxL4VMR6ES6Cv
X-Authority-Analysis: v=2.4 cv=betmkePB c=1 sm=1 tr=0 ts=697b84c8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=x89J+l3dq0U9VyOkIARB/A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=sf7T9RYLP084Io81TTEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_080322_447684_0DFDEC67 
X-CRM114-Status: GOOD (  32.44  )
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


On 1/29/2026 12:14 AM, Robin Murphy wrote:
> [ +Pranjal as this might matter for v3 too... ]
>
> On 28/01/2026 5:56 am, Prakash Gupta wrote:
>>
>> On 1/27/2026 9:35 PM, Robin Murphy wrote:
>>> On 2026-01-27 12:11 pm, Prakash Gupta wrote:
>>>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the
>>>> driver")
>>>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>>>> sits in a power domain, all register accesses must be done while the
>>>> device is runtime-resumed to avoid unclocked register reads and
>>>> potential NoC errors.
>>>>
>>>> So far, this has not been an issue for most SMMU clients because
>>>> stall-on-fault is enabled by default. While a translation fault is
>>>> being handled, the SMMU stalls further translations for that context
>>>> bank, so the fault handler would not race with a powered-down
>>>> SMMU.
>>>>
>>>> Adreno SMMU now disables stall-on-fault in the presence of fault
>>>> storms to avoid saturating SMMU resources and hanging the GMU. With
>>>> stall-on-fault disabled, the SMMU can generate faults while its power
>>>> domain may no longer be enabled, which makes unclocked accesses to
>>>> fault-status registers in the SMMU fault handlers possible.
>>>
>>> At face value, that sounds wrong - how does an SMMU generate a fault,
>>> or indeed do anything, when it's powered off? In principle it's
>>> possible that the SMMU might signal an interrupt, and is _then_
>>> suspended (with the interrupt line somehow remaining asserted, so
>>> probably more clock-gated than completely powered down) before the
>>> interrupt hander runs, but we rather assume that we're not going to
>>> have an unhandled hardware IRQ hanging around for longer than the
>>> autosuspend delay.
>>>
>>> So, judging by the diff below, I guess what you really mean is that in
>>> the case of a threaded context IRQ handler, it can take long enough
>>> between handling the hardware IRQ and the thread actually running that
>>> the SMMU may have suspended in between?
>>
>> You are correct that the SMMU cannot generate a fault while powered
>> down. A more accurate description of the race condition is as follows:
>> When stall-on-fault is disabled, the faulting transaction does is
>> terminated. This allows the master (the GPU) to complete its work, drop
>> its power vote for the SMMU, and allow the SMMU to suspend. However, the
>> SMMU fault handler may still be waiting to execute on the CPU.
>> If the SMMU suspends before the handler reads the fault registers, an
>> unclocked access occurs. This scenario is significantly more likely when
>> using threaded IRQs due to the scheduling latency involved. I will
>> update the next iteration to reflect this.
>>
>>>
>>>> Guard the context and global fault handlers with arm_smmu_rpm_get() /
>>>> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
>>>> with the SMMU powered.
>>>>
>>>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault
>>>> after a page fault")
>>>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>>>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>>>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
>>>>    drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53
>>>> ++++++++++++++++++++++--------
>>>>    2 files changed, 43 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> index 573085349df3..2d03df72612d 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>> @@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct
>>>> arm_smmu_domain *smmu_domain,
>>>>        struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>        struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>>>        const struct of_device_id *client_match;
>>>> +    const struct arm_smmu_impl *impl = qsmmu->data->impl;
>>>>        int cbndx = smmu_domain->cfg.cbndx;
>>>>        struct adreno_smmu_priv *priv;
>>>>    @@ -350,10 +351,12 @@ static int
>>>> qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>        priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>>>        priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>>>>        priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>>> -    priv->set_stall = qcom_adreno_smmu_set_stall;
>>>>        priv->set_prr_bit = NULL;
>>>>        priv->set_prr_addr = NULL;
>>>>    +    if (impl->context_fault_needs_threaded_irq)
>>>> +        priv->set_stall = qcom_adreno_smmu_set_stall;
>>>> +
>>>>        if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>>            !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
>>>>            of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> index 5e690cf85ec9..183f12e45b02 100644
>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>> @@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int
>>>> irq, void *dev)
>>>>        int idx = smmu_domain->cfg.cbndx;
>>>>        int ret;
>>>>    +    if (smmu->impl &&
>>>> smmu->impl->context_fault_needs_threaded_irq) {
>>>
>>> Why is this conditional on being threaded, if the global fault handler
>>> that can never be threaded at all apparently needs it unconditionally?
>> Synchronous runtime PM calls can sleep, which would cause issue if
>> called within a hard IRQ context. This is why I added the conditional
>> check for threaded IRQs.
>> Furthermore, this change only allow the driver to override the
>> stall-on-fault setting when context_fault_needs_threaded_irq is true.
>> Since the unclocked access issue is tied to disabling stall-on-fault,
>> the fix is only logically required for the threaded IRQ path.
>> For the Global Fault handler, which runs in a hard IRQ context, you are
>> right—we cannot safely vote for power there. I will remove the runtime
>> PM call from that section.
>
> Hmm, but then how *do* we actually guarantee that autosuspend doesn't
> happen to kick in and power down the SMMU just as a hardirq handler
> runs, when there's some unexpected event? I fear there's a horrible
> can of worms here... 
>
You are right. To safely handle the race where the device suspends
before the handler runs, we must be able to resume it. Since that
requires sleeping, the hard IRQ handler is insufficient if the device is
not already active.

So, disabling stall-on-fault can only be safely allowed when both the
global and context fault handlers are moved to threaded IRQs. This will
allow us to safely use runtime resume in the handler, ensuring the
device is powered to clear the fault status regardless of when the
suspend occurred.

> Thanks,
> Robin.

