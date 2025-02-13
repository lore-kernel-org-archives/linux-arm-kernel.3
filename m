Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF4C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vn73WalEclJj9iGOI5gsg/U5ld0lXLx5mMbg3tjPXvY=; b=EelEnO614H3uRSzxTOmtrx9Rkz
	g7oP/gsae6hQEww8iytNHSz4bALlUVspH0wktLEcwO5FZwUvruAX1CUQkcdumAn83D8ilVvmeHwji
	+mnmOjm+C17Y6f90KYEu55TMXvTXiFgpHSPIkhYVI5b+kVYe0K4/fjqe01TCPatqlcHOiuBrlQytp
	8mT0ApuCPenGL4EcPU+5rfHn0TSn3MGoAlIHoq4IPf5gmlelAe/8WJ3CkNzHoKOIvejjGYJbE1IEc
	u6RmEj+LgR087gTQAQQHvJ5F4QYqjfbXIs3nYJ+TPAuEbNmQ7pW9pPt+4/wA3XypxSE8Fkm1YGijB
	eimkqEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUfh-0000000AI4t-1Uej;
	Thu, 13 Feb 2025 08:34:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUT1-0000000AFsk-2nvz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:21:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7c6fc35b3so100233966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739434861; x=1740039661; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vn73WalEclJj9iGOI5gsg/U5ld0lXLx5mMbg3tjPXvY=;
        b=aloQ3hb4i3EWvswSEAYGLOEbrHyWfkTPERGjEMmTDXCSe0yCpc1mdgyG6RzS46Jxjo
         88TpqXv5X54PC8rIgb0D4HF9e2CnusN4zom0b8HOa/ca2DV/eolWFR97F3igTRu/9B4b
         rC2u6bpb5TJrqropXQObo+RVLgOrLorqJsKyImpns5CvxU4GkVaABmT3fFVnLob0YTkn
         b8KbMdxOfok3Cxwk9G+v8ItQCTqx5oRmLsjl6NubFyQesj+r/CCa3Sb7PpaWrUb9ekNF
         BIygI85jajh0uPx7wFmAX7wWVErAjVkX7FKDY82xVqdrFHqbJLNF5i/FVeUoeY3BrtEP
         Dc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434861; x=1740039661;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vn73WalEclJj9iGOI5gsg/U5ld0lXLx5mMbg3tjPXvY=;
        b=PKSUvU84d0d880Q1tEyT/RLSZbsCdWNARMCfIGIDxmNotbI7oMUa+TsRfpG8Gm+StE
         xvA88OQiF5BontX8z4+X0VVT3lCd0Ka0vfna2MD2RXlijaX/26yHoxRLCXZl1iDFnslP
         nVgREVSpBGQou6YUNll1mwsmDwOxiDZHCQdSRGsjeTbheRX661voNs4uyktKaUA6kGED
         Z7GSKwjn0IA0kkfeGSXPfiVruZBGpLXmpfdJOPuR77c25kw2CInq09besCEn1Ku+g35i
         F0uyd1QJ+XPBJ950YBIqE7ka7E8Yhhgc8KT5Z2cNLVmCAiJyeAUfNxtEyx1LsIuxr+Ow
         VC8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuPc+T5DwLONxIJoyW1zlgbCvbngmTmVABVG+2/YzUCggFeRGd9SkSMVGG4D+7YsNrnHouc8ahCC6LUAqgswGo@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXgVlz/fvKTkEXg6QyddW4B278bcaIpVr1sFKCPY6aex7or47
	AuXXwkRjzePnLGxMIwTKKg92jdvvVpEJ+QMedh3HL0618oh/fn68w7szlqlBhqA=
X-Gm-Gg: ASbGncvub17QexyBzm8uAOFTv8Xnr6eTypEjz1EuxYdY5JTuMFFvfUJPPRTjjTai3u6
	Pa5o37CvRgQMekLh+YBBlEvIHV1o/WY3moQtPSZckcX4vCSmsz4nEyj1YAUPT0L4hWUGCCEZ6Bs
	XuGM5BJj3Y1ialAeWQoIgNI6TVbFvyX95FGJN5rQ3/BZY6kiUtBDB3D2Lij7OZOLeFKshrBDH7l
	zH09l4GiYNmvY6ud3/zUd8FdhaI2vBXsqGotrrhcM/pti8gi5yFXqyRJ/+5UVLGkudpa2yHwQk9
	aqDfFHenqZQ0KFn9ymB2zGBX
