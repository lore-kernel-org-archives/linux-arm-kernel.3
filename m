Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E68D70E0C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=; b=khDkRKZvfVQp8JBjB8/IByVnVz
	VGOOejPoquupOW9FVdy1eA/nGCUjPcf6SXgePuFriWl8cUhi/NQXoz1ku/sVLcPsWWGA7WZ3HIMV1
	6PN5gBnCNtMs8+2g6HRsJVCSoHxZhjPWdAy4MvUi00n7WAHf8D2ovS8OXxBZsARcCC62eH7q4Z5ca
	h1R7R4+u1oTIYUopOKMXX08KwTLujWgmGboJX/gb1Y+z7oXrOzfOyIGG4vToOapOHhklUXCLLazjb
	WRkppInz7IQ27WyhlXzh14chDwW5H26J9R1BaCOp/XCyydxGBCnCvK2UJsBX8gbux9OthU1Gi/B0c
	uZ1Lr71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPro-00000009TGA-1Csr;
	Fri, 19 Dec 2025 02:05:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPrl-00000009TFf-10d0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 02:05:14 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BILloq43245709
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=; b=L2sWY4AKIxkhFoEQ
	BXtNdaJ2lVg0sWy6UgMl9pi/9zGZhKa2rARZq66DjSyGKcwXXuy/3HUJRkMCQyxO
	rfnJIzCm13yDZyQJWZ7jnR9R2pm2K0cDdx+rhxJIoO5DMv1lQ/WL4MbKfg1pNSvV
	rW3HhcRkOMUB6p2I8XIwCKKFFcEFSH7SzSXKTKHcw8bdf0d7jYoRi0AEhm5n3UDd
	5wZVq6xEosWKHkZg944LRNQZ549il2KxlVDtdJt/DqXYavwSIwaad6hVEwKqO265
	l1BC+VOKZBDtoV62nwAxoDou4I2art9MQjSwaci2UW3/gGwqMjB/kUwkw0eycq8S
	LFL/Eg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c0uau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:05:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso23405325ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 18:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766109912; x=1766714712; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=;
        b=ZTZupdMpHwp+CeQtykXyNaUD1aJLq6hXxotIgdbmtdQRAkKnkfzd6uvWqdYUJrPhhA
         yqLjm4Gwfd8LVTt0098y8OEBABFzJPe6Bh/luaZj0tjTQwbVXvB58VVZQN8wBEnVVpxy
         tjZRvRNKbjqKpLOJYiIKtwsaB6XpZrIb1srijzjlHfmKMmLoXMZdp7s+eXWLGDLDqOJ8
         b40CroRuLagIpPexpBCkiKITxAeT6qT1HC42M1ZLjZrMLTT0vNS8O81qkhD2Bf7j2JSo
         ejF0rOS76/kmaUupaxdJf9aXbcWl5SbjC+/DBhIBriF5Bod/26HBjIUD9cJE1SVWw/pY
         fIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109912; x=1766714712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=;
        b=rCwg4LUfNSOS7c9eC+UjjtvQ6N1hUUPeYxsVIDAYtRdyNUxgBgLovTJ9XpZwKx2T8e
         cqeTxQIQJFel85cSGXPMCqtFhIUY8czG21KgsREhPp+8jcGyp4DiLE5LU4Ag+9r7zCFr
         OjwY9iFCQ/bwu6sC8rcYZr0HCzqqKmjwXYnv1GSN94p6GcMh4emh+pEMKsjogB3C1wnQ
         XD4BYWtY0wiFJSV4UGzPtFjd0U1AmPtL6s6yqvgBSAcJDGNZIO87iIAM5BoSNemw07VH
         3rTXpXUWiKp/5HQfait0uscH3mxMUtt9iu7qGXQ3xa3b0ioHlMKUjs9s+z2XIX5/npqd
         dTXw==
X-Forwarded-Encrypted: i=1; AJvYcCUry46d26IK+2IYxr90C4U7LLM0yT4//9G8YciUueqqfUwxjQIpAtQU94nZqTBIL2tNXK0w4dUj442QsucR4w3x@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7R+iHL2347tW+Iw+jsZ+r3Q9evx4o+FRGjg1u2P01PETy0JIz
	CohiFduSWkFl4RoQiQy8CTM/rCbLft84QqGrFTIqxdG0l1PNeKYJlN9a86YLuPNK4A3xhwJKgsp
	pP4VqHl/DWwV1EGWxDKsaIQoi5FGBL6+v5h8r3EWrGRpMadvpyMW3I+ApKbYVT17IThQFvK6r3Y
	ipKA==
X-Gm-Gg: AY/fxX6fcG8rJG/9DOpg6dHeaocZHYdzzZZyAmIyQGI95zzGEVLuvdsZMALUJozl3WO
	pBpkRzcsLyiZ90F9N8J0tHzJ/IRu3wFn8eOjO+X77iTKjFfMtCIRgVNor0YQRq8OJUQyDLW1qyM
	r6KilpGMf01lRDmOU0Wj38+B79jC5TbRJuD+ihoS0wloOapR0usS2qPd4dpK+eU9wA8yb2sYDEC
	KZtYPNBE4hRbOT1s5eBIX9CeY/fs6gv8yUTCh1WnreXPgfR9zNpD/dmMxg4/CwwgBAq5qC3Skmp
	1cDppiSqvvi6zZn+El8fuaokt/Kyk2Y4Ay8OOv75BgRZqU0mEvWRwq9Rt0RfjSN4EohG8GNaI4Z
	0T94ZnPTa5z5PZfO+BGVAjL1oUH9c9kPsyQkvB7FK0MDqC7fH7ohCBZy0V0YO+ACMAqw2qRAkGB
	Q=
