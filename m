Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFB0E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiwhtTxCUJN+Y+xu1Q8JmmzePRUu3oXJLiZ6GqLr0y8=; b=JWcW1bNcjo9XUixR1JPfkI06Jy
	+VagRNHAH0Y9yAnI7ym4DgtY79aE7P2B60hJP5iFQn2JgamUdY9UnEPRjg8Lxfxz3ez5hDyiZvdIS
	yRqm/x4WprK0Gavfv+3daZd3VtP2X9AZq6XTNy6ggFblMaQjEKeBkgZplrL5tnIUXZGKADWjUB9Cq
	HF9CvTSirRm5eRGIVZT6ph+9Xjgf5z4H/Dj4WTobkGqtW8jWa2AfGXyTSV/ttfcARUSinHjDio7rv
	ZH3CxkU4Dpb1TKVTbxkKm9hRo/qRj5P10kQOJZRkM7LbD7zpAB5HYPth7sGfKmwAI6V0B0L1CRVOv
	ComTVJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXaT-00000001aqK-437D;
	Fri, 06 Dec 2024 12:37:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXZS-00000001aiG-1YDm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 12:36:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B64aaWU003185;
	Fri, 6 Dec 2024 12:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KiwhtTxCUJN+Y+xu1Q8JmmzePRUu3oXJLiZ6GqLr0y8=; b=H75j1nuQaKb82Btn
	FKm/n3Rd00aVWJt61i2QzThIljlG9TrWKhAnC6CV23g9oMwp4wr9ul2qJI30ngNI
	q3bdt2RhEKBDgFdry5NF/QG9N+TIvS6v1d9gm1+rdQAfMlDNn+Xf686PUOljODse
	63bQy8sUlnJJYsp0sio/YQITmwzNEiJrL33sEaiCQpZsLooIWrkSf8XE/V0ZsM9L
	e2zm7KOuZPPKiOHHkZO7YU0Gvx4XQIZDOJnyJaa2+q3SbLof8myrlfqUvhu4nlAc
	CxDAivpUmeo96sh6FyXQZ6Nvt6FQEmz5ADE4ha3rF85cTd2JiXAwFllb3w5trrz9
	grEYkA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43btd3196f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 12:36:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6CaLlT004909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 12:36:21 GMT
Received: from [10.214.66.253] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 04:36:15 -0800
Message-ID: <808e1041-0d61-4ee8-9778-0f9b7d0fb719@quicinc.com>
Date: Fri, 6 Dec 2024 18:06:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v17 3/5] iommu/arm-smmu: add support for PRR bit
 setup
To: Rob Clark <robdclark@gmail.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
        <jgg@ziepe.ca>, <jsnitsel@redhat.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <quic_c_gdjako@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        "Rob
 Clark" <robdclark@chromium.org>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-4-quic_bibekkum@quicinc.com>
 <CAF6AEGuwWsAkRyF-h5Aj3KzM7iksb12HsfJ5Ks+-P8hv60MWFg@mail.gmail.com>
 <CAF6AEGvVteuOOMod6yw9_6eOn2PxAx+BR8sVOHAHp7Ts8XigBw@mail.gmail.com>
 <5696afa2-c4ab-42fe-b29a-6ecee622fbb4@quicinc.com>
 <CAF6AEGuMmdnOmATMy8f+YgGxfrYb5mkG_qgy870wZPebKaZjVQ@mail.gmail.com>
 <04da6036-56c4-4b8c-b75b-b5e96a089efc@quicinc.com>
 <CAF6AEGt-e_4kGyfiO=_oCLX8E3z76zeZ2MbRe1GicZj4hTEu+g@mail.gmail.com>
Content-Language: en-US
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <CAF6AEGt-e_4kGyfiO=_oCLX8E3z76zeZ2MbRe1GicZj4hTEu+g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K_vzNw_Ng31fHwe7Czpa91P_BOCwvns8
X-Proofpoint-ORIG-GUID: K_vzNw_Ng31fHwe7Czpa91P_BOCwvns8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_043634_428636_6E88CF67 
X-CRM114-Status: GOOD (  34.74  )
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



