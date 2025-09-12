Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DB8CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhTtKCHI6YyAxkelI6PQJ30LTFgikUoSCN8YWHn9tsM=; b=Nat9ViKbzWMzQPsosxRhMzfe4g
	sFwEWJrTUH0frn98ZwSk51mWBqIOrcPd4U3uo4d99wdHEIq2t7YCr7qk/LiW98zbIb3r7YML/VEyV
	y+G/2cIyef93ZH/RTI8EYajb7FbZj/oTTso/LN0zMHEbGGpNZyGQmABkC++8khrZ1gTf1M5CfK+Zm
	vIpadMs+A8WQs0ZL6kXMM68pLZueeSI6X2fPvZtLA9Xhvy1LAmrFuxQFXkBws6vQofbY+GwRHan3n
	pFepEQWYsO3xxHqxifIHzbJ+iOPy3Ju/OrMB6ewZ15ZXxxS9dreY0hxmBcIY/1BbgZbQjqII2sk+M
	blObINdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwye8-00000007lW2-0Cy6;
	Fri, 12 Sep 2025 07:56:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwye5-00000007lVf-3qh2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:56:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45ed646b656so8680125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757663795; x=1758268595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EhTtKCHI6YyAxkelI6PQJ30LTFgikUoSCN8YWHn9tsM=;
        b=iDngvHTypd8vEb0QDFT6NkVW4igpPU5O6VSvqv9yme3PSr8spYNSDL2MabHPzDw4Tk
         WGpVqQk2xcp6VRpJpCR/PfAf+cs5Asa5oCkwjqADyU/RAi9fneuS1mWdtWTlHJhcdA0P
         Ua4GYS+JunU1XE19eADUdf/rJ2vBwrgsaGgdX3Z+6LHvxFSovCkZoveAXNmZrF6PDm0L
         ruZkt/FVIx8oM0kYjCj3732LFwyp3m7aQAvOXn6jYD26V27oqUJF2bRQ4KjuOolvr+PM
         1/92cWgvebGRsU4uQzxqbb/aETr8JkjQo2h+vNP+983IKATe5c2XMTJwJgNBFrS24WO5
         K43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757663795; x=1758268595;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhTtKCHI6YyAxkelI6PQJ30LTFgikUoSCN8YWHn9tsM=;
        b=UPjFsH47smxxulwcfWr+3rxbMGAAAro1TimUlIywvo/ZwdzRX7OoZ0Iy93H2Ptmi0h
         tqrnOxSLIyiMgiCLxL9GPCY8a2CXf60ZBht5JCuCqRAjRSfRsfCZklTNStEUmPDSDQmZ
         vCX9KWMyATHvnLE8nSUXS9bzdMb/b6I6bKmlle3bJVOTMm9m2RnPa8hSe1RrPakaDRr+
         HkDAgzSXiv24dPf5mVSBk/PzyejgcJ4gmb1Sga4n1uNfNsGYfPUcmOvT1jTJWWK1KEA+
         kRUK4G3iba1jCDhzFNi8Jav1UQUZqXZISamBpFNelr8nbg09xhCYOU+O5/1EeMbz//dL
         hTgw==
X-Forwarded-Encrypted: i=1; AJvYcCWkrPGQgBMNPI66pN3gKH+mNngvcxZUhyZjfc5cn2EEwTYd/6JnjjULxRN1c6CzF4Fb/ZFwZ6tJ9J0CbppwZa79@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl6tbMaCZKI/+R8dQCgDEV6PZNNpQXDMrnbQjvU6EXvAfEX4W1
	a6c7emgd5rlgxKbawMgOFUimXFPtibQOjE5SzTjQFkuN9zfUXs/XaNuBHOf0zXQT5lQBjUTWWOz
	VcGvT
