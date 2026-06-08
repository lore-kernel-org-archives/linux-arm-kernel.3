Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E8CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=; b=n07UnalbTIlfwMcHPzjC2VgTXJ
	VfzQJG4milEd4dUrz+4alKghT/V+QswMAfF8FhMWTmUOwcYnvfP1BEnRnz2/2AcczOB968ssCDBP7
	qxtoDXkc9Z/+81NyqhaAhWpVlCHKZq+9yyfqdMx/CVajQ9AMo0KRlIrlU8UwnZNQmIeVvEHcvNW0U
	5ZfueEe3X/lVVn2ib8trWCNPU1Y99BCplxfATplbFelJ5wB9mnml+JCwJ7JUIGDJc3MV3khEC+7Vb
	UQ7xS/ylI83q3nlapYzpwYZnqUZXB1VuE2LwwW+WtLPLl08aTMCR5WnMe9Smn7UtliaEiIKB3utCV
	Mkh+6Vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaZ6-00000003gc6-2ooY;
	Mon, 08 Jun 2026 14:02:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaZ4-00000003gbJ-1QFC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:02:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR3Xx3346718
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=; b=Wdo6rjfujIvTY/9p
	15eP/N8LMz5JgDuO650z57EpNpNumTWOFRlwRw47+U7B1Wnti2d7+5nQBClu7T4U
	XnNYF29aWKIeuuBQE8QHfab58qqvIFP42fd7DPpPScWWhnmoEhil65SXy8Z9OTP9
	mr+lXNIk2RyBP6MuArSbQC9tmw792lSxJNBxTSiK7fjjJEDEvKsU5bpJdbN2AcqM
	FqWsL73tUtVOMWM1oMOJ0LCr88ysdaSxtwjmFAmxlvyMF+L59Xqs5onY/KmjTYP5
	KKT0vr/zeSz/y4bW3/q8iDRcVdpHNdX8WOSKl48WVNPIH/u6WpPrEvf5vaScL/nl
	EAvZQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8tdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:02:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36ba24fcd46so3773461a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927373; x=1781532173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=;
        b=WTnAf55MxmujuzEIjYreVagcy3mMPVYYoS2FPhDrTyEdH1wXdGERjnPatPKEeFkLia
         gjRL/9qTX0uIW4aLbetRLTPzy/sAvAKo4w1PazzUlz04NDMXKm1kNwuW/0jlCQPX/zbk
         +4/OXXWtkRbV1XOU7RBs24PgFa17y19JR949be+nb7MqN8vEl/hAJ/1i9TwTnbEu0U6X
         +hk2vBgRxh4GYGPYNbdFF3a/uOVk2D3kmDwFpHkxMYtzWt3kkvICsxF49QzspvzfyuKO
         R2WY8c4+Gpwx058W0sO0fFSDKiRRXixP1+VfsP2SexM6yrkHI7FVADowJmZJRWShvcv7
         WoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927373; x=1781532173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=si0lI3WfDCA17zxk71mM2P+Dt0kHG2CEwaIr9z/aN+c=;
        b=q9k0twotigMFE0qiWv3oQmGntDnedWde8hzoV0jhn4Ng77OqSGQEhHF91PW277rf8g
         5CQQP8x1XI6zpr+vcLlLPo0qAY40Z3a/76GgLoM+hUouJjLGfJsq4CVpi17bDYbTpLVt
         TTWYKihxJi8b0ObX07OBN/z7WqXa3eqXsF00Mom+juUCtvXAjC7gwqN3Ly3lIIfGDSuE
         mMcqU+WSX99dcBQuNG3/g4fk/FnMiSHeU89rsk/ooTP9B3vTHo8dUPfr9bPhg1M2UIwB
         3IzJmT5MSNHE/vFa8lp3sKcfC8cxFpaCV7v+5EIqO8v7c/Yg1jHtmX8Iz0L56yrPBSke
         tKow==
X-Forwarded-Encrypted: i=1; AFNElJ+8tjFCUqHTDm7WMTG0KPS1jheZkcK+7Ju3D5GiF7GKC1UgLo2+55pIJUnjsBsutjYxCK+dPF1RijI/i7fesUCq@lists.infradead.org
X-Gm-Message-State: AOJu0YxvxzbUIuZmZE7JgAd9FDJ43kaSKCH2CfepK5b6okzVMuCG7S6x
	qt46XqB3u5gwcmsVUAozXoMdn8JbyG8RCGCP6OdpLbet/QqPHIa/1O/N9Hhlu/VoFq8TWH9IR8k
	No89a/VgXLU9VzF/m594c/An+8O2SVtjT7snIYrhcyWhCSHKuoZmnhE38I4eUyJt9l2DlLg6OfS
	ADWQ==
X-Gm-Gg: Acq92OEbRk8kXAMXrS8nbD07sAaMup3ihRFhFP9PBhDa4zZGztGM1EGzbYs7H7LLub6
	7Vp2rDUAO7cveP4X3KS3vQEmbyjulHTN8JaWWnJrs5uGrhyO8VeYHLIwJnq4dsvKYr+FSKPY/6x
	uSJdv+OWtEwW0dtLlDzlGxZWi5bwoj8vJ6q30RXb7KX0lQSgsQ7KapNtTv10Px+cJw86UKhwekr
	A7ahB224v5ag+fKzxNuTF4TNXyOqOKqzNb7muarLnbNFkJAqeW8XhxGPzJn6fwYoNqBA5autxSr
	bU9JmH8xj0IsMHclzws5weBxKr987fxJMZ5icwrMWbItLT8gDg5GgboecM5nifUSXTyG/0kFN91
	0cHxQEpaqtqjr8EGUGux3aTH4tVbCQMQRtiOftoXHf1WOLEpynbGh8hgkWy3B
