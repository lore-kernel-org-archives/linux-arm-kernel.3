Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+uFkVa2u5HB8Xqrap3smBvxLAVYpo23297fy2cjAVs=; b=gEgbH9IhJdc1dOjL4nGGT7HbKt
	SY4Ac4ZHymQSuWifvqHR4CkblVYYRAzjo3J7NGUm4XWIEYaJsRBXKD9l1wSIJe0Mn6dod6ajIRTN2
	/U2nxqNGHnvw9wPdFgNOm0HTYAKnvVeAz52qMgOVRf9N42fRqYl+y/cJA2r/OhgDOOmKkUGWS3Yuq
	5dTRNc3Ws64GsiEip2jY904yh9OGuzHgtUWTO235YczlS+2KIT4KB3E0GZEQycV9b/jVxAQLMZbUq
	KoHvcOsCZhWgiojQxotU6MTiFxGRFSTTPUadpBBx0TVMy+c9BO042ksyX6wLLAml1/qc9QcQ/M1AL
	1d5Vgbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvQ9-0000000Em6N-3mm9;
	Mon, 20 Oct 2025 19:19:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvQ7-0000000Em5s-0yZi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:19:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47118259fd8so28070275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987989; x=1761592789; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+uFkVa2u5HB8Xqrap3smBvxLAVYpo23297fy2cjAVs=;
        b=MNm+3SMZ6kPIVeByG7tZTbWGSVIjWAAw+c/zpN0rxNB1L1cxJIV1/jWY+XhnBJwIKq
         vA3xQQ3KwgKp5qatet1+mN1SJupELDcpmXKBZZQFT4zlR6Q/PTeeTvntr02hpnAHw2PD
         XnBD0XLoGg9QkWJkDvuYnh2e2AV7nz3D9dPU5MDF601Gy4HojHhMXqZexQL/o5Pf5y2r
         CEKKlOQHtWs5xOmDpWR6nsPPrxZMNgrNr2mcBlCgaqGNSMoB4/estbWeWzG89TjKNtod
         Vh0E881fciZdTyFNq0JCXHtBbsVe9VmZwVzid3uY7haCqYNqNL4Jmzq0DU+1QOqET5UQ
         Q2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987989; x=1761592789;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l+uFkVa2u5HB8Xqrap3smBvxLAVYpo23297fy2cjAVs=;
        b=V/do8FMIKDA04+35FoisfzsFznlaDxCr6znQT6+aMLoSpSYyWgGLLD6hRo45eHnaGX
         ZeSW2vR6XM3HPyJnp4lKy54qu7XWVTIfbuha6vJgKNC01gphtuRAKeFOiii567CGJw5d
         H3QGlqLzqMpaz37ExDJifmqZsNrU7y1fsaZ5aJFcCLvJtAJLCEQiBQ2FrhM8ZfrLYZ12
         5pdU/uRDMmyRkerwRGOCwxeEZ2p3lvADbi+wJkWPl1XP+/R95+CPkM9tFU10PqC08OKE
         P8XofNvaqG4VpD/CCzkq3Ef79ZYp9tIPL0aHcanb+T2Pcjlx6w9RdsK2KFBUPQVSIyan
         wDmg==
X-Forwarded-Encrypted: i=1; AJvYcCUQaQA5Qmj3rKw8ViIsXRaD5/w3cIvrJsZI4nYu2CIjWJmM+k5g+uUX5moZw4O/Eq7GWTdpVe7YG/1Ulxkh+/7A@lists.infradead.org
X-Gm-Message-State: AOJu0YyACducDTW9P/ufuMbJR4+auylo+A3f7bopnrMXKtpBgM3NaB/2
	5aiHTF74Dcgyd97DhyNy/ICwNEvTifruOrohDhGzJdJ6y356XwEt+0g61VhTDHKiA/8=
X-Gm-Gg: ASbGncsURSyau1XUi5jlJHMqBy+ELvNnwam/ZrSGicdAt+yD/iKyv+lylUxm1lbs8Ph
	2zXshsRHhniQUInN8aR4So3MTNgvNbvJ5jfVKqCfHcD9oRu/4BqDva9a0TrQ0gwFtEu2PG2BHBL
	GfeFjZ7G/B+/dNmBckVQa0LQsc3Q4c2H6aqs+RBA3wVInbr9peOBfTm9Auzu0DaWVPPmfVteHPd
	UQbZtVzEwIFdWw/Oi3JLiNIPZLOVsQjI1ccFjtcHQE2TsfvUhU4twgWN/bYKXKQqo97/nNoK5+n
	9pRpJY30bYpBk/dGQwQ6TyXvUjClXlTcGqFbg0WS1McLV8XW6MeM548myJBeYh5+r9AdrrIHTSX
	l4P9/4U6n/aZ0O7iFZyBNL06F4kVq51+aZKrSeaAjMc/77u2doIXlZwFuQPfBXumrjM9Qs6PWRW
	qSihv2eUz8
