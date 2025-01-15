Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709C0C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuwpVltn309qfmL16lWjbYMBdtIq26uOZE014kztbkU=; b=Bi3+fyXRtwRL5d1K3gcxldmZAS
	zsza5Zmn3dxtOTR9VgNg5u9JhnkA9nHIFA1Cb393l/9PK/u8qpNBCTBBqskZcHE4Behf1hCLrd4hY
	IJ5rqWZQ3l34pK63VEZT8lGQIMGmuVcmnfkszI3Q1I5QuyO5KqqGzxQGxiWHmjChwsUjEhml0hNlQ
	rcrrU4xiRlaI7MGDqjl24yRuqvZsdX0khb/8SKueMoxkjWNFKPU1WNvM+cSuazvhzCQCKq+HZRJF2
	q/v9GRNatlNctxtWrnxRbT/HiBBARvkpTvAMTccR3ta80SGnKLJ4kz/yVyAZEsQ7BSknJIyoYIY1Z
	C8clo1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0uY-0000000BYnX-13AA;
	Wed, 15 Jan 2025 10:46:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0rf-0000000BY9s-01Kh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:43:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43618283dedso62614605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 02:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736937789; x=1737542589; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IuwpVltn309qfmL16lWjbYMBdtIq26uOZE014kztbkU=;
        b=vsnN1Zsoem9iSOFm2dJRVT1bQrb+GcfDKkcnCguhUZvtGA5YFPSPQTgDXbPWwe2+96
         rMyrQGPdEe+sByjBHAECxlw7C+23TTORiB00k+O69sJkIz/tZ2aEb1ouFXpWdK/PieIe
         L+rPqsQ+nKBHbDrGWua9k453owHAe1WKrP5uAfWEwG/xVKmuJF7GQJFy6acDBUQhGXnG
         QZbkTJx/c/YzgEqL27wb3KyXfQvZJaQpCpkSFkbzxDNLLqtJu3N4GhOGxrRBFosw25Fm
         0khqrZdDcATZRktJ468pVNXF3/a4rXycuRPLBiHjc5Ds+0qUydCzXC5FkefNfW4Alalp
         Fb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937789; x=1737542589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IuwpVltn309qfmL16lWjbYMBdtIq26uOZE014kztbkU=;
        b=HHPptWYWwOkfsu5I7MAl73Bo9qiaF1VFRv2opxOT2duK7sRmX170agJvgefgO7mO3w
         bzTkC1tFxAPbvm23EuLpIfGDq42RbM6VipzHLli3HrHfNysAFsSN75Ay5byWBTK1Y80h
         lgNtO8qJtI4gdkROyyoBwtY+g56UuxhQNLF6b8+CtFYR2ci/5bhdKbV/uUL5Zb38OOTt
         6HwFPD5CbAHmmLT5me7vPWN46YmdNeFtfDrj0G9cFBnYXlL8BeVGT6skLSC5g1zf63h5
         Ul+534Fk9JFzHjuZsG2xIlCu7iyUHboM9YyIvJlH/okXaTWcdcu25Vw142AYaihPfrAU
         PS4A==
X-Forwarded-Encrypted: i=1; AJvYcCXtUjOlDSg5gweDeDp14ESaOSNbaQHkxG903vX/xpHiiWaJQ7ACFfTVvbpCi/HLS4CWXR1SvGEEqBuZ049Kg4t6@lists.infradead.org
X-Gm-Message-State: AOJu0YxyCPakOA4iBYpxK7xgsx4bvulR618kLFtHyFVO5lLO5I9HecXG
	U4sLiq0s5l47IGo69hzljvL7DrC8xeYUGBjO4XWwblVEgfRS+vIUS85I2K+renQ=
X-Gm-Gg: ASbGncvtsPbl7ceRPzgOdjDXrm+fEi9kc0vUf0MrIjWuTwunnImXqniyqCoOFPM+o7D
	CbFu1NwA3QyWukpewTLltOcgdZ/jn3Q0jWMzCZqIN77I+wALmMZftGyBgq91Ewqal4BzxKpBcij
	pnejrVs5nIo2qSugtnjZNCqibvF7xhM0Smy3TL9HaOOpnYQc1L56Xa1U3VGVMrVDI+TUalRcZZP
	4iU1nkANWrm9LP8Mo4qNpzDYMn5kGhaGKEnGJWFtn28gTaSrg5digq2yaJg+5XDaA==