X-Received: by 2002:a05:6a21:6d9e:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-376a75ef388mr1339450637.4.1766109911844;
        Thu, 18 Dec 2025 18:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENweru9eTuM8/f/hzvfINoPNb14Iccv5nkKoLSJUQfoBqv5hSIXuuu8B1IOuUhk1nYq6XY7Q==
X-Received: by 2002:a05:6a21:6d9e:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-376a75ef388mr1339414637.4.1766109911303;
        Thu, 18 Dec 2025 18:05:11 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm516718a12.5.2025.12.18.18.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 18:05:10 -0800 (PST)
Message-ID: <46afd4f6-f287-4d19-bc68-f2f6eac36e6a@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 10:05:03 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <2db74a3e-4aeb-4e87-9fe8-5c9693bfb67c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAxNSBTYWx0ZWRfX16Ucmqg3zgvb
 tVuG2XrjcZNFJfpuHL4A3vhA/JaJu/MpdyYaA3HHURMTZ6BhGUSXY8Rc+/WAEwhp2n9hiahuJHV
 1TGfb9n417kSOOKfGS/lQpXBkyxE6cnNcqOSmstwsJehPjxpDQyvDzUAq+/z/TyvqoOWUt16mSz
 5+SJCDpDwR7ORWkNaOvWnRXUR4PZsRlDyAa23+oVXbMS2oe1N/0jdxCozqJTiIFq994qepe0+GK
 rBtPiEPtmk2TMuo43kvYM5zG2pXZ/VQ70xZuwD/kZZkEo/+vbqA/md5IW+YAH1qH+H0qQogktCc
 9IQzID/wVIFBSIPqNTfUKuz2TfXtzXT4nWiAdDW3IM3jcwxj33V4Civr89jajZF7vQSA6fPl28W
 fCGjkZQUw174df2unErKRSEYGKqoBCk7BQkVp9AuYmfnP2sDqbPZFbNjowM0NXyP+5aFxY36SrR
 rMfVwwhkSo3MqyBHE+w==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=6944b2d8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aQ7FMZSyy468aWolCDYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tXeMQOu1BSam6ib2ahNolYrSf5A76QhM
X-Proofpoint-GUID: tXeMQOu1BSam6ib2ahNolYrSf5A76QhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_180513_286849_7A7FB161 
X-CRM114-Status: GOOD (  34.58  )
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



On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>> On 12/12/2025 02:12, Jie Gan wrote:
>>>
>>>
>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>> triggered
>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>> register
>>>>> of CTCU device will enable the interrupt.
>>>>>
>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++ 
>>>>> ++++++++++++++
>>>>>    1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>> ctcu.yaml
>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>        items:
>>>>>          - const: apb
>>>>> +  interrupts:
>>>>> +    items:
>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>> +      - description: Byte cntr interrupt for the second etr device
> 
> This is really vague. How do you define first vs second ? Probe order ?
> No way. This must be the "port" number to which the ETR is connected
> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
> filter) connected to the CTCU. I was under the assumption that they
> are identified as "ports" (input ports). I don't really understand how
> this interrupt mapping works now. Please explain it clearly.
> 

Sorry for the misunderstanding.

Each ETR device should have its own interrupt line and an IRQ register 
within the CTCU device, as defined by the specification. In existing 
projects, the maximum supported number of ETR devices is 2.

Each interrupt is directly mapped to a specific ETR device, for example:
tmc@1000 → interrupt line 0
tmc@1001 → interrupt line 1

The suggestion to identify devices by ‘ports’ is much clearer than my 
previous explanation, as it explicitly shows which device is connected 
to which port.

>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: etrirq0
>>>>> +      - const: etrirq1
>>>>
>>>> Names are kind of pointless when it is just foo<index>.
>>>
>>> Hi Rob,
>>>
>>> I was naming them as etr0/etr1. Are these names acceptable?
>>
>> Obviously irq is redundant, but how does etr0 solves the problem of
>> calling it foo0?
>>
>> I don't think you really read Rob's comment.
>>
>>> The interrupts are assigned exclusively to a specific ETR device.
>>>
>>> But Suzuki is concerned that this might cause confusion because the ETR
>>> device is named randomly in the driver. Suzuki suggested using ‘port-0’
>>> and ‘port-1’ and would also like to hear your feedback on these names.
>>
>> There is no confusion here. Writing bindings luckily clarifies this what
>> the indices in the array mean.
> 
> The point is there are "n" interrupts. Question is, could there be more
> devices(ETRs) connected to the CTCU than "n".
> 
> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
> 
> TMC-ETR0 -> CTCU-Port0
> 
> TMC-ETR1 -> CTCU-Port2
> TMC-ETR2 -> CTCU-Port3
> 
> Now, how many interrupts are described in the DT ? How do we map which
> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
> from the port is possible, with the topology).
> 

Got your point and it's much clearer.

> This is what I raised in the previous version. Again, happy to hear
> if there is a standard way to describe the interrupts.
> 
> Suzuki
> 
> 
>>
>>>
>>> Usually, the probe sequence follows the order of the addresses. In our
>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its address
>>> is lower.
>>
>> How is this even relevant? You are answering to something completely
>> different, so I don't think you really tried to understand review.
>>

My previous explanation was definitely unclear. As Suzuki suggested, 
mapping the interrupt to the port number (to identify the relevant 
device based on topology) makes sense and provides a much easier way to 
understand the relationship between the interrupt and the ETR device.

So with the suggestion, here is the new description about the interrupts:

   interrupts:
     items:
       - description: Interrupt for the ETR device connected to in-port0.
       - description: Interrupt for the ETR device connected to in-port1.

  interrupt-names:
     items:
      - const: port0
      - const: port1

Thanks,
Jie

>>
>>
>> Best regards,
>> Krzysztof
> 


