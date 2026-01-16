Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEAFC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=; b=HwxZ1+zRUnpCiJG2o3jVBEiQoJ
	kzaTKq21yl8ED+8fHCBZ8tsXH4c2PC1fJ0TssyRJPXkPs9nTwfYhUNqYBbf70Wh0Va+u6npOp0n/f
	2td/SgxB+h7mGZqNZ9+vTRXjFZT8uWjyYuWHepb6m/Vf3dD5bE+KA/GAErwtI1qF77eTwCcQEMA3B
	51XqmIsTWAiKPi5N8xMqgIEJFPOZ3dq0YFd6FC5yf18CJD3bgMTNQufE4rpvlX2wM2X6Yu1dwLM7R
	5I9WSSj5pjwvtR+3ZVD4Vsg4K/GftKegMyS4MpLteKKHBSxeBGHYH8wmTR3kQB1ltN7E8CQBgQVqe
	Li02GP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqp2-0000000Eph5-23uN;
	Fri, 16 Jan 2026 20:53:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqoy-0000000Epgf-3rC9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:53:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GKbIIF1631511
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 20:53:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=; b=V5NjiLj6SLQg9jV+
	VgEl1f1+oOQcLDU5RMGbv71l9rwnP8xOWu7HOjGj7cU0ycWg7xaQagVbEYfj0VpF
	7BdTZprYP+jt9nTxVV4bxdYhBIpHShUScEvDGzVo1R3heQ6octkhe2az95fFblzA
	kFGpkNfYjU4vtyqfuVVzEWiBWColSs1vaXcxjcE15vN6QzFGP1M4LcZOXUklTGVX
	M160P3lnxZybWGrD90CSFdsLqGAl4lezd1iOV8S4IN4ZG3sLqGofS/GOofNi0l2b
	yRsngRKOuFcTEMx+rYvRmGfIKTYqQ1q/07N/DHmPYFPHb+jzMIoixRDsIG8hGso/
	3nxZGA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvh7r127-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 20:53:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso2639809eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 12:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768596805; x=1769201605; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=;
        b=KI99BIUBNSMHnjvl6jqlRpMpJ17IfcErNkrdxvlgR0ea74JMmsfzRsLQmMCkQmxrSk
         A9TiOAuFnS0jM4DJ0j8tebChooQkzF/eRkrpPXEJapf6sWVEKZTRTIcMjvSVtEr8Mpxu
         D3rQq723rEtPa0nZ9WpQMxYnl4auz6YwhddQ8aBZzf4pmBunc/4PA6Yfb4nc4PKIu/BD
         q+QQ5LbUgizAzKvJJEeqyS+Ak2uMaLJKCe0U48t3NBVB9ua4tVMcLljY5f6KDMQH/VTx
         DBbZa+g1MhC4C/JioLebd/1saitQNAgppmBmOOEdsJNxTXF/3Me/B25R67UbXCeW5DnF
         cgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768596805; x=1769201605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWaQldqNv27w0LRRXVsBa0F3ClSqPPGePLVqAKt5/YQ=;
        b=OZizaHMnXGqLFbJ0gTj774afceSwIu4eTWdRgNQoKdZ3UBDNRWGy2nnuC93AQia47A
         R2myQoTV796NG5oRMxpXofRHzdwX9npOOpgf/WAj/LS2rwVjIvOdzoo5Ipe0HMrgXlAC
         6WrLCcJx/R7mBa1OzyX5ASIpXB4wTTULgaqX3roIoeJZsAxiI6BBzDStVea3MOhvX/yg
         aYB2VUKxpgAAzPPErEi7p+Wa4yWZNpw7n5Uid0MADVkhSMYf/SH9yIfZjHaaWfL5i1LE
         tG5YxDNXDBLU2zmGKxVpF87rgogNBYRFoR2INFup7gzkaqTaNz8yvEGoK9darswXkc6p
         SdzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBoOau2UysdAOXie/qYJP9DVNrXcpqJVOUyG12H79AFkxPZlPuD0UuopHDgEZFsunQzjWUsLKTVkI1ftaToUcw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1z24vN8/ANIlpFDVMFP2ZpJ4C3HB8x3broTq8goBqYKrc77kW
	pNbvekowaEhh5vVRYlNirPf3FnYxuL7mQ8gPurHYEodwenYBdjkWsTlGwLLDGzxH1Pj8vUccmEa
	6vZ86d9r91X4z/lzLJyh5HBSrT4SpEgDhaQhx4OFz/c+FE2oIc49dPUxcaBKtugvO5+YEQsr7ij
	6AcXdf71WqvQ==
