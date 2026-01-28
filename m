Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68665D3567B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 05:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYR9kTxk5UBFhydzzD4L7yS3eDix4nvw8qLgcmQmCsQ=; b=YfVui8NTg4Uj0+/78orPfWV0UN
	eTlTzd29oDS8UHhfb/TFNrgO7ywLrTTwWMJLrMXNxcVrZet0hyASxssJRnoBYTUWID4+e+OdKlsAW
	OYeCie+cGd7BFY9PEf7+Vcmy6zuI8vZDaPiZbXw1Iuj3ZyP8bCMN8RtZ8UQ0P+OBXHG8l7goFaSTj
	5GyZ/VrWklFsmVM2Y9Yjguw1ElCtWu9kLgLqzj5D7qAyV5TLGyIrJYPEFW+3C6THZC4nXMHj/INK3
	pbz2+Qlj/OSpi+UfrhsjkxqS27eHgmpA1JldXnX3iM1miTTtBCYccL18Y1HeVPXXt/sD2tpPewuQP
	0x932FKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyXj-0000000FVkC-0erj;
	Wed, 28 Jan 2026 05:56:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkyXg-0000000FVjA-14lv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 05:56:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3X2Q32728651
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 05:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYR9kTxk5UBFhydzzD4L7yS3eDix4nvw8qLgcmQmCsQ=; b=C9dyKXwrWjyNujv2
	g0L4IuCICrpcjYDgG9zjgAc6OJfsBk0R/OTSrUplHk84RnYo0C2c3WwYR/WaMB4p
	Y/wT3Tv9n1l0kP88kHQlU85n0F/12H4QF4BssHzFHSJjxOX0ru0WvoEk3XcAcJZL
	ypPW6DDe2XiQM8jm5d65HbG/Ymb/MnfU3+cz8hgBwq7lsz/aU1jIQWbxEg3/DOM5
	sjY1uYo82Gvn5DoLWjeLK6Kt+EaGaPM4YDQC5WzQobytF7/MRZ36CXos5MqDWvlN
	3xMgtqEkaFAr4fyCbZ47Ibja8D+QxmbL4cLz06NFD43GiwnRAxgpL9bvOiI1Nm8Z
	tBV4qw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byanagbwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 05:56:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so6658227a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 21:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769579799; x=1770184599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYR9kTxk5UBFhydzzD4L7yS3eDix4nvw8qLgcmQmCsQ=;
        b=VmeSqD7kMMixHYFpxI3tyNbO9RhgxTWmQQm/CWsXjEJ0mlJ+1rblLqxSSQND5608GG
         X8QhTqZX7PsBfP0pCiBEBH3+HIqpSIKNDADKcuf428CwR73Ue0rVB930ph1qZD4C/S14
         fsaQSVFeps8DW7q+IvCaHYDyf05GSNuSySIboGVnwIE62eL82mYfPNr7Fp33MyJRl3vx
         PqJHCBSva+Dlijw/SEj55r3wxl9Fhlfg3vCrFQVg9XAO75CT2yso+qk7dH28fPO/mSBB
         Q8o4pnABM0ac2f33XagNADbwQqoScSNmGeGimifDc1Olg1lgx6uGJnBjhdvdhLU0CezU
         bLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769579799; x=1770184599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYR9kTxk5UBFhydzzD4L7yS3eDix4nvw8qLgcmQmCsQ=;
        b=IeeMIuvDaR+0Yl6Enck3njIpaW17maYzsttGvqbY6F3ElJw7TBYwxDyCtaHPiqYIAH
         3O8SrIoPU4KrZpXzNitSUUAWtSMwjTIjZMuLQ43EQwUFyQJvoWa+rblQhUXdZ2ni7Uzx
         PFVIypmX7bLS4bNqV31IkBXKjvoNa4fj5RgcnNMZJfzm8wLyIeYfNvnLGa348F/p7Dbv
         XDQXk833WbyhUaQIFf3WibnZqKAKjaavkW9lftyy368bFDFnfUwsdxSfPUy/LM1ATmRw
         SukFLXiQWl/ji7U6Hvrp1/r7IQ8Cs2Fn06xNx4iFTc9wl/rkTyhFuqO5TBTgMzMyytOV
         KMdw==
