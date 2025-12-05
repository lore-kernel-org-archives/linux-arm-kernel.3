Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A18D2CDF5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZm2g5nNkglyyKKMEeqfWJOYA3gt76o1OLI8bcXYgIo=; b=M5sclrK7z65EBUEl+/n7Nvm9DD
	lJNr42RohnTsjVeV3sjQI9eJiR3d2h1CpFcXmst+iKcMGKQfBA0YLAbKhhVq/gR01Ygik4nQt8NJ3
	zGe92+95ATs4uE+YGtI+55ZuLfTvo0TL/wO/OCS5NvafyiDLRg46tNs+FdHmJ01JZhlMle2CeKbu8
	AqyQFhvUjYrU8NEM0oiTqSI1xNzEerR5oaRXxqKFf4zLV9AM+Sba9QXsao4G3sxafnnAXKgcQZLH9
	qMi5C+nik6kdWoENPjPuF5EiHIneVQ5LjBCXvxnPcKipMN0qeWeOmwL91xOMR4tzZcEAJVTB1ThDt
	Ne73zWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKCn-00000008pyb-2mME;
	Fri, 05 Dec 2025 01:01:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKCk-00000008py6-1VWQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:01:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4KspuA1130941
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Dec 2025 01:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZm2g5nNkglyyKKMEeqfWJOYA3gt76o1OLI8bcXYgIo=; b=D7hZ+nBylP45i6GB
	4pM/Y4Y5iF/PbX8wn9/9m5H8vwUKmxLGh66o/DoW31gvEX3eCyXD3GYfTO+hHssT
	lo9Cw7jWT/3KEkndSNSyw7kRB7XuR1EOKABm9+XmTeh5gyPgKu5roIN5/Cw6B1S0
	TrVEF2T9MA8U5d48TcCLy5o8cQyclmGDiTZXcFeYTIgj2kfxFHLwdwusaQHoR9pl
	D5zGGprum54rIDGlqL7A5xHaRFBJD5kOVPoA8ls7Qm9EHnSuzSJLMItqle3Fekxx
	KtXqr+sQCkkBi2X+nH2Oxxz5+RGuTp0W8zH6x6PyMSdBuPClMGCqHqXQ4vfFWF7F
	RUmevg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f03kyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 01:01:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f11bso2856651a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764896506; x=1765501306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZm2g5nNkglyyKKMEeqfWJOYA3gt76o1OLI8bcXYgIo=;
        b=VDH8WCbcxdbqp2GfWv2nPhP5vEsZMmboYc9C8oBa25RCxE233hBa1ee4MKSGbaB0KP
         UuTMcPmzjxGqERE3ffg/fgVt5CSO/4iqf4zVkvlGnnYEtke8PpktPD2ZenurQ24tM5hd
         EnXMYE04pFna7i0CEkEdqQvDF/p1VXg3lByiWm3KCam+Ld8lPLhaxbyCcIEORtKLxbgd
         ACGPqObn6mvUXpcX7Gf3GzDQgs5kQ9L0OeP/pt1s9TPSXGsW64q8CKm9e4Xg69bGO7Sd
         unJiDCA+ZZg6TWy5lTflEfpbUqdj2ir+jOGJ5xjgGfsxM11Hm0tRC+Qy/orQA5IRRZjy
         2Ang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764896506; x=1765501306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZm2g5nNkglyyKKMEeqfWJOYA3gt76o1OLI8bcXYgIo=;
        b=gzXU9gXIPAySubzuxi7Wvao2fFINEgKKwOH4NFkkxwKK8ag5e1bvo3qeruw+pHxXOY
         pwKbf35Bw/A7WEB4vw++XXGe6PUyEGFAWfxqGST5dpsXFOxk5FF2Nf++Y+wrph2fGA+G
         +rL7cynjOJCp7qm9mqZJojrX2ILfdaaXGk5LkivDyHsggzvXsglqWtdaDIJ8MjjMtxBC
         pq35+RvQxU3y5uIC6IHNrb5mYTWc/HOP/xoUTn5aTfInulR8ttriMddYgTQk1N9Pt0Ga
         4tHejK68iCRXmm9uL77m33jz6xiW+kmMGkbYwpS4IUDgLPg3e6EI+EAwAx06FxLW2vvA
         yldg==
X-Forwarded-Encrypted: i=1; AJvYcCXY4UsPqGSBqyG1qKCQ9R+gkM25QjdMgTRLQXjpn+ZVkd0lW5g3GyF2JeWUkanin/5AoMZnSYiWNJ3EEMV8kF0U@lists.infradead.org
X-Gm-Message-State: AOJu0YwyOV4bGZJ2tEIXGuiFs1dLwQW7rVApsluEjwLSmt4FcrX1ZBCe
	VrhvV2KmAdDz9D3qwn51+Bfu+XqU6PTsE1CPg261+RHNZfmgZgAnxNrqR29OzhqAHdJEDBTCL40
	yaS+aUJoBTxlmR+fh9cEzsVq1xPIv6hC5YpLHPljhsFPNv0giCcSZvVzZA8ED5zyjfwgDLhZ4UO
	j8bKVB7oKc5D4u
X-Gm-Gg: ASbGncu9pp1THfdKeezoQRHuzluPCyKu3cLNqDCoHYZe9dSGvLG8IQcaG4S8ZymGyBx
	cBozOh5R9oc6aUDY6v6wnD9bTFleA8acz6GizHxJdJZTEFwmzrlxsFF486VxkD5OThtunrXSBxC
	0XejK72xqYxeQLQzVbku5oSp1jiDxL93pVU7ZA+fzjlK9BHk5XvIvquVUquoO2Kbs/lL/sUj0Lo
	xf4xj2uDmt2xXPffIks8COYrtOH9cqYFu/v8a25ZJAUomqZCb7MtyEtyXRI3bqz6Q2zzwSQO6w2
	LJBVYLSchChQm8YM5+JAjylmY5OV5ko2421qwM0zSKgs6+EhUsvLJ6gp7aOU/P51sl+45xJX86a
	zjp6ySvGlJqLAiO1eAt0IPXDrIMGQNS1rl+UCbhyCwcGFD+rQJR+aMxfBDQbnHrzFs4Y8bQ4Xbs
	g=
