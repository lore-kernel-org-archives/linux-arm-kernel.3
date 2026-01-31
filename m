Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB1D7977F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPTC9B9AxKZ/luocqmLIMukEnXXZUyNvVqk4iN/Kcvc=; b=OLtYvwWSQRq7bMR5dPIvENvFa7
	15XrCm5GP33ppB96USV7rL1HBFH+Thd7dV/LrwRKvaBmyOa05ypcsR8suQzoI6WhxpbX+AY2Idm/Q
	oVuOdLA5rNuREnU8+iv0mZLSf/70EQN/NafGvMBcnb1S9uffQeo45+fG0NTdQ3VwEzFpEWdvIWhdb
	VjRlPHh6DQJFWBbJJ1dDOIDGafXAj5phXKyAQjPT4fYU8H3MTR27Kkq8UMy9mF1j25rtGpOk3L7cX
	DpLVZyhe4laXYHFjPtbLYYAUD/dRkFsrq20xX+r6jPSNOhp0z0UPIA2nGF0wdDc0+hXS8WXTQrOOP
	0hHwl8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD8W-00000002lAC-1KuH;
	Sat, 31 Jan 2026 15:43:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmD8T-00000002l9q-1YwM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:43:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so2023079f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874223; x=1770479023; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPTC9B9AxKZ/luocqmLIMukEnXXZUyNvVqk4iN/Kcvc=;
        b=OzEoojk6kJgdZrb8xm6Rhh/xnhpArRxinu+4MGmg5suQb3yG09moU5PNZ5xl3siIFo
         pWBtF77qh8Iuq94zcHAaL8+lU6AzGnm8C8QAqKTxIROja4JHCHWcm6Za0Tr3Kouz4sqD
         a7OFOjJYJNvnxZLAkRR/PBzJXtsuFcGXBw7x4k+9aN0xZdk8wfwMIVbYvMcyxuNrQP/y
         xMzbxQZtEYSEjXW9qEOP1+KAk/xTid6lrqgCvZO/JI8vO7mlQXoAVLMl7clLZTaoGLqd
         qv3lh1xHgXpp83MQxOkHjTZ8ECFyAqvZXb7ppefyBxZgCkF7xp2BChvmObe1NHfK0GCo
         Q3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874223; x=1770479023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPTC9B9AxKZ/luocqmLIMukEnXXZUyNvVqk4iN/Kcvc=;
        b=uvco926EZVHNa5AF01ssw85niUrykOmzpt3tW29TzhgzOKV12vR/PKZ7MIao9UZNdv
         dYFeEOwyGCch59Xh3Nu6+Yf/DgJLlQaqi8coyDCjzxeuUZFcfxGceRSFWfirmBjqf1vj
         4OQe6r/gRV3G/K3qUCZ5wKn+pbjmNGUNqq6+UuDOZLpCkAgzhE8CG8mdRc7iJWHVeFXp
         QrGGnINhgbtU0U6+/nhVE/Fx6c3bFruVaiHO2rOSVj7PF2n+r2rwCr3fEt4dQWiTKbo+
         XvmLyiBlBdgXv+QNa3nyqeVkg97xWMC61SDDW7r856ffow+xialoIwctUmCAWh7/4Vi7
         pU7w==
X-Forwarded-Encrypted: i=1; AJvYcCUcRWFISBhBVCYdxuqgrbUzyCPi/rTvEC6j6EAPyebFpMUHev3IgvFl5luBl3bTqkFR7jhuxyyv+n38/s703pw9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+W9IChXWjlD5deWX3iA0OGXMRhPgjYEJDKb5H9V04QSPpobql
	NzzcSlVP/Tv9FnBnX6dBPgMw5VptvPjhoURY7uV7vZWYMRGRMVH3tSgNW8u7TlqFbYI=
