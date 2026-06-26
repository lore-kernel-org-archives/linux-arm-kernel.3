Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D42ACDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 11:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=; b=zcmZxLyWFJ/ET8OVJjVzGOzVEy
	ReIl8CCzEQ4dOPIlJtg2oXauhplEOvVvCpNeszYOdMKTyre2ToE6cYo3SzEDzFk0znHFx5b/l6g/n
	517qyNNHr8afjZGrtQB/hSxRexH8Fn4iZVNtEVksfUXCpuATBKtdumBeAb9ki6kk0kPjnEm8mxP3O
	kpYfPtUbA1Qu5XtZ2UTbbDhqFeJ+v8YCWNX5KL+59d9xrbCfz0dArim3S4idglvY54uu6LsGl2mtr
	djwB31oojXUslUJsn8PX/TtBDfn7YrZ9JSKL421jKoUkE3bMIlKm3VRelxD0czZ2vwFm8/TAwgPSi
	kAqwl2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4gz-0000000BDRz-0Utj;
	Fri, 26 Jun 2026 11:25:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4gw-0000000BDRZ-2FbQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 11:25:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAch9C1143735
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 11:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=; b=nxse7MpIWKwRS9Kq
	PzD23s235gtdv3TG4eC6YWz3k2Ihyta9XyWxIpJx0isDek4tTXfSirVc8FPCDjcB
	jX6CLqpCq3/OD/riyHZxJTUhQRDQ4sP5bC1lFI8zSjM3jhhxXBMFgq1rh4gdITVK
	j9KncVe/esV8QZcP679zaL3TW5K8JtvDPLTdY77yHkkhmWaKEbEnCeSJMoD6xpV4
	Xoon2A/LR+Vl1J4usG6/b7oyWWkAXb5rRTaCrzaI96OMu5cv6ureohlVfE88jZUa
	tBw2AERzFTOTifvxtrmbSZCoiGqnXtqcsdAIIZGasRE8Xx9zFzJg+Ips8o+76E8B
	jdZcaw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eewadgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 11:25:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ca3374c6aso888423eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473148; x=1783077948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=;
        b=M0Y3/yfYRjYMGV4XdCMqukquOAAhSCXB/nS+kLGUn/vDRnFcma0dQ4XWfviM7EbTAa
         klBA4wA+aIkBlZNEu/y5LhvxnLKwIJA4yXz4x1CrvQamsXTSw4o43qfY6FW9fvprhheM
         miDR5L8gbOHXjLol/qAMSWPKPqaOUDL8wp7UOjOe4/a1tffzU5K2RObJASGyStBKEMW5
         tOfp4QBkSnOMS8WoyidpsJcwqKSOpm01YQfUzR/GYUCQRqREYVGNrfk2ApoaV+UOHwml
         K8zFSUZoM/HW6QiStBtHOH8MIyTsk8niNPEvCA/PcBMgDSt6JNkSqI+qSBJJInXmPJtb
         7yiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473148; x=1783077948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp6BH1YDO1p6QN/66C7G3LI3oo+YrxYKt7PFYlnJB1I=;
        b=lBeY4eOYusAogyonVxMexU/o7UT2MFY4eHEXJf6tKaoWAvufwFw7Xt76wnI3RM8FqM
         aUlxar440Cagx/SXEx6ubfQZHKWe6s8jYwggkzpMahftfMhfzDtIf+z5gFipTHlZGdLg
         hp9J1B+Lpn7eY6drgqHDD+lmP6m0qu+kU/AdmjogtHbgzuL0YHtj7bXreS9YzoMIWxsp
         py+jINSCAI7/3bRwelsKd+9FomNG6LyWXcyNfxgn5rONB/9BYM6z8APOJXP7td3ZV1R5
         xI39hL0Gz/W6v7lcmVBENf1V+VDnc3a3DWjGER7gU+3S501EY+XW2gevPs4xMaH9vAgL
         f2wA==
X-Forwarded-Encrypted: i=1; AHgh+RrvYmZgtWXChJsiVibfYyVL3MaxTzimbq3kgwEb2lMu4obwhWknfH5aEERzKzLOZJYnpXNTK6hRagSNDsJBcAw0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8MEapvNWY9x/AeHX53iHJK69SAinkbHj0ZS/OjSVB0+tWTZFR
	34ZvgUWs19xLBzUSgO01xjvnpiTwr0NhbRHfBd3G67wZ8ltk+a3CNYwzzV9cRYoeYieN0SsvCbc
	LO6s3GwBRRyUDjzcjUljs0teoIQCPzXRTmHdSR820y4x/i4wwdnuZT2fWIseTH21sWofuV1WtVn
	xN3inDmhHZlw==
