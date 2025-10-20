Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456DECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJzjjaEDD0imOWDSSABZOwuIGHAJF+eM/svL2iJ1tjE=; b=JkCQWOh5d5e+BEEdPpbi+iiYdF
	ENj2CANegVMmkNq1fGo7nz3F6ECXfoddC0Lbw2bA6KNKaVYAL6f0DsQ1sjCVdmQLWUHRwtmPO6lLn
	mFGKoR/bVR302qZ4ntv8GVo32jhtw+sa3z+GFJy7oiybD/o8y/9uwEzimtf5p2yprV+J3IaVCQCoW
	0lMrsiYPpoY00+kmnmlnqEhGiSP+zgAKu1B/xUehlCkSBKJavzroNtcgaEv38tiv82kP2T/K5VCIk
	WKDWr+cI9u4Wa1uk4Gha934a3E3KXoQ8smcCn/5dVG64rBhyfMhknhKIC0xJHvHh0+vvvtqGPl7eO
	R5YyGv3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvfR-0000000EnS7-2BOp;
	Mon, 20 Oct 2025 19:35:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvfP-0000000EnRl-0RIa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:35:40 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3d80891c6cso1113720366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760988937; x=1761593737; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJzjjaEDD0imOWDSSABZOwuIGHAJF+eM/svL2iJ1tjE=;
        b=of8y1sNwgWnBFJjAxYuyWYsaSrMe/h8OgFzISY0R8hufVXgRyOga+b4pc/0whynO+8
         9lAqmyU46kxkyydJ0wtGmMI7q+5IcCwXWq7IWYrFZ9AOLpn4eyJG9GPefCgCk5fK44DL
         J8Lc/WAad35HPrClUNATdQcFQBh8PORcT/askzfxxwGNcq29XC3kILMOyvhV8aCFHv0m
         SVBujzJrCQwTp0RevqZ4n4ESV++l7bEHhhFura9YOmhf9zAsJxwKMRogX4Xe0c3liZyp
         cGqaSMzNISAVk/DRrUfcIFt/37XHg8AooFWlOT1de6eI4wkoWfnNcXsh0SlwlpDOaScJ
         SJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988937; x=1761593737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJzjjaEDD0imOWDSSABZOwuIGHAJF+eM/svL2iJ1tjE=;
        b=erBF62KdcIMPS/0SE9qWOB0jN54kgJuJgJR1UQU+qRq5ilRIB7VYNTsqFE6K36g+TB
         QM1E7ahA5M8AQgTyX3NxWXhIkzpcZd7+1KTHWWfzzxKnk95e1Ovqa3L+MjNcwcUWr7HN
         PvQwIF2MN1X6UzmysYnrUOmX6eR6bw/WhIgKByN3zp1+S3g7Plt6Ul9LR7q32x879Pch
         OSiboquKNuCR8UHJAnk4Dwxu4bMv4t2NqDn9x+iPreHRnAnOoqMqBdGOuabnOELrCa4+
         XXoTDMkmcNrt+ON7E8tibhUHZcbtTRunjsv01g6Od3NhrfXtBklVsP7gaI2Qo3kUbrDO
         iDog==
X-Forwarded-Encrypted: i=1; AJvYcCW0sQX4sCcwAjULpiV1V4v8Cg35RLvrcXcg3PWnCChweerxVsW40bldAbSzHeF8pTvcaYq9BYWzh8T9vJ8PWoHG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx32aTKl83HjOeExrMnm/3+Xs+5+s1772zs7k03Nkg/xWj6iq2M
	a9U8PKqY/vu+bKT1dQABLKqdrRw94KDx188xUDMjBHdaoWH9wyJGB4naDGXxDCx8Bbg=
X-Gm-Gg: ASbGncuOYPIN6wx9f9VXyOt70lM55+My2/Rdk8r1rA89A1p7OTZqOeU+PMDq09fRszX
	Wu9Kg5LcM7Me4p7dfYmG4W5JNPJK629uKfhk4kDwX6Kwrh37T5/tQqfIqJrqOjTtdZENWQOTZl0
	MAeGbcuTwDvube95K7S3u08EIfjXODvi2IlWBWiReA7RTiL0DXEQvcuHBwNJrQkvT/lQujrZ6EE
	OUROZqqCS09ukh5XhxIFVZP7SI1tgYIjFA/OYTwx/H7kDI+TWKvxPJQWnXQ24PoifjkegjQQlnQ
	V6jUXO1Ka+lQ4O07pn9HL2CZKDRO7qOSl+ABNdLsgyAcBmzexfNmnBEPCbzaf029MZzXuM0h/Dt
	o/cTIUot8F/gvgfp0s78dDuAQ9qmMuLGESNAZyb+GH3GPAseEQEdCQtheU/Ounw6eE91UrSlJ14
	mgHRpBXlDuwAUlsjcQg+fBOWd4eMJfUg==
