Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ABDCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WnrihOd4AsebH9UmcXUF+DGII/SVijUJ5cnGJII058=; b=R9o2F96IoVjd7XJXSeMUv6Jfto
	IQtabphLWc6RgK4oTijalFE6egoZhQvAKgNIHaHMndlSyC91ZGAcO0xh+r76MwVVTGR/HvRvbqo2A
	Id1GsmJjpSyuN/XoxhbYzu2V6yJn0DhhzgOZj54DGC+++/0/T4W/qJFC5+dMYubZBwcpN2wTzNzUf
	gx2hFZg8eFB/8kcEC7uSfWMcekMgK/MvOMpwfTQKZUcJIVNxO6pwXQm29nJUU6SjW3E04tjIifP2D
	zF4hYaVzCiH0pP6xRuCsxgQU5D+KhcugddM2KGcEi0mbGsN2pBdZ4oDv6vhuuuf7yd7PT8S595OZz
	JROG0YUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmt-0000000Eokx-2frl;
	Mon, 20 Oct 2025 19:43:23 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvmr-0000000Eojp-0HA3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:43:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b3b27b50090so857457766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989399; x=1761594199; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8WnrihOd4AsebH9UmcXUF+DGII/SVijUJ5cnGJII058=;
        b=CfGaH2bWG2O+j9wLiuaPhPYM9FACCgH6PkDBHqpjRwPawTH399aT+W/kZo3rYetX0x
         laeeBNpsOnUm6NxJagxs+kUDB99pbLKpA0QTLbR7EHnxD1UMrKEpHR894YKaKOlq8s+H
         xdnwZ+SHBAHY4QzeX8UCdQei58+eJYWOFf8kjozin7nrLnxCIaF6z9W0EAjT6PT9Al68
         owBgV6Fl1uTmYT+xvSZ6MZeLajh5Jo5ZzUoSZhorMVypr0DCOIaKhzmKg3rIAYT/IsX2
         JiRRyJ4R7WU0IeyDAJbrnmHT7TI/8J/Eps/b6lo9H0sC0S1Y8fcBoLoVPkIcVRgpWx8M
         6DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989399; x=1761594199;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WnrihOd4AsebH9UmcXUF+DGII/SVijUJ5cnGJII058=;
        b=Mi9eSeKIF1jqcC1UxLWrR+R7Si3wlq/npFkliBs0/KJ0qaJ8ISAK1ZJd0GsQSikJ8k
         KnVs639md/CWlwdP/kK6/5JQEdBxikzzegmPQhkziYMUiMXMXKSY4NyFjcIwFhIdayTR
         RuOxgpSv9mJFsd8cLZXgsDEGD63SR3Kd9cX/RxmOfbqgybkZSJyhIoaGfloqkeM/zV58
         /a/MzdMl1HxAD3zYZAdgvT/FhyW1VganpYHAw4nCRO0RZ2c0AVUM0a/4XKU4HD2EQ/Jj
         gH12RXH6A/leaKtPr8h0eCUDdg+0Fcbj5PEDVpVhgCx0lO9fz841D1QJ4lRMQZfqfCp4
         I7/A==
X-Forwarded-Encrypted: i=1; AJvYcCUp1wOAErkDc+gQmJDpxNxXkR8iE80ZD4OPEj2yquAs4KfTYtbQ+iOnr/srZhdeHg1mNmXMaAeX6y7HHuvWoy0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7SDi90DPdcUZAAkvcIa3CGHFOkPOp/iuFr31A23pa22H0qYRD
	TKMBTLjXVQrfRQEazTX4PKOqUKcosMF6G1boNIWOiPkkLWDibh9M4GAYs2ut/aopxzA=
X-Gm-Gg: ASbGncu3BN2xnmdrJGEERMPbXi8r5psbnDEpNZuGsMOQwSMGUQ0tZWTG835IQz0vFqO
	KUfIEwsauUTqxzK+nocr9l9UM18N6HGUr+gUKqZrsQlcQOCtbg49A1E7V7cybP+zB6PO0PZI1gk
	CmOGZlo/3jEh9aoTah+02wyID0+oBcffFdfJbKIy9GICF/tEiUyqfsfVix59nMbIIN/hyfurOGD
	3VfV0L0tEB+WT+l+lmPCJdmW05g5jRfVE8IUlaMYR9oIajc079VOlj7MDeWapmpDYZCBASZHTua
	xIxYu2WE8bpu7TuzBBGIb7xNfRNGpJodbFsxPayYtwL4FMECCcAvtbxsY9/ocmBhttgp0TUZjgG
	pmf7oKLobzEdI3kYVLfICNRSttmYmQhZh+3nt05TVoPQbsjdSNtafmpku1rYHpC+PdwFfNI/1ca
	ltu7u5YnDHLsHSa8G9c+0=
