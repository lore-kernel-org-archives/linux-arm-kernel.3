Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE151CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvCeu/ME5wBtoFyvy/RwWyofR+UUb0XG5d3ODFPfnfw=; b=ecfa7BvBPni5mitPPolX0ntksW
	bgj0ieLDO9JXqPNB1aejrouRMkbgI2KDuqKiUZQda2iNxHS7pd63aA30NJHH4I/IXJDAHJJHDJ7SJ
	RGU+iPYL6ubmno+e5XjmmF6W/3Zl44aL/mFM/yPlxC+zeympBAAE9leUB0ipOZ+73IC1vhv/sRd5X
	iMnckv6mI1Kh73IM+t2QmwALN2gSLTPp1cpx9uaZjNGUhZh+EP4IVVZ2nqyBG0mKjTUyMVpwONiFN
	gFdkZNwbfubcDLT6KMYXsdxE4g/r+fmLt2k//jw/6gb4iDANCYsc/T9r8SBvNRvspew5uBxVhjvPX
	YZYzIKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyV2-00000008M9p-3PDS;
	Sat, 06 Sep 2025 19:23:00 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuy0M-00000008Ij1-1zdN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:51:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so1197872f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184677; x=1757789477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvCeu/ME5wBtoFyvy/RwWyofR+UUb0XG5d3ODFPfnfw=;
        b=aCsi9UhqFoovVhiMrX2GHaQe/xdy1A4/8uu4vWzIHtidXKd33csHef/UCGFzN+Jf9U
         REHw9qqX0FKmGvxevBYrmb6F31oBNG69mgS4B4uLpeneMov2zhyvdNefEcT01zBvtlMY
         rbekCgqLTKV6GfNpOnB/Q07Ki0aaoQdLXUVQQjY3wv5kxdE1vb2EvVFi4HQ7iUfalxXZ
         1yUhBNxKBmSSf2b5/Ln9oCJ5rwCcloa5jg9l6yR0pPEr8if+hhasBsQi3gY/F5bza2Xp
         t+//81ElkxWjU4P7CvrIWFHEtwfV8ifOqwGBKLOSxSh7UxeGsXQqfF91OctLmtbAcWeY
         4qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184677; x=1757789477;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvCeu/ME5wBtoFyvy/RwWyofR+UUb0XG5d3ODFPfnfw=;
        b=vlwDWTOyHmtiKypAjne2ck9T5i7YDGgrwARtrJvsJi9HXhmgSUv+uIngZ1YAvp6LUW
         XBhSYxTOgprmW09DbU3yzMHUsPzMIVkyWe38NWa35dYv8jz5MJi7dzALqdaZE71+unse
         eHh3gXt5nGzTqImF1UE3WGTiXq2RMo05yxUDuPuHSAbOM64/UM6D0U//waGbG5dIonVI
         v/mQ5Fpbh3MznG6WPwk0zPYbJzlVaO8phK4sAZ+B0WRKL3pS525CBATNSheNAYQRlBaM
         ItmChobRxTocNEpqQ9AFUCoa+enXQ399S/Hxg6WEjyLAFotYoihT3PAMyQxd2L0KRjfo
         AfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5uxMXw+ujVGdmkkEYIRbimB//X/MdHzpJiC/bvYWiyp+jNWUnGypKuK7Yz/RsbZpYg+Sc6zhL8DYop+L+J0Dh@lists.infradead.org
X-Gm-Message-State: AOJu0YyhDSmRO9CoeAGMthnx58GxRwbtyFUrLYpFdcNHCULXJzjNeAZf
	eMxxK+k4hUeOta5E5jknrC8GTPUwPdL5aydUFeE8aXuXk/mFitPZAX83AxnT1ZdUIWc=
X-Gm-Gg: ASbGnctrMrdtq7U61imNyYSnHmbWec8lQBLfGP31q9EkTgDFBySZQujyhPMSpo8WE+t
	MNbSevurcJLy+p1ek8QYaRTff2aayLK6kOfgWjKP/roVd8Z+xXHfR/GQlSzgGkg9GLR+IDR5ozx
	yzmnxjaE0sNXENkV9Y7yfeEt7Lcu2HSzPv1xyuBgo4wl4oVCMmONCDyRj2vkHLDrZF6P+/ZX0Qs
	QvBkiUXcssJIAXHoCjGHZ4fMzn8dmtzGvDmzT+PRKFnKmNrA023BYNkf/6h6kSN7Z6hCOKd6W4m
	K2kbauWt0RW71WTUcGAObnjbaLJxl+ylg9U9iGQWjDm8zqGW9Ktzu8x5gJ1HctbHG1+RhqsVd0S
	FtCKEWXh3B6NKY96k26lZywJucOGhdtA=
X-Google-Smtp-Source: AGHT+IEkI1qA1BQ+gKz+PmerbUufnOz1P3kfM2JHr03n1X4s1Su6tIVnS7ROLH5JWvxqm7fR1lny0Q==
X-Received: by 2002:a05:6000:2f87:b0:3d7:df92:5e31 with SMTP id ffacd0b85a97d-3e641e3b09amr2609603f8f.16.1757184676830;
        Sat, 06 Sep 2025 11:51:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm20303143f8f.21.2025.09.06.11.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:51:16 -0700 (PDT)
Message-ID: <506c3f57-d71a-426e-882e-ba3395c7b1b9@tuxon.dev>
Date: Sat, 6 Sep 2025 21:51:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 25/32] clk: at91: sama5d4: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <1b8f27323cb403ffcf6be7fac2def43c4a31bea9.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <1b8f27323cb403ffcf6be7fac2def43c4a31bea9.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_115118_519048_6A2416B8 
X-CRM114-Status: GOOD (  17.29  )
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
> Switch SAMA5D4 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama5d4.c | 129 +++++++++++++++++++------------------
>   1 file changed, 66 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
> index 1ff9286148da..a06fea1a7a02 100644
> --- a/drivers/clk/at91/sama5d4.c
> +++ b/drivers/clk/at91/sama5d4.c
> @@ -36,9 +36,9 @@ static const struct clk_pcr_layout sama5d4_pcr_layout = {
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
>   } sama5d4_systemck[] = {
> @@ -46,14 +46,14 @@ static const struct {
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
> @@ -128,25 +128,16 @@ static const struct {
>   
>   static void __init sama5d4_pmc_setup(struct device_node *np)
>   {
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
> +	struct clk_hw *smdck_hw, *usbck_hw, *hw;
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[5];
>   	struct pmc_data *sama5d4_pmc;
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

Same here

