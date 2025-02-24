Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AEDC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hSkW3tH+RDTSb9Fo6GDimpNp79/WhGzMXLMYukVH70=; b=B+X9co3pXxyFZBl9eT3yHl78YQ
	0g4Gpx27XhJor+PZ5atxVTdZTf332hCNaxlBIReEeCNwJEj/QViLsV5WCtMyI7hK9V+VBezU1ywfd
	0qqE6K0TnVwbXfseGZy2dbqu3L78jkQCyj0+AJ09FFBHJ07pCSdR/9/oYsEmCov1qab7xFch+Zex5
	k9NzqOUWm7fOgIztEMwOYFThkeQuepLEl5K/HerXLZDAfmonjC0v+ZwmOmAc+tyZrf9xAsBSKHD3s
	uaK6vzdTnIeNBmWqX/GrCDcXHTRmKhvzjnkj/Nhs/dIriFXDZO974hX2Vxo0M4ZuKtuj5hWHRbzC/
	Rgg73ZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUbK-0000000CsHP-2Mib;
	Mon, 24 Feb 2025 09:18:10 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUFN-0000000CmZX-0vT8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:55:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abadccdfe5aso729540666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740387327; x=1740992127; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hSkW3tH+RDTSb9Fo6GDimpNp79/WhGzMXLMYukVH70=;
        b=KDXh/tN+pZRd8h1KgV8jr8x2LNQUUYzmmYh2Md1Eis9RB2JepgioEyHj2C/8kjSID7
         1QPW56trUzOJt6FqYf/w52kjs7du/mec60Ooog5Ou4v0CVP3akVknvRDT8SSBn62OndK
         6ciAuf4Qf6L3ldZ1ftb7duO4HN8qFKSToGqughkNOeavylAlphcsP0/ccOHQfXIXHjWK
         8/zm/pb7kCga0ORpzB8lZdExsz0HEwwexIV/O1Dag1wd6T0cO/G8GzgwImDJIvzVonS3
         2cQ1tj67mZi9WBHcKpv2eymZb4CnteWQ9Crym0UdOacJpnw1JtFVKYziDfj9W7HrAOA8
         LKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387327; x=1740992127;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hSkW3tH+RDTSb9Fo6GDimpNp79/WhGzMXLMYukVH70=;
        b=GPvQmtAOXBxjLSYVBFataP1mpZAOSuPSB4y5egjFlv6OsdaDGDHKnWFPErJvWH0sZf
         iUDYGZbzPNp0/RGwJbOKuV7KBhcCZOEwtZTh4smXx4Bfm678+QVJERScv+ugbewBYyyC
         3ZOXtfPOgzSTkXnB5K/GiBf2okGdUs/GbXlel8Q0nH22kg/t3zkijgQEzMDpharqPjOP
         nqDxqvDsshTOhU2D08m92t5rYNKIby84+byYIE+12WZ7xV9A7Lczye9A4QqRp1WUrnbT
         BZtbEco6UMIWunn8qj9FHaQQQNQ+jx6+zUweP2xi2QyHv8W4u44eGYJLtE+4vKm7yqic
         XRcw==
X-Forwarded-Encrypted: i=1; AJvYcCXW5TDwLj684tWv4vA20/Sm4sZmS7nBDTeAUiiZHqx7UWMOKvF9zqxudhKHWrEU4BjVc9wi7CurOzEnsE98bj30@lists.infradead.org
X-Gm-Message-State: AOJu0YwHS0Ud96lQEkB3Ywf/XhDXKJXlUMNag6LY/HAkRJBIRiAylM7D
	Lo8jdRDepKlKKujvFfJqWmV9JW4xBnE9adzAJwtUCt5afhfJ1UlSNrx7gk6Rv8Y=
X-Gm-Gg: ASbGnctp2z6swM68iSOI8tEpVSXJ+w/YaEM8bhVzm14bS7VZtur8K4xfgVr5z4m1Zvn
	DxfVqFaoWXPCCZEXswojy6//Wiqbv1kXpffqxWQ9ZDKQsqXHPWLOVkDXYLhOPRKN8r2zMFyq5rI
	pwAY98sa1IKehcx0oYwQtRMQKmFgyQVi4ioqjB090LWOsk6yyuA7tUEJ99myBqBJIoZMzJcBUih
	tGbxdS1Wg+WW9bZBY4QSu5x7Wf25ds9fxugxEPZFLf5KxAUrALX+D2xhUzenxXpgjtJzQosTJK+
	2/WnPzWFUJvy00UT41vysvD73BiICxagmg==
