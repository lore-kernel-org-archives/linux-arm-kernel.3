Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1443D277EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cR+G5T80P/4PxmcURhvOtZwvVr9pTtR/m1ae5uYMxT8=; b=0FqmfBk+sJLAKJ92Hm6ggWw+XD
	pSvGvyCaWqRbVL2kAFdUscpPnz2CmhTIzvBucYlkK4blunMvrUalpG+5KP1oAGm0gdHWLfHh1YpPb
	q/cNSiuKVrCEurMc7/NMXOE2M8Wvf+S+9+ryDwyGCZ/W7+t4WFLTfGR88WhJkONJnrm7BLknzxzAL
	vhtBHX497dk6QV9DUpkmdBTli6vPXyACi1Fv3IjOaVSDvhX3N6ePnKVM9OhMk7YQQCjt9Z0B0BeVn
	o72FdNyZ7gUd15nr1Wwhx+ftvRZqRFWzhzaCMJ5DI1uxBwpcAWER4zP5/qqAm+0zlB08E+HVr+aVX
	BE/xpdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veaZP-00000003Vk1-0fke;
	Sat, 10 Jan 2026 15:08:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veaZM-00000003Vje-3jgT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 15:08:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so53910935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 07:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057679; x=1768662479; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR+G5T80P/4PxmcURhvOtZwvVr9pTtR/m1ae5uYMxT8=;
        b=Bg9/3y+bEGWr3qBBTYF/Sp568xcEEAc7AuQvU5eTyVxRL1TNUW+PCj3/p+BuymM9Tb
         2qwYUe9KL99xe8CJ0l1623rBFP0IhB1PZqe47qdM/KU72rGm7MCcnA89ODExb1U2c24x
         Qtu5ljIAVNZYhCK+qMzU7wGoYcajJ2Pe4Cxme0Umdv4TZjPg69ZpWWsEZn5+RQ2jKM31
         o6qtc/iO6vym+ernNZMa0c6fDsmgW6b5o5OLY01H12HM7OBiUNQZn+ImFzJ4C9rYmS2i
         jAZnDWIf6LxNJycGePp4UZ9JGgk7BF8lBRQG7PUbrUBWKe+SOpgtsEn8kRfB3MfdDEdX
         vMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057679; x=1768662479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cR+G5T80P/4PxmcURhvOtZwvVr9pTtR/m1ae5uYMxT8=;
        b=MIJkfcX2KtGm6V2HiVSAjFifqdy37vuAaDdbcbW8JmNy+kmQYB2ahY2iF6Z9D84wCr
         ZGq/+1/wkkbFADUPCZvWKmAnf6u8z8kFh27+frcVYPW9MMPrypv3h+pBM8/DF2/0jTxV
         77SSJagLsNBgZ3jlq/jjANBzOtc/tGHq4FqesTsFREre7rHJjIgyl2uwAVsN4iYmFin1
         VIQ+CSQRWDiaNPtmoT7uYqcLLIs4w4Fuz7isDd4L2V75D98+1gxZzoJpRZma0j6OZkH1
         fUNUCWNETRuE7C8PoIVuvoh7W7u0VvEzTd0UGI2Oj9CjRXQ8xer/OQuvYzO0yOq8SDRG
         t1Og==
X-Forwarded-Encrypted: i=1; AJvYcCWWT83BnvBdQ+eAF07wuogaGDaoj9blPdnj/NCTzKQx1hFPfzpO5HiCcgroEbcMQQLoXWKHmq0eVRkpBn/N4SCi@lists.infradead.org
X-Gm-Message-State: AOJu0YwBM507qOWO43ElJoDgcfnr84o6JVAqAzxadrpmSPyCtm5RXKTi
	aD9gD/OsLvFbuNZGQ6v6EsNIpE59Gj0FOMfihtSgCgpw4OHHQhOOxrHIIiQarx+z/fk=