X-Google-Smtp-Source: AGHT+IEhesjdBkqWLnCNWzrr/NiEW06NaoXsZ/TpreP8TtqwE77xsVNkXng0LA9DXjAWL54/IW9UoQ==
X-Received: by 2002:a17:907:968d:b0:ab7:a33f:289a with SMTP id a640c23a62f3a-ab7f37865cfmr421784266b.28.1739434861289;
        Thu, 13 Feb 2025 00:21:01 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53258215sm81996566b.53.2025.02.13.00.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 00:21:00 -0800 (PST)
Message-ID: <32ad3a1a-c6b6-4db1-8e80-8b5f951055a8@tuxon.dev>
Date: Thu, 13 Feb 2025 10:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] ARM: at91: pm: Enable ULP0 for SAMA7D65
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <a00b193df9e0cb95d144a249b12f1b13188d1ab7.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a00b193df9e0cb95d144a249b12f1b13188d1ab7.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_002103_872281_9D744CC2 
X-CRM114-Status: GOOD (  33.34  )
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


On 10.02.2025 23:13, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> New clocks are saved to enable ULP0 for SAMA7D65 because this SoC has a
> total of 10 main clocks that need to be saved for ULP0 mode.

Isn't 9 the total number of MCKs that are handled in the last/first phase
of suspend/resume?

Also, the state of MCKs are saved/restored for ULP0 and ULP1 as well.

> 
> Add mck_count member to at91_pm_data, this will be used to determine
> how many mcks need to be saved. In the mck_count member will also make
> sure that no unnecessary clock settings are written during
> mck_ps_restore.
> 
> Add SHDWC to ULP0 mapping to clear the SHDWC status after exiting low
> power modes.

Can you explain why this clear need to be done? The commit message should
answer to the "what?" and "why?" questions.

> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
>  arch/arm/mach-at91/pm.c              | 19 +++++-
>  arch/arm/mach-at91/pm.h              |  1 +
>  arch/arm/mach-at91/pm_data-offsets.c |  2 +
>  arch/arm/mach-at91/pm_suspend.S      | 97 ++++++++++++++++++++++++++--
>  4 files changed, 110 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 55cab31ce1ecb..50bada544eede 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -1337,6 +1337,7 @@ struct pmc_info {
>  	unsigned long uhp_udp_mask;
>  	unsigned long mckr;
>  	unsigned long version;
> +	unsigned long mck_count;>  };
>  
>  static const struct pmc_info pmc_infos[] __initconst = {
> @@ -1344,30 +1345,42 @@ static const struct pmc_info pmc_infos[] __initconst = {
>  		.uhp_udp_mask = AT91RM9200_PMC_UHP | AT91RM9200_PMC_UDP,
>  		.mckr = 0x30,
>  		.version = AT91_PMC_V1,
> +		.mck_count = 1,

As this member is used only for SAMA7 SoCs I would drop it here and above
(where initialized with 1).

>  	},
>  
>  	{
>  		.uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
>  		.mckr = 0x30,
>  		.version = AT91_PMC_V1,
> +		.mck_count = 1,
>  	},
>  	{
>  		.uhp_udp_mask = AT91SAM926x_PMC_UHP,
>  		.mckr = 0x30,
>  		.version = AT91_PMC_V1,
> +		.mck_count = 1,
>  	},
>  	{	.uhp_udp_mask = 0,
>  		.mckr = 0x30,
>  		.version = AT91_PMC_V1,
> +		.mck_count = 1,
>  	},
>  	{
>  		.uhp_udp_mask = AT91SAM926x_PMC_UHP | AT91SAM926x_PMC_UDP,
>  		.mckr = 0x28,
>  		.version = AT91_PMC_V2,
> +		.mck_count = 1,
>  	},
>  	{
>  		.mckr = 0x28,
>  		.version = AT91_PMC_V2,
> +		.mck_count = 5,

I'm not sure mck_count is a good name when used like proposed in this
patch. We know that only 4 MCKs need to be handled for SAMA7G5 and 9 for
SAMA7D65.

Maybe, better change it here to 4 (.mck_count = 4) and to 9 above
(.mck_count = 9) and adjust properly the assembly macros (see below)? What
do you think?

> +	},
> +	{
> +		.uhp_udp_mask = AT91SAM926x_PMC_UHP,
> +		.mckr = 0x28,
> +		.version = AT91_PMC_V2,
> +		.mck_count = 10,
>  	},
>  
>  };
> @@ -1386,7 +1399,7 @@ static const struct of_device_id atmel_pmc_ids[] __initconst = {
>  	{ .compatible = "atmel,sama5d2-pmc", .data = &pmc_infos[1] },
>  	{ .compatible = "microchip,sam9x60-pmc", .data = &pmc_infos[4] },
>  	{ .compatible = "microchip,sam9x7-pmc", .data = &pmc_infos[4] },
> -	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[4] },
> +	{ .compatible = "microchip,sama7d65-pmc", .data = &pmc_infos[6] },
>  	{ .compatible = "microchip,sama7g5-pmc", .data = &pmc_infos[5] },
>  	{ /* sentinel */ },
>  };
> @@ -1457,6 +1470,7 @@ static void __init at91_pm_init(void (*pm_idle)(void))
>  	soc_pm.data.uhp_udp_mask = pmc->uhp_udp_mask;
>  	soc_pm.data.pmc_mckr_offset = pmc->mckr;
>  	soc_pm.data.pmc_version = pmc->version;
> +	soc_pm.data.pmc_mck_count = pmc->mck_count;
>  
>  	if (pm_idle)
>  		arm_pm_idle = pm_idle;
> @@ -1659,7 +1673,8 @@ void __init sama7_pm_init(void)
>  		AT91_PM_STANDBY, AT91_PM_ULP0, AT91_PM_ULP1, AT91_PM_BACKUP,
>  	};
>  	static const u32 iomaps[] __initconst = {
> -		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU),
> +		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU) |
> +					  AT91_PM_IOMAP(SHDWC),