X-Gm-Gg: AY/fxX7v1KU8PGU0oD95jLvDFWA2u0LJGVpuCPQRHZvbYPzNHrsN8A1WAW9eeoO0bVG
	7arS2zO+4VqKjcfUgx5ato66JsC5L32/vHuH8f/mn/KYVS5tLZdUSgIagi2/YA6Bx5RzkbThaP0
	jMrOqv42Gyzy3V3jOO6xWvy+cBiBRpao2rdMoryWBU3pT9SSgEsKorgrqCfPARXijzYxThUI2eS
	2GauyCmk/2KeghrkluKod3fpdS7tKwH+b7wZfA0hCev/HTomVLfRo6lvHwdP76T3DWa39BdnEAv
	RH24Vw/lBkOf9eo7+6nRMj1jWQeT3c5aj7h5WvPg1Gz45BL+O6JZ2Nlwdlka57xJ2jzJITZw7u1
	Gr7CBbql3hLNZWiyVt/9AU4cfusxdbmDcPJHBUX/JfiZKS4QZaPTj2DmoR8XE
X-Received: by 2002:a05:693c:2d93:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2b6b3469163mr3076821eec.1.1768596802865;
        Fri, 16 Jan 2026 12:53:22 -0800 (PST)
X-Received: by 2002:a05:693c:2d93:b0:2a4:3593:ccba with SMTP id 5a478bee46e88-2b6b3469163mr3076750eec.1.1768596799664;
        Fri, 16 Jan 2026 12:53:19 -0800 (PST)
Received: from [10.73.212.179] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c1177sm4248712eec.7.2026.01.16.12.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 12:53:19 -0800 (PST)
Message-ID: <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 12:53:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <aWY6kx8Bwa_2azIl@bogus>
 <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
Content-Language: en-US
From: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
In-Reply-To: <aWoVR4oNdIHnksJQ@bogus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE1NiBTYWx0ZWRfX4fCqDJqGAzpz
 vaRE3AqEvlgbyw3Vr/BQ9qQqE30S4kC3eMoUfdkwksLUChyshaGxtbLSRikejwMMugXQNi6WT8N
 Lp1XD4d02dUIilx3V9zaHkz0nJxi8MMVX5gAIkcw86fKuuIi+xM2mUj54zCYeHU26hEgkjIKrLH
 PHDISDXCSnFuvX0QN/SGvzHL0xPWstxM4ENVY12f6LS9Yn1wwtb6cVxLTE7L5NaAsCEw/qOV1qX
 3QmFTTobTymie8WN8pPPBZkkKAoEOWcWIOtlc1JAfUoa9WKlWXQOo0E78x1+1qk7N1YQrnQAqh8
 e2aAlLSOH2vfnqG1UGhOu+2G3U1n7keCV+xSMZ62zdw3Ry/6gW+w91JfzGYAYJtsiu3e3IRV/Dq
 5jGuCZyWPfhdnBEQhroDTqVm5jQA7fuLJBwqogNiP+elSGV0rk2yvqbiwkJUs99ILVVCLFL0KsC
 v66xjfu30XptREBl6Wg==
X-Authority-Analysis: v=2.4 cv=Q/nfIo2a c=1 sm=1 tr=0 ts=696aa545 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=4G8C3JpcgD8cdIvRuoQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-ORIG-GUID: W_YVqEEkPJfAtbrBpoOlAGeCjsz8mT7s
X-Proofpoint-GUID: W_YVqEEkPJfAtbrBpoOlAGeCjsz8mT7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_125329_085766_B7C7DD44 
X-CRM114-Status: GOOD (  41.89  )
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

Hello Sudeep,

Thanks for the discussion & feedback.

Wanted to check on below possibilities to disable the SMCCC SOC ID at 
the vendor end, can you help comment?
1. Introduce cmdline option
    We are trying to pursue that in Android Kernel - 
https://android-review.googlesource.com/c/kernel/common/+/3912874
2. Mark SMCCC SMC ID driver as tristate & module as suggested by Dmitry

If any of these other options are agreeable, will send separate patch.

