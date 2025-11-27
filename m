Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E8FCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9Sd2Vih8qCT8Sm8DHyp6voQA1fNVa6aZXqM7Jub6wE=; b=hsih/BOjSwd92TiEGfQgv3hKzF
	1rs3NF+PXdEJd0xJiTpYFMaSailgBuJQLeNr0j8Ec7TetY2MS6Vw3aBd5m0W0+0AIChkuKlVGU+pR
	tSugJKhXRbrsn1n01wUiSbPz1NaC4DAH1MO9J9sICxis8XqXk593D1VGKwnCqvy5e3gV8xcBdYEM9
	QqY91vOlzYgXqWncycZAARcCAXarplPQOSH7VU6Ye7XYfo7rTYs3a6oDvqLz5pFmml8jXKFJ0XWE7
	wHEI/7WzNOj0NhdwDC0cXJK6DUApnmkeFe3JyPjzxjCrzHH1lg0Pv+eiFhz/c0qYSZ/+ZJUe2932W
	tbbmwUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdtG-0000000GqHC-2gmX;
	Thu, 27 Nov 2025 15:26:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdtD-0000000GqGp-1OT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:26:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47789cd2083so4832595e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764257193; x=1764861993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9Sd2Vih8qCT8Sm8DHyp6voQA1fNVa6aZXqM7Jub6wE=;
        b=bNUz39P6VZMI5o3gEVELbP+y303wlTdpWuEyCieF9xDa1lVZCVII6nNByS/LT54m2L
         8l03yScgbljXx4P4iqBzLeufTzE3St3PT74KpCH3I0G8PRojKGHo8gcrCumrnofOb7Xg
         t/ipm2KWZzvFkMXg/UWUlUDSo9RPjZjECSz1uxojjAdfp8VXTzIm0v/QSQGjz8EHZw60
         lw58KND4haFG50Jlz3tx/CI17J+OmUJ6jEKfKMnVJwdRkYjW/NK/G+orEzkup/X6oan9
         dq3v5sUEAqwV6Tc9RA+ndE9gKKBfjBpURolXjStEknafx+Aork/KJB9hePuKsQ3Hpjo3
         9AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764257193; x=1764861993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9Sd2Vih8qCT8Sm8DHyp6voQA1fNVa6aZXqM7Jub6wE=;
        b=rAiEZYsWeAYDvVM/AoSsxWALK6J0Ycyw/8H8jhvQnkFmVIHou1HSeZg0o8nD6qFheo
         XlBW8v5N3M0kPyclio4hzAmcuncYWxGD1bsDXLJWVunafqVp5CriARu39fjf68itECFg
         CUdPzKgE1PnNSiBiFTeBxwIUPkUbAwgAJ8kCBzRVpxrJM5+MiNRAvEMGU9K7KVyq0LsV
         uyH/OkV3iskLDBss5G1obhkY3uzhQ8+IwrOjYaxTBU2vr37GObgAg5tSozDmtlKWJQul
         ItB/e4iXSkYcsSvM5mPF66gv/CMSNSAudiBpjjCBvb94WvlpbF5vreLqcBlUt5Y9+MZy
         H5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZh+AOduaFYy1Szb1YI7wXjS/QAerRjBMLf+MFD1Jnu/v9PNZA0Az2l5KyrFE84AMW0dwjD/TKtDp2ozGRSwzC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6LDEy4f+R+kkZn2N+hQtQEfFULT/wbfPkyrJHJaHZ7Qoo99vw
	SiMxNZuPon0WjjK8tg3G75VUZgkJ+xjOecUWGSBUD7sE/02GS0ewt3oeV66lceyVhYs=
X-Gm-Gg: ASbGncuptuHbhH5UrkKqeUOdgOdOTrqUIJVyb/RTz9Bq4jpgHZw2gOLEXs4CzBs+lcN
	3nQh1HhJ6Eo2ZwoH1ZnjwbSpF+Xy5S7aMZ8hTVgz8/hS+24giH441Q/UawopB013sInXMz15Luj
	uH9x+3Q9ttZJSjnvmUa6vx+4/yNRdRfGq9ha+1pYEAb9teCLlLUZzZj7bhpyhX8Zby1VDKFB/Yz
	JpmutqSfloLKrKf/3JttFncshnZx4IcjR+X1vId4yPO+xx9pJ45CYvzaw2sc8Y+otzu+mQDSvXk
	C3d35KLiy21O2cbHt48yaX3FnMt09fb7urPQ0G7QgiqXDPcyuo/4JwMZir7v7de0G6wOm1+yLML
	Ykc4pqwwyAXvdUEnEpX5fHJ0iZoW4ehOjaTWomzke11wxzLyibpNKcuWu2yWIFwijxjaBtcL9CY
	bGkRug+L5xNhczB/t1fmHpD7fZlhA=
