Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C66C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pc6KxO6xh4zaSrcFhKD91Fl76TRNxmoAYzgik4d1dlo=; b=A4gx7+HjGXzzfITrA2fs7h0HNh
	ZJpouTmNS2iTXnWAWYCylaHwR4LCw/9/b6CGMc6NNQZVWzwm93jHKmwcJQPx3T5JUKLvPYcM2CHG1
	EFuSuI8jtWXXp5eno4qBhTwK2woViAOyxsqjo5PdfamJcM5R9DsUp8tH9UHj4A3lJscz6YuZ6iUN0
	B21wCYsJ9pHs/n+72BMQFBLj5lFKTTEbbmh/czHZAJNnLupnedyFej7iO+WKJCapDUJe9M1VMU8yF
	ikW2nN3vNSlSypb0/5uawXTwajZA0xvYBi6FC9gALEJ8+yPV9lKoYmNkCz5ZJsnW/Xa77gKThagYq
	aLo4Sp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6mb-00000008zIT-0buh;
	Tue, 21 Jul 2026 09:29:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6mZ-00000008zHy-0apP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:29:00 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6ExgA933212
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pc6KxO6xh4zaSrcFhKD91Fl76TRNxmoAYzgik4d1dlo=; b=IPPhBua4b5Qx0rSA
	XP4Q8DYw9P7x9yqJWFihYyMjnkBuuy2TxJYB18LJa4q1McjJQhMlAXE5Wuhvp1iS
	zbZv7VQOGds/RGgmYo1cQHuBauWNXdsqwNFqgS+rqJOsmdkaI3B0DEt3mFqX8jh+
	7WsqzOA7Dw7T3os6E4mkFViI+TPchskNE59TuDLv+wDkO6Xt8pfKekWkOca7vsyN
	HQ+8/cX7Yjs1DJ+RXgGgjmlN2/5/ctItw1/el80FGt6ARuex17LpeQkjflu4Tud5
	gGDDI0hbuK/Td2bn9fM7AmpQsHYwjeVXKjRcbps86kFi2r5uiZ27WhRRHjTYZqOv
	29wLuA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5uqme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:28:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38827cee19eso12125590a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784626138; x=1785230938; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pc6KxO6xh4zaSrcFhKD91Fl76TRNxmoAYzgik4d1dlo=;
        b=FS6J+m9NYF1Q987qF4AlagMjxrgSy/zmPt02IPdHis4MbztgXF/LYNst/NMjivFFf/
         QlBk4hnJQC3H0CHp8y5XdPriz70DgMZ8DE38z9YrCHUJMyCfhOxR3wNU7WBgyNgGwAgp
         gP76hfQwrfsxEco5vGELLGFD5jCISCaEZtE7TytW9Cdclq1/9laRfrf+GzGSIn0T4+jq
         07izjkbnAEcZBNwDGOd0AEUqDKKZJpBPaSa/y5j8degtpPQOUfUSrASpOClhKYbCtGEV
         u/uXGq0gQ9/K/ljw+GjKkiwnprDTMf0LbklGCJTJ4NHjrVWJWqnU6tYa2T+/R+hLkkpO
         FgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626138; x=1785230938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pc6KxO6xh4zaSrcFhKD91Fl76TRNxmoAYzgik4d1dlo=;
        b=WOYOy+8H36VYd2u/m8LoBKOU51orwrJourEG6aj7/XMos6GR8fA0B/q+j4l/AdrMPJ
         7XHXzovvdQ8ZVcH2/Ha4lleuBHR/DsUf0jqLBi/gTHOAha9OICgTxbOMXWjpts/l/Q9b
         RmAcS03Y54f6weFSquG86WVHXKQJNNzgxpSeT6X49ONh+R3NJSfuZdvOZrqcVIK/FYZN
         3fnr+qCydCW5srn9sdAjTXWjPQd05G9CVq8Eg172tWg0x70oRNHIReF56Fz8pN3hxO0s
         gyklPXIvsrNozxbvsfBQRYL8NQORptKQZLJ335T9usHHWHps3MCystT+V38zit1YrEow
         8DjA==
X-Forwarded-Encrypted: i=1; AHgh+RrhPfX7p+Nyp3UySdnh9aK++I9KbmbgXd350oIBGOPiVSOJj5LFDWHN9bZXxrUeOGlf6oaaoLQcYussvPByT/Kj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Mlm8VWiiZyrFZpD2O1p3XMhRjmwnzzPMro42ajxIuZj+ULsJ
	IFSK5kP0NE/PbMfPiY7vKvQHSm0IRpIL3SUm11uO9CuCWMqQRgCd1+3kc0mSnq2W2FmBrgbYEj7
	Mcf5Gt+j8UkUwW22n3a8EUsVkdPJrOhztoRPJr6B9vqsR8IM38SfxlA+z08B+ZHDv4uSsCjKm6l
	+uEg==
X-Gm-Gg: AR+sD11rttfnTXEDD9STh58F4LD6cs/8juZyUQPUDHdY+Uo6aWtYJe7dpendQn18l48
	WFJ22j8ILP1x0GJx20q1nEKLfUO5b6+mnVO28sFp2x4q/KRwA+xx5cZlCWQIf0ZgJ7BEZOZGWBY
	mQSxSuOns2zuZT7cmFEHGPEUzZHar26mMPLuPH6mnAA1DXOcOdsh0whFXXvITcutpJpDe/Sc/Wu
	Sj9ny405oefj2Gs8Powx+JWXtWzVsTFyu2T35PMKYQviNjkRPr6N5FfAvrHccVBlE7Uk68BVwEo
	wVWlLEqPX4GwBMJwxXK7JKuvdmOaCWMrGAfpge/EV4CMsAIcFSb3QMGsVPTDP3j9xxCyjqmsBvi
	OSE0bUj6Lo/UHymdEAyvcobr/xsOB
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38e4b410109mr18418054a91.12.1784626137871;
        Tue, 21 Jul 2026 02:28:57 -0700 (PDT)
