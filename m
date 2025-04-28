Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D52C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIIsicJwTNFSWBak9gbUD+9k9AX9vew+4qjNtRrWd3I=; b=k4kTkS9FYzgTlu8uQDbhPzwLWU
	KcLUrHKwqbDu8vOtrzx0e7sWn3YmS6fgdsNgacObOB4TtL2LfGwfZu8vCTFu9lpAWkRE/4sG5kIiV
	xJStFW7hpAmaRdvYBAJfpLoJgUNVXBWUYAMFqdtXt+2JhWL3XrgcBVpcB0hcw8vMEkpe/qi53sf8D
	RYojpc304P/l6X54MU6C4ZXN3fa3jkzG/2sq47NpzwTzCGVE/H2U2BVd0r+p6b+iYw8v18LRL/nI2
	DtjOXMTcXWzCecgVQjIewJDY3azifLPepb0FVdoM8GkV1JGts8iBIDpQVliXbt7s7OB0BI9tMq7d2
	JjePbFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9W6n-00000007ctj-4AO1;
	Mon, 28 Apr 2025 21:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Vib-00000007ZTd-0x4L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 21:08:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACu5d020158
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 21:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YIIsicJwTNFSWBak9gbUD+9k9AX9vew+4qjNtRrWd3I=; b=KpVk4me6NdRtUiFS
	q0u9RAdDQ5YosLHk2ZkzWqdWGobtRyWfBIUmMCq+xUPqunGwJMyhnNrFZNaH7QJ2
	71VQsTzFoJakmbM8W/3yime/PQXD2WcVVZHLrgm7mK41FFayIZbgojVfD/Jqoh0q
	hkAhZ5SEpUYG+CvEf0zAq9oWIuzJjPAnxduVwSAXxsyLv76NriXEIE7+NxtmD5y3
	pJQUoRM2umaupipkCsZ4jJpbIkhtkmrhgU62sCATylOjbIg/kCiP/ZkhIuA+1gby
	+6YqzX5TvqM7yx3S0wJPszMIVo/nL88m78Sla7psGArtsjcvI+7BFA2fBXuIndQz
	UGbaoA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9ae6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 21:08:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4766654b0c3so10939021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 14:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874526; x=1746479326;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIIsicJwTNFSWBak9gbUD+9k9AX9vew+4qjNtRrWd3I=;
        b=MxxMcW/6MD1Y+vYrobr846iCgk5HtwUtOO9pX3goINpBsu//GyChTGOvEe4nzF4ucC
         HwiLkeX/aJ8AWlMNVEVdH/NjvjxVq0qioLRgUYdFzoI/RgZlFbeZfZl18dme4DhklyWw
         IV8cHy9Di0r/l+tSPfNb3hI2zLfze0DMllqEONCSJuUiJwp8b6VlSXS+Jskdwfr7uDAV
         9T3osY7L33UzyB3VLZNjB5CmT9tAnGfKggp+qzm1Dvf97yNnNHZ9wRnIPmdmTCHB62FV
         OuT/9w5RyXxyO+bHuvLqAyyYTUehjcS4oBstrjkaK0uLHWNZNxAjIPuH9SxQFH9B+rdX
         MsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlgsfdPVzHpbUv486IJaSspbEqL0uSYNXNrLYkWdefRDAefKseoJVkryA1WxoXXH1FHj30kUOYQSMEt5IagYAS@lists.infradead.org
X-Gm-Message-State: AOJu0YwSGCvVcGZ96R2BFZRLrwr5PyB81FgJQSaWeAv0sV4gNy+GiWfZ
	kEdzBGdG6RzNyJXrAqDp6zG5JgWBFJwoYPEJvfchCpvqeiku5+3DmhNANzq7WWfOBDOtLVbarBU
	ykeFP5f21ovVxss8LbHrdI9fDyycjKf6hAu5X8fuzLn5GWpv7szEfBkIKoz9rKgydwVPsf405AA
	==
