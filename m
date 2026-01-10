Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81302D277EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 15:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N1miC9eVACfUePlD2aX/h3g2e1YcWNd2wzjqT16Zso=; b=JpPkN+GHvpPCGgjY2AxFn6/KQ5
	qzGwAbwfVltpW72cqJrTvBWhDryrPWjRpKbgIjFgLLE3f7eMXipDCVIoLU9rt7A7EpnRQ+k0FSdze
	UkfGvS175vPve/B1RfXNRjeSpt0NyefMGaUYz/HBkCHw5taD8j60C/sJ9ecsr3vWRfcUpGU0tWzwY
	R9cuiQhjVbAu1/mB3eJyKrVBY4ytO9S4YXbzbzasJ3qE80Dx9Ol6UlYVCgIxtVqEhgDadI8QVyqqM
	z+dtFp9knt2FZagb++uQ17RXOe0YyniZC0F4fTQ7zU2PFnhbKX2eQmC5uzOUHe0aHq4wnq6M5SKC8
	U+hnRHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veaUw-00000003VYQ-3qka;
	Sat, 10 Jan 2026 15:03:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veaUu-00000003VY6-1lP7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 15:03:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64b8123c333so8161480a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057402; x=1768662202; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5N1miC9eVACfUePlD2aX/h3g2e1YcWNd2wzjqT16Zso=;
        b=NbUKR1APHpVjTEhHL12RzWA2hOUay4AVE5C1TaMdUcnQlsdlAg/4PX0lZPES6jas3X
         fY12Qc6drZbqjq9vtBwksOqlaTezg9uWEGnfFgN0hMrwpceE09zULR1TaFuuIAVcPa8J
         QQzGtUc2rDDgshnOfh5DNaSWbGp2PmY+z4ZdWy+049FooYWpU7UCQCV5awFDa+7aomnn
         aK/gwYPcw3Jwe4MGXkQCkVhYKZ+668dq+jwrOfGBz2951V1qvy6A3VYqTDXafQ43+gW9
         YOy5/ZVfmZtoQ2Z/nyzrF+aKSTnGW7s5lGcSfKj+eaT+r+wZJmBmNv+GoRuT/AjOUcd3
         dTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057402; x=1768662202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5N1miC9eVACfUePlD2aX/h3g2e1YcWNd2wzjqT16Zso=;
        b=RqBNW6MFo9yZQMrFIL8HjaU1GkPJdFccm89OMquXBfwnMlYhhvvoMRKRS2nAHg7WMg
         XApFPqUGDe2zswONdVnrD89F8cTTApuSNpb4MYJLBsZWHPBWmTuO/KxAb8SF9p8/vTdN
         g09BXLRMAou5BAcHHoRvmK3FEDJqQtl9lg56kAm0EOzGMkDlegCCeny80ZDIShOADxj/
         Ph8TdWZawf+UCOaB4ZIyI36b7SEnCLQPSk3wGPLa4czq2/R/OjrawxW6EyaP2G/7js2I
         QyiQbxz76OrFRr623FexCtg8Vc3FwZYPj4j/QvPXB1cHzlB5RUPIrNEdZ5Oiwh4/sfKq
         hWvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Dz/MDnG3X8rYHbzRHGaI+n9w3KodDzIAGjosGwpAHpmlNlXCk8c/xDFsl6USRNW5K95G60dZkqStyv72gcSm@lists.infradead.org
X-Gm-Message-State: AOJu0Yziy/5cj2CsHvDX0Vf6xIJVycAa13ZcjjgqQHT8hrtec6QdNDnd
	e2wCEhJidPBPHUDOksAfpxwGQDnW9sIPtC+5yFO8zFVc6YEAXCUUYIRZC/le+XsL9VM=
X-Gm-Gg: AY/fxX60Xw7WMd2RUyCOgqvWYXa29OfxaqVQWH8CUjOeDbCNTvDTJQ39X5yENkiuWGj
	YMcmdE6HzCGwEvMDewHHrFkdlbZb4DrFzLfN/SrNC3KC0FdfbZO3ykf7N/ThjqMClLn/yqZli4L
	zay4AS2H1b5z8IUWg44hP+lmt5bbV/1ZFkoOBCOFG1qJ8M0cgvTnz6NdD9ioCcmmCuwS7muyawd
	AvR3vwMOrwEs2wCfPHktFdXaon3+lQmVBkdUbeIemIqXkMUI7nwJJeTUsxS4FFyrBrg0yrWHb+o
	gpM99vQePtvYg2O+VaZmq9uiSnHjFslImNV/OW83FJK9eciBADMXsyj/FvFo56kHOPqONtnM/+4
	WkodOPkDLfOITrQ6peUC2ikcCSrrkka5fwpMhE+SrG29fFe2HDdITB7zJqYlKVhA5/Wcohkxf67
	mA7Mu0HCtBOaZqxkpoDw==
