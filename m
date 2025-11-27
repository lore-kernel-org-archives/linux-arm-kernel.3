Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1064CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgLhNlGBxxZ/bcP1dxKz7JY8wkd1hqfFpzF2EgicKXk=; b=XY6BaUEQqO/ZH+0pXL93Bifq6Z
	g5n80jLO5CXuqvCHMIgf8waKyGRKGouPHDSZc+2K01YBBlnyKZaI4Mwqgm/393LuVnr4w3EM7R2aA
	JgWCO2PTqXrVylU0BWEfMox6tGPQD1a1U/p4/6ECtP6T1zeJbIb/56L3JP3NnK/EpO9RJUkHLrceB
	o8x6bxAldaR/SVnZNxINeeEDv3KoqWataiPsNSTQ4r0DDfHHwzsUn4sxctv9/pCwJvoNJc6bPcCww
	Sk4z+btX/sMrwfvbztkzAPyhuwmfRpGad4jxcxdCeKQgnA3C+5KXUzJB+mRt9f/+sGCk/fvWqWPsw
	XU5KIilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeVX-0000000Gu3Z-3nsw;
	Thu, 27 Nov 2025 16:06:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOeVS-0000000Gu31-3pph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 16:06:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779a637712so6098055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 08:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259565; x=1764864365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgLhNlGBxxZ/bcP1dxKz7JY8wkd1hqfFpzF2EgicKXk=;
        b=MJxnF0ug+kWX6PkoZO1EeDqKilww59cgyxbGnRAGm8YfwN8h+WkEGmKd/eeta390x+
         TJ2/hQkGfdeKLTnoCD/P2Xn1LFcQaJZH5YL7OKpklzfOyE81bOasIfsu3LMO6uaLK4zx
         WKcXLzEJWSCr4pR3yTOxila33Q21lw2bBcKzbzyMpFLeRk3n0oXeWoeuhMeVV47dSyYc
         JujN4krVH/7uhKPp+HaEBmGHZtToXmsAM9Nm5xNhJjCtU7QUyVZ/wdWQCtF2V8ntB/iE
         lHJrSyQZk8+dGD3lprnAfSV8nzEqnT/BpNR1Pzk3fFYR1SsVD5jbg14arMkNutYBgFZ1
         aTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259565; x=1764864365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgLhNlGBxxZ/bcP1dxKz7JY8wkd1hqfFpzF2EgicKXk=;
        b=tcMjkFppCmyHUeOPfuS5KLsUkBgunWAnJDTToPaZ6hsBfFBP9SElTlEvNklpHKRBsL
         s2/Vyh+/qM297E77G2T6Kd85tuZYlNqTv890pgVROe8Y0TsFBX9z6K4Jpq7dE35lDkyd
         6DnsUbFEiMYVz57dtWiF9MEh/e0flCMtWVCBAbIHLUkuIUmEYE4iZ6X6ZjzU9md52G6v
         ZWtek6TU4h8Io5Y3efkiZIQTV3yDSmmj6hzQzhWQC0/dRLtSDzcjjDrDpxU4JboYmdNO
         eQzIq6eeSq/hT/xAiF5/jXcdRxFq4g22t8ZcPoeinvDOZ7keGNuclfloxPEeOFCCCTf7
         v9nw==
X-Forwarded-Encrypted: i=1; AJvYcCUsjzLSYOCirwHSjMrqaacp7GZ82u6CLM/wh2ernqdB8FpYa9pvbmvXJyH/2UnCqBeSqQ14F2g0HU02RP+o7rUh@lists.infradead.org
X-Gm-Message-State: AOJu0YxNksM2KAJsJZoQiklEc7EAb0Duj83yPexsMeUPpIwYt17Mpv0w
	rdUo1dV/mRYIDeUbvR9/qWnEAGKdYzB+XccuYZ48X2s7nUK+aR5Rixe4a8CfWsb4lis=
X-Gm-Gg: ASbGncssWPFf97Jypx1n7Ij5TnzLRHioazDMqgPejOfddtDqwCLXmO8YrUjmwMkfAqb
	OqKw5gHgK2tFcewEohMr54AGzwKpxyz8oOMoyiY32Fw4O4e/r4+zqBTB+mhVwDKQC61LiJ/R1Cf
	0viU+mUHGqIU41KPgVtFf5BuCqiGCrEciYdM5DVu+lHn2IIW+jTVrd4eJSZhs5E0N+jLWIkqDAF
	+vXXWI26jvQLuOMXI76sBMqzE9NeP7xrUwBhKGpT4vMdlCbJdPvixVOS465jrNC2rPcGTekDdS2
	yGgVrcHp9WNxk/aof3frQSauIkRhqIsDZ9CF2pdSxkqryhglvcT5HNiFX+RF7NlR10uq6mXivm/
	L8ekpjO5jURVkHXIZczhZNU2E1mdGzg8Nuztf7ZmDHSRsS0lTBR3P6wgne4LS+7pGAWzwxJjtCH
	n7lvS2HfVZqyF3PVgE