X-Forwarded-Encrypted: i=1; AJvYcCXUzgEBp9jd5BxRzBEGWSUHOOldzP763amhF13Bs6bF+u62Sg2P2xTm0gHp7W0mIT/LcA8MRAzN7Y5qZB48rUsf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz73ar+KRRm4MEdCUdEaR25ssVSLHNmrUISPhEFwNXjhaFmo6NG
	ukGWKziJ/+YfFdIAkU5BvL/wG8j0905BJe70CUOw1tec1qsJQxteoYAvyupu5+y/HuEMWIFMG0c
	cXfqqYb79oy1w7ek/cibmQcfV44k+cEjQXo66F+NDNJ6YSiQOXM3hRoPVsRkb0eQ+V7VOgE7P5V
	3VFA==
X-Gm-Gg: AZuq6aK3zVC1j72QFcviGkEvuXDBcFAYh+Fg89HAqzzDIlZg/RtexhUQoGbU/myNmgO
	NSBH5fdf3Xv7tmYZfQRcoOKoWwCwrw1wc1X6EW0Ly2ItXSgaqMJFS59FQV/FrNPZx7ThZp79JJi
	/Yhg4HmgAgS6NaUKwIp3xsPckIOUzGkRYBB8awcGJaXMSI8D1dfCWrZRLuhyGGUIxZOvJpM5HLf
	2HQK2U8PM/ls9Yo6RVG2y+G9VIg1TfDVMXMTSN0VhwWLRvxSp7N6ZhvV1D6uuuwnZUYvlPfaXOE
	npg2PyRgToG6hRQPUj7jVYdr6al/OlYdLWbYAH46h2ukxlFuY1BF/xzokBLbloSRuzg11pSx/ID
	VeXSpImb5PM37Fo5EGmYYoUN5tlKi4J8dRNraMWrS
X-Received: by 2002:a17:90b:3a4f:b0:352:e27e:79c5 with SMTP id 98e67ed59e1d1-353feda98damr3425998a91.31.1769579798668;
        Tue, 27 Jan 2026 21:56:38 -0800 (PST)
X-Received: by 2002:a17:90b:3a4f:b0:352:e27e:79c5 with SMTP id 98e67ed59e1d1-353feda98damr3425979a91.31.1769579798059;
        Tue, 27 Jan 2026 21:56:38 -0800 (PST)
