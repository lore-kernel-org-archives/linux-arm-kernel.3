Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74600CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkyPx7hvenwwKOYWFdLzbbOA8b6X1wKKeSXRsPSnnBw=; b=RinkowpcK3KVIPhIkZRKYeUdjx
	3XIYYBLUlwh5B1fVFkMkmJ9hgx6p6v3HvgVsSmwl2kJUWMjQ7OX63M4jOfDmi6mfHp6/5ftsMYsmh
	w1wzmXGt8h/8XtmvrFMdNjlgurwJPoEG0W5b/mtXALYLggiN76O3Bj0GU2/gIZxU+dbIL7UzKche+
	PA8xB3tHgtcNIGlnIeCfyh8NQA1EtT56C5VgS5FeAErxxpdbPXBx0USD6eZ7SJx/Jxz4+hHv+yVVF
	0RUHshB8qH7psN6BcKsqi6K8l01ewE/Ohv6elARg0dp+GfpeNa6OA+TY2Zj5fsJLvYq0ACXNXRgxG
	vik8YicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v696A-00000002DkR-047Q;
	Tue, 07 Oct 2025 14:55:30 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6967-00000002Dk5-3tam
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:55:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-77f5d497692so7003277b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848927; x=1760453727; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HkyPx7hvenwwKOYWFdLzbbOA8b6X1wKKeSXRsPSnnBw=;
        b=Lc6+IB5FNOmuB+f41ovMdJe2RC06ILqCvq6z2Vc2yksXwKWmVpkn/hEkGabAsFNOn+
         H6x1UxhGLCTsz9x8qXRtyeCVZNLbhKSWWgQGOjJUDnjgr6s/aTBsf6r6cEzS9urZpj92
         BhIq2ZB/AeZJublnY/yHP0d1aiCdqP7UtFjYM9ZZWM0XpPhS7FrK2I4Hwbd9LvaWLr+t
         7A0O2cVs5pKmJ0l1muAYPyNqROHlUrKXmj5Z47a7hkPXRbXDfLQ2KDXT+WVyQCWI6DH+
         mKCztAGDrpGf3CXUfHCLopNCRfOUzKnrP7j1y22wYzloRgfJVY2IAhvwuFIIsZJNRT/y
         1C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848927; x=1760453727;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkyPx7hvenwwKOYWFdLzbbOA8b6X1wKKeSXRsPSnnBw=;
        b=JfTWmOjGnp4cN7RtiFpoYjM0YV02KcaZr3LhqyiZOe4SooHEvSyfMMs4efdBjsmz9v
         b5QT6i/4YQWVpAF35oOeI8Sa4Eg70/QsBqpVBsB1GtW23R+JMpMtX7kZHdy6BZ8pzxYi
         3CHEoklcofdmO2bGc0VnUgYz9/zX4VRo5A+YOF7bNJ8QnBInYyQMuyW/oJiS8DQghUQz
         txulTmL1dUcegrA8Ml7WkmKSfdyap9MXqUj3e+60IWeaWqsGp13lhgU7hyUTSouRiPrN
         CZb8hAYuNgG3SU58psmS3gBA5Mup2+e0t0oNdnnl/wdWg0bcbJwvrY/b+aKjnGF6keqO
         sFcg==
X-Forwarded-Encrypted: i=1; AJvYcCXWdXOtEd+aoSgtQK2E1avIOsctfeEwMTfl5bW6zhwG0yLeBS6p4FBjdTXOT2Zy93p+1QP4NOExEauZZfGs4vbc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+5Or4ty+w53mWPpdnG2lKYj1UL1AgZrMTerftZ15z5PAXzANU
	T1ahNg+wbiCoONVYh6DW35guM3q7oy8kepSaVDMEMYWx42KjjphYBIi8
X-Gm-Gg: ASbGncsnPtf9y8X3Gev+zZ2R3+dfFKGUex7I2fscxjYn1FAzmjPMWaXf6tNf5lR8AJy
	cqLur5ABrtGgj0E6qGnr8entocDWDyK1gsQ1PHM0op7N6jEI6/PrYjna3oiBgJkEIMBSeVd8FWr
	1YkABe+X7kvzv0nOGnmjRocC2EgnQDrL2sWlgLoroDz/BCbeBMJvj781beg7csd38kFWVt1BeMj
	RVRn3OoKcd6XHepIrpFCAexaz1eip8mQPYCQKHhMYgczk5YEdGXR8aAI5k4wu7GaOtySo2kd05a
	+5xtLyMPcqFbjbga/zEPlw4Y6qe0mexsVlUVaczxOSjA2CL1sPF2+MhoImHAQ0zVs3ikLy4Qgfp
	9eFNr2KHiN5ZTYt+VIq1tMHf+pfXI39A40dcH/G+GIE+SjQHAF4518xzB9jfIvabDzRYtDhXmtj
	NaBtOEcmKrUW2l7BLHjFw=
