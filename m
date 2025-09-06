Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E86CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1duALMFYguAwGoCUAj68KdsYk8MNW56WucSUt18X7Q=; b=wLZk2jgXwAYXcq7crXr4wEQJ51
	Sjx5tMZSA6f0ANj+XfedcQ+xzXOhdCkiyFrlplnt+jXul4jISnG4TRG7R33fyvRqkKWLCK8oPoQwn
	7f/STmrQGRufp6agn25ykLnho/GjQm0BxUvhdDNpUWOMvSY/3PnPVVWeSZe0JwgnvvXjKm361HV20
	nS8gECdbZFci6jIRo1VWltnfGBQdI5LWMHQ6Y+9s5u9p+/gjFVdC51mdlkI85d3zogrlR3TcQ5NGi
	C+LVB2zoakc2ZYYmN9imaDPRFuarS0m0jYXuaxXYxCTLtIUFbugfg8KgKVgawBt3v3EEVgWmhboRi
	QMuqRuyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuySF-00000008LuX-3uBb;
	Sat, 06 Sep 2025 19:20:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxz1-00000008IXK-1cm9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:49:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45b9853e630so29610125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184594; x=1757789394; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1duALMFYguAwGoCUAj68KdsYk8MNW56WucSUt18X7Q=;
        b=oqHtUFeRHANJZFyKa9edXafMX3kmvJemjTqaYf8XVOe9dZ7zC2Pq1ZxCIu+DQ+OdUq
         6K5UafNOttG/4D6jXjvP7HLDW5G5id/wuF15bNWXOpAy47chnOirtxo3mGKUqAAC5Hun
         9mEqyz7HZ1nSJ1lXJcAiVEof0s0GOrVpEQBIgKdenBJ1cQjX5rAZz4ayqPeyn7RylF5B
         PT1v1GElrrjGQm/vVSluqio24cI6xGe2kU9+j02rFk+9JWniZ3bBvNgbtqUj4dT1evU1
         uFS9k9JpQUrXR2/hwAXSfglWRRNSXQvyTcrBJ23pmnb08crAhd55BB9qo6B4HAvAP3/2
         cb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184594; x=1757789394;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1duALMFYguAwGoCUAj68KdsYk8MNW56WucSUt18X7Q=;
        b=uObOTP7Ja6MIbhfNSV2Tx24cDXI7MvwlE84u84NCD9TGT/x2hng2W6rsbjW+4duy44
         KEfBdkVehlZCLlPFD2gzIwDvLs9TRWSb41QRx8+wjmml0RfO0B8yR/OoErPjgONzhwHm
         486RWEb3CMe84owhzKMXWAllJfTJhKvqX76l6/Xhuw4djabB2sbp7y1QDw1GX7dUW0C4
         nJvri4+3VVd3A/5vjenSC6YwHZWsaByk9XZjR/EGEDL/4zB5+aSZ8Hlosm7v6Mj6iUyB
         A0U0mJQQwkHJHSPErs+GUZInsIiBUpOSMxxbzaWYhXlFTY3Wg/wRO8nhGfasgP6WbRwY
         HHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOpc+uCaC4xXAS0vY9o6g3wnd0OK3I4+7zQgNWOnCEBrNafqP3mBCgJmHt/IKLfgO5Sf04iY6Dsw1uZ3RQzeXN@lists.infradead.org
X-Gm-Message-State: AOJu0YydgHzkyL7rqu9Va6x60MXO6M+uxPpO1edXdh6w87AxAjzKstML
	k50v7gBIrQNZUKe3QhcV950OO+/hIld4aogX+XlpRyeIw2CZhC+3SgHlpCDYKQDEys9esrKW9Zp
	DY+/k
X-Gm-Gg: ASbGncvBXjCTfjXJhkniRlQQbnyPcEeC8stOIsOEnYv0oyWddczKq5P44jY/nuGO0KK
	nYa25kmDSC3N82MMEZ8u3N+zRLdCnw3jpieqHTZ92hgeaVrKSK/5t6b4zCSbLc29sf3NXqTPiDY
	+d6jlI744zWginUt78X95zxbYUctO3nOJjWq/6EX6XJp5tjcQaAu3Q3t9totyhHHwOW+MdW/ZFv
	kRrrs+OHGLYAOW5ZZq4ZDans66LdzpPY356co+aJ2sYHKI1PM2GExwqyxrjWTNyhEuMiOuRkUat
	+kaudTuiB8g7Jt0uRnt0fhguO5aan81ZlBqdRVwkolAk7uLLhSVCX+gTOQ+i3x8XTtjN7kZfkIk
	QC9olDZnr1oNYdkkpn/EfS1SwPvvLeRs=
X-Google-Smtp-Source: AGHT+IHZFDMtmYlvXENzg7IersllDvAME69Aa+eYY71GR9KeI6KFHf2HfcJV0/Y9VxN/J7hUF8lrdg==
X-Received: by 2002:a05:600c:1d16:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45ddde89897mr29808885e9.3.1757184593820;
        Sat, 06 Sep 2025 11:49:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d690f2ebb9sm25918131f8f.20.2025.09.06.11.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:49:53 -0700 (PDT)
Message-ID: <30806f24-b038-4785-8787-25229541136b@tuxon.dev>
Date: Sat, 6 Sep 2025 21:49:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 24/32] clk: at91: sama5d3: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <8b9b4447d93f048bc95ab083c9fbe1d5ccd8acd1.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <8b9b4447d93f048bc95ab083c9fbe1d5ccd8acd1.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_114955_436948_E8BDA2E3 
X-CRM114-Status: GOOD (  17.63  )
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



On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D3 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama5d3.c | 122 +++++++++++++++++++------------------
>   1 file changed, 63 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
> index 8326bb6a291c..e5b061783b09 100644
> --- a/drivers/clk/at91/sama5d3.c
> +++ b/drivers/clk/at91/sama5d3.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d3_pcr_layout = {
>   	.div_mask = GENMASK(17, 16),
>   };
>   
> -static const struct {
> +static struct {
>   	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>   	unsigned long flags;
>   	u8 id;
>   } sama5d3_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "smdck", .p = "smdclk",       .id = 4 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "smdck", .id = 4 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
>   };
>   
>   static const struct {
> @@ -114,24 +114,15 @@ static const struct {
>   
>   static void __init sama5d3_pmc_setup(struct device_node *np)
>   {
> -	const char *slck_name, *mainxtal_name;
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
> +	struct clk_hw *smdck_hw, *usbck_hw, *hw;
> +	struct clk_parent_data parent_data[5];
>   	struct pmc_data *sama5d3_pmc;
> -	const char *parent_names[5];
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
> -	int i;
>   	bool bypass;
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

Same here. Keep the name retrieval method and use it with AT91_CLK_PD_NAME()

Thank you,
Claudiu

