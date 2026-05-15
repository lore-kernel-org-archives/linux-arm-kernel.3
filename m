Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0CFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=; b=yfuMhpYSrXO9p22YGBXK04yg9a
	GTEen0eHvbutWn7Rxotue5MNb2BoIqKZyHL0v4u8KDiNlZlbVlcAU7U/m+y1IESGEhZxZMj6/htQj
	9tMkgkKsLHnwWdcNAd9HHbztPH2JKPEXgD5XUDDH5Tjz05NbnHNj8l8jCfUQf8vjZBOAPL6BVHsGZ
	+MiYaj0UhweQxV2X2kEVYbFFfhaejiFTkFPV9klEYrnzmvqb1xMcd6motrHR2A36r2FfZmuxlNy3k
	YmeEZAd84KxBoumv+PfphteOj6kzLVOD57j3av9ZvP1jSo4XHT77hfUoKr7ZZxaScUcw/okh/XNrk
	uIHZrnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqS9-000000088tH-42ip;
	Fri, 15 May 2026 11:11:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqS7-000000088sg-2gY7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:11:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5UsYK3197968
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=; b=QjzVHlaTUlnRtWPM
	6lVRtP41zUil4Xt5gSQ5RgyhlLEjNmwzeKL7FFcTODt3W1dRYV8svi2e7QkkHPUB
	cShncDLiHi7I+AxGuTSjDoMcu1E1GRL4CVVJ2OPFakszoisNEnHsSJQFnBxxq0hj
	VleOcTHTRvrgaJ+GRlMPO/DKrGOs9HeRCP+L08V0KY64BReSe+dwthqq2+Ur+K5F
	yQBiDzXZXROtDYaHKdy7LtlpVmae6BG7jW0P+5D8OaryMCSulORFkKVkpHiGXYQn
	HezfkrpDy3lOvv/CVD7wEQuYndqH966ntZCOlWP0jrDD7pE3bZUZTYzP14WmoO+c
	oFAqBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qayn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 11:11:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9a6a853bso181997151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843493; x=1779448293; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=;
        b=cWEcNiSJzwQXrdZHXNdI7SqhMTI78bh+Hub/sozsqejrkhysAdaCr6nZ9UP2SXrwqL
         i288p3mo+KGgER6Igy+Fkpt6MoO0F7ybSDr2pf2gwZbU4ql6NX+bgVKPIS7qFQOKOTWi
         dDjUdQVxbucwSXG6nvqqo/sR+aTcfuu00A0ajhLXhIz7Hny4PLcTYaLLV8wcWFC+lhK+
         wNGI5GjPY8OHogqIq6RdKbza6cCg9YHww/O+VL0td9Vwg110vGFffxMr1rr4w30yj7VE
         mO8VSFaFaraLpCZXOzSx3n4BLxvPi6d1ZxyxZSi4xUvZvanwdn5jzJqGY7K+QsPkouiw
         WAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843493; x=1779448293;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ZjUt1uwVNfewUqlWPi6VDRZNzVhKIxFXDMZSasRtuA=;
        b=qSAl/j7AgZk0xndtP/kPyZSAInv9Q/VnZt62a171ZZFuwFPy0H51ZvDDniVq8orkiJ
         fjbpzI5rSjOTa9uzjkhUVe5theySetTSzLa8XE0l7EH9XJdRTPJ6lMrFB3hTPU/WIacz
         n+p+HEQdH3t0LMW/Y/yEoPJCY+GzP0wKfjftfUw+Rnu+sSXRGHAl/ENw1W54j9Z2Oibg
         DtAmP/hc2RNZz8Ickt0DjGTD+4Fv/9AQ4ZlHYpRoOmm9kZZJLbvJvj7/tYHDrED28pXg
         Zlg0cUG/zAXGOa91SVgsnGixZhNXtPFEUqairXUSP9ZsObXHuaZR8mijVAom8gddmzZg
         FZPw==
X-Forwarded-Encrypted: i=1; AFNElJ+rEeefzQuyQ9a4Aetiwo/JOWM2BIWe1P8DZoSsSDwd3gctZENUlWcF+SL4+MMcWFlZZYjnr3862gh9SRogIC6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxFFVy9eSOziTfRPi7ss+FJ1MiPmIUnIfn6T5XSRJsZiGXG5E9s
	RYNQqI2cbNnPA9YQuq88QDbZ9VOw/cM0VIzrZtJ7UvuH6G63nbEi0B5GLcrc18/oor0ztGRUPKr
	y9lzfEdNJJ87duI7arhF9XlW6BrZXwWaYo+q6Bbo5Ji4BwDdsYr7fviu2sPH+tSEyZDm2oK1ho1
	IF4Q==