X-Google-Smtp-Source: AGHT+IGdyeoXpxl1XmF0tLtlO/xz3iQ1BZuV8N6S1k1HOqZoXjG87A15BN5CloCPSK/tUguPJ8dO2w==
X-Received: by 2002:a05:6a00:14d3:b0:783:cb49:c67b with SMTP id d2e1a72fcca58-78c98cf84d3mr22847057b3a.32.1759848926898;
        Tue, 07 Oct 2025 07:55:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02074663sm16035781b3a.74.2025.10.07.07.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:55:26 -0700 (PDT)
Message-ID: <83a90651-0b46-4c68-ab90-361422192e90@roeck-us.net>
Date: Tue, 7 Oct 2025 07:55:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] watchdog: aspeed: Support variable number of reset
 mask registers
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
 <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_075527_979884_6456DAB6 
X-CRM114-Status: GOOD (  24.57  )
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

On 10/7/25 01:36, Chin-Ting Kuo wrote:
> Starting from the AST2600 platform, the SoC design has become more
> complex, with an increased number of reset mask registers.
> To support this, introduce a new field 'num_reset_masks' in the
> 'aspeed_wdt_config' structure to specify the number of reset mask
> registers per platform. This change removes the need for hardcoded
> platform-specific logic and improves scalability for future SoCs.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/watchdog/aspeed_wdt.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 837e15701c0e..e15f70c5e416 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -35,6 +35,7 @@ struct aspeed_wdt_config {
>   	u32 irq_shift;
>   	u32 irq_mask;
>   	struct aspeed_wdt_scu scu;
> +	u32 num_reset_masks;
>   };
>   
>   struct aspeed_wdt {
> @@ -54,6 +55,7 @@ static const struct aspeed_wdt_config ast2400_config = {
>   		.wdt_reset_mask = 0x1,
>   		.wdt_reset_mask_shift = 1,
>   	},
> +	.num_reset_masks = 1,

Looking at this again: Why set it on ast2400 ?

>   };
>   
>   static const struct aspeed_wdt_config ast2500_config = {
> @@ -66,6 +68,7 @@ static const struct aspeed_wdt_config ast2500_config = {
>   		.wdt_reset_mask = 0x1,
>   		.wdt_reset_mask_shift = 2,
>   	},
> +	.num_reset_masks = 1,
>   };
>   
>   static const struct aspeed_wdt_config ast2600_config = {
> @@ -78,6 +81,7 @@ static const struct aspeed_wdt_config ast2600_config = {
>   		.wdt_reset_mask = 0xf,
>   		.wdt_reset_mask_shift = 16,
>   	},
> +	.num_reset_masks = 2,
>   };
>   
>   static const struct of_device_id aspeed_wdt_of_table[] = {
> @@ -482,8 +486,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
>   		(of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {

... because the code here only evaluates it if this is an ast2500 or ast2600.

If num_reset_masks would be set to 0 for ast2400, the value could be used here.

	if (wdt->cfg->num_reset_masks) {
		...
	}

and it would not be necessary to add of_device_is_compatible() for new chips.

Guenter

>   		u32 reset_mask[2];
> -		size_t nrstmask = of_device_is_compatible(np, "aspeed,ast2600-wdt") ? 2 : 1;
> +		size_t nrstmask = wdt->cfg->num_reset_masks;
>   		u32 reg = readl(wdt->base + WDT_RESET_WIDTH);
> +		int i;
>   
>   		reg &= wdt->cfg->ext_pulse_width_mask;
>   		if (of_property_read_bool(np, "aspeed,ext-active-high"))
> @@ -503,9 +508,8 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   
>   		ret = of_property_read_u32_array(np, "aspeed,reset-mask", reset_mask, nrstmask);
>   		if (!ret) {
> -			writel(reset_mask[0], wdt->base + WDT_RESET_MASK1);
> -			if (nrstmask > 1)
> -				writel(reset_mask[1], wdt->base + WDT_RESET_MASK2);
> +			for (i = 0; i < nrstmask; i++)
> +				writel(reset_mask[i], wdt->base + WDT_RESET_MASK1 + i * 4);
>   		}
>   	}
>   


