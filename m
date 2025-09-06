Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A26BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXIBvGz2QRYZ2c6J6+fuJIBALqm9W64iJQz3FvyRluM=; b=qMdcQWi7fKPwCIh4npx9IScuV0
	5i46HzYaw1EtodFVC3i47a2ta4E0edJoGZ4LHX1Wo/T7bCeJ4JrIGWcb7nmvCGEnNr542JgftdOvm
	+VkK0EPzhYJgF1PxyrT/s1hYL5ALPNVCsq69O/OXNUc+lGijiEy5mJJA7ZBmwR3SAq34ptP/So0D0
	IV+oGHD0hQSVVMoBH+fy1CtPwojHfM5YpXf7Zb11SLgnyDHs4HK0Q5SnDoC1wHFUS8++MCrJ5/NHB
	03u5AKDImWl7bvIERj/xdJ28WFdFz71t+o/82CGK6yX1waARVcTX/WiP5+TN+hYAvnjJpZTganfjT
	peB2NiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyMe-00000008LP5-0y5H;
	Sat, 06 Sep 2025 19:14:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxw5-00000008Hbn-1XIQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:46:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45de2132c49so1204775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184412; x=1757789212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iXIBvGz2QRYZ2c6J6+fuJIBALqm9W64iJQz3FvyRluM=;
        b=PZWiBS8y3wjQL/XTHBGtvVoGDHW/eoATao+vdzwh42hk7S+K7y4QSxLsXdWDSIl5f4
         pdR3N6rDBcktBYj8EzqVN++YtYMHtKRBgt1/IElJ8XEghYRtAz4Q7CowMh84dYDEr5jC
         ikJXWFKZA6enwxZIVXomRCA55PNLErZ0MJlT1I+z4cr18xm7cqDF2JPnlEpn+dLkN0Wv
         MI27N7h83IKhWKKc4jo6Oud+RsFqRkGiV2JCzcTVi8E0bRsMgqXP5G9aF3AH9ItNse9h
         u04L/XNi7M51xKqwRBCuzwJ8BNaBWFOVP9mxkAX4OE4S3WdT+bNj9q9+ldAKUKLRpFk7
         LAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184412; x=1757789212;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXIBvGz2QRYZ2c6J6+fuJIBALqm9W64iJQz3FvyRluM=;
        b=fBpelI2PG/ORL3jG8h1TdIr1wj+UHj2TzJ+/MlgPva2NsljhfGRi4PR5N/kft+YGv0
         +c+YNTMRRNTKgUcqb7g7bMtP8pZc6XUC8psrjPPpgHCzf21KB1Bk1uGqSxIqa6fjrnv7
         +am6XkyRJwezm1YCtI7MzjIz/+GAsOYPQKMBPgWSdWdCD7TZ8Vptm8HtPwT0HYavV2no
         dJCpHHqdte+UCmjxRZLL1C4baiEYm6AviIzD83m5v0PbRaodwoOp/7yBOfbj/OZU4RXJ
         MwFoq+XDb7e74CyqSv8sG1S/PdP9tycHlPLOimHPVbTAftBa+r8ooUEwoj/wGmtlLDec
         XWkw==
X-Forwarded-Encrypted: i=1; AJvYcCV3WjiG+eGtC3PMyx3Ku1zz1pGDWOpgG9+CUwMg+7aqpV1PBqYN1OqG6VxmMkT8W1JEfDK4Jq7DpwxDpLrkasYk@lists.infradead.org
X-Gm-Message-State: AOJu0YzB9kANHNfwdjsAjDw4dGpH8uuR5yFbVYrNLLs34oScUSe+YJPQ
	EJjiOJ90D214t0pvd9nnfo9YhcyvkXDJtHeI8AjEtJM2f7p4b6DRoLNOSGYTn7nu66w=
X-Gm-Gg: ASbGncvO32vMvqnibYTEFPN8lx4SW88Xxak3aqoweYHK+l8cgyDyLoJG0ogdLY/AyOU
	0ZMX2Q5CGIpHAyxkuvLyY3tZxaz8stQUAiVX8FRBmX2xwulAXbOCpMbMmTBdvEH84dcbL19uViu
	6hWWcc/hpEkz8dtJrKdJmo66tWIqz/fDgkCmrhHgEURUARbULIzgCA9TIxmzOUXfH0LVN//Ygnc
	Ui3aBC6/7JJVlnS+bJ1z+kl46cN6ORyjD+Z+oVXWg+cT/BT3LkWGb0bejCDIhJknr0dkTsny0EG
	krp26Rvffcvb79iO5MFG+uSBFFjb4OLoiM8S/C0C8f/XgbfmlJUObkl/tJnu6f2u5Ri509foCW3
	OubhwEEb8pS98p8vakyS4XwdGoJ+t+W4=
X-Google-Smtp-Source: AGHT+IELO4WCYtXnWgGHZ+m3e/fCm3/0gRjeizrA1xDQ2eHBYPWbZicD4ZFELLra/Cwi94VouYjN2Q==
X-Received: by 2002:a05:600c:8b22:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45dddec82fdmr28142265e9.17.1757184411619;
        Sat, 06 Sep 2025 11:46:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm202054845e9.12.2025.09.06.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:46:51 -0700 (PDT)
Message-ID: <4754b656-6168-417e-8fc8-450d1b0a3293@tuxon.dev>
Date: Sat, 6 Sep 2025 21:46:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 22/32] clk: at91: sam9x60: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <7f90312300d24617c51f63aa0a1c7bbb4a0212cc.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <7f90312300d24617c51f63aa0a1c7bbb4a0212cc.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_114653_415481_FD3C7267 
X-CRM114-Status: GOOD (  18.59  )
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
> Switch SAM9X60 clocks to use modern parent_hw and parent_data.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sam9x60.c | 109 +++++++++++++++++--------------------
>   1 file changed, 51 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index eb38da77d69a..b2e86e600a9f 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -79,9 +79,9 @@ static const struct clk_pcr_layout sam9x60_pcr_layout = {
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
>   } sam9x60_systemck[] = {
> @@ -89,11 +89,11 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck",  .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "uhpck",  .p = "usbck",    .id = 6 },
> -	{ .n = "pck0",   .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",   .p = "prog1",    .id = 9 },
> -	{ .n = "qspick", .p = "masterck_div", .id = 19 },
> +	{ .n = "ddrck",  .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "uhpck",  .id = 6 },
> +	{ .n = "pck0",   .id = 8 },
> +	{ .n = "pck1",   .id = 9 },
> +	{ .n = "qspick", .id = 19 },
>   };
>   
>   static const struct {
> @@ -184,32 +184,17 @@ static const struct {
>   
>   static void __init sam9x60_pmc_setup(struct device_node *np)
>   {
> +	const char *td_slck_name = "td_slck", *md_slck_name = "md_slck";
> +	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
> +	const char *main_xtal_name = "main_xtal";
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[6];
>   	struct pmc_data *sam9x60_pmc;
> -	const char *parent_names[6];
> -	struct clk_hw *main_osc_hw;
> +	struct clk_hw *usbck_hw;
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
>   	int i;
>   

Please keep this starting here:

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
> -
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> -		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);
> -

ending here and use the retrieved name with AT91_CLK_PD_NAME()


