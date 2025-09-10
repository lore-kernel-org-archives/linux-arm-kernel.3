Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16028CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+Yb/IxxLIspa6tHUrNInqlVlxK+I+nsywpKyzMZIM8=; b=jclkTxh91MW5ZTRwghjMRtFYDm
	uKH8PGoEqrsd1ITsyhHYEOyUjSXrttguZIRuWjiWhywJAPYnWGByll11LSuVZnorsDf4hqWYpF/fV
	1yo0TylnyoY/SP5VKiLgUZZ3+10jMvCUcjOFPGY67uzBNeiRR2N3RooUmOYsEpHTMzY7ykm605rLg
	ZMCf1U6QxsKcs75kyDkXzNvfmqvMo1qMszXhrc2e9EVBGcOefLCSPz9ZawRRX4zPhSVEptfF9INlT
	nEKgXSo5pusERmSSNyh7HAv4BhQdIEb8B2B7kFEIHycyB2kEGm7YCphSUxKxFd+hezSEvEGMjdufY
	7Rc58S0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHMH-0000000DId7-06ia;
	Wed, 10 Sep 2025 09:43:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHME-0000000DIbD-1SCt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:43:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so41124305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757497396; x=1758102196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8+Yb/IxxLIspa6tHUrNInqlVlxK+I+nsywpKyzMZIM8=;
        b=mPUSDZvnU4GvEaDOHdqa22LLvMoQr+1qB5bYi8E5+lE44C9wmAjKect/B0JpL+DUY9
         Lv+7G8F/83xKbxRwv2blYdj2LjbeuUb+8vCO3o3xDHELo4Nnclf6LKZBLGfG+0FmIQXt
         xckSQRFhAOwmFNBvMGTxWz49cmYY4Loxp7msrnQQSEMTf7FVbkv1H5qoO7LzDjARgMNh
         ajgsfEMfE4M1I2s//27uGMZ3w4OxOirmy4B1FT98JQBCJHJQGcXQfHGip004e16Hp2H1
         LX7dKFhgNYi4fFC2PCxxv9LQAFTd17nkfgC6qCGdGME82jiVj/1wt4Lyo5ZOs0M52HpS
         Ylmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497396; x=1758102196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+Yb/IxxLIspa6tHUrNInqlVlxK+I+nsywpKyzMZIM8=;
        b=VX2+9lAfRDXc0YNztwtewwlTXnObAH4Mwpmd0F8QdFU4119jE1FAhvfX5icQPYE522
         O7DSu36TJzO6LqoYfJTRcXt05g2NIEmOlwVuTCi0xWq2+kmSvYl3w9Ou9r+GisCDKiCz
         oUN56G9UdMZBtWGbV5pgyiOwgyr8L4r5tHqtjZqZqUx9kzXvR8/vgHXTVqow0crjxjSf
         ejzdy+DaAH2RBLjEx7i1CFkg2cJhZCjFsqLWamC3ud9Q5oglhpTlAMf42NB5sHZn85/S
         OcNdp8gDY5G+TA50N8HVgadv06Ej2LS5G2hugHnm/q3pGeCcXrJ8zzA+a1PXK2fkVdqr
         EdHA==
X-Forwarded-Encrypted: i=1; AJvYcCXw88aeItr+GetsBFtfwj2YTsTTjPH6EPH7son28eHScLHV5YWAiErwPyYphXvAwemV3fJCtTIGwa93VJpTlCxN@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjGOQvyLImPAFYykQL0IY3xP9no0ApocUArQSEaPb+8xJ57x+
	nAdcRlzx6sFtPosfssipI5uJaQ+ps/+9ACDptucq8d7DiEhrLO6DQ2XD
X-Gm-Gg: ASbGncsUCXqef8rTXcCcfFFth28YGDPUy62rSaosjysWuBQkiFuXzMFNsdbNu4Cnvf0
	ePhbciww+B/8ZLFvFBj4Ao7J5xFFZPbouMsvKftXLDmgGGCFAh97lip26iuVtzBVEoM8TCsMpgQ
	QsImoWNyfDs3p7SlVrp5R4pjYU6P+WnyAc+qP2an5nzxRUt/qiBzeFopahDCw32oHuiHIuvFlTc
	Zx/lFwcZjG2UkFCHObJCUiFucfuWB+H2Y4C2lJtXXYTZkFduQXoNJv+4J4yWd+LXwNgkbQSuI2U
	Ebqc3vHs0CZwJsAGR9cMld08nRP4CrwgaGmuimIMir4xIpVjKlmPrbgrLAiEgOmfjjAf94JYsjW
	Zy+RO+cgcTwj7qZ7id+uM4QgrKvm6I2twKc+zfAA6I6d/MLqw1lft/TEGn9mAAnaFbYFIEvtI6+
	bn49elZM/hB+Nic49Mkja4N4lcsrWFPZFRSlgld86CIJYVpWkVX1DzWaqXk5nn0uns0K082vmC0
	bk1
