Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFA3D7977D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAy/xjG0jQvcp2oMgNIXt1SmQl8mW6MQn9zpPH2hTM4=; b=DsPhU9IY0/8RGvlQTTdrbXrCdp
	0mrFyfAMrFBscR24fIAfkuwZGZ/LqjYX7tkxSKcLwqclK8zcJ9O5X/wdTRkc+glcWv1KyPRIklmk7
	kUqnNXap8Fmy3Nrre2S2++Qff3+sogqpepcE9HepFkGdZQbx/QPx6ekRuljOOES6CJRVXv7JcEd67
	PVaoZEdkT0OGcU4bm4eVyF78P4ds0xFFq1iKUtGHA3RuDLem9XMVSnBnVfPJA9QpBY5NWSVrrvhCC
	Vu66HsjBWheqFMDS2xSPCkFUM5Iv821qfsHAFxfzDRqqVicpagzFMriPkgQXOI2a+UJae5Igh9VG4
	FHd91nyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDAA-00000002lUL-1lxs;
	Sat, 31 Jan 2026 15:45:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmDA6-00000002lTO-3vMy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:45:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so30406025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874325; x=1770479125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAy/xjG0jQvcp2oMgNIXt1SmQl8mW6MQn9zpPH2hTM4=;
        b=LAGxax0d1flUOE1jOBeMlhlibK2NY3OIXoudoq/h6v4YqrJ57wnr0qi/CuhBw6EySG
         0tzM0udhPiHYbRL2N4txBLR7u0nL/xRdwd5wkBtdg5sThjAwawqz74TAB+18RUuVmjmk
         02x+gwbFGfnBLlaxjl1lC165IMLDC6aCgyVPYnyBm0TACKaOvlsTkkq4pMb0CHtxgX4R
         4dJXAegZ4D8hysZWnPjjqhPlZVlkOM/Rlo/Hn7+8MSBRWkqdGOQ6wShkiKlm79j5cXHw
         AKwddPBUkFiaSFdzqjcGDicFW/dD16l82kndVq79FkWU0e2+su7FW4tXuWdoV1PUxaUt
         dB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874325; x=1770479125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAy/xjG0jQvcp2oMgNIXt1SmQl8mW6MQn9zpPH2hTM4=;
        b=MrDmdSmhe3uciiW++Qzt4iVY3z40posXMMxSHvj9qVsvQEATF17xbd6Bf0sJiD+LTg
         zQd/rEZ/NThg/Tkt8Lmfss7SzJys/HcCGDXMhdNs63ZYEL/5XGYrdjQXZmK0m2+1cg+j
         zHXlfqg+X9Ks626uk3jmyzS80PUnaXzBOKpLbngqwnNCtK+j1Aqm2y42ZtYRH06AAi0B
         rI8CYtPnbvd0SwxQAzu7NkSv10hWypAbTy5m89rYY8S3lmTwPzdUMNh69T8dXm9UR9P0
         RFyqoYxy6nhzSqsESRy7iH7L3scSUttOPkPY1L0jOSPSSSiSGISHj/cUi3I9j8PFfN0k
         mDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV49kJDnS8m36pBLO1UOnq9rgpgiHMgY49z+8M50co2aLT4C+4y1a2fVW1u1IYTC/pT3CSqdJW1fZ8WeIcGs+7s@lists.infradead.org
X-Gm-Message-State: AOJu0YyURYKExR8i2xa6qR76DpuwDZmroIxFkmJZF4OYI4AMVkq0b7qp
	4kb1h6TIN0gRRocrQnvIgjvd1h0Rqiuzl37TdySYC1KyO29wt8dZcJhFJ7LF7IN3EII=
