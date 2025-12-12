Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D653D4335B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 01:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=; b=RRQ9Q+hM8ebR+q9ZMKG0aTE4r0
	tdW3FURb5BjoilDPIL5pvIG9YAyM1R+J4YPAFRV5VxewcbezCSAEB9wP1r0AXb0GU7YGTG8VAOln4
	L4MSB5nzcCKvSt3F2/gcltt/tt+U9MsXGnmboysyH3C9kGqHYyP2dQYWRPJeHSnDPURcJ1J1DitEM
	KEeD3SXRbwqsDIEXQMZyVYaNxQZmi8g3QEpS2pWTRqunL8IXgPSEcQopBkKuhbc2KuoSMZ0nziUCI
	1t4TyUZVeNmAt/cBQPP+rsXMrwH9N+kJv4Ul1fLDuIbY+PmXRXbMmWJpeDxFr0BCxyXeBJsrvYiVc
	fdim/NvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTri0-0000000HTeG-0gQo;
	Fri, 12 Dec 2025 01:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTrhx-0000000HTds-1ufZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 01:12:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBNcPvZ3551362
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 01:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=; b=A89EWoIlqp08Gzas
	9IsxU4r25bwS1PI6RUlXRgh1nH171eLABDW5RjYXzpcczsbSPHRaeTBk/8LFVTuM
	knndiRhyDkIsqUk8bJOFPkHLCdxx9ZefNUxGAXMyvE/PKu+mn4elMKnuz1bCUpDG
	QyBigXSdTxECywHcJH6/ysYbLpLLAbBZRpQ+M6otQAXTBC/9XCnK3aNJLGQJlHXx
	GEZ96o4aYU1BfaRjcgaSXTNZGCZMw8oBLeZ1ewYRo/+VlJDaNLbSUk5CjhP1/jSe
	xsw0R/YOHZP+cuku3D/8Zl5ub/A/A3zpdRa2SdJZo3UFhU1SBh/0Pl7yhipJG7VV
	GEqHpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b07t9r6u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 01:12:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29848363458so13166935ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 17:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765501951; x=1766106751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=;
        b=g1YZq5G6xK2jOG+xE76M8ksMc8lu/4yoIgCZH0qNApFsxBQs55WcQW8b5Hmim6OpRw
         bkUbjLPC8UrLhfmyb71EsRt7+jyFpPK6hRAHIEjTZ9w+XuCwCrzITyjn7NveWBl/dwAv
         2SYp5oxPqTbPgdlZxOcOBptfPn68Vy7oL4hxPVitjRPQnj3CmH8MmoDtoWI883KMh/2g
         yearru9pt9q/u5BlkEuJqF+vSeA7vhbHP7ADZBPyO//x/F+VPosVNzk9RQ5wM/avFV1T
         b3aSkoPwvBJEY8VzcSlG42r0HIiHMYR7qKmIO74vkxNTkbEAuuLA7v4p9l8dubuGq0yu
         nbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765501951; x=1766106751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bpy4sMZGtZjO3qDrmI82LXa5Amy5k7qxvd2BAFsT/bs=;
        b=LmT/UbYdh0rEhq3kxbGN9xX9oBzdKTA/O9L4zxeTJub+RGvRxNX3QZbItGnUeZeeV+
         cfyfSUqMx3HWbytvOWVAmy8GPBWJIHbeArLG57baX3SWfOYn/LVwgnIpk28pz6CDBVKV
         z5qD5npz0AVELp7y7nMyyPSNNxSUGuRVIifnjFpjt0BhlPfhtp0pLtYXHhDuqpNSpklI
         iSeuSy5t46GJcuYUzHIYljUVH+No45sQHBmblR+q212/Ozj3fFSOY0dUgBHaUf7V8WJt
         8SN9sHO5BIDOOHjggA5JWv95jasCYcYzcTN9e1BEFjmEU7MM44aU9MDobfBhvqHzhvGf
         okmA==
X-Forwarded-Encrypted: i=1; AJvYcCU7rwBEJgItuEUMsQ8GDs//JhhLvtJ1AzLWeiuGWlyfxA1YEVVjWrEWJyf4jHpxlWG11ViraQnAw0BixE80c7O1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn6svL5P1BTnZYi2XFxnJNT+/rD6uOcSge2q3tfmgD29925MAg
	sLxhX8TF+R86FcT1IM1uqZ2fWsXl3EhHJEzJyhrHHxYHmrQXBlkiiZnf7R+Eg9fHYxWdTkJxRzE
	leJIZxSW1+6bO0+XN1GUoK1eEviec3yxWwBC8ICmmKl7ZaBJh/8iAXGQjRFn+iUQnAe7VcYwTjI
	/Idg==