X-Gm-Gg: AY/fxX4IDuiWIrCI3KEYTBVkUuC/M36pnwT8a3vAau/6nEP3kARM4+YGCcObftklCAS
	p1kWIIp414c5X5DNDUX1ohIxPa5iZlDiR2+K2Zkskzt4jIlYMCyDr98e+GDgLL8JD7QMcVI/yxR
	/Qq2r4/VKKifLKxOHM3/yS8res+siREeaZYxmRrM12FP4qXl5Nf9u6hmnCShV47Z/fjHTSnd4V2
	FakNnu/PT8rn6S9hhasC2jUECBB+O/BmH2WyjMMsI8gIJ/Ui2ZAUZcNCeWdH53sQi9TaxKuR9a8
	kBkujrhn+o8yncHKVUWlPNmQm9SseS12ENYBR76gLY0sgCsbYH6/B2nmJwh5voLMh+zp43yQddT
	qVBbz4g9zUaXsGEZQ40A9nJGsEl0f4wI9WDEPPbYhVZxKQdlMc9Ya3Wa215WEik2EiJrt2PpBAL
	Gavw2RePn0tDXvgyT7BcC/8Ndkljqc
X-Google-Smtp-Source: AGHT+IEYVV6CVZiBIJH8fcJdAkX68YotvoK8xvZNjWkRE9J4wka7M63evPSE8cyIGECtjH50PiK0aw==
X-Received: by 2002:a05:600c:1d19:b0:47d:5089:a476 with SMTP id 5b1f17b1804b1-47d84b386fdmr173305105e9.31.1768057678732;
        Sat, 10 Jan 2026 07:07:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184cbsm274940855e9.6.2026.01.10.07.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:07:58 -0800 (PST)
Message-ID: <5b43e5de-f262-457a-b797-f545abb4ee17@tuxon.dev>
Date: Sat, 10 Jan 2026 17:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
 <eed15c43-dde3-410b-b2a3-655f4acf8d97@tuxon.dev>
 <0402804e-7575-42b2-9990-1b09fca80451@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <0402804e-7575-42b2-9990-1b09fca80451@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_070801_007788_9D0E3D82 
X-CRM114-Status: GOOD (  17.01  )
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



