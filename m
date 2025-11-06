Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6D0CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=; b=tA/fmLaMlhTg16A672JAddRm9s
	az+HCJpG4ElodZwzg+xwnKfHjng391hbbB36cdT6O9jFxuCvEH8nw4Wwi8s8+Oe7oc69jXGz5YDn9
	/fFi4lYNs2L8E3bMnbncRsONqzQaHf2TOiqUNNPPT52jMXILRxXVSr2n0aFD7xZGsa39HsdLfni3K
	zobO3dvYMlcYyzfWfNhxMTQsY5F6AK0U95oS5GfqmRIWDut3sNh5hr6Ci4dOdzOpLyBgeAl1OIlDi
	AIzhCQQTiAlCWr4prS+c/391eTvYkHD9+npsi0fNoZ0fw3uBqd5hFnYmNY9pj1rNIAcFWsI7fN9og
	Y+7AsfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoak-0000000Egpx-1dHh;
	Thu, 06 Nov 2025 01:15:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoah-0000000Egpb-2agY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:15:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KEsbD1804583
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 01:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=; b=dzy7c9qdMtRhmsDH
	BwSy5I8lgO7vOVuAvB1ACzB01Zkt6zYcR3kFIUr5mzSCRxNVhG75xC1H0ptv7lwG
	jy1PZZwn5q4rAAvdgl8xl5wa12kGqVqa7LYOjHPL3kFWg5MmcjJZ93POeVn/eHCb
	P85Hkr/vcnmHCf20bNM55XiabpQ2oi3p71Oyy2hfz921Fvl8pC0jcaaTYls2pBVd
	fgPrqxcYSaNdrRiwU0IB+WvKl4yJeJKP8rE/iB2jsEV+ODOTgG+J2+NPmpcsfRWk
	T6WOq+uyYEGydBTP8C07964aWAvD6zCnrzL8nKJzu/r9VAYYG291wIHFAuPtH8Ht
	6hcfdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8c8s8wsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 01:15:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956f09f382so3921675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 17:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762391704; x=1762996504; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=;
        b=fAlWh1uKJ9hoTERJAvv+j5TpwpQoblqAszWDbbqVIcbLMgGf4AYKU6dgNqbZtuJC4C
         bhdvCyMmD6WpTK1EFI+MVSbHB/dyd+/OQSq6gcQWrVl7gvGCPAykiJ/JOAHhzfTFpKxE
         PtLOqh4NozyioOI2q+14Z7XbBFxSEmu9EBvM5luwTlqMCYv51D/HIc/+9pQRQ0M4ic5B
         xoTkeQSQXJ0QbK9R50u9M8c3Bvsk+LK1LuMpb24fSBLMIXxaL+QmBebuc8lfazvJVJUZ
         tolZ/ntOgCiWUXynGcT3Uxl7TtPF6vH7DF7Yh1Z0GQi16z8C9pLNjuivCYsP4SMKfyE9
         Lrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762391704; x=1762996504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y78qYNjDrbqNCW1Q25hl9wSuOKQlC4UcToVsEV3+Gk=;
        b=EoTmHsPUHxjrgeyUU8NeDLqgUQwPjJikJko3Ke1iHAleu2aWK6DB0DL1DB+rlYIG3M
         MyU54ltivsdkHgg0UCOqXr+SDWLhjJMrQl5SK3iETFqELW5DJjlX9pXpi/89hwlWyELm
         w8xtgSWbho0h+ME2mPuDzrnQdN1XQ7SvgadWOvQTIx+Qvi7ub6py+NS5KmvQh3I7f6Ob
         2rexcWCLVJC2A11QAop+RKfAwdzGermfY+RfYqEDyKjgobn+/sRvME7tKe89v+Y7e+fM
         FrPsRHe1r2B0Is9p189wrEB7SYQ75E3p6zM6RwB4VsINn+NrJD4i67uP2hqOerGg69uP
         jmKg==
X-Forwarded-Encrypted: i=1; AJvYcCUvC04yP08whqZZy6ZpgNRL28+TKAXGlvypoQwEvYoE48COD32DH8j1C0wuCXlhwCNgVoHnB0h2kCet59B81AJN@lists.infradead.org
X-Gm-Message-State: AOJu0YwUJ8tqDIpnPAeg4XB1LrUgQUJM5uXWIRK/NN+rhL4+9waLMq4t
	2mocbYFOGBXw5BSqcYXZIQnfvvudzTA6R+x/5Y5mqxTNCEUyTc2LxVsz8nFj6AHWU5AYyanbvgZ
	4+Iwb2T/6CM9X2ngcUwmThcNFqte07SVExd3lWNcpccfyZr4oUiw4Vycl77GIg8cAHK+KaBMLba
	XgRw==
