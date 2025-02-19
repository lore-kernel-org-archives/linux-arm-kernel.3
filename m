Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CF9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2dopUOEbkWXudLU7sGnWO1wuCY7VI0h4RAqKInLyyw=; b=zMb5BUQvXjnI7RiyZ7WIaeWZtF
	xw/2LbLusYkaWuNQx8G+HP4y+OK1vSIUIqFSHArp0bHPzhMcP8t9Hc2/oqw8MeZcVg9Q27cv+MfeX
	M7q7CyCKYA8LePaNd3iFF2wZ1QckETyx/EOsZQQPzCEfEuqaNCx4ynZQvn6UnlJPYsfUPvg09AxS7
	bcG9dzivynJ+nY+PWw7y62UPRtbI/o8tTo6kQ0Vy8yKq9IjDhFqxEUmrb6UIeh9rdmGoNXOaA2HDQ
	2Z+cp2YyxFivXfNqA+Ty0Q2PhzIgv8XYyLfonfyd5dqkdUQLyfw9jUOi6rGnPIOUc9nyjPCuTwGQg
	bqaD1UKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgDM-0000000BnDL-0CpP;
	Wed, 19 Feb 2025 09:17:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfo0-0000000BeXt-3anJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:51:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab78e6edb99so967129266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 00:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739955103; x=1740559903; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J2dopUOEbkWXudLU7sGnWO1wuCY7VI0h4RAqKInLyyw=;
        b=JSaQMnZyAgscjoWXJ5GxPZTul+KSXy9DsW5nztVHjdHZNpgy2bx2lZFHEvFssLn4IT
         LhlkppbhvB81+IVgncUQXdYAx/OiITrT4wJceabVPHQwndDIp6bbqqKJo3mIyHbDDpDI
         /X6rovH/suec9m+KKAsLgWSEF0zGUOKwUVKHgHmehbNIJf3WTy37nN3KK/0MlvtNqlDQ
         vjBEP7Y/ACyHhKV51itOXUWH1GkSIvyJ2KkbXKtn+RYyS56U+c0nOnVRmTbFLSvkmE+l
         /gzSTpZ1gQDfbxmq8Ic1bfx4yUbZx5xCrCF7WVTv0KyUtqpMExTr+r2RmwO6prP81Afb
         mS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955103; x=1740559903;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J2dopUOEbkWXudLU7sGnWO1wuCY7VI0h4RAqKInLyyw=;
        b=QwwkqNHHeZbgAY0eTDtlVE+Ihmd0t1O0/K6EVkHMIOqemeqEJ8ZTskw5WSqtFcZX9m
         0PpqsBSbt1PKbWrt6sErVWnuqnUyZ1Fc0E7iAmiLZ24sztV8NhP2XwWbsPmK5m9cFK9e
         97e1Ab9CbtJfvLhnvCzHowgW2oPsTOCgOw5OVQg1WOq7MsgEsK2zGgfkSBMaBw3tsbHF
         TUj8SDc9Xef7pFU5x+1SUTmcs7jvU/BV4Qd7bliZfeWJBvAZzELTf/QVbQuY8ZEvTxhJ
         5ipchORnPhfrOW/NHi7RCs3KSRUwtfQvKRF8Mc8BvZYWMw3Nf9z4wyKZbtYQv7ynKVE/
         NFUg==
X-Forwarded-Encrypted: i=1; AJvYcCVexNyYJd3d5qPRLeoHLnV1RH7h2E7fic1Vsnr3DC3Ws+AMFiPjRsFz0Uf+UFyAKn+o+3Ia6yLlQDy5zrzBAGQH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvr3r7tEy9uhkxDQQPsos++oWcy8By/tm975c6VO3hebRiY79S
	4JpxS9sRkbVIeASQyC0h8bXZwmZ4IK1ixdjMMuKbCnpBkA315aeJcXRTqx22sE8=
X-Gm-Gg: ASbGncs4Y4fUNFhuUXwR+SyOBtNC6SPmDx1mgFBiS/eMIbHLLdc5YmH/JPYybfbfpQD
	sq2Auggys5wP3B49DeQzizA/H1qecD0+/HoAfwzDuDGraLvOBBfSEthlItNqD1ttgkw4BT9I2wS
	pPPi4IxNSm5Hoe2JyEaWppsC5BF8HsB5dq+67ylD4Q/Nh85z/9umJyA64v+AXG2c8LgBeCvrKtu
	duYIxM3P0Om3VSXqQMceS+UYwSPjg/2VIUOumKFx12iO/+ffV6b8TZFpkxqkksucDCkbi+J9afH
	9ghSbcvgUvar3h+DaYcAm+Y=
X-Google-Smtp-Source: AGHT+IFy5LMwjMHF+lyBsWbylZGlIxP2bWCWlwmQuf2NyzqyYPCLtQrAK5Xis2XKpiM0bordtD+JoA==
X-Received: by 2002:a17:907:96a1:b0:ab6:fd1d:ef6b with SMTP id a640c23a62f3a-abbccebec04mr281429866b.27.1739955102477;
        Wed, 19 Feb 2025 00:51:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm1246033266b.68.2025.02.19.00.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 00:51:41 -0800 (PST)
Message-ID: <a99ab8eb-274b-449c-8bb6-be9422c5b2a2@tuxon.dev>
Date: Wed, 19 Feb 2025 10:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC
 partially
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Dahl <ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-2-ada@thorsis.com>
 <a1dff4af-d771-4424-869f-15d3b6bca013@tuxon.dev>
 <20250217-shortwave-scoreless-38cb49fe5548@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250217-shortwave-scoreless-38cb49fe5548@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_005145_060248_0E5F91CA 
