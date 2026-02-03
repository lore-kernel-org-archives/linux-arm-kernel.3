Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D48E8307B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=; b=b/xUKioYchJ8NfSy6PBH7ENzll
	Ds6VsOQ6ZcYERL1NKxSBHityN4/6LjA8DIz32VtRxgMFaScaSJ2sfQLYmNcbR437BRjTkw+2KY/jb
	ahrot2nYcNcno8TyO+ynv2o7J9abrZPALwl3NElGGW131xFHV8zx94i9+c34vt1PSt37lAlJgM+eb
	LbLHFF9Id42ePSgFg5PjYH1iC9qzgQ9dp8V924tA0/ndWkfTVMjj8PpJXflQJPsPtclheb6jBMtJX
	BwQG9fjIsHRwE/0yDkAuRwvtfg69FC8eix4erTYC63oSDwT9bpGOHutQdiNnDaVfa99nmRJLA+Vm+
	2eTYJWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDPS-00000006SEv-3ovI;
	Tue, 03 Feb 2026 10:13:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDPQ-00000006SES-2hLP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:13:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6137eqcP255196
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=; b=BznxzEMpxOC8eLdf
	xvXw3ohy3CDDPKAE4wlvMy4u/NISLVjYJ5Lea1nUG33rEhe9NeAoh2LoART7Tc7L
	cpwQTSGML+WyW5Q8AktnWNaYmKz2NzpL1zrKNIPshlXfmUe4SqcM/VkH1HRkYIwx
	WXeTrDl1IU2HKkbLsEZcW5yMY4h8mbjhqOY8OHsUYl8wBTe5zWb34JLaJTMdd+tu
	39F29BJA1kjPoLSdTRuH2MwNeVE0lWJ4vSLQpt1vflh7GdC7bdfJhFXEl6IdO/hi
	TnvEHuF2TogMUOlCcMIcxaFnsiskmn+MOUJ3jrEOuumJQoThwZeVOCaoP56Rl+GT
	VCqQ7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kknt7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:13:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c533f07450so140701285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 02:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770113603; x=1770718403; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=;
        b=aS2e8llsylftPJd2jdlISwbgNkLkLxHFhJflPJUrKS/9RxtKQzzcxIrOyW8hdib9vb
         ri37A2nAlPSKjqQWt1e1bu7mRDkSawRHCJNxsHZMZPfQMYAMx5wzJ5JvGQdPS397p9D2
         w9wrg2EVQmVHSQV6B9YV6QnvdKsKjH51yDEnT9dTmsM2DNeblE+viyALSbZVg3A+4SEF
         i9lT/Vt6XL9NsXBkV+mYEkWvw3aqYorxECf72c7vexOyndX3ySqD05XJpQagqCULRFT2
         nkPOvWcYwkyUZ1AYp7m/mpwTe7nU2b6UqbM5FBMjY3rktfbXNd2j9myldRHOzQo+BmFu
         cVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113603; x=1770718403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BwydnwgkADB6zoBphbfTvoWDQ4jJFOTu4lyIkJYnOfo=;
        b=ISCw5A01c5XX3boafesj2wKO7WYakswlhZbgpnO5wqsFDOUI/8mIkQLE7/GNmPe/la
         R6j8YN/+ydHWzhcoz166qiZzhh0Z1wMeuxeB9g1mzXpjVwADuKMDjVonswy5YlLHNS5v
         HoGqT4A0D0JYKEVz97r3OFzAYHcpq8lUxfHdlP/CWQxqNbsQphK0wcjqFRP3S3Qh4X55
         49OD2/Zm7DFf+3+6394cZLiHU0vkTJo2Xh5I0OvxVSuluItPBrOWMNKuHb+Fcmef65Bm
         zfNXe8gWzTFbS8nrGYq1G2NNvWyD4XB9+TJTuI9gjeozCXKiIioYMwSCu6hjstyWoel0
         5RMw==
X-Forwarded-Encrypted: i=1; AJvYcCWhjlCQOG6G+VmYprLax/RjbS+hxF54+EMmbI/Q51nR446PueAyVFEYOOFjlTyWbD3kZjt++Bkoi7fZ7bMCFbo1@lists.infradead.org
X-Gm-Message-State: AOJu0YypEVvyXT9vPqlke19t31lEK9V3LbpHgQE0lLLfzm4aOCriSvGI
	ZnqYBaXnRobQgd+HvUKojCw1+pQ50gO0mjO7VAhuSWFQetm7qKWSHX3rLuN7F5zuw/XKVhaSmDv
	JFnjk4LmEbAudUrkwgL3Gfuu735mm3DZcg3e7PPcAxjVhEMWdbg5+QVHmeH6GCQYMvFn4eVeAyj
	e4mA==
X-Gm-Gg: AZuq6aJU4p0cqxRhLivB/80h6CLFvo+TS3VEqMVHjMnZuBWgNncHNA1Hgjfn6vIgsfh
	L6k9yS9JL7t3ZAi+65Jj49pmNH6LjseycsOsFMfAH44U4mwWG9UBagLk2Xf0n2sRngOoxCo62XU
	I+wQtb6raF9Q3qaBSuAITDioRfUusLpDRVbrHt9uxTW8C6pysYVjWP5X/1ws/tciWswoDrP/0H8
	3fhsN/sE4u4FJTLb32cjPhef/3QkwvCpHRHMn2Zmk2D4PBn7iLzVdWEdDd+IZnNxBRbjJTjMA3O
	NjhkqbpR90HL+XAkxS6RdJEQ1G/vdmzbb+J4BwCtIwkrKQ+R35Mu475wiiQVQ7bop8HsrNmrcKz
	coKUCXnTZ2d7w96JcAsAygYeY39u40xpq/Xrizqna3yiZlvJ2wx/Vll0Q8gYP9ts4EMY=
