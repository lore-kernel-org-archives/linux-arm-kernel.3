Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6C8CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 19:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzYoPBV1TwgFlHltcxFw4KPza8jbsfJi3V/Uo8JU8Kc=; b=CCd0kkQep3u9tcc3nv2wXhZdEN
	l4XRgq27BWuqtvEzjWqVJa/slfeYyXcaMN7UzhSB30LkR+syPHKBNHgyzhTjd4UMreDIC/2irSCSb
	K+nnokCeKDiRYDj00N6A3t1krDBcyiwA+BbHX7XpCh9Pj8839Wye9ZM67UVm9RkFgGYFojjv/5Fvk
	R+sflTgIHh86SGKQ6AW16EeMguJcKU6907OFRKgzErtaFej8i72lrKrbBVlaVsevMZodFn4XN0V8x
	xB4ov1nMrWPVgu5ogf72+71IQXl6a0fwUev17OsUCom4brTEHIhmmwEqIYHQzJGG15HxoPGetiwEG
	uF19BhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuyJq-00000008LCH-2294;
	Sat, 06 Sep 2025 19:11:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuxp9-00000008Gyd-07pa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 18:39:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso19924825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 11:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183982; x=1757788782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FzYoPBV1TwgFlHltcxFw4KPza8jbsfJi3V/Uo8JU8Kc=;
        b=bCvGF++0UpNYqHwTFZscKJStkbsSAHW6n+8T95L4E38zYOLILmZ5F4sO8BL9YnxiVg
         Jrw0kAxhDpigNxFlQsAra8y0BrLZIamrOAs/hIGwN8Z7RCLpERG9HWbPob/h3e+mW9lU
         B0hNgap/zdA9arMeG2BwmuKOs1Gj4VFSjPg0L/p/+V3fSEp9a/lrCOg9F4xW0LWaZ9eH
         +DfMTp/ghd5zk4sTx01UNJ3oD7m9CsL7/5S7aZEp2ct2AFyN+zMrU1DWxwbbbAmymyuO
         I+EpgWYKIX14TS9Wykh+4Nyq1H8HIDOugPigCzoX5FdNBkt+YzLcF7GzAUpjO4SCn9tX
         5LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183982; x=1757788782;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzYoPBV1TwgFlHltcxFw4KPza8jbsfJi3V/Uo8JU8Kc=;
        b=FzPdmvigdltZ/uiUmoX7BUBRUydVcjNUcE8TPlpD2F9G6XYFcrpcNJYx1+kWSumGpL
         Jj9pCAA7wQ0p8G8Vjp6fNYSk28tljx57+hfrYjZPFmq4hx13HJaeLyU5SXZQnTEpjoqM
         4wwYfqMn/2OBY7OXwiFewfkoUcLei3OHd6XrlUynDOFzKlvfdjBcLmdktUnX/iDK9/tO
         JOXJrsttTyWBnZyvpuQ/9xumXpo/dkARjqoi7hlKNrxgJdW9Ie+5KE5IaZ6BbfX7abqk
         NJM8s9W7aVJ7cnvGUtL2d4DIF0d3HmoBCvJx8aNGLJfqjjQTM70ZwVIBE+h6sW36TMsN
         IOmw==
X-Forwarded-Encrypted: i=1; AJvYcCVyPXjmCD6mi/qIoI+3oYn9zorIiv3PcOqZKSL5+dIgpnol0eEnZNqqZJ3d+c+ZTijnBoArHzAKhxQ0lRPlgayh@lists.infradead.org
X-Gm-Message-State: AOJu0YxJhfe3RReiqJ/aYyQv4ADslBL0h/tURXe5raPs5w19ebSgDUVl
	ujJ4oF4lschmNHPoPfRZQumHrZtYWTmzHedKprrpg0v9Ni+NZtsCHTZmosbmCtHeCgk=
X-Gm-Gg: ASbGncscue4VMruBFcmwOVD5Rt2sCHIt2buMlWeZEhgqbOHrACirzNBPZh7JdXA6sZJ
	E5yjHqeBYqSZ4FChG8Hj2JfaqVf6ywS+ZX26xS4bCyl58cmoaZWwfgfrPbexD13kOpERDDPx8ye
	aP9VRa5AbFx9jHlosGf0KUFV8zvQ2v9+NnUKz0Luq+GPUdX/4aNEvv/wwvMUorQAjvKcnJMW0M8
	54EaE2HZnga6o4QAFXd1NSlgswJl6+prkGB+sSGCH3A67ZXJJps7FKsU6d984XQrbJzQfSdcX5O
	v0Qcr8XK6uaCnq+UHb0IC6xnibzouHusyKd6GS5nJG8Qes1Rtv4+zoNHTzD7n/dOudCc0oOIwqb
	U6R07HFUAmxKmt6+O7HTOj294l3EXrEM=