On 1/9/26 19:03, Ryan Wanner wrote:
> On 10/20/25 12:15, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>
>>> Switch old dt-compat clocks to use parent_hw and parent_data. Having
>>> parent_hw instead of parent names improves to clock registration
>>> speed and re-parenting.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>   drivers/clk/at91/dt-compat.c | 80 +++++++++++++++++++++++++-----------
>>>   1 file changed, 56 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
>>> index fa8658d3be7b..9ca871b817e0 100644
>>> --- a/drivers/clk/at91/dt-compat.c
>>> +++ b/drivers/clk/at91/dt-compat.c
>>> @@ -43,7 +43,8 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_audio_pll_frac(regmap, name, NULL,
>>> +                                           &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -69,7 +70,8 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_audio_pll_pad(regmap, name, NULL,
>>> +                                          &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -95,7 +97,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -129,6 +131,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>>        struct clk_hw *hw;
>>>        unsigned int num_parents;
>>>        const char *parent_names[GENERATED_SOURCE_MAX];
>>> +     struct clk_parent_data parent_data[GENERATED_SOURCE_MAX];
>>>        struct device_node *gcknp, *parent_np;
>>>        struct clk_range range = CLK_RANGE(0, 0);
>>>        struct regmap *regmap;
>>> @@ -149,6 +152,8 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> +     for (unsigned int i = 0; i < num_parents; i++)
>>> +             parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>>>        for_each_child_of_node(np, gcknp) {
>>>                int chg_pid = INT_MIN;
>>>
>>> @@ -171,7 +176,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>>>
>>>                hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>>>                                                 &dt_pcr_layout, name,
>>> -                                              parent_names, NULL, NULL,
>>> +                                              NULL, parent_data, NULL,
>>>                                                 num_parents, id, &range,
>>>                                                 chg_pid);
>>>                if (IS_ERR(hw))
>>> @@ -201,7 +206,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>>>
>>>        parent_name = of_clk_get_parent_name(np, 0);
>>>
>>> -     hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_h32mx(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -228,6 +233,8 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>>>                return;
>>>
>>>        for_each_child_of_node(np, i2s_mux_np) {
>>> +             struct clk_parent_data parent_data[2];
>>> +
>>>                if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
>>>                        continue;
>>>
>>> @@ -238,8 +245,10 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>>>                if (ret != 2)
>>>                        continue;
>>>
>>> +             parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
>>> +             parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>>>                hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
>>> -                                            parent_names, NULL, 2, bus_id);
>>> +                                            NULL, parent_data, 2, bus_id);
>>>                if (IS_ERR(hw))
>>>                        continue;
>>>
>>> @@ -269,7 +278,8 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> -     hw = at91_clk_register_main_osc(regmap, name, parent_name, NULL, bypass);
>>> +     hw = at91_clk_register_main_osc(regmap, name, NULL,
>>> +                                     &AT91_CLK_PD_NAME(parent_name), bypass);
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -323,7 +333,7 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> -     hw = at91_clk_register_rm9200_main(regmap, name, parent_name, NULL);
>>> +     hw = at91_clk_register_rm9200_main(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>>>        if (IS_ERR(hw))
>>>                return;
>>>
>>> @@ -336,6 +346,7 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>>>   {
>>>        struct clk_hw *hw;
>>>        const char *parent_names[2];
>>> +     struct clk_parent_data parent_data[2];
>>>        unsigned int num_parents;
>>>        const char *name = np->name;
>>>        struct regmap *regmap;
>>> @@ -354,7 +365,9 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>>>
>>>        of_property_read_string(np, "clock-output-names", &name);
>>>
>>> -     hw = at91_clk_register_sam9x5_main(regmap, name, parent_names, NULL,
>>> +     parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
>>> +     parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>>> +     hw = at91_clk_register_sam9x5_main(regmap, name, NULL, parent_data,
>>>                                           num_parents);
>>>        if (IS_ERR(hw))
>>>                return;
>>> @@ -396,6 +409,7 @@ of_at91_clk_master_setup(struct device_node *np,
>>>        struct clk_hw *hw;
>>>        unsigned int num_parents;
>>>        const char *parent_names[MASTER_SOURCE_MAX];
>>> +     struct clk_parent_data parent_data[MASTER_SOURCE_MAX];
>>>        const char *name = np->name;
>>>        struct clk_master_characteristics *characteristics;
>>>        struct regmap *regmap;
>>> @@ -419,13 +433,15 @@ of_at91_clk_master_setup(struct device_node *np,
>>>        if (IS_ERR(regmap))
>>>                return;
>>>
>>> +     for (unsigned int i = 0; i < MASTER_SOURCE_MAX; i++)
>>> +             parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>>>        hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
>>> -                                        parent_names, NULL, layout,
>>> +                                        NULL, parent_data, layout,
>>>                                           characteristics, &mck_lock);
>>>        if (IS_ERR(hw))
>>>                goto out_free_characteristics;
>>>
>>> -     hw = at91_clk_register_master_div(regmap, name, "masterck_pres", NULL,
>>> +     hw = at91_clk_register_master_div(regmap, name, NULL, &AT91_CLK_PD_HW(hw),
>>>                                          layout, characteristics,
>>>                                          &mck_lock, CLK_SET_RATE_GATE, 0);
>>
>> Looks like at91_clk_register_master_div() could be kept to use parent_hws
>> instead of parent_data.
> 
> Looking into this more the register_master_div calls
> at91_clk_register_master_internal() which is used for all of the SoCs.
> Some of the SoCs that use this function only have the parents passed in
> by name string and not clk_hw. Would it be wise to add another function
> for this to account for clk_hw and parent name? Or keep the use of
> parent_data?

Let's keep it as is for now.

Thank you,
Claudiu

