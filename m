Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18A2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DOniWzPOxX9jgReodjZJuovKYF0NJcq9l0SRTKIVr/w=; b=WUD4Cq331S3lWL85WccHEWB2Ax
	KOhGpsD/jFKGSq8alqIKGlWaw5FBoWzifcM9R6L2ZV5Y2BQ913vBWGaLhCtum2oHiYgBtZtGabIH6
	JhW0u9v9jwncQSTo9qM2kfh/gyz8JPSJzf1nGGtlPC+bFRIE6pHN6ibv8OMpXTvhRdRzY3pGmTHjH
	Ag2hx4BzsE24r6+3QzoqG5FoxzISEzgwDDnyoLrsIvl68wJbFXXAVjTZRDP5xIYLD2MXHR1MOefay
	6CKBCoV9hRZb41hABlaoMl1/lY1wgVXMwfWGimQFyLVW52+8b+mkHVOe+4eKswqOk1A8SAD+peeN0
	UOSj28Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucS4R-0000000Ajhe-3AgC;
	Thu, 17 Jul 2025 17:06:59 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRyY-0000000Airi-0FP1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 17:00:55 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7490702fc7cso856308b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752771653; x=1753376453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOniWzPOxX9jgReodjZJuovKYF0NJcq9l0SRTKIVr/w=;
        b=NWkWIBP8g1ImrVRbfmykqM4O/P5u2pGUG5JZMQkV5wVmhmW3naNKDmfPVLAN4lNAvv
         dSo/o2CPeVIidBJecrugLqK0kCCSjUhlFeebDOhzV5FJ/8LPOL/z4Blk8onF04PxVYjs
         i7qn9xWgShrn0EpE//tQy8LsJUpxdogJDF2FishJVxZjNutjEJOj3GtoXlfC372z576x
         3JwlcMLMsY2J0QcrD5wJjw7mVfGjjdiBRgeD96STOjTW8P2Gp4eL5LRhCyxXWT2vuqWd
         xR9BF8FVaUFG4fFxJTfcl00kHC1dd2yMjMl3tYcmx/wMYzhGGHuZsptmDo97o1HBM7Xh
         OJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771653; x=1753376453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOniWzPOxX9jgReodjZJuovKYF0NJcq9l0SRTKIVr/w=;
        b=GeyKndghcuasHi2aY5nDdJ6tSEBfwdVTeNGoJ0oEX36KNAG6r62qa68x6dHCOw9X1E
         5Kq9rz6SoWbQNHrKAMWCqaSyFjcJkJypKF8cU+dCfS2kUb+o9xDEPtfN+ViMqOS70SxR
         Ov4KWBbAjmDZYRu/NXSZmAO3L2JVHsONTRB20fTboyTchaSNCp1ResKrsu2Q0yn7DKZQ
         qPJmA142q6Yf67t4MtaUyTrcZmpx5BL9D0zPwUuWKT4whpYm8eNDQi6xNaZuGo2LkkGP
         RoSy3ROGNtMU7CFsu9G2CYtq/MN4jljnr2YTWKT89U19ium+/s/AitORu+OO0bzWjzVZ
         L8YA==
X-Forwarded-Encrypted: i=1; AJvYcCUOsxoeFyJ8PSPz7qAoF+erUvFvM26NjMHx00WMiWpqzYSy/WGgHkYff0/wAbWmqR2vOmf22m4Fk8Yc8cb85/+D@lists.infradead.org
X-Gm-Message-State: AOJu0YzxKtGxxPoDuNwrrC0anrTL1N2Q7rtY6TMi+m6O3YjmUiIyrt/q
	nIbRFIjsoMWAtXQcw3c0o8CKKrV+1la7HrnX8vuoMDpSXjUUwfjuQ21a
X-Gm-Gg: ASbGncvF3+iUC9/WPXntEYPrTOiLFEvK4tQbY9/HDnehwAorcyrBcqoeF7sF+xmrdGA
	W8ssWQBgd9FwGoe4jS28zmkMz5mUe7exXDMwyH829M2rJdCUvFwPYem3oSOwULINjVhE9IAysf9
	GJutzZ2/MxtkFvoTcoVZgVLaRAEPXXbP2TAk+boSDWfD8nuqS3m7+GjywxE613Ac4tAaKL3j53R
	JwOcDL4tcucOmAJaY+PZRUCZnFXlw4iYFG7lNpfwuheXu3YgdFbkK9shhTddrnE0JIIPG1Jqp0I
	qalf/1ly9/Xh37Wu5slv5sXGY/COe3y/Qf8ECw1ByGDPecn/NwcPG20ROuQgJDWb8GDzDwqwC52
	Fkv8P4jZ8O/gm4knCVEYFk1RXcfmZaSULOCon6SoxR3ODeoAoy82P