X-Google-Smtp-Source: AGHT+IG++5gaOV3PJKYuJ0A9nAeEycj+nF32F/RTHqK48mjNiX/HpSzosqAvPkjm4CBA9YvRx7JU+A==
X-Received: by 2002:a05:600c:c48e:b0:45b:6743:2242 with SMTP id 5b1f17b1804b1-45dddee9cc4mr128836755e9.22.1757497396149;
        Wed, 10 Sep 2025 02:43:16 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:c6d5:9a0c:a4c1:1e58? (2a02-8440-7135-4f4c-c6d5-9a0c-a4c1-1e58.rev.sfr.net. [2a02:8440:7135:4f4c:c6d5:9a0c:a4c1:1e58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df1ba282dsm25183485e9.5.2025.09.10.02.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 02:43:15 -0700 (PDT)
Message-ID: <22a485b9-1b86-41d3-a42c-f813eea94697@gmail.com>
Date: Wed, 10 Sep 2025 11:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/20] bus: firewall: move stm32_firewall header file
 in include folder
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
 <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
 <19e664da-df4c-4bc0-84ce-41e4364f10bc@gmail.com>
 <7cfb167a-26df-4abf-a6ec-73813a1a0986@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <7cfb167a-26df-4abf-a6ec-73813a1a0986@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024318_816712_553AF8C3 
X-CRM114-Status: GOOD (  26.10  )
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

On 10/09/2025 10:42, Gatien CHEVALLIER wrote:
> 
> 
> On 9/10/25 09:47, Clément Le Goffic wrote:
>> On 09/09/2025 14:25, Gatien CHEVALLIER wrote:
>>>
>>>
>>> On 9/9/25 12:12, Clément Le Goffic wrote:
>>>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>>
>>>> Other driver than rifsc and etzpc can implement firewall ops, such as
>>>> rcc.
>>>> In order for them to have access to the ops and type of this framework,
>>>> we need to get the `stm32_firewall.h` file in the include/ folder.
>>>>
>>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
>>>> ---
>>>>   drivers/bus/stm32_etzpc.c                       | 3 +--
>>>>   drivers/bus/stm32_firewall.c                    | 3 +--
>>>>   drivers/bus/stm32_rifsc.c                       | 3 +--
>>>>   {drivers => include/linux}/bus/stm32_firewall.h | 0
>>>>   4 files changed, 3 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/stm32_etzpc.c b/drivers/bus/stm32_etzpc.c
>>>> index 7fc0f16960be..4918a14e507e 100644
>>>> --- a/drivers/bus/stm32_etzpc.c
>>>> +++ b/drivers/bus/stm32_etzpc.c
>>>> @@ -5,6 +5,7 @@
>>>>   #include <linux/bitfield.h>
>>>>   #include <linux/bits.h>
>>>> +#include <linux/bus/stm32_firewall.h>
>>>>   #include <linux/device.h>
>>>>   #include <linux/err.h>
>>>>   #include <linux/init.h>
>>>> @@ -16,8 +17,6 @@
>>>>   #include <linux/platform_device.h>
>>>>   #include <linux/types.h>
>>>> -#include "stm32_firewall.h"
>>>> -
>>>>   /*
>>>>    * ETZPC registers
>>>>    */
>>>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/ 
>>>> stm32_firewall.c
>>>> index 2fc9761dadec..ef4988054b44 100644
>>>> --- a/drivers/bus/stm32_firewall.c
>>>> +++ b/drivers/bus/stm32_firewall.c
>>>> @@ -5,6 +5,7 @@
>>>>   #include <linux/bitfield.h>
>>>>   #include <linux/bits.h>
>>>> +#include <linux/bus/stm32_firewall.h>
>>>>   #include <linux/bus/stm32_firewall_device.h>
>>>>   #include <linux/device.h>
>>>>   #include <linux/err.h>
>>>> @@ -18,8 +19,6 @@
>>>>   #include <linux/types.h>
>>>>   #include <linux/slab.h>
>>>> -#include "stm32_firewall.h"
>>>> -
>>>>   /* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
>>>>   #define STM32_FIREWALL_MAX_ARGS (STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
>>>> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
>>>> index 4cf1b60014b7..643ddd0a5f54 100644
>>>> --- a/drivers/bus/stm32_rifsc.c
>>>> +++ b/drivers/bus/stm32_rifsc.c
>>>> @@ -5,6 +5,7 @@
>>>>   #include <linux/bitfield.h>
>>>>   #include <linux/bits.h>
>>>> +#include <linux/bus/stm32_firewall.h>
>>>>   #include <linux/device.h>
>>>>   #include <linux/err.h>
>>>>   #include <linux/init.h>
>>>> @@ -16,8 +17,6 @@
>>>>   #include <linux/platform_device.h>
>>>>   #include <linux/types.h>
>>>> -#include "stm32_firewall.h"
>>>> -
>>>>   /*
>>>>    * RIFSC offset register
>>>>    */
>>>> diff --git a/drivers/bus/stm32_firewall.h b/include/linux/bus/ 
>>>> stm32_firewall.h
>>>> similarity index 100%
>>>> rename from drivers/bus/stm32_firewall.h
>>>> rename to include/linux/bus/stm32_firewall.h
>>>>
>>
>> Hi Gatien
>>
>>> As the firewall header is moved to a dedicated firewall directory,
>>
>> I don't move it to a dedicated firewall directory just to the "bus" 
>> directory where the "stm32_firewall_device.h" header file is already 
>> located.
>>
> 
> Yes, my bad, I mixed my words there.
> 
>>> maybe it would be coherent to create the same kind of directory
>>> for the sources as non-buses drivers use it. I can test it on my
>>> side if you're willing to make the change.
>>
>> Do you mean create an include/linux/bus/firewall/ directory ?
>>
> 
> Rather include/linux/firewall/(stm32/). and a drivers/firewall/(stm32/)
> directory for the firewall files would be great. If that's not too much
> of a burden.

I thinks that's a bit too much for this one.
As you're the firewall maintainer I would need to modify your entry in 
the MAINTAINER file (and I just see that your entry is lacking the 
header file path).
For now I think it is not urgent neither mandatory.
Maybe in a next patch series ?
Even in the driver bus directory there is no vendor policy so adding a 
path like drivers/bus/{stm32/|firewall/}stm32_firewall.c is a bit 
overlapping as with the filename we already know it is ST and its firewall.
Let me know what you think !

BR,
Clément


