Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106D5CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/rHfvCGQ7vSJJOElRUDluOOr/mXgiutMeNr5c1rvEw=; b=Mnl9ro2F16+kJYPL6MbJmQyfzq
	klUltCh4Rh8DhnSmbkmle7CeBwFg3w12VqDWFMDn/ef1OtnC7RbiLLcoWDMKmRcmFwMCXa6sFWeY3
	WDqaezhLGX/GEnYS8wqNwpEbnXKLO+8xmPfvDZNx+W3zjBon47eYVFjbRykr1hIM028o8zCDxKe1Y
	oqOYUzYq+S1odPFo9swkeqo8su6O1KVECtfbPCxcJiBW9hrXiwD6ABTHNpeVQLHY9gzLrvXSYWBUc
	K2M+KwvyCRgLHkbYwcDVN0Yn33loCZYGvZ0brpJhfS0MaKFUXIOuJYTyptIMWArzGXYI8rNkhCsid
	/PXvk7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvnw-0000000Ep0q-1uMh;
	Mon, 20 Oct 2025 19:44:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvnv-0000000Ep0Q-0tfc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E/rHfvCGQ7vSJJOElRUDluOOr/mXgiutMeNr5c1rvEw=; b=rSmo75K1KRcYZ5cNtCm/rLqxXf
	BYaFLakpyfj9wWJm07ChNa2XdAXvcBckbPp1uW5LyCJznnxlNfnLZbDZE/Xqa11eBBHp2ubnAcLS0
	mTKN/1FIzL1eCVid3Hu7jEAYxtJt9vvyyUHJja4hQNvU4tWsI5wUJ5S1+bJPg0bEU/CGQW6rtDBVM
	XHRA/wyRmSNyImVP15MxsaxwQSEV5++cP+H1VAtjY49nkXH7b9G6eDApnC4UKbsLrrnOP5LCegH8k
	rlbb/lwbKPCENgk8zsgKarVbFIv1GbP9LrOjrI0kfc7hRB1qYWIWWCDo7V1kNH3aPla8wacdQ6JhC
	dDs0C6ZA==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuwC-00000000Amm-0IUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:48:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-63c0c9a408aso8595623a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989463; x=1761594263; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E/rHfvCGQ7vSJJOElRUDluOOr/mXgiutMeNr5c1rvEw=;
        b=PA+uqGwDgnRrg7hpv5RcByodeqYgnGO62GwbhqV8u36fmFRi871bVYkgOhdIwOg+dx
         yFUSKxw+z2yzXbvBk4pTha+b8iC5w42Ny888UaXCJqBiS9QTe8D39EUoFL83gmUaEjd4
         onZHzK7kibzrtbDOm3UD1cHi4G1awdDyl3xCUgA9NQq92WLsAtqXPsU1S+k9nXWlj0i+
         2mt6TdSWguPvkopaoMbAXc4nB3DRY0dAkkrcxUnN7unsojIUhI/SpxOUMuONFDqV7SFC
         XaYoJZcujfD43Js2jP4nP6tnABjpSfuA8CDQ5WjcA/K78azCAhphIWejIryz3KUD4FB2
         kLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989463; x=1761594263;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/rHfvCGQ7vSJJOElRUDluOOr/mXgiutMeNr5c1rvEw=;
        b=quU4Fg0fAADhssrfFm3Vz2CGJMFHajKQolkKkiry4W4dx8h7hWS78T8V46T501QBd4
         jEbRv+fgtEMapap7DbM96HEJq7/3eVMMqFvHSmxrJa5pHEwtBWRbEt7OPvtipd8qBHGZ
         0wkk/w6fO6WTIKIgcrFbmMRvp1EiqfZsz5hIiGsFsfxER6QEwjDP/j+r0Xf98F62CWGO
         h2RyuvlSVLTtUHCaf9c2R1dSE7j9SpY1qZ0z3VAeFL51RD/PmBIczSYw8fdGdfJqqKDG
         e8hkY1yePf2zq0BFWLKhw4slvRQ9LPRztPO/wkC4LT2dboqA0u5qAe6CoZdTPFLzBx5p
         YcLA==
X-Forwarded-Encrypted: i=1; AJvYcCUuv9AOlmcfbCi1ZgbCgO6Q0AtvtC3HexyCGF/T/tfXIDWG5083WBemFtiMlIPQv/XNNFrIL9akN6XifuC16nIj@lists.infradead.org
X-Gm-Message-State: AOJu0YyLuS0hpTxRiGEy7UA45uB5LjwcCklA9PZVKkEriVt33+srzqO/
	UvWDSZsqnUGG+NqvX/60BL/SxvV6gUB78YBz05AZKsCv0jJ0ri/Q/+ei08heLCFRQvE=
X-Gm-Gg: ASbGncsXDLw+WkCVo0MSVjlqBPRCtZhv0Cq8oTcrUuYDX7CcMuw1KyZpRpS+M/hsTq1
	Pyz8XVfqyM2QZ66pcZdReC/3K055zDnygXP6mXk49PKBRxl9eC/GNvq2/loKmx5/GCf2cTn/gF5
	0Xl0qm/6wWAuVd6BhIrNIjAvXcgeBgM6oH/FG5/OMG1l8KX19Jzzi5L0z6ETcrs+FDSv+3HxjXl
	1ASPF6SFpu4zM1b0U7ReZFTL/QKdzawaghyTybYEfqOukf8WZnd1zV5nev0rZCyYMQ55g7qVvzg
	TJg9FIE0Q2W3D/WQesluSj1wkrH0bIAjaiBDRgN+0UOjP0RUqOjDNENxBpSX2jrjWzVDvVc3IH+
	y83LjGxjJMu9hVz5mWNJwvdfH996vr1zutCxsDw9/eSDRqtqSAar0ARkcLzjbVAHBLrpzyRsyeq
	W+X+/ejdsV
X-Google-Smtp-Source: AGHT+IHJmKY5JzYa17Wwq5eRnrHMWSM06j/Es4HUtYcSQtsu62W1SioDH4KU66ZTBqpLPBdqBNGQ5A==
X-Received: by 2002:a05:6402:2551:b0:62f:2afa:60e6 with SMTP id 4fb4d7f45d1cf-63c1f64ececmr12589171a12.7.1760989462748;
        Mon, 20 Oct 2025 12:44:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab54fbsm7278599a12.15.2025.10.20.12.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:44:22 -0700 (PDT)
Message-ID: <9656db91-b930-47f3-bdca-ed42f066aa8e@tuxon.dev>
Date: Mon, 20 Oct 2025 22:44:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 08/31] clk: at91: clk-master: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <160f139d5a5647104826c5878ca077faa26916bc.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <160f139d5a5647104826c5878ca077faa26916bc.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_194856_189684_5CC3C9BE 
X-CRM114-Status: GOOD (  13.06  )
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
> __clk_get_hw will be removed in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
> SAMA7D65 SoCs. As well as add md_slck commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

[...]

> @@ -752,15 +752,17 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>  	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> -	struct clk_parent_data parent_data[2];
> +	struct clk_parent_data parent_data[9];
>  	struct clk_hw *parent_hws[9];
>  	int i, j;
>  
>  	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>  	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> +	if (!td_slck_hw || !md_slck_hw)
> +		return;
>  
> -	if (!td_slck_hw || !md_slck_hw || !i)
> +	i = of_property_match_string(np, "clock-names", "main_xtal");
> +	if (i < 0)
>  		return;

The diff here should be gone from this patch if handled in previous
conversion patches.