In theory, as the wakeup sources can also resumes the system from standby
(WFI), the shdwc should be mapped for standby, too. Unless I'm wrong and
the wakeup sources covered by the SHDWC_SR register don't apply to standby
(WFI).


>  		[AT91_PM_ULP1]		= AT91_PM_IOMAP(SFRBU) |
>  					  AT91_PM_IOMAP(SHDWC) |
>  					  AT91_PM_IOMAP(ETHC),
> diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
> index 53bdc9000e447..ccde9c8728c27 100644
> --- a/arch/arm/mach-at91/pm.h
> +++ b/arch/arm/mach-at91/pm.h
> @@ -39,6 +39,7 @@ struct at91_pm_data {
>  	unsigned int suspend_mode;
>  	unsigned int pmc_mckr_offset;
>  	unsigned int pmc_version;
> +	unsigned int pmc_mck_count;
>  };
>  #endif
>  
> diff --git a/arch/arm/mach-at91/pm_data-offsets.c b/arch/arm/mach-at91/pm_data-offsets.c
> index 40bd4e8fe40a5..59a4838038381 100644
> --- a/arch/arm/mach-at91/pm_data-offsets.c
> +++ b/arch/arm/mach-at91/pm_data-offsets.c
> @@ -18,6 +18,8 @@ int main(void)
>  						 pmc_mckr_offset));
>  	DEFINE(PM_DATA_PMC_VERSION,	offsetof(struct at91_pm_data,
>  						 pmc_version));
> +	DEFINE(PM_DATA_PMC_MCK_COUNT,	offsetof(struct at91_pm_data,
> +						 pmc_mck_count));
>  
>  	return 0;
>  }
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index e5869cca5e791..2bbcbb26adb28 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -814,17 +814,19 @@ sr_dis_exit:
>  .endm
>  
>  /**
> - * at91_mckx_ps_enable:	save MCK1..4 settings and switch it to main clock
> + * at91_mckx_ps_enable:	save MCK settings and switch it to main clock
>   *
> - * Side effects: overwrites tmp1, tmp2
> + * Side effects: overwrites tmp1, tmp2, tmp3
>   */
>  .macro at91_mckx_ps_enable
>  #ifdef CONFIG_SOC_SAMA7
>  	ldr	pmc, .pmc_base
> +	ldr	tmp3, .mck_count
>  
> -	/* There are 4 MCKs we need to handle: MCK1..4 */
> +	/* Start at MCK1 and go until MCK_count */

s/MCK_count/mck_count to align with the mck_count above.

>  	mov	tmp1, #1
> -e_loop:	cmp	tmp1, #5
> +e_loop:
> +	cmp	tmp1, tmp3
>  	beq	e_done

If providing mck_count = 4 (for SAMA7G5) and mck_count = 9 (for SAMA7D65)
you can change this to:

        bqt     e_done

