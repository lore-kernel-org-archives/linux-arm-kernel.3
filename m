Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AACC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UymOFrjabx3ry9XfCk+Bu/z/xm63u4bINQR9bUcHuP0=; b=ak+Tu7fiDkecceuafe9rKMelAI
	tT6XJfKC98p9ETcqNeuSpkOD4EBdJUhmFUBLWGjmX0pmNCF+/ltgtJtcScK9X/dXtoMVMY+dTM2Qk
	c1GfEznJsOehDXgKqrDqNZgZS1i7ECKVZ00DRtapbGwKe8rBdPt7i5Y+IMkgaigVDJrp+9OJga6U0
	1mb3mlei+bPmibaB168d/9XkBEBJzTcVpJB0V2bk+APDcGKVBXY79p2iGN3GFBx4si4PYvPf1+7yM
	pne0Ar8KGJTXr13erQglw3+UQS60nFV/DcQZwX5ErOlodqOWDRXpJzY4Cpy6nkuW6oK6h39h77Pl0
	/KKrECaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs81-00000001deg-23Sg;
	Sat, 07 Jun 2025 11:54:25 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNryF-00000001cUf-1uBd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:44:20 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad883afdf0cso554673866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296658; x=1749901458; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UymOFrjabx3ry9XfCk+Bu/z/xm63u4bINQR9bUcHuP0=;
        b=hhntLi2L2GVhtg4hlv3AzG6rtfzJlSn+FzzB4InyIVLt7Wd32a96oKkdF4x4rSp/t+
         6nfvma4njpONqztQV0r1s0h0LmVy6akZqmpMJTlZyqXryltRBzCz/bHf1QCziP1Uv1TP
         ac34yFzqJ0B/3EA8nOJHpN7/+/FcGgPlGLAhLlAWXJqNUNhL5C7TQPkw10exGGzlMnGq
         lt+HCDlyycAk5R2SHqiCqTvuENA87XEUum2C7huyqq9StXsvgygxstk7gCdu16MUYpf5
         7FTR+UffYLugZQZg5QG2pbrA7qzC3LpuiCnfKGmxdCXcXRfRK2WYCuWSaEDnDIN291P6
         DtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296658; x=1749901458;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UymOFrjabx3ry9XfCk+Bu/z/xm63u4bINQR9bUcHuP0=;
        b=Ut3lThyjB9hUDWC+5iJd+D5p4GeqeHMMHZbFiWO2bzXl2Bv5ywdInyLBRpaKRCWxYe
         tPssy7vu0Te4KMksbTnFnooJdA5vTziFxbqcz/Sr3J0cg8yHhc8fZFIpKX7ll8e5PjZG
         bGJ40CBlZmOBqEnWB8wUnVDLaXVvt5gH8PjX9MY0q98FCBdEjCquKTiXFffJ8STtAQal
         pWUqXIWQm5lntuNKVEBHyb4WxanXVwBe2ElT/wJyPmwhPzStlebedvuI7kI3PmCRVqFV
         0AJ0H+DBfB7SvLQ18ZBjCefcLD8bqeovVRB7lks4Y6L2Rg70CoA5Nh3pEnhwUfEwO1Dx
         cWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF/CMQ8QkBhnW4zPpc7zNsYxmCWzRtV/xmiCHIaIpUSqFZU+uAOkCeRZt1XRqiiFbyYOYKMN4kyEGmqH3mpKEK@lists.infradead.org
X-Gm-Message-State: AOJu0YyHVPA7XztPZy7lbvz1E9aN3qqwvJnnkUknj/EVBBsjsf0b6E1r
	DOSZivn+W1ity17UM93NDZjH9EM4rUaq2kw6DnfEpYe/+UgEJUNm9xW4LMMpzGt2qPU=
X-Gm-Gg: ASbGncuAPtbxWJ2jOTtX8JsdL5eztr24ehwRNXo1PVG9SaYDIsbDej6GHRWD749OR3S
	Y3TuzEvjkaSmNPm5VVdAgHafyQfAAsw04318k01q0eIksLU/P6DNFR6JLP0/UJ7AbtC6yg4KrAd
	yDjzJhPa1M1ci9k4euAxoOx+3uUUVK5QM9gIB0cARlr16N2kQkwGzWisaOHJDoKJBS9gLgkCY7r
	7RypeDdeDqWJCDwDGNbS9H+18xTUftzs6HWnirhxejWSNPmCaa/RoklNPV41l/uFRTc44z9Jm1t
	b4Xnr034C+UWBMzBn0fMovLcNME/4AMI5YBYpE8x54/+vE5Znnm7pcsEQ43BLdczCYZIDfM=
X-Google-Smtp-Source: AGHT+IEA1Rq7VWwYJS4G4kmb+z0nn7gMvEpZQk2GAonFxGlvr7kubnoaKOkM5BseiEpQ88K45+xR8A==
X-Received: by 2002:a17:907:9713:b0:ad8:93a3:29ba with SMTP id a640c23a62f3a-ade1aa06c53mr606411166b.17.1749296657956;
        Sat, 07 Jun 2025 04:44:17 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d5f9b37sm264185666b.0.2025.06.07.04.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:44:17 -0700 (PDT)
Message-ID: <9391cd59-b23a-4df0-9799-e9766adac460@tuxon.dev>
Date: Sat, 7 Jun 2025 14:44:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] ARM: dts: microchip: sama7d65: Enable CAN bus
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <0e34e0416c43f4de6d2cef5cea46087af4577a50.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <0e34e0416c43f4de6d2cef5cea46087af4577a50.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_044419_498176_5F8FE601 
X-CRM114-Status: GOOD (  14.96  )
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



On 12.05.2025 22:27, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Enable CAN bus for SAMA7D65 curiosity board.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index 53a657cf4efb..34935179897e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -38,7 +38,24 @@ reg_5v: regulator-5v {
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
>  	};
> +};
> +

Please drop the empty line in a different patch.

> +&can1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can1_default>;
> +	status = "okay";
> +};
>  
> +&can2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can2_default>;
> +	status = "okay";
> +};
> +
> +&can3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_can3_default>;
> +	status = "okay";
>  };
>  
>  &dma0 {
> @@ -278,6 +295,24 @@ &main_xtal {
>  };
>  
>  &pioa {
> +	pinctrl_can1_default: can1-default {
> +		pinmux = <PIN_PD10__CANTX1>,
> +			<PIN_PD11__CANRX1>;

The "<" on on this line would have to be aligned with the one on the
previous line. Same for the other places in this patch.

I can address all these minor bits while applying, if any.

Other than this:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +		bias-disable;
> +	};
> +
> +	pinctrl_can2_default: can2-default {
> +		pinmux = <PIN_PD12__CANTX2>,
> +			<PIN_PD13__CANRX2>;
> +		bias-disable;
> +	};
> +
> +	pinctrl_can3_default: can3-default {
> +		pinmux = <PIN_PD14__CANTX3>,
> +			<PIN_PD15__CANRX3>;
> +		bias-disable;
> +	};
> +
>  	pinctrl_gmac0_default: gmac0-default {
>  		pinmux = <PIN_PA26__G0_TX0>,
>  			 <PIN_PA27__G0_TX1>,