X-Gm-Gg: AZuq6aJ5uyrjXWy49O7j1YCHA6mlSylmBRfFLSwdqtIljx9EcUf45ndsgNW1AEbVE3H
	UhdrptwFhXmo9JnRYDwkla8r8YlkV1kGtdYfVTHXjSXSZLftlk0Wsr5VyJnk3IsbT0xPmOQ3gYF
	1PLZY7b3Pu1zwNpjGykbXwGZjNQSttR3LvJWLLCf5hppqIG0iLhu9GSd4UXSwB8gpAmkXnieZlv
	vy7bYgrLUsCcsw7q+k9CI2aJJmezxyN8lj6tV3DXZYEhl4Nms4Gs9TcIxwr/Ffpm3qjDU0zlCoU
	CSq7J0IH2rAnxOwK8qi0oRQiprlyWQL5ii510LsFwnhi3bNuHQYPfxf1tFRWgr3TVCATwnAdzst
	vNPbgQ34Nph2hAuChce1iSki+Cm7MsgNKbx3F99qAh31YiWchdmuh2qfCOSS0MCKOndjP5RRFGP
	4PRxL60AaY/zweawCJSuY4tI0TmYvQ
X-Received: by 2002:a05:600c:6298:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-482db4bda82mr79391115e9.10.1769874223122;
        Sat, 31 Jan 2026 07:43:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm31026101f8f.35.2026.01.31.07.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:43:42 -0800 (PST)
Message-ID: <1f25e668-ff04-4fa7-a7fd-3ed3286edbe6@tuxon.dev>
Date: Sat, 31 Jan 2026 17:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/19] dt-bindings: clock: at91: Split up per SoC
 partially
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-3-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-3-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_074345_762270_9E0F9ECB 
X-CRM114-Status: GOOD (  21.10  )
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
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for some of the old PMC definitions.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - full splitup for all at91 family SoCs instead of just a few
>      
>      v2:
>      - new patch, not present in v1
> 
>   .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
>   .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 +++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 15 ++++++++++++
>   include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++++
>   include/dt-bindings/clock/atmel,sama5d3-pmc.h | 14 +++++++++++
>   include/dt-bindings/clock/atmel,sama5d4-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 +++++++++++++++
>   .../clock/microchip,sama7d65-pmc.h            | 24 +++++++++++++++++++
>   .../dt-bindings/clock/microchip,sama7g5-pmc.h | 19 +++++++++++++++
>   14 files changed, 219 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> index 84c4801df8d9a..8c89ccc3d6393 100644
> --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> @@ -67,9 +67,10 @@ additionalProperties: false
>   examples:
>     - |
>       #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
>   
>       reset-controller@fffffd00 {
>           compatible = "atmel,at91sam9260-rstc";
>           reg = <0xfffffd00 0x10>;
> -        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
> +        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
>       };
> diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> new file mode 100644
> index 0000000000000..ab0d0d7a3b655
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91rm9200 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> +
> +#define AT91RM9200_PMC_MCK	1
> +#define AT91RM9200_PMC_MAIN	3
> +#define AT91RM9200_PMC_PLLACK	7
> +#define AT91RM9200_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> new file mode 100644
> index 0000000000000..6a5453cf70954
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9260 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> +
> +#define AT91SAM9260_PMC_SLOW	0
> +#define AT91SAM9260_PMC_MCK	1
> +#define AT91SAM9260_PMC_MAIN	3
> +#define AT91SAM9260_PMC_PLLACK	7
> +#define AT91SAM9260_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> new file mode 100644
> index 0000000000000..63134ecafa50c
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9g45 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> +
> +#define AT91SAM9G45_PMC_MCK	1
> +#define AT91SAM9G45_PMC_UTMI	2
> +#define AT91SAM9G45_PMC_MAIN	3
> +#define AT91SAM9G45_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> new file mode 100644
> index 0000000000000..e41ad6d68108a
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9n12 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> +
> +#define AT91SAM9N12_PMC_MCK	1
> +#define AT91SAM9N12_PMC_MAIN	3
> +#define AT91SAM9N12_PMC_PLLACK	7
> +#define AT91SAM9N12_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> new file mode 100644
> index 0000000000000..4306d457f8d2b
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9rl clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> +
> +#define AT91SAM9RL_PMC_MCK	1
> +#define AT91SAM9RL_PMC_UTMI	2
> +#define AT91SAM9RL_PMC_MAIN	3
> +#define AT91SAM9RL_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> new file mode 100644
> index 0000000000000..d3e612f063a00
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9x5 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> +
> +#define AT91SAM9X5_PMC_MCK	1
> +#define AT91SAM9X5_PMC_UTMI	2
> +#define AT91SAM9X5_PMC_MAIN	3
> +#define AT91SAM9X5_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> new file mode 100644
> index 0000000000000..1690a69087522
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d2 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> +
> +#define SAMA5D2_PMC_MCK		1
> +#define SAMA5D2_PMC_UTMI	2
> +#define SAMA5D2_PMC_MAIN	3
> +#define SAMA5D2_PMC_MCK2	4
> +#define SAMA5D2_PMC_I2S0_MUX	5
> +#define SAMA5D2_PMC_I2S1_MUX	6
> +#define SAMA5D2_PMC_PLLACK	7
> +#define SAMA5D2_PMC_AUDIOPLLCK	9
> +#define SAMA5D2_PMC_AUDIOPINCK	10
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> new file mode 100644
> index 0000000000000..85b772ccd996a
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d3 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> +
> +#define SAMA5D3_PMC_MCK		1
> +#define SAMA5D3_PMC_UTMI	2
> +#define SAMA5D3_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> new file mode 100644
> index 0000000000000..15b812e1b9259
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d4 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> +
> +#define SAMA5D4_PMC_MCK		1
> +#define SAMA5D4_PMC_UTMI	2
> +#define SAMA5D4_PMC_MCK2	4
> +#define SAMA5D4_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> new file mode 100644
> index 0000000000000..91f8f863ea076
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sam9x60 clock driver.