Received: from [10.219.57.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f405ceasm1122081a91.17.2026.01.27.21.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 21:56:37 -0800 (PST)
Message-ID: <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:26:33 +0530
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
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wvyWYIbJpbg5ZMzhxBaJzuvyVNMO6LIo
X-Proofpoint-ORIG-GUID: wvyWYIbJpbg5ZMzhxBaJzuvyVNMO6LIo
X-Authority-Analysis: v=2.4 cv=N58k1m9B c=1 sm=1 tr=0 ts=6979a517 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Jg306G9I-f7xxtujTVEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA0NSBTYWx0ZWRfX9TRNe9hx/0si
 d5mbP80eXjB5HV/DzIXOfpWJX3T27BY7xacn+ChlZCzGZIvV/BxgJde8aP1MT5eAd/HbKHpeJIh
 yQhuHF24UQx0EtHTA0DmAmngrmWcej8wxG1MkwlBqw5QGKha8ynsiGXR9FtWkgYpn7kY6OU1rTP
 BveGb7sW2GjM3v1IsOsTvna9ZGGTUP5mQ2SS5rCWrtYSwiOLcgzuhZU07VICUq+LtSGx3Lkh25h
 u+YyghsYb5uhwVInG6gBWPI8TCbZPhlo/Od6Mg6urIIJDK7fCD8gys397uzvx/6jwmZwwQ32bk7
 8Uu/XYrvSsn/Xg7fg+rCJVmd3aes1l96QfcPmsJ+BLzzuXyNojd18PtbVoJrfuZwhphbWZBeKeQ
 8mKVnrfAqCZmtZFuJShWGCeClrqZT+H8Xjxn/CPRIFX92VkH/yCUvWUNsIWBz06c97tkSqTK9zZ
 54qD0pxPxclwPWEq1+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_215640_311892_44B81E4E 
X-CRM114-Status: GOOD (  35.56  )
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


On 1/27/2026 9:35 PM, Robin Murphy wrote:
> On 2026-01-27 12:11 pm, Prakash Gupta wrote:
>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the
>> driver")
>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>> sits in a power domain, all register accesses must be done while the
>> device is runtime-resumed to avoid unclocked register reads and
>> potential NoC errors.
>>
>> So far, this has not been an issue for most SMMU clients because
>> stall-on-fault is enabled by default. While a translation fault is
>> being handled, the SMMU stalls further translations for that context
>> bank, so the fault handler would not race with a powered-down
>> SMMU.
>>
>> Adreno SMMU now disables stall-on-fault in the presence of fault
>> storms to avoid saturating SMMU resources and hanging the GMU. With
>> stall-on-fault disabled, the SMMU can generate faults while its power
>> domain may no longer be enabled, which makes unclocked accesses to
>> fault-status registers in the SMMU fault handlers possible.
>
> At face value, that sounds wrong - how does an SMMU generate a fault,
> or indeed do anything, when it's powered off? In principle it's
> possible that the SMMU might signal an interrupt, and is _then_
> suspended (with the interrupt line somehow remaining asserted, so
> probably more clock-gated than completely powered down) before the
> interrupt hander runs, but we rather assume that we're not going to
> have an unhandled hardware IRQ hanging around for longer than the
> autosuspend delay.
>
> So, judging by the diff below, I guess what you really mean is that in
> the case of a threaded context IRQ handler, it can take long enough
> between handling the hardware IRQ and the thread actually running that
> the SMMU may have suspended in between? 

You are correct that the SMMU cannot generate a fault while powered
down. A more accurate description of the race condition is as follows:
When stall-on-fault is disabled, the faulting transaction does is
terminated. This allows the master (the GPU) to complete its work, drop
its power vote for the SMMU, and allow the SMMU to suspend. However, the
SMMU fault handler may still be waiting to execute on the CPU.
If the SMMU suspends before the handler reads the fault registers, an
unclocked access occurs. This scenario is significantly more likely when
using threaded IRQs due to the scheduling latency involved. I will
update the next iteration to reflect this.

>
>> Guard the context and global fault handlers with arm_smmu_rpm_get() /
>> arm_smmu_rpm_put() so that all SMMU fault register accesses are done
>> with the SMMU powered.
>>
>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault
>> after a page fault")
>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53
>> ++++++++++++++++++++++--------
>>   2 files changed, 43 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index 573085349df3..2d03df72612d 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct
>> arm_smmu_domain *smmu_domain,
>>       struct arm_smmu_device *smmu = smmu_domain->smmu;
>>       struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
>>       const struct of_device_id *client_match;
>> +    const struct arm_smmu_impl *impl = qsmmu->data->impl;
>>       int cbndx = smmu_domain->cfg.cbndx;
>>       struct adreno_smmu_priv *priv;
>>   @@ -350,10 +351,12 @@ static int
>> qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>>       priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>>       priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>>       priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>> -    priv->set_stall = qcom_adreno_smmu_set_stall;
>>       priv->set_prr_bit = NULL;
>>       priv->set_prr_addr = NULL;
>>   +    if (impl->context_fault_needs_threaded_irq)
>> +        priv->set_stall = qcom_adreno_smmu_set_stall;
>> +
>>       if (of_device_is_compatible(np, "qcom,smmu-500") &&
>>           !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
>>           of_device_is_compatible(np, "qcom,adreno-smmu")) {
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index 5e690cf85ec9..183f12e45b02 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int
>> irq, void *dev)
>>       int idx = smmu_domain->cfg.cbndx;
>>       int ret;
>>   +    if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq) {
>
> Why is this conditional on being threaded, if the global fault handler
> that can never be threaded at all apparently needs it unconditionally? 
Synchronous runtime PM calls can sleep, which would cause issue if
called within a hard IRQ context. This is why I added the conditional
check for threaded IRQs.
Furthermore, this change only allow the driver to override the
stall-on-fault setting when context_fault_needs_threaded_irq is true.
Since the unclocked access issue is tied to disabling stall-on-fault,
the fix is only logically required for the threaded IRQ path.
For the Global Fault handler, which runs in a hard IRQ context, you are
right—we cannot safely vote for power there. I will remove the runtime
PM call from that section.
>
> Thanks,
> Robin.
>
>> +        ret = arm_smmu_rpm_get(smmu);
>> +        if (ret < 0)
>> +            return IRQ_NONE;
>> +    }
>> +
>> +    if (smmu->impl && smmu->impl->context_fault) {
>> +        ret = smmu->impl->context_fault(irq, dev);
>> +        goto out_power_off;
>> +    }
>> +
>>       arm_smmu_read_context_fault_info(smmu, idx, &cfi);
>>   -    if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
>> -        return IRQ_NONE;
>> +    if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
>> +        ret = IRQ_NONE;
>> +        goto out_power_off;
>> +    }
>>         ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
>>           cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE :
>> IOMMU_FAULT_READ);
>> @@ -480,7 +493,14 @@ static irqreturn_t arm_smmu_context_fault(int
>> irq, void *dev)
>>                     ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
>>       }
>>   -    return IRQ_HANDLED;
>> +    ret = IRQ_HANDLED;
>> +
>> +out_power_off:
>> +
>> +    if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>> +        arm_smmu_rpm_put(smmu);
>> +
>> +    return ret;
>>   }
>>     static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
>> @@ -489,14 +509,21 @@ static irqreturn_t arm_smmu_global_fault(int
>> irq, void *dev)
>>       struct arm_smmu_device *smmu = dev;
>>       static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>>                         DEFAULT_RATELIMIT_BURST);
>> +    int ret;
>> +
>> +    ret = arm_smmu_rpm_get(smmu);
>> +    if (ret < 0)
>> +        return IRQ_NONE;
>>         gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
>>       gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
>>       gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
>>       gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
>>   -    if (!gfsr)
>> -        return IRQ_NONE;
>> +    if (!gfsr) {
>> +        ret = IRQ_NONE;
>> +        goto out_power_off;
>> +    }
>>         if (__ratelimit(&rs)) {
>>           if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
>> @@ -513,7 +540,11 @@ static irqreturn_t arm_smmu_global_fault(int
>> irq, void *dev)
>>       }
>>         arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
>> -    return IRQ_HANDLED;
>> +    ret = IRQ_HANDLED;
>> +
>> +out_power_off:
>> +    arm_smmu_rpm_put(smmu);
>> +    return ret;
>>   }
>>     static void arm_smmu_init_context_bank(struct arm_smmu_domain
>> *smmu_domain,
>> @@ -683,7 +714,6 @@ static int arm_smmu_init_domain_context(struct
>> arm_smmu_domain *smmu_domain,
>>       enum io_pgtable_fmt fmt;
>>       struct iommu_domain *domain = &smmu_domain->domain;
>>       struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>> -    irqreturn_t (*context_fault)(int irq, void *dev);
>>         mutex_lock(&smmu_domain->init_mutex);
>>       if (smmu_domain->smmu)
>> @@ -850,19 +880,14 @@ static int arm_smmu_init_domain_context(struct
>> arm_smmu_domain *smmu_domain,
>>        */
>>       irq = smmu->irqs[cfg->irptndx];
>>   -    if (smmu->impl && smmu->impl->context_fault)
>> -        context_fault = smmu->impl->context_fault;
>> -    else
>> -        context_fault = arm_smmu_context_fault;
>> -
>>       if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
>>           ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -                        context_fault,
>> +                        arm_smmu_context_fault,
>>                           IRQF_ONESHOT | IRQF_SHARED,
>>                           "arm-smmu-context-fault",
>>                           smmu_domain);
>>       else
>> -        ret = devm_request_irq(smmu->dev, irq, context_fault,
>> IRQF_SHARED,
>> +        ret = devm_request_irq(smmu->dev, irq,
>> arm_smmu_context_fault, IRQF_SHARED,
>>                          "arm-smmu-context-fault", smmu_domain);
>>         if (ret < 0) {
>>
>> ---
>> base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
>> change-id: 20251208-smmu-rpm-8bd67db93dca
>>
>> Best regards,
>> -- 
>> Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>>
>

