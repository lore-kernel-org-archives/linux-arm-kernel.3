Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0107CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbBYREB7EZz7uh97XCG/R2ZuqTlW8SyAHh+pi6ZvUpg=; b=1V1GoIhlqfbxsBRaEaihFt185Q
	nW/EuIS827vH2WEG+/r07NLmVKG79b83lX9JUUOavkDhd56gWKr8ewzwc2mYQWIpaj8ocB4f0ndgP
	Zo+J4+uMgO9cKN+WpEkm3nxkPJPQ4yEFCTX+Sl+kZYonhODi/zRo93VfRuy6MV/Qkpg1D64pO6Ija
	ExJcUueidFDXkEUssf1RUImFMJiwEDX5mHOSvzkAmNbjFzVOmNiN8+tJFkZbzpq8DaBTgFSfemM4Z
	5L3I8Zebz2tFD8lWGgnlGwT08rmg+0Ex3gy9FIB/eU2TTqSQBm85z0HFPBA5Md2OWRRSbaDWQ3b9J
	iMOGm4LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNs3d-00000001dBD-2cwB;
	Sat, 07 Jun 2025 11:49:53 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrwk-00000001cEj-0qdi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 11:42:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad8826c05f2so542347366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 04:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1749296564; x=1749901364; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbBYREB7EZz7uh97XCG/R2ZuqTlW8SyAHh+pi6ZvUpg=;
        b=bcxzGR2rXkRahkwdwaTbs1fLnPkVPL72jUP5yqSzdnxSM0vBHvY9EPewMj5y5psr2y
         dCgoQKSkTo+Bi/ntke7oKX3ISzZljsDmF3cnN9hFVEh7iqxwRPVCgtXFY71uaege1U00
         JqQQ/bfFHJdxqeP7ulWRng/r/RBpHkT/OiJJlMSeI+/pA86RHFc31WX6WBJ99jBOFawE
         e+L/QhZPUyEJra2kZ7ab9Jl1DsmwncLxRH9HHnIWg6sfrAZnNfb5Ncwg0ByS+bCU31EX
         WmEe4fiPZaGY3KLM8K68d28Jf59pNiPkI0XthqItTCJ6c0wcAemlUIxXfcaisxJvh5hy
         r3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296564; x=1749901364;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vbBYREB7EZz7uh97XCG/R2ZuqTlW8SyAHh+pi6ZvUpg=;
        b=AZ1Gf3RF3WphZ68gKjVaTDpADrj+u/mc0Gor2NkVDSIPEDfNyNmqwPGKXshhRnbSEG
         AgveXFT+qs5/6fRUfgfi2urKEhpxQYqheRXmPR6BIB74y+1POzsTPx1yxGXNE4Nm9xUl
         x5gGyICuveQtCvlOOZe4ylrOihMpykJzpg9l1+Jti7OuYjNozGazhVQ2fjIwcMqKf4dH
         js8OA+YGYN1bSOu5ViqC6rDfrmw5ng9OHP3hzOOHsOxhOEGxhOmdLBiRWhPyh76ycM+j
         q2Qz0xlrKON2aWlQvBrwpDDqsXXz1rRe2cCchiFlxYhZOYaFGLNK80E3bP1gdr1xufdg
         J40Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz/lwzkYkwDu7zcKMtoIy3hq9bj3Mq6K/MoUyw/+2FsUbF+Vk91o8X3BNiv91YKfueoty6I5QEqoxRegqmlJTc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fO0ImubRkyM2kPeXLvYfZIfrFCfZR5ArVxIy/CJfRm5mHdhX
	ha58AgevCEje7VnE1gYOREuBJVvFvKD0tVznyIIvs7lUeOG1Fa/BN4o9tIdTdjgPQmfsSaDlDIf
	brfs4
X-Gm-Gg: ASbGncvAn9mr9bx5lHME2bK6iJ75CLNa4MO1zRL2Mlu47dMu/axUgDH1VXdnh1wImQ6
	018gRfC93hsau3WuxcxbEE0ZhpkPaGxUUvIzbK/O2GNrakuAlwFkcqvR4faB/sXB8yxX6PvLaXz
	oGwCVNT6FGpvDdi9WnKqC9gXLoT6vNxdOAHgyjcV+I+IZRYKCSVItF+fz/w05ugbVAPeLoE5aUM
	2s5q0z2ta6dCmCRbCUj5MJNsMzdCrd11kGbmBsNr26UNQcF/+SMvZvHkG35uwE5xfn59rDQXPJR
	u/7qdnCAkRDrU1J0zVWuPDB6iN2vNXIOccS75Ryn6ILT0ZbtkRpLyD5RLhJm
X-Google-Smtp-Source: AGHT+IE/ghuMo8WxjRQEBBSzj3ZNMEtTZhSuX3aE1kpWDYjCFmKx98n9jZapdCOk71/aJ5kHwhIRQA==
X-Received: by 2002:a17:907:7282:b0:ad8:9c97:c2dc with SMTP id a640c23a62f3a-ade1a9fcf5fmr648393066b.15.1749296551642;
        Sat, 07 Jun 2025 04:42:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade35ce30casm151447866b.162.2025.06.07.04.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:42:31 -0700 (PDT)
Message-ID: <b355e01c-d9a7-47f0-bfe8-282d9152a814@tuxon.dev>
Date: Sat, 7 Jun 2025 14:42:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] ARM: dts: microchip: sama7d65: Add PWM support
To: Ryan.Wanner@microchip.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, olivia@selenic.com
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1747077616.git.Ryan.Wanner@microchip.com>
 <fae166010f94a672e4f1906f5fd4394f4236da53.1747077616.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <fae166010f94a672e4f1906f5fd4394f4236da53.1747077616.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_044246_251512_ED0A7477 
X-CRM114-Status: GOOD (  12.35  )
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
> Add support for PWMs to the SAMA7D65 SoC.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index 90cbea576d91..796909fa2368 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -293,6 +293,15 @@ pit64b1: timer@e1804000 {
>  			clock-names = "pclk", "gclk";
>  		};
>  
> +		pwm: pwm@e1818000 {
> +			compatible = "microchip,sama7d65-pwm", "atmel,sama5d2-pwm";
> +			reg = <0xe1818000 0x500>;
> +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 72>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		flx0: flexcom@e1820000 {
>  			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
>  			reg = <0xe1820000 0x200>;


