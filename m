Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BCC9EC7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5vBcByaSbLsGX5Zr65hjskcoFy3cdK9/53jX67HxjI=; b=ERPUTW5yrXCQc40Zmqppcw/S2e
	nRo2Tzk+YG7N6eb2WYsYYpq59LlJ/3hYhwZYqFjSFjYzYwczfbsV13uCdSGIAUX0KGaprplviQCs4
	HxZbVc6YwakQ+p2QmENLN3o6kUQMxMJ5mqigaTCWnCx6wZncE4GYfN5BPVVBPmgffwGUAHggbiLaq
	BXoKOUsZF5kKRd9bTqd4QdpDl8iIMCcStYwo1tGaQPM2KDMfSO0d8mBNBDm4G6uPBxpkTy4MUqJl+
	NEJ8jbMXRdcyTwbGZDkhTzdJtflsQnIOMlCmw4Fx4vEhYQJlxNVzh4Gw45MrUL6xlQMlgAuCXn3Nd
	3kPRl98Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGoC-00000005Jd8-00Yk;
	Mon, 12 Jan 2026 12:14:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGo8-00000005Jck-46Oe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:14:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5336843f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768220043; x=1768824843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m5vBcByaSbLsGX5Zr65hjskcoFy3cdK9/53jX67HxjI=;
        b=wjGVvU89TO3rt7vDoVPyG2SNt2CVZB5GfGiNX5TUtGsXcMhKewnKCRW35tJB7PL3iz
         vx5vUfSXN9i3vY3FhLV9/Rr9aiFJKzwMcE4EpxkLs9yCksu4JdKHwo7G/k+SwmsDcpNR
         yCLABkXiZBJd0mhHY3euBiBy8t8aAc/HP1hBo1zt2Q0MIkD5nB/sh/kOvtfXFCHm4D89
         z2z+nX+i3woBqPX65j+Jc5Rq35lPTrbDSqaAs6bkuPEWgZWlNIJP8hOw3XVX87y/H8xE
         qaM4enD8jq0s8MyxenTvAjbK98LeHgkEeKSeXyyOMpKdpDwvrn3Ul2pRMfJ2kZDOCcRa
         xkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768220043; x=1768824843;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5vBcByaSbLsGX5Zr65hjskcoFy3cdK9/53jX67HxjI=;
        b=cOREZL6w9gZ98+z4BoFwg6F4fcUYaSw7YaitPKx/VMI6A6EugbbaQ8wz/P/E30u8j/
         XdGLB54DIsFznCarNE47uDzKA7uTNHrA7DCpWJk+G6dZTilqn0VRuRyjKsLHjpPQOYCZ
         kK/lPZOfcNs2fJyleko/IslUm6jNmDRtFJ35+/Sl3aqnXe3ejEoDiFHVqpXv3RpbPBVz
         O52+pa3q4JpSbTvXPJLtHgixJKXEx395X0ojC8p9a9RQBwF7d91Y1wspaAk6yLaNJp4e
         ojHCXD4pU9W19MrDgLkdKwkL1dfMSfM8GI4oX/WojOLo5wefscYN5Bu+H1kNlR/yekii
         QXXA==
X-Forwarded-Encrypted: i=1; AJvYcCV0RoveZ4TxdzoxdoIn2bQb0sHA3qw4/GayQBotc8ybMqFKA2C059Qo71cnMq+WryU1e4t7wQmytFNchDsJc62M@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8X2DIub/YaH6RYkID4nRnDRjkccYumn5PViMLtn0QoOo3YFkX
	9BLGXARoyQ11g8foAZJVISY1fLwVn+S8dHXNMs96Cvs9zjN+tN+BOTC4rRn3x4gNeI4=
X-Gm-Gg: AY/fxX7Nc4MEhJIN78gbtDYNDXMbOMRtywAL3/CSFqwIK9uS5OUP1oLZ8Ltig/6Fs5g
	9Eswn2S/XKEJQRPvzc+F8bIKQzDoOTsbPYVaUjoNojAM5PRwfkhj44sAp0fMJ/e+uMzYcZBWjWR
	2qJw/Xcsdags2n02gSEDw5lc7H8yzGu+82RsmDu39SYDU5l/BfBJl3/iT98+scwYsAsZvfoGPuZ
	uB8WUXCvuOHNb+qlER92v2l6A5kKt8A/FWmXLplW57Aul3mHn8XT1ols9n1iQvEUfA7L1zcnH2r
	Bg2UM9iVAWaZQg0sTvJKqwr46YpESDeL/TlhAKCcC6VBgg9+5d5/Rh+FgJ2NIVNAzhxCcPTfLnm
	4+m1CzhfOO1McVPLYiLVQZejxeYMXsboSkQd5BI0EFa++bjAy6hmY1RZEKvX6E/4zV96BTHDL42
	mt5BQQUAbn7UIE1iVYZUXo8MbjmBk=
