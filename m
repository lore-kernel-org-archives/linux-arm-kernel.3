Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A21DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv/mXKWMKUfLoohDMfoS7J+NTI2dz/TZ4RnHEggjlBE=; b=SzvLR/AKzYNGHWOPRNLNo/exRu
	y8eKHF3dSzv+ENZ5WT5BIYcbCvBgeesdeJ30Tv4qjy2PhtDHfjFdiLUpI5mf0HAk6YQKorahVUeSe
	XoNICGcXmvh9/la5TCXvGkNBiZJCDH9pmPsFsAyVQx1hGgtiXPsXiY3tZlEfPYHAj8k6D5wo0ki5w
	fVXTrA6WG1OtXTCxNW5tPj5K1dZZ+5fFT0mbaTR6YcFt8rN0fANN/PUomQZLCUi5wjxqfsC4JMH/D
	CGUSPbsToNUBB3CwobA+lE3D5AzLcQIlEs5Z15YzZ8/ggcIO20vqB1doO98L+J9ag9r0I04pi4990
	g+55Ht/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJEG-00000007LJi-3GgC;
	Tue, 18 Feb 2025 08:45:20 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJAB-00000007KNP-430V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:41:11 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abb8e405640so314127066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 00:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739868066; x=1740472866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lv/mXKWMKUfLoohDMfoS7J+NTI2dz/TZ4RnHEggjlBE=;
        b=gjWvti8MywrCN7ZofKJI29Fy6XqMYCqi12KFuhkPrX1QmLz32EzsfTnzREXKRsBdWJ
         w7S5mVsjGFSqXjBHlr6LQPcsjsf8YcBhu2oXjLgoCd1h8FCIXSJUGTBdr6o16ff1zy0A
         AaspA1l1ZZ9Gw/uUei1beFAVJLsIQ39nfNsejhZCK2E6K2I7DyK89qGIx7FPZ1Iaqs0W
         rdTbIBOxFTuAhcW4Ui1S3fiY1SpmvxQA6sAq+WBH7gXPIWk/dB0YHFvEbyLW0J8NZr2p
         GtXD7GgWJPCOtB+TMyBbG30hYcijnUFF0FbgpX9EkUrOm3f8oWSjVr9J1eA/9yn+3yzQ
         3Sfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868066; x=1740472866;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv/mXKWMKUfLoohDMfoS7J+NTI2dz/TZ4RnHEggjlBE=;
        b=df6px2NUbOH7iiNqo0mUMAJ4NkmnDto988goILyHW8Zo/zzNIczOb0XjhKL24qgm0m
         7unvxHLPq9M1gR4ioqXLGt9RS4tpfeeXeSkxuGMsov28E+5604S/AFA4FF+kZRT+v/+d
         SxFzESnn8CFdgsMBFjd/Q+tWUpihdro13KeC2jXheHFf+6Nk914QQDjIeO2iregDxd3g
         aALNahLKP7zxY157smNUtYGYguLK4Sqrtz6KMkWUeel207Zd4bJTcPPnxMd+6GJCI2HE
         U9nfnnmqtY2k1RHFOMwvgoJ0NyM8udp+eQyNtl+oWgt8weUPfZeDUUaYg3Wu8YiO+lSv
         qobg==
X-Forwarded-Encrypted: i=1; AJvYcCUUk5h18mcNYRfRBpCrzLZL7CEmpYztkgB950E8CBZ3lt3lbJxJ0j5C9lZ2N5FUwZk28Vk3vCdmMujVvWhZtvlp@lists.infradead.org
X-Gm-Message-State: AOJu0YyL0eTOJEjuXvQyX+K4DgNfQc++yFuFJ+NmKneobFjLrTAe1qf2
	kVPUVVhX1xPPbxmz2ME//7Jii3iTmMZNEljqXdF7Qzq4VT+Qxpj+FaWpfkZMSCI=
X-Gm-Gg: ASbGnctjvqgmiK+tNcpdApFVv4Zl96jhiGFGTgVHL9VmlyH2Xc1QxuFdply/Rj5I1DE
	DzeoF9ZXPTTFNdTLrGr297Y/zzPiMUoVvrrG9RjYU6PXEILMWs29mqfHfTFG6xCwfj965r4GiMs
	jpolvSVQ0QUpscDXwjK7BbOTEth8rPPg9JBBU+9iIT2e9LKpgbFow96W3CSiWhF/gOJLTRYYVqj
	yQVUzCP4kw2eFcI6+ZvN0MtP66cIrBkR4v1OhwVxI78D7EyFKMwg2BWIChBZtJbyeUIRnDJ9/Ze
	nn8gNigvjwXs5U6uIJpJ/vk=
X-Google-Smtp-Source: AGHT+IESJYF9ZfQnOU6rdJpLeVFJ0jmKCKyIk4s175nUK6ewa/oKH2Y+cggyLDQb+JelZTRVjqvbag==
X-Received: by 2002:a17:907:d204:b0:abb:b249:4410 with SMTP id a640c23a62f3a-abbb249464amr346278966b.39.1739868064851;
        Tue, 18 Feb 2025 00:41:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb961594absm384261766b.111.2025.02.18.00.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:41:04 -0800 (PST)
Message-ID: <05f1e875-0068-4b3a-a400-e906605a3cda@tuxon.dev>
Date: Tue, 18 Feb 2025 10:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] ARM: dts: microchip: sama7d65: Add DMAs to sama7d65
 SoC
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, vkoul@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <cover.1739555984.git.Ryan.Wanner@microchip.com>
 <78da4125a991c6f4081fce78825f1f983091e0f5.1739555984.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <78da4125a991c6f4081fce78825f1f983091e0f5.1739555984.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_004108_107445_C1F03905 
X-CRM114-Status: GOOD (  14.44  )
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

On 14.02.2025 20:08, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add DMAs to the SAMA7D65 SoC device tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index d06a51972d363..b472a7d929ee4 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/dma/at91.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -95,6 +96,17 @@ chipid@e0020000 {
>  			reg = <0xe0020000 0x8>;
>  		};
>  
> +		dma2: dma-controller@e1200000 {
> +			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
> +			reg = <0xe1200000 0x1000>;
> +			interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 23>;
> +			clock-names = "dma_clk";
> +			dma-requests = <0>;
> +			status = "disabled";
> +		};
> +
>  		sdmmc1: mmc@e1208000 {
>  			compatible = "microchip,sama7d65-sdhci", "microchip,sam9x60-sdhci";
>  			reg = <0xe1208000 0x400>;
> @@ -107,6 +119,26 @@ sdmmc1: mmc@e1208000 {
>  			status = "disabled";
>  		};
>  
> +		dma0: dma-controller@e1610000 {
> +			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
> +			reg = < 0xe1610000 0x1000>;

There is an extra space b/w < and 0x. I can adjust while applying.

> +			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 21>;
> +			clock-names = "dma_clk";
> +			status = "disabled";
> +		};
> +
> +		dma1: dma-controller@e1614000 {
> +			compatible = "microchip,sama7d65-dma", "microchip,sama7g5-dma";
> +			reg = <0xe1614000 0x1000>;
> +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_PERIPHERAL 22>;
> +			clock-names = "dma_clk";
> +			status = "disabled";
> +		};
> +
>  		pit64b0: timer@e1800000 {
>  			compatible = "microchip,sama7d65-pit64b", "microchip,sam9x60-pit64b";
>  			reg = <0xe1800000 0x100>;


