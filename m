Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358A4D132D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWQGK+gFqiAdlvvCufCcwMSL0mH6zzKf4LLgUnrZec4=; b=3GsqL1bfbdpoJSfIuvXyKt0ok9
	VDe21ynW3PlOKguRO/92LYM5YUKd4yZssg7dO3TJVLBlGRZ26X6/1KTZW475FjNXzdnI+ZUWBFoud
	KzRPel4oC4PWASWJyCYQ5WcAMxjN60EUo++gwqVlXrpVE34bkqzHLNA8PzO+M8p59wkCp1aPJdKuz
	PZAY41HoPiXyLu3IELu07qJQlyH8T4WY6hHIZiJ0b7DBzHozCtGhUG61ptsQ5pgxxuQGYVDEsVHis
	MnAf1Gn4L1tMS4RYFHY8U/e/wHdkWLXdbQVDzwRKX8h9schs0ZdRfw3TS7bThhDEj+IbQAp4IkfrJ
	a2YhDXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yIv-0000000E6D8-0aVp;
	Mon, 04 Nov 2024 14:43:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xng-0000000E06Y-1Y0a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:11:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BtpsT009787
	for <linux-arm-kernel@lists.infradead.org>; Mon, 4 Nov 2024 14:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWQGK+gFqiAdlvvCufCcwMSL0mH6zzKf4LLgUnrZec4=; b=X5DayAdEp6wWCsxl
	4YtvZQekepElalg4PMAXyJkPQOyArVsqiA4e5mpGb2vQoVxMGIkUSteUhmWvhDa5
	yLUNgLAIEvjLKxUw4Q+7XUpk78mbA1pnKSK4aVUHTPfy4rLZYA2S9vxuTm+RWaiW
	YJqRHwOPC9Y1FayC5yXGyP47tlgEKQLsUYfCMXdlEO/mBx0po+WODsWIMcR/Jb4v
	t6EtKFrX8rTIe1qyNBrMIgYwgImC5NiNLgoky6h6r6KITLwTH/K8KhAXvxXTN4HC
	Bh59JQN+rl2Y3PPGgk1PzXaQrc2Au+us40Ez7Mc6Ihc/fdSVtM4liQtfx1C0Mbfs
	LnFb0w==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2s4fgx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 14:11:22 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-71810cd2d0eso265176a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 06:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729470; x=1731334270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWQGK+gFqiAdlvvCufCcwMSL0mH6zzKf4LLgUnrZec4=;
        b=Ca2biq7FMC5HiW39TKSLj+bzoW0Wp3cuiZ6bpDnpuM6LvtgW6LKixzNIflE1avgYMB
         rh2LSc4ozpkS/Atd5RQ+DbYLVbYPofQeFsTXAw8T3pvXmf77bDomMa2qhP4RPfj8ClNt
         c0fSkaVQV5vcfCcHhfHeKL19oFxnhK+pIZKlvuf70F5NN3uo60V3wvLVnooRWYWrLHWz
         O9HKazQ+wSvsSUjRSCZ8bcbeC9Y42/DVymH6AI3l6nkfnn5ritvtuWGGZYP/tmwpmm8l
         SIzSdzI2Pp4MGZJBPyGZi6Zofi8CtBRnVbmWRKLmAGPvC0b4qT2lUbWSGbOPCQ0NHBg8
         GBfg==
X-Forwarded-Encrypted: i=1; AJvYcCXqK3dQ+bHNXNOKc8H5t3St+fbtMmT6r8gnUJQSnVqTAZF+5AOMDmekPhkEvNUpd5tM5L2jkvwpkHMSRsmOFhOJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmry0F8GmSj+buf1n8MArdsr2QuDsZ5lGj575MPTGeR+Yy9WG7
	hnV5GeOEX8romg7q6wSRcs4frk3C4ae5vEV0qcn7hqT+1vYxz093cSzyk8tP6xovKnD70OdFCpd
	luCSABPycDAI/EawxPvMkqERymtqajUknccc4DBWTxYn+nAlcMzHVXc65C0NJ0SWfma0in8SM3g
	==