X-Google-Smtp-Source: AGHT+IEA4WJiFVCo5i3lXWM9cTARgkcQvZpClBs7kLwlr1bv/oiPFR5QlLTNGP2c3IF9GX6YbAtlWg==
X-Received: by 2002:a17:907:3f89:b0:b0c:1701:bf77 with SMTP id a640c23a62f3a-b64732424e1mr1670530466b.18.1760989399157;
        Mon, 20 Oct 2025 12:43:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb03649dsm868542666b.50.2025.10.20.12.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:43:18 -0700 (PDT)
Message-ID: <26ea14dd-d331-41ee-b5b0-865918aa7690@tuxon.dev>
Date: Mon, 20 Oct 2025 22:43:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 07/31] clk: at91: clk-utmi: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <87a3e3615345c975acc669207cd8bd9f849b0fb0.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <87a3e3615345c975acc669207cd8bd9f849b0fb0.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_124321_134937_5362A03A 
X-CRM114-Status: GOOD (  19.93  )
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

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-utmi.c | 16 ++++++++--------
>  drivers/clk/at91/pmc.h      |  4 ++--
>  drivers/clk/at91/sama7g5.c  | 21 +++++++++++++--------
>  3 files changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
> index b991180beea1..38ffe4d712a5 100644
> --- a/drivers/clk/at91/clk-utmi.c
> +++ b/drivers/clk/at91/clk-utmi.c
> @@ -144,7 +144,7 @@ static struct clk_hw * __init
>  at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>  				struct regmap *regmap_sfr,
>  				const char *name, const char *parent_name,
> -				struct clk_hw *parent_hw,
> +				struct clk_parent_data *parent_data,
>  				const struct clk_ops *ops, unsigned long flags)
>  {
>  	struct clk_utmi *utmi;
> @@ -152,7 +152,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>  	struct clk_init_data init = {};
>  	int ret;
>  
> -	if (!(parent_name || parent_hw))
> +	if (!(parent_name || parent_data))
>  		return ERR_PTR(-EINVAL);
>  
>  	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
> @@ -161,8 +161,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>  
>  	init.name = name;
>  	init.ops = ops;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>  	else
>  		init.parent_names = &parent_name;
>  	init.num_parents = 1;
> @@ -185,10 +185,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>  struct clk_hw * __init
>  at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
>  		       const char *name, const char *parent_name,
> -		       struct clk_hw *parent_hw)
> +		       struct clk_parent_data *parent_data)
>  {
>  	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
> -			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
> +			parent_name, parent_data, &utmi_ops, CLK_SET_RATE_GATE);
>  }
>  
>  static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
> @@ -287,8 +287,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
>  
>  struct clk_hw * __init
>  at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
> -			       const char *parent_name, struct clk_hw *parent_hw)
> +			       const char *parent_name, struct clk_parent_data *parent_data)
>  {
>  	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
> -			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
> +			parent_name, parent_data, &sama7g5_utmi_ops, 0);
>  }
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 13d125793216..ee77c14e8b25 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -302,10 +302,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
>  struct clk_hw * __init
>  at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
>  		       const char *name, const char *parent_name,
> -		       struct clk_hw *parent_hw);
> +		       struct clk_parent_data *parent_data);
>  
>  struct clk_hw * __init
>  at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
> -			       const char *parent_name, struct clk_hw *parent_hw);
> +			       const char *parent_name, struct clk_parent_data *parent_data);
>  
>  #endif /* __PMC_H_ */
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index b1b0e9e67228..dde662a6133f 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -976,10 +976,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
> -	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
>  	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];

This should be part of patch 6/31.

>  	struct clk_hw *parent_hws[10];
> +	struct clk *main_xtal;

This could be moved in the for block where of_clk_get_by_name(np,
main_xtal_name); is called.