X-Gm-Gg: ASbGncubkUYAe9PeY1piY6giEnIt7mucUxRIVOkE+PLIhsPLU+rzvqR7423rCMV0QZC
	XpazryMgZfzEgTaqAgxI0fC6Wq0pDGBtSOFSgQ71JtcMgMtoAbPvFwqAyJnJkUEtHkRk8mar8eT
	tC234b0oTpXswNJfKw9in0aWpuyo/b8qE/xzjRUIjpTHws0/cS7pDHHTbmH0RpJCxi+cQjMu6t/
	ULjLrG2xDecBWc/PCMhsmAhchO4vW1MumeDJySkXQkSQLqlDp0gh28Hwr4yA8rL+1CeZdPOqgP7
	nVtp273IPM3pCR92+ljnfsJpkvVI0PXArzHvxEQnRn/UV8Z/fKTv3APUsrlU9eLg2g==
X-Received: by 2002:a05:622a:58d:b0:476:af54:503f with SMTP id d75a77b69052e-48864dbdcefmr3871371cf.2.1745874525641;
        Mon, 28 Apr 2025 14:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHJmQOmBncqndjrVeMWVQWQwsIs6y5yTdT4lkSfhS7I040Dt4ZL43tltFARnvyaMhT9jbc3A==
X-Received: by 2002:a05:622a:58d:b0:476:af54:503f with SMTP id d75a77b69052e-48864dbdcefmr3871311cf.2.1745874525320;
        Mon, 28 Apr 2025 14:08:45 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7ccbsm689895566b.59.2025.04.28.14.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:08:44 -0700 (PDT)
Message-ID: <bce21a40-566d-4e21-becd-9c899c12a1b7@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:08:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
 <aAt4TBrekUqyTjfi@hovoldconsulting.com>
 <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
 <aA9jjyBR5DZcSbyQ@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aA9jjyBR5DZcSbyQ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=680fee5e cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=jsbeokMXWjskDHubqLoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HV3srd7yEA1jjUoplM7YRLj6ielCopcd
X-Proofpoint-GUID: HV3srd7yEA1jjUoplM7YRLj6ielCopcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MCBTYWx0ZWRfX8pvu3/3aTYAt 5FjCJUE0Fz3C4ydiwyIxN5SHaqYY9to8QeC3FwpU7aFo4Qv/p9v6teeUe4D2hdCI0TYFpxMbkuY wE5BblCZ3akWZe3Yi3wIZn5Q/GYHUrQ3F/Bw+3vX1NFkKs/tVj24jLY1SwjS+h943x+djNj6KPS
 Uk1SmuFh9PuAjoAZixu5ooF0TnIBGZZUWEsNSvG6zscqqeLFHwZQv9ZTqjsn5by8cCgysXIyTuf fTkT677X/4f+IuFvI0sgvkdpKfMQbHW3YG0yx2KvRLOzyaPJKUxf4Hz3KAj7Aj8KjgUcJXSqzxV RVNiEX/3Gjpr6RSmaVD+zMLkI+oJ+C+y/LmybI78GbA2lzU3h31u3tCZ3P0280meAUNjbwfsS7n
 VHox1r8cf0i2QPlySl4UgugYmlJKOEV2bAuv6wFz2X+l3cHSp6Tdb4OQ9gimgQKSkX+ZB1+B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_140849_430465_5C3A0CAD 
X-CRM114-Status: GOOD (  20.13  )
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

On 4/28/25 1:16 PM, Johan Hovold wrote:
> On Sat, Apr 26, 2025 at 12:44:57PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 1:55 PM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
>>>> On 4/25/25 11:29 AM, Wenbin Yao wrote:
>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>
>>>>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
>>>>> voltage rails can be described under this node in the board's dts.
>>>>>
>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>>>>>  1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> index 46b79fce9..430f9d567 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> @@ -3287,6 +3287,17 @@ opp-128000000 {
>>>>>  					opp-peak-kBps = <15753000 1>;
>>>>>  				};
>>>>>  			};
>>>>> +
>>>>> +			pcie3port: pcie@0 {
>>>>
>>>> @0,0 for PCIe adressing (bus,device)
>>>
>>> No, the bus number is not included in the unit address, so just the
>>> device number (0) is correct here (when the function is 0) IIUC.
>>
>> Some DTs definitely have that, but I couldn't find any documentation to
>> back the syntax up or explain it properly
> 
> It's part of the spec:
> 
> 	http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf
> 
> The first number is the device number and the second is the function
> which can be left out if zero.

OK thank you for clarifying

Konrad