X-CRM114-Status: GOOD (  32.53  )
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

Hi, Alexander,

On 17.02.2025 11:47, Alexander Dahl wrote:
> Hello Claudiu,
> 
> Am Mon, Feb 17, 2025 at 11:11:44AM +0200 schrieb Claudiu Beznea:
>> Hi, Alexander,
>>
>> On 10.02.2025 18:44, Alexander Dahl wrote:
>>> Before adding even more new indexes creating more holes in the
>>> clk at91 drivers pmc_data->chws arrays, split this up.
>>>
>>> This is a partial split up only for SoCs affected by upcoming changes
>>> and by that PMC_MAIN + x hack, others could follow by the same scheme.
>>>
>>> Binding splitup was proposed for several reasons:
>>>
>>> 1) keep the driver code simple, readable, and efficient
>>> 2) avoid accidental array index duplication
>>> 3) avoid memory waste by creating more and more unused array members.
>>>
>>> Old values are kept to not break dts, and to maintain dt ABI.
>>>
>>> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
>>> Signed-off-by: Alexander Dahl <ada@thorsis.com>
>>> ---
>>>
>>> Notes:
>>>     v2:
>>>     - new patch, not present in v1
>>>
>>>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
>>>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
>>>  .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
>>>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
>>>  4 files changed, 100 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>>>  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>>
>>
>> [ ...]
>>
>>> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> new file mode 100644
>>> index 0000000000000..ad69ccdf9dc78
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
>>> @@ -0,0 +1,24 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
>>> +/*
>>> + * The constants defined in this header are being used in dts and in
>>> + * at91 sama7g5 clock driver.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
>>> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
>>> +
>>> +#include <dt-bindings/clock/at91.h>
>>> +
>>> +/* old from before bindings splitup */
>>> +#define SAMA7G5_PMC_MCK0	PMC_MCK		/* 1 */
>>> +#define SAMA7G5_PMC_UTMI	PMC_UTMI	/* 2 */
>>> +#define SAMA7G5_PMC_MAIN	PMC_MAIN	/* 3 */
>>> +#define SAMA7G5_PMC_CPUPLL	PMC_CPUPLL	/* 4 */
>>> +#define SAMA7G5_PMC_SYSPLL	PMC_SYSPLL	/* 5 */
>>> +
>>> +#define SAMA7G5_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
>>> +#define SAMA7G5_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
>>> +
>>> +#define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
>>> +
>>> +#endif
>>
>> I would have expected this to be something like:
>>
>> #ifndef __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
>> #define __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__
>>
>> /* Core clocks. */
>> #define SAMA7G5_MCK0			1
>> #define SAMA7G5_UTMI			2
>> #define SAMA7G5_MAIN			3
>> #define SAMA7G5_CPUPLL			4
>> #define SAMA7G5_SYSPLL			5
>> #define SAMA7G5_DDRPLL			6
>> #define SAMA7G5_IMGPLL			7
>> #define SAMA7G5_BAUDPLL			8
> 
> Okay no reference to the old header, but numbers.  Got that.
> 
> I'm not sure where you got the 7 and 8 from here, according to my
> analysis, sama7g5 does not use those.

From include/dt-bindings/clock/at91.sh

#define PMC_IMGPLL              (PMC_MAIN + 4)

#define PMC_BAUDPLL             (PMC_MAIN + 5)


> 
>>
>> // ...
>>
>> #define SAMA7G5_MCK1			13
>>
>> #endif /* __DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H__ */
>>
>> Same for the other affected SoCs.
>>
>> The content of include/dt-bindings/clock/at91.h would be limited eventually
>> only to the PMC clock types.
> 
> What does this mean?  The clocks split out are no PMC clocks?  

Still PMC clocks. Keeping the types in separate header allows keeping the
code PMC code common for all SoCs. Then the newly added headers will be
used only in the SoC DTes and SoC clock driver (e.g. in your case
drivers/clk/at91/sam9x60.c)

> Then
> the old PMC_MAIN etc. definitions were named wrong?  All or only some
> of them?  Or is this different between older and newer SoC variants of
> the at91 family?
> 
> From a quick glance in the SAM9X60 datasheet for example the clock
> generator provides MD_SLCK, TD_SLCK, MAINCK, and PLL clocks, while the
> PMC provides MCK, USB clocks, GCLK, PCK, and the peripheral clocks.

drivers splits this into:
- core clocks
- peripheral clocks
- generic clocks
- system clocks
- programmable

It's how the code sees it, just a logical split.

Thank you,
Claudiu

> 
> The chws array in drivers/clk/at91/sam9x60.c however gets main_rc_osc
> (from clock generator), mainck (clock generator), pllack (clock
> generator), upllck (clock generator, UTMI), but also mck (from PMC).
> 
> This creates the impression things are mixed up here.  I find all this
> quite confusing to be honest.
> 
>> The other "#define PMC_*" defines will eventually go to SoC specific
>> bindings. "#define AT91_PMC_*" seems to not belong here anyway and these
>> would in the end removed, as well.
> 
> Okay, you seem to have an idea how this should look like in the long
> run.  Are there any plans at Microchip or at91 clock maintainer side
> to clean this up in the near future?
> 
> I would like to rather put my small changes for otpc on top of a clean
> tree, instead of trying to clean up clock drivers and bindings for a
> whole family of SoCs and boards, where I can test only one of them.
> O:-)
> 
> Greets
> Alex
> 