X-Gm-Gg: AZuq6aLEQJXlKktBLP1QlAKURG4S6EO1kDhRa20lJc2CL1cNGBJoHDDwsiXfcgM4eK0
	FpVAi50K3LDbcqBlg1Lpwo/EazHP/fduMHyCditJlUZKJ2g6x286ASCMrXc6hzNC8DkhRMZO1K7
	Udz7yBAVoUg6DUiQZATqFb+kWWiwxbQHjbnJP3ZSKK2H2GUl2ipySMLGp6THxaNYr5hCQRbfQAa
	0z0f3o/fHXOFNt/plaE4JT/Svz3215wF82XmPjRBWOpuTd2DR3ZeMfWcertkL1gQCGn9ChQSguv
	obFTV26ySl7Mx2e8YrDOcjbhQ5lP4Cqt2PWaKbmroAwaddzQkwwmjnIau1IMp3yXJ30dlOLxf6Y
	y3QJ0jKFn0oSfLK+jkfLz7RNxVpL7qHWaB8CZ5YcpmES5HSXZWdJLlka+Tjchz6tUUSMPTGT86O
	qfKMTNcX/hLost2t5A++R4tf9htg7E
X-Received: by 2002:a05:600c:19c8:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-482db45fd8dmr79378285e9.13.1769874325013;
        Sat, 31 Jan 2026 07:45:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm316944865e9.7.2026.01.31.07.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:45:24 -0800 (PST)
Message-ID: <ac4891ec-79a7-47b8-afd6-106b9ab7cba3@tuxon.dev>
Date: Sat, 31 Jan 2026 17:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/19] clk: at91: Add peripheral id for OTPC
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-8-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-8-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074527_007471_82A1AD30 
X-CRM114-Status: GOOD (  16.70  )
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

In patch title:

s/Add peripheral id for OTPC/Add peripheral clock id for OTPC


On 1/20/26 16:37, Alexander Dahl wrote:
> That peripheral clock is required for proper OTPC function.

This would have to follow the submitting patches rule (check the document shared 
in another patch). I would re-write this as:

Add the peripheral clock IDs for OTPC. This clock is required for proper OTPC 
operation.

> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u

Why is this mentioned here?

> Signed-off-by: Alexander Dahl <ada@thorsis.com>

The rest LGTM.

> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - new patch in series, was not present in v1
> 
>   drivers/clk/at91/sam9x60.c  | 1 +
>   drivers/clk/at91/sam9x7.c   | 1 +
>   drivers/clk/at91/sama7d65.c | 1 +
>   drivers/clk/at91/sama7g5.c  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index a9f293a8e3b26..11f16126ff9e9 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -146,6 +146,7 @@ static const struct {
>   	{ .n = "isi_clk",    .id = 43, },
>   	{ .n = "pioD_clk",   .id = 44, },
>   	{ .n = "tcb1_clk",   .id = 45, },
> +	{ .n = "otpc_clk",   .id = 46, },
>   	{ .n = "dbgu_clk",   .id = 47, },
>   	/*
>   	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 9a5afd258cb86..c4d2b022d9d07 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -407,6 +407,7 @@ static const struct {
>   	{ .n = "isi_clk",	.id = 43, },
>   	{ .n = "pioD_clk",	.id = 44, },
>   	{ .n = "tcb1_clk",	.id = 45, },
> +	{ .n = "otpc_clk",	.id = 46, },
>   	{ .n = "dbgu_clk",	.id = 47, },
>   	{ .n = "pmecc_clk",	.id = 48, },
>   	/*
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 5d8973aa50a53..52467d629258f 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -641,6 +641,7 @@ static struct {
>   	{ .n = "mcan2_clk",	.p = PCK_PARENT_HW_MCK5, .id = 60, .r = { .max = 200000000, }, },
>   	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK5, .id = 61, .r = { .max = 200000000, }, },
>   	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK5, .id = 62, .r = { .max = 200000000, }, },
> +	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 63, },
>   	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK9, .id = 64, .r = { .max = 200000000, }, },
>   	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK9, .id = 65, .r = { .max = 200000000, }, },
>   	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK7, .id = 66, },
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 9a6f0f30b2b7e..3e0cfd2613851 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -504,6 +504,7 @@ static struct {
>   	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK1, .id = 64, .r = { .max = 200000000, }, },
>   	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK1, .id = 65, .r = { .max = 200000000, }, },
>   	{ .n = "mcan5_clk",	.p = PCK_PARENT_HW_MCK1, .id = 66, .r = { .max = 200000000, }, },
> +	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 67, },
>   	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 68, .r = { .max = 200000000, }, },
>   	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK1, .id = 69, .r = { .max = 200000000, }, },
>   	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 70, },