X-Google-Smtp-Source: AGHT+IEiYwpBReda0RVlKDOQV0LSpWf2aD9VoyYoOpi2xDJAeQwN4pP2e2fQdG41lg3CAj5uR9jk8Q==
X-Received: by 2002:a17:907:7a86:b0:b57:2c75:cc8d with SMTP id a640c23a62f3a-b605249e429mr2106696966b.14.1760988936588;
        Mon, 20 Oct 2025 12:35:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0362fbsm879008666b.39.2025.10.20.12.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:35:36 -0700 (PDT)
Message-ID: <e20e05e7-6deb-4180-bb70-59045fdcdbfb@tuxon.dev>
Date: Mon, 20 Oct 2025 22:35:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/31] clk: at91: at91sam9260: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <a85eafe6b462d385c399f8e56773dbedaa1f3260.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a85eafe6b462d385c399f8e56773dbedaa1f3260.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_123539_180210_E738BDE7 
X-CRM114-Status: GOOD (  17.05  )
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
> Switch AT91SAM92600 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/at91sam9260.c | 120 ++++++++++++++++++---------------
>  1 file changed, 67 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
> index 55350331b07e..2ac2a340da2f 100644
> --- a/drivers/clk/at91/at91sam9260.c
> +++ b/drivers/clk/at91/at91sam9260.c
> @@ -9,7 +9,7 @@
>  
>  struct sck {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	u8 id;
>  };
>  
> @@ -24,7 +24,7 @@ struct at91sam926x_data {
>  	const struct clk_pll_layout *pllb_layout;
>  	const struct clk_pll_characteristics *pllb_characteristics;
>  	const struct clk_master_characteristics *mck_characteristics;
> -	const struct sck *sck;
> +	struct sck *sck;
>  	const struct pck *pck;
>  	u8 num_sck;
>  	u8 num_pck;
> @@ -72,11 +72,11 @@ static const struct clk_pll_characteristics sam9260_pllb_characteristics = {
>  	.out = sam9260_pllb_out,
>  };
>  
> -static const struct sck at91sam9260_systemck[] = {
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> +static struct sck at91sam9260_systemck[] = {
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
>  };
>  
>  static const struct pck at91sam9260_periphck[] = {
> @@ -213,15 +213,15 @@ static const struct clk_pll_characteristics sam9261_pllb_characteristics = {
>  	.out = sam9261_pllb_out,
>  };
>  
> -static const struct sck at91sam9261_systemck[] = {
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",    .id = 10 },
> -	{ .n = "pck3",  .p = "prog3",    .id = 11 },
> -	{ .n = "hclk0", .p = "masterck_div", .id = 16 },
> -	{ .n = "hclk1", .p = "masterck_div", .id = 17 },
> +static struct sck at91sam9261_systemck[] = {
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "pck3",  .id = 11 },
> +	{ .n = "hclk0", .id = 16 },
> +	{ .n = "hclk1", .id = 17 },
>  };
>  
>  static const struct pck at91sam9261_periphck[] = {
> @@ -277,13 +277,13 @@ static const struct clk_pll_characteristics sam9263_pll_characteristics = {
>  	.out = sam9260_plla_out,
>  };
>  
> -static const struct sck at91sam9263_systemck[] = {
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",    .id = 10 },
> -	{ .n = "pck3",  .p = "prog3",    .id = 11 },
> +static struct sck at91sam9263_systemck[] = {
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "pck3",  .id = 11 },
>  };
>  
>  static const struct pck at91sam9263_periphck[] = {
> @@ -330,12 +330,11 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
>  					 struct at91sam926x_data *data)
>  {
>  	const char *slowxtal_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[4];
>  	struct pmc_data *at91sam9260_pmc;
>  	u32 usb_div[] = { 1, 2, 4, 0 };
> -	const char *parent_names[6];
> -	const char *slck_name;
> +	struct clk_hw *usbck_hw, *hw;
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
>  	int i;
>  	bool bypass;
>  
> @@ -363,12 +362,13 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
>  
>  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
> +	hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +					&AT91_CLK_PD_NAME(mainxtal_name),
>  					bypass);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
> +	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL, &AT91_CLK_PD_HW(hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> @@ -382,20 +382,17 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
>  		if (IS_ERR(hw))
>  			goto err_free;
>  
> -		parent_names[0] = "slow_rc_osc";
> -		parent_names[1] = "slow_xtal";
> -		hw = at91_clk_register_sam9260_slow(regmap, "slck",
> -						    parent_names, NULL, 2);
> +		parent_data[0] = AT91_CLK_PD_HW(hw);
> +		parent_data[1] = AT91_CLK_PD_NAME(slowxtal_name);
> +		hw = at91_clk_register_sam9260_slow(regmap, "slck", NULL, parent_data, 2);
>  		if (IS_ERR(hw))
>  			goto err_free;
>  
>  		at91sam9260_pmc->chws[PMC_SLOW] = hw;
> -		slck_name = "slck";
> -	} else {
> -		slck_name = slowxtal_name;

This section here should be kept.

