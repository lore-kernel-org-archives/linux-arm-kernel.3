Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79194C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkEMk9fl2FbbhV5Z8dp3ny2q0N8JUyHqiBkAQIKlOqk=; b=LgHQPHfp2xcVBoEvqUNgz998mJ
	k08tK8U/o/fbYGWUlBS5fLb29udyV4nDfFhLyc5HcoBl1TTZgTgQe4ahgH04wePMhHff6uTkbUJjW
	g8fcHFk/Jm9jKlgo7CXa86gPqkUUm87nwDV/BpKvxcDd4kowUw8YMb/SmhYYlV3rmQlrFnQ8UeU/9
	ia7MgUWBh4C0Ag3gpgp6dJI5PKD3oOTtWo6I48O7dacoFsZgJcR04KxvyoqCo4Ut4IIWdlaeWol6b
	9Ht6sxspZYm7TK8TBytGLSkzefTH6mrGaAqulKT6G/+PnV0asnmWmusMroJTFA/zMh34q4W44vkAz
	oGEHkRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmpm-00000002hoZ-33dG;
	Mon, 07 Jul 2025 14:28:42 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYln6-00000002XdJ-3inp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:21:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so647900666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751894511; x=1752499311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkEMk9fl2FbbhV5Z8dp3ny2q0N8JUyHqiBkAQIKlOqk=;
        b=qIVKJdzcJGvZ5v5MS7jjzecvGyj3yhQco7xLTJPt8dQPdnUwpOkKkYp/3VuisgDA15
         8euqH6pZ29KB+fePelBuuy0HX7u6ZelzsDszV8wmiU9WdisVwmkZGw3YI97hXoQMdrdr
         YYeQuOANqsExNNdhFPnXeTu7l1zXfDwBbEjVz9B1hFMj/4LDEosk36vsNCfTw9Z3eSfX
         Sas4FcgVZkC8BzWgTLSeCn0xRaYtRR6YqeotAIMoSyvGavq1wgjOwbOaHAlbZjGTSCy9
         PbjoeTU/apP9F0ZUstxjzW2YGl9/e++Rp937qC8l5JgzK43K4HAtM/wcUhhJVIbMczg6
         mF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751894511; x=1752499311;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkEMk9fl2FbbhV5Z8dp3ny2q0N8JUyHqiBkAQIKlOqk=;
        b=a5cqAod+UuTWYp0lz1Z26Ywcr/NkhY8ufwEI6PkddDbWnRueqXz4396dH6H6MQqzV4
         ayg+pBAy1CHYfX8nGfBLZRXgrE+bJ4CFb66CNnbGh+vpZS3/Tq5ZyUGJonBUY9UhyUGR
         8Rw5pWChlZC/grUyyXOBWs3B01wlXHfJHLnBLpcmr7+HFlp/xuSCH0hMHPNSZMUdsBC4
         U/PUBKIvjy300iqsunUfjWKo2FQciep3W3YJDNSeOHcqUBHVjcUQjJf4zdt28ZR9lV2z
         DwEjJXfuvVB3l4OYhnNihoGT7yq+S9phBeC5sE1WwzIPS0SLd5s1w0ud8jjxO+xp88uI
         Xetw==
X-Forwarded-Encrypted: i=1; AJvYcCVVN0RxbtDwi5pKwniy3pPur2rQlE91EFTJq7/wRvKNqEEWACyEPTzGzW0pd4+DmeNIzQhSyMohVm6baiEvSym7@lists.infradead.org
X-Gm-Message-State: AOJu0YwxIv6VUNsaN37ZbLpyEDsLg3X1hJeo5uzzlj7KBRIqwEbDPV3I
	ZGNVd7fJ+UVRkyKw1RxX/iHjdQgu5x43sN9Kgt8cgR2WmDUn4eSf6yKGG0/PTSc2sIPSBaBPDkx
	VBv66
X-Gm-Gg: ASbGncuxjMV6i+BJ8FHReXzK+dQCVhdzKuiq4ggsgOe3JsrkWjSxalRnuca92og3byw
	sDRYXPugK7hbJgIdORnJE6+EC7ICo1am2c+L3MqW9MS6nVADHyRlUH3MglyAB3cxHw7FXGE9EC9
	HSS4HOUeRpOUoV3hK0xQ8WHV+Pi9lCaSe/3D2haYB++AU8d1Nr6IHxvyQTiKBNFl1o+P+iHXV+t
	7S3MbFFsWzatjS3J89LLUTpnOjweikomTM9WIjRqZb4/yHeam427cTOzjSNlW4qe7E3S2bs+WpV
	8waDWxHztoS3lPmAzKlGQvp4Z9GqlniBKJaRkmaQWttcTXsyi1YGCERD0fEkT1j70M2sZA==