X-Google-Smtp-Source: AGHT+IEok3JkRuMAdY7AX3j0CwwrHcGk5yIN66Gyo2mCztRV7/vmj7BLBPHvxLpcqnHCDGsjiMhyVg==
X-Received: by 2002:a05:600c:1d07:b0:45d:d609:1199 with SMTP id 5b1f17b1804b1-45ddded6ef0mr31784415e9.30.1757183981627;
        Sat, 06 Sep 2025 11:39:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm373687575e9.23.2025.09.06.11.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:39:41 -0700 (PDT)
Message-ID: <2377eaff-6142-45ef-a966-0176c147c094@tuxon.dev>
Date: Sat, 6 Sep 2025 21:39:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 13/32] clk: at91: sama7d65: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <676e618850df0db8dd880c36cd9b6dcef7b17b8b.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <676e618850df0db8dd880c36cd9b6dcef7b17b8b.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_113943_083353_171691AE 
X-CRM114-Status: GOOD (  20.00  )
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
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch the system clocks to use parent_hw and parent_data. Having this
> allows the driver to conform to the new clk-system API.
> 
> The parent registration is after the USBCK registration due to one of
> the system clocks being dependent on USBCK.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama7d65.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index f10faabc7ffe..1553dc3152a4 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -533,23 +533,23 @@ static struct {
>   /*
>    * System clock description
>    * @n:	clock name
> - * @p:	clock parent name
> + * @p:	clock parent hw
>    * @id: clock id
>    */
> -static const struct {
> +static struct {
>   	const char *n;
> -	const char *p;
> +	struct clk_hw *parent_hw;
>   	u8 id;
>   } sama7d65_systemck[] = {
> -	{ .n = "uhpck",		.p = "usbck", .id = 6 },
> -	{ .n = "pck0",		.p = "prog0", .id = 8, },
> -	{ .n = "pck1",		.p = "prog1", .id = 9, },
> -	{ .n = "pck2",		.p = "prog2", .id = 10, },
> -	{ .n = "pck3",		.p = "prog3", .id = 11, },
> -	{ .n = "pck4",		.p = "prog4", .id = 12, },
> -	{ .n = "pck5",		.p = "prog5", .id = 13, },
> -	{ .n = "pck6",		.p = "prog6", .id = 14, },
> -	{ .n = "pck7",		.p = "prog7", .id = 15, },
> +	{ .n = "uhpck",		.id = 6 },
> +	{ .n = "pck0",		.id = 8, },
> +	{ .n = "pck1",		.id = 9, },
> +	{ .n = "pck2",		.id = 10, },
> +	{ .n = "pck3",		.id = 11, },
> +	{ .n = "pck4",		.id = 12, },
> +	{ .n = "pck5",		.id = 13, },
> +	{ .n = "pck6",		.id = 14, },
> +	{ .n = "pck7",		.id = 15, },
>   };
>   
>   /* Mux table for programmable clocks. */
> @@ -1283,10 +1283,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   		sama7d65_pmc->pchws[i] = hw;
>   	}
> -

Worth keeping this blank line.

> +	/* Set systemck parent hws. */
> +	sama7d65_systemck[0].parent_hw = usbck_hw;
> +	sama7d65_systemck[1].parent_hw = sama7d65_pmc->pchws[0];
> +	sama7d65_systemck[2].parent_hw = sama7d65_pmc->pchws[1];
> +	sama7d65_systemck[3].parent_hw = sama7d65_pmc->pchws[2];
> +	sama7d65_systemck[4].parent_hw = sama7d65_pmc->pchws[3];
> +	sama7d65_systemck[5].parent_hw = sama7d65_pmc->pchws[4];
> +	sama7d65_systemck[6].parent_hw = sama7d65_pmc->pchws[5];
> +	sama7d65_systemck[7].parent_hw = sama7d65_pmc->pchws[6];
> +	sama7d65_systemck[8].parent_hw = sama7d65_pmc->pchws[7];
>   	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
>   		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
> -					      sama7d65_systemck[i].p, NULL,
> +					      NULL, &AT91_CLK_PD_HW(sama7d65_systemck[i].parent_hw),
>   					      sama7d65_systemck[i].id, 0);
>   		if (IS_ERR(hw))
>   			goto err_free;


