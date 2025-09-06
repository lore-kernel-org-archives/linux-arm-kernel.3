Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CBECA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYHy1RYaZz8qwqLoCLiBztSqW0ycyPrtnmbrVy9V3QA=; b=3wkeTHd9nhOfhejfgwIwlXu2MC
	kpUpQhL+CLGM0z7RGqCj59DzNQ5OkTdUUmmUcZU1KtgfN9t5fFddQ8oMdyH/65CgF+sdkJeVWZztH
	eMdeGBy4uYAkG+CfNG8GQWMe+NFFcgpFX/fEAZf3Zo0Nm/2Q0Y+JZmeLNuZpD2Hl0LS4n7zGer677
	PTO1rLe7Z+0138hIKoHYARspKIMasCEIYI72a9QdXeeso4j9e1vTFTc6RDTorFywkkUovjizA1cR/
	A2Rjx3zaXxSKhz1e6eV++CCOx6zlVLIi1WMmnWeRv7IiIKbfalqxkyDc/GbMaNI+yO/kSrJcH+wld
	dI7lXyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyXq-00000008MNZ-2inw;
	Sat, 06 Sep 2025 19:25:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuy19-00000008Ipa-2KNN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:52:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so15953805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184726; x=1757789526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYHy1RYaZz8qwqLoCLiBztSqW0ycyPrtnmbrVy9V3QA=;
        b=qbF/kRzvxK1p+LC67IQaVTQT2ha3s9bi+yLYUaoSxPK1ngLC7/2gRzF8UgtBjoYQbk
         COEfKPZ9gDyg2rhicUobQ7QpOg1noysqkxikST0tcw7FWW4zYBSchWmkjrpFHh0F6ZoT
         OGLVbn6nOImPgKBUaG+SRgSuDm24HCTdy2DEGSpqhcsFREmY9H0WyRP2oizEp8mmgXyr
         7QiKXJhuEuRL6bT0oPCFVesr13hhfD0EGFsxj4PUXX2yPAaiWMWPFeN0V+o3docHT4wt
         ZxMgbfavyl6Qh+JZiFQ3+12GOPTclK9SO9HixRPYN1O7AT9u12qktVQxhnCo6qmeA0ip
         uKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184726; x=1757789526;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYHy1RYaZz8qwqLoCLiBztSqW0ycyPrtnmbrVy9V3QA=;
        b=vrvbkoBvtqOBctvw2whZ3D3I8Ef1KN4iB9O6DGXkJHPoEeWyKif+Zt4s+Bknn37eSK
         Xl5pz9MICRCxOX9oeekUewPPWgNQ44EMOKHTBc3WzN7JdiGeiuZIZzoZNckBWxdl9PyX
         ze3zIG0ZJLHD9sadUt6t88pqNubIdu74hn43juGNFiwUdp79UK1fqFWnqECo8uCeqKg4
         04x4Bba4rb0mk6m2mTUM6NuzZPYVEfu2eOEs3n2lw2myTeSyeKz8uvvlWTnxk63zXQPu
         ZYpreZG+jB0ADEba8VOlX46vYcnpjjmIpMAmmH9tBk1X6yt+0QvRo5JZkI7FYh7aSGUy
         otNw==
X-Forwarded-Encrypted: i=1; AJvYcCU/UWAVCGN31480iQeFmkLV2pua+oXXjOUFME5m7sxuM3xAijZEHshBNKhPMBHMOrO9TlTnaGzsR3Q16KAl8RJO@lists.infradead.org
X-Gm-Message-State: AOJu0YzTbeZhJR3KL/zg6xDcHglYBkwRWWi5G1le59ndAyCpLnRDCTkO
	Jzbnlw6ijs6wVrFB4tNBVYroIjAq0Y1Py9hsf2ECJ/xU6xYNPcrVaItTJti+pDJ7jD4=
X-Gm-Gg: ASbGncu0lckEiFxoaxEccUa7jlM5+WjrVBHJqgme3OQD7ppKqbi95dQiUCaLxm6IAPE
	HMh5+LC7ScUzspIadI7W8WE6nmuuLUz+JWQ1SLRMmiu2X2T37oKFjrze0zIeVSmeqfwc372GZbS
	62dkakm+gR13hFniqjKMS1ZuRqx9Ggq1E7aidXANqSkOTlPQofNt/HPd/GepPcD0aP/+AoXlAqI
	0X5DE6l59FEL5qV1H+8BWDUZvIrfoB6pNxe2i312l6MdQxCOwTqNlylAZjRopcQvCf4Hi9ksMz7
	fDXLv89gckZuQVYBHyEGe8qj3YTBVKbnf/f9PUmo+lG3ZpczVZdLiev1+7B9vWIdK+AhqP1b1ED
	05vNUnRZgzJaO7wik3VqNP3d/Cn5xuskG8u6HoQfGWg==
