Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B6FC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=; b=NCrV2OPqthfAwoamzUsGXXio7S
	3AFaDYh34mZNYljbdARg1b3pP1yqnHkuyRSSNvTzCc1RP1RjljPXYOn/0muQtAOLshayeCBxHiOqT
	einDviKYK46wEBuXSnSQ3FrMMKlZgO19XG+FtfBBqpceZrzyp9MRNylO43/0szfVs9hQD3mh2OqQq
	ERSPmO08ROeJgVE3d/HHetiHbGOIoAlP2rTEeMvm3db6aXcAT2uolu+Z1rWqgeQaoGYzj0+wT2kig
	HF6RXCho1WxBZbu0wljtqBEKdT0M1UHM29C+p4QqrvhjiwzxZXRXTh4/bJEmDF6iEgPU84p8UBZ/p
	1UiQWoKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfll-00000009nWU-11oi;
	Wed, 19 Aug 2026 12:51:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwflh-00000009nVQ-3LZ6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 12:51:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClNOa143675
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 12:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=; b=fqXl8hjVhnT8IBFI
	3NIvXOPw9jo3tHSiQAAZzXaUeO1m+c/tFyJNfcpdgSlOQWKfqYIPNJo6s1IsoVkW
	k/AUPpiEwCNZlXupB8Z1tDhoUlh6RsQ10Lt+wUB6ziJ+JwvWw96d9EvcCAHa2rUe
	fxydr1GF0WL46gOwcPLZRPkLwa4zRH4xC74vNjEvMR7U3HbaS4yJxYO/J6B+3ct4
	0tzKNolwQ9eXQl9oAMyDVrzmcOjlutQlOaislIWxMq0+o7gPUUG8ZVk6HlF+L8vI
	eJPKfLKxb/cIQ+Z3mcXGZapDr507VIRm9ECSjgenu2g7SQ3HaFWHg1mAbv2hSfXJ
	Obw5Ag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjkbhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 12:51:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84859a64079so1641183b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143903; x=1787748703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=;
        b=IsRNlfyVb1Hpa3Prie0QdXWT8+2gtwM/eg2kay3qNCmA/VVCf4s91nMGPeUZe2GLP5
         OunbVlCchyglrcoxl0whDFOtzkcOtg9CGcIdX185Kqw4OuvDn/bfFK97aqV4EgRtWoMx
         ZnhBV5sewEi88j2zq09jQDoSCNyWtEecrYcgOgkXGiH0PLi56ctlbF7ReA8F8wQ50Pbz
         /oq0T2KIJepqPsqOvdJ8SXu5Px8y6hI8jsl3WY+AYlHzVvLAxgS3ODAkjivqZt5ZAK+t
         yVdnw3NpTXl1PKEIjs39WknpgyG5qZQbjB+O4k5j8LJjvpUZ39M/cSH/rryPT5i+z8wG
         VFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143903; x=1787748703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EMbsNZz1cca1TgL1yz57VjAiVoWtO32vcuobn9YvCGE=;
        b=SXOFFU2vrWrnY0ic1WRFDbxihBaxJ1CPha3nhzWCGsysHdl3xSnvFLGe0WgqrSNZ6z
         GkSDmF0X8h3DC4B0iULVheExgYjsnVw17HwOX7qhcihxO+WXr5zBD6Z5e2JT6HIpqLwP
         r32GPGaB+kev/i+5qOQixe4Ka3mVDBgQJwbaYZnSoHGd/yvxY8p2pidygq6qSxA1KFZg
         CS6j+Fq6QYnHkORqW694a2x7OgSty8ftSsxgy3ig1XAJqqeqaLQoBNIydA0YRlWIz7kO
         yKgX1ffEAVcqpjvzsjAaqmZGzVDZreK3zhzYA8EKWwbGUlySFY8HIFNu0XQy6au/GV26
         kcYw==
X-Forwarded-Encrypted: i=1; AHgh+RpsarswUus/aeCZw5E194+7bLZFF5VMKDJtvSrOr/8gEbGqn2kxwgG7GoTpYw0HT6hFc1RXbkKDxEZRn3ghZgrh@lists.infradead.org
X-Gm-Message-State: AOJu0YznZ6Jk+l1Jra5ToadwzrBAae+L0NwxcYCxlLB/gAr5oMDFumOn
	HQlhmZW/fSx5B4RvqFaCYPSUd1qPwQC2JUbnlDsROkY0LmY2Kl96fhyx6XrJx1iwF/r6BBP0JCO
	T+6FaMUuLFSmPXhJ4VOr5holkQogQw6af3sox+akaNO6oWMQqd0h3mPKJ3NgtV/tzsRXfJeGZrM
	GOXQ==