X-Gm-Gg: ASbGncu0nw31t7Zo6IMS6uAFxAKK2ZPk8AAFq0u5oCpW5i5gkMoCx1TzHp6qmOVh2pc
	iApwYTvbhOaGHweap0QGfW8hzbYg1T6/CVkznEhXIwuROJrOHAqCi7ITCusHV0tc/XKUXhwuS/Y
	u3Ph3bpVt3NBzrynrCUIdUeyHvA27kScGR6QH+liVbkiuynRW1xlugxBZZMPtEN8OMao37ClYLh
	CKH+fWzlsA9g/+f3Va8+s0FasYJrHjemLcd+dC1Pf/cga8u4JQFk83h7iz0xMG61vfO3Lp5d7QE
	XegvQvlXBy3saJYt+EFryZkQcaK7hMfqvnFoZqx6DKWt+/eKCE38kCzkz7QQI3VWxMQFsuNmdSP
	PUfvGCisfvQ9UoSDkCg8T7E0ZTbZP6VU=
X-Google-Smtp-Source: AGHT+IHvNFr+9BDB3c+dmlnBPiGPWWjRi8nyodPX84HW7Y/gePqXoEb3c14Vq+L9E5uMCyyhj67MPA==
X-Received: by 2002:a05:600c:1c0c:b0:456:f1e:205c with SMTP id 5b1f17b1804b1-45f241b4ff2mr8152005e9.4.1757663795282;
        Fri, 12 Sep 2025 00:56:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7bb1sm5540656f8f.50.2025.09.12.00.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 00:56:34 -0700 (PDT)
Message-ID: <79ac9ba2-9928-4dfc-a9a1-a0af7704efc7@tuxon.dev>
Date: Fri, 12 Sep 2025 10:56:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 2/4] ARM: at91: PM: implement selection of LPM
To: Ryan.Wanner@microchip.com, sre@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux@armlinux.org.uk
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
 <e72d9af1326cf44888059270263afde875ccc994.1757519351.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <e72d9af1326cf44888059270263afde875ccc994.1757519351.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_005638_086927_7CD3CE00 
X-CRM114-Status: GOOD (  39.82  )
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

On 9/10/25 19:20, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Actually, this was developed while I was with Microchip. I think this still
belongs to Microchip, so I would use the old email address.

