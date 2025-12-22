Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40457E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=; b=SJgHR6rpbJlvl+t2tR5FMqk8WC
	+szS5KWReLpiZUSKFs7KhqRM68KSvMQjZBMrDgajFkqwK1LC7nnfN4LfkZpLwk+sErl7X/4Ikofj2
	JtdJeAskXaFaEGKtbyFzC0McC7JoCDRjprmey+lesNWaAyZ/iI2d3vf1tpGJcIZ0dtvER+dOV/O+z
	EDmsKmA9boY8PLhF0AnyflLIGReXn//h4LS5676j2B/KFha+jcBbG3MtMoBnZGRLypolwGuEC9c5m
	6INcCk3CgOFz8YvytQ87Qp3uyhHHzBpr5TeatFRlyre5M1Rp2qJ54iYz9GL/LxIqYR5Fjj4oL4Wuk
	xUHn7yyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZsg-0000000DKt7-1bZS;
	Mon, 22 Dec 2025 06:58:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZse-0000000DKsj-2Q6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:58:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM1iDR83962357
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=; b=JOKWRQT/Rb5Me+Q0
	IADVjaPsTvHas15qk1e4hTv0HmtQWVt32pwpLO7ZhwLBuQgwxuyXkbeEbOOYHcD7
	zAfxBttIlnzjdNDMSQXdHLS6/lNEDkqu/z8tlp1FDjqXeZ+ofaE18ADp5EB0/uLV
	UYFajkuRb6//ncxlhA+sA6SpKy1qbddJoNTHxmLuWh0gPXC2ufaGKZshVw6uNdyz
	Xsn8Kw8bsE82CT3itnV8H3wmHX8e2PyZzd0Ckra5cwq4dV/8Yl9Dx/IpO+E+n78E
	Q+x9uJbVlzKXkm6mDWz1E2L3TRkPEN/nICrUS6KJSW/AXfM5B/GO9lXDqjnrFxHD
	vBpI3w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6grtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:58:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c1df71b076so7401310b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766386735; x=1766991535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=;
        b=VeUnsFxvnq11AdCvQSg0hqIBiZr1fRgoD+6642+b8PmLWWFQt+sfb+y+2GBRc+63a3
         F4ZCGyRF+PzmZZQQ4Zv5orI3vXl6Mvo4eMneD9qUC3JqNtvbgfVRXOjJVfZRUs61i+f9
         rpA6Hv3dcWh5mB2S92TGXOs6lgBMH1Xr2ATS38l25uLr3x450PNzdcDwkSrqIqY/PVn3
         LlvE0FzvDBspHY8xckN8JNnS0KrtTNwMGkthDg92GwVpGwitS58CsMKSfOy5wObv+SGW
         OEBp0mFSzobWJELNg0YKErIAajJ8iwoX/uJvYpQRzERc86kW6rluXTTJ7KcLkGomHD9i
         2EOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766386735; x=1766991535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=;
        b=B1xXGdquSP3g7Se4qVusvNmxads6jZjSUlS5GWBEMOOyxUUD3e5KbYAXwhDMLeIBh6
         qDgtbghBsuIO1RgT2NS5pgw1Ih3OXjSFsCjdFl1tUjtvVfQN/exxgGJi3F1LGCtUDfPc
         mFnLpoLtBXU+cYY51CvZOMZTxwgc7VZCGbK1ZEzsfh459hZiwWD3dmIcuFZOt3AB9pdD
         91/6QRAB3PyUAJOv3ix2RiDUQykUMx6xWAvm/QuLzhtpVRoWRk9N93DNMow9uW+TvfDJ
         w9KC503PO8RWC22d90WmeahDG7ziXvoqVvH7XKztAZ6MdiG9WwMFeWPFdyGRBbUvRlkf
         ESOQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2raxwF4lIdETiQaTqZcB9QxAt69sydkhV7vzQ2vtKaG58YVKawI/kcJuxKjJS9Ecta3D55Rd0PnrkOSqD4JVc@lists.infradead.org
X-Gm-Message-State: AOJu0YzvyqgcsrDg4pPCHnHVBo4ZyFokQtNYVKseZizg8AFr/qB9ZlQS
	ovann35zXKaJ9qwnQkiYyzn3bWLE+i2rGBecXUjL2YoEx53P1RfwTTSiP84Aqh0YIlWqP063xUE
	S+NW0xKAhPCuV+TZQxbjYloILLn17t1at3XoeDiEFpv1CbtUB8mdbOgglEmVhWIsmCmLCncIb9D
	Mncg==
