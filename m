Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A0EE6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz2ngXG4tcddgwLbaHyel4daUml7whhWj+vWVEPKePE=; b=VzGQSD55bvQtEq1bJZO+URhQFE
	Q53Gidwo8LgkST6sb80QXeByzZgwJj+u1DRIxjCsl+qBySXlbg0LVAYa2ahtECdN7TJmpyZEKjfg/
	P9G6xFK7mINgf8F8edXcLRPIHQsvjewrBQRQgvXuN//Z/VyhaALAySbnAkr3nwh4pPKWoUtq++R5Z
	DvmHZwl851nflNf7YmWgodrDG+QVV9cdh22wwlo4b/qhn0RkDqlQHm3Z5JcCY/iBKz2TNZkEbilN6
	Y8gW4An2BdoMADGWLQVkjo5HmRivHJmlx0F6WOEdQ6Ye6Dr/2q52VugkfDMZnGvGx4qknocvSwBiw
	uXfizzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2wa-0000000FZSK-2S2H;
	Tue, 23 Dec 2025 14:00:56 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY2wY-0000000FZRU-0OBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 14:00:55 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b76b5afdf04so734626266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 06:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1766498452; x=1767103252; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hz2ngXG4tcddgwLbaHyel4daUml7whhWj+vWVEPKePE=;
        b=kw8i1bCx2OEzXjZlrmradU8jd7/A66nUKOs5U0ZsowomVEmMGQKn/mzW0X8CH10I8c
         IVhHRGjUAcjYz6wT8wWSZYEVMaXvR5kFwekWUTQmtEO5IF/2XUsRJTsoZTVrPST+Yw+H
         ezu3GMICaAWC3zEA1RnOY/jPhGmyd3tso/DjgekTrX05L/GMAj4xNK5n9hfRXSS1FlrQ
         dAMlom0s3KtAtZaUP8ntQz7p9WhEorJRcUffiAaIQG15eWfhxTEkPM3c7eJT2MqIyNR4
         B/d4GluFiZ78Zed9o1ru/mUSNTk0QSEv8cB77Q3bWyXtoffJx+sN35c17TiRG3SjvPaA
         jhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766498452; x=1767103252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hz2ngXG4tcddgwLbaHyel4daUml7whhWj+vWVEPKePE=;
        b=s8G2H73WAKPFfDkwJYD2NQfUmCpoAydgPJNMqRHt/YRzQ5XGjLLN3BYC3lUJxPJmEl
         kqEWspbI4GdpoTb5od8l46LE4aKT89DQbmKeNdqqyk+e5SEwpcZ29GYqvl+PjN+c1uum
         xBGc9j9zdiWkfqwKgr8pous1M2STfBPYC3XsTIJHPCz6Au96WFA75Sutxj8BPAsSXCup
         PMwktDD0TeTv3+vrEVWdkK/gFVjUstgoGiahmTGxGnC7040WZVBPhSrXSDOq6TkOz9X4
         B63YtQrekAgUIJDyEV3Z6UQUe8pNrKlq7jX7oiQ3qU/QqH7QaoRwxD3CIrk4o1XpZEEs
         mBYg==
X-Forwarded-Encrypted: i=1; AJvYcCWUNSYSbL133IS1Y9oTsMA5fkSqf9PAArTVEQ4B+wWCl0f7N78Rb4sXMYoHLCOJe7IhBV8G+3orkZmyRq4PinPm@lists.infradead.org
X-Gm-Message-State: AOJu0YzoUELaC2w1lXfdlv9LpjvsAnAmO9oDzmY9Z/8p53Tj/j7aWmux
	IWMOK4aUaXJbt0+DgGIBHvB26NH0BbuBlQrdifoi3F7iEchg5unVPbRbcBvsIKE/xNY=
X-Gm-Gg: AY/fxX548cJHJTXSqFiUtVHmOTJSE8NoxiQQZ5MrbEERpsaMeEDKjAsQUpuTzHBjYon
	k2auUNxj9sJsJoiHPxolcZ38e9ffJJSc3Tqv4HD7mzTtgzPU8EIohRrgYViRcNIODUcaoCB+bRU
	6rz1QVhkPk27GsSUEtv8eS9Q1oWfa3601yMtknvkJdOSquIE4yxnLMYBzG6ETOBai3UzuDwA/uX
	4hLEcrH3inaR04Y/+gEyUTmk2P0TfTKazwY6TnIHcaDdmHovQFLY2O1GSj+DSa1DfEEJ6PhOumZ
	Ub0hw1uiyOJInlNX7+YKOqdFaAXRACmi/SwWDqnaseDKF6qT2oTpBoELI5XUdHNJJ9MI2x9S2YH
	I6XoRkTGUCHjmMrmZSphlAHKRM3JWdI3srmSq6PZ4RO/WE3vsHwVOWM+C6LsIUNt0PaSj74NiGm
	g6XZhTdi+AylNgxwz7C5oTQlPQCHaZOD+cxIYL4luHwuqQy9cJJ+YNrPwg+2ha4G5irw==
X-Google-Smtp-Source: AGHT+IGYPXJ/69XN6gGfQWUoIVBAYdG82ZOyLblXkLMpSFGydFm/34pKyRhBFoWGTba47CrlMHh16w==
X-Received: by 2002:a17:906:c108:b0:b6d:6d66:e8e9 with SMTP id a640c23a62f3a-b80371f98e6mr1586569566b.61.1766498451606;
        Tue, 23 Dec 2025 06:00:51 -0800 (PST)
Received: from ?IPV6:2a02:2f04:620a:8300:4258:c40f:5faf:7af5? ([2a02:2f04:620a:8300:4258:c40f:5faf:7af5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8080e2177csm396549266b.68.2025.12.23.06.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:00:51 -0800 (PST)
Message-ID: <cb19cd94-7f81-4f75-a7db-bf25192986ed@tuxon.dev>
Date: Tue, 23 Dec 2025 16:00:49 +0200
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
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_060054_181842_569F753C 
X-CRM114-Status: GOOD (  19.60  )
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



On 12/18/25 18:23, Ryan.Wanner@microchip.com wrote:
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
> So this would mean that I would pass in an array of the plls as
> parent_hws, and use that to load the clk_init_data struct instead of
> filling the array of parent_data as it is changed to in this patch set?
> 
> And this would be functionally the same since parent_data points to
> clk_hw?>
> 

It should be something like:

  	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
@@ -235,7 +235,10 @@ _at91sam9x5_clk_register_usb(struct regmap *regmap, const 
char *name, const clk_hw **parent_hws)

  	init.name = name;
  	init.ops = &at91sam9x5_usb_ops;
-	init.parent_names = parent_names;
+	if (parent_hws)
+		init.parent_hws = parent_hws;
+	else
+		init.parent_names = parent_names;

Thank you,
Claudiu