>  
>  	/* Write MCK ID to retrieve the settings. */
> @@ -850,7 +852,37 @@ e_save_mck3:
>  	b	e_ps
>  
>  e_save_mck4:
> +	cmp	tmp1, #4
> +	bne	e_save_mck5
>  	str	tmp2, .saved_mck4
> +	b	e_ps
> +
> +e_save_mck5:
> +	cmp	tmp1, #5
> +	bne	e_save_mck6
> +	str	tmp2, .saved_mck5
> +	b	e_ps
> +
> +e_save_mck6:
> +	cmp	tmp1, #6
> +	bne	e_save_mck7
> +	str	tmp2, .saved_mck6
> +	b	e_ps
> +
> +e_save_mck7:
> +	cmp	tmp1, #7
> +	bne	e_save_mck8
> +	str	tmp2, .saved_mck7
> +	b	e_ps
> +
> +e_save_mck8:
> +	cmp	tmp1, #8
> +	bne	e_save_mck9
> +	str	tmp2, .saved_mck8
> +	b	e_ps
> +
> +e_save_mck9:
> +	str	tmp2, .saved_mck9
>  
>  e_ps:
>  	/* Use CSS=MAINCK and DIV=1. */
> @@ -870,17 +902,19 @@ e_done:
>  .endm
>  
>  /**
> - * at91_mckx_ps_restore: restore MCK1..4 settings
> + * at91_mckx_ps_restore: restore MCKx settings

s/MCKx/MCK to align with the description from at91_mckx_ps_enable

>   *
>   * Side effects: overwrites tmp1, tmp2
>   */
>  .macro at91_mckx_ps_restore
>  #ifdef CONFIG_SOC_SAMA7
>  	ldr	pmc, .pmc_base
> +	ldr	tmp2, .mck_count
>  
> -	/* There are 4 MCKs we need to handle: MCK1..4 */
> +	/* Start from MCK1 and go up to MCK_count */
>  	mov	tmp1, #1
> -r_loop:	cmp	tmp1, #5
> +r_loop:
> +	cmp	tmp1, tmp2
>  	beq	r_done

Same here:
        bgt     r_done

should be enough if providing mck_count = 4 or 9

>  
>  r_save_mck1:
> @@ -902,7 +936,37 @@ r_save_mck3:
>  	b	r_ps
>  
>  r_save_mck4:
> +	cmp	tmp1, #4
> +	bne	r_save_mck5
>  	ldr	tmp2, .saved_mck4
> +	b	r_ps
> +
> +r_save_mck5:
> +	cmp	tmp1, #5
> +	bne	r_save_mck6
> +	ldr	tmp2, .saved_mck5
> +	b	r_ps
> +
> +r_save_mck6:
> +	cmp	tmp1, #6
> +	bne	r_save_mck7
> +	ldr	tmp2, .saved_mck6
> +	b	r_ps
> +
> +r_save_mck7:
> +	cmp	tmp1, #7
> +	bne	r_save_mck8
> +	ldr	tmp2, .saved_mck7
> +	b	r_ps
> +
> +r_save_mck8:
> +	cmp	tmp1, #8
> +	bne	r_save_mck9
> +	ldr	tmp2, .saved_mck8
> +	b	r_ps
> +
> +r_save_mck9:
> +	ldr	tmp2, .saved_mck9
>  
>  r_ps:
>  	/* Write MCK ID to retrieve the settings. */
> @@ -921,6 +985,7 @@ r_ps:
>  	wait_mckrdy tmp1
>  
>  	add	tmp1, tmp1, #1
> +	ldr	tmp2, .mck_count

Or you can add tmp4 for this

>  	b	r_loop
>  r_done:
>  #endif
> @@ -1045,6 +1110,10 @@ ENTRY(at91_pm_suspend_in_sram)
>  	str	tmp1, .memtype
>  	ldr	tmp1, [r0, #PM_DATA_MODE]
>  	str	tmp1, .pm_mode
> +#ifdef CONFIG_SOC_SAMA7
> +	ldr	tmp1, [r0, #PM_DATA_PMC_MCK_COUNT]
> +	str	tmp1, .mck_count
> +#endif
>  
>  	/*
>  	 * ldrne below are here to preload their address in the TLB as access
> @@ -1132,6 +1201,10 @@ ENDPROC(at91_pm_suspend_in_sram)
>  	.word 0
>  .pmc_version:
>  	.word 0
> +#ifdef CONFIG_SOC_SAMA7
> +.mck_count:
> +	.word 0
> +#endif
>  .saved_mckr:
>  	.word 0
>  .saved_pllar:
> @@ -1155,6 +1228,16 @@ ENDPROC(at91_pm_suspend_in_sram)
>  	.word 0
>  .saved_mck4:
>  	.word 0
> +.saved_mck5:
> +	.word 0
> +.saved_mck6:
> +	.word 0
> +.saved_mck7:
> +	.word 0
> +.saved_mck8:
> +	.word 0
> +.saved_mck9:
> +	.word 0
>  #endif
>  
>  ENTRY(at91_pm_suspend_in_sram_sz)


