Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E021CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 18:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iv6V9tVtGvXzN9JN5JdXHgexWU19RiPJvHD4mnHh1lY=; b=Y8H3yoLKCRbk8K3bBhVIvvpDyc
	ekcffFOxyZtc8pRyJrOHXn9zbpEHs5M18yADiUcAylnXaH/HZ1frRW7+YvSj7rv12GxsR1vylTVs0
	cx+BnjciA2mixQ0tXUs+W9T9oC5rh0BlkOehZjGFY7x+6Ln9jWVuhVGeQZoIaD37bY6A+/5jTTnln
	TiLcy/v9oOWQahZiYN4jFYPGYksxttPIdWBbGIVpN5Po932NJ3L2FAovzirZ79xqItv48FCTRKZVy
	jHlHk+GDA2HtYubEpyszzwpSz8PKi2rA2WJAIjZvVxQ/4sOzw9vji6hfEzyDQBvD3mX8b6Vak3vuD
	A41MNBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxou-00000008GwT-2MqJ;
	Sat, 06 Sep 2025 18:39:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxjc-00000008GBH-0C2f
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:34:01 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3e5190bca95so717578f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183638; x=1757788438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iv6V9tVtGvXzN9JN5JdXHgexWU19RiPJvHD4mnHh1lY=;
        b=ibomkkXDiZG2MaeJol1iq2DYOXF7W2ZJBkbJozqU5j+Pk+aw3/d8HXGikNxbf+foks
         o+tH+WmEJMr1lrnxMOjQXb0EYnz/SdmLQQr/SduN16a6uAd/fw1w0Yax6oDSKDVXW9T4
         wSJOWan1Ov43OiataXptnX6kq3UukaEQzJUCq4mzE03Bltn76tfLMusRMy78ZG3Ps9lh
         lYOy9D2hHOSSFV8djLZ4XYjncCn/YaXHDPw19yCbmb5BVV4nc3nvwRAc+WEYa1Ol3+Ti
         ePycsMnT5D9qL5f+CKlEn6LE2NS896VE9a9KPdeyGk+JCoPG5SsL+h3GaaPoaxXURGPm
         zExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183638; x=1757788438;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv6V9tVtGvXzN9JN5JdXHgexWU19RiPJvHD4mnHh1lY=;
        b=AYZaolq2eNvlpAv32+5dDFM3y0WgMBXI1zT0v0r6EPmB+4qfwtSxDMlY4xPFfAQ9BG
         x7k0ucnq9pfuln2aA+T6j2Ne7focmOiGWRvPhqzXjw18UcjRT9McH64ccCGLF8gKMaRk
         mKP0ac0FvmiqkIJqiJLVmPsoU5sitzUoee0muIVcv77bu2OyS03eAys51Bcrmf1QUvtx
         Rue2RBEE5b18Mb6nJCE3hpL4hy5VZD6yp8RUAFBVEtKK/dM1BHfrZO+XGMtf9bCSLFwm
         +zkct6aeUCoyv+jr/WZkD+y7gZsJ3vPHrimTM1kA63vpAcj1Fd24mZupbW6r2R1BtvPw
         Rzkw==
X-Forwarded-Encrypted: i=1; AJvYcCUYfwXRbeGvQRqVjrOGCblesXprDJ12SmVxgvmF7tT3QJ2Bwc4gzrubW9zFDtUtvpqYmIkHseaO8HAkdgOGYpoQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy23mc+xl4Ck5YjOWG1hSt9kc+vL3ZD7KnDAEptA/j45Qg2OXBh
	3XwzCpSUZtk3w7RIoLG2FBRvKrNaB21DOfpBHcKa4EqLz1IDdFd5cWmhdZAE6bhRCwM=
X-Gm-Gg: ASbGnctPMyQ2Bxo2/dnm5TrBSrvLakbsqVvHkkP/Tk7oNmj9cguz4rhvUCQYV1qPPO6
	cWlcqt4Kr0Xt9Ej24OOTbuEerClH6HRZqGF67ugc4YOc7I6Nok/6bOYws7Qyh5zTmXgfpw3u3lq
	Ch4NpMi8zAhrwvyEBK667cjv1rvHvFuBgFt7O91KRO5W+eVjGYLnvab82LKpW4+DjL9KAVi56hx
	GocFwc2pD881uF3qxumio0wfLYdQ0HGOQpd3+DUcsvPpsUNrDhnHcfOLuN/3vcIiztY0Eg58A/D
	ScXsvVJcAwdR498JHDfczhlZvMA+GzwSHiDN2ol1Ap215HcA4HGRdq6up/UX6x5fEauz+SsjNlN
	8aQrNPqWx4NvSC7tRiXAnOXvvOtrPxmg=
X-Google-Smtp-Source: AGHT+IGPeBLOpzMXH5QWmLiH/7uxfPzMzBWJEe83t320chzPFpRcaWsKId0R0dA9X9dygo6lURy4DQ==
X-Received: by 2002:a05:6000:2c0b:b0:3e0:37f3:7778 with SMTP id ffacd0b85a97d-3e64317d070mr2097103f8f.26.1757183638489;
        Sat, 06 Sep 2025 11:33:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e411219ddfsm6301439f8f.57.2025.09.06.11.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:33:58 -0700 (PDT)
