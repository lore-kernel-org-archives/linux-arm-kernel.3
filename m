Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31796E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oF9Gt4jUsSVFBsboD3SxXYWnqJhf/Ez7AfP4JxIL9eQ=; b=qNvq6qtlZJuuva/2Xi+6DNU8ez
	JZ9dn8V7MPkv9KmZbKlTQSXXCu4rFH2r4tniPBxZILOcoiELlMlfOQw1X7vX8VxxyuFnj7xyclKiZ
	2VOWuIJ9A8Puu4q6k1KijSkUJwnVNc4enlFkj5Cb1ddxQCr2bF1HX0ZHPHhaoZsfkj2kd3SBqCFwD
	MC5jSTUHfcIsuzX6+s76IyZxXg1t7+8UMkg0vTR4u8PDKgPmyLgja7ivQ1ZbPeuB0JJR+Pa6cKGCJ
	U/kDAuZZ3PzPm10f3xbqoTF8SSUjfq8HjbKHcCSsRvCe71j5Wp5okmQqLBl0RXxKduUHJC+6fmpI3
	rXu47OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdt6-0000000586a-08SI;
	Fri, 20 Dec 2024 14:21:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdrw-000000057vQ-2Xp0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:20:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKCeGOx008042
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oF9Gt4jUsSVFBsboD3SxXYWnqJhf/Ez7AfP4JxIL9eQ=; b=ZgX4FUs9pJIBi5/4
	N5RTz48QS+/ZDy1iR/Sohak4vi9HVcCFpWqzjHtXA6rkcb+v3EZw7ONVh0DAB/ik
	ToCXxPOWACFb2PqSqeKNTPZTR8aEOE2IK75U60Duj+FjgfGpVua4G6EsmbRqvpcg
	4d1tr1OZyMDAohbGnQiPUThqzLnya+rcYA6lVcZ9TMrCkNDLGgBqpgMUGUW6i23A
	dTr4kAJWpgDcTqlUkCrJ1Ddf232qxOZjC4+LHCMUdgwBuco2RodhwVmn3Kequn0s
	VDTALlvA383TtGnChnbyRgulk43KhwslaHNAdiiGANEQOO2UjqWQG9hTc+SzvelX
	yrzEVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n8sgg7ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:20:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f15481bbso5604346d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704442; x=1735309242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oF9Gt4jUsSVFBsboD3SxXYWnqJhf/Ez7AfP4JxIL9eQ=;
        b=wwn9h80SQ1mJtuCoSiYzWFHjaVepo5Uh1zi06cxaXt/C50bUvB7D3CJaLb0ybmM/BI
         ZY/f/k+r/doV7i7vqymm2q4cHWyqgifF9kSszHMWj2tsvHpP3ay5E4a4SFuZ1sFxyD1Z
         XCW5NGCnRS5Rwnc6LTBg0PV3TcFJSLv7q9CJgi5GmbBzFbeJZLbcBvk68jwxDzt1FhWE
         ZoCS5UW9rbSja1VPOL9L2SGrVWWoxf2KpG4bIa/Q2aYSce+HtQDKhdRNu0abcwigL+hI
         CZni/oSCaOXLE2aamgHNx+zKJt5kuywqqwUysMXVyoa54MOMP2KOb6yNhwTPMUUOtPzN
         b7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV5sOnGfxVFWRMRIdojcD89TkIszp92VOhN+Cxo28qvLlUBcZR9TtYAKAbYMcF7fodZWtRHvAw/pALnCVes5tBr@lists.infradead.org
X-Gm-Message-State: AOJu0YzBHKtpqedFMDnd8ZaJIh+XnJEA3ZSOMAPPeqdN1G9Q0qo3zYne
	NaUVnNX9GSRUrNbxhMBk3nU956Ohdv8tfnD9nE+lBKpYXQVu2nICsv24dl+AkAnQgPvnBtEJczu
	NYEtV8Vke/PdJxix1z1HrdJOYff+AtazE/5AF7huBnWEyXMEx/S0WRO/JADqWUpOgzLwV1kEP2g
	==
X-Gm-Gg: ASbGncuM600RRxit5o04aWEQcfpsMUj1raVsalRnU/615WZ6prz0GmCB7Tn0raj8O7h
	OYv5v3I4dNp+QuYY+nMEFvMA+Ayg9cMmNV3G1LB1SpX7mI4fCeS1lVWt9870StdNwiyOo01bAQp
	uVb3wkJLs7I9vjb2od7/ajxb2/OG/lqQsO4ZmDfewYgp6IhEnrVgkyzYu54VS4Ox9y5i27jeGBt
	S3le8PFfurXdo9SKIzqQ1dFUgETTZ+rgxCD5t68s8eQX2+pDRqVUBueduq8d8rkf5Oynzie5whl
	2PRogXFncJoSbytnZ9ysYc53J5HoXFaK+MM=
