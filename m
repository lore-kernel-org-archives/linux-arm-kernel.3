Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E67D4A605
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 06:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRmddyoOkqJyjv4Ewm0evYUf4rsoKHbvJSEbw2chVO0=; b=yx3MmBMLZ+qXCZiJodgk/psl0k
	ikh/STPCt8FDGyUaCHEg5z86jCQWX+hLYq5x4M6G4rKopFanBJeyiktgCjI7YKU8qRTUHvcGJXq6g
	x09Rqu/AkjhHVJCWl3/xT8/JBLrge+YblyNzZqfT+YlaHlzpM8Iv3FQ9Qy0R3tg4dTO5j+IO+gkUb
	9ZFUel2h32x8j9FDIT4jK2fMB9SC1gZL1Ra4b5ceNWOF6jmQH8zQWekbIa3l/4LODYgjrTCkMIs9W
	xkF8mSyZ1a9SDaoq2z4VJBuNzBUUL9gTQmpKkXsCXt7ABC76zGDk1XhjUR5fobOhiAEZXHHl8y0uZ
	sDsZ8bOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdlf-0000000Dg6y-0Qbp;
	Fri, 16 Jan 2026 06:57:11 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgdlb-0000000Dg6d-2BmC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 06:57:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee974e230so14803735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 22:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768546626; x=1769151426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRmddyoOkqJyjv4Ewm0evYUf4rsoKHbvJSEbw2chVO0=;
        b=U0cRLr3xR9saeAj/ZZg+5QYTu6MVM12TZfpK0iSrbLJ4LLArUfnSvYv9Y4I2MMBiMo
         csm6HrlDWeEwJRdh8IZEQqWFrYQvHCKIilMo+k2W1dJ9kjApKlItJeez/T9FJNCl7H/x
         UIIAZUDMWtaDPqcGCL8YpFphhw8+Lls9jU/e2oNnjBAP8Uu1qCkHHZPdDMbebdqsau2G
         6dIRHH44PudJy+YG7rUp68uu9k9aKKs5WByjkLlSjikBRDKG5FwZMGubwvHInxDptvTm
         pxT4PcFWRKmq+BxyQ7xkWUrnFtZ9TPFq7V5mScMLwbkXFyCukDP4nJjSQmalSqAAeJsx
         9o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546626; x=1769151426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRmddyoOkqJyjv4Ewm0evYUf4rsoKHbvJSEbw2chVO0=;
        b=fNW8Fu1CLeRcXhHMgDy+c475njhbkgYdJkDsNrELKcWRKbwooYafidY1tmPUaoH83W
         QJZGNK3JAl+mE4tX9q8fIRjH2/eD559flxxu9ZAadeyLHKOYHumQz7Eyifn2XEUIw0BM
         EU6x9ebOqkT0X5i+dVXh5WBYObW79N1P3WXSBlekLevMpGZJo0BwwYmibLUc3KK09gyi
         jOns3WqmH+FHqVSydNQSfZt9b04UlmEf4UxAgPQWGKWEk1ydqtTD+4aiaejonUiRK/7h
         NfpixB+TuzXsdtJGEO4YYV81sB8mm2FW0BgYIzt3n1DaezJx+wvRwVJkZe2x9OoE4520
         lKwg==
X-Forwarded-Encrypted: i=1; AJvYcCWnQcR6+7Nf3btrHoBVLHlhHyLzJhr8LiEx/I9tpOL6shdAHA29L1sohfRrmw2cpA9zoaUlP06fLWAs2ieMx7yz@lists.infradead.org
X-Gm-Message-State: AOJu0YwxWirC2zFpyQgp2BG9i26IE3R2Z8hKnbYEtIyAO9NdQtbykRUx
	1ppvEcYyAoXZI2Cz0pkGr3mABpja/dojhpixxpu6S9JKDmcVJjw1Snl5DDd8+Gq0l+k=