X-Google-Smtp-Source: AGHT+IGyDLbOrAVFyVlclFlduDeAPiKLL+XPFcf6nUCR2OVZ1JSE5xowDpETyC6TnlDfw1Og0gsFRg==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr94185105e9.14.1760987989393;
        Mon, 20 Oct 2025 12:19:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c34sm258496125e9.10.2025.10.20.12.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:19:48 -0700 (PDT)
Message-ID: <a007a272-03e3-40fd-871a-aa315f99697c@tuxon.dev>
Date: Mon, 20 Oct 2025 22:19:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 26/31] clk: at91: at91sam9x5: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <015b98fa475f97ae8e952343ee9703c9c0d37d19.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <015b98fa475f97ae8e952343ee9703c9c0d37d19.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121951_313202_B67A60D2 
X-CRM114-Status: GOOD (  19.69  )
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

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9X5 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/at91sam9x5.c | 108 +++++++++++++++++++---------------
>  1 file changed, 61 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
> index 13331e015dd7..46d5ea2e6417 100644
> --- a/drivers/clk/at91/at91sam9x5.c
> +++ b/drivers/clk/at91/at91sam9x5.c
> @@ -38,9 +38,9 @@ static const struct clk_pll_characteristics plla_characteristics = {
>  	.out = plla_out,
>  };
>  
> -static const struct {
> +static struct {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	unsigned long flags;
>  	u8 id;
>  } at91sam9x5_systemck[] = {
> @@ -48,12 +48,12 @@ static const struct {
>  	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>  	 * to keep it enabled in case there is no Linux consumer for it.
>  	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "smdck", .p = "smdclk",   .id = 4 },
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "smdck", .id = 4 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
>  };
>  
>  static const struct clk_pcr_layout at91sam9x5_pcr_layout = {
> @@ -133,12 +133,13 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
>  					const struct pck *extra_pcks,
>  					bool has_lcdck)
>  {
> +	struct clk_hw *main_rc_hw, *main_osc_hw, *hw;
>  	struct clk_range range = CLK_RANGE(0, 0);
>  	const char *slck_name, *mainxtal_name;
>  	struct pmc_data *at91sam9x5_pmc;
> -	const char *parent_names[6];
> +	struct clk_parent_data parent_data[6];
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *smdck_hw, *usbck_hw;
>  	int i;
>  	bool bypass;
>  
> @@ -162,56 +163,58 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
>  	if (!at91sam9x5_pmc)
>  		return;
>  
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>  		goto err_free;
>  
>  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
> -					bypass);
> -	if (IS_ERR(hw))
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(mainxtal_name), bypass);
> +	if (IS_ERR(main_osc_hw))
>  		goto err_free;
>  
> -	parent_names[0] = "main_rc_osc";
> -	parent_names[1] = "main_osc";
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	at91sam9x5_pmc->chws[PMC_MAIN] = hw;
>  
> -	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
> +	hw = at91_clk_register_pll(regmap, "pllack", NULL,
> +				   &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]), 0,
>  				   &at91rm9200_pll_layout, &plla_characteristics);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
> +	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	at91sam9x5_pmc->chws[PMC_PLLACK] = hw;
>  
> -	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
> +	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL,
> +				    &AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
>  	at91sam9x5_pmc->chws[PMC_UTMI] = hw;
>  
> -	parent_names[0] = slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plladivck";
> -	parent_names[3] = "utmick";
> +	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
> +	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_MAIN]);
> +	parent_data[2] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
> +	parent_data[3] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
>  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
> -					   parent_names, NULL,
> +					   NULL, parent_data,
>  					   &at91sam9x5_master_layout,
>  					   &mck_characteristics, &mck_lock);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_master_div(regmap, "masterck_div",
> -					  "masterck_pres", NULL,
> +	hw = at91_clk_register_master_div(regmap, "masterck_div", NULL,
> +					  &AT91_CLK_PD_HW(hw),
>  					  &at91sam9x5_master_layout,
>  					  &mck_characteristics, &mck_lock,
>  					  CLK_SET_RATE_GATE, 0);
> @@ -220,28 +223,30 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
>  
>  	at91sam9x5_pmc->chws[PMC_MCK] = hw;
>  
> -	parent_names[0] = "plladivck";
> -	parent_names[1] = "utmick";
> -	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
> -	if (IS_ERR(hw))
> +	parent_data[0] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
> +	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);
> +	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
> +	if (IS_ERR(usbck_hw))
>  		goto err_free;
>  
> -	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
> -	if (IS_ERR(hw))
> +	parent_data[0] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_PLLACK]);
> +	parent_data[1] = AT91_CLK_PD_HW(at91sam9x5_pmc->chws[PMC_UTMI]);

No need for these. parent_data[] is already filled from the USB clk
registration.