X-Gm-Gg: Acq92OErpQ3Ms0R+wZxH624cK8PM4U3UKp9AKhOdPUS0TP69VfDBzSRiXNnE5fPCaFg
	s/mzy+aCLKoh6yYTdx08itQPjWnoc6R4+diPAGgLWSccgbdJ5+Awr1YV7FHhfEo5XJ/oWXVR1fD
	gt1Ifd+kmeEegdnu+bXd5mWfbuGqcYAfbM3FNpNMX+8uccHcpLuUAme3r9CYNcFdZzjHUIT/wJU
	0CQTh0Zi3pFSW/AcA3ixk3fNYmTSdn0dSGXIoDTkpwh4s9PBP8HJHTh6BfxWRut7cXatMwKyxb0
	Hu71lb9CycrjS+BdqK1OhmyyLH3560OqVACYpI3NMoJ/Aw7bLMGQ4GuPBlerSZNyC64dw4oLrSj
	FYKsVjnk0SBRtxJHlWTPEtEzih/0ZFQtw8dYmB9Dc7sYjQSnpY3k2Ic+1ke4=
X-Received: by 2002:a05:622a:1b90:b0:50d:82db:773e with SMTP id d75a77b69052e-5165a22f61amr46350121cf.47.1778843493302;
        Fri, 15 May 2026 04:11:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50d:82db:773e with SMTP id d75a77b69052e-5165a22f61amr46349591cf.47.1778843492847;
        Fri, 15 May 2026 04:11:32 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm92645445e9.1.2026.05.15.04.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:11:31 -0700 (PDT)
Message-ID: <720715a0-eb4f-4083-a67f-aa380e130d6c@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
 <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
 <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
 <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <02578386-a492-4342-95aa-9cfb00c8bacd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5nP8Iv1EtByEz7fiII76jt8O7BLK9yTe
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a06ff66 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yrFnZ2jJMywIoLbqsSgA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfXyyXrBNHd7C4L
 HYPbFkErsnpgIf7u+Pvsy5Kvfa8/ZY/ObXIl0X2AQKymuQY2ecIAOUe34nysEsV2ws40OmLNM2K
 V1PGY6orY9sjBVzPy1rsIiyP0aJrwgxlENG859a3QDoFiJVz49FQwb1gR6Rvai50UzEOx6ZWSW8
 wouM5hztidABAlfOELq7Dt/W7aAb3E8VL9FvSjR8Xgxkx4xkjHpIHkh0FCMAQPm6JbK6WsHN5wm
 dFRfRoZRnpS3Igr/2EMkfOw167ZLB0espeofKQCHYeXqtgd2c8XAkfI/nQ/XxJzu/KpYyapqarp
 Ji0oMdtiJaK4OKaFj7MkS23uho12e0aWeDZDlndHqWLxnqiGJK+7dkHWDBV8mM2p5Ji3O0aJ2Hs
 KSDTzGG4XhRR8n8wdHwxOWMGTXIh1tIS0bn1hLal9n0vTagZIfV7lzvQjH8xp2wv3e5B6SO0wNb
 gbRlY8WvhwNB/TmDkJA==
X-Proofpoint-ORIG-GUID: 5nP8Iv1EtByEz7fiII76jt8O7BLK9yTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_041135_813430_2CC05E28 
X-CRM114-Status: GOOD (  16.60  )
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

On 15/05/2026 12:54, Konrad Dybcio wrote:
> On 4/29/26 5:09 PM, Krzysztof Kozlowski wrote:
>> On 29/04/2026 11:23, Konrad Dybcio wrote:
>>> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>>>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>>>> basic or fundamental SoC feature: bandwidth management between internal
>>>> SoC blocks.  SoC can boot without these, but power management or
>>>> performance will be affected.  These drivers do not represent any sort
>>>> of buses visible to the board designers/configurators, thus they should
>>>> be always enabled, regardless how SoC is used in the final board.
>>>>
>>>> Kernel configuration should not ask users choice of drivers when that
>>>> choice is obvious and known to the developers that answer should be
>>>> 'yes' or 'module'.
>>>
>>> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
>>> are required to boot (minus the OSM_L3 driver which is "only" highly
>>> desired, so that your CPU's bus isn't heavily bottlenecked)
>>
>> So the few of them should not be a module? That's what you want to say?
> 
> I'm saying that if you only want to shoot yourself in the foot and not
> in the face, you can make them modules
> 
> But the L3 driver is required to make the caches run at a reasonable
> speed, so that they don't bottleneck the rest of the system's mem
> bandwidth

okidoki, so I will mark all as default built-in as you said, including
the OSM_L3, based on your explanation.

Best regards,
Krzysztof