X-Google-Smtp-Source: AGHT+IEs8x0IQjFrgjH3pilnXb/AGxeFhCSA//JhOToJBvieCqskdjOj0Fwy0VykJbl/XT4OZr9y7w==
X-Received: by 2002:a17:906:3282:b0:ab7:cb84:ecd6 with SMTP id a640c23a62f3a-abc0df5d6f5mr911751566b.56.1740387326903;
        Mon, 24 Feb 2025 00:55:26 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532802a1sm2188079966b.76.2025.02.24.00.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 00:55:26 -0800 (PST)
Message-ID: <edb77ae7-d837-4e30-99ec-9ecb8b0647e9@tuxon.dev>
Date: Mon, 24 Feb 2025 10:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] ARM: at91: pm: Enable ULP0 for SAMA7D65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a00b193df9e0cb95d144a249b12f1b13188d1ab7.1739221064.git.Ryan.Wanner@microchip.com>
 <32ad3a1a-c6b6-4db1-8e80-8b5f951055a8@tuxon.dev>
 <5c6910ce-b0e4-47e6-9c9b-f0093d34f4a6@microchip.com>
 <b3de47a4-614c-4650-a866-5718b2e2b50a@tuxon.dev>
 <b03c0871-a846-43a1-a4e2-d8d9ee8ef078@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <b03c0871-a846-43a1-a4e2-d8d9ee8ef078@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005529_359583_1880313E 
X-CRM114-Status: GOOD (  29.66  )
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