s/at91/Microchip. Same for microchip,sam9x7-pmc.h, microchip,sama7d65-pmc.h, 
microchip,sama7g5-pmc.h files.


> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> +
> +#define SAM9X60_PMC_MCK		1
> +#define SAM9X60_PMC_UTMI	2
> +#define SAM9X60_PMC_MAIN	3
> +#define SAM9X60_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> new file mode 100644
> index 0000000000000..e1dd41fe75046
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sam9x7 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
> +
> +#define SAM9X7_PMC_MCK		1
> +#define SAM9X7_PMC_UTMI		2
> +#define SAM9X7_PMC_MAIN		3
> +#define SAM9X7_PMC_PLLACK	7

You should also keep the other PLLs even if they are not used in device trees. 
They are HW specific. Same for the other SoCs.

> +#define SAM9X7_PMC_AUDIOPMCPLL	9
> +#define SAM9X7_PMC_AUDIOIOPLL	10
> +#define SAM9X7_PMC_PLLADIV2	14
> +#define SAM9X7_PMC_LVDSPLL	15
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> new file mode 100644
> index 0000000000000..09d152da6db44
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama7d65 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
> +
> +#define SAMA7D65_PMC_MCK0		1
> +#define SAMA7D65_PMC_UTMI		2
> +#define SAMA7D65_PMC_MAIN		3
> +#define SAMA7D65_PMC_CPUPLL		4
> +#define SAMA7D65_PMC_SYSPLL		5

Here, you should keep the other PLLs as well.

> +#define SAMA7D65_PMC_BAUDPLL		8
> +#define SAMA7D65_PMC_AUDIOPMCPLL	9
> +#define SAMA7D65_PMC_AUDIOIOPLL		10
> +#define SAMA7D65_PMC_ETHPLL		11
> +#define SAMA7D65_PMC_MCK1		13
> +#define SAMA7D65_PMC_LVDSPLL		15
> +#define SAMA7D65_PMC_MCK3		16
> +#define SAMA7D65_PMC_MCK5		17
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> new file mode 100644
> index 0000000000000..0303cae56f849
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama7g5 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> +
> +#define SAMA7G5_PMC_MCK0	1
> +#define SAMA7G5_PMC_UTMI	2
> +#define SAMA7G5_PMC_MAIN	3
> +#define SAMA7G5_PMC_CPUPLL	4
> +#define SAMA7G5_PMC_SYSPLL	5

Same here. Keep the defines for the rest of the PLLs.

> +#define SAMA7G5_PMC_AUDIOPMCPLL	9
> +#define SAMA7G5_PMC_AUDIOIOPLL	10
> +#define SAMA7G5_PMC_MCK1	13
> +
> +#endif


