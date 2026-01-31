Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A19D79745
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3CZzSVVx2dpM9MGCKEwNRkXh7AjWOcopY5v7H1v3xg=; b=DnMI93PYvjOpk/YLFL/qFaojSR
	HJ7/JivdGAdukI6e7JMMFtIgnEn0D5D5pzkCF2XmO+5Gh8MT7rgYOrvD6wH06kEJhEIR7C9mbmXwB
	u9Nais3ifR7a4+VtEBXUjNdQW4kvCUKaq66bL3pCqa4+bLRq6AXvxbtHBtSpEZIqHUVd9sS20QLYG
	DQ4vZEIIhfHaPRW6U1ZcwVga5r13np1c8+cVy4WJCSf/h0eaYbgTzE/QIHZjD/dcxg6wJr1f82SVQ
	iudD2kXk/8M9jkjkgUHZQeaGN3iVXfe8t22h/fduuZ40d3AFFQZd9bdPLMkKSdQRvAshu0KorAAR3
	Xalz+f6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBs8-00000002gr6-3Z1m;
	Sat, 31 Jan 2026 14:22:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmBs6-00000002gql-0VXG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 14:22:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4801bc32725so22456505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869364; x=1770474164; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3CZzSVVx2dpM9MGCKEwNRkXh7AjWOcopY5v7H1v3xg=;
        b=HMksMoxXwUhhhHn8NeT+/3M8U5M80K5xi5cis1aC18w2RrPssBAvB+k5Ii1kP9wqza
         wfQ4oIETupKOeCU1hS65R60WMs7ZKHvbuXIeKpKeGwWzcNMlKWRWJMhjb0WXHIebhIeY
         +UxviQ+NvMh6apk3SjRv+kxFcf/w+QpvrieV4lvUwI77g7KUrVD9+oBarDk/duG2Sad7
         3h4BtajxdTT7uzLT1P1MdZkhKthm6FHSwdcK6/wEcCBqjWTpvPBZJw2igyZBUyZ+mDa8
         jes+btOvbxr7Mit4zMAjaEZbUkoZza6Gyz8HuSVXuxEuG9jIQ+m+CwZPNoIIrS9x2sDM
         sDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869364; x=1770474164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3CZzSVVx2dpM9MGCKEwNRkXh7AjWOcopY5v7H1v3xg=;
        b=nbhZZSzri16lI9A4que+czqCPNHrk+kOOtsih2Ib+k+SDTBzu8uJcmKZjysUn8MrY5
         Pp1tPO9lWd2MhPYTsT7g73dwOESh8XzxUIu7Ybu+0L+svy8BkqBRRa3xJm5I4QQrYCWP
         Ncm6Xo5UhxaMkT9yclDcGMTs0ilwJw2lWieI6eByLxXraZlN/GRYi8pHi7Zq6fMnFZSL
         GhHaiS4+jHAWBSf/lgPHjdkNNrgOBXSVtYHjG5LVu5Whymno+32FRBDF4mSs3q8Y6Olo
         Kf9cWKpwrs+ocblNgybX7mcuTfzfhWJSiLUhg2bMTQIuYUr8KA2FNzeT7bjzEX2ZMxVp
         OOkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzOrjzhsMrAgsh/keoTyQ6bVa4C2keN01jnoLu5yeLsoC7qyZjzl+dlDXC2RD1dD+xzC9FAvE9ZWJTgH5ozOng@lists.infradead.org
X-Gm-Message-State: AOJu0YzodWrA/jKSLdbeXxFiNVxPKv4j1Fn4qj9jiq74Xc2c7LiRnKgZ
	tw8gYv0p3tWONpTcpXKEA3ikftiOajD/HfZ5WQxExatLHTX0yhDzt4EthlbQsgklfEU=
X-Gm-Gg: AZuq6aIwW42uHP+j8j4Bpv3bkdLzG1EW5hJqSUJ+LDHcUAUL2HDUNRA7WVqTrwBMpz5
	RVF9qv0nFV6b1Jj8POIZLOy4+0abCSq950oeJU5DgS5sOgAAIHzumQjjXA3GFaJXDTAmCFMh7bW
	l+h6PxPpJYJyRi3a/NFbKj2Iy3OhLKYG30DMeBUSESzIjFX2CJl0kTUj8sUULmpwW5QigYtyPRc
	oZZKywAeggzbCc3+rQdEfz1XbMS4T0d0PXsjdDR53PuuimwvzAZZgtzPnAL+1u25q84VOeZSIpS
	kwsxV7XD0ZjOlUKq/GtjauFsSiVDHD7XPw/ROhJONPud8maPLOdfJGiVwJi7foCT4mN4VJyBZys
	6WNmhyI1rWM78A3b1ljbpjpogKtM9EUf61ugUpe0sR7LHRZFi0IuMtYv82/+aJImjb1B2SzQdov
	Hvi2f98Gg7diWVUhijWg==
X-Received: by 2002:a05:600c:1f92:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-482db4a873emr86851925e9.35.1769869364039;
        Sat, 31 Jan 2026 06:22:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3c6sm261644645e9.10.2026.01.31.06.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:22:43 -0800 (PST)
Message-ID: <7f5838af-b8f0-44ca-ba9d-378a8aeee934@tuxon.dev>
Date: Sat, 31 Jan 2026 16:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/31] clk: at91: at91sam9n12: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <d4125677564e1deab066f88fb12137069d1f4a6d.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <d4125677564e1deab066f88fb12137069d1f4a6d.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_062246_179342_CB13D69D 
X-CRM114-Status: GOOD (  17.28  )
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

Same here for the patch title.

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9N12 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/at91sam9n12.c | 90 +++++++++++++++++++---------------
>   1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
> index 34dd7645f964..87c28d34f98d 100644
> --- a/drivers/clk/at91/at91sam9n12.c
> +++ b/drivers/clk/at91/at91sam9n12.c
> @@ -51,9 +51,9 @@ static const struct clk_pll_characteristics pllb_characteristics = {
>   	.out = pllb_out,
>   };
>   
> -static const struct {
> +static struct {
>   	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>   	unsigned long flags;
>   	u8 id;
>   } at91sam9n12_systemck[] = {
> @@ -61,12 +61,12 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
>   };
>   
>   static const struct clk_pcr_layout at91sam9n12_pcr_layout = {
> @@ -111,12 +111,12 @@ static const struct pck at91sam9n12_periphck[] = {
>   
>   static void __init at91sam9n12_pmc_setup(struct device_node *np)
>   {
> +	struct clk_hw *usbck_hw, *hw, *main_rc_hw, *main_osc_hw;
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[5];

Same here as in the previous patch, please mention that you've changed the array 
size along with the rationale behind.

The rest LGTM.

Thank you,
Claudiu

