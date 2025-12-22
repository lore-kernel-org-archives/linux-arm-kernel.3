Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EDEE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=; b=HvSlPo/WUOXh5bDOoPkd59RXFn
	GOWC0vrmrnEbEDtByR1HS0gtlZBzo0wlEew+LCNXlrc4QBzja6bkEEKdxvGXU6stwDyBXtszt1O2H
	GBUecUaroTKHljyqB8Hz3Ejeg2SpImAnnSiQNWDf+Kb5XpSQC4zvC8ROaIbjSTb6fXCzi8DZYWDoX
	Im0Uh7OZldZQGctQ2WmeOKN0aqivrtzLLElYmLklG1qDhAVEhKT5/LlDvFwwD4ZZKAG/W8W7e3U2I
	jjQPk0pTrAmC1B2kNWDuC5Rl4hE7MGJ5U/wFR/mYIPNYRZVR+hZTgvfiiv+soYCaYktku102uiQIf
	wn5QzX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXc3E-0000000DVnu-2Ztx;
	Mon, 22 Dec 2025 09:18:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXc3C-0000000DVn6-28u2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:17:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7daVH4057050
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=; b=XvXHqyosqkf5mEuR
	Qqb93hukytJtYn4r/jdvksqJ/9Dl58okN3JXi6FD5b65ekgCxbDaQ0DGZAetNUtQ
	OZsjVyunQRYUDPa0nLU3fWHg5epJF2Knj7spqjvzo3vsYmna/Q63poOCGSohunoz
	IAybYcwQYbCkHbVxPV0qW4tdOCU/vonKo570GHztPgZiZWeQV7PCwkZKGKIPPhN+
	/Tg9cGFGacDVyQrMoHwfq1epfneViiCLp4+WM/G+i+qr1LMRDN7485aMjLElulKD
	2hj9e/QLf09OudkHLpyOuCbejxNsW6MeI7tr720CFcJm/jM0aE/TfSW/dorq/lqc
	kBaHFg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4ey5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 09:17:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba9c366057so6866506b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 01:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395075; x=1766999875; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=;
        b=QrLedzwX8OHq4Nd4c02TFVbVdGY9005RPYHmDjzVAX9hnSfjRYwjy6X5CTvcBiNdRG
         /RiPgtV5SqK6NTingHthmJx3LEu0nOGEK0wgcNx5wY1lNynTkkrEiw5/vPCVWpvNAXjj
         mynz+z8JMr4Ba/u2SdpTOZJtYWPGgkwOky1pgIZOgknsrYfnvEIKL4jELjx/Ex6lVfGL
         NirjaM39iDg32pmIJTQq2fQlDnGgz5xhqgMmRq2F6oF3GC2d3dQg3vRdNmgDXk/ZOYvL
         8vLXEdNltdwhi8Jvj98RzIK7WJAYm2OXa0t8e8rsyRbwGAXj50xgghqG243N/62caG/T
         KhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395075; x=1766999875;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=;
        b=IvCm7PU+WF3z+FGXBKxo/0ma+JvsaZJoD4aeLsudlaJ0GAw4aFilYXQ1+1TYDnrndd
         5oV0qAeoTtu4Qf1yODRcvcg3vo2Dp3WVUsgxxxnWOeL9WkPr5BfzUo9UAGGJJQRILu/3
         qu+qpHsUMiGYm2xO5TTGP5TP9U4i3muCUgE5HNlw4fD+H4mhKpN0kZoeOK+l9nFtH9O0
         WPIFYcHXJ/6K57sntgjbHBK7swzMmgEHj/rgEVddtvAXv70a+PCgMQf1p2ziKzTIBd8N
         53eAXonDum5liSw2dDu6d34385YhhizsjshPgi08g9nqur1FAHVNkQNbwm4zDd2kPGyn
         y84g==
X-Forwarded-Encrypted: i=1; AJvYcCWI8LKZGl2jXev47VEqb2MDCc94VE0/tsJyEwR3DTbde/eZ1waxla0QnsFGc+zLX0x8FQsqebkkOFOE2vetqPUK@lists.infradead.org
X-Gm-Message-State: AOJu0YyhicplSpfxoYTMLlCGAKva3vkAgK0s9BQmu2fqw3+TmNs738Mj
	0wwYFLMY2gFf7uv1Arm1nWb5kByAg/wlISCDbPbHMsp2Mf7x7auArK20gV6aLbU2vOgac5HQhXL
	dbws3WSOPJiwpFp5KunC1fa1XvH/uXdb88WFJb8bxxOD7QPKuBta6I9Df0xdjxwovsjNfvUQZtM
	2L3A==
