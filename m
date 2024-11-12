Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001FAD42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdA4An5nc/kq++pn/vMUSAwdZSFuSM5pnWnAccJINIU=; b=Jysx3D869iOoiYMPcy5h9fhJHm
	fcANZ0wcn1G4l6lalfj85q/svdmv4bxA9k6Vg3zl9OGZlxOpttkEpzwjbDjs6/PRj5jV34b83A6cQ
	AKI1WDwI9VprdOu5RxBMtL21EHtV3ciaTKBuBjh0TtxBK47cTM3d4YXEo6NBo39sCz6JYBfswsOmj
	2A3X7FemXwO5oyfLy6gVHrffzh0/os5KiUuHfiI3qFWwHAoa+cnP8Uf5uwThiZTE1OtVzSvslKMqu
	kdV9y691j0JTJqNEsjX53+pKdgg6lgPJeLEd8wTiR2zUh++ns9EWdTpEZ6EIXaXE46Rykd2wTua2w
	U77WtgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwDk-00000004eio-21Bh;
	Tue, 12 Nov 2024 19:06:36 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwBw-00000004eXr-1Lsd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:04:45 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-53a097aa3daso5882679e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731438282; x=1732043082; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vdA4An5nc/kq++pn/vMUSAwdZSFuSM5pnWnAccJINIU=;
        b=gCbSHNuATDvAbtJBrE+vsjyDPolPxHDwqVhgWzhjVZ4ik4Rr0cweZXNmGwxOg48uL4
         gdIGKN6NYOTUlwfPxlVdhUgi2LB/MxWRCVf/eFfubObdVct0AV5kfKYYr+f+Z/eKXaPG
         XJ+mppLsc0ZYchxmJiMZqMNF02iw2SpRFEr34Rt80CodAYegRKecWeWn7pJTgkAOMsip
         KeQyBlstx6OMjVMqGIy9c2ki4a3KNYTEZz44JrTI2U+Lh8eH8Imr+HJAeGwi+Aft4AtF
         nKt1tsZV9f6brd9G2c0HuoS4VAMXhmkKod5aMoor7bEuHKtOI2rfQfD1DPlJwz1DKzCv
         DBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731438282; x=1732043082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdA4An5nc/kq++pn/vMUSAwdZSFuSM5pnWnAccJINIU=;
        b=CeRNud+sa4rlY/0wG80e5bmAI3Dv1kBb8QWtgyFrgvFPGBVuLOJ0484SjQIFtUmA/A
         6DNp9dCMHcsrTMtwQIZICNV8R1aIvcFbYhE/NNf+N1N8yAQx2hDE/16y1RGY7qoK6UYo
         z3qz8RIRpmTx8Qf5mF3GvCwLLkafTjZVLlWHL+W/eIToUydflf6KoFfWhkFzOvXEOiKr
         UvPBRhnMBYFopBq/3ADkZhqgHiL3gcP+qYaUGEDaLRUnm9OX350yn3+JTXzNNPVVZO+2
         h6CYyePTHFXK5NxEk7O1PoQM9BRLTrkNIW6HY6DkqTAS++uWko7kmXe3BT8qdPJ5XDfj
         qgCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnSLubb9pdozhAKj/jj+IyGiGa99tpeuBToJG73VmqlLV7VDvp9bBNfAOTRs3n3TSVOZRmRpEgRcfyvsJzQztj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2UPHKxOsbIMNksvJi75AFHqtHPOVI8hHYOCKC3ozRDWklVVoV
	HcVCCvMVd3felytYsQ+h3V02neW3kvul4eyf2XED6Z0IINzZ/qUA
X-Google-Smtp-Source: AGHT+IGTfjJzBmlEh0F09o4pe6eps18TqfRd2n+spOOcamHc3AmWBPrKmjyv1ZnqZ2YeFmFp6R8sHw==
X-Received: by 2002:a05:6512:3d1d:b0:52e:98f6:c21f with SMTP id 2adb3069b0e04-53d862bbc2fmr8838259e87.16.1731438281827;
        Tue, 12 Nov 2024 11:04:41 -0800 (PST)
