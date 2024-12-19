Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52B6E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBvXbwp3Z5qAtoea1jtuRITtWRYZCZbCO+D7z8/6g6M=; b=pH4oT803PjHnICWYV5Pnkx55x1
	IkrqFXSCiDxeH61mH84Q7932li702TX2Qrf4WRtUyfYyHdxAFLnf2RG1QC5xoSTm33M5PSLc0cpp7
	e/v5QhzMmaHXkmyyW2DUP+Q76VLYmMcQfYSo1MZXmHk/RW3EJYRrycFOeWBXW7WHwggZe6CNlGufR
	GOyJqgzaCAFD6RukJI1zp07Z+EJDR9nm/2U3GO9aKVgEM8wXgmufydkkTvDJ0J2A7kXOlHNk0f5Ou
	8XvfYwKqxSHM6GKotRllLG2FO0/IybKMS/ui80U4XLoxwF5VOnhfuh6Kty3bsSayHfk9Ttsyj8xWT
	cvxjvugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM5t-00000002q9s-0ruJ;
	Thu, 19 Dec 2024 19:21:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOM4m-00000002pu3-3liy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:20:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ9ha96032497
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wBvXbwp3Z5qAtoea1jtuRITtWRYZCZbCO+D7z8/6g6M=; b=jYxpnsYQU1NXYnf+
	OS4B/DC3iZo19qU8SJ59F/5gJnNa851l8rx4gV2aUBhVR6vaB3+Ev5IbcLiFqPcI
	v51RSNZgaVcK3KqPUU7SHo/82UTsHIyTgR77gWgujIbwqCernvPhBREZ16t2uDuf
	LADaSlryPCMUeVqLAAgM2lo2uzN97OxYlwJTTF8jaM+b485z7k4ZUA30anYGd0k3
	zWrbNV4qFybCo+H3urNI/d6P/BbHt9B/gJW8MOj2mBz5apbVgtbNHWO2NgRe6kvl
	WJgu/26zJrPKGWZoF1HO7whiqTcoCKMsaFONBx/rz31siy30nrG3ngG4iH1A17gx
	0fYgHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mh3y9fva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 19:20:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467922cf961so2750691cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 11:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636046; x=1735240846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBvXbwp3Z5qAtoea1jtuRITtWRYZCZbCO+D7z8/6g6M=;
        b=e8/Hzm1xUlshRGDglj2FTv9u8YnbFBfbDf5kW+oxgLYEHn7KfRZpN6HJBJQWaiY7th
         NoDOt6I7sBdVUGcKMdD82E7DeWdcapXA5XTni2gPgLjhG4XVp2/4M4EDul/dRSC0H9nA
         hy7pkEfOzeC230kRvpiHwA+LzYciGOQPocmy7UPDLMTMOfxL4uiH9YmTQ+Dnx/wO6+XL
         u2qiSPz4a7C73edohMJrmjzK/bKi+q1JPqTZZWPc8P0hm39QCW69qvOq72/GCFKMu10t
         FZsPxbatby/OmoNnPlFWjQLm8H/yistitnnlJIhtDSzWwhC9z2ZVhCVtHK0WgXsTx4W/
         m8xw==
X-Forwarded-Encrypted: i=1; AJvYcCVvR7qIh+TFzoAQq56TDP8+ESq6VKEH3bclVpDJ2EC51cz74VmwGaxLdp0qG3Iue/ttblfzR1eSY+Ta6CTaT9OB@lists.infradead.org
X-Gm-Message-State: AOJu0YzC2HYm4urXjnFswZcNnxX/U5AAsirDryt5tc1zyGFQ42J6QgFI
	UTMqg7PxhDYrX+AjN8z2TyXpsw9GEnLOOZZ/5VWKKGFo6Ar4m1OnNeJPx3TJDFbcX59CM0ZRk31
	k4cmf/58thb3vFtRs/w/OrsAUqaKY72K2vEt27Uqy+AGsKy18sbm29a7btj2Aw/Zts+rLirJAXw
	==