X-Google-Smtp-Source: AGHT+IEpMP6ACL8oRBA8hTz9DJ0XgNVlGBZlDBNrI3mU0DI00pLaSesHNRCSOeWsnURabXbOB6R20Q==
X-Received: by 2002:a05:600c:8b5c:b0:45b:9b9f:88cb with SMTP id 5b1f17b1804b1-45dd5b78584mr60223555e9.16.1757184725986;
        Sat, 06 Sep 2025 11:52:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb687fe4esm150076175e9.23.2025.09.06.11.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:52:05 -0700 (PDT)
Message-ID: <41cf6626-ce6f-408f-bcbd-299866d70fe0@tuxon.dev>
Date: Sat, 6 Sep 2025 21:52:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/32] clk: at91: at91sam9x5: switch to parent_hw and
 parent_data
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <95cbe3653752bc3c0b6f068949706313e3778fe5.1752176711.git.Ryan.Wanner@microchip.com>
 <10f016fd-2ceb-40b0-a81d-9c5663f65191@tuxon.dev>
Content-Language: en-US
In-Reply-To: <10f016fd-2ceb-40b0-a81d-9c5663f65191@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_115207_614521_9A8C694C 
X-CRM114-Status: GOOD (  14.63  )
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



On 9/3/25 18:16, claudiu beznea wrote:
> 
> 
> On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Switch AT91SAM9X5 clocks to use parent_hw and parent_data. Having
>> parent_hw instead of parent names improves to clock registration
>> speed and re-parenting.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>   drivers/clk/at91/at91sam9x5.c | 125 ++++++++++++++++++----------------
>>   1 file changed, 65 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
>> index 13331e015dd7..f6138622ab50 100644
>> --- a/drivers/clk/at91/at91sam9x5.c
>> +++ b/drivers/clk/at91/at91sam9x5.c
>> @@ -38,9 +38,9 @@ static const struct clk_pll_characteristics
>> plla_characteristics = {
>>       .out = plla_out,
>>   };
>>   -static const struct {
>> +static struct {
>>       char *n;
>> -    char *p;
>> +    struct clk_hw *parent_hw;
>>       unsigned long flags;
>>       u8 id;
>>   } at91sam9x5_systemck[] = {
>> @@ -48,12 +48,12 @@ static const struct {
>>        * ddrck feeds DDR controller and is enabled by bootloader thus we
>> need
>>        * to keep it enabled in case there is no Linux consumer for it.
>>        */
>> -    { .n = "ddrck", .p = "masterck_div", .id = 2, .flags =
>> CLK_IS_CRITICAL },
>> -    { .n = "smdck", .p = "smdclk",   .id = 4 },
>> -    { .n = "uhpck", .p = "usbck",    .id = 6 },
>> -    { .n = "udpck", .p = "usbck",    .id = 7 },
>> -    { .n = "pck0",  .p = "prog0",    .id = 8 },
>> -    { .n = "pck1",  .p = "prog1",    .id = 9 },
>> +    { .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
>> +    { .n = "smdck", .id = 4 },
>> +    { .n = "uhpck", .id = 6 },
>> +    { .n = "udpck", .id = 7 },
>> +    { .n = "pck0",  .id = 8 },
>> +    { .n = "pck1",  .id = 9 },
>>   };
>>     static const struct clk_pcr_layout at91sam9x5_pcr_layout = {
>> @@ -133,25 +133,16 @@ static void __init at91sam9x5_pmc_setup(struct
>> device_node *np,
>>                       const struct pck *extra_pcks,
>>                       bool has_lcdck)
>>   {
>> +    const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
>> +    struct clk_hw *main_rc_hw, *main_osc_hw, *hw;
>> +    u8 slow_clk_index = 0, main_xtal_index = 0;
>>       struct clk_range range = CLK_RANGE(0, 0);
>> -    const char *slck_name, *mainxtal_name;
>> +    struct clk_parent_data parent_data[6];
>> +    struct clk_hw *smdck_hw, *usbck_hw;
>>       struct pmc_data *at91sam9x5_pmc;
>> -    const char *parent_names[6];
>>       struct regmap *regmap;
>> -    struct clk_hw *hw;
>> -    int i;
>>       bool bypass;
>> -
>> -    i = of_property_match_string(np, "clock-names", "slow_clk");
>> -    if (i < 0)
>> -        return;
>> -
>> -    slck_name = of_clk_get_parent_name(np, i);
>> -
>> -    i = of_property_match_string(np, "clock-names", "main_xtal");
>> -    if (i < 0)
>> -        return;
>> -    mainxtal_name = of_clk_get_parent_name(np, i);

Same here, and same for the rest of conversion patches.

