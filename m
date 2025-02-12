Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B98C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 08:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOol5WNPvENS3vdMhBYm0QLh74/mNhfhqG7fppgba9k=; b=qAXSxhNhWqjArgA+cCzixj9fLb
	Gq2C8vMMpXCxP+A8WU9m1RY9bZZULnpo5ZoD+HkEHkSz56v6XpJCFKB8f6HndsODBMNuuEKW6H60e
	96hLjJz/m37pnLZaot1lLzw/6TCq7XKYloDQEZHLu0CtB//AIs+WFYCH0wlw3aSvbPOBQmz7sq50O
	Y6scFYdrJZ+6aNdNy/M1WRcyQJd0DughB67D2Kn8IZBSci4RTJGpJVoECuYV050M+KHSHZ9EXPcCM
	6yH/oBEEhDtpIhb3WBjWN7W3zkW3dVcnJCH7JvVOMIHCwbQ7hOFfTo2qsGC/HxJTCvPC+IrNL44y8
	+B5hYylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7xY-00000006api-2cjv;
	Wed, 12 Feb 2025 08:19:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti7w8-00000006aey-2T7l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 08:17:37 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7e1286126so293690066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 00:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739348255; x=1739953055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eOol5WNPvENS3vdMhBYm0QLh74/mNhfhqG7fppgba9k=;
        b=faPWI13xCKsKMmIn20PeWCmyzjwumymq9aCQmgu4dxhtKIwbg+iOQUVbyA2oC/U5HV
         VmRjy1fPwh8goQl+eKOmmZ6WW8/j0PnzkVbwROH9zCKxfKyb1T2XYrEmOCLTGpJqtfFm
         zJfbVRtEIs0CrKRT3d34K+5k/0MAgknZ25np5EAQx0hK12FIOWBssEWCVfTJwT4q4iBK
         8K8HOTRLyq6HQngnJz+mvcw0wIB9qJEtuvqyeT8KUF7UA1z1gUmvBy/o2of4xf5lyQs3
         xWYMOk7yKA9pgiRAQIzShbgLmowCXkBmVfcoEC1F64gbnaYziiuehkYUYna4wUppHsBk
         vAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739348255; x=1739953055;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eOol5WNPvENS3vdMhBYm0QLh74/mNhfhqG7fppgba9k=;
        b=bB8Y+sYMAfIwd7J2s3mt95+nhj/0C4y9BqBlexe35TSMA4rcophqdGY3m4g7QxMpYw
         +p1zPcRrAsIT9nAmwMlEp24N0GR8zINvHkXmxAKWDFTL/2g+c+0/eUMaMqGhj2Fjt+K0
         ElCf4HlGfqmROsuRofuieykilS4DBaoh5AMbw5VniPA5oij5yCCKvqUyg0afGSw2/ZEf
         at7QIIwRJZKbMjrP3Cb7bg0gf4gRg+u+pysqfUIbXbDVpHSyoIQzomSeCm8HmK79PPRi
         9rrKX2XFk//9bWsg4ci0tdikYth5fv6LR+RfkF8r36gMeqfp97b3ZYqvAkjGxHTTEJLp
         zhGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4HJzc/0mLWm/hBxPAvQrpjqeprHycxR24faDoZzH6pf5e08tpx9vTUrn6Y3Mjoqz6AFW6ygxO+7BL6a1VJEcx@lists.infradead.org
X-Gm-Message-State: AOJu0YwQIxe2Ml2ietgh4yC5dewMQfgAgrxpe8kt+hymqjsbpN5ydMEd
	Wrw/4UMGux/suHQeXg2kUB4ATQTgVMECyiNCweVnlQO/v/Kby/YE6mhTvzzXHtY=
X-Gm-Gg: ASbGncsSmX7m64IjHB+YSYRjyv9tWlvjJwg0xtV+3sjZ3jCVCMwBZq9ipXGtyvKa289
	Etf3sQq4/DZ5aZIqkfJdVGooRYCbNCUpukcW8qV4K1zqmlW3p7sfzW0z7Xmhyj3HL3bgKoK7P78
	8n/76M+IAzB84DFveVnJTD07HmEmlBadMOaH+Uq+MSQzDkVNIfTtKXZeZFLnasWSkKeXCihjaWP
	UtsDZtbnZynYeRuSKtIGsgfHV3ZU2GYAHwZzLOy9LMOPgwwZoxVoy8rha7mpvvmCq7Lqdtz/hKG
	REG9R5Bxje7MqAUG46YR3zZm
X-Google-Smtp-Source: AGHT+IFErQwXqSNpK/6FrEzXPnkJQuSUwq8b4aWjOCfP5LHsMYbCFirtlFlujhvTW/ijh8+yT3EyjA==
X-Received: by 2002:a17:907:60d0:b0:ab7:c3c9:2ab1 with SMTP id a640c23a62f3a-ab7f34ab9a0mr174668266b.50.1739348254554;
        Wed, 12 Feb 2025 00:17:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4724caesm694239866b.145.2025.02.12.00.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 00:17:34 -0800 (PST)
Message-ID: <8ad7636f-af6d-417f-8801-66530ff67c1f@tuxon.dev>
Date: Wed, 12 Feb 2025 10:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] ARM: at91: pm: fix at91_suspend_finish for ZQ
 calibration
