Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0489EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=; b=V6bLm7arVcuHfLeg+t7fczrsTr
	M8edwgdP5qg9iOKO908GkfaUHeobHX67GiR0AXYtCXCeHcNOQw9zXz3UUD02/Oniu2KvQW0tWEeKu
	/fVFhDfMEvpgAstpTRbyvMlA7iEapevYGyiInt/ylw72dVrTIdLHyAoqlJ3Nkb6LmGI/ryI+G/8cK
	bCGfVa3AerlQC+MsfcN4S+paxYK2dT3TvKIrc3AfHr09xC4qUEh9EyxFOi44EPh/QdF2vkbvRZQgF
	IO9BDZI2K6+5zYYzBT2rvY3Y2aWKyZAe6GekbwISDgiJ6TqC+0WxqHgyadsmwVvvDTs6jzHU+xpqc
	ttEoL0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh53T-0000000EyAk-3Nd7;
	Tue, 07 Jul 2026 12:37:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh53R-0000000EyAM-0Pvb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:37:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C9LX73740882
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 12:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=; b=hqMqG54h4QbHLTUR
	JtWmWqM6Hv3A88fG31J0Y/jNV34Az/XYukWTcC13ffIGypAt7KNDBRSv1vOi1Eo6
	vEbBerzrxKLD/h9Gxf35aPAAj4jvCv4luuQ9zyTSoiPlwbGol9xBUJS+vkJ7Yxst
	wvQqSJxNMnvV2COl0PtRMXSZ0vsrKgp20H5Q01lF0dRWDcA7g0j2ZEII1sc06Czy
	ZkPS4rbFVAZAlSMWg3ouagoAfa4//+6NUj27Yhv86gIjoOvTEWfsp18WwFo6VZLx
	diV/l0zJY6rmlz9GuAiAibKg39nZ37lhBSbX4ujVZ4DNLf/qqoFTPGuUbXjWBE0S
	Bli5FA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a9eys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 12:37:36 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9ee20bde0so2658655a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783427855; x=1784032655; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=;
        b=AP67xPJeBtasH4tZ3Yt1PPGuji4j/48pRMqANv63iQuxCjU87lOfM4cxSpdZg8Z6cm
         w4VySoCCdBTHGyU7Or/25ri8nDuDoqsrC/yyasv6PVdhi1plE2ZsjPmT/vXrK9C32RE5
         963qF1t5ZIp+fislDjKF6bPrSjAj8iTYqsNEqLd7H7JcoT+jjkcRyoMBtFySUJ6QB4Ig
         FVr9Di4abFkt0vAPbgdop8Fqi4HWwBzJcUSj7FXDfT6zZ9zjAVlHuNoLXhsZdq6tKs6Y
         F9iQd3nvEICQyJ60zguAvgk4qEzvwzewa6FDg35+Fvr7goBh1sLWUhr7F3lRmsJy/E2d
         X8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783427855; x=1784032655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YnmIedkr7Tr8vwNi0AdmSRDuxImVFUdc0vBJaAbaSA0=;
        b=X34UxgV7NexnWgxvMObnTmdll2cVaA6kw8KhzfW9zq0tmAB8lP/i9wEzwTO0waPa4z
         P1CXsx72WBUkM8gPkTbDqifsY1JAloWmedBfsvq2lTqh4LroED68qEodC8zVFdBBuVNn
         Qk4lfNMKWb/BVefwtdY+tBGNCGYd+naLlzGd++rTdGi8YnXe8A3+XLJjydAB/UxHpleW
         0NsLRO6YBNRxIiWHfuCWbT6wNFoCWao9Dl3mbVPfziDW3bzdiHPTuZLrE5pwYEv0ezWS
         R6bKDEbpD+9BnmMdmE79idnxNy79CbJaeMTYA2UoDq5aIQ4dRDjvGruqiYx2u+B6Zk25
         d+DQ==
X-Forwarded-Encrypted: i=1; AFNElJ+yvrIYlwsjAphY6Ax1XpSdQ8ogwHpywPABEaLL2Sgo69jdYwpx6c4M7a9LC0zfAZLoHhpN7LBqy4e3tELnDa4F@lists.infradead.org
X-Gm-Message-State: AOJu0YzRW1qLjJl2UD+ylLj3Tcd9BtocDTllJEK7e5mdf98MqoF/csdk
	yKGQDwODgrJOQJnZftaGkdJj4WB5RGYF0EC++y2BqfzuKooU6WmGp1SHz2Q4R8cLaPS1Us6c6wt
	pQXh7SrIoQcVCJ0MziLScCzS/DrOU+tMSz534vZpJie70NUiAh6X6+5M4VAYqI7fa3bJpEbbtbq
	ThUw==
X-Gm-Gg: AfdE7cnbPHXjpJ5cFKD1lR+2nfyXJWMU7NTIpWiC4auVQ1/DLO5Ww0LL1oCTBmdnLpz
	+jasS806F+juKFM34zEwlfqOgvZvH+7DQMOPZ/yABoTjKcwfE22lgqvHo6vcNJI/Tax8RIPD+TO
	0IRasW8UtSu0YyMj5ryPNi3bFq7LUykqgY/WYyScjiNEywhOuhb+si9Zk61S+nD8di58qRiGCNw
	de79RuY8Jws2neyj3ST8ZGiYWb/RoQ9xGisWkyhDUbVsKd4NihOXFX1bLSHDVCrg+gnUimOThGr
	09tHGKnOpUGa7rgYEsIQlSLZU8rSUEF8f1cT8buk65SDbyPg9YYuN7uQJP5xa9KOnzUbENnKG16
	JLHNQqfSgOUeVDwiBDO0n+jr3GKeHH57197ScThQ=