X-Received: by 2002:a05:620a:454b:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8c9eb285634mr1471866985a.3.1770113603008;
        Tue, 03 Feb 2026 02:13:23 -0800 (PST)
X-Received: by 2002:a05:620a:454b:b0:8c6:ca3d:4e0a with SMTP id af79cd13be357-8c9eb285634mr1471864385a.3.1770113602464;
        Tue, 03 Feb 2026 02:13:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a4bsm9283483a12.2.2026.02.03.02.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 02:13:21 -0800 (PST)
Message-ID: <0ff093e9-39a8-41df-81eb-c2f753a32a71@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 11:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-binding: document QCOM platforms for CTCU device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com>
 <20260203-enable-ctcu-and-etr-v1-1-a5371a2ec2b8@oss.qualcomm.com>
 <6019b38d-3a15-41f5-989e-1f576c327446@oss.qualcomm.com>
 <6c823646-9085-409e-a692-ae3e77347742@oss.qualcomm.com>
 <5911fe77-fe2c-4321-96a9-a1b6b3b5d1e3@arm.com>
 <a74b8e61-6e15-400a-a7aa-d589f3545421@oss.qualcomm.com>
 <cab2be55-2ea4-4bca-a574-eb6800cc38f1@arm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cab2be55-2ea4-4bca-a574-eb6800cc38f1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981ca44 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CS0xlA_fLX8Yt5LHUfsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA4MSBTYWx0ZWRfX8P07X112bqmY
 oChZdHNuN8QpnMkCVz8LoBjUN34jZHtobQMK0Ose+59sskOG0f1tjgVl1wf7qFOhAn0CHSh49aj
 qO+r/+Sk66auvwGqUOWCuRstA89T3nN1cv0CIdgEj6igy+W/mlht+ZAo4zALF259QZxp/uo4qCO
 UYJe/sr1q9OZDR/NUwH+3zhzpOpoqxt8Df0IWlu62hMfVZwn7mkxCYUTq4jXITV1bsAw/GLBUo8
 D1rNRHcpFzcAZ9vF0K0HMtBLvQWuT21I/nY6tWN5yMQ6H04WRy2qty0xBPX7r8sqECUPPFVDq0J
 XEuRSIwA0/3PSjIU8jVkI0YWZJxaopCdi6CiPLNwJEiqgbz8h7eWhtCbeEiaCJQRtk7/L0ige3+
 Yd5h0VgbgVx9rEgjSkRxNnX0Wib/4b887bIsFQkDtg2LM+ueYwluPT3UIAeFZRpICEm53arMTeD
 N7gJ9WUguxCzwB8V5Hw==
X-Proofpoint-GUID: lGXqvoId5vdj9kh7ZFFj5R_11r4Lc8y7
X-Proofpoint-ORIG-GUID: lGXqvoId5vdj9kh7ZFFj5R_11r4Lc8y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_021324_687872_2A588EED 
X-CRM114-Status: GOOD (  21.63  )
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

On 2/3/26 10:44 AM, Suzuki K Poulose wrote:
> On 03/02/2026 09:36, Konrad Dybcio wrote:
>> On 2/3/26 10:31 AM, Suzuki K Poulose wrote:
>>> On 03/02/2026 09:00, Jie Gan wrote:
>>>>
>>>>
>>>> On 2/3/2026 4:50 PM, Konrad Dybcio wrote:
>>>>> On 2/3/26 9:08 AM, Jie Gan wrote:
>>>>>> Document the platforms that fallback to using the qcom,sa8775p-ctcu
>>>>>> compatible for probing.
>>>>>>
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>>    Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 4 ++++
>>>>>>    1 file changed, 4 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- ctcu.yaml
>>>>>> index e002f87361ad..68853db52bef 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>> @@ -29,6 +29,10 @@ properties:
>>>>>>        oneOf:
>>>>>>          - items:
>>>>>>              - enum:
>>>>>> +              - qcom,glymur-ctcu
>>>>>> +              - qcom,hamoa-ctcu
>>>>>> +              - qcom,kaanapali-ctcu
>>>>>> +              - qcom,pakala-ctcu
>>>>>
>>>>> Platforms with existing numeric compatibles should continue to use them,
>>>>> so that the mess is somewhat containable
>>>>
>>>> Sure Konrad. So for Pakala, I will change it back to qcom,sm8750-ctcu
>>>
>>> Why do we need different compatibles for the others ? Are they not all compliant to the CTCU programming model ? i.e., sa8775p-ctcu ? or even,
>>> a generic,
>>>
>>> qcom,coresight-ctcu
>>
>> It's a huge anti-pattern with the DT maintainers, since a compatible is
>> the only way to effectively differentiate different implementations (i.e.
>> instances on different SoCs) of an IP block
> 
> Do you mean, same IP block integrated to different SoC ? Or are they
> different implementations altogether ? Why are these not applicable for
> other components ? (e.g., Tnoc, I-Tnoc, TPDA, TPDM etc ?)

The former.

I think coresight bindings are fully generic, since they have been in
place for about as long as the arm64 port, which precedes actual bindings
validation (yaml dt-bindings) and in those times the requirements were way
more lax

Konrad

>> This is important for the case where a DTB is shipped as part of firmware
>> and can not be replaced - if some quirk needs to be applied retroactively,
>> we can look for "qcom,glymur-ctcu" without affecting all the 50 other'
>> users of the effectively-identical IP block
> 
> Fair enough, thank for the explanation.
> 
> Kind regards
> Suzuki
> 
>>
>> In this case, we're already reducing the impact on the driver, as that
>> only looks for the single fallback compatible (qcom,sa8775p-ctcu)
>>
>> Konrad
> 