X-Google-Smtp-Source: AGHT+IGcdZQfPgn5MuhON9DBnwRAtFsVOqxSQZvAw3EiH4TCI/7Sug8OhdzEELKOQaDG3PMIqGTs7w==
X-Received: by 2002:a17:907:d1a:b0:ae0:daca:f06f with SMTP id a640c23a62f3a-ae410a95654mr691032666b.60.1751894511032;
        Mon, 07 Jul 2025 06:21:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d91c2sm694961966b.28.2025.07.07.06.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 06:21:49 -0700 (PDT)
Message-ID: <486d447b-9984-4044-a620-1d73ffd54111@tuxon.dev>
Date: Mon, 7 Jul 2025 16:21:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: robh@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 varshini.rajendran@microchip.com
References: <cover.1750182562.git.Ryan.Wanner@microchip.com>
 <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cc085ca99d75fe59c13acd74782d8437bbc1d65d.1750182562.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_062152_935010_AFFEA9FD 
X-CRM114-Status: GOOD (  23.56  )
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

On 24.06.2025 18:08, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. As clk-sam9x60-pll need to know
> parent's rate at initialization we pass it now from SoC specific drivers.
> This will lead in the end at removing __clk_get_hw() in SoC specific
> drivers (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Remove SoC specific driver changes, those
> will be added in subsequent commits.]

With this, series is not bisectable.

Also, building this patch throws:

../drivers/clk/at91/sama7g5.c: In function ‘sama7g5_pmc_setup’:
../drivers/clk/at91/sama7g5.c:1054:12: warning: passing argument 5 of
‘sam9x60_clk_register_frac_pll’ makes integer from pointer without a cast
[-Wint-conversion]
 1054 |      NULL, parent_hw, i,
      |            ^~~~~~~~~
      |            |
      |            struct clk_hw *
In file included from ../drivers/clk/at91/sama7g5.c:17:
../drivers/clk/at91/pmc.h:260:24: note: expected ‘long unsigned int’ but
argument is of type ‘struct clk_hw *’
  260 |          unsigned long parent_rate, u8 id,
      |          ~~~~~~~~~~~~~~^~~~~~~~~~~
../drivers/clk/at91/sama7d65.c: In function ‘sama7d65_pmc_setup’:
../drivers/clk/at91/sama7d65.c:1175:12: warning: passing argument 5 of
‘sam9x60_clk_register_frac_pll’ makes integer from pointer without a cast
[-Wint-conversion]
 1175 |      NULL, parent_hw, i,
      |            ^~~~~~~~~
      |            |
      |            struct clk_hw *
In file included from ../drivers/clk/at91/sama7d65.c:16:
../drivers/clk/at91/pmc.h:260:24: note: expected ‘long unsigned int’ but
argument is of type ‘struct clk_hw *’
  260 |          unsigned long parent_rate, u8 id,
      |          ~~~~~~~~~~~~~~^~~~~~~~~~~
  AR      drivers/clk/at91/built-in.a


Same for the rest of patches in this series following the "Remove SoC
specific driver changes" approach.

> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>  drivers/clk/at91/pmc.h             |  5 +++--
>  2 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index cefd9948e103..03a7d00dcc6d 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags)
>  {
>  	struct sam9x60_frac *frac;
>  	struct clk_hw *hw;
>  	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>  	unsigned int val;
>  	int ret;
>  
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>  		return ERR_PTR(-EINVAL);
>  
>  	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		return ERR_PTR(-ENOMEM);
>  
>  	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>  	init.num_parents = 1;
>  	if (flags & CLK_SET_RATE_GATE)
>  		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		 * its rate leading to enabling this PLL with unsupported
>  		 * rate. This will lead to PLL not being locked at all.
>  		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>  		if (!parent_rate) {
>  			hw = ERR_PTR(-EINVAL);
>  			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 63d4c425bed5..b43f6652417f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags);
>  


