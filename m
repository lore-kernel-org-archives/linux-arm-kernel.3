Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD4ACCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=394T93MvlNTwJ4OmrNSHdthp7AqCvywv9bIug30d09M=; b=CcQNsLKcKSAmSuHl3S4tsR6eYn
	pwroaNEMUA20WPeyuDk5k3F8qtZttS+XbhuxNAj/2ItOz9fSD9gQW5a9kFdyrKej9YrMsUPUBh3kz
	021bwjTfcgo6yNFQprTdMi/r/9I3fl9OhXNXUI1cSnVFwpFbhnFgmV8zuREeHbbqYsrUM7Gb5XRC8
	R0mPKhRIvVKLTDISHlwgtn0XIiz8hmI5R+Eoz/gDWReecwl2+yvKdbXiuAcBngvBkBoIcdxaTLAj2
	XoV36YqmagBynxyLCZ/zRm+nvfMYs6xiW/1b+kUJYTFstRgk2Zph5arfLgt0fIZA6ho8nBY3eLyh2
	gEK+6G1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvKa-0000000EkOE-47YI;
	Mon, 20 Oct 2025 19:14:08 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvKY-0000000EkMz-1nTB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:14:07 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3d50882cc2so900741566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987644; x=1761592444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=394T93MvlNTwJ4OmrNSHdthp7AqCvywv9bIug30d09M=;
        b=OtnmC1SUGF/AXz/+XbAARK+0gS3CqsWm8buCjafbPBZ5Ffe8myWT8tUrPKgGbLfaIW
         YfaH1Gnrq2fk64efhO582g9YMV21FQhvSBWxAaLxHYYAMumhmDPbQPOK+tmuzOV4W082
         dn3i3RyZfJjtJuVTu2Zp1ic22H7Ee0GcQiCskoM9qAYoAe268yN0C5bQLyjZ94XKg+yG
         7ZksG0RmEw7xp1G0Au10CHiDGb5zIMmnFvkd0Nv/8b9wQfvWZaALVJPtfrMMsEhB+Myb
         aiaoG/zlp9L/9CCs0c2POVLd7JY7w6+nv1QcuJi8bUbsWZ6orHnLuZYZwMYHx72UiWe7
         wsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987644; x=1761592444;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=394T93MvlNTwJ4OmrNSHdthp7AqCvywv9bIug30d09M=;
        b=tbMtE29qqQ189CHFdSOHCrEgqUv1vN7x1ThKLN4gZ+uFtaW/Rx9iQQ5fy/C5U0HdzK
         2qI3wsh0ElWszWcbmtuZV9LHjdKB3DGclOp9vyRfGwprxO/kn731kh40OR7WKx0GF6p6
         HqEGLx6iLmuThffB6za344T37vYyT+bun57xXbQ5W/ainGITqZFSvSSBF+nHq3nn9TWN
         KAmnLHhEMSInnHwCvc4gemx83H2OF/rsAGItfMXsofgG01qYOLTfqzqX495VfAwLmAvq
         DGY1bub03teRbZj0JQJNOmzD8DFjJheCl8f8ymaLhQUlKQ2sqpiicA7DWOweUPkVTsRD
         edyA==
X-Forwarded-Encrypted: i=1; AJvYcCUROyz+1r/wK57N/4RTkIcaWQUyJaFQCVgoFBHX+ckrCvtaVZKYloOVwFkjzIT+6G1cxXhdlZhD59xIlxXqhpIO@lists.infradead.org
X-Gm-Message-State: AOJu0YxCXv10jKgVUCBw7YhCepDgxmUZsex1U2fKypdaKbwbXKfbwlLc
	DLwqrlEorACX78FbvbrLcflGtyX44LTHEY8MrbP80+gBIAvwEg5rKj4XvModd9ubrn4=
X-Gm-Gg: ASbGncsmLFAeUyh7hKPZ0IV3rwKucJt0pYwJkL7n3jY8BvuhuBXUdHYOy0jD7xftXlM
	AJzAN5qCH/poSWx5FHV5c9+5TjZ7ak6hB/KdpTZcth9TU7TqRTNq38dQNxqc8vg/XwzxdwFofE/
	WJmwrTDR9IJEHoIhqAQDn5AoTfFr6EaOosKZNEEFvDpvdICwe7m+vKhHN6+SuMzGtVt9yb8j14S
	pUPcdcHErR7y5Ytu2ec1rQ7ipIhNgEc4U8qQ/zTkVhju2cOoI4JGuY7MrQkpOkoC9b5YlQwGOmD
	/v7gf+BS3S86Pt8GCRcU5AtYBi/T2ujY3Au3U3OHtdZhrICUvbtmOJVZSATX9M4Fk3MFlI7niNS
	3TmF0HEcXYWhSM19Nra96IL6CkUi4xTTSpA3EtTz7W271hEKaFZ8m0YbfoRrh+rP78krpT2+jc0
	TzDI3NljFN
X-Google-Smtp-Source: AGHT+IGwCJgZYKC8FZLAT4kOm6dkEpwAC47hppBn//mgpxVSX8jW4DahXg//7RoX6AQwA7IGTbpD8Q==
X-Received: by 2002:a17:907:7ba8:b0:b41:297c:f7bb with SMTP id a640c23a62f3a-b647245844fmr1618450466b.26.1760987644536;
        Mon, 20 Oct 2025 12:14:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb525d1asm866441566b.58.2025.10.20.12.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:14:04 -0700 (PDT)
Message-ID: <88a560cc-4176-4674-b2c3-009af68f5bf0@tuxon.dev>
Date: Mon, 20 Oct 2025 22:14:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/31] clk: at91: sama7d65: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <cd47c45215f4c6a38447151222094616850a9d0d.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cd47c45215f4c6a38447151222094616850a9d0d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121406_488449_03E434A6 
X-CRM114-Status: GOOD (  21.45  )
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

In title: s/switch/switch system clocks"

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
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
>  drivers/clk/at91/sama7d65.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 986e8ef57dea..38c44b5d5d42 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -537,23 +537,23 @@ static struct {
>  /*
>   * System clock description
>   * @n:	clock name
> - * @p:	clock parent name
> + * @p:	clock parent hw
>   * @id: clock id
>   */
> -static const struct {
> +static struct {
>  	const char *n;
> -	const char *p;
> +	struct clk_hw *parent_hw;
>  	u8 id;
>  } sama7d65_systemck[] = {
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
>  };
>  
>  /* Mux table for programmable clocks. */
> @@ -1299,9 +1299,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  		sama7d65_pmc->pchws[i] = hw;
>  	}
>  
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
>  	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
>  		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
> -					      sama7d65_systemck[i].p, NULL,
> +					      NULL, &AT91_CLK_PD_HW(sama7d65_systemck[i].parent_hw),
>  					      sama7d65_systemck[i].id, 0);

Just saying: we could have been used parent_hw only for system clocks (and
some other clocks updated in this series) if we wouldn't have the dt-compat.c.

>  		if (IS_ERR(hw))
>  			goto err_free;