X-Gm-Gg: AY/fxX6AxqtlStSxAb79h2JSO4mQNju0bv7Pow5yGZz8Swo/xGKmvUEvYpuABlVt8Hu
	1Ygqc8wnPiPuU41AmrzG2hATgJwqmdqKexza+ftC2gVfzifKzwu4K/cKzbQ90zXWMMKr4FuWpSX
	18aTabQojnwJk7tHdgiXRBVKh8iybarFCiZ3yYm6f3Wo+GWJTE4lYLFAAyePyYpS84wJ9jgM0EX
	Sf247R0s4pmmXsyEZFZBvaX81RvPYqvx4Ogm2DeGAumpcNvJgyZ79/qfQteH4lcLedXSY+9b0W4
	tetDwqBf/TKYNMutbx+LeYEPAdpSQHN7Jgi3nWwi8OIMCQN5e5Xdk+wOW0xWNffuor0aiUEaBOq
	Uo+ntDU96FGWIkjiZVdION9jSnW5TO/ukV/w7miuUVAxeENA5NKg/HtMo0mYjnTdMTNWdK+VdaA
	==
X-Received: by 2002:a17:903:22c2:b0:282:eea8:764d with SMTP id d9443c01a7336-29f23c68107mr5693575ad.35.1765501950729;
        Thu, 11 Dec 2025 17:12:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx4fRvdhPu/SygFF5ybCQmrFBEB7oSGXXfLs0+77TNXaagA2gUiZ7A/5tmbwK6pdQO3pay8w==
X-Received: by 2002:a17:903:22c2:b0:282:eea8:764d with SMTP id d9443c01a7336-29f23c68107mr5693045ad.35.1765501950185;
        Thu, 11 Dec 2025 17:12:30 -0800 (PST)
Received: from [10.133.33.31] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29f271bc8a0sm429515ad.92.2025.12.11.17.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 17:12:29 -0800 (PST)
Message-ID: <dfa43a63-ca14-4dd7-a7ab-acd95748a8b9@oss.qualcomm.com>
Date: Fri, 12 Dec 2025 09:12:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <20251211133723.GA859302-robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251211133723.GA859302-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KDqyXmNwNXZp5bK_9A_9875ZipnXjzA6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAwOCBTYWx0ZWRfX8RHeiIy7dIVA
 yzKuqin720+IYfQE+rlf09rQ3WaPSNXjoIc/bQFBFAd3V/ULkKtMFjMtdHz6jkrkjbJmZYzYt5F
 YEuTp7Y8ffKvXrx2C/07IYcpt85LyHYrlHve0X/aOt5dH+FWEXsKadFThqm3E9lvKUu3NZUN2t9
 3Wcs3IxwLET0xDUufm/Ud2m+EXemVRNmsjOCdrpGwI1XcAK9Vwfdywj8pia6B6fk5qSShSumlSO
 HdpM5sDptg3ftRrzh9j15mAGDteHTgROuNo8lGMrm4Xe1pxJexbd09zNIB1u2TODqW9NX2MKkmG
 FR2SYDr/eH9psPSVzGlR4NEwq+AZqbT9YqCHrJuiz96d1J8locpcrqgyUOgS8wY1YGLvnhe7ir0
 sans10gRsYfnVJDDJKFf+02vskeA+g==
X-Proofpoint-GUID: KDqyXmNwNXZp5bK_9A_9875ZipnXjzA6
X-Authority-Analysis: v=2.4 cv=Qb5rf8bv c=1 sm=1 tr=0 ts=693b6bff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SkUS4XPTP4F0jhogtscA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512120008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_171233_627814_88179AD5 
X-CRM114-Status: GOOD (  20.22  )
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



On 12/11/2025 9:37 PM, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> index c969c16c21ef..90f88cc6cd3e 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -39,6 +39,16 @@ properties:
>>       items:
>>         - const: apb
>>   
>> +  interrupts:
>> +    items:
>> +      - description: Byte cntr interrupt for the first etr device
>> +      - description: Byte cntr interrupt for the second etr device
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etrirq0
>> +      - const: etrirq1
> 
> Names are kind of pointless when it is just foo<index>.

Hi Rob,

I was naming them as etr0/etr1. Are these names acceptable?
The interrupts are assigned exclusively to a specific ETR device.

But Suzuki is concerned that this might cause confusion because the ETR 
device is named randomly in the driver. Suzuki suggested using ‘port-0’ 
and ‘port-1’ and would also like to hear your feedback on these names.

Usually, the probe sequence follows the order of the addresses. In our 
specification, ‘ETR0’ is always probed before ‘ETR1’ because its address 
is lower.

I would greatly appreciate your suggestion for the interrupt name, if 
possible.

Thanks,
Jie

> 
>> +
>>     label:
>>       description:
>>         Description of a coresight device.
>> @@ -60,6 +70,8 @@ additionalProperties: false
>>   
>>   examples:
>>     - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>>       ctcu@1001000 {
>>           compatible = "qcom,sa8775p-ctcu";
>>           reg = <0x1001000 0x1000>;
>> @@ -67,6 +79,11 @@ examples:
>>           clocks = <&aoss_qmp>;
>>           clock-names = "apb";
>>   
>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "etrirq0",
>> +                          "etrirq1;
>> +
>>           in-ports {
>>               #address-cells = <1>;
>>               #size-cells = <0>;
>>
>> -- 
>> 2.34.1
>>