X-Gm-Gg: AY/fxX5JecZDflo15KGN7zgzwPWx3fJmvMgzdwDtBtmvZLcx9gYEw+bKyME7/NQLQuk
	1d+9iVgTGunAEeaBVV8cwwXD23XUyz708Wj6jeXcPdQC9e8fjgLhoqLCV8FfMU4E92bM9gVb09i
	dxIojHxjyRVc82PCccdUFGahC256Y9X8guJpqNLvjk/SXiI0k79cu3UULRcLBG1jmvTMeVZC+Zt
	2kgX6ey5+ZcIEDAPUDl+8wzFX9MkqbZkaSsVeeKp9MfE703SJtY3MWkHs823ii+CKjMmKuHQc3d
	3dVaRKv39xDaheR8ku9LuvSiIECWjkxZ0gmL696sMWEzL/4SFkgsl4Ew35SHgow8QEXgPcz1JIK
	oo9qOtWvNi02LQwI9WxoQ32ElVsyLYiX5m+kmK8VuJnaL2CcdDjUNrlGQWdqO9nxSt5stS8rKcI
	8=
X-Received: by 2002:a05:6a00:7613:b0:7ff:acc3:2f40 with SMTP id d2e1a72fcca58-7ffacc33e69mr7059157b3a.26.1766386735123;
        Sun, 21 Dec 2025 22:58:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO+6I8pHuD+xmFtIYOJqkUxAi0nAsXhcjYzo9deCdZ2wwdODhLF8KzB5WTxUNjuepx5+QCTg==
X-Received: by 2002:a05:6a00:7613:b0:7ff:acc3:2f40 with SMTP id d2e1a72fcca58-7ffacc33e69mr7059129b3a.26.1766386734539;
        Sun, 21 Dec 2025 22:58:54 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a1a2asm9254539b3a.41.2025.12.21.22.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 22:58:54 -0800 (PST)
Message-ID: <097dbefb-f679-40da-bce4-d6e09dc4cf08@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:58:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <95ac571a-1c8f-45d9-9874-648d4123ce18@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3AQfvnVgn8cObhzn12oszSlExtYMpe7s
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=6948ec2f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W9kkhuXnUgcddjO-hjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2MSBTYWx0ZWRfX9SrO2J3ti1ws
 KPpC4nqXOGYSu9ZuZ1bMn3BmpKoJJxE4dfz9lxJua7MPbuu/+vZkqsqPrX614tUKNfkKJe11zF+
 opyZCZrFsg6rU1aczSj3ZoqwQbG0vykyiCDInCu4r4sQ4+uAWZ8UyUPuQRYSMUIgPqUr2czPLBX
 5W87o62g0ozaTqihzZZzGwMmdc8BYFqg/asR7mf9Sj4vYjngTf0OgmsyW0aTq5yFWfVbfnnCJ40
 wqA21Jfz+KzcbI9bKSgCRchZXANZxe75eGaR1TooEXiG9sSahsVpghrKDBLN59SijGqpqulowhY
 EEKZzN9pMafWEgycS1znF89titSWa5ZuHy+yP3TtcTDJW/Upvl7gWWa8tO8oqJoqwuaoG+5X/df
 G1qshVnShbP0jZbwoK4rL9166c+qnQre8vvOj3iTelZNKNIRKSR6tzy1TCoy2JDNWEiGrdMOLs6
 4JNWs3eV9ZSXyaDkw6Q==
X-Proofpoint-GUID: 3AQfvnVgn8cObhzn12oszSlExtYMpe7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_225856_724598_3259ACDC 
X-CRM114-Status: GOOD (  35.25  )
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



