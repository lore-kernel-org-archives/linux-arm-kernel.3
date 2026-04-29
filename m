Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA621CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=; b=L/SrVy2e+seUVUTcpIeLt6xTwS
	9rcOvHhdwglHhG1IdVeeTzgiKkr3diR3ZH7YUHeVRPwCdACm8uL0glPLCNBrO9JGtZrWXjo9pNlxI
	KWj7lf+5IXkqN9q5Fd1iDeY7Gm4DhR+Hialxyj6NVIjifRCYnoJEalyKMcHBWGzH8jBnq55/9iYJn
	uNDQJpj2Bfw3rq3PDpJjdMs+EDgvrOtUQhUE5yPLh3pHhvuNLz05VNSthgqcrl9cJPaR/hGvQFRZP
	b6k9inusNs9LSYMTh5XB3TcdFBvc3KszAsvpUSP5Z8N3zL3JV0n8NJbC9WFPAE/e1E88cl0Ew1HpX
	OqpUkuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6XU-00000003okk-1hav;
	Wed, 29 Apr 2026 15:09:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6XS-00000003okQ-1Ruo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 15:09:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q4sP1729372
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 15:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=; b=kXOWK4FYDMIl0i0k
	xYFSCh32mDwTTpWHsrMx+KAVzh9f4fdZGPheBiBrf3Dr3mwtMm2GAJ+PSRmgLdk8
	IZpBbIrjVWQTmpQT3gCQeSxqxGC/5xEam9uQwivEDMSzfnwpzfVeUrCMT8VVPEzD
	EO84TDk/dkVeW7Xlpxldg6af8ggOx8kCpBXgSG5FFsIUdhTw8BueRlB6v7Jpc8eH
	Sh6fussvOQtBugPAKPpU4RTuR2aGyNsv7xVJ5hinERpcxIZ/l8K4zqVY3nwr8P9C
	FK+e6KKkho06mNsfL3WqHuKPZqI9epKb/6zuF5AvkLluy8JvW22OUdhStaTV4Aa1
	FJ51nA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kskp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 15:09:20 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-47bd318565dso1980421b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 08:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777475360; x=1778080160; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=;
        b=F1n8/P/jWmQjU4ZYgOf61c2aCuhwsqNHSwZoFT/BURhOiFEIozrktSBTpBLCK23S5t
         Nl7ERHn6X/q8k46EFPTC0Rp6g944fzY6KnaPsmJBXXIIqalGkJ3OhtEwtpVfPV64olaS
         BosBkQUP+iggaezbPYHZiD2X3NSiDHpmXh1eHKrncNNy5M2xARU9zxLZN0rjJDaoumt+
         RkFm/WQs4dRju/P255FlJdyrOQ/dLse1LK9M2CXgqlh61eIbu32X87akJpTuNNtHuUaO
         vJu2n3Z9d7defClwciO6FUBUKiYR1WVwgt8LLVliSLWhNPwgq956OWuxOJY7Mt7sDLrI
         6v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475360; x=1778080160;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=878qtYQe4fjVo5NqOixdnFpHTcI6ba58NmRzlD/+pms=;
        b=qnXD05YZAWAjjBdZRZsueUxLG3UmX7ewapTEFjAcjApAUo9jPBr36gqb04Lo3N8ToX
         /QUCMne1RtLufeaY2+n/5coFNfBlpdjdhZ83t1F/rtfVPUTQShs61s3lvz+4Z0xwdDQg
         TxL97889V/eY5O6IGfHtZovGIP19qNyFU7ACcngNjljvkOiyPcfcNdKph5HIxdofPtC7
         nN8l3dFX2mVdnxPPEef6hwltkM+TxO9zkaAhnAG/SMTKHpOXFcY26B6cusSDzOTuSxV6
         4lm3tmxIMjHec67xEkWzft114vgmPxIBx70c5/pxujIdPUDBRRIfAEVO+itUoJ1xt/la
         OVqA==
X-Forwarded-Encrypted: i=1; AFNElJ+rNz2bI5zrg4CmvtOYFKJAZ6UG+HmTIXG2yfmhfYXIFUjblNkSoiwMBe+TTAM1q4PspsgCYkxE6Z+NwERS/Ykb@lists.infradead.org
X-Gm-Message-State: AOJu0YxZGHqvInr3OdeCmD03714HHjo0UESclyvDBofgfUF6uTGc60KL
	C4apnfpYk3C0YMesxMiTF3EdS8s8cl7w2GvAPWqz+iSeVO/bJGOfepVahkUzfuCgSc930ZrSGTl
	S2XYc46Pba7NizU83Gks3YgBcWKYmLt7B8iWiQb0l/jRCgDh/DYHRvGYgFuRhE64Z4J7fZ0on7W
	9eXA==