On 19.02.2025 17:24, Ryan.Wanner@microchip.com wrote:
> On 2/17/25 00:18, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 14.02.2025 20:09, Ryan.Wanner@microchip.com wrote:
>>> On 2/13/25 01:20, Claudiu Beznea wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hi, Ryan,
>>>>
>>>>
>>>> On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
>>>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>>
>>>>> New clocks are saved to enable ULP0 for SAMA7D65 because this SoC has a
>>>>> total of 10 main clocks that need to be saved for ULP0 mode.
>>>>
>>>> Isn't 9 the total number of MCKs that are handled in the last/first phase
>>>> of suspend/resume?
>>> Yes I was including 10 to match the indexing in the mck_count variable.
>>> Since bgt instruction was suggested I will correct this to reflect the
>>> true behavior of the change.
>>>>
>>>> Also, the state of MCKs are saved/restored for ULP0 and ULP1 as well.
>>>>
>>>>>
>>>>> Add mck_count member to at91_pm_data, this will be used to determine
>>>>> how many mcks need to be saved. In the mck_count member will also make
>>>>> sure that no unnecessary clock settings are written during
>>>>> mck_ps_restore.
>>>>>
>>>>> Add SHDWC to ULP0 mapping to clear the SHDWC status after exiting low
>>>>> power modes.
>>>>
>>>> Can you explain why this clear need to be done? The commit message should
>>>> answer to the "what?" and "why?" questions.
>>>>
>>>>>
>>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>>>> ---
>>>>>  arch/arm/mach-at91/pm.c              | 19 +++++-
>>>>>  arch/arm/mach-at91/pm.h              |  1 +
>>>>>  arch/arm/mach-at91/pm_data-offsets.c |  2 +
>>>>>  arch/arm/mach-at91/pm_suspend.S      | 97 ++++++++++++++++++++++++++--
>>>>>  4 files changed, 110 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
>>>>> index 55cab31ce1ecb..50bada544eede 100644
>>>>> --- a/arch/arm/mach-at91/pm.c
>>>>> +++ b/arch/arm/mach-at91/pm.c
>>>>> @@ -1337,6 +1337,7 @@ struct pmc_info {
>>>>>       unsigned long uhp_udp_mask;
>>>>>       unsigned long mckr;
>>>>>       unsigned long version;
>>>>> +     unsigned long mck_count;>  };
>>>>>
>>>>>  static const struct pmc_info pmc_infos[] __initconst = {
>>>>> @@ -1344,30 +1345,42 @@ static const struct pmc_info pmc_infos[] __initconst = {
>>>>>               .uhp_udp_mask = AT91RM9200_PMC_UHP | AT91RM9200_PMC_UDP,
>>>>>               .mckr = 0x30,
>>>>>               .version = AT91_PMC_V1,
>>>>> +             .mck_count = 1,
>>>>
>>>> As this member is used only for SAMA7 SoCs I would drop it here and above
>>>> (where initialized with 1).
>>>>
>>>>>       },
>>>>>
>>>>>       {
>>>>>               .uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
>>>>>               .mckr = 0x30,
>>>>>               .version = AT91_PMC_V1,
>>>>> +             .mck_count = 1,
>>>>>       },
>>>>>       {
>>>>>               .uhp_udp_mask = AT91SAM926x_PMC_UHP,
>>>>>               .mckr = 0x30,
>>>>>               .version = AT91_PMC_V1,
>>>>> +             .mck_count = 1,
>>>>>       },
>>>>>       {       .uhp_udp_mask = 0,
>>>>>               .mckr = 0x30,
>>>>>               .version = AT91_PMC_V1,
>>>>> +             .mck_count = 1,
>>>>>       },
>>>>>       {
>>>>>               .uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
>>>>>               .mckr = 0x28,
>>>>>               .version = AT91_PMC_V2,
>>>>> +             .mck_count = 1,
>>>>>       },
>>>>>       {
>>>>>               .mckr = 0x28,
>>>>>               .version = AT91_PMC_V2,
>>>>> +             .mck_count = 5,
>>>>
>>>> I'm not sure mck_count is a good name when used like proposed in this
>>>> patch. We know that only 4 MCKs need to be handled for SAMA7G5 and 9 for
>>>> SAMA7D65.
>>>>
>>>> Maybe, better change it here to 4 (.mck_count = 4) and to 9 above
>>>> (.mck_count = 9) and adjust properly the assembly macros (see below)? What
>>>> do you think?
>>>
>>> Yes I think this is better and cleaner to read. Should this mck_count
>>> match the pmc_mck_count variable name? Or should this be more
>>> descriptive or would mcks be sufficient.
>>
>> mck_count/mcks should be enough. These will be anyway in the context of
>> pmc_info.
>>
>>>>
>>>>> +     },
>>>>> +     {
>>>>> +             .uhp_udp_mask = AT91SAM926x_PMC_UHP,
>>>>> +             .mckr = 0x28,
>>>>> +             .version = AT91_PMC_V2,
>>>>> +             .mck_count = 10,
>>>>>       },
>>>>>
>>>>>  };
>>>>> @@ -1386,7 +1399,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
>>>>>       { .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
>>>>>       { .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
>>>>>       { .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
>>>>> -     { .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
>>>>> +     { .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[6] },
>>>>>       { .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
>>>>>       { /* sentinel */ },
>>>>>  };
>>>>> @@ -1457,6 +1470,7 @@ static void __init at91_pm_init(void (*pm_idle)(void))
>>>>>       soc_pm.data.uhp_udp_mask = pmc->uhp_udp_mask;
>>>>>       soc_pm.data.pmc_mckr_offset = pmc->mckr;
>>>>>       soc_pm.data.pmc_version = pmc->version;
>>>>> +     soc_pm.data.pmc_mck_count = pmc->mck_count;
>>>>>
>>>>>       if (pm_idle)
>>>>>               arm_pm_idle = pm_idle;
>>>>> @@ -1659,7 +1673,8 @@ void __init sama7_pm_init(void)
>>>>>               AT91_PM_STANDBY, AT91_PM_ULP0, AT91_PM_ULP1, AT91_PM_BACKUP,
>>>>>       };
>>>>>       static const u32 iomaps[] __initconst = {
>>>>> -             [AT91_PM_ULP0]          = AT91_PM_IOMAP(SFRBU),
>>>>> +             [AT91_PM_ULP0]          = AT91_PM_IOMAP(SFRBU) |
>>>>> +                                       AT91_PM_IOMAP(SHDWC),
>>>>
>>>> In theory, as the wakeup sources can also resumes the system from standby
>>>> (WFI), the shdwc should be mapped for standby, too. Unless I'm wrong and
>>>> the wakeup sources covered by the SHDWC_SR register don't apply to standby
>>>> (WFI).
>>> The device can wake up from an RTT or RTC alarm event on both the
>>> standby power mode and the ULP0 power mode, since the RTT/RTC are
>>> included in the SHDWC_SR I think it is safe to have this.
>>> If I understand what you are asking correctly.
>>
>> I was asking if the SHDWC should also be mapped for standby like:
> Ok I see. I have a better understanding now of wake up sources table
> like you showed below. I think for readability of code I should not have
> SHDWC set as ULP0 and STANDBY source because in at91_pm_config_ws()
> SHDWC is only configured as a wake up source in ULP1 power mode.
> 
> So removing SHDWC from the ULP0 wake up source would reflect more
> accurately what is configured as a wake up source in the code. What do
> you think?

Sounds good.

Thank you,
Claudiu