X-Received: by 2002:a05:6a20:2d14:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3b4cd09ace8mr18854511637.43.1780927372860;
        Mon, 08 Jun 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d14:b0:3aa:ec1c:84e5 with SMTP id adf61e73a8af0-3b4cd09ace8mr18854371637.43.1780927371975;
        Mon, 08 Jun 2026 07:02:51 -0700 (PDT)
Received: from [10.219.56.113] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03498csm18010993a12.1.2026.06.08.07.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:02:51 -0700 (PDT)
Message-ID: <a1db573b-bcb4-44a5-89b6-6d1c76f4a18a@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:32:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
 <20260526-smmu_interconnect_addition-v2-1-2a6d8ca30d63@oss.qualcomm.com>
 <1b5ef5b8-c9f2-4eea-8040-22c1d704b529@oss.qualcomm.com>
 <0ded611e-1932-470c-8e80-9a5e94268583@oss.qualcomm.com>
 <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <2roy5rvazzb5p3vl3dyutft635n3acwssqnqvrzqziivh3ebq2@wptxg7exupmr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1W2EWY0tfxIE5Bz9li5GEjznBlhJnl9n
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26cb8d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=N6J3eu7hh-G8EisLkUMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1W2EWY0tfxIE5Bz9li5GEjznBlhJnl9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfXyDUqo4y8in5o
 9JiZ5nBgNwdHm3Qm9laM9T6KW8RN/PUoPSHdM5gui4zGdXvot2w5IecANVcyAfakKSoxdi4u/RJ
 zEMZ3yldjXe99rD6YAucmq8+Dlk3L6teSk/TRsRDQqCNkVbe55uEG4q1yFjdSpReBaiVzm3LhWS
 f3q9zohFNsk0g1pYepIiWoh5s5ojUGTgmu/m9ZKMyswYPTz/R4eU734KGiOx/Fj2HZO6+KE8BbB
 iWJkTmZn3yyH/iqCXNl/DqoLfw7jN5H84ht1b0Z5ynoaYYBeUk05YMOqEjD2eIlTGa+WWPmIOjO
 vjb4EbfhaMFLJyroK/2rDAlG4aYCKhgte1hCUH2b+wDTZiWuOp4PeeqaDdVOJYzPXfR+xGwHPKe
 +40mXZuS1B1jna4VgM3OZz0WHeZizJLP09Jp4dZh0P2HKeOgoKYdII3TpFpwfzfUsWHb1EANb/4
 f8WdaeNBuBfzSRmp4uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070254_389275_171F359F 
X-CRM114-Status: GOOD (  22.40  )
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



On 6/8/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 08, 2026 at 07:14:43PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 6/8/2026 3:22 PM, Konrad Dybcio wrote:
>>> On 5/26/26 4:42 PM, Bibek Kumar Patro wrote:
>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>> path before the SMMU register space is accessible. Add the optional
>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>> to describe this path.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..3a677ff1a18fcdf5c0ca9ec8a017d41f9eb5ff09 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> @@ -243,6 +243,13 @@ properties:
>>>>        minItems: 1
>>>>        maxItems: 3
>>>> +  interconnects:
>>>> +    maxItems: 1
>>>> +    description:
>>>> +      Interconnect path to the SMMU register space. Required on SoCs
>>>> +      where the SMMU registers are only accessible after a bandwidth
>>>> +      vote has been placed on the interconnect fabric.
>>>> +
>>>>      nvidia,memory-controller:
>>>>        description: |
>>>>          A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
>>>> @@ -602,6 +609,26 @@ allOf:
>>>>            clock-names: false
>>>>            clocks: false
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          items:
>>>> +            - enum:
>>>> +                - qcom,qcs615-smmu-500
>>>> +                - qcom,qcs8300-smmu-500
>>>> +                - qcom,sa8775p-smmu-500
>>>> +                - qcom,sc7280-smmu-500
>>>
>>> This is a list of targets that happen to be supported by QLI.. but should
>>> this list not contain _all_ Qualcomm SoCs, or at least a much broader range?
>>>
>>> Perhaps
>>>
>>> if: properties: compatible: contains: qcom,adreno-smmu
>>>
>>> ?
>>>
>>
>> As of now platforms where the issues [1] getting reported are added, the
>> list will grow.
>> <We still have to evaluate and test on other non-QLI platforms hosted in
>> upstream [2]>
> 
> Do you really need to test, which platforms have an interconnect, or can
> you predict it by checking the SoC documentation? I strongly belive, the
> latter is the case.
> 

Agree, for interconnect path we can surely predict from the SoC 
documentation,
But for the corresponding FLAGS/values (MASTER_GPU_TCU, SLAVE_EBI1), it 
would need some testing before finalizing the change on corresponding 
platforms.

Thanks,
Bibek

>>
>> [1]: https://github.com/qualcomm-linux/kernel/issues/297
>> [2]: https://lore.kernel.org/all/a437f9f9-3560-40f8-85ea-35433e33c428@oss.qualcomm.com/
>>
>>> Konrad
>>
> 