Received: from ?IPV6:2a00:f41:cf4:1aa4:180f:4639:612e:9702? ([2a00:f41:cf4:1aa4:180f:4639:612e:9702])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9b50sm1957035e87.182.2024.11.12.11.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 11:04:39 -0800 (PST)
Message-ID: <eeec6eea-edb4-414e-9c11-88054e3624e4@gmail.com>
Date: Tue, 12 Nov 2024 20:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
 <ce1d2196-cf09-4d27-8b41-372948a59e89@gmail.com>
 <20241112184301.6mlwpfzzowut36pn@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20241112184301.6mlwpfzzowut36pn@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_110444_404707_1D4EB580 
X-CRM114-Status: GOOD (  32.78  )
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



On 11/12/24 19:43, Manivannan Sadhasivam wrote:
> On Tue, Nov 12, 2024 at 07:32:36PM +0100, Konrad Dybcio wrote:
>>
>>
>> On 11/12/24 19:01, Manivannan Sadhasivam wrote:
>>> On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
>>>> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
>>>> CPU_SUSPEND instead. Inform Linux about that.
>>>> Please see the commit messages for a more detailed explanation.
>>>>
>>>
>>> It is still not PSCI_SYSTEM_SUSPEND though...
>>
>> It *literally* does the same thing on devices where it's exposed.
>>
> 
> But still...

Still-what? We can't replace the signed firmware on (unironically) tens
of millions of devices in the wild and this is how it exposes that sleep
state. This is how arm platforms did it before the PSCI spec was
updated and SYSTEM_SUSPEND is *still optional today*.


>>>> This is effectively a more educated follow-up to [1].
>>>>
>>>> The ultimate goal is to stop making Linux think that certain states
>>>> only concern cores/clusters, and consequently setting
>>>> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
>>>> NVMe, see related discussion over at [2]) can make informed decisions
>>>> about assuming the power state of the device they govern.
>>>>
>>>> If this series gets green light, I'll push a follow-up one that wires
>>>> up said sleep state on Qualcomm SoCs across the board.
>>>>
>>>
>>> Sorry. I don't think PSCI is the right place for this. Qcom SoCs have a common
>>> firmware across all segments (mostly),
>>
>> This ^
>>
>>> so there is no S2R involved and only S2Idle.
>>
>> is not at all related to this ^, the "so" makes no sense.
>>
>> (also you're wrong, this *is* S2RAM)
>>
> 
> What? Qcom SoCs supporting S2R? I'm unheard of.

Maybe you're thinking of hibernation, which is not widely (if at all)
supported.


>>> If you use PSCI to implement suspend_via_firmware(), then all the SoCs
>>> making use of the PSCI implementation will have the same behavior. I don't think
>>> we would want that.
>>
>> This is an issue with the NVMe framework that is totally unrelated to this
>> change, see below. Also, the code only sets that on targets where such state
>> exists and is described.
>>
> 
> Well, you are doing it just because you want the NVMe device to learn about the
> platform requirement.

And I can't see why you're having a problem with this. It's exactly how it
works on x86 too. Modern Standby also shuts down storage on Windows,
regardless of the CPU architecture.
  
>>> For instance, if a Qcom SoC is used in an android tablet with the same firmware,
>>> then this would allow the NVMe device to be turned off during system suspend all
>>> the time when user presses the lock button. And this will cause NVMe device to
>>> wear out faster. The said approach will work fine for non-android usecases
>>> though.
>>
>> The NVMe framework doesn't make a distinction between "phone screen off" and
>> "laptop lid closed & thrown in a bag" on *any* platform. The usecase you're
>> describing is not supported as of today since nobody *actually* has NVMe on a
>> phone that also happens to run upstream Linux.
>> I'm not going to solve imaginary problems.
>>
> 
> Not just phone, NVMe device could be running on an android tablet.

'Could' very much makes it imaginary. There are no supported devices that
fall into this category.

> I'm not
> talking about an imaginary problem, but a real problem that is in a forseeable
> future

Keyword: future. This issue has been on hold for years because of 'issues'
that are pinky promised to happen eventually, without anyone suggesting any
actually acceptable solutions. This just undermines progress.

> (that is also the reason why NVMe developers doesn't want to put the
> device into power down mode always during system suspend).

This is the current behavior on any new x86 laptop, and has been for a
couple of years.

> And with this change, you are just going to make the NVMe lifetime miserable on
> those platforms.

Fearmongering and hearsay. See above.

Konrad