X-Received: by 2002:a17:90b:4a90:b0:340:9d52:44c1 with SMTP id 98e67ed59e1d1-349126d7e86mr8899582a91.35.1764896505741;
        Thu, 04 Dec 2025 17:01:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuNrtoD/MByzKqmpwNpzfm88ksJJLa1RGmf4ZiHiQ8wK7eQfyv8P/kaq9q+XRSCbK/zcVPfg==
X-Received: by 2002:a17:90b:4a90:b0:340:9d52:44c1 with SMTP id 98e67ed59e1d1-349126d7e86mr8899530a91.35.1764896505164;
        Thu, 04 Dec 2025 17:01:45 -0800 (PST)
Received: from [10.133.33.191] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494e84f446sm3060783a91.5.2025.12.04.17.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 17:01:44 -0800 (PST)
Message-ID: <bf6033e5-8429-482c-bf3b-adb8bc22711b@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 09:01:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
 <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
 <9c00516c-6e07-4c57-a1f1-6dfc32ab3a53@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <9c00516c-6e07-4c57-a1f1-6dfc32ab3a53@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 29MOChFC3kna_CEk1xne-KPmp0v2Bl1g
X-Proofpoint-ORIG-GUID: 29MOChFC3kna_CEk1xne-KPmp0v2Bl1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDAwNiBTYWx0ZWRfX69+/DglwgIRR
 Z8aLHz5QoVZkau33xNN5GMnoH4RRi1ctOkZR19T9TKWCtDarJLLRQ6Z/AWZRK27ykrAP6jT1ipi
 TRfH229dLaLTHVWqz1Zq9WijZQ8mR0gy2x54gx/jFgI9t02r/bEfRqynoHu33a+ZjRCaRA1ETLB
 M+6xwTdIN6oyiRPUyUUh+NV6wRONur2oo7G2XRSKFL39/09Bs2lOgpPscqQlaYb9wQ8hH7XlAkU
 G7SpVRQAwTibPG+MJopcVbQyMOO/9CwjKI+yxNlDtlowpY6NIuxpTGN3S4ob0je4E4n6bhjW1ZV
 VoCen7UuF4KXz2FOtcu4s+mGYXfEd+k51w99WFBznGaqXNLVQOXgQhbkyf8jx1177lDotoaiFMv
 7nP5CVkQnHEI17iQ/AsEPE1HU8cPZA==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69322efb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MQ8tZw8OEHbhgvfUyIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_170150_547830_38D5ABCD 
X-CRM114-Status: GOOD (  21.02  )
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


On 12/4/2025 5:22 PM, Suzuki K Poulose wrote:
> On 04/12/2025 02:53, Jie Gan wrote:
>>
>>
>> On 12/4/2025 2:14 AM, Suzuki K Poulose wrote:
>>> On 08/09/2025 03:01, Jie Gan wrote:
>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>> triggered
>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>> register
>>>> of CTCU device will enable the interrupt.
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>> ---
>>>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++ 
>>>> + + ++++++++++
>>>>   1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>> ctcu.yaml
>>>> index 843b52eaf872..ea05ad8f3dd3 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>> @@ -39,6 +39,16 @@ properties:
>>>>       items:
>>>>         - const: apb
>>>> +  interrupts:
>>>> +    items:
>>>> +      - description: Byte cntr interrupt for etr0
>>>> +      - description: Byte cntr interrupt for etr1
>>>> +
>>>> +  interrupt-names:
>>>> +    items:
>>>> +      - const: etr0
>>>> +      - const: etr1
>>>
>>
>> Hi Suzuki,
>>
>>> Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
>>> especially with the Linux driver naming things randomly for the TMC- 
>>> ETRs.
>>>
>>
>> Yes, it will cause misunderstandings since the "etr0" here may not the 
>> right device we are expecting.
>>
>>>
>>> What we want is the "port" number corresponding to the "TMC-ETR" being
>>> monitored ?
>>>
>>> Have you explored other options, "port-0", "port-1" ?
>>>
>>
>> I think it's much better. Will update in next version.
> 
> I am not sure if there exists a better scheme for identifying or
> numbering the interrupts. Happy to listen to the DT experts.
> 
> Rob, Krzysztof, thoughts ?
> 

Hi Suzuki,

I was thinking how about the name "ETRIRQ0", "ETRIRQ1" etc...

Thanks,
Jie

> Suzuki
> 
> 
>>
>> Thanks,
>> Jie
>>
>>> Suzuki
>>>
>>>> +
>>>>     in-ports:
>>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>> @@ -56,6 +66,8 @@ additionalProperties: false
>>>>   examples:
>>>>     - |
>>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>>       ctcu@1001000 {
>>>>           compatible = "qcom,sa8775p-ctcu";
>>>>           reg = <0x1001000 0x1000>;
>>>> @@ -63,6 +75,11 @@ examples:
>>>>           clocks = <&aoss_qmp>;
>>>>           clock-names = "apb";
>>>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>>>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>>>> +        interrupt-names = "etr0",
>>>> +                          "etr1";
>>>> +
>>>>           in-ports {
>>>>               #address-cells = <1>;
>>>>               #size-cells = <0>;
>>>>
>>>
>>>
>>
> 