Message-ID: <05e16211-7521-452d-9ef3-988dfe70618e@tuxon.dev>
Date: Sat, 6 Sep 2025 21:33:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/32] clk: at91: sam9x75: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113400_090762_0A8F1EAC 
X-CRM114-Status: GOOD (  25.57  )
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

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch SAM9X75 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> The USBCLK will be updated in subsequent patches that update the clock
> registration functions to use parent_hw and parent_data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sam9x7.c | 308 +++++++++++++++++++++-----------------
>  1 file changed, 173 insertions(+), 135 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index cbb8b220f16b..31184e11165a 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -33,10 +33,22 @@ enum pll_ids {
>  	PLL_ID_UPLL,
>  	PLL_ID_AUDIO,
>  	PLL_ID_LVDS,
> -	PLL_ID_PLLA_DIV2,
>  	PLL_ID_MAX,
>  };
>  
> +/*
> + * PLL component identifier
> + * @PLL_COMPID_FRAC: Fractional PLL component identifier
> + * @PLL_COMPID_DIV0: 1st PLL divider component identifier
> + * @PLL_COMPID_DIV1: 2nd PLL divider component identifier
> + */
> +enum pll_component_id {
> +	PLL_COMPID_FRAC,
> +	PLL_COMPID_DIV0,
> +	PLL_COMPID_DIV1,
> +	PLL_COMPID_MAX,
> +};
> +
>  /**
>   * enum pll_type - PLL type identifiers
>   * @PLL_TYPE_FRAC:	fractional PLL identifier
> @@ -180,6 +192,18 @@ static const struct clk_pll_layout pll_divio_layout = {
>  	.endiv_shift	= 30,
>  };
>  
> +/*
> + * SAM9X7 PLL possible parents
> + * @SAM9X7_PLL_PARENT_MAINCK: MAINCK is PLL a parent
> + * @SAM9X7_PLL_PARENT_MAIN_XTAL: MAIN XTAL is a PLL parent
> + * @SAM9X7_PLL_PARENT_FRACCK: Frac PLL is a PLL parent (for PLL dividers)
> + */
> +enum sam9x7_pll_parent {
> +	SAM9X7_PLL_PARENT_MAINCK,
> +	SAM9X7_PLL_PARENT_MAIN_XTAL,
> +	SAM9X7_PLL_PARENT_FRACCK
> +};
> +
>  /*
>   * PLL clocks description
>   * @n:		clock name
> @@ -187,22 +211,24 @@ static const struct clk_pll_layout pll_divio_layout = {
>   * @l:		clock layout
>   * @t:		clock type
>   * @c:		pll characteristics
> + * @hw:		pointer to clk_hw
>   * @f:		clock flags
>   * @eid:	export index in sam9x7->chws[] array
>   */
> -static const struct {
> +static struct {
>  	const char *n;
> -	const char *p;
>  	const struct clk_pll_layout *l;
>  	u8 t;
>  	const struct clk_pll_characteristics *c;
> +	struct clk_hw *hw;
>  	unsigned long f;
> +	enum sam9x7_pll_parent p;
>  	u8 eid;
> -} sam9x7_plls[][3] = {
> +} sam9x7_plls[][PLL_COMPID_MAX] = {
>  	[PLL_ID_PLLA] = {
> -		{
> +		[PLL_COMPID_FRAC] = {
>  			.n = "plla_fracck",
> -			.p = "mainck",
> +			.p = SAM9X7_PLL_PARENT_MAINCK,
>  			.l = &plla_frac_layout,
>  			.t = PLL_TYPE_FRAC,
>  			/*
> @@ -213,9 +239,9 @@ static const struct {
>  			.c = &plla_characteristics,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV0] = {
>  			.n = "plla_divpmcck",
> -			.p = "plla_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divpmc_layout,
>  			.t = PLL_TYPE_DIV,
>  			/* This feeds CPU. It should not be disabled */
> @@ -223,21 +249,35 @@ static const struct {
>  			.eid = PMC_PLLACK,
>  			.c = &plla_characteristics,
>  		},
> +
> +		[PLL_COMPID_DIV1] = {
> +			.n = "plla_div2pmcck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
> +			.l = &plladiv2_divpmc_layout,
> +			/*
> +			 * This may feed critical parts of the system like timers.
> +			 * It should not be disabled.
> +			 */
> +			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
> +			.c = &plladiv2_characteristics,
> +			.eid = PMC_PLLADIV2,
> +			.t = PLL_TYPE_DIV,
> +		},

According to manual at [1] this looks correct. Maybe mention this move in
commit description.

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf


[...]

>  static void __init sam9x7_pmc_setup(struct device_node *np)
>  {
>  	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	const char *main_xtal_name = "main_xtal";
>  	struct pmc_data *sam9x7_pmc;
>  	const char *parent_names[9];
>  	void **clk_mux_buffer = NULL;
>  	int clk_mux_buffer_size = 0;
> -	struct clk_hw *main_osc_hw;
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	static struct clk_parent_data parent_data;
> +	struct clk_hw *parent_hws[9];
>  	int i, j;
>  
> -	i = of_property_match_string(np, "clock-names", "td_slck");
> -	if (i < 0)
> -		return;
> -
> -	td_slck_name = of_clk_get_parent_name(np, i);
> -
> -	i = of_property_match_string(np, "clock-names", "md_slck");
> -	if (i < 0)
> -		return;
> -
> -	md_slck_name = of_clk_get_parent_name(np, i);
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>  
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> +	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
>  		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);
>  
>  	regmap = device_node_to_regmap(np);
>  	if (IS_ERR(regmap))
> @@ -754,26 +774,27 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	if (!clk_mux_buffer)
>  		goto err_free;
>  
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
> -	if (IS_ERR(hw))
> +	parent_data.name = main_xtal_name;
> +	parent_data.fw_name = main_xtal_name;

You should be able to use AT91_CLK_PD_NAME() directly in the above call
where main_xtal_name should be retrieved with of_clk_get_parent_name()