X-Gm-Gg: AY/fxX51Mlj+Y8RhqUByiLZkkEXa4rV23L0Iy1mvwi9R6ia3xLZL+1Phc593zCW2PEZ
	6IxH/0Kcs1w5hysEqPsa21nSAL9XqGBazotXQcOAx9t/iry+s6ehgV4xQ3O0DBDqC/vJ/g3UMiB
	sTOh02BUqcVjEGk9FM1LvKf/z2E27Zx3QXxtYAsquOLR7HuIJV9FZQ2Yvc8ZoaUOKxf5c/yRg9F
	fPP1olGjDlWtMOPF+X5peM8s4FriFh4eX8Ip6CLCwa7fVLQa8wrCUmEL+fmHFjQ0mgt48Jv/D/x
	73hG5V6vG7YItYa0u6mRTnnlvsR907xL9Kgs0JhqQwqeVEZm3iUQwe2IFNVHHKhkd1ZDySZlaNM
	v+AO/RDURnr6YvgVMqucYb638DETKmAJawf7mUtya3G4+kdUHbvVQJwY7NevxgAF9dheHCxexok
	w=
X-Received: by 2002:a05:6a00:1f0c:b0:7e8:450c:619e with SMTP id d2e1a72fcca58-7ff66a6ecc7mr9498831b3a.53.1766395075417;
        Mon, 22 Dec 2025 01:17:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd//VFkRIKO2NQ60cGR2Kj8FVATZRob9N42xXZZ8fStzRji1TPzSanp6ObU6Qgk0zmCu+JNg==
X-Received: by 2002:a05:6a00:1f0c:b0:7e8:450c:619e with SMTP id d2e1a72fcca58-7ff66a6ecc7mr9498800b3a.53.1766395074881;
        Mon, 22 Dec 2025 01:17:54 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e588a30sm9833430b3a.55.2025.12.22.01.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:17:54 -0800 (PST)
Message-ID: <01072c94-3a13-459c-baba-0cc2f3611ff9@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:17:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Mike Leach <mike.leach@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <20251211133723.GA859302-robh@kernel.org>
 <dfa43a63-ca14-4dd7-a7ab-acd95748a8b9@oss.qualcomm.com>
 <a9537dc9-c767-4909-8b1c-6e939ce4f3fc@kernel.org>
 <2db74a3e-4aeb-4e87-9fe8-5c9693bfb67c@arm.com>
 <46afd4f6-f287-4d19-bc68-f2f6eac36e6a@oss.qualcomm.com>
 <95ac571a-1c8f-45d9-9874-648d4123ce18@arm.com>
 <097dbefb-f679-40da-bce4-d6e09dc4cf08@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <097dbefb-f679-40da-bce4-d6e09dc4cf08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FygiyDcwoMwL3MRospAHyieJuk_9xYxa
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69490cc5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BUuRoenLQBXCPULKYeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FygiyDcwoMwL3MRospAHyieJuk_9xYxa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfX6IpUkv9S85RH
 99A7apZzvzTPiOu/ywX7fWU7NK+npKTdngTTTmOfTFu97SeIRW/JJ8RgDBevxHa70MGw29T3eJE
 k959kOsqkzv06rGkSePEf+1gRVdgY+OYkm9O9ha5ESD1vzTW+Itv4BcXdfWAZZoD0euvxAV1YHt
 rsAFuIzH0nzttPdIqaou3qMsyOc1jqZxkgBxYPbHq0b1jPe36Sas0cz7T5muYm4xkL2gysDQVwC
 XqXNC/1+71F2He5uvy5lFeNOn+PuDvwfmor/Ot4IQEwnA+rFpsOsDDz8QM076pUFc6DHpllX4le
 3dUsEMeQT+znaxOkvB/BhgxGX1xdst4P9yqsPzJrRYQ0yg6ETf3H2mFIwBUQ4eUveCV/uqjsjpU
 MhnpY1/Vh51CMW9JA+nTsU4PJdixzHQNMUzDsK2pDTBza/gkz78XYPe/sJbt6PmZoXE/OxgrnXP
 8EgccoN2RwICpoJ/thg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_011758_669113_6AFEAE3E 
X-CRM114-Status: GOOD (  34.67  )
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



