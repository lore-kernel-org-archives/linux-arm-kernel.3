Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CABCCCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=; b=T5sbJfLRI9bk7K1TuE7UnuhKUj
	GCTClH1Jong5R0SZbNUPgUFwLSK9/X+BSRW34uqgZHuHbH2AM0i1rLlu3GfIbsN6ZeqSOm2pk1/4V
	qbytEJ8sUHp+gkxEjXeAg4w6prQxlG8Kuf3DYu1wiYAvLqiJ6eKWzbqupw8vuHi4KzMJ/90esqB6w
	RLQXYsV0I4A/ATuUouCDcPoxxLJXBuVpg3vNNFBUP1wf84rX9O1dcUKpeBr/0CANFcRH2lz9DRYzu
	ZBNMeJWsqfEPdhCv8+EBh5DeWmd5LclzUYezv2hASnz4JlSDllOxQi6XnfznVC77gkxraqA0x6BPn
	0FwFW8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZWQ-0000000DM2C-0uO8;
	Wed, 05 Nov 2025 09:09:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZWN-0000000DM1T-0ght
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 09:09:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54Yarg4056196
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 09:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=; b=CeGv7ysDx9vEl5Fj
	aMqMyyM4ecNJjpH+EvWJxm1G2o3tj49/ZmygOxzBHGwLTngNabXrJkMnmPPhv9bn
	+7wPceXBWfc3szHNzKWmrAqUfz+epWnW87KuCD1uMRsrQec5Pe18ClnrVtasJPhS
	d8YVjWl02vHQ3qjnhBJsqAy3NgUHzkTeYxy12JwNGy/U+NRgripwa6JVUKFO6Fb2
	TdcAQAC1Zco251JsuBWWnsKo4lUnhH2rGUBIkBZ9e3SQmZE7M/81VO1EmKaB4Qk3
	Tk1+sD7uX2DxVYQ0007knodvUWBT0Tbfo4O84h4j2qybyu+thCdDaflJ/inngERe
	Xxh+ig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7yp60phv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 09:09:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b10c2ea0b5so71249185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 01:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762333777; x=1762938577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=;
        b=QAA8AiVYfEu1iMEwHwwiZbYQ5n6AtxnGvfqxYZ4Lo33XV/ENeIfLuN3+ECqLmu3+gy
         sHbtHdrpuVpPJEV8hlAVhmZMPEFVeT/glRmScNCNx0kkPPv+4vIzJF0UzFGsooJZSuEO
         svo2CCqRjzW14B267c4ibBFYxqw9HnH/RLUIULYSoS5me1PutdMZV9jOMWFb2ROSUNmm
         Mkkjx8uAP6DN8ujua1aNPT335glpCtz62CtIvuGA1E38F9yU/Egy30ehVLZRkdHAAOEA
         DsLNdC/q6FbbQpswIHqd4BS6e4/3SUe46QfNcIbjeqOGf9Yp9GNBG7K7yyqusCu/OwH9
         QPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333777; x=1762938577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=;
        b=ruPl6E6STOfn9xq7f+4otgwAVitk/+1QJlPgk8wENcTEnHPTPzkXjNN0/IWLQd9rvx
         16Ongf3CxeAEb71BwkKh4uAdvrLBrYro2IGwD1FP2ngkrsQ2W344wSBALKflSOzg0NkB
         oV8npupFLWe8slSqIlqyUjzxuS2NzAZ6hCYJ8+AmRteYsce9Z2UGSq19Qjy0ICICFESY
         jAsoQU6F8osG1JEBLcGHwDQKRIAK2MeBR2eN9hAK7Ui6k85dvgFp6R4Y6uTGSuVBId8O
         5ydPnMKdJVEG0tCm9HSEZp//C10SeFg3C057QjzI0rZMIohU10x9lCd3LVTZqQ7vQ5KR
         YtXA==
X-Forwarded-Encrypted: i=1; AJvYcCUAXUhyeo47bGOYVaJROWo7DkX3vmO6pVZiy29baQn13paT7WfcyESksvWuSNbnMKAQfuL/Zyrb8fO1xnKlt7PH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0jWNU2pZSI8Ae3KNDjuyCTbBhOSnE0fqrmY7HtrckTiMytMU/
	M1V1cf7eBtOag0mUp1TA/HL8wfqOk7mRoMMsOP4Hj4lFUSzADkllpAgWHepLTRuc3oPatdgBVle
	GBDy8NKuBNC3VRXjdAvF/9ijqH1crkMZvoFgxn5EawpJ01L7I9tGFXfP89LmDcb3IOogkza63/7
	1QXw==