X-Gm-Gg: AY/fxX4i/VxdK+6bnKnK62huVhaipsrRohcqVdLbHSll/qaXPcec6LO3Qwl01BguYWb
	4X9UvbpYF2Dh1oT3PE8H1sTDaFOdZUuuxbGz7S7FMKzuMpugd2bnPABNZ8OWA2JqBw7pvvQdBig
	f36EQKQvLSOL1ucLLgxy8ZTL2GFpCo7hi+DIkD2CBC/bK8MapSG96qEj9NBwOBsYQSvZYmuXbUN
	yBbdv/bKVGBNeOleA5UQAsADZw4t9RJQAnug38ACN5zgVwiSxXFZXN24oSR3OrE5rz4ulF721kE
	j5LPe46oyg098aoDVtwLKQs8AauNl2ECKfco0RFuH7vBD9xUseQ7pkBnzJ/OnGxwKC02WJ6WvkC
	zoX7LlNv7jrONhVKu/sV4QKbbNXO4cZEKtCN1ocbhCBb3OZTMaT2BMB/5iKg1ANeQDLopEwJGJD
	sNNY/PM/SqjNJrlEbueg==
X-Received: by 2002:a05:600c:35ce:b0:477:7658:572a with SMTP id 5b1f17b1804b1-4801e33c1b4mr19789625e9.20.1768546625736;
        Thu, 15 Jan 2026 22:57:05 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe78fcfsm9603945e9.19.2026.01.15.22.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:57:04 -0800 (PST)
Message-ID: <87ae0f02-6a76-4f54-b8d6-121244933b35@tuxon.dev>
Date: Fri, 16 Jan 2026 08:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
 <bf0c00b5-9e7d-47d1-b503-2d27d862a171@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <bf0c00b5-9e7d-47d1-b503-2d27d862a171@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_225707_583050_FCE8402F 
X-CRM114-Status: GOOD (  15.47  )
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



On 1/12/26 23:25, Ryan Wanner wrote:
> On 10/20/25 12:17, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>
>>> Add support for clk_parent_data in usb clock driver.
>>>
>>> All the SoC based drivers that rely on clk-usb were adapted
>>> to the new API change. The switch itself for SoCs will be done
>>> in subsequent patches.
>>>
>>> Remove the use of __clk_get_hw() for the slow clocks.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>>> Change how the main_xtal and slcks are initialized so they match the
>>> parent_data API]
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>   drivers/clk/at91/at91rm9200.c  |  2 +-
>>>   drivers/clk/at91/at91sam9260.c |  2 +-
>>>   drivers/clk/at91/at91sam9g45.c |  2 +-
>>>   drivers/clk/at91/at91sam9n12.c |  2 +-
>>>   drivers/clk/at91/at91sam9x5.c  |  2 +-
>>>   drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>>>   drivers/clk/at91/dt-compat.c   |  6 ++---
>>>   drivers/clk/at91/pmc.h         | 11 +++++----
>>>   drivers/clk/at91/sam9x60.c     |  2 +-
>>>   drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>>   drivers/clk/at91/sama5d2.c     |  2 +-
>>>   drivers/clk/at91/sama5d3.c     |  2 +-
>>>   drivers/clk/at91/sama5d4.c     |  2 +-
>>>   drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>>   14 files changed, 72 insertions(+), 49 deletions(-)
>>>
>>
>> [ ... ]
>>
>>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>>
>>>        sam9x7_pmc->chws[PMC_MCK] = hw;
>>>
>>> -     parent_names[0] = "plla_divpmcck";
>>> -     parent_names[1] = "upll_divpmcck";
>>> -     parent_names[2] = "main_osc";
>>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
>>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
>>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
>>
>> sam9x60_clk_register_usb() could be converted to use parent_hws member of
>> struct clk_init_data instead of parent_data.
> 
> Looking more in depth sam9x60_clk_register_usb() calls
> at91sam9x_clk_register_usb() which like in 21/31 is called in dt-compact
> and only the clock name is passed into it. Should I make another
> function for sam9x60_clk_register_usb() that uses parent_hw?

OK! To not overcomplicate this series, let's keep it as is for now.

Thank you,
Claudiu



