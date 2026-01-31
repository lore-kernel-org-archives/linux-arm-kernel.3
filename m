Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A260ED7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXzdqZpn69X29wR/M9YsEFGq4gfj5xwE404NDbdUoVU=; b=w/L6QIFQ6c5EJAoPouPaKcLdoG
	E/hrP1aRNeprotyGLBAihasHGnuSgJZO64NSbEmA9E+hZZfdlqWmRPZ6eoQdUEYRo83Mh+7QH1MfB
	cHIWTPt0GN/ljcNagc05diC3ekTaPxWMz0rlfzkmoYEtZ2IGvbRMoWIwtYax1IDxYxOLEOnrunzVh
	o1FAZniZxtJ0b7dOcNT8JaKes8qITDo1FSb8tSCkRyLJ4s4OOwoRLEpEpfnxZj3zghfaFJ13NFsk8
	m9DR6ZJtJvi1YR2/x7GgStV25FLc4utcG4eKYsbJPfZdMqWtxS88TYEUB79mhlbADWI0Yg39vEIsz
	wCefFyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDAS-00000002lZY-10dQ;
	Sat, 31 Jan 2026 15:45:48 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDAM-00000002lXE-12we
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:45:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so4396737a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874340; x=1770479140; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXzdqZpn69X29wR/M9YsEFGq4gfj5xwE404NDbdUoVU=;
        b=EyccgbY5fvIm8BoXgIwZ4aNTlKOQcAQnZt7iYtp6hpRvUFwebGjzXYIJz7O9pbK6ZL
         5r/W2FNE46Ibw9oyDvKAfHONK7RrEAJFcYQIzcX6nxcv7rYor5pJ1UnUx9waMZQ0REcO
         3pbF/xCucHZ9hgr8tdpQk7LmfIGQ1cm7vAzZW01HawllADWQafr9TYYj42KHj0vOQ0tk
         GiDragzjFlI0bXLrIzp2ckm69eKzWypz2E9O6WjpRIhiTU8UKN+YcXbFNJyHzEAmFA3f
         sLZK3nNxepddDNa3eKuOHIVythVpbCTaEFU4iqHZ0OOqiMdo4BnakXMbUS6LC9qDTd6z
         nKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874340; x=1770479140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXzdqZpn69X29wR/M9YsEFGq4gfj5xwE404NDbdUoVU=;
        b=XOzDLXmBBE5FdCE27KOHlCytoFUknb4xrmc83hyLohQ7pdTasVpVoDuu8e0h9vEjen
         I8KaSCPIDLy+MvlxjJ2ILTkbWhZzpzaNRPK6GJZKr+fPNY1/8HRsH0kKSahnzrmXOJPl
         w962gM/52a2sLN3+TMC6fiH3J5kevZ8aAnU2zewlxmg3E+3FKt9ah8386BpLCNkjasEK
         Evdmu2YB7hOaUKVVFDhnPmuOMhpe95PeAzElHt5wbaszfPFs3DvE5Wm+jVJ8MJbuBVRP
         vKfDIzngBqJhgsBetkIKH4GSYfVXVocJsUmyNQhQ0xcFopRaUmeD24WHihTcDznapthz
         8Xrg==
X-Forwarded-Encrypted: i=1; AJvYcCWazdV9B93846htGSBUR30M9wxT9jE2omXQdSJEuAsFD1dVWaWG4DacvdrdnjtJyrR5haP/ZdMqOMxWDhOugTfU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/tUkx9076nythZ2s+LziSsRvtOlpneuCaIijN+QfP3xSEgiN
	xUPD3eVzns21W2lv5mHQHwWpKmdlMLR+roYuNtoJxCaFndoNXI5GvslKs7BBBSfi5Co=