X-Received: by 2002:a05:6830:67da:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ebb233a1c7mr3266290a34.15.1783427855367;
        Tue, 07 Jul 2026 05:37:35 -0700 (PDT)
X-Received: by 2002:a05:6830:67da:b0:7e7:76f:3ec0 with SMTP id 46e09a7af769-7ebb233a1c7mr3266269a34.15.1783427854922;
        Tue, 07 Jul 2026 05:37:34 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542ebf72sm15010628a34.9.2026.07.07.05.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:37:34 -0700 (PDT)
Message-ID: <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:06:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QJsJbTI7_WH0LzAg52IUjvtKHGxY0g3Y
X-Proofpoint-ORIG-GUID: QJsJbTI7_WH0LzAg52IUjvtKHGxY0g3Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMiBTYWx0ZWRfX4pXPdGIMVonn
 XaODMhYYEuBh502KczguQalDGcI4AoZJe7TZLa6Sz+Kk3cLX6nSwuWjhDkNXxZcYwbWubyVD2oN
 Cj92B+3wVXBIttP7BFPCAgQ4xU9Rtgw=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cf310 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1xpCzd4iWPYukUP1q-QA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMiBTYWx0ZWRfXx9gOyPZn4g6N
 6yDQDnrytE6dyTQu9fQMfUdA7SZoNMensntwH5Ml/R0poz0P1OZn7guWn3Tly6DywEAhmd0TJtA
 rKzEb0SfGIUmoUEphSDrLXP4g2pGmnwOrihp4Se6lhJhhWPIcASqm77E4ImF9OR5ieMou872Nw4
 ngjTMHK+e53YClOpDFUMkHK6dJvU1zy3YHI5ZumgJqXCRgVIm0xCRGJsUvb+rVCMAeIaiV2PS/k
 kElW6QGPC1PcMrWyhtKbtuDay9daGPTrB9I1ZOnONlnDsZ19NwVjE4phqHxgC7kcY8sXBJg1W0v
 FgiOKfcLtKhxJgDFMCWnDgoDUwh28CY5ciJz2ZI4Exy/TmEHXJOMuYIsG3F6R0My4aX5HJNsXGf
 KRR4871bVuF6EO/zPhsDgbd9g7oU5030+zvHhaIho0fYjKDYFL3QJAU3AtFphk5xNwiDmPrO0vg
 nJlNecIrlmMeklSoWjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_053737_264599_52DF79B5 
X-CRM114-Status: GOOD (  27.62  )
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



On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>> Some SoC implementations require a bandwidth vote on an interconnect
>> path before the SMMU register space is accessible. Add the optional
> 
> Why is it limited only to those SoCs? Is it also applicable to other
> Qualcomm SoCs?
> 

I was hoping to keep this series focused on the core infrastructure
changes: the bindings, base ICC bandwidth-voting support, and DT
interconnect properties for the platforms currently supported on
Qualcomm Linux and have been validated so far.

The additional targets have not been tested yet, so I'd prefer
to add their support in a separate follow-up series once validation
is complete, rather than growing this series further. WDYT?

>> 'interconnects' property to the binding to allow platform DT nodes
>> to describe this path.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index a701dec2fa0a..fab8944d7b63 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -246,6 +246,13 @@ properties:
>>       minItems: 1
>>       maxItems: 3
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +    description:
>> +      Interconnect path to the SMMU register space. Required on SoCs
>> +      where the SMMU registers are only accessible after a bandwidth
>> +      vote has been placed on the interconnect fabric.
>> +
>>     nvidia,memory-controller:
>>       description: |
>>         A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>> @@ -644,6 +651,26 @@ allOf:
>>           clock-names: false
>>           clocks: false
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sc7280-smmu-500
>> +            - const: qcom,adreno-smmu
>> +            - const: qcom,smmu-500
>> +            - const: arm,mmu-500
> 
> Can we be more idiomatic here?
> Something like:
> 
> if:
>    allOf:
>      - properties:
>          compatible:
>            contains:
>              enum:
>                - qcom,qcs615-smmu-500
>                - qcom,qcs8300-smmu-500
>                - qcom,sa8775p-smmu-500
>                - qcom,sc7280-smmu-500
>      - properties:
>          compatible:
>            contains:
>              const: qcom,adreno-smmu
> 
> In the end, we don't need to list the full list of compats. We need to
> specify that it's Adreno SMMU on one of the listed platforms.
> 

Agreed.
We need the interconnect property for any of the listed platform using
the adreno-smmu only.

Additionally in following e.g.

compatible = "qcom,adreno-smmu",
              "qcom,sc7280-smmu-500",
              "qcom,smmu-500",
              "arm,mmu-500",
              "qcom,new-string";

The current schema could miss enforcing the interconnect property
when new compatible strings are introduced, whereas the approach you
suggested continues to handle such cases correctly.

I'll update the binding accordingly in the next revision.

Thanks & regards,
Bibek


> 