X-Gm-Gg: AeBDieu3lj14ylpeHYLqBqjT2Jou9QDh0ajrz71D4SpyPOVqNKZcs9cDd9hQosvWdb6
	ham356JsGF9DDq/clIvR5cQp7HnQidklIJvPvKVNWlFIi3ey5dat0nBsVfbIWQUv39ex6CfuxOa
	DgB3uNJSgnoh8BrUPIiYCVlR8NXCWJBA3snqejAdsaY4H0Xhz9Z5x2Olioh+3JfnMP+/GCW5O/B
	FzZTOimVkog3AVRpmqjoPLtqprg5GCzU1F0WR8Tb/v3l8u4Xp6z3u3/aClu/aX27HnOJWPy6DaT
	KcQWaONtT+xuqACvCo5oBKIHsfKxtpC7p9M7/4+xqKyXc2YyVTl7Tel3J1N/5AnRTRZDVsGGkQO
	MCa3V613zdGvXcaE/Q2TBlYzJwMKORurfN3wP0m4AJawSSilgSxfD5kogrms=
X-Received: by 2002:a05:6808:14c5:b0:467:de0e:feb6 with SMTP id 5614622812f47-47c3d96ee0bmr2047593b6e.11.1777475360095;
        Wed, 29 Apr 2026 08:09:20 -0700 (PDT)
X-Received: by 2002:a05:6808:14c5:b0:467:de0e:feb6 with SMTP id 5614622812f47-47c3d96ee0bmr2047563b6e.11.1777475359694;
        Wed, 29 Apr 2026 08:09:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b4216675sm6501075f8f.11.2026.04.29.08.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 08:09:18 -0700 (PDT)
Message-ID: <ca6c656c-07a1-466c-9c1f-a2efbf1498d0@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 17:09:16 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1MSBTYWx0ZWRfX1KFPHqYbMyNF
 5Ea/ZToli5L4vC+2bMlA0A21qaC8a/cjhUEtDJ2fufuh+6yaJi8MYAjjUUSEpv+HiFgmh98H/oJ
 oiwTOkTU0wgb7gzuYXbOrPC2vcW3dYiPQfMdQhkTFJWqKn7qs4Ao1DIqsFLOUapOA3hc0VVkuVR
 /mqPPGuh+BJUFunlAblhrG1FUz2jRkwfnwVbjeNc3VvFf1IYNeYDCWS1kO/F3cpQ58a/DK2KhHx
 EA2OcSBh40CApNqSbvmsm5TVGr/TZFqIIqUtJBDkOQg+RrWPOASnOJ9EZq51oEzncLLvPU1fSuR
 +EueLUkirwND6pEy9Fh/+5L3F8qSofiy3HCr13IDywOWirXTO4apXBKmB2nwyqNYCGBJ21pfqdn
 JjuFusabTDRyOWpk1o2Ta74pUhxJ8NhBzJtOrp1WppL/2bCC77iElu6bcJsBC/jfpHsAoUDXyCJ
 2HlcEQATlRiBckb59YA==
X-Proofpoint-GUID: XiSr9ZnLaEiE05i8Z44Eep3YgaNKgpZS
X-Proofpoint-ORIG-GUID: XiSr9ZnLaEiE05i8Z44Eep3YgaNKgpZS
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f21f20 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=XT8seR4E2Wfhm39xuMUA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_080922_516168_74AB1379 
X-CRM114-Status: GOOD (  15.69  )
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

On 29/04/2026 11:23, Konrad Dybcio wrote:
> On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
>> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
>> basic or fundamental SoC feature: bandwidth management between internal
>> SoC blocks.  SoC can boot without these, but power management or
>> performance will be affected.  These drivers do not represent any sort
>> of buses visible to the board designers/configurators, thus they should
>> be always enabled, regardless how SoC is used in the final board.
>>
>> Kernel configuration should not ask users choice of drivers when that
>> choice is obvious and known to the developers that answer should be
>> 'yes' or 'module'.
> 
> I'd say let's make them all `default ARCH_QCOM` - all of these drivers
> are required to boot (minus the OSM_L3 driver which is "only" highly
> desired, so that your CPU's bus isn't heavily bottlenecked)

So the few of them should not be a module? That's what you want to say?

Best regards,
Krzysztof