X-Gm-Gg: ASbGncugvHF6F335oET2XYhBkhrKoDrAUNs59iG39aya3TodXBLa2aHzTlfRNEwfLTj
	d+tsq2BOFQ/mxfKZhzBvauTXE7Ktzhx4LS7USRIkMNmq1kBOzY5dPSTikdIzVfJ6JW46VNCWMmb
	/bkNN5d58NjyCizU4yed7ejQr0JGssgd3Pl8O5hb4B5MTOvptjHzb5TsVVWUFk92dqX87gp+3jJ
	My/uB2Ripmg1n78INRhgo3pW5elRDkX8IPq7yNYXYMJeNg1b3vFoXbQdxqpmVvUbYFchkwmZ0/9
	vgHy2Bcbwv/YE2L+OpRxCmQ5awOl7bvmAayneY5XTpFyjo71yMAoRbJtMhlXCimsbeoE0S+rOlE
	VRnzvQQHJUu5Bg9lxWzkXfqFzxfjwqF0jBD7Pz6o9gKsOlo3VV8PaA+Dn6PmdkvZY
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr18676265ad.5.1762391704325;
        Wed, 05 Nov 2025 17:15:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMt8SljTKnN1uEPM9OZaqaoc8Hpel0dHroueOM1vIorT5unBLPbz6+6oK37/HktIzT5D59nQ==
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr18675675ad.5.1762391703682;
        Wed, 05 Nov 2025 17:15:03 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d08afb02sm323024a91.0.2025.11.05.17.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 17:15:03 -0800 (PST)
Message-ID: <f9dd8e69-d95f-4052-9604-aabe4f44c6c5@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 09:14:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
 <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
 <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
 <7affc5e7-14b9-4959-9943-40e416f64d92@oss.qualcomm.com>
 <a1694c50-47a5-4f5c-abb1-6fec7a490e7a@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <a1694c50-47a5-4f5c-abb1-6fec7a490e7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAwOCBTYWx0ZWRfX6361dDGoD9IH
 g5IKkqoBmqySH17+DtJqO5vQAsxBQJi8IpTko5aA3wtALLtcLCMlHdhh+FttlI0BLcbURv4n489
 LX9BmNGox0dzKw8XTEERvAjHDrRzqVE2qE9npsG+H49JAmoLx7pK3FEJdhMjtUnHFFRQJ0SMJQ0
 M4OwFYuR5xg/h1i9sgEBRIKEk/nZkIVgsQcF82smW0wfVEAanwh5tKD3ByRcZ2a5rCAUnpks46d
 Ql8nlMs+M06yaX04NtpxFslX0Kk4QTARl/KDm4L2HeWnWhDbYnzNb/22khU71QtCAPzuEHqaVZm
 kfYWUb3vQay8WCMdFy6eI29zCzP2k75u+Pwu2QeU9/CBevGwHEff+ZVWeYApbnohEcwzGNRs8me
 S0URqIgPprm88swGK8D317LI0tjCIg==
X-Authority-Analysis: v=2.4 cv=RLu+3oi+ c=1 sm=1 tr=0 ts=690bf699 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=z7gAgxDoRBdO-O0LFwoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: z_wUcMomDw58f4_QYFudEjkqfUOoZLw-
X-Proofpoint-GUID: z_wUcMomDw58f4_QYFudEjkqfUOoZLw-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_171507_821548_9D1C95D3 
X-CRM114-Status: GOOD (  16.94  )
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



On 11/5/2025 5:17 PM, Krzysztof Kozlowski wrote:
> On 05/11/2025 10:09, Konrad Dybcio wrote:
>> On 11/5/25 2:14 AM, Jie Gan wrote:
>>>
>>>
>>> On 11/4/2025 8:47 PM, Konrad Dybcio wrote:
>>>> On 11/4/25 9:10 AM, Jie Gan wrote:
>>>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>>>> tracing data from source device.
>>>>>
>>>>> The CTCU serves as the control unit for the ETR device, managing its
>>>>> behavior to determine how trace data is collected.
>>>>>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>>>>    1 file changed, 159 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> index a17900eacb20..ca4a473614ee 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>> @@ -6713,6 +6713,35 @@ data-pins {
>>>>>                };
>>>>>            };
>>>>>    +        ctcu@10001000 {
>>>>> +            compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
>>>>
>>>> Missing space between after the comma
>>>>
>>>> no issues otherwise
>>>
>>> sorry for the mistake. Do I need send a new version to fix it?
>>
>> I think you do since Krzysztof made some comments
> 
> 
> Not a technical ones, but about the process.

will send a new version to address all comments.

Thanks,
Jie

> 
> Best regards,
> Krzysztof


