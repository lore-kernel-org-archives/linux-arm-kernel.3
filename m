Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B08CC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNYYBmyXTjR4+ggCtJ9e7HAdw2ayxdhkgyeanyGi+WI=; b=E9f+AY2A+8BEvB2fSzUl3v3dVK
	yQw9FInge18ku8q/+SvFrm065HDwKJucSorv71WUydpQqm2cZbbf4twJr1r+RLOigzZbLz0UnKSwL
	PuJKRONi8KTIOVBdiqkVqRtxz3/vteNzuVTzUNxqRHCCW7ahtXUXuXcJ384eC13aonfBs7SW8GXpU
	UnHG1YbpOEeYDvxUtdf+I/M342JWvonZfa5DvO+pioW0EQSXXBBDZfomjHU7oDQDi7KJOlFrQde+a
	vWhX/b6wEZeqz44bW9vlRj/nJNr4JQwy7t6WoQJJK0uPoV+RWzzhg0AMzU/qe5EayIG6YpZERGhJO
	EjpxO2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnq3-00000002sET-0nru;
	Mon, 07 Jul 2025 15:33:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnie-00000002qpO-3pqV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1751901924; x=1783437924;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=juWOZsgNPV5fS9ldL5u2tLkhsDJJKTTWAxca9hm39Ys=;
  b=c8G4aDKiUS+eQGVpELOtSPpniZpVp32LoWohJd4PNAWKApry44+bnWv2
   MmtDBBndTPqncgDS4Pn2aFAujIJnQnxxcralV8FzhMKSxvEnAqSheOx48
   GiR2sgKGCy84EQUU8NtECOGMajgDkGCJvF5Dz21CF0zajuZXA9K1naA5U
   yUoB9aUbqro18ievvvZ4VcG0LYsIRzVhRrodCT+o8DAbnT9Kn6fkU6r3A
   xfxPRdKo1lrvU7OpsBbk+EeVKq+ZTyMFeLzdDlghGKveCkARSa77jBsOQ
   bYr7dPojPNplOEaOk9I+04kP7jnljg7HHO1mrUX1RtgWHNcdwMHl0QNPa
   A==;
X-CSE-ConnectionGUID: ter5V2FMQaSxLNPqQc2Evw==
X-CSE-MsgGUID: 4UssQHcNQUKVKnb/MD2MbQ==
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="44281645"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jul 2025 08:25:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 7 Jul 2025 08:25:00 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 7 Jul 2025 08:25:00 -0700
Message-ID: <784f30a8-e524-41fb-8b14-99483116e657@microchip.com>
Date: Mon, 7 Jul 2025 08:24:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <robh@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<varshini.rajendran@microchip.com>
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
 <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
 <486d447b-9984-4044-a620-1d73ffd54111@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <486d447b-9984-4044-a620-1d73ffd54111@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_082525_233516_A5948412 
X-CRM114-Status: GOOD (  23.47  )
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