X-Google-Smtp-Source: AGHT+IFyLJu85DhzDzB9NUkNFHVuGwdXkS6SskSTBpWBs4uFpxP0oRfyAXxIBuq4lyp+uGbpQRo27A==
X-Received: by 2002:a05:6000:22c7:b0:430:f6bc:2f8b with SMTP id ffacd0b85a97d-432c37d2faemr19857760f8f.45.1768220042989;
        Mon, 12 Jan 2026 04:14:02 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm38632600f8f.36.2026.01.12.04.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 04:14:02 -0800 (PST)
Message-ID: <24dbbfea-f068-4352-9212-30821feed796@linaro.org>
Date: Mon, 12 Jan 2026 12:14:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 03/35] KVM: arm64: Add CONFIG_KVM_ARM_SPE Kconfig
 option
From: James Clark <james.clark@linaro.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: mark.rutland@arm.com, james.morse@arm.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-4-alexandru.elisei@arm.com>
 <1aaffbcd-ba0c-4371-80d7-ce59ac7f13a9@linaro.org> <aWTaXBse_R_LjJE-@raptor>
 <d7db9f17-012e-43d7-a0a5-58b254dd7e33@linaro.org>
Content-Language: en-US
In-Reply-To: <d7db9f17-012e-43d7-a0a5-58b254dd7e33@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_041405_051698_58900CFE 
X-CRM114-Status: GOOD (  33.39  )
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



On 12/01/2026 12:09 pm, James Clark wrote:
> 
> 
> On 12/01/2026 11:26 am, Alexandru Elisei wrote:
>> Hi James,
>>
>> On Fri, Jan 09, 2026 at 04:29:50PM +0000, James Clark wrote:
>>>
>>>
>>> On 14/11/2025 4:06 pm, Alexandru Elisei wrote:
>>>> Add a new configuration option that will be used for KVM SPE emulation.
>>>> CONFIG_KVM_ARM_SPE depends on the SPE driver being builtin because:
>>>>
>>>> 1. The SPE driver maintains a cpumask of physical CPUs that support 
>>>> SPE,
>>>>      and that will be used by KVM to emulate SPE on heterogeneous 
>>>> systems.
>>>>
>>>> 2. KVM will rely on the SPE driver enabling the SPE interrupt at the 
>>>> GIC
>>>>      level.
>>>>
>>>> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>>> ---
>>>>    arch/arm64/kvm/Kconfig | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>>>> index 4f803fd1c99a..31388b5b2655 100644
>>>> --- a/arch/arm64/kvm/Kconfig
>>>> +++ b/arch/arm64/kvm/Kconfig
>>>> @@ -83,4 +83,12 @@ config PTDUMP_STAGE2_DEBUGFS
>>>>          If in doubt, say N.
>>>> +config KVM_ARM_SPE
>>>> +    bool
>>>> +    depends on KVM && ARM_SPE_PMU=y
>>>
>>> I think the most common configuration is module, so requiring built- 
>>> in isn't
>>> great. If there's any way of avoiding it, even if it costs a little 
>>> bit of
>>> pain, it would be good for adoption.
>>
>> I'm not sure how that could be done. You need the buffer maintenance 
>> interrupt
>> to do a VM exit so KVM can inject the virtual interrupt back into the 
>> guest,
>> otherwise there's a possibility of a large blackout window when the 
>> buffer is
>> full.
> 
> Without expanding more I don't see how injecting an interrupt is 
> strongly related to the way it's compiled.
> 
>>
>> The code also relies on the SPE driver to probe all the SPUs in the 
>> system.
>>
> 
> I don't think that's a hard requirement either, the KVM code could 
> fairly easily do this itself. Inline the common code and put it in a 
> shared header etc. I'm sure there are lots of creative ways to flip the 
> dependencies that might not be "proper" software engineering. But like I 
> said a bit of pain here might be beneficial overall.
> 
>>>
>>> It was basically the first thing I got stuck on trying to get it to 
>>> work. Or
>>> if it really can't be done, maybe some kind of debug message to say why
>>> enabling failed.
>>
>> When you search for the symbol in menuconfig you get a list of the 
>> symbols it
>> depends on.

Also, it wasn't easy for me to find this either. I had to read the code 
and debug it. I find it hard to believe that other people won't get 
stuck here without a warning. It will be "I've got SPE, I've got KVM but 
it's just not working and there's no warning".

> 
> Right, but that doesn't address the problems of adoption at all.
> 
> Having it on by default when SPE and KVM are already enabled in their 
> default configs is the difference between people being able to use this 
> with zero friction vs 200 people all getting stuck and then coming to 
> ask me why it's not working and distros having to update SPE from being 
> a module to static.
> 
>>
>> Thanks,
>> Alex
> 
> 


