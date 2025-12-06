Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F47FD3B7D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 11:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di4nXMnpEeOTLfF6SZ5MHjacrS6rmAmqyqAmm0YeIzo=; b=l2+gagD1jP9WSi3XRXKoJcGLI2
	XyL0Zh1LtIFYwK3hwVC9GaKhGED3G+HB8sxlgCI0MT4QBKj5WPMJ/Jp+Ojt43ebuM7X1QrhjNJtNH
	Q39023NjuYx23mzxYdDPPh6gDulUuN6lqOiRgCS5twED1GuZy8qgtgyKhdEJrpdKadf9j0eC+CMwP
	u3KsUXe7HdcjmZW5l2uVHCH1HPspVbAn/H6Z0dO5pgwxKyTAkSXWmEqnYnS2Dxtyy+pfDf1wZxsa+
	vQr/SyMWiFHdj9e6xPVhIRoleUxkcXsj5Lg2NL43b/FG91lrQT4EkbQjKN9XbBZ/YDpnQxl6Uh+hH
	gAaGjEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRq4Y-0000000AqVF-16ep;
	Sat, 06 Dec 2025 11:03:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRq4V-0000000AqUr-3RHK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 11:03:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so20274315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Dec 2025 03:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019006; x=1765623806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Di4nXMnpEeOTLfF6SZ5MHjacrS6rmAmqyqAmm0YeIzo=;
        b=ISbkl4DTH3XGnBSaehfDpmPztZkYKFsjXOtwFc9Ax7UYYQhZgREhQpgKwEdozzlQuU
         5HSjNQUYAfjVmXaEcpqg3LmlRs92xNQJfYoL+iwsJfvEr/ylpE/pjz+t9R0yz8wMobWr
         98ZkhV2hTfvwPbotDj0CeL7LBr1rGq7XE9xyVdzX7GmbeIiOqfjp+5/uXGWVyc1MyYrC
         rP7xANWwo2K0LklFCGfz4MWSWZaduWpLyYqlAOvWe/NnrUHK324aXsv/F1rk5h+daE0D
         rToN6gD9jO+QuFX9P9/eiovHEF6vaTemFI0Ml5zG2Gj+Y3+L2UCT0LzUseCK4zVCtAK+
         +gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019006; x=1765623806;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Di4nXMnpEeOTLfF6SZ5MHjacrS6rmAmqyqAmm0YeIzo=;
        b=TkSyvIkw13GIKhfIV6vPpuh5lDFXzGNO+RRN1X9J1+5qFVp2AcyYOaHw1zesaANZc6
         5QVIdq3/QA+oqXEhJMeb2041W8Na3/x5PQma77HpVrsi+3CIp6H09MIp41EviuxTkfc5
         G+yDS4UFo2VmoTq1F8SEn1acsydASpI5k5Oj+kRg1UlsRUVrN2SRrIkgA0Jf7QRm+PVL
         sBTZ+E79CR5/6JvjPpt/72M34EfvdvQbZSJ1lEv2XTvC3WykCej3wWCxh/YT7zV0/cYc
         41evHHM2ijwS7iYrijGppSY2m6yez/QDM/92OEttMkSLLYjb0zmdr80kDY5NYbq1EeEo
         mkRg==
X-Gm-Message-State: AOJu0Yx96vMqvE/N7l+5ClGRfLlAY4SBMbAwZx6Up8g1D5rQqil66t7x
	ETmV/rZyOyezJvRNgxTDuxhC05GgJFpeRpTz7jomHURv6uyBEBwezfUOpjC3uaksLdM=
X-Gm-Gg: ASbGncv2KnIuSAN/rjNDBokjO0NoVQsvCc1kDEpXzYU2mgsU0GteMSWl+fImfUz32A6
	/5h9n3Dd6/8B0tDOZ45CS+ViXT3WljyEUIBYriEvk9WyIP0dL7TnAFR3LYiLF7v28bXJDWbdVMx
	hY2gpRCyRUG4WPgzNMtoeZkCz5A8yhYcksCN7SZ/haPTj+mNsCaH6AXxVT712D3rygIeEMQUv3p
	4rzHUvRT1gl34BXWaTm8wGE0YNU7NZ0Ru1qGOz64WmaM/huhuAe8TssugD1AElVPS871DcLVqjd
	NK2RahoYi26s+V0n+f0vx7fshCLFtHz7L1fSc3xLvP/AkDQWaZ1HNMEIebj3XeP9vNc76VaR8LP
	6eOVeDsc7m0omzEXbT+S+XXyJoN7fmraRJnHBArUEWizP9Vg29K1nuCyMgyc+sOeu/MIsga2qd0
	Aj8gWRIKSEtC64NcdOYxw=
X-Google-Smtp-Source: AGHT+IGlK+iCvO82Fk/1C7qwDEFEQa4UjUl1pzdRaRhsSUr9urYgL5wdrtLcash8bZJTncBMl0oYaw==
X-Received: by 2002:a05:600c:1c9e:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-47939e4d0camr28235395e9.30.1765019005989;
        Sat, 06 Dec 2025 03:03:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d22249esm14170448f8f.25.2025.12.06.03.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:03:25 -0800 (PST)
Message-ID: <51908ef6-f777-4a20-acef-538d9e715790@tuxon.dev>
Date: Sat, 6 Dec 2025 13:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: lan966x: Fix the access to the PHYs for pcb8290
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119134750.394655-1-horatiu.vultur@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251119134750.394655-1-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_030327_872464_4EF77669 
X-CRM114-Status: GOOD (  16.44  )
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



On 11/19/25 15:47, Horatiu Vultur wrote:
> The problem is that the MDIO controller can't detect any of the PHYs.
> The reason is that the lan966x is not pulling high the GPIO 53 that is
> connected to the PHYs reset GPIO. Without doing this the PHYs are kept
> in reset. The mdio controller framework has the possiblity to control a

s/possiblity/possibility

I can adjust it while applying

> GPIO to release the reset of the PHYs. So take advantage of this and set
> line to be high before accessing the PHYs.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/lan966x-pcb8290.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts
> index 3b7577e48b467..50bd29572f3ed 100644
> --- a/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts
> +++ b/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts
> @@ -54,6 +54,7 @@ udc_pins: ucd-pins {
>  &mdio0 {
>  	pinctrl-0 = <&miim_a_pins>;
>  	pinctrl-names = "default";
> +	reset-gpios = <&gpio 53 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  
>  	ext_phy0: ethernet-phy@7 {