X-Received: by 2002:a05:6808:13c7:b0:3e5:f6b0:6ece with SMTP id 5614622812f47-3e6384c54e0mr8553314b6e.8.1730729470510;
        Mon, 04 Nov 2024 06:11:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeLnK3SNwDSbU/S8+Adq+C7BNiBcubtYMDM1I7j21B1MpWE1qSEckxqqAiiqRZlKmn1s3qYA==
X-Received: by 2002:a05:6808:13c7:b0:3e5:f6b0:6ece with SMTP id 5614622812f47-3e6384c54e0mr8553301b6e.8.1730729470101;
        Mon, 04 Nov 2024 06:11:10 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56645da9sm556198566b.164.2024.11.04.06.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:11:08 -0800 (PST)
Message-ID: <a41e3aeb-43b9-49c0-8243-29a78a3b1602@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:11:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add coresight nodes for QCS615
To: Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
References: <20241017030005.893203-1-quic_jiegan@quicinc.com>
 <69be09ec-e9a5-4fb6-890e-74a65f3ce404@oss.qualcomm.com>
 <3f90b3d6-9637-47b7-ad8a-ff43cb28ad32@quicinc.com>
 <e263d461-9e2b-4ffe-8221-cd9ecdd142c9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e263d461-9e2b-4ffe-8221-cd9ecdd142c9@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xGzRM-LxR2FGX5SDfkKMiFQW0tplrYHu
X-Proofpoint-GUID: xGzRM-LxR2FGX5SDfkKMiFQW0tplrYHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_061124_545995_99BBB8D3 
X-CRM114-Status: GOOD (  17.65  )
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

On 28.10.2024 3:53 AM, Jie Gan wrote:
> 
> 
> On 10/28/2024 8:54 AM, Jie Gan wrote:
>>
>>
>> On 10/26/2024 2:47 AM, Konrad Dybcio wrote:
>>> On 17.10.2024 5:00 AM, Jie Gan wrote:
>>>> Add following coresight components on QCS615, EUD, TMC/ETF, TPDM, dynamic
>>>> Funnel, TPDA, Replicator and ETM.
>>>>
>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>> ---
>>>> Already checked by command:dtbs_check W=1.
>>>>
>>>> Dependencies:
>>>> 1. Depends on qcs615 base dtsi change:
>>>> https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615- v3-5-e37617e91c62@quicinc.com/
>>>> 2. Depends on qcs615 AOSS_QMP change:
>>>> https://lore.kernel.org/linux-arm-msm/20241017025313.2028120-4- quic_chunkaid@quicinc.com/
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 1632 ++++++++++++++++++++++++++
>>>>   1 file changed, 1632 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/ dts/qcom/qcs615.dtsi
>>>> index 856b40e20cf3..87cca5de018e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -202,6 +202,18 @@ l3_0: l3-cache {
>>>>           };
>>>>       };
>>>> +    dummy_eud: dummy_sink {
>>>
>>> Node names (after the ':' and before the '{' signs) can't contain
>>> underscores, use '-' instead.
>> Sure, will fix it.
>>
>>>
>>> [...]
>>>
>>>> +        stm@6002000 {
>>>> +            compatible = "arm,coresight-stm", "arm,primecell";
>>>> +            reg = <0x0 0x6002000 0x0 0x1000>,
>>>
>>> Please pad the non-zero address part to 8 hex digits with leading
>>> zeroes, across the board
>> Will fix it.
>>
>>>
>>> This looks like a lot of nodes, all enabled by default. Will this run
>>> on a production-fused device?
>> Yes, usually Coresight nodes are enabled by default. Those nodes can run on the commercial devices.
> Sorry, my last clarification is not clearly. The Coresight nodes are enabled by default for commercial devices(fused), but only part of functions can run with commercial devices because it needs check fuse data before running.
> 
> If we want enable all debug functions related to coresight nodes on commercial devices, we need APDP override(APPS debug policy override) procedure first. The APDP override procedure will override some fuse data to allow debug sessions.

In other words, will a production fused device boot with this patch
applied?

Konrad

