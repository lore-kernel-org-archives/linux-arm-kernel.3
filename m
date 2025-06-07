Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB9EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt3KSgBpR6WlPCg8kfTF1qJDUFvaJVzc7YWDJmWgEtQ=; b=hXmvkcXURWSk1ScAjn+feClRxv
	6Ud0C/PuFORT3jxinjdada4ekwHzmzBc2qwUf0lqY6kmvva0usyvwAH7CRwu+itnuVW5MXHIlXV70
	mirCWzA66LpLIJBbMPEIJDD14MWsA1d+7FTo4xUMc8gH2TZrqYCPfQ9H7s2glbiZPUbXyWwA8uV5u
	rFX/t2YOcm7TbzDOPRkw1CdvegwRUi3QS35E8/qBVcYrZBxN6ld4W3sysgmz6xW+utcyNUCQwFdV/
	KMSYA+24suthFpMkyDLYdXeJqi24epjnlxoEObLjDJV1sgOzyzZiPEYd6RLvvWWDwClSZHQWjaPrM
	AMnjbZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrbZ-00000001azg-27KV;
	Sat, 07 Jun 2025 11:20:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrNS-00000001Zxq-35Xh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:06:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-acbb85ce788so483048066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749294377; x=1749899177; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lt3KSgBpR6WlPCg8kfTF1qJDUFvaJVzc7YWDJmWgEtQ=;
        b=YiXkE1QO5b2s1nBF/9ukW+yFxGlrjiB31mx1xLIK2MGNo1DKx7rtetuMuyqCfQKcev
         UuNOdLIUYCxwZkK7Jx3Wgz2jWFJp5dbb6oJhi8nJL+dRzgguteEbN03WNlu2SIEqcm4q
         UffNff+16JR9hb+w8JVucX3cq97qhqzKwMD2fCgGmNxZSceWBDZTAg8yoasb1sXpu0bG
         DGpUhvF7EXoAHnMz0ItMrQPu/ALxRdisLvMJtg3j/UWRfnWKdv6J41muRzZiYKfvAhsT
         kabepRqcDNjI6pyuEBUgNW7V7GfXv3CYzLfxbrLmxbO/zSx6Zfgru6QG3EEj0pZwM3b7
         ar7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294377; x=1749899177;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt3KSgBpR6WlPCg8kfTF1qJDUFvaJVzc7YWDJmWgEtQ=;
        b=MfqFtCxeOW8vDGDXxD4muhfFaSx7Wj7hY0oCLr+jXV4tXP8amrym6RcXbNrwBUQcNy
         fFVPp6OyWzpKeL0o+oBgP1ZeHLcZEFM6G+U+9aD4MfvfqN/PTh9UfKCbNuMg4RBcS/Pf
         yPaPgIQmWa9RErSqYeDUwMZq6E3jE+G686CYVv8Go4OO9ify063H9fUYiUZOo56w3UKL
         ky7uhm7B06Bn/iUs3EH+B2ie6yd9sYgM3jIuZhUTJXgzRecUYQNZLbrfOUeZg1Ow2mWw
         WzDbczVu+/e8cSstB0PJgGaBQRmFVIzBxBXcz/UoZ0IBxexD4AVrpFKdBbX9ZMs5ADcK
         dr/w==
X-Forwarded-Encrypted: i=1; AJvYcCVVT0r4kcM2zvvTkIgcZc6elkMeVUySPzgW5eFn+ktqgXpKg4fGlrgmKP74gEo7Cn+8njJS8XvSEUKe9sad2qad@lists.infradead.org
X-Gm-Message-State: AOJu0YzozHJSwroM/gxHpgtx+0AkhBjjrCBcg0fpIMn65ivIzcf1LaiQ
	6m0aN/tt4/uzdU4Kzq6xiV2bJRrr933+g5TlNfxVqmBLr+lHt40CbNWyGEk1NmZwSDA=
X-Gm-Gg: ASbGncs4yP/Mpy1MsE/UE7Yt2YEKcAjdeR1JH4My4Km/hDGNaHTFoKzlJbU3kMKtixv
	RR1NnFEp/wkPLI5Az1iW7GtsJsO4tEXSa/RljnhdoenOEwZkDitkiVANPkcC2fDnRg3mWlvOwxq
	EmaGgAxNZabuq9i6O/sdJucuYz/GX9Sx6IddhIsyto5qnXbCbseCvKaZFwDvXQkL0GseDcQ9bqt
	RD3pcYLFMjBNQ4vyAuOMuwylQ+CyfPbgPyNnFqWNScF28k7/2LW7O01jark42kAe2JFEX+HFlRm
	6VX1HzyMhxkMKv7phuNb6JTVMbho6K0NGgWTeaIe2dZvDnaA0QBl04PHHFNePanwE7GG2mA=
X-Google-Smtp-Source: AGHT+IFSdfYKiUl2BcWvfS2STzA+hJhoZRwqIV3NcFsc20+0JtxX/iLZTbnRW+MTzqjMbWbFfUkh9w==
X-Received: by 2002:a17:907:2d92:b0:ad2:4b0c:ee8c with SMTP id a640c23a62f3a-ade1a92d206mr578163266b.35.1749294377136;
        Sat, 07 Jun 2025 04:06:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db5572csm257834366b.38.2025.06.07.04.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:06:16 -0700 (PDT)
Message-ID: <b9921d00-399c-4b4d-a880-320607b7d041@tuxon.dev>
Date: Sat, 7 Jun 2025 14:06:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, tudor.ambarus@linaro.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-2-manikandan.m@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250521054309.361894-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040618_782126_59769204 
X-CRM114-Status: GOOD (  13.98  )
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



On 21.05.2025 08:43, Manikandan Muralidharan wrote:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> index 8ac85dac5a96..13c28e92b17e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> @@ -44,7 +44,7 @@ flash@0 {
>  					compatible = "jedec,spi-nor";
>  					reg = <0>;
>  					spi-max-frequency = <104000000>;
> -					spi-cs-setup-ns = <7>;
> +					spi-cs-setup-delay-ns = <7>;
>  					spi-tx-bus-width = <4>;
>  					spi-rx-bus-width = <4>;
>  					m25p,fast-read;