On 12/19/2025 5:54 PM, Suzuki K Poulose wrote:
> On 19/12/2025 02:05, Jie Gan wrote:
>>
>>
>> On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
>>> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>>>> On 12/12/2025 02:12, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>>>> triggered
>>>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>>>> register
>>>>>>> of CTCU device will enable the interrupt.
>>>>>>>
>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 + 
>>>>>>> + + ++++++++++++++
>>>>>>>    1 file changed, 17 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/ 
>>>>>>> qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/ 
>>>>>>> arm/qcom,coresight- ctcu.yaml
>>>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>>>        items:
>>>>>>>          - const: apb
>>>>>>> +  interrupts:
>>>>>>> +    items:
>>>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>>>> +      - description: Byte cntr interrupt for the second etr device
>>>
>>> This is really vague. How do you define first vs second ? Probe order ?
>>> No way. This must be the "port" number to which the ETR is connected
>>> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
>>> filter) connected to the CTCU. I was under the assumption that they
>>> are identified as "ports" (input ports). I don't really understand how
>>> this interrupt mapping works now. Please explain it clearly.
>>>
>>
>> Sorry for the misunderstanding.
>>
>> Each ETR device should have its own interrupt line and an IRQ register 
>> within the CTCU device, as defined by the specification. In existing 
>> projects, the maximum supported number of ETR devices is 2.
>>
>> Each interrupt is directly mapped to a specific ETR device, for example:
>> tmc@1000 → interrupt line 0
>> tmc@1001 → interrupt line 1
>>
>> The suggestion to identify devices by ‘ports’ is much clearer than my 
>> previous explanation, as it explicitly shows which device is connected 
>> to which port.
> 
> Thanks for confirming.
> 
>>
>>>>>>> +
>>>>>>> +  interrupt-names:
>>>>>>> +    items:
>>>>>>> +      - const: etrirq0
>>>>>>> +      - const: etrirq1
>>>>>>
>>>>>> Names are kind of pointless when it is just foo<index>.
>>>>>
>>>>> Hi Rob,
>>>>>
>>>>> I was naming them as etr0/etr1. Are these names acceptable?
>>>>
>>>> Obviously irq is redundant, but how does etr0 solves the problem of
>>>> calling it foo0?
>>>>
>>>> I don't think you really read Rob's comment.
>>>>
>>>>> The interrupts are assigned exclusively to a specific ETR device.
>>>>>
>>>>> But Suzuki is concerned that this might cause confusion because the 
>>>>> ETR
>>>>> device is named randomly in the driver. Suzuki suggested using 
>>>>> ‘port-0’
>>>>> and ‘port-1’ and would also like to hear your feedback on these names.
>>>>
>>>> There is no confusion here. Writing bindings luckily clarifies this 
>>>> what
>>>> the indices in the array mean.
>>>
>>> The point is there are "n" interrupts. Question is, could there be more
>>> devices(ETRs) connected to the CTCU than "n".
>>>
>>> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
>>>
>>> TMC-ETR0 -> CTCU-Port0
>>>
>>> TMC-ETR1 -> CTCU-Port2
>>> TMC-ETR2 -> CTCU-Port3
>>>
>>> Now, how many interrupts are described in the DT ? How do we map which
>>> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
>>> from the port is possible, with the topology).
>>>
>>
>> Got your point and it's much clearer.
>>
>>> This is what I raised in the previous version. Again, happy to hear
>>> if there is a standard way to describe the interrupts.
>>>
>>> Suzuki
>>>
>>>
>>>>
>>>>>
>>>>> Usually, the probe sequence follows the order of the addresses. In our
>>>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its 
>>>>> address
>>>>> is lower.
>>>>
>>>> How is this even relevant? You are answering to something completely
>>>> different, so I don't think you really tried to understand review.
>>>>
>>
>> My previous explanation was definitely unclear. As Suzuki suggested, 
>> mapping the interrupt to the port number (to identify the relevant 
>> device based on topology) makes sense and provides a much easier way 
>> to understand the relationship between the interrupt and the ETR device.
>>
>> So with the suggestion, here is the new description about the interrupts:
>>
>>    interrupts:
>>      items:
>>        - description: Interrupt for the ETR device connected to in-port0.
>>        - description: Interrupt for the ETR device connected to in-port1.
>>
>>   interrupt-names:
>>      items:
>>       - const: port0
>>       - const: port1
> 
> Which brings us back to the question I posted in the previous version. 
> Do we really need a "name" or are there other ways to define, a sparse
> list of interrupts ?
> 

Each interrupt is dedicated to a specific ETR device. While we can 
retrieve the list of interrupts using of_irq_get, we cannot guarantee 
that the obtained interrupt corresponds to the correct ETR device?
I believe it would be better to have an interrupt-name property, so we 
can assign the name in the data structure and retrieve the interrupt by 
its name, ensuring it maps to the correct ETR device.

Thanks,
Jie