X-Gm-Gg: ASbGncsOCkqdWRPa26tQsmbeFNdJ09qCO18cXBeISkn0VbRl3FbW/yhJTy23eTDCrko
	4Mcxj/tvWZAOeWH1ONcj0KbaCfKH8u4F8L2ith+URbWEtDHzquvMebnFOOaENcEPiC05trFwsvm
	28Xw+98RagXvxOo56jPmEonkzVKCVWs/tHnSy9ivFy8/QjJi7gUifSa8zb0atv4v61MsfB3yjUS
	zbbwbIQQ2lx9ILUThi1ViyK42PUyoRGjCnJlK/msLmrv457zOE98rrk3/bZ64daUtHIAFYhCBva
	2zGrqf5Twcu9wJVqQPe+2DayaxaTwBHU8UO4FJNYZQBhtVsnsryekNF+bVeGS/Sy+cyCJ2NyORH
	O0Tlo/kkBaOBe0DNvs3JhKfgjaLwcDc5537ouEUv7hCttWXks1B8pN8ba
X-Received: by 2002:a05:622a:1a0a:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed7233253bmr20208781cf.4.1762333777431;
        Wed, 05 Nov 2025 01:09:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ8qazVdRxb2HPWUGZnt0hJ3G3Yu31pg3BrDUWBi9VZDTTGHvUX8RIKyYz1xHi/Pys6k6MmQ==
X-Received: by 2002:a05:622a:1a0a:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed7233253bmr20208571cf.4.1762333776901;
        Wed, 05 Nov 2025 01:09:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a5cb52sm4081058a12.23.2025.11.05.01.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:09:36 -0800 (PST)
Message-ID: <7affc5e7-14b9-4959-9943-40e416f64d92@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y6qWwNoCw80twMn_jeiV8iZoAO2Z-rbs
X-Proofpoint-ORIG-GUID: Y6qWwNoCw80twMn_jeiV8iZoAO2Z-rbs
X-Authority-Analysis: v=2.4 cv=TsrrRTXh c=1 sm=1 tr=0 ts=690b1452 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qzgm85ZZqHKQ8I3g2P4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NyBTYWx0ZWRfXwtHjraUtea7Z
 MvmyFrcU/Rgh708wjnDAZkhrI55WXGHHg3zqji3WuLCsMtUvIMs4YZuC+x4XoHrrQ5hdoyAqVga
 SDMT+FQ125MPsp0ZjOwALbgU5zUOsq+Xx4aDe7YZ/dmdBReszo/JUePp8Kc3EkPusQoM5dd84s/
 89yH9xsxK1T59Q0/aHsn/44LNxIgI6q8pY9+3iN89bcV6LQ7JtEUDxbCfxTqQgHllBGRD61pGWv
 2N1i4jix3RtvkOZVfgbbScbqLaYsFpwDlMp3HCGPtWjby//IDIaVoc7NSSPxcg/HM1LlW306rbj
 RyMQVgqvFIfzL+9yNOOdYJ8KGZSbZFnP2/7G6xK15Kyfx/apMuGQErLA6/ErxuAV7/Y7ip0VxoO
 9DrJyijVSXFzJZINcyXn41Ea8jk8uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_010939_346634_FE88DBCA 
X-CRM114-Status: GOOD (  16.18  )
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

On 11/5/25 2:14 AM, Jie Gan wrote:
> 
> 
> On 11/4/2025 8:47 PM, Konrad Dybcio wrote:
>> On 11/4/25 9:10 AM, Jie Gan wrote:
>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>> tracing data from source device.
>>>
>>> The CTCU serves as the control unit for the ETR device, managing its
>>> behavior to determine how trace data is collected.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index a17900eacb20..ca4a473614ee 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -6713,6 +6713,35 @@ data-pins {
>>>               };
>>>           };
>>>   +        ctcu@10001000 {
>>> +            compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
>>
>> Missing space between after the comma
>>
>> no issues otherwise
> 
> sorry for the mistake. Do I need send a new version to fix it?

I think you do since Krzysztof made some comments

Konrad