X-Gm-Gg: AZuq6aI27M/VKcBZ1C8Fe02kn1HJVoD280MrD6N1D3rPQ1KjGMHsipgq8U/zszEQ3OX
	+E9VFtuRLIjkDzCqnTraOcJ0992gAva0K2co1geLTdLiuK7fK1K9SFKnwmZdy+Wy+cvRU9tbV6o
	f/OgmSNI1qrQUND0rESDoBmUux9urnlwO29MJB7x110LnyDVt93brnNMN0OBBk4y8YztB0h8GCw
	oTx5ibXfbnMIKe0MDy0f6XUpjg71PjL3cU9/YFHdTjfOyNPCpd+C+MUMePk/fZsPinwrTYLOKc7
	HVs+RT3Wjjds0c77bjSvdxmxkbzvvw+G27QoYgdGLa5ORPZyNgWHD74grm58FmDMWck6P1pTu69
	V6E0LROrCxQGPzsHf+rpxr4arBAxoC8vXChSQiAVRs3B3I7qbiU63tqnhNHJru/8VNfBlhTQWxI
	3Me/7vg5BJNnP6bquC4Q==
X-Received: by 2002:a05:6402:3643:b0:658:bf8d:c946 with SMTP id 4fb4d7f45d1cf-658de5aa8e4mr3016168a12.29.1769874340352;
        Sat, 31 Jan 2026 07:45:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm5455327a12.35.2026.01.31.07.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:45:39 -0800 (PST)
Message-ID: <6d68a46b-f43b-4248-8031-58192da26c2b@tuxon.dev>
Date: Sat, 31 Jan 2026 17:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/19] clk: at91: Allow enabling main_rc_osc through DT
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-7-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-7-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074542_322606_5A58D97A 
X-CRM114-Status: GOOD (  20.56  )
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



On 1/20/26 16:37, Alexander Dahl wrote:
> SAM9X60 Datasheet (DS60001579G) Section "23.4 Product Dependencies"
> says:

s/says/states

> 
>      "The OTPC is clocked through the Power Management Controller (PMC).
>      The user must power on the main RC oscillator and enable the
>      peripheral clock of the OTPC prior to reading or writing the OTP
>      memory."
> 
> The code for enabling/disabling that clock is already present

s/that clock/the main RC oscillator clock

 > it was
> just not possible to hook into DT anymore, after at91 clk devicetree
> binding rework back in 2018 for kernel v4.19.

I would re-write this as:

however, after the at91 clock device tree binding rework in 2018
(kernel v4.19), it was no longer possible to hook it up via DT.

> 
> Do it for all controllers with an OTPC controller, where the main rc
> oscillator is required for proper operation.

I would re-write it as:

Export the main RC oscillator for all SoCs featuring an OTPC controller where 
the main RC oscillator is required for proper operation.


> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

The code LGTM.

> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - split out dt-bindings changes into separate patch
>      - extend to drivers for other SoCs providing the OTPC
> 
>   drivers/clk/at91/sam9x60.c  | 1 +
>   drivers/clk/at91/sam9x7.c   | 1 +
>   drivers/clk/at91/sama7d65.c | 1 +
>   drivers/clk/at91/sama7g5.c  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index dbcdb1d2161a9..a9f293a8e3b26 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -227,6 +227,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>   					   50000000);
>   	if (IS_ERR(hw))
>   		goto err_free;
> +	sam9x60_pmc->chws[SAM9X60_PMC_MAIN_RC] = hw;
>   
>   	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
>   	if (IS_ERR(hw))
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 07eadb712a1e4..9a5afd258cb86 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -764,6 +764,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   					   50000000);
>   	if (IS_ERR(hw))
>   		goto err_free;
> +	sam9x7_pmc->chws[SAM9X7_PMC_MAIN_RC] = hw;
>   
>   	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
>   	if (IS_ERR(hw))
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 4ccffa8db43a5..5d8973aa50a53 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1135,6 +1135,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   						   50000000);
>   	if (IS_ERR(main_rc_hw))
>   		goto err_free;
> +	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 99b4c1d9bdcca..9a6f0f30b2b7e 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -1014,6 +1014,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   						   50000000);
>   	if (IS_ERR(main_rc_hw))
>   		goto err_free;
> +	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   