X-Gm-Gg: AfdE7clp8yrNP5df+AG16AigP3t2TshwoLRVK47Kzr6T8sB7J8w5VBblToiTY1i/Q3E
	UhlOmw5TrnFUm1QvV3QdtyuK1PtTudGy8IU39gh7Re7gx9VbqEoViqjSmBSatj5KDqW2iEiFsVb
	RK9Ab2ABBjI/GrVE8y+BEX8BdKhVcifHKgx5wZ/5bK12ruILszfywFzeudkLv8Cd17h2TOFMbPC
	S95k6LA13OXz0hKXrkdrtXf1AKbat73u+FCMEDOqx6CtK3dvcIiAR3yLwi1F4TLPehZMhmpuICG
	+cBi+WmPTn3Rx8VrRSMlnyu2rFtKS/hR7TlIFKjO0hiFdjzYhdjvlOXqmfZH4e+NrBLJ0mB3jOm
	w2IEf1FhIIPhAZk8Sfmgq68YneUjBA6Mp8pD6yw==
X-Received: by 2002:a05:7300:fd07:b0:30b:d31f:1577 with SMTP id 5a478bee46e88-30c84e596bemr7352327eec.34.1782473147710;
        Fri, 26 Jun 2026 04:25:47 -0700 (PDT)
X-Received: by 2002:a05:7300:fd07:b0:30b:d31f:1577 with SMTP id 5a478bee46e88-30c84e596bemr7352290eec.34.1782473147186;
        Fri, 26 Jun 2026 04:25:47 -0700 (PDT)
Received: from [10.219.56.41] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f6d2e4sm17343537c88.7.2026.06.26.04.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:25:46 -0700 (PDT)
Message-ID: <abfc0099-be71-4e4c-abe4-e8341a06f15a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 16:55:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
 <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
 <ea345832-711d-4e32-af0f-bc74d8646aef@oss.qualcomm.com>
 <299d54c5-fb93-47ee-9495-fbf48a3204fd@oss.qualcomm.com>
 <aaf4daee-4886-4214-a761-80545d2565ee@oss.qualcomm.com>
 <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <4f0878a0-2ab1-490d-b251-c6d68c4ee241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX0mpj2gpyr+fx
 DVOHM7Y5tUzOElIwyWdghSQcbfZewYCiexohbxn/m7hr5gSZEMcSGKc41rvsJwTttJUH8S2XfpW
 vqaRXQkpFPlUK3QN0arhe5MyXzn9VfA=
X-Proofpoint-GUID: 27WCSc68FuQE22keWI8h7O5nzsiegGle
X-Proofpoint-ORIG-GUID: 27WCSc68FuQE22keWI8h7O5nzsiegGle
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3e61bc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j3I-O8hsx3pVybSV4xQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX/UOVeYt1vjJq
 Mn/AgCTun1dPNLXGrmqG5wp8Or2LArW1iK30HScPRmKYj5x1Rw0sWQCIQHtWqQhB7Ox8CDWI4iN
 L0614Iu8EtEy/h3BzexewgqsOw9FD7dwGBwAyKp0B6xOzP3o5OjCBO+QGtErfABNeBhFjBSqITa
 cJTB46VPWSesCEI3rD+y1vluKGmaJBwaKDdDURcoRI/5pKPIjmrOkWa75GFnDZy/waFkWTlnkx5
 Vl+icg6X2hiZkGS8uONOiiGG71sP6ICS/x/qGW+AUhIDox8zSKgJGAitHKnvhxNxqsW9ZlPCcWh
 YhFC9ymR7F0fkaMpjGfw2uGr0b3ZiotCbZdXHv5SwYOrGdH5YL9+xhOpTxWs4RWHgfW5PFd8Icq
 OS9WdIh8BteumpaFqlJHtjJQivlgXKv/HTL+ffZKomH9dBwZ9a68yoHB8sOzAw9/OAHIHpcYaYP
 wz01MwZmYNmdgYTE4Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_042550_699392_9834CCD7 
X-CRM114-Status: GOOD (  26.62  )
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