X-Gm-Gg: AR+sD1332xknWy7LUjGapkWxuL/MqYEuK73PNOVQZUkYrZ34llC3Xxque7Ev7o0NI9/
	80sEqQlZ+e9tRs5+pEYrd+tmcqQbNyvVGXq8LyBHUugZDlqT/AOoKhwhI5gXNemvtp/ADQchlle
	XpzaGzHiCrnmZWK3yI4sH270JQLQN18+0yVGUoANHhdhosDAXKY4VJgDmM639CxjNSI1CIe/4ls
	9gkylTO2yrXqcV3vnUnnJRFMLTFrG8nDFzxjJA692ofWr7gnZwsvSdeHhkBGKhFLgoymwrjZVIp
	uUtv0RR9nEIS0rO4gkCN86y36IBAdRTLVbBrMLhvNG5z9VVa3Hcc/lTyRapv6lfoAb2HJzKD+QB
	jMbolvFvZzpseegnD5rUSG/FyeVmf
X-Received: by 2002:a05:6a00:2988:b0:851:c1ba:7aa6 with SMTP id d2e1a72fcca58-851d3953697mr7335758b3a.11.1787143903111;
        Wed, 19 Aug 2026 05:51:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:2988:b0:851:c1ba:7aa6 with SMTP id d2e1a72fcca58-851d3953697mr7335663b3a.11.1787143902490;
        Wed, 19 Aug 2026 05:51:42 -0700 (PDT)