On 12/4/2024 8:54 PM, Rob Clark wrote:
> On Wed, Dec 4, 2024 at 3:28 AM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:
>>
>>
>>
>> On 11/22/2024 10:04 PM, Rob Clark wrote:
>>> On Fri, Nov 22, 2024 at 8:20 AM Bibek Kumar Patro
>>> <quic_bibekkum@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/21/2024 3:40 AM, Rob Clark wrote:
>>>>> On Wed, Nov 20, 2024 at 9:17 AM Rob Clark <robdclark@gmail.com> wrote:
>>>>>>
>>>>>> On Thu, Nov 14, 2024 at 8:10 AM Bibek Kumar Patro
>>>>>> <quic_bibekkum@quicinc.com> wrote:
>>>>>>>
>>>>>>> Add an adreno-smmu-priv interface for drm/msm to call
>>>>>>> into arm-smmu-qcom and initiate the PRR bit setup or reset
>>>>>>> sequence as per request.
>>>>>>>
>>>>>>> This will be used by GPU to setup the PRR bit and related
>>>>>>> configuration registers through adreno-smmu private
>>>>>>> interface instead of directly poking the smmu hardware.
>>>>>>>
>>>>>>> Suggested-by: Rob Clark <robdclark@gmail.com>
>>>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
>>>>>>> ---
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 37 ++++++++++++++++++++++
>>>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>>>>>>>     include/linux/adreno-smmu-priv.h           | 14 ++++++++
>>>>>>>     3 files changed, 53 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> index d26f5aea248e..0e4f3fbda961 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>
>>>>>>>     #define QCOM_DUMMY_VAL -1
>>>>>>>
>>>>>>> +#define GFX_ACTLR_PRR          (1 << 5)
>>>>>>> +
>>>>>>>     static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>>>>>>>     {
>>>>>>>            return container_of(smmu, struct qcom_smmu, smmu);
>>>>>>> @@ -99,6 +101,32 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
>>>>>>>            arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
>>>>>>>     }
>>>>>>>
>>>>>>> +static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
>>>>>>> +{
>>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>> +       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>>>>>>> +       u32 reg = 0;
>>>>>>> +
>>>>>>> +       reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
>>>>>>> +       reg &= ~GFX_ACTLR_PRR;
>>>>>>> +       if (set)
>>>>>>> +               reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
>>>>>>> +       arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
>>>>>>> +{
>>>>>>> +       struct arm_smmu_domain *smmu_domain = (void *)cookie;
>>>>>>> +       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>>>>>> +
>>>>>>> +       writel_relaxed(lower_32_bits(page_addr),
>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
>>>>>>> +
>>>>>>> +       writel_relaxed(upper_32_bits(page_addr),
>>>>>>> +                               smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
>>>>>>> +}
>>>>>>> +
>>>>>>>     #define QCOM_ADRENO_SMMU_GPU_SID 0
>>>>>>>
>>>>>>>     static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
>>>>>>> @@ -210,6 +238,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
>>>>>>>     static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>>                    struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>>>>>>>     {
>>>>>>> +       const struct device_node *np = smmu_domain->smmu->dev->of_node;
>>>>>>>            struct adreno_smmu_priv *priv;
>>>>>>>
>>>>>>>            smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
>>>>>>> @@ -239,6 +268,14 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>>>>>>            priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>>>>>>>            priv->set_stall = qcom_adreno_smmu_set_stall;
>>>>>>>            priv->resume_translation = qcom_adreno_smmu_resume_translation;
>>>>>>> +       priv->set_prr_bit = NULL;
>>>>>>> +       priv->set_prr_addr = NULL;
>>>>>>> +
>>>>>>> +       if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>>>>>> +                       of_device_is_compatible(np, "qcom,adreno-smmu")) {
>>>>>>
>>>>>> fwiw, it seems like PRR actually works on sc7180, which is _not_
>>>>>> mmu-500, so I guess the support actually goes back further.
>>>>>>
>>>>>> I'm curious if we can just rely on this being supported by any hw that
>>>>>> has a6xx or newer?
>>>>>
>>>>>
>>>>> Also, unrelated, but we can't assume the smmu is powered when drm
>>>>> driver calls set_prr_bit/addr, could you add in runpm get/put around
>>>>> the register access?
>>>>>
>>>>
>>>> I see, thanks for this observation.
>>>> It's surely a possible case, when they access these registers
>>>> SMMU state is off.
>>>> I will add the suggested runpm ops around the register access.
>>>>
>>>>> Otherwise Conner and I have vk sparse residency working now
>>>>>
>>>>
>>>> Sorry, could not get this. Did you mean that vk sparse residency
>>>> is working now using this patch?
>>>
>>> Yes, vk sparse residency is working with this patch (plus addition of
>>> runpm get/put, plus drm/msm patches plus turnip patches) ;-)
>>>
>>
>> Thanks for testing the sparse residency feature with our patch Rob,
>> I have an additional query regarding the adreno private interfaces.
>> Specifically, I was referring to other interfaces such as
>> qcom_adreno_smmu_get_fault_info [1]. It appears that we do not have a
>> runpm get/put around the register access in this context.
> 
> get_fault_info() is called from the iommu fault handler callback, so
> from the fault irq handler, which is why it didn't need the runpm
> get/put.  Maybe it is bad to make this assumption about usage, but
> then again adreno_smmu_priv isn't really a general purpose interface.
> 

Ah okay, got it.
I was just going through all the adreno_smmmu_priv interfaces just
to get a better understanding of it's interaction with smmu and it seems
like apart from PRR and get_fault_info(), set_ttbr0_cfg(),
resume_translation() is also having reg access but not voting.
Should we put runpm_put/get here as well or these can be excluded.
<Just curious about the thought process behind this, is it because of
some sequence when to put a vote, like reg access in middle of smmu
power cycle and not in beginning or end.>

>> Could you please clarify whether we need an SMMU vote around register
>> access in the case of PRR? IMO, should the users of this callback ensure
>> they put a vote before accessing the cb?
> 
> How can drm vote for the smmu device?  I guess it could power up
> itself and rely on device-link.. but that is pretty overkill to power
> up the entire gpu in this case.  I think it is best for the vote to
> happen in the PRR callbacks.
> 

Okay I see, GPU can only power itself up through <gpu_state_get I
assume> but won't have exclusive access to power on the smmu only.

Incase we go forward to put vote in PRR callback for SMMU, I was
planning that we can refactor existing arm_smmu_rpm_put/get() from
arm_smmu.c to it's header file so that the same can be used in
arm_smmu_qcom.c ? What's your thoughts on this?

Thanks & regards,
Bibek

> BR,
> -R
> 
>> [1]:
>> https://lore.kernel.org/all/20210610214431.539029-1-robdclark@gmail.com/
>>
>> Thanks & regards,
>> Bibek
>>
>>> BR,
>>> -R
>>>
>>>> Thanks & regards,
>>>> Bibek
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>>
>>>>>>> +               priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
>>>>>>> +               priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
>>>>>>> +       }
>>>>>>>
>>>>>>>            return 0;
>>>>>>>     }
>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>> index e2aeb511ae90..2dbf3243b5ad 100644
>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
>>>>>>> @@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
>>>>>>>     #define ARM_SMMU_SCTLR_M               BIT(0)
>>>>>>>
>>>>>>>     #define ARM_SMMU_CB_ACTLR              0x4
>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_LADDR     0x6008
>>>>>>> +#define ARM_SMMU_GFX_PRR_CFG_UADDR     0x600C
>>>>>>>
>>>>>>>     #define ARM_SMMU_CB_RESUME             0x8
>>>>>>>     #define ARM_SMMU_RESUME_TERMINATE      BIT(0)
>>>>>>> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
>>>>>>> index c637e0997f6d..614665153b3e 100644
>>>>>>> --- a/include/linux/adreno-smmu-priv.h
>>>>>>> +++ b/include/linux/adreno-smmu-priv.h
>>>>>>> @@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
>>>>>>>      *                 the GPU driver must call resume_translation()
>>>>>>>      * @resume_translation: Resume translation after a fault
>>>>>>>      *
>>>>>>> + * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL terminated for
>>>>>>> + *             targets without PRR support. Exercise caution and verify target
>>>>>>> + *             capabilities before invoking these callbacks to prevent potential
>>>>>>> + *             runtime errors or unexpected behavior.
>>>>>>> + *
>>>>>>> + * @set_prr_bit:   Extendible interface to be used by GPU to modify the
>>>>>>> + *                ACTLR register bits, currently used to configure
>>>>>>> + *                Partially-Resident-Region (PRR) bit for feature's
>>>>>>> + *                setup and reset sequence as requested.
>>>>>>> + * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
>>>>>>> + *                physical address of PRR page passed from
>>>>>>> + *                GPU driver.
>>>>>>>      *
>>>>>>>      * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>>>>>>>      * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
>>>>>>> @@ -67,6 +79,8 @@ struct adreno_smmu_priv {
>>>>>>>         void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>>>>>>>         void (*set_stall)(const void *cookie, bool enabled);
>>>>>>>         void (*resume_translation)(const void *cookie, bool terminate);
>>>>>>> +    void (*set_prr_bit)(const void *cookie, bool set);
>>>>>>> +    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
>>>>>>>     };
>>>>>>>
>>>>>>>     #endif /* __ADRENO_SMMU_PRIV_H */
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>>
>>>>
>>