On 1/16/2026 2:39 AM, Sudeep Holla wrote:
> On Thu, Jan 15, 2026 at 10:42:51AM -0800, Satya Durga Srinivasu Prabhala wrote:
>> Hello Sudeep,
>>
>> Thanks for the feedback.
>>
>> On 1/14/2026 1:01 PM, Sudeep Holla wrote:
>>> On Wed, Jan 14, 2026 at 08:50:23AM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>> Hello Sudeep,
>>>>
>>>> On 1/13/2026 4:29 AM, Sudeep Holla wrote:
>>>>> On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
>>>>>> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
>>>>>> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
>>>>>>
>>>>>> On platforms where a vendor SoC driver already exposes widely-consumed
>>>>>> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
>>>>>> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
>>>>>> of a vendor logical ID like "519") and breaks existing userspace consumers.
>>>>>>
>>>>> Instead of relying on a vendor-specific SoC driver, we should consider
>>>>> disabling it and using the OS-agnostic SoC information interface provided by
>>>>> the firmware.
>>>> Would like to add some history here. Vendor interface existed [1] even
>>>> before
>>>> SMCCC SMC ID was introduced [2]. And there are several user space entities
>>>> which
>>>> uses the soc0 interface already.
>>> True, but that's not the main point.
>> That is one of the point which needs to be considered in my honest opinion.
>> Vendor driver existed from long time (v3.10 Kernels) in Android
>> https://android.googlesource.com/kernel/msm/+/refs/heads/android-msm-angler-3.10-marshmallow-dr/drivers/soc/qcom/socinfo.c
>> and lot of user space entities in Android depends on soc0 which is not just
>> limited
>> Qualcomm user space, but also, 3rd party ones.
>>
>>>>> The presence of this interface strongly suggests that the
>>>>> firmware is designed to support multiple operating systems or software stacks
>>>>> that already depend on it.
>>>> That is correct. We started seeing the issue with user space when our
>>>> firmware
>>>> started implementing support for SMCCC SOC ID recently for non-Linux based
>>>> product.
>>>> As the firmware remain same across OSes, user space is broken on Linux.
>>> What exactly do you mean by "firmware started implementing support for SMCCC
>>> SOC ID recently for non-Linux based product" ? Does that really mean that
>>> you can change the firmware for Linux based products ? I don't think so and
>>> hence we are in this discussion.
>>>
>>> 1. Either it exists in which case deal with it by disabling vendor driver
>>>      and/or fixing the userspace.
>>>
>>> or
>>>
>>> 2. It doesn't exist which is not a problem.
>> Allow me to add some more details, so far, our firmware hasn't been
>> supporting
>> SMCCC SMC ID.  Due a requirement on non-Linux based product, firmware
>> started
>> to support the feature and same firmware is used even on Linux Android
>> (android16-6.12)
>> based product.
>>
>> I would say, firmware started supporting the feature on our newer product
>> instead
>> of firmware being updated on any older products.
>>
>> Now, as the user space remain same and is relying on soc0 interface already,
>> user space is broken as SMCCC SOC ID enabled by default which gets compiled
>> into Kernel and takes precedence over vendor driver which is a vendor module
>> in case of Android.
>>
> See below example of lscpu and HMP.
>
>>>>> Aligning the Linux kernel with this
>>>>> firmware-defined, OS-agnostic mechanism would reduce vendor-specific
>>>>> dependencies and improve portability. Any gaps can be addressed by enhancing
>>>>> userspace to correctly parse and consume this information.
>>>> Agree. Updating entire use space would need time and we are looking to see
>>>> if vendor specific interface can be given priority over the standard
>>>> interface.
>>> That statement simply doesn't make sense at all. Your product took all the
>>> effort to implement standards and then you don't want to use it at all.
>>> As per your claims it is not even broken(in terms of data from the sysfs
>>> files), so I don't know what to say here, sorry ?
>> As mentioned above, the requirement was for a non-Linux based OS which
>> impacted Linux Android baseline.
> Read that again and think. If other products can cope and are made to cope
> up with the new SOC_ID interface, why is Linux so special not to follow that
> and fix the userspace to start using new interface. If just getting ID and not
> name is the main issue here, consider moving to the updated spec or patch up
> in the userspace.
>
>>>>>     Given these
>>>>> advantages, why would this approach not be the better long-term solution?
>>>> As mentioned above, existing user space will be broken and fixing existing
>>>> user space is going to take time. As the feature itself is "optional" from SMCCC
>>>> specification, if we can't disable by default, we should at-least have a way
>>>> to disable the feature by other means.
>>>>
>>> The data given to the userspace from the kernel is not broken.
>> Yes, that's well understood.
> Thanks and that dictates the direction of these discussions.
>
>>> The userspace
>>> tool seem to have made a wrong assumption and can't expect the kernel to
>>> magically fix the issue here.
>>>
>>> E.g. We didn't disable HMP(a.k.a big little platforms) as the assumptions
>>> made by several userspace tools(e.g. lscpu IIRC) was wrong at the time.
>> Sorry, at risk of repeating the same thing again, the user space was using
>> soc0 interface on Linux Android products for a long time base on vendor
>> implementation. While I agree that, user space had some assumptions based
>> on vendor implementation, if not disabling the SMCCC SOC ID by default, we
>> should at-least have a way to disable it (via cmdline) based on vendor
>> requirements.
>>
> It was the case with lscpu too. We didn't disable HMP just because lscpu
> didn't understand or just read cpu0 data. It is exactly the case with
> the userspace tool you are mentioning here. Kernel is not providing wrong
> data.
>
>  From the ABI document in the kernel, it has been marked as socX since its
> initial addition in 2012. So clearly userspace got it wrong and no one
> realised it until now. There is no argument that data provided from the kernel
> is wrong in these discussions. So I have nothing else to add unfortunately.
>
-- 
Kind Regards,
Satya