Received: from [10.218.33.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3671af8sm603932b3a.56.2026.08.19.05.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 05:51:42 -0700 (PDT)
Message-ID: <7ce6df04-474b-4c68-a878-32f4df89a973@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:21:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
 <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
 <ak5pC_meP8KRc3wJ@baldur>
 <9f31bf3d-3c7d-45ba-bc25-e6349f689b70@oss.qualcomm.com>
 <kb2ftnhyvewqgfjdsteenrd3vr4qbrcy3ooiasiui2rchpytol@u2wqjrsc6ebb>
 <328b2179-3284-40fe-808e-b1bbda322e1d@oss.qualcomm.com>
 <haajolsmvil7adq4pfanmdrkvgqygwioncpikawhbvvar5kpnp@rese34d5wt5j>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <haajolsmvil7adq4pfanmdrkvgqygwioncpikawhbvvar5kpnp@rese34d5wt5j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX9yQfBzrAUEY/
 5fKOVvEBMi9NHytFw5+zIiqQk2paNXUHnAnwjHOiYzF0MZVcN4D5M9N+CVcUutn8UBrLNzy5XrF
 CBsrl+vg1MaDj+MDSNT07fNVBklu73XxcEym62/v8qFdCFLyAXM1RErpz86IQnENVqc0OlWF4Gc
 RX6Fh1fAjlL+o78cSxr5NBN0glokhh8QqdAWcusQg01NeGKAh4q62CCtOKDBDROWRv7wVjgAnRX
 0W4zoHHodXVFHiGrPX3oYR/BO9AjEWQ3mbe0o4zRGiPooH3h+v4jyWNtl6Df4qzWZMMt6xfKaz/
 Qylsgv2XnV4A1MbhHNgChJvoXK8WL/SPbUYKSRvq26TM1ZckP4B4e1Z5Go5RXi8eGFBr/wldnXk
 JrAq9a0me/2XeKctvW9iVBGYWX9Gm8PLVq69sytqPMcxI0cjnzjEpkQgSfCuu4NSkHzy12j/+oc
 CpyFabYn+bZ8iv4fJ2Q==
X-Proofpoint-GUID: GFRKP7NHGJSQt8pR6dakmHOcDz4lWtHO
X-Proofpoint-ORIG-GUID: GFRKP7NHGJSQt8pR6dakmHOcDz4lWtHO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX40rb0y1rgb2B
 B+UQPadfIb+hZI+PTCTIg5/97P4pCWJbqI16FaYt2THeqdb6/UCscOeZ63ZGxZ4yZr1UzrB1wqL
 2BbgF85K1/nrS7upgDGrazk8civY7j4=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a85a6e0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=JvE9p03Ddw1cDLIj5dgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_055145_956918_91C7EA70 
X-CRM114-Status: GOOD (  23.28  )
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



On 8/18/2026 5:53 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 11, 2026 at 08:39:41PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/20/2026 8:10 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 20, 2026 at 07:41:35PM +0530, Bibek Kumar Patro wrote:
>>>>
>>>>
>>>> On 7/8/2026 8:48 PM, Bjorn Andersson wrote:
>>>>> On Wed, Jul 08, 2026 at 08:22:00PM +0530, Bibek Kumar Patro wrote:
>>>>>>
>>>>>>
>>>>>> On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:

[...]

>>
>> As per the design it will be applicable to all targets with MMU-500,
>> (Even though issue hasn't been reported for all the targets on MMU-500,
>> e.g sm8650/sm8250 but the nodes will still be needed).
>> It's independent of adreno version i.e A6xx+/A5xx+.
> 
> Ack, this sounds reasonable and allows you to easility select if the fix
> is to be applied or not by using the generic compat strings.
> 

I'll share the updated implementation in next revision.

>>
>>    Adreno SMMU — upstream Qualcomm targets
>>
>>    SMMU-v2 (QSMMU)
>>    Platform   Compatible
>>    ---------  ------------------------------------
>>    MSM8996    qcom,msm8996-smmu-v2, qcom,adreno-smmu
>>    SDM670     qcom,sdm670-smmu-v2, qcom,adreno-smmu
>>    SDM845     qcom,sdm845-smmu-v2, qcom,adreno-smmu
>>    SC7180     qcom,sc7180-smmu-v2, qcom,adreno-smmu
>>    SM6350     qcom,sm6350-smmu-v2, qcom,adreno-smmu
>>    SM7150     qcom,sm7150-smmu-v2, qcom,adreno-smmu
>>    SM6375     qcom,sm6375-smmu-v2  (apps only, no adreno-smmu node)
> 
> 	adreno_smmu: iommu@5940000 {
> 		compatible = "qcom,sm6375-smmu-v2", "qcom,smmu-v2";
> 
> 
>>    MSM8998    qcom,msm8998-smmu-v2 (apps only, no adreno-smmu node)
> 
> 	adreno_smmu: iommu@5040000 {
> 		compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
> 
> 

I see, these targets are not using the fallback 'qcom,adreno-smmu'
compatible for gfx smmu node.


>>    SDM630     qcom,sdm630-smmu-v2  (adreno binding to be fixed)
> 
> What exactly needs to be fixed?
> 
> 	kgsl_smmu: iommu@5040000 {
> 		compatible = "qcom,sdm630-smmu-v2", "qcom,adreno-smmu",
> 			     "qcom,smmu-v2";
> 

Binding seems to be correct for sdm630 as I rechecked. Missed it the
first time.
This combination is already defined under
'  - description: Qcom Adreno GPUs implementing "arm,smmu-v2" '
So no fix needed here.

> 
>>
>>    SMMU-500 (MMU-500) — with qcom,adreno-smmu
>>    Platform   Compatible
>>    ---------  ------------------------------------
>>    SM6115     qcom,sm6115-smmu-500, qcom,adreno-smmu
>>    QCM2290    qcom,qcm2290-smmu-500, qcom,adreno-smmu
>>    SM8150     qcom,sm8150-smmu-500, qcom,adreno-smmu
>>    SM8250     qcom,sm8250-smmu-500, qcom,adreno-smmu
>>    SC8180x    qcom,sc8180x-smmu-500, qcom,adreno-smmu
>>    SM8350     qcom,sm8350-smmu-500, qcom,adreno-smmu
>>    SC7280     qcom,sc7280-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SM8450     qcom,sm8450-smmu-500, qcom,adreno-smmu
>>    SC8280xp   qcom,sc8280xp-smmu-500, qcom,adreno-smmu
>>    QCS615     qcom,qcs615-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SM8550     qcom,sm8550-smmu-500, qcom,adreno-smmu
>>    SA8775P    qcom,sa8775p-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SM8650     qcom,sm8650-smmu-500, qcom,adreno-smmu
>>    QCS8300    qcom,qcs8300-smmu-500, qcom,adreno-smmu  ← our patch series
>>    SAR2130P   qcom,sar2130p-smmu-500, qcom,adreno-smmu
>>    X1E80100   qcom,x1e80100-smmu-500, qcom,adreno-smmu
>>    Glymur     qcom,glymur-smmu-500, qcom,adreno-smmu
>>    Milos      qcom,milos-smmu-500, qcom,adreno-smmu
>>
>>    SMMU-500 — without qcom,adreno-smmu (apps SMMU only)
>>    SDM670     qcom,sdm670-smmu-500  (apps)
>>    SDM845     qcom,sdm845-smmu-500  (apps)
>>    SC7180     qcom,sc7180-smmu-500  (apps)
>>    SM6350     qcom,sm6350-smmu-500  (apps)
> 
> All these platforms use a separate v2 QSMMU for Adreno
> 

Yes, on these platforms, apps SMMU / system TCU is MMU-500,
while adreno/GFX TCU is smmu-v2 variant.

>>    SM8450     qcom,sm8450-smmu-500  (apps)
> 
> 	adreno_smmu: iommu@3da0000 {
> 		compatible = "qcom,sm8450-smmu-500", "qcom,adreno-smmu",
> 			     "qcom,smmu-500", "arm,mmu-500";
> 
> 
>>    SC8280xp   qcom,sc8280xp-smmu-500 (apps)
> 
> 	gpu_smmu: iommu@3da0000 {
> 		compatible = "qcom,sc8280xp-smmu-500", "qcom,adreno-smmu",
> 			     "qcom,smmu-500", "arm,mmu-500";
> 

Ah, thanks for catching this 2 platforms. It would come in
'SMMU-500 (MMU-500) — with qcom,adreno-smmu' table.

>>    SM8750     qcom,sm8750-smmu-500  (adreno-smmu not available yet)
> 
> Yes, patches pending, I think.

Yes, those would be part of drm/msm support series for sm8750.

Thanks & regards,
Bibek>