X-Gm-Gg: ASbGncu6YmillI5j7KbWqYCjE80mQ7Dwz5iiHpj8PzjjTNfvE+R4i8tC9XxXotr1GMz
	UXBI7vHf2Ir1bS1IKXhqn63EhNOOfJh39evISoz9vK+KhI+Zo0mOlO41HvjVEw63STnmhQ42LbA
	A/1M6u1XtR7tD8j7LoDBKDGEbfQbNyiok1ENs7untwOAZG5FYM4Rd74mWQK1pt7/iSHkcbX8AiI
	Fy0C7L2im5HxtrPBJP/OOV+QHlwPaiRg41yOqCx/Rrrkd+ycTcONmlg9wfwbNUkqtn6GeZLA44t
	25s+eRfuylfigKyB3TuljftoAuzvr8RaVJE=
X-Received: by 2002:a05:620a:1a9f:b0:7b6:dc5c:de2 with SMTP id af79cd13be357-7b9ba7d3b52mr2375885a.13.1734636046001;
        Thu, 19 Dec 2024 11:20:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfFJI3SfF9+L7vj78AuMQmMSoSWSb61NRFSwB4APgCi4WHPaENCa1K0rLdNwFxiCaOZHvbBw==
X-Received: by 2002:a05:620a:1a9f:b0:7b6:dc5c:de2 with SMTP id af79cd13be357-7b9ba7d3b52mr2373685a.13.1734636045439;
        Thu, 19 Dec 2024 11:20:45 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm921709a12.42.2024.12.19.11.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 11:20:44 -0800 (PST)
Message-ID: <476c1d1f-08d4-4413-ad24-a22cca569d7f@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 20:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
 <ce1d2196-cf09-4d27-8b41-372948a59e89@gmail.com>
 <20241112184301.6mlwpfzzowut36pn@thinkpad>
 <eeec6eea-edb4-414e-9c11-88054e3624e4@gmail.com>
 <20241113080540.mtm7nu7nqrfz27yj@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241113080540.mtm7nu7nqrfz27yj@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _ixttaipdIKt1_2Qqxm9dr3D5_X9XBD4
X-Proofpoint-GUID: _ixttaipdIKt1_2Qqxm9dr3D5_X9XBD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_112048_953012_B1472C7D 
X-CRM114-Status: GOOD (  48.56  )
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

On 13.11.2024 9:05 AM, Manivannan Sadhasivam wrote:
> On Tue, Nov 12, 2024 at 08:04:34PM +0100, Konrad Dybcio wrote:
>>
>>
>> On 11/12/24 19:43, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 12, 2024 at 07:32:36PM +0100, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 11/12/24 19:01, Manivannan Sadhasivam wrote:
>>>>> On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
>>>>>> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
>>>>>> CPU_SUSPEND instead. Inform Linux about that.
>>>>>> Please see the commit messages for a more detailed explanation.
>>>>>>
>>>>>
>>>>> It is still not PSCI_SYSTEM_SUSPEND though...
>>>>
>>>> It *literally* does the same thing on devices where it's exposed.
>>>>
>>>
>>> But still...
>>
>> Still-what? We can't replace the signed firmware on (unironically) tens
>> of millions of devices in the wild and this is how it exposes that sleep
>> state. This is how arm platforms did it before the PSCI spec was
>> updated and SYSTEM_SUSPEND is *still optional today*.
>>
> 
> I never asked you to replace the firmware in first place, so don't quote the
> fact I never said.

Never implied you did. I'm putting pressure on the fact that we can't
update the firmware on such devices to expose PSCI_SYSTEM_SUSPEND.

> I see this approach as a way of abusing/faking PSCI system
> suspend.

And I disagree. I can't stress this enough, calling PSCI_SYSTEM_SUSPEND
is literally internally equivalent to calling PSCI_CPU_SUSPEND(magicval).

