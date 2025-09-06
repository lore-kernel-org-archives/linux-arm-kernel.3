Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A700BCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ItxyGgS7E2CVkqaAgZtR5mA+Tn6EFqfbGhszvfBwvE=; b=qg3o0FzeXxcRV+EXhNy4LJzyjR
	V6Gxg+2dXXfiJRhwfaoHXgTGEYN2vE/T8VgpmHBAiagk1D0v/0iS63xVTcmwrP6v+qSpML7U1qSXr
	i0WiYjgwBOPnMAihtM1Rg3YHBPx8WTPZ/Jk9svacn8bZIvXWy0VuL2P0cPibCcxJrz+AO6OxvpGxP
	yB9I0ORYxZ0AA8bbJ2o1aVw1puZkGH81L6IrzPUf1g88Lhx8ay05xcePCJLGjaK32hNH7lg0KOzmi
	fR1uVeAH9cOxUYNPJEwfH5mV73FT5IZOT1K6vbZXARWQtZlFcYcJoOcLuxAvOV2X0D0k2uyqVS0wg
	iIQRq+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyPT-00000008LdT-0Q4h;
	Sat, 06 Sep 2025 19:17:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxxl-00000008I4J-0J4Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:48:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b7d485173so20381905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184515; x=1757789315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ItxyGgS7E2CVkqaAgZtR5mA+Tn6EFqfbGhszvfBwvE=;
        b=lFOh5Yww6Hq8f3vujLhfaUdO61vKSQWUB0ZRh58DccepoVGB+jAcC7h+DoCYtz4kHu
         RvIMFnRRK/U6PvJ78ub22O3tTYKIsiLjgh83hDkbBG+IHoUcHzTcB/gWD2/MJ/CEYCLv
         Lc9m/HkEK92p6PUOOCxHCJu/ASrFKLp5oic0ySqWZSF+OYMFfVsjrVgTuaXq89KTpcR+
         WUYtGhQWY/pXGwpHjWxcfS/7qaj69teaQDcdHCSq9XYqxsTxAdHyIi3Oom+aKmKsqweM
         FFndsya2p9mTrY5L9/V8o2+tNAYIXzMNvetLbnwJHNqaC8GhHfWmkSJ/NQ3lKlRTWy4A
         KQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184515; x=1757789315;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ItxyGgS7E2CVkqaAgZtR5mA+Tn6EFqfbGhszvfBwvE=;
        b=SaVeQLuge7gD9Fs1EEXJ8MagveNZ3FEAatF7irgHVvOG/2BdDbzj9cEiqXeS5D9JNW
         IeB5egGzoa+SeEfT4fAx1vGCIRygal30V4RFOifWx8EsUFDCMESPC6OvQpaC6pnJS9Ct
         C5eZh26NCOuCmOcquBG/vr2k9sI6qz8hxK8lyUubz64pLJFSfINVXj4mwtW5PM1ZqhNJ
         bxiqpOh1AdJfomDpAddR61ISxaBjre1hblXcwbLQJz7ImagOZiueSoAqnWFNAQeYrqfX
         tlu/mmOU3+OtLqO2PuORUqPyXcUKgnJoJZgAy5Mi1gQjJflzJIQ2QCugqBXCtfV8cYJZ
         EXcw==
X-Forwarded-Encrypted: i=1; AJvYcCUvbaaL8kgTSBvbCw77n005OkGLCuPeeBNaIJyy49sMuGuABaVNqanv2/BgFq3lfMynuSYuOgfbeltLu9QYdbpZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yys1HgX5pznFislUApJg53MKaGY1SMkof9aUIYbx6iIeFIhVS2J
	+vMsq7yC5UwzomOVyOZAEWiJWILUPIBlf1O6UPFAQF7qOHz5rx/qJkql6oXf3Txi5k4=
X-Gm-Gg: ASbGnctHzn6kNKrQgP171v0I2pT9jDvG8yQgXKveIYdDfo1IentqSLnR+7vgceG8CmQ
	84E0I4PK+g4bQaXP8jtPqUyiWQ6MJh53QCFYvX1P+RoZecmkwrWChGNvYP/21DEh0l3I7e2cwc8
	arJBGLQ3Qv19qsWQiYkt5R+OkSGqYNzrBsJ47+Oj1wYfZf4JcgQzew/3ObR8yJDhC0iEf827Ibn
	r1YJuiFtF9o7tolPlhbVhWqqhGke1CcoJ/XpEgPWlhL6ijOsp40/8YvAsjGE5vS91+7eBQQV4No
	qH5roQ1a2k60g9u5kzC9VjVYBk3dI2YpwpXv3pA9w9WI9zyeVNhKNW0bahkXxbhES/yijw/QQHe
	MoldzA1Z51HT9Opd7JptsmOs3MToi0ARchARZ0k6G4A==
X-Google-Smtp-Source: AGHT+IHTpgtyModfxsIQAemnthqZ9Byeaws22gLsiNTaGF/G3vxl6nHs3mKSEO1Ko1X3b2mJaMKTSQ==
X-Received: by 2002:a05:600c:4ed1:b0:459:db71:74d7 with SMTP id 5b1f17b1804b1-45ddded6d45mr22663215e9.27.1757184515506;
        Sat, 06 Sep 2025 11:48:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd4affb6bsm95138195e9.1.2025.09.06.11.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:48:35 -0700 (PDT)
Message-ID: <7ea4f72d-ac4a-4f8c-80db-ac439f04f21d@tuxon.dev>
Date: Sat, 6 Sep 2025 21:48:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 23/32] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <e245b72936832627469e74a694af1d1cb65a40ab.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <e245b72936832627469e74a694af1d1cb65a40ab.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_114837_125528_55B0FEBC 
X-CRM114-Status: GOOD (  18.05  )
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

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Adjust commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama5d2.c | 168 +++++++++++++++++++------------------
>   1 file changed, 86 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index f5d6c7a96cf2..538ffb8deedb 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d2_pcr_layout = {
>   	.pid_mask = GENMASK(6, 0),
>   };
>   
> -static const struct {
> +static struct {
>   	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>   	unsigned long flags;
>   	u8 id;
>   } sama5d2_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> -	{ .n = "iscck", .p = "masterck_div", .id = 18 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "iscck", .id = 18 },
>   };
>   
>   static const struct {
> @@ -164,25 +164,15 @@ static const struct clk_programmable_layout sama5d2_programmable_layout = {
>   
>   static void __init sama5d2_pmc_setup(struct device_node *np)
>   {
> +	struct clk_hw *hw, *audio_fracck_hw, *usbck_hw, *main_rc_hw, *main_osc_hw;
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *slck_name, *mainxtal_name;
> -	struct pmc_data *sama5d2_pmc;
> -	const char *parent_names[6];
> +	struct clk_parent_data parent_data[6];
>   	struct regmap *regmap, *regmap_sfr;
> -	struct clk_hw *hw;
> -	int i;
> +	struct pmc_data *sama5d2_pmc;
>   	bool bypass;

Please keep these starting here:

> -
> -	i = of_property_match_string(np, "clock-names", "slow_clk");
> -	if (i < 0)
> -		return;
> -
> -	slck_name = of_clk_get_parent_name(np, i);
> -
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> -		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);

ending here, and use the retrieved names with AT91_CLK_PD_NAME()