On 12/22/2025 2:58 PM, Jie Gan wrote:
> 
> 
> On 12/19/2025 5:54 PM, Suzuki K Poulose wrote:
>> On 19/12/2025 02:05, Jie Gan wrote:
>>>
>>>
>>> On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
>>>> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>>>>> On 12/12/2025 02:12, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>>>>> triggered
>>>>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>>>>> register
>>>>>>>> of CTCU device will enable the interrupt.
>>>>>>>>
>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 
>>>>>>>> + + + ++++++++++++++
>>>>>>>>    1 file changed, 17 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/ 
>>>>>>>> qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/ 
>>>>>>>> arm/qcom,coresight- ctcu.yaml
>>>>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>>>>> ctcu.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>>>>> ctcu.yaml
>>>>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>>>>        items:
>>>>>>>>          - const: apb
>>>>>>>> +  interrupts:
>>>>>>>> +    items:
>>>>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>>>>> +      - description: Byte cntr interrupt for the second etr device
>>>>
>>>> This is really vague. How do you define first vs second ? Probe order ?
>>>> No way. This must be the "port" number to which the ETR is connected
>>>> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
>>>> filter) connected to the CTCU. I was under the assumption that they
>>>> are identified as "ports" (input ports). I don't really understand how
>>>> this interrupt mapping works now. Please explain it clearly.
>>>>
>>>
>>> Sorry for the misunderstanding.
>>>
>>> Each ETR device should have its own interrupt line and an IRQ 
>>> register within the CTCU device, as defined by the specification. In 
>>> existing projects, the maximum supported number of ETR devices is 2.
>>>
>>> Each interrupt is directly mapped to a specific ETR device, for example:
>>> tmc@1000 → interrupt line 0
>>> tmc@1001 → interrupt line 1
>>>
>>> The suggestion to identify devices by ‘ports’ is much clearer than my 
>>> previous explanation, as it explicitly shows which device is 
>>> connected to which port.
>>
>> Thanks for confirming.
>>
>>>
>>>>>>>> +
>>>>>>>> +  interrupt-names:
>>>>>>>> +    items:
>>>>>>>> +      - const: etrirq0
>>>>>>>> +      - const: etrirq1
>>>>>>>
>>>>>>> Names are kind of pointless when it is just foo<index>.
>>>>>>
>>>>>> Hi Rob,
>>>>>>
>>>>>> I was naming them as etr0/etr1. Are these names acceptable?
>>>>>
>>>>> Obviously irq is redundant, but how does etr0 solves the problem of
>>>>> calling it foo0?
>>>>>
>>>>> I don't think you really read Rob's comment.
>>>>>
>>>>>> The interrupts are assigned exclusively to a specific ETR device.
>>>>>>
>>>>>> But Suzuki is concerned that this might cause confusion because 
>>>>>> the ETR
>>>>>> device is named randomly in the driver. Suzuki suggested using 
>>>>>> ‘port-0’
>>>>>> and ‘port-1’ and would also like to hear your feedback on these 
>>>>>> names.
>>>>>
>>>>> There is no confusion here. Writing bindings luckily clarifies this 
>>>>> what
>>>>> the indices in the array mean.
>>>>
>>>> The point is there are "n" interrupts. Question is, could there be more
>>>> devices(ETRs) connected to the CTCU than "n".
>>>>
>>>> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
>>>>
>>>> TMC-ETR0 -> CTCU-Port0
>>>>
>>>> TMC-ETR1 -> CTCU-Port2
>>>> TMC-ETR2 -> CTCU-Port3
>>>>
>>>> Now, how many interrupts are described in the DT ? How do we map which
>>>> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
>>>> from the port is possible, with the topology).
>>>>
>>>
>>> Got your point and it's much clearer.
>>>
>>>> This is what I raised in the previous version. Again, happy to hear
>>>> if there is a standard way to describe the interrupts.
>>>>
>>>> Suzuki
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Usually, the probe sequence follows the order of the addresses. In 
>>>>>> our
>>>>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its 
>>>>>> address
>>>>>> is lower.
>>>>>
>>>>> How is this even relevant? You are answering to something completely
>>>>> different, so I don't think you really tried to understand review.
>>>>>
>>>
>>> My previous explanation was definitely unclear. As Suzuki suggested, 
>>> mapping the interrupt to the port number (to identify the relevant 
>>> device based on topology) makes sense and provides a much easier way 
>>> to understand the relationship between the interrupt and the ETR device.
>>>
>>> So with the suggestion, here is the new description about the 
>>> interrupts:
>>>
>>>    interrupts:
>>>      items:
>>>        - description: Interrupt for the ETR device connected to in- 
>>> port0.
>>>        - description: Interrupt for the ETR device connected to in- 
>>> port1.
>>>
>>>   interrupt-names:
>>>      items:
>>>       - const: port0
>>>       - const: port1
>>
>> Which brings us back to the question I posted in the previous version. 
>> Do we really need a "name" or are there other ways to define, a sparse
>> list of interrupts ?
>>
> 
> Each interrupt is dedicated to a specific ETR device. While we can 
> retrieve the list of interrupts using of_irq_get, we cannot guarantee 
> that the obtained interrupt corresponds to the correct ETR device?
> I believe it would be better to have an interrupt-name property, so we 
> can assign the name in the data structure and retrieve the interrupt by 
> its name, ensuring it maps to the correct ETR device.

I have tried to get the interrupt with of_irq_get(nd, port_number).

If we define the interrupts in the correct sequence aligned with the 
port numbers, we can then retrieve each interrupt by its corresponding 
port number.

Is that ok to drop the interrupt-name with the solution?

Thanks,
Jie

> 
> Thanks,
> Jie
> 
> 
> 