On 6/25/2026 2:17 PM, Konrad Dybcio wrote:
> On 6/19/26 12:54 PM, Bibek Kumar Patro wrote:
>>
>>
>> On 6/18/2026 2:58 PM, Konrad Dybcio wrote:
>>> On 6/17/26 4:26 PM, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 6/16/2026 5:51 AM, Dmitry Baryshkov wrote:
>>>>> On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
>>>>>>>> On some SoCs the SMMU registers require an active interconnect
>>>>>>>> bandwidth vote to be accessible. While other clients typically
>>>>>>>> satisfy this requirement implicitly, certain corner cases (e.g.
>>>>>>>> during sleep/wakeup transitions) can leave the SMMU without a
>>>>>>>> vote, causing intermittent register access failures.
>>>>>>>>
>>>>>>>> Add support for an optional interconnect path to the arm-smmu
>>>>>>>> driver and vote for bandwidth while the SMMU is active. The path
>>>>>>>> is acquired from DT if present and ignored otherwise.
>>>>>>>>
>>>>>>>> The bandwidth vote is enabled before accessing SMMU registers
>>>>>>>> during probe and runtime resume, and released during runtime
>>>>>>>> suspend and on error paths.
>>>>>>>>
>>>>>>>> Generally, from an architectural perspective, GEM_NOC and DDR are
>>>>>>>> expected to have an active vote whenever the adreno_smmu block is
>>>>>>>> powered on. In most common use cases, this requirement is implicitly
>>>>>>>> satisfied because other GPU-related clients (for example, the GMU
>>>>>>>> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
>>>>>>>>
>>>>>>>> However, there are certain corner cases, such as during sleep/wakeup
>>>>>>>> transitions, where the GEM_NOC vote can be removed before adreno_smmu
>>>>>>>> is powered down. If adreno_smmu is then accessed while the interconnect
>>>>>>>> vote is missing, it can lead to the observed failures. Because of the
>>>>>>>> precise ordering involved, this scenario is difficult to reproduce
>>>>>>>> consistently.
>>>>>>>> (also GDSC is involved in adreno usecases can have an independent vote)
>>>>>>>>
>>>>>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>>>>>>>>      drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>>>>>>>>      2 files changed, 57 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
>>>>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>>>>>>> @@ -53,6 +53,11 @@
>>>>>>>>      #define MSI_IOVA_BASE            0x8000000
>>>>>>>>      #define MSI_IOVA_LENGTH            0x100000
>>>>>>>> +/* Interconnect bandwidth vote values for the SMMU register access path */
>>>>>>>> +#define ARM_SMMU_ICC_AVG_BW        0
>>>>>>>> +#define ARM_SMMU_ICC_PEAK_BW_HIGH    1000
>>>>>>>
>>>>>>> totally random numbers, which might be different for non-Qualcomm platform.
>>>>>>>
>>>>>>
>>>>>> Ideally, any non-zero value would be enough to keep the path active.
>>>>>
>>>>> This is true for Qualcomm devices. However, you are adding this to a
>>>>> generic code.
>>>>>
>>>>>> Here 1 Would be enough to keep the path active, but might be too small to
>>>>>> reliably keep the bus active.
>>>>>> Other is UINT_MAX, which will reliably keep the bus active but might cause a
>>>>>> power penalty.
>>>>>>
>>>>>> #define ARM_SMMU_ICC_PEAK_BW_HIGH    UINT_MAX
>>>>>>
>>>>>> seems to be suitable here to reliably keep the bus active by BCM
>>>>>> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
>>>>>>
>>>>>> LMK, if you feel otherwise.
>>>>>
>>>>> Shift it to the qcom instance or provide platform-specific values? (My
>>>>> preference would be towards the first solution).
>>>>>
>>>>
>>>>
>>>> To support platform-specific values, we may need to introduce a LUT-based approach in the driver. (Bandwidth voting values cannot be placed in device-tree property IIRC ?)
>>>>
>>>> Currently, all Qualcomm platforms use 0x1000 for SMMU ICC voting. I
>>>
>>> (you used decimal 1000)
>>>
>>
>> It's my bad, i meant 1000 only
>> (I'll check on the icc_bw calculation to get clarity on the values)
>>
>>>> can evaluate if this could be moved to a Qualcomm-specific
>>>> implementation.
>>>
>>> Add a vendor hook to arm_smmu_runtime_suspend/resume and handle it within
>>> the QC driver
>>>
>>
>> Just curious, wouldn't this apply for all the arm-smmu users in addition to Qualcomm devices as i mentioned here [1].
>> Vendor hook would make it Qualcomm specific.
> 
> You're proposing to use a Qualcomm-specific bandwidth value so that
> fits
> 

Got it, It seems valid. Will be sharing the new implementation post
testing in next revision.

Thanks & regards,
Bibek

> Konrad
> 
>>
>> [1]: https://lore.kernel.org/all/984ff9c7-3eef-463c-a330-bf7acd063667@oss.qualcomm.com/
>>
>> Thanks & regards,
>> Bibek
>>
>>> Konrad
>>


