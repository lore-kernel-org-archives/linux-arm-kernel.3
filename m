Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118EAC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=; b=XdXH9LHrg45cso2txPY4Z3WWK/
	qJ+hBRRrsbr8L3t+pcIOQ1r38GaBQ6dj2UOLQ0LGoXxqtdUcIDawasgWrnWYcQ3bnw8Kj1MAoAFFn
	BvwkSzTClZ6lEKHHC3wa5m/DAEi1+XIqnYYV8H7lKeNhrFcNVqnz9hgWcpEu98kJDyi4buj9bXLfn
	oz3dLghFiLYFJfRKRJ52/f9cnEtunU0IqXmric16UVKJXFvCAWPDAItB3RHlUU0IARhjnlSSS5wkC
	0c953537qTDeAthH3eR9daIBeFMHiBpnwwrT8C3RfLNQ/hFL4T2ku6+j8tbrVMwZqmwD+y4zmCyvt
	rAZiJI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u561K-0000000AKc3-3VCn;
	Wed, 16 Apr 2025 16:53:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55KA-0000000ABwg-2SUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:09:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mC4p021307
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=; b=AmzkTcl3OozdoeXI
	QOXa/7IT9EFhYmScZ021lQK85PBqhd/1vF8wBbc/9HjrE1131NbqkhogJz5pWlce
	T4PoC4Wvfj/9JUB/KBOVG1CYWgl34wZOo1J4qIEJlME9TiUuzZz0F3lcDvAJR3X+
	5Zf9uCwfTBXVamSw9o6zEnV3uibaPIaF1nPaJ1lP79yQRNUUHcxmcKJX3kItSKvo
	sBxrhH0+QAW3OhNCw83pBVU/A5HFGu+SfGJRTledNqAQUWCP/VhKMXVeLnsBR+v5
	B1OUXkFys97L5RMOsRgWvyfNgFPNeONuCNVzs2z4m2/w8CSZFEOouSVyUxDCEKFA
	iQj6lg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9c2dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:09:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso168774585a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 09:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819756; x=1745424556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODYn6AqMABErS0MGZHJyExJA6uxCB640fUmnvTdsDC0=;
        b=UoY6/YXFFFnykKUIILfV0ejxl2WQIa0kNBkPpVGJIR1ENsYep83KKL5RdArKMWyJEz
         4tP4r+u8tdkZdRiyc4NJh5lLfjbhkJiIS8c1K8kYfS9qjfJG+0QvrxILpQ6pGdKFKU6s
         4bQxQJw1nKezrbmZE4rz43nFM1PYMT86Op0RMaI/6LqMCU0jcQ0F6TmOc3HA/g9osfxR
         dsc5No1Wyh4eVLUw5t1t6FpUKhe9ZM76AvNhoRT8A6Tms0R3VgdjDa7BjDK0HM7Fu41b
         qBp/GJSytEG1YLDXQQL5LziDLesci2ZBk6Rz/NatM0Gge3TZNFjS/XGZFmafrNZw134v
         DSKw==
X-Gm-Message-State: AOJu0YyZyXP3LYFUFQ+SXfRMZ91a+EOqci5qcVsWGSsV8tnG7bN54RrQ
	A/nZQ1Fh0QWounjNphHkKiL20+lfTxV23ZaH1vswEKD05EMDqCiLt+rtOfqOANu+7D/vqycCHOu
	2jZNpMwPdTTjD/bqWEguGpqsN8WJxx0A5Czk6hxgjVBgcJtpkdU5qQ2lDG6Gp/ztpreIUBuYsHA
	==
X-Gm-Gg: ASbGnctUjKLuq4keAraJiXgz+x+NJr1TIyqGyYntpQHDhZgMZ70tHril8/K+DByxqEh
	TtDmtXRQbW3YdjYAJn4AuwTatMM4bNQ2efdhIxjkmvks8DcG88voS///iKxlEpmnCE/CqzPJhTk
	Z0vbhv2wkEYIhEctD75P0saeXvAowRbLF3asv6cR8bydojR66PdMiS7g19Rk9ZLqcnO2BANJvAy
	UGJfy95O8xHFVdig9UXNwgBcBm732oAIH7TUazvPQWM0lxqXI3suw06T5P+Os80UPJYrmnWTYKT
	+DNJhvawCyql73vsB5QldLSYEmJFxyDhM0Vr2Ztho/X8CqBj8jUsZCXVW9Mu6izWWto=
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1424076d6.2.1744819755816;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqTEn4ZwnP85Wl9OFLZVFMob3CDIEgC8OxR/srPtQNfxgXZMTXzLdDo2GRaFTa3vUSJvc1xg==
X-Received: by 2002:a05:6214:e6d:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f2b949f763mr1423916d6.2.1744819755308;
        Wed, 16 Apr 2025 09:09:15 -0700 (PDT)
Received: from [192.168.65.178] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d127970sm153280866b.113.2025.04.16.09.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 09:09:14 -0700 (PDT)
Message-ID: <b6c941d3-85d4-45e8-ae69-9d9e4dab8440@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 18:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
 <6e98b5ca-3ff1-44c3-928f-e993cf29215f@oss.qualcomm.com>
 <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ee4d08b0-f291-4018-bda3-96dfbc7a07ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gXLtVslzrF4N-NfyatDby2eUPcF_3WOF
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ffd62c cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=eWPriOLmkRKYu5JWBSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gXLtVslzrF4N-NfyatDby2eUPcF_3WOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=991
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090918_746507_CEB9D5D5 
X-CRM114-Status: GOOD (  14.90  )
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

On 4/16/25 5:29 PM, Vikram Sharma wrote:
> 
> On 4/14/2025 7:14 PM, Konrad Dybcio wrote:
>> On 2/10/25 4:56 PM, Vikram Sharma wrote:
>>> Add changes to support the camera subsystem on the SA8775P.
>>>
>>> Co-developed-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Suresh Vankadara<quic_svankada@quicinc.com>
>>> Signed-off-by: Vikram Sharma<quic_vikramsa@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 187 ++++++++++++++++++++++++++
>>>   1 file changed, 187 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 3394ae2d1300..83640fef05d2 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -7,6 +7,7 @@
>>>   #include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>   #include <dt-bindings/clock/qcom,rpmh.h>
>>> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>>>   #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>>> @@ -3796,6 +3797,192 @@ videocc: clock-controller@abf0000 {
>>>               #power-domain-cells = <1>;
>>>           };
>>>   +        camss: isp@ac7a000 {
>>> +            compatible = "qcom,sa8775p-camss";
>>> +
>>> +            reg = <0x0 0xac7a000 0x0 0x0f01>,
>>> +                  <0x0 0xac7c000 0x0 0x0f01>,
>>> +                  <0x0 0xac84000 0x0 0x0f01>,
>>> +                  <0x0 0xac88000 0x0 0x0f01>,
>>> +                  <0x0 0xac8c000 0x0 0x0f01>,
>>> +                  <0x0 0xac90000 0x0 0x0f01>,
>>> +                  <0x0 0xac94000 0x0 0x0f01>,
>> These I think should begin 0x1000 earlier and as a result be 0x1000
> Hi Konrad,
> Thanks for your comments.
> First 0x1000 bytes of CSID are for secure usecase. Actually CSID register address space starts from
> 'TITAN_A_RT_1_CSID_WRAPPER_CLC_CSID0_HW_VERSION' which is 0xac7a000.

Alright, thanks

Konrad