X-Received: by 2002:a05:6214:3c9e:b0:6d8:b66e:d26a with SMTP id 6a1803df08f44-6dd233b1640mr17010636d6.7.1734704442226;
        Fri, 20 Dec 2024 06:20:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx88afG3o45UtefzCawfy2RE//adxw/WGB3ljEGjNT53HTDF4pUUmWxMynUrzD3E+f8jCNOA==
X-Received: by 2002:a05:6214:3c9e:b0:6d8:b66e:d26a with SMTP id 6a1803df08f44-6dd233b1640mr17010446d6.7.1734704441799;
        Fri, 20 Dec 2024 06:20:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed752sm1845135a12.54.2024.12.20.06.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:20:40 -0800 (PST)
Message-ID: <875342b7-3825-47bf-810a-effdbeacab46@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 15:20:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Sudeep Holla <sudeep.holla@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241113165329590-0800.eberman@hu-eberman-lv.qualcomm.com>
 <e4509104-c809-4d45-bdbb-a2d754a816db@oss.qualcomm.com>
 <Z2VXgkJ4x5TJTKJ_@bogus>
 <765bb1c8-31de-4aec-b8ef-f141a3e25c56@oss.qualcomm.com>
 <Z2V4IblZNgnS4T2Z@bogus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z2V4IblZNgnS4T2Z@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zNS2ZEbUmmAcNT8QhrfH7NcAoF_1EKRg
X-Proofpoint-ORIG-GUID: zNS2ZEbUmmAcNT8QhrfH7NcAoF_1EKRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_062044_671861_53C5F438 
X-CRM114-Status: GOOD (  24.25  )
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

On 20.12.2024 2:58 PM, Sudeep Holla wrote:
> On Fri, Dec 20, 2024 at 01:42:04PM +0100, Konrad Dybcio wrote:
>> On 20.12.2024 12:39 PM, Sudeep Holla wrote:
>>> On Thu, Dec 19, 2024 at 08:26:51PM +0100, Konrad Dybcio wrote:
>>>> On 14.11.2024 2:10 AM, Elliot Berman wrote:
>>>>
>>>>> I'm not sure why you'd like to support s2ram. Is it *only* that you'd
>>>>> like to be able to set pm_set_supend/resume_via_firmware()? I hope this
>>>>> doesn't sound silly: what if you register a platform_s2idle_ops for the
>>>>> relevant SoCs which calls pm_set_suspend/resume_via_firwmare()?
>>>>
>>>> S2RAM is what you get after entering a certain state, but currently
>>>> it's presented as just another (s2idle) idle state.
>>>>
>>>
>>> Just to be clear, I assume you mean CPU_SUSPEND idle state. There is
>>> no special or different s2idle idle states IIUC.
>>
>> Yeah, right.
>>
>>>> That means some hardware that may need to be reinitialized, isn't as
>>>> Linux has no clue it might have lost power.
>>>>
>>>
>>> Interesting, so this means firmware doesn't automatically save and restore
>>> states yet exposes it as CPU_SUSPEND idle state.
>>
>> Reading the spec, I'm pretty sure PSCI calls should only mess with the
>> power state of the cores, core-adjacent peripherals and GIC.
>>
>> Reading section 5.20.1 (SYSTEM_SUSPEND / Intended use) I think it says
>> mostly what I'm trying to convey:
>>
>>
>> "In a typical implementation, the semantics are equivalent to a
>> CPU_SUSPEND to the deepest low-power state. However, it is possible that
>> an implementation might reserve a deeper state for SYSTEM_SUSPEND than
>> those used with CPU_SUSPEND."
>>
> 
> Yes these text help to understand the interface easily. If they were same,
> do you think we would have defined 2 different interfaces.

I would happen to think that, yes. Especially since the reference firmware
implementation does *exactly this*:

https://github.com/ARM-software/arm-trusted-firmware/blob/master/lib/psci/psci_main.c#L179-L221

PSCI_SYSTEM_SUSPEND seems to be simply meant as a wrapper around a specific
CPU_SUSPEND state (which may or may not be only callable from inside the
firmware when SYSTEM_SUSPEND specifically is requested, for reasons),
in a platform-agnostic way, so that the OS can enter suspend without
providing that magic StateID on all supported platforms.
But since it already requires more elbow grease on the peripheral IP side,
I'm not really convinced it's that much useful.

Plus, the optional bit of doing more work behind the scenes doesn't seem
to be very wildly used across TF-A supported platforms.

So please, stop making the argument that it's any different. The firmware
I'm dealing with simply didn't expose the same thing twice, in perfect
accordance with the spec.

Konrad