X-Google-Smtp-Source: AGHT+IHaWhSM19cCp0YqzDorDOXvKVjCzix83PyP8GROo+XI/axIv7q7HlX7FUG1DTQizKZCY8BoIA==
X-Received: by 2002:aa7:df9a:0:b0:64b:9fa4:b586 with SMTP id 4fb4d7f45d1cf-65097e71207mr11073823a12.25.1768057402414;
        Sat, 10 Jan 2026 07:03:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf66214sm12929650a12.27.2026.01.10.07.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:03:21 -0800 (PST)
Message-ID: <81e9c0ea-ca06-4cb9-8f5f-08fec370812b@tuxon.dev>
Date: Sat, 10 Jan 2026 17:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Varshini.Rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
 <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
 <cb19cd94-7f81-4f75-a7db-bf25192986ed@tuxon.dev>
 <9b97b3b8-9e46-4482-8420-ebabe00254fe@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9b97b3b8-9e46-4482-8420-ebabe00254fe@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_070324_506717_A7EC3367 
X-CRM114-Status: GOOD (  20.03  )
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

Hi, Ryan,

Sorry for the late reply, I was off for a while.

On 1/5/26 19:58, Ryan.Wanner@microchip.com wrote:
> On 12/23/25 07:00, claudiu beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> On 12/18/25 18:23, Ryan.Wanner@microchip.com wrote:
>>> On 10/20/25 12:17, Claudiu Beznea wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>> know the content is safe
>>>>
>>>> Hi, Ryan,
>>>>
>>>> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>>
>>>>> Add support for clk_parent_data in usb clock driver.
>>>>>
>>>>> All the SoC based drivers that rely on clk-usb were adapted
>>>>> to the new API change. The switch itself for SoCs will be done
>>>>> in subsequent patches.
>>>>>
>>>>> Remove the use of __clk_get_hw() for the slow clocks.
>>>>>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>>>>> Change how the main_xtal and slcks are initialized so they match the
>>>>> parent_data API]
>>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>> ---
>>>>>    drivers/clk/at91/at91rm9200.c  |  2 +-
>>>>>    drivers/clk/at91/at91sam9260.c |  2 +-
>>>>>    drivers/clk/at91/at91sam9g45.c |  2 +-
>>>>>    drivers/clk/at91/at91sam9n12.c |  2 +-
>>>>>    drivers/clk/at91/at91sam9x5.c  |  2 +-
>>>>>    drivers/clk/at91/clk-usb.c     | 41 +++++++++++++++++++++
>>>>> +------------
>>>>>    drivers/clk/at91/dt-compat.c   |  6 ++---
>>>>>    drivers/clk/at91/pmc.h         | 11 +++++----
>>>>>    drivers/clk/at91/sam9x60.c     |  2 +-
>>>>>    drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>>>>    drivers/clk/at91/sama5d2.c     |  2 +-
>>>>>    drivers/clk/at91/sama5d3.c     |  2 +-
>>>>>    drivers/clk/at91/sama5d4.c     |  2 +-
>>>>>    drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>>>>    14 files changed, 72 insertions(+), 49 deletions(-)
>>>>>
>>>>
>>>> [ ... ]
>>>>
>>>>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct
>>>>> device_node *np)
>>>>>
>>>>>         sam9x7_pmc->chws[PMC_MCK] = hw;
>>>>>
>>>>> -     parent_names[0] = "plla_divpmcck";
>>>>> -     parent_names[1] = "upll_divpmcck";
>>>>> -     parent_names[2] = "main_osc";
>>>>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck",
>>>>> parent_names, 3);
>>>>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA]
>>>>> [PLL_COMPID_DIV0].hw);
>>>>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL]
>>>>> [PLL_COMPID_DIV0].hw);
>>>>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>>>>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL,
>>>>> parent_data, 3);
>>>>
>>>> sam9x60_clk_register_usb() could be converted to use parent_hws
>>>> member of
>>>> struct clk_init_data instead of parent_data.
>>>
>>> So this would mean that I would pass in an array of the plls as
>>> parent_hws, and use that to load the clk_init_data struct instead of
>>> filling the array of parent_data as it is changed to in this patch set?
>>>
>>> And this would be functionally the same since parent_data points to
>>> clk_hw?>
>>>
>>
>> It should be something like:
> 
> I see, I guess my question is why the usbclk system only? Is it just due
> to how little parents there are for the usbclk? Or is it because this is
> the only clock that only uses clk_hw for all of its parents?
Because this is the only clock that uses clk_hw for all of its parents.

Thank you,
Claudiu