X-Google-Smtp-Source: AGHT+IFd9I+MmnaEMQk6demrAoVGoCPphB4zs199dHJzb+2basSo2qxFJnPsP5KLuHB7Gfc2J3XgJA==
X-Received: by 2002:a05:600c:3590:b0:471:672:3486 with SMTP id 5b1f17b1804b1-477c0184a94mr305082995e9.15.1764259564822;
        Thu, 27 Nov 2025 08:06:04 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ab8bb21sm107834545e9.0.2025.11.27.08.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 08:06:04 -0800 (PST)
Message-ID: <7dadacee-b95d-49a2-88b0-73367dab25ed@linaro.org>
Date: Thu, 27 Nov 2025 16:06:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
 will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, vladimir.murzin@arm.com
References: <20251118103807.707500-1-tabba@google.com>
 <20251118103807.707500-3-tabba@google.com> <868qftqehe.wl-maz@kernel.org>
 <CA+EHjTwHrLhdHrNSA8f-+bCZ1-QEuNocQQxeiaaost9oLwaG5A@mail.gmail.com>
 <865xaxqal2.wl-maz@kernel.org>
 <CA+EHjTxhOvu-733Z-gJgc6f_EAs-tksA6u5KuQZeimP6T6M-fQ@mail.gmail.com>
 <7f1c187b-0f94-49c5-b4c9-2f414ab0ac8a@linaro.org>
 <CA+EHjTxpTKFQwWHR6vBVxC_a6dpza_bgCmxTXSbWjT7wfJh2TA@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CA+EHjTxpTKFQwWHR6vBVxC_a6dpza_bgCmxTXSbWjT7wfJh2TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_080606_992688_1B9EFF9C 
X-CRM114-Status: GOOD (  22.73  )
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



On 27/11/2025 3:38 pm, Fuad Tabba wrote:
> On Thu, 27 Nov 2025 at 15:26, James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 26/11/2025 11:48 am, Fuad Tabba wrote:
>>> On Wed, 26 Nov 2025 at 11:47, Marc Zyngier <maz@kernel.org> wrote:
>>>>
>>>> On Wed, 26 Nov 2025 10:37:57 +0000,
>>>> Fuad Tabba <tabba@google.com> wrote:
>>>>>
>>>>> Hi Marc,
>>>>>
>>>>> On Wed, 26 Nov 2025 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
>>>>>>
>>>>>> On Tue, 18 Nov 2025 10:37:59 +0000,
>>>>>> Fuad Tabba <tabba@google.com> wrote:
>>>>>>>
>>>>>>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
>>>>>>> register accesses. These accesses are trapped to EL2 when the bits are
>>>>>>> clear.
>>>>>>>
>>>>>>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
>>>>>>> had the polarity inverted. When a guest did not support the Trace Buffer
>>>>>>> feature, the code was setting E2TB. This incorrectly disabled the trap,
>>>>>>> potentially allowing a protected guest to access registers for a feature
>>>>>>> it was not given.
>>>>>>>
>>>>>>> Fix this by inverting the operation.
>>>>>>>
>>>>>>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
>>>>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>>>>> ---
>>>>>>>    arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>>>>> index 8d06a246dfd1..f6f8996c4f97 100644
>>>>>>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>>>>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>>>>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>>>>>>>                 val |= MDCR_EL2_TTRF;
>>>>>>>
>>>>>>>         if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
>>>>>>> -             val |= MDCR_EL2_E2TB_MASK;
>>>>>>> +             val &= ~MDCR_EL2_E2TB_MASK;
>>>>>>
>>>>>> This does not only change the trapping logic (bit 24). It also change
>>>>>> the ownership of the buffer (bit 25). I wonder whether you should do
>>>>>> something for that, maybe by clearing TRBLIMITR_EL1.E, because
>>>>>> otherwise, you keep tracing, but using an EL2 VA. What could possibly
>>>>>> go wrong?
>>>>>>
>>>>>> Overall, I'm very uneasy about TRBE in the context of pKVM.
>>>>>
>>>>> So should we clear/restore TRBLIMITR_EL1.E on guest entry/exit in
>>>>> protected mode?
>>>>
>>>> I think you need something of the sort, yes. Overall, SPE and TRBE
>>>> should be aligned on what they are allowed to do, as they are two
>>>> sides of the same ugly coin.
>>>
>>> I'll fix this (or add a patch to do this, depending on how it looks)
>>> when I respin.
>>>
>>> Cheers,
>>> /fuad
>>>
>>
>> To understand this, is it just belt-and-braces because you don't trust
>> the current filter clearing in TRFCR_EL1? And to reduce the potential
>> for mistakes leading to trace leakages? I suppose even the hardware
>> itself could have some errata where it tries to access the buffer, even
>> if we've completely filtered out trace and flushed before going into the
>> guest.
> 
> Yes, we don't trust the host. The pKVM threat model is to protect
> against a malicious host.
> 
> Getting into hardware errata... that's a can of worms. I haven't
> considered that.
> 
> Cheers,
> /fuad
> 
> 

But the hypervisor already clears the filters, equivalent to clearing 
TRBLIMITR_EL1.E. Which is why I was wondering if there was something 
extra on top of the model where the host isn't trusted. I would assume 
that without anything more specific that just clearing the filters is 
enough. If we trust the hardware then it is anyway.

>> Thanks
>> James
>>
>>>>           M.
>>>>
>>>> --
>>>> Without deviation from the norm, progress is not possible.
>>>
>>