X-Google-Smtp-Source: AGHT+IGyNwD+GplSMpIC4979Lc0tZ79C1WbX1oV52D7ggC14zrY8YjV3rk07eXSBZ3Eq+1KJC2sDsA==
X-Received: by 2002:a05:6a00:3e0a:b0:742:aecc:c46b with SMTP id d2e1a72fcca58-756e99fc423mr10406870b3a.15.1752771651493;
        Thu, 17 Jul 2025 10:00:51 -0700 (PDT)
Received: from [192.168.0.113] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd59f1sm15902818b3a.3.2025.07.17.10.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 10:00:50 -0700 (PDT)
Message-ID: <705f1dfb-7e1b-4930-a1a9-c763299a4305@gmail.com>
Date: Fri, 18 Jul 2025 01:00:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
 <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
 <aHkRJdAuvhS2mNQj@J2N7QTR9R3>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHkRJdAuvhS2mNQj@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_100054_117582_14635DF0 
X-CRM114-Status: GOOD (  31.15  )
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



On 17/7/2025 23:05, Mark Rutland wrote:
> On Mon, Jul 14, 2025 at 11:59:36PM +0800, Nick Chan wrote:
>>
>> Will Deacon 於 2025/7/14 夜晚11:12 寫道:
>>> On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
>>>> This series adds support for the CPU PMU in the older Apple A7-A11, T2
>>>> SoCs. These PMUs may have a different event layout, less counters, or
>>>> deliver their interrupts via IRQ instead of a FIQ. Since some of those
>>>> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
>>>> be enabled by the driver where applicable.
>>>>
>>>> Patch 1 adds the DT bindings.
>>>> Patch 2-7 prepares the driver to allow adding support for those
>>>> older SoCs.
>>> Modulo my nits, the patches look alright to this point...
>>>
>>>> Patch 8-12 adds support for the older SoCs.
>>> ... but I'm not sure if anybody actually cares about these older SoCs
>>> and, even if they do, what the state of the rest of Linux is on those
>>> parts. I recall horror stories about the OS being quietly migrated
>>> between CPUs with incompatible features, at which point I think we have
>>> to question whether we actually care about supporting this hardware.
>> The "horror" story you mentioned is about Apple A10/A10X/T2, which
>> has a big little switcher integrated into the cpufreq block, so when the
>> cpufreq driver switch between states in the same way as on other
>> SoCs, on these SoCs that would silently cause a CPU migration. There
>> is only one incompatible feature that I am aware of which is 32-bit EL0
>> support.
> 
> Surely the MIDR/REVIDR/AIDR also change?
They do not change. ID_AA64PFR0_EL1 also does not change (fixed 0x12).
What *does* change however is MPIDR. (P-cores has bit 16 set while
E-cores do not)

> 
> In general, silent migration isn't acceptable for the kernel, even if
> you largely happen to get away with that today. It is not acceptable for
> architectural feature support to change dynamically.
> 
>> However, since the CPUs in these SoCs does not support
>> 4K pages anyways in practice this is not an issue for as long as
>> CONFIG_EXPERT is disabled.
> 
> Do these parts have EL2?
No.

> 
>>> On the other hand, if it all works swimmingly and it's just the PMU
>>> driver that needs updating, then I could get on board with it.
>>
>> As mentioned above, it does all work fine when CONFIG_EXPERT is not
>> enabled, and if it is enabled, then 32-bit process may crash with illegal
>> instruction but everything else will still works fine.
> 
> I don't think that's quite true, unless these parts are also violating
> the architecture.
> 
> If the CPU doesn't implement AArch32, then an ERET to AArch32 is
> illegal. The way illegal exception returns are handled means that this
> will result in a (fatal) illegal execution state exception being taken
> from the exception return code in the kernel, not an UNDEF being taken
> from userspace that would result in a SIGILL.
Speaking from experience, when testing with the userspace cpufreq governor,
trying to run AArch32 code on the ecores really does result in illegal
instruction for that process while everything else remains fine.

Referencing ID_AA64PFR0_EL1, the E-cores does claim to support
AArch32 EL0, even though they could not execute it for real.

> 
> I do not think that we should pretend to support hardware with silent
> microarchitectural migration. So at the very least, we do not care about
> A10/A10X/T2.
As explained above, what actually happens on the hardware is different
from what you believed, so please do reconsider.

> 
> Mark.

Nick Chan