> 
> Moreover, I heard from Bjorn that Qcom doesn't want to put the PCIe devices into
> D3Cold during system suspend for future platforms (based on their
> experimentation). So if drivers rely on this static information, then even Qcom
> cannot achieve what they want.
> 
>>
>>>>>> This is effectively a more educated follow-up to [1].
>>>>>>
>>>>>> The ultimate goal is to stop making Linux think that certain states
>>>>>> only concern cores/clusters, and consequently setting
>>>>>> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
>>>>>> NVMe, see related discussion over at [2]) can make informed decisions
>>>>>> about assuming the power state of the device they govern.
>>>>>>
>>>>>> If this series gets green light, I'll push a follow-up one that wires
>>>>>> up said sleep state on Qualcomm SoCs across the board.
>>>>>>
>>>>>
>>>>> Sorry. I don't think PSCI is the right place for this. Qcom SoCs have a common
>>>>> firmware across all segments (mostly),
>>>>
>>>> This ^
>>>>
>>>>> so there is no S2R involved and only S2Idle.
>>>>
>>>> is not at all related to this ^, the "so" makes no sense.
>>>>
>>>> (also you're wrong, this *is* S2RAM)
>>>>
>>>
>>> What? Qcom SoCs supporting S2R? I'm unheard of.
>>
>> Maybe you're thinking of hibernation, which is not widely (if at all)
>> supported.
>>
> 
> Not hibernation. The Qcom platforms I've aware of all support only S2Idle. I
> don't work for Qcom, so I may be missing some insider information.

I think this is the main source of misunderstanding in this entire thread.

CXPC is S2RAM. Not S2idle.

Shallower sleep states on QC platforms are S2idle.

>>>>> If you use PSCI to implement suspend_via_firmware(), then all the SoCs
>>>>> making use of the PSCI implementation will have the same behavior. I don't think
>>>>> we would want that.
>>>>
>>>> This is an issue with the NVMe framework that is totally unrelated to this
>>>> change, see below. Also, the code only sets that on targets where such state
>>>> exists and is described.
>>>>
>>>
>>> Well, you are doing it just because you want the NVMe device to learn about the
>>> platform requirement.
>>
>> And I can't see why you're having a problem with this. It's exactly how it
>> works on x86 too. Modern Standby also shuts down storage on Windows,
>> regardless of the CPU architecture.
> 
> It is not just my problem. I'm expressing the concern that NVMe folks have and
> already expressed over the similar solutions I proposed. And I cannot just
> overrule them.

Sure, but if PSCI_SYSTEM_SUSPEND implies S2ram, why should the behavior be
different purely based on the architectural idle implementation?

Moreover, if the same platform can be booted with ACPI or DT, why should
power state switching work differently, considering both would describe
the hardware accurately?

>>>>> For instance, if a Qcom SoC is used in an android tablet with the same firmware,
>>>>> then this would allow the NVMe device to be turned off during system suspend all
>>>>> the time when user presses the lock button. And this will cause NVMe device to
>>>>> wear out faster. The said approach will work fine for non-android usecases
>>>>> though.
>>>>
>>>> The NVMe framework doesn't make a distinction between "phone screen off" and
>>>> "laptop lid closed & thrown in a bag" on *any* platform. The usecase you're
>>>> describing is not supported as of today since nobody *actually* has NVMe on a
>>>> phone that also happens to run upstream Linux.
>>>> I'm not going to solve imaginary problems.
>>>>
>>>
>>> Not just phone, NVMe device could be running on an android tablet.
>>
>> 'Could' very much makes it imaginary. There are no supported devices that
>> fall into this category.
>>
> 
> Agree that there are no products in the market (yet). But having NMVe on
> handheld devices is not something I would quote as 'imaginary'.
> 
>>> I'm not
>>> talking about an imaginary problem, but a real problem that is in a forseeable
>>> future
>>
>> Keyword: future. This issue has been on hold for years because of 'issues'
>> that are pinky promised to happen eventually, without anyone suggesting any
>> actually acceptable solutions. This just undermines progress.
>>
> 
> Not true. There are solutions suggested, but then it always takes time to reach
> consensus. One of the approach that I'm about to propose is to have a userspace
> knob that specifies whether the device can be powered down or not (leaving the
> default behavior to put them in low power state). Because, the decision to put
> the devices into power down or low power state sounds more like an userspace
> policy. It was discussed at LPC 2023.

Sure, however I believe it is perfectly reasonable to change the
default setting there based on platform capabilities.

Konrad

> 
>>> (that is also the reason why NVMe developers doesn't want to put the
>>> device into power down mode always during system suspend).
>>
>> This is the current behavior on any new x86 laptop, and has been for a
>> couple of years.
>>
>>> And with this change, you are just going to make the NVMe lifetime miserable on
>>> those platforms.
>>
>> Fearmongering and hearsay. See above.
>>
> 
> I can only wish you best of luck with this approach!
> 
> - Mani
> 

