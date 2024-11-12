Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6FCD42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UCG7gigTfhNtGBIssbVQwzzj1879iTBqBc1MZAvgpY=; b=No+Pd5e1CuNTCXG7WGFCppVmuW
	i6/IPC1b0dUkGds9jYqFff1IM4NIURcuQgRyTgxobGs9Uz6jCV4+I0HUJMZ7987iyEKGGw72t01e+
	uwYodE5nzIrdolAHvmkXlD5KlEgDDe9FT/VVqA5n6sASlzgHVEsrK5kryYMt86gvKEVo1Z3SlnqWX
	hnln1LACfhiYK+93+725xCyIYHQOb9nW2FfuPTzcCZXLMRfbep2i5Tyas+9PCkT2piJe15IuvaC0z
	GEu6sUYRtEEUK+cZZ+w/wvC4NDJkbFEwXc/K9uENNB7u+z6P6SlP13ASoaOjhme239aVItfuqRkd7
	2NxpROcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvil-00000004ZnR-3VYj;
	Tue, 12 Nov 2024 18:34:35 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvgx-00000004ZTf-3ngv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:32:45 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9acafdb745so7803466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731436361; x=1732041161; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5UCG7gigTfhNtGBIssbVQwzzj1879iTBqBc1MZAvgpY=;
        b=M5GGagAP7+K7nPgvQ7H5br97vvf8pkz+MyrIOKkNp67cwRg5wgkhAxPF+9EQTf9Gka
         du1kdLgFHacY3vG5H4gloWWywyvuKEPf8u2ACbu0slqhmmb5g9Fpcbz+bVgxBsnU2jhc
         Gc/EmRNjvlLwITgljbaPCo++QeDazK6XEwr/wSKst9cRSGZP739gvhd2mskaBZ/uYmCC
         QJPPc8W1ZEFeXq225tSprVIjUbM2OVXphD51iAE+ZCtUWraZY1Bvc9aVdwzuf7pnSc3p
         +QMflnFSqMJWp9/oBJ5I96joj7VwZuKQRUrTkf+d2a9EGglO3uVnrEsEyC7otoY4WGY9
         RS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436362; x=1732041162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UCG7gigTfhNtGBIssbVQwzzj1879iTBqBc1MZAvgpY=;
        b=DfqgLQF+JbX6x3XMWB5M4Ul+P2zhNYbCM/1eWXwWC/Iumw+i+WRyDjq8IP0IRrBQRp
         mN06InGnZ1LyIC6ZPlemd52y0+M4YhR+faWyMl5JPsjXn+6ju0M1UpB8ghBKrI1w82ei
         Esl59cNKcIWb7ht6pj/TwwyaVhJJYcULKRy/G+nhBlQ7WGSsc5TJr9fxcd6Ym1lEkb6c
         VYcllsaCUkg544jRAt0FuurV0Z+LV8hI+2DZbNO4zTlCLaCCN5DN/jhHdtZSEfLlL4vj
         IUojzphfR4lL0+onLcMv4ZU3AO1QIDrnKobnqMPOGPctN6HWYGxQyz/jsw9TCShczyEM
         i+hg==
X-Forwarded-Encrypted: i=1; AJvYcCXAhevumQVYK6SHFMDrJWq8+kXUTcNXCyBqcH7h3tCiPXd83TJqPLx24EkC/ypZ4SlSlNu/xN523kCHDYSAXHRh@lists.infradead.org
X-Gm-Message-State: AOJu0YzVJIG0JNedJrYp9Fu4g1mVH7OG+b1AX6oUVh9L2qwG3tEp5dO0
	0QeDeYPoBULupaY4RTjcguoHFSV5xGF7maDKjQO9kyz+D5rVUaBB
X-Google-Smtp-Source: AGHT+IGXSfMvakz9L3gitYC5+mW1zh2dbK079TjOQ1eKDugvPwqCfLBETDQCnHWuMi8hQPA7aslrkQ==
X-Received: by 2002:a17:907:9455:b0:a9a:b818:521d with SMTP id a640c23a62f3a-a9eec9cf03dmr1908255366b.18.1731436361259;
        Tue, 12 Nov 2024 10:32:41 -0800 (PST)
Received: from ?IPV6:2a00:f41:cf4:1aa4:180f:4639:612e:9702? ([2a00:f41:cf4:1aa4:180f:4639:612e:9702])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0abea92sm746032966b.85.2024.11.12.10.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 10:32:40 -0800 (PST)
Message-ID: <ce1d2196-cf09-4d27-8b41-372948a59e89@gmail.com>
Date: Tue, 12 Nov 2024 19:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_103243_984181_9C79680A 
X-CRM114-Status: GOOD (  25.09  )
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



On 11/12/24 19:01, Manivannan Sadhasivam wrote:
> On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
>> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
>> CPU_SUSPEND instead. Inform Linux about that.
>> Please see the commit messages for a more detailed explanation.
>>
> 
> It is still not PSCI_SYSTEM_SUSPEND though...

It *literally* does the same thing on devices where it's exposed.

> 
>> This is effectively a more educated follow-up to [1].
>>
>> The ultimate goal is to stop making Linux think that certain states
>> only concern cores/clusters, and consequently setting
>> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
>> NVMe, see related discussion over at [2]) can make informed decisions
>> about assuming the power state of the device they govern.
>>
>> If this series gets green light, I'll push a follow-up one that wires
>> up said sleep state on Qualcomm SoCs across the board.
>>
> 
> Sorry. I don't think PSCI is the right place for this. Qcom SoCs have a common
> firmware across all segments (mostly), 

This ^

> so there is no S2R involved and only S2Idle.

is not at all related to this ^, the "so" makes no sense.

(also you're wrong, this *is* S2RAM)

> If you use PSCI to implement suspend_via_firmware(), then all the SoCs
> making use of the PSCI implementation will have the same behavior. I don't think
> we would want that.

This is an issue with the NVMe framework that is totally unrelated to this
change, see below. Also, the code only sets that on targets where such state
exists and is described.

> For instance, if a Qcom SoC is used in an android tablet with the same firmware,
> then this would allow the NVMe device to be turned off during system suspend all
> the time when user presses the lock button. And this will cause NVMe device to
> wear out faster. The said approach will work fine for non-android usecases
> though.

The NVMe framework doesn't make a distinction between "phone screen off" and
"laptop lid closed & thrown in a bag" on *any* platform. The usecase you're
describing is not supported as of today since nobody *actually* has NVMe on a
phone that also happens to run upstream Linux.
I'm not going to solve imaginary problems.

Besides, userspace already has sysfs to tune device power state knobs. Which
Android uses very extensively on market devices.

Konrad