X-Google-Smtp-Source: AGHT+IFE9u2XY1HoDD/zsyLLeGS8NDSHbZP5RWiZbNOjKUta7mf7Tb07oyyYOwPyJfOjFkNhODLj5g==
X-Received: by 2002:a05:600c:35cf:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-477c114476fmr266244525e9.19.1764257192799;
        Thu, 27 Nov 2025 07:26:32 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d607csm4470702f8f.15.2025.11.27.07.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 07:26:32 -0800 (PST)
Message-ID: <7f1c187b-0f94-49c5-b4c9-2f414ab0ac8a@linaro.org>
Date: Thu, 27 Nov 2025 15:26:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Fuad Tabba <tabba@google.com>, Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 vladimir.murzin@arm.com
References: <20251118103807.707500-1-tabba@google.com>
 <20251118103807.707500-3-tabba@google.com> <868qftqehe.wl-maz@kernel.org>
 <CA+EHjTwHrLhdHrNSA8f-+bCZ1-QEuNocQQxeiaaost9oLwaG5A@mail.gmail.com>
 <865xaxqal2.wl-maz@kernel.org>
 <CA+EHjTxhOvu-733Z-gJgc6f_EAs-tksA6u5KuQZeimP6T6M-fQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CA+EHjTxhOvu-733Z-gJgc6f_EAs-tksA6u5KuQZeimP6T6M-fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_072635_399960_3911EF46 
X-CRM114-Status: GOOD (  20.58  )
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



On 26/11/2025 11:48 am, Fuad Tabba wrote:
> On Wed, 26 Nov 2025 at 11:47, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Wed, 26 Nov 2025 10:37:57 +0000,
>> Fuad Tabba <tabba@google.com> wrote:
>>>
>>> Hi Marc,
>>>
>>> On Wed, 26 Nov 2025 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
>>>>
>>>> On Tue, 18 Nov 2025 10:37:59 +0000,
>>>> Fuad Tabba <tabba@google.com> wrote:
>>>>>
>>>>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
>>>>> register accesses. These accesses are trapped to EL2 when the bits are
>>>>> clear.
>>>>>
>>>>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
>>>>> had the polarity inverted. When a guest did not support the Trace Buffer
>>>>> feature, the code was setting E2TB. This incorrectly disabled the trap,
>>>>> potentially allowing a protected guest to access registers for a feature
>>>>> it was not given.
>>>>>
>>>>> Fix this by inverting the operation.
>>>>>
>>>>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
>>>>> Signed-off-by: Fuad Tabba <tabba@google.com>
>>>>> ---
>>>>>   arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>>> index 8d06a246dfd1..f6f8996c4f97 100644
>>>>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
>>>>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>>>>>                val |= MDCR_EL2_TTRF;
>>>>>
>>>>>        if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
>>>>> -             val |= MDCR_EL2_E2TB_MASK;
>>>>> +             val &= ~MDCR_EL2_E2TB_MASK;
>>>>
>>>> This does not only change the trapping logic (bit 24). It also change
>>>> the ownership of the buffer (bit 25). I wonder whether you should do
>>>> something for that, maybe by clearing TRBLIMITR_EL1.E, because
>>>> otherwise, you keep tracing, but using an EL2 VA. What could possibly
>>>> go wrong?
>>>>
>>>> Overall, I'm very uneasy about TRBE in the context of pKVM.
>>>
>>> So should we clear/restore TRBLIMITR_EL1.E on guest entry/exit in
>>> protected mode?
>>
>> I think you need something of the sort, yes. Overall, SPE and TRBE
>> should be aligned on what they are allowed to do, as they are two
>> sides of the same ugly coin.
> 
> I'll fix this (or add a patch to do this, depending on how it looks)
> when I respin.
> 
> Cheers,
> /fuad
> 

To understand this, is it just belt-and-braces because you don't trust 
the current filter clearing in TRFCR_EL1? And to reduce the potential 
for mistakes leading to trace leakages? I suppose even the hardware 
itself could have some errata where it tries to access the buffer, even 
if we've completely filtered out trace and flushed before going into the 
guest.

Thanks
James

>>          M.
>>
>> --
>> Without deviation from the norm, progress is not possible.
> 