On 7/7/25 06:21, Claudiu Beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi, Ryan,
> 
> On 24.06.2025 18:08, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Use struct clk_parent_data instead of struct parent_hw as this leads
>> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
>> conversion of existing SoC specific clock drivers from parent_names to
>> modern clk_parent_data structures. As clk-sam9x60-pll need to know
>> parent's rate at initialization we pass it now from SoC specific drivers.
>> This will lead in the end at removing __clk_get_hw() in SoC specific
>> drivers (that will be solved by subsequent commits).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> [ryan.wanner@microchip.com: Remove SoC specific driver changes, those
>> will be added in subsequent commits.]
> 
> With this, series is not bisectable.
> 
> Also, building this patch throws:
> 
> ../drivers/clk/at91/sama7g5.c: In function ‘sama7g5_pmc_setup’:
> ../drivers/clk/at91/sama7g5.c:1054:12: warning: passing argument 5 of
> ‘sam9x60_clk_register_frac_pll’ makes integer from pointer without a cast
> [-Wint-conversion]
>  1054 |      NULL, parent_hw, i,
>       |            ^~~~~~~~~
>       |            |
>       |            struct clk_hw *
> In file included from ../drivers/clk/at91/sama7g5.c:17:
> ../drivers/clk/at91/pmc.h:260:24: note: expected ‘long unsigned int’ but
> argument is of type ‘struct clk_hw *’
>   260 |          unsigned long parent_rate, u8 id,
>       |          ~~~~~~~~~~~~~~^~~~~~~~~~~
> ../drivers/clk/at91/sama7d65.c: In function ‘sama7d65_pmc_setup’:
> ../drivers/clk/at91/sama7d65.c:1175:12: warning: passing argument 5 of
> ‘sam9x60_clk_register_frac_pll’ makes integer from pointer without a cast
> [-Wint-conversion]
>  1175 |      NULL, parent_hw, i,
>       |            ^~~~~~~~~
>       |            |
>       |            struct clk_hw *
> In file included from ../drivers/clk/at91/sama7d65.c:16:
> ../drivers/clk/at91/pmc.h:260:24: note: expected ‘long unsigned int’ but
> argument is of type ‘struct clk_hw *’
>   260 |          unsigned long parent_rate, u8 id,
>       |          ~~~~~~~~~~~~~~^~~~~~~~~~~
>   AR      drivers/clk/at91/built-in.a
> 
> 
> Same for the rest of patches in this series following the "Remove SoC
> specific driver changes" approach.

Would the best approach be to make every patch atomic and change every
SoC to match each clock function change or put back in the sama7g54
clock driver changes that where combined?

> 
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>  drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>>  drivers/clk/at91/pmc.h             |  5 +++--
>>  2 files changed, 8 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
>> index cefd9948e103..03a7d00dcc6d 100644
>> --- a/drivers/clk/at91/clk-sam9x60-pll.c
>> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
>> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>>
>>  struct clk_hw * __init
>>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>> -                           const char *name, const char *parent_name,
>> -                           struct clk_hw *parent_hw, u8 id,
>> +                           const char *name, const struct clk_parent_data *parent_data,
>> +                           unsigned long parent_rate, u8 id,
>>                             const struct clk_pll_characteristics *characteristics,
>>                             const struct clk_pll_layout *layout, u32 flags)
>>  {
>>       struct sam9x60_frac *frac;
>>       struct clk_hw *hw;
>>       struct clk_init_data init = {};
>> -     unsigned long parent_rate, irqflags;
>> +     unsigned long irqflags;
>>       unsigned int val;
>>       int ret;
>>
>> -     if (id > PLL_MAX_ID || !lock || !parent_hw)
>> +     if (id > PLL_MAX_ID || !lock || !parent_data)
>>               return ERR_PTR(-EINVAL);
>>
>>       frac = kzalloc(sizeof(*frac), GFP_KERNEL);
>> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>>               return ERR_PTR(-ENOMEM);
>>
>>       init.name = name;
>> -     if (parent_name)
>> -             init.parent_names = &parent_name;
>> -     else
>> -             init.parent_hws = (const struct clk_hw **)&parent_hw;
>> +     init.parent_data = (const struct clk_parent_data *)parent_data;
>>       init.num_parents = 1;
>>       if (flags & CLK_SET_RATE_GATE)
>>               init.ops = &sam9x60_frac_pll_ops;
>> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>>                * its rate leading to enabling this PLL with unsupported
>>                * rate. This will lead to PLL not being locked at all.
>>                */
>> -             parent_rate = clk_hw_get_rate(parent_hw);
>>               if (!parent_rate) {
>>                       hw = ERR_PTR(-EINVAL);
>>                       goto free;
>> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
>> index 63d4c425bed5..b43f6652417f 100644
>> --- a/drivers/clk/at91/pmc.h
>> +++ b/drivers/clk/at91/pmc.h
>> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>>
>>  struct clk_hw * __init
>>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>> -                           const char *name, const char *parent_name,
>> -                           struct clk_hw *parent_hw, u8 id,
>> +                           const char *name,
>> +                           const struct clk_parent_data *parent_data,
>> +                           unsigned long parent_rate, u8 id,
>>                             const struct clk_pll_characteristics *characteristics,
>>                             const struct clk_pll_layout *layout, u32 flags);
>>
> 