X-Received: by 2002:a17:90b:580c:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-38e4b410109mr18418025a91.12.1784626137393;
        Tue, 21 Jul 2026 02:28:57 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d093bd8f6sm3740252c88.4.2026.07.21.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:28:56 -0700 (PDT)
Message-ID: <05081037-9ed8-4e0d-8480-cfa45e950727@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:58:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Disallow disabling boot CPU based on config
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260703-disable_boot_cpu_offline-v2-1-782d16ff58c3@oss.qualcomm.com>
 <20260703-competent-adaptable-coot-f8daaf@sudeepholla>
 <4b7fe7e6-2531-4d26-9085-43f40a2ce2e0@oss.qualcomm.com>
 <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260706-practical-inchworm-of-experience-d4e0ed@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r6EimwZUBqSIIu1aYPyI7awZfzr_wGSP
X-Proofpoint-ORIG-GUID: r6EimwZUBqSIIu1aYPyI7awZfzr_wGSP
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5f3bda cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dWC8hVThGWP9nuoixJoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX7MWGFiOSJi46
 /IPxEwAV0ADAuKoYeOYpkYworf/Zhz0zpngBs5w6S/xgP1Tsf2YQ0/7qWgBUkIwvXk4LqpoM5/v
 l7TjXrlZmLrDnsqRIU6fGqFYk5z++fU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5OSBTYWx0ZWRfX6AUo7Vg4SMYw
 mynifiRxjcvy0b4BVjskia56EE5koRYpgGtCc5ta5f2tMpZfwsnkDpJBJ/2BYe68OmhUhaqwl8u
 HvOZn04PNIrxaoRht1J33yrPt8LXHNNb27k9bMb4Umox0NKbUvxrSunWETGsCp1CREfOtGwN+V9
 iX19qhjPJ+Z1DHmgad5yLoiS2yqXrzeI/2hkRbIkDEDepNHekilakSk7nV2SnUogFPDwQA7MyYH
 JsfoIT05Pe1PWTRtaFhv7NEdTIvYG71Yi3nI0K40R//6EEl3U4Kyx4LL9I+R2q0l20s0/0Z29GK
 MRCYVcRIfAJxwQAvqSNuW0/ggw+jvGSH7sizFfViF5FXrlobSRhFt3K9MBOGS61w2DayGXCR8g0
 lha6ldByST/skz0CxEStK1vz2Xyx0wVBFhjc2YsJ/bJEdM0KLRksuI2XdDMcniwXAaq7xmP2wSW
 AJR8L6Nqrtyy63P/zrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_022859_181102_45249EC1 
X-CRM114-Status: GOOD (  20.59  )
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



On 06-Jul-26 2:46 PM, Sudeep Holla wrote:
> On Sat, Jul 04, 2026 at 08:43:39AM +0200, Daniel Lezcano wrote:
>>
>> Hi Sudeep,
>>
>> Le 03/07/2026 à 17:51, Sudeep Holla a écrit :
>>> (It is always good to cc all PSCI maintainer for any ARM64 CPU
>>> hotpug/suspend related changes)
>>>
>>> On Fri, Jul 03, 2026 at 04:50:02PM +0530, Sneh Mankad wrote:
>>>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>>>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>>>> retained. The hardware design on these SoCs forces a constraint to suspend
>>>> and resume the system on boot CPU / CPU0.
>>>>
>>> And you fail to explain why they have that constraint.
>>>
> 
> I still need the above to understand the issue/constraint better.

Above mentioned SoCs have boot CPU fixed to CPU0 in HW, whenever SoC boots up/cold boots it starts with CPU0.

These SoCs support suspend to ram which leads to ACPI S3 similar state (where SoC is turned off and DDR is retained)
PSCI SYSTEM_SUSPEND typically will be executed on boot core itself unless it is already offlined and non boot CPUs gets
offlined using PSCI CPU_OFF.

As HW constraint always makes the SoC to boot with boot CPU, consider a scenario, where 

Boot CPU is already disabled / offline => suspend to ram is triggered => SoC enters ACPI S3 similar state (only DDR is retained and rest of the SoC is off)
<So far good>

External wake up arrives (say power key press) => SoC starts booting with CPU0 => CPU0 becomes first one to "land" in kernel now. 

Kernel may later bring up other non-boot CPUs via PSCI CPU_ON calls.t 
However Kernel had already marked CPU0 as disabled/ offline but same ended up in kernel without PSCI CPU_ON call.

To prevent this inconsistent state, before starting suspend to ram, need to make sure CPU0 is always online from kernel/
disable offlining of the boot CPU.

Although the HW constraint needs boot CPU to be online only when suspend to ram is triggered, current patch disallows disabling it for simplicity.

> 
>>> Is it because some secure context is not allowed to migrate ?
>>>
>>> We already have a mechanism for that in place and this hack is not at all
>>> required.
>> Do you mean a mechanism for the secure context or for preventing CPU0 ?
>>
> 
> I meant constraint based on secure context.
> 

This is not because secure context not allowed to migrate but above mentioned HW constraints.

Thanks,
Sneh