> 
> The LPM shutdown controller output could signal the transition to PM
> state for different devices connected on board. On different boards
> LPM could be connected to different devices (e.g. on SAMA7G5-EK REV4
> the LPM is connected to on main crystal oscillator, KSZ8081 PHY and
> to MCP16502 PMIC). Toggling LPM on BSR PM mode is done unconditionally
> and it helps PMIC to transition to a power saving mode. Toggling LPM
> on ULP0 and ULP1 should be done conditionally based on user defined
> wakeup sources, available wakeup source for PM mode and connections to
> SHDWC's LPM pin. On ULP0 any device could act as wakeup sources. On ULP1
> only some of the on SoC controllers could act as wakeup sources. For this
> the architecture specific PM code parses board specific LPM devices,
> check them against possible wakeup source (in case of ULP1) and tells
> assembly code to act properly on SHDWC's LPM pin.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Fixed conflicts when applying.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   arch/arm/mach-at91/pm.c              | 98 +++++++++++++++++++++++++++-
>   arch/arm/mach-at91/pm.h              |  1 +
>   arch/arm/mach-at91/pm_data-offsets.c |  1 +
>   arch/arm/mach-at91/pm_suspend.S      | 50 ++++++++++++--
>   4 files changed, 141 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 35058b99069c..29348d6c852b 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -116,6 +116,7 @@ struct at91_pm_quirks {
>    * @config_shdwc_ws: wakeup sources configuration function for SHDWC
>    * @config_pmc_ws: wakeup srouces configuration function for PMC
>    * @ws_ids: wakup sources of_device_id array
> + * @shdwc_np: pointer to shdwc node
>    * @bu: backup unit mapped data (for backup mode)
>    * @quirks: PM quirks
>    * @data: PM data to be used on last phase of suspend
> @@ -126,6 +127,7 @@ struct at91_soc_pm {
>   	int (*config_shdwc_ws)(void __iomem *shdwc, u32 *mode, u32 *polarity);
>   	int (*config_pmc_ws)(void __iomem *pmc, u32 mode, u32 polarity);
>   	const struct of_device_id *ws_ids;
> +	struct device_node *shdwc_np;
>   	struct at91_pm_bu *bu;
>   	struct at91_pm_quirks quirks;
>   	struct at91_pm_data data;
> @@ -243,6 +245,84 @@ static const struct of_device_id sam9x7_ws_ids[] = {
>   	{ /* sentinel */ }
>   };
>   
> +static int at91_pm_device_in_list(const struct platform_device *pdev,
> +				  const struct of_device_id *ids)

I think would be better to make it return bool

> +{
> +	struct platform_device *local_pdev;
> +	const struct of_device_id *match;
> +	struct device_node *np;
> +	int in_list = 0;
> +
> +	for_each_matching_node_and_match(np, ids, &match) {
> +		local_pdev = of_find_device_by_node(np);
> +		if (!local_pdev)
> +			continue;
> +
> +		if (pdev == local_pdev)
> +			in_list = 1;
> +
> +		put_device(&local_pdev->dev);
> +		if (in_list)
> +			return in_list;
> +	}

And simplify this a bit as:

static bool at91_pm_device_in_list(const struct platform_device *pdev,
				  const struct of_device_id *ids)
{
	struct platform_device *local_pdev;
	const struct of_device_id *match;
	struct device_node *np;

	for_each_matching_node_and_match(np, ids, &match) {
		local_pdev = of_find_device_by_node(np);
		if (!local_pdev)
			continue;

		put_device(&local_pdev->dev);
		if (pdev == local_pdev)
			return true;
	}

	return false;
}


> +
> +	return in_list;
> +}
> +
> +static int at91_pm_prepare_lpm(unsigned int pm_mode)
> +{
> +	struct platform_device *pdev;
> +	int ndevices, i, ret;
> +	struct of_phandle_args lpmspec;
> +
> +	if ((pm_mode != AT91_PM_ULP0 && pm_mode != AT91_PM_ULP1) ||
> +	    !soc_pm.shdwc_np)
> +		return 0;
> +
> +	ndevices = of_count_phandle_with_args(soc_pm.shdwc_np,
> +					      "microchip,lpm-connection", 0);
> +	if (ndevices < 0)
> +		return 0;
> +
> +	soc_pm.data.lpm = 1;
> +	for (i = 0; i < ndevices; i++) {
> +		ret = of_parse_phandle_with_args(soc_pm.shdwc_np,
> +						 "microchip,lpm-connection",
> +						 NULL, i, &lpmspec);
> +		if (ret < 0) {
> +			if (ret == -ENOENT) {
> +				continue;
> +			} else {
> +				soc_pm.data.lpm = 0;
> +				return ret;
> +			}
> +		}
> +
> +		pdev = of_find_device_by_node(lpmspec.np);

From the documentation of of_parse_phandle_with_args() this code would have
to call of_node_put(lpmspec.np);

Here would be the place to do it.

> +		if (!pdev)
> +			continue;
> +
> +		if (device_may_wakeup(&pdev->dev)) {
> +			if (pm_mode == AT91_PM_ULP1) {
> +				/*
> +				 * ULP1 wake-up sources are limited. Ignore it if not
> +				 * in soc_pm.ws_ids.
> +				 */
> +				if (at91_pm_device_in_list(pdev, soc_pm.ws_ids))
> +					soc_pm.data.lpm = 0;
> +			} else {
> +				soc_pm.data.lpm = 0;
> +			}
> +		}
> +
> +		put_device(&pdev->dev);
> +		if (!soc_pm.data.lpm)
> +			break;
> +	}
> +
> +	return 0;
> +}
> +
>   static int at91_pm_config_ws(unsigned int pm_mode, bool set)
>   {
>   	const struct wakeup_source_info *wsi;
> @@ -481,10 +561,17 @@ static int at91_pm_begin(suspend_state_t state)
>   		soc_pm.data.mode = -1;
>   	}
>   
> -	ret = at91_pm_config_ws(soc_pm.data.mode, true);
> +	ret = at91_pm_prepare_lpm(soc_pm.data.mode);
>   	if (ret)
>   		return ret;
>   
> +	ret = at91_pm_config_ws(soc_pm.data.mode, true);
> +	if (ret) {
> +		/* Revert LPM if any. */
> +		soc_pm.data.lpm = 0;
> +		return ret;
> +	}
> +
>   	if (soc_pm.data.mode == AT91_PM_BACKUP)
>   		soc_pm.bu->suspended = 1;
>   	else if (soc_pm.bu)
> @@ -1266,7 +1353,11 @@ static void __init at91_pm_modes_init(const u32 *maps, int len)
>   			AT91_PM_REPLACE_MODES(maps, SHDWC);
>   		} else {
>   			soc_pm.data.shdwc = of_iomap(np, 0);
> -			of_node_put(np);
> +			/*
> +			 * np is used further on suspend/resume path so we skip the
> +			 * of_node_put(np) here.
> +			 */
> +			soc_pm.shdwc_np = np;
>   		}
>   	}
>   
> @@ -1669,7 +1760,8 @@ void __init sama7_pm_init(void)
>   		AT91_PM_STANDBY, AT91_PM_ULP0, AT91_PM_ULP1, AT91_PM_BACKUP,
>   	};
>   	static const u32 iomaps[] __initconst = {
> -		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU),
> +		[AT91_PM_ULP0]		= AT91_PM_IOMAP(SFRBU) |
> +					  AT91_PM_IOMAP(SHDWC),
>   		[AT91_PM_ULP1]		= AT91_PM_IOMAP(SFRBU) |
>   					  AT91_PM_IOMAP(SHDWC) |
>   					  AT91_PM_IOMAP(ETHC),
> diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
> index 50c3a425d140..5707ff6ff444 100644
> --- a/arch/arm/mach-at91/pm.h
> +++ b/arch/arm/mach-at91/pm.h
> @@ -40,6 +40,7 @@ struct at91_pm_data {
>   	unsigned int pmc_mckr_offset;
>   	unsigned int pmc_version;
>   	unsigned int pmc_mcks;
> +	unsigned int lpm;
>   };
>   #endif
>   
> diff --git a/arch/arm/mach-at91/pm_data-offsets.c b/arch/arm/mach-at91/pm_data-offsets.c
> index 0ca5da66dc26..fb9651abdfdf 100644
> --- a/arch/arm/mach-at91/pm_data-offsets.c
> +++ b/arch/arm/mach-at91/pm_data-offsets.c
> @@ -20,6 +20,7 @@ int main(void)
>   						 pmc_version));
>   	DEFINE(PM_DATA_PMC_MCKS,	offsetof(struct at91_pm_data,
>   						 pmc_mcks));
> +	DEFINE(PM_DATA_LPM,		offsetof(struct at91_pm_data, lpm));
>   
>   	return 0;
>   }
> diff --git a/arch/arm/mach-at91/pm_suspend.S b/arch/arm/mach-at91/pm_suspend.S
> index aad53ec9e957..198236bdbbb3 100644
> --- a/arch/arm/mach-at91/pm_suspend.S
> +++ b/arch/arm/mach-at91/pm_suspend.S
> @@ -110,9 +110,30 @@ lp_done_\ena:
>   #endif
>   	.endm
>   
> -	.macro at91_backup_set_lpm reg
> +/*
> + * Set LPM
> + * @ena: 0 - disable LPM
> + *	 1 - enable LPM
> + *
> + * Side effects: overwrites r7, r8, r9
> + */
> +	.macro at91_set_lpm ena
>   #ifdef CONFIG_SOC_SAMA7
> -	orr	\reg, \reg, #0x200000
> +	ldr	r7, .lpm
> +	cmp	r7, #1
> +	bne	21f
> +	ldr	r7, .shdwc
> +	cmp	r7, #0
> +	beq	21f
> +	mov	r8, #0xA5000000
> +	add	r8, #0x200000
> +	mov	r9, #\ena
> +	cmp	r9, #1
> +	beq	20f
> +	add	r8, #0x200000
> +20:
> +	str	r8, [r7]
> +21:
>   #endif
>   	.endm
>   
> @@ -502,7 +523,7 @@ sr_dis_exit:
>   	ldr	tmp1, [pmc, #AT91_PMC_SR]
>   	str	tmp1, .saved_osc_status
>   	tst	tmp1, #AT91_PMC_MOSCRCS
> -	bne	1f
> +	bne	7f
>   
>   	/* Turn off RC oscillator */
>   	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
> @@ -516,6 +537,9 @@ sr_dis_exit:
>   	tst	tmp1, #AT91_PMC_MOSCRCS
>   	bne	2b
>   
> +	/* Enable LPM. */
> +7:	at91_set_lpm 1
> +
>   	/* Wait for interrupt */
>   1:	at91_cpu_idle
>   
> @@ -533,8 +557,10 @@ sr_dis_exit:
>   	wait_mckrdy tmp3
>   	b	6f
>   
> -5:	/* Restore RC oscillator state */
> -	ldr	tmp1, .saved_osc_status
> +5:	at91_set_lpm 0
> +
> +	/* Restore RC oscillator state */
> +8:	ldr	tmp1, .saved_osc_status

"8:" in front of the line could be dropped

Thank you,
Claudiu

>   	tst	tmp1, #AT91_PMC_MOSCRCS
>   	beq	4f
>   
> @@ -611,6 +637,9 @@ sr_dis_exit:
>   
>   	wait_mckrdy tmp3
>   
> +	/* Enable LPM */
> +	at91_set_lpm 1
> +
>   	/* Enter the ULP1 mode by set WAITMODE bit in CKGR_MOR */
>   	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
>   	orr	tmp1, tmp1, #AT91_PMC_WAITMODE
> @@ -624,6 +653,9 @@ sr_dis_exit:
>   
>   	wait_mckrdy tmp3
>   
> +	/* Disable LPM. */
> +	at91_set_lpm 0
> +
>   	/* Enable the crystal oscillator */
>   	ldr	tmp1, [pmc, #AT91_CKGR_MOR]
>   	orr	tmp1, tmp1, #AT91_PMC_MOSCEN
> @@ -1083,7 +1115,9 @@ ulp_exit:
>   	ldr	r0, .shdwc
>   	mov	tmp1, #0xA5000000
>   	add	tmp1, tmp1, #0x1
> -	at91_backup_set_lpm tmp1
> +#ifdef CONFIG_SOC_SAMA7
> +	orr	tmp1, tmp1, #0x200000
> +#endif
>   	str	tmp1, [r0, #0]
>   .endm
>   
> @@ -1117,6 +1151,8 @@ ENTRY(at91_pm_suspend_in_sram)
>   #ifdef CONFIG_SOC_SAMA7
>   	ldr	tmp1, [r0, #PM_DATA_PMC_MCKS]
>   	str	tmp1, .mcks
> +	ldr	tmp1, [r0, #PM_DATA_LPM]
> +	str	tmp1, .lpm
>   #endif
>   
>   	/*
> @@ -1208,6 +1244,8 @@ ENDPROC(at91_pm_suspend_in_sram)
>   #ifdef CONFIG_SOC_SAMA7
>   .mcks:
>   	.word 0
> +.lpm:
> +	.word 0
>   #endif
>   .saved_mckr:
>   	.word 0