X-Google-Smtp-Source: AGHT+IH3uacZBQlbJPYFrF7NDg04bYz2rstXelNvRE0i6b50wPcyzW0FqOTBm1F5gkICT1asCeDs4A==
X-Received: by 2002:a05:600c:4e8c:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-436e271d355mr261062685e9.29.1736937789135;
        Wed, 15 Jan 2025 02:43:09 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be2b0bf2esm3908161f8f.57.2025.01.15.02.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 02:43:08 -0800 (PST)
Message-ID: <b4082b98-e234-4825-9935-971a630f438b@linaro.org>
Date: Wed, 15 Jan 2025 10:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/10] arm64/sysreg: Add a comment that the sysreg
 file should be sorted
To: Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>
Cc: kvmarm@lists.linux.dev, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 coresight@lists.linaro.org, James Clark <james.clark@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Shiqi Liu <shiqiliu@hust.edu.cn>, James Morse <james.morse@arm.com>,
 Fuad Tabba <tabba@google.com>, Raghavendra Rao Ananta <rananta@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250107113252.260631-1-james.clark@linaro.org>
 <20250107113252.260631-5-james.clark@linaro.org>
 <87frloqjso.wl-maz@kernel.org>
 <760969b6-18b7-42ac-9524-2f1f845b3703@linaro.org>
 <86jzaywtea.wl-maz@kernel.org>
 <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAL_JsqJFgunOVqpXnj+0HQ_HYbbVrtjCTJ25KzJHhjay-0i5tQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_024311_067431_E2444C70 
X-CRM114-Status: GOOD (  22.29  )
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



On 14/01/2025 6:16 pm, Rob Herring wrote:
> On Mon, Jan 13, 2025 at 10:49 AM Marc Zyngier <maz@kernel.org> wrote:
>>
>> On Mon, 13 Jan 2025 15:43:39 +0000,
>> James Clark <james.clark@linaro.org> wrote:
>>>
>>>
>>>
>>> On 12/01/2025 12:49 pm, Marc Zyngier wrote:
>>>> On Tue, 07 Jan 2025 11:32:41 +0000,
>>>> James Clark <james.clark@linaro.org> wrote:
>>>>>
>>>>> From: James Clark <james.clark@arm.com>
>>>>>
>>>>> There are a few entries particularly at the end of the file that aren't
>>>>> in order. To avoid confusion, add a comment that might help new entries
>>>>> to be added in the right place.
>>>>>
>>>>> Reviewed-by: Mark Brown <broonie@kernel.org>
>>>>> Signed-off-by: James Clark <james.clark@arm.com>
>>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>>> ---
>>>>>    arch/arm64/tools/sysreg | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
>>>>> index b081b54d6d22..4ba167089e2a 100644
>>>>> --- a/arch/arm64/tools/sysreg
>>>>> +++ b/arch/arm64/tools/sysreg
>>>>> @@ -48,6 +48,8 @@
>>>>>    # feature that introduces them (eg, FEAT_LS64_ACCDATA introduces enumeration
>>>>>    # item ACCDATA) though it may be more taseful to do something else.
>>>>>    +# Please try to keep entries in this file sorted by sysreg
>>>>> encoding.
>>>>> +
>>>>>    Sysreg   OSDTRRX_EL1     2       0       0       0       2
>>>>>    Res0     63:32
>>>>>    Field    31:0    DTRRX
>>>>
>>>> "Do as I say, don't do as I do".
>>>>
>>>> I don't think this makes any sense if we don't actually sort the file
>>>> the first place.
>>>>
>>>>      M.
>>>>
>>>
>>> I think it's ok if it avoids review comments that new entries should
>>> be sorted. Or maybe we do the opposite and the comment should say this
>>> file is allowed to be unsorted...
>>
>> The better option would be to add the comment *and* sort the file.
>> Leading by example has some value, it seems.
> 
> IME, it's better if documentation just states what the tools enforce.
> 
> Can't we add something like this to the header generation:
> 
> $ grep '^Sysreg\s' arch/arm64/tools/sysreg | sort -n -k3 -k4 -k5 -k6 -k7 -c
> sort: -:22: disorder: Sysreg ID_MMFR4_EL1       3       0       0
>   2       6
> 
> Rob

Actually I updated gen-sysreg.awk to fail the build if it's not sorted, 
was just about to post it. I don't know if a build failure or a warning 
is preferred but I can do either.

James


