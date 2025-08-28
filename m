Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F7CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6p2tt16Ex86fLCzx2c9aJ/wVLkuf0FjhhNKWXNuhhU=; b=3/sqdSt99i/QpBfOlHntc845QN
	jJL/STyyQiUH1VUXfxKv4KCBRyyT/v8oDq6WWbWkHE6n/8XlZiE88R0oniiTq1kwsehz+CMZjOq3t
	ksfNnwVkUF1p05JIg+uW5Dg91iI+rW7GIKb7/HRnfgseIRVzotPp76DR3Ais7ZmmZ6meZAT4ycm1j
	WoiX81zEyrhotMlSpRLPhiC9EyGnIUrbQwqYcPOz3ZqyppSpHpo2+/t6FgFJc/ALo0WBMo/ZIwwT6
	h/2iKT2KhToyjstgAjVtwjyDxAZ+41kSj2KWZAXjO0TX08KZLmoXlkaWzGBPizKVzPPYyt2oJZLL3
	Vgh1XJFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzT-00000003dPs-2EX1;
	Thu, 28 Aug 2025 23:25:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgbU-00000002Z1E-41au
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 17:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756402803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6p2tt16Ex86fLCzx2c9aJ/wVLkuf0FjhhNKWXNuhhU=;
	b=SV2BLNWir/H6zHs21qrTYL0vdbZoDkzaoCU1AnaHFebiVW0MvuYvMG2eCNdW5Xe8No88yC
	T9luUNhEscgd32ZXHECS/5XP9osNDEpp3EY33YZU2boEzDzyrxxbOp74fEYNEumid7x2xA
	VxV9fND3qZEnCM1ndoef4SjLCa4HzIs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-xI7wgbtZNsmbXOE_QB2JHQ-1; Thu, 28 Aug 2025 13:38:15 -0400
X-MC-Unique: xI7wgbtZNsmbXOE_QB2JHQ-1
X-Mimecast-MFC-AGG-ID: xI7wgbtZNsmbXOE_QB2JHQ_1756402695
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f55eb56so23497246d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 10:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402695; x=1757007495;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6p2tt16Ex86fLCzx2c9aJ/wVLkuf0FjhhNKWXNuhhU=;
        b=wMfFjlw+eCSzPPHUvMxQy/VCaiWNzUBo8KgmNG2UHrhwenfXWXoi6RNHp7Wk7IRYts
         FdoV/0ryudVbpQBPaHeNxiiEN2Kxeivp0QnLdi/2h/cFwTit7QO5caUO2ij22smRJP/R
         /8g8yEYa5a8txhQWwV6tdvRXjmyp1fyXXYgqwL1Kcdvu/zOTWpYOc5xJ7ke9sp8+oO3r
         Z4uTkYvWUmxHMnskrp/E4W2EWbGBaD+rxeGEY0B8HW5e+kfUWsBt30n51jmaXSKjGyWU
         PjOPxi4I90uMZBLm1H3m6FMKrlx3a/ucTssp4++LjejkYRhQEQxKUu/yN14jidWPomln
         k3LA==
X-Forwarded-Encrypted: i=1; AJvYcCUhVVZA7bXONfMpsq27GhrsBtJ7iZQhW2wFnk5qH9eGrP3FV/imMrcR/2mJigXXuI0hem5DKhvaNJ0tgxy+AYiV@lists.infradead.org
X-Gm-Message-State: AOJu0YzwI7LCrFfwzi+YjA/C3FJPdLGGRvVLa8bXeotAKD3w215JjO2H
	w7MR3YlYRSyPEPyWjR+r7XqvpVOqhb5vaRjH1CG1Z0JTYpJoG95jywzlYlt+A/XVB95+IR1GzDI
	KaPTaS++V6S6w4u2ICZ31o0b3nbRK4MpA2YyK58wSpbpUow27M81ayGwp0JU3Bcg8WVMNST0tgI
	n6
X-Gm-Gg: ASbGncuyfCifKaTY8WbiW6IE+QdgwRzsSWUsV0ER9UeBKPNvqLDfFtsz/1xSkgKSSAK
	SAS5yQqQLRI74/mvHp9eDoI1MqCjYeQbAKW9WFl6dzpmjJETME1atbC97HRlZb/6TqAdIy+HtW4
	pzVpWtMb35CXDfkzutWMDZKAm6r+OTsMexBs1jOyanTn+JiwhlFJAQ07Frbyi74qrCHnFykx5Co
	wWNS3Xl+Fb4nD5QDlS9N9Ctz2MojEjk41s8omMkoIMOYWxUHMrMfWjH1VRjy1y3qbfZrpJghvhL
	g/nysoX0drqDKt10asryYnAkw3fMoyopzMtU05qlw5QvE8EkacSg0jKwX6Kuge7m0rgY5+xzItN
	W6LImhrHn5sqpaBMvxaw=
X-Received: by 2002:a05:6214:c65:b0:707:4539:5183 with SMTP id 6a1803df08f44-70d970980e6mr246817926d6.5.1756402695118;
        Thu, 28 Aug 2025 10:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFolBQi5Yqb+JsBG1B+iQ0UbKTmrqVThPcyhvOhG9tT6SqvRRRfRTx8LsjupRZvAV5rgEeAWg==
X-Received: by 2002:a05:6214:c65:b0:707:4539:5183 with SMTP id 6a1803df08f44-70d970980e6mr246817666d6.5.1756402694644;
        Thu, 28 Aug 2025 10:38:14 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72cbff7sm108739796d6.62.2025.08.28.10.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:38:14 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:38:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 03/32] clk: at91: sam9x75: switch to parent_hw and
 parent_data
Message-ID: <aLCUBDXzZm8LukL9@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
In-Reply-To: <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Sve2-PXDCQ0Tni-S4_8VIBP3lyAY3yJIniAOLEuU-4g_1756402695
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_104005_251616_9632B0C2 
X-CRM114-Status: GOOD (  26.16  )
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

On Thu, Jul 10, 2025 at 01:06:56PM -0700, Ryan.Wanner@microchip.com wrote:
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

[snip]

> -	[PLL_ID_PLLA_DIV2] = {
> -		{
> -			.n = "plla_div2pmcck",
> -			.p = "plla_fracck",
> -			.l = &plladiv2_divpmc_layout,
> -			/*
> -			 * This may feed critical parts of the system like timers.
> -			 * It should not be disabled.
> -			 */
> -			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
> -			.c = &plladiv2_characteristics,
> -			.eid = PMC_PLLADIV2,
> -			.t = PLL_TYPE_DIV,
> -		},
> -	},

Should the div2 to div1 rename be mentioned in the commit log?

> @@ -710,32 +738,24 @@ static const struct {
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

Based on Stephen's comment on your earlier series, I think it would be
worthwhile to call out that these __clk_get_hw() calls will be removed
in later patches in this series. I know you do in the next patch.

Everything else in this patch looks good to me.

Brian