To: Ryan.Wanner@microchip.com, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 p.zabel@pengutronix.de
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 Li Bin <bin.li@microchip.com>,
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 Andrei Simion <andrei.simion@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <4e685b1f1828b006cb60aa6b66239f2c0966501a.1739221064.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <4e685b1f1828b006cb60aa6b66239f2c0966501a.1739221064.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_001736_633208_1BE3A059 
X-CRM114-Status: GOOD (  22.96  )
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
> From: Li Bin <bin.li@microchip.com>
> 
> For sama7g5 and sama7d65 backup mode, we encountered a "ZQ calibrate error"
> during recalibrating the impedance in BootStrap.
> We found that the impedance value saved in at91_suspend_finish() before
> the DDR entered self-refresh mode did not match the resistor values. The
> ZDATA field in the DDR3PHY_ZQ0CR0 register uses a modified gray code to
> select the different impedance setting.
> But these gray code are incorrect, a workaournd from design team fixed the
> bug in the calibration logic. The ZDATA contains four independent impedance
> elements, but the algorithm combined the four elements into one. The elements
> were fixed using properly shifted offsets.
> 
> Signed-off-by: Li Bin <bin.li@microchip.com>
> [nicolas.ferre@microchip.com: fix indentation and combine 2 patches]
> Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Tested-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Tested-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Tested-by: Andrei Simion <andrei.simion@microchip.com>

Missing your SoB tag.

> ---
>  arch/arm/mach-at91/pm.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
> index 05a1547642b60..6c3e6aa22606f 100644
> --- a/arch/arm/mach-at91/pm.c
> +++ b/arch/arm/mach-at91/pm.c
> @@ -545,11 +545,12 @@ extern u32 at91_pm_suspend_in_sram_sz;
>  
>  static int at91_suspend_finish(unsigned long val)
>  {
> -	unsigned char modified_gray_code[] = {
> -		0x00, 0x01, 0x02, 0x03, 0x06, 0x07, 0x04, 0x05, 0x0c, 0x0d,
> -		0x0e, 0x0f, 0x0a, 0x0b, 0x08, 0x09, 0x18, 0x19, 0x1a, 0x1b,
> -		0x1e, 0x1f, 0x1c, 0x1d, 0x14, 0x15, 0x16, 0x17, 0x12, 0x13,
> -		0x10, 0x11,
> +	/* SYNOPSYS workaround to fix a bug in the calibration logic */
> +	unsigned char modified_fix_code[] = {
> +		0x00, 0x01, 0x01, 0x06, 0x07, 0x0c, 0x06, 0x07, 0x0b, 0x18,
> +		0x0a, 0x0b, 0x0c, 0x0d, 0x0d, 0x0a, 0x13, 0x13, 0x12, 0x13,
> +		0x14, 0x15, 0x15, 0x12, 0x18, 0x19, 0x19, 0x1e, 0x1f, 0x14,
> +		0x1e, 0x1f,
>  	};
>  	unsigned int tmp, index;
>  	int i;
> @@ -560,25 +561,25 @@ static int at91_suspend_finish(unsigned long val)
>  		 * restore the ZQ0SR0 with the value saved here. But the
>  		 * calibration is buggy and restoring some values from ZQ0SR0
>  		 * is forbidden and risky thus we need to provide processed
> -		 * values for these (modified gray code values).
> +		 * values for these.
>  		 */
>  		tmp = readl(soc_pm.data.ramc_phy + DDR3PHY_ZQ0SR0);
>  
>  		/* Store pull-down output impedance select. */
>  		index = (tmp >> DDR3PHY_ZQ0SR0_PDO_OFF) & 0x1f;
> -		soc_pm.bu->ddr_phy_calibration[0] = modified_gray_code[index];
> +		soc_pm.bu->ddr_phy_calibration[0] = modified_fix_code[index] << DDR3PHY_ZQ0SR0_PDO_OFF;
>  
>  		/* Store pull-up output impedance select. */
>  		index = (tmp >> DDR3PHY_ZQ0SR0_PUO_OFF) & 0x1f;
> -		soc_pm.bu->ddr_phy_calibration[0] |= modified_gray_code[index];
> +		soc_pm.bu->ddr_phy_calibration[0] |= modified_fix_code[index] << DDR3PHY_ZQ0SR0_PUO_OFF;
>  
>  		/* Store pull-down on-die termination impedance select. */
>  		index = (tmp >> DDR3PHY_ZQ0SR0_PDODT_OFF) & 0x1f;
> -		soc_pm.bu->ddr_phy_calibration[0] |= modified_gray_code[index];
> +		soc_pm.bu->ddr_phy_calibration[0] |= modified_fix_code[index] << DDR3PHY_ZQ0SR0_PDODT_OFF;
>  
>  		/* Store pull-up on-die termination impedance select. */
>  		index = (tmp >> DDR3PHY_ZQ0SRO_PUODT_OFF) & 0x1f;
> -		soc_pm.bu->ddr_phy_calibration[0] |= modified_gray_code[index];
> +		soc_pm.bu->ddr_phy_calibration[0] |= modified_fix_code[index] << DDR3PHY_ZQ0SRO_PUODT_OFF;
>  
>  		/*
>  		 * The 1st 8 words of memory might get corrupted in the process


