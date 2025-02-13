Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E538C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vizM0Sdo+SZTTaKpC/1DIJWgscYtW1gDxvN+iGD1EdQ=; b=EWkcNXAmH1B+6ZUQ5Law6wlkJN
	MzHETgi7OUgcp0hPg9OVUVvxnSXX5qbBiYLwuzicmS94XqfUsSMzgRJgXG51/ZKqjYpjTgluC1mKV
	lTFOgkGiSKtWA6L1xmnqcJUtukv37F1cLJYJhyrer790uhJdI/mC51/w0vkGMGcE+XTzlHeJZ7cdk
	b7SUILh7Vir1JJdAqAD8gmqFXWIUZZL+N1GNNbBcQ9IerQkx1MI4znf9PbXINjftaMoPi81i9h/gC
	8JAtcZFrD8DbafpIwY3WfG+ktJqfUE68jbENvtfUwTXNF7brgUqBp6MdFK1gm6UUeAjzRWARVuDLp
	MxK3i49Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTq9-0000000A89Q-1ZTs;
	Thu, 13 Feb 2025 07:40:53 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTnz-0000000A7lK-1XNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:38:40 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso93477666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739432318; x=1740037118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vizM0Sdo+SZTTaKpC/1DIJWgscYtW1gDxvN+iGD1EdQ=;
        b=xq0mXSsPcmjgU3hvoluJjQ7YvX6Fhdfe4beg/+TkyIZ12T0hcXZ6utdFFEryTjOWR0
         w3c58CfwVobrMJ5ziN4KBCwoLONmjwCkzNvG07OVADbHIOpPfxe1AKsnl5q9Gd9E7R34
         ssBDVikRywK7qjKZq+HP+nifIE5d9+beCFqIoEX7LHk6OlKFes+nQWXblhnO+k6f06Lk
         jgPEe4U7MKV0DQInmY6XeBz5FItDGC0f4Jhx/bdmmIrYWkTYbB8RLb0AK8K4H40PnNlI
         yOhTHz1kbjiN+fuaJN604QbCzBuHmQfB3qHpI3NZcepgkIzuyN1/04VgEa5WG3xcPEHB
         u/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739432318; x=1740037118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vizM0Sdo+SZTTaKpC/1DIJWgscYtW1gDxvN+iGD1EdQ=;
        b=leadohL/GIkTxdNlLW7+LJEmTjuXD1LavBbW+wXQog0ML4/gm9sY7HJfjPBx51TJ52
         bYaP4S/L63uMz50uVF1GPskwKKVKpJZm5Yg+fhSntCsZ6I8ABi6wO4efXwpma6h1fVky
         zOhBUmKFWmRvQZLklKhquoQlEm2rzrvX1ByJEQqgZ9+Z7coH1L/lTlhAEaFWS3LXbOEv
         WgRrP663CtPP6Oh1qQs4F+IB+KV5Y+8Xec1MSIcwAsLXDi+3/GB04gvRDs6HP3hA2HSK
         Nzi7QGq3HhVFfQuJypmU9FjLWZiwJzDGkIE/H0ACV4DDiM/2/H+M2NHcmDT/xUKearr1
         MwBw==
X-Forwarded-Encrypted: i=1; AJvYcCVKuzvnz9BCTsHFrsah4842J9cqTCqkziR2yB5TDBvG+Y+3eeHLRQO+fK/YqCdgafxfByQDpNRz06H4KMj8q/FY@lists.infradead.org
X-Gm-Message-State: AOJu0YzRQLrQsiYMvWDnE2K55y2JWmTZ2YsDrXBYYCBd4uehcio/RDrB
	zj+L970rzSB1RVzTQA+pYdN+zxS+oZY+v6ICX24E6ZcX4UfMwhSsy3q+idXnjzQ=
X-Gm-Gg: ASbGncsTVOvCGGxHDZzZL7uikKG5ZAJExCaZUda07ES8lFRV6nudY0InGGENMq8PNwA
	kcjQTmnewtc3gO3bQclJHUF8Qp2UNw1zw9d3Sh/XG9wFmiOevhgkPzXhgK7VtPtaRrEHZXBtW+x
	Qov8qsgXaaDHRskUFqxPSuw+WnIVEiN6Z+3plNfRIbh1FrwiB4sNfZhxYzv1/ohmsxdt+K3maWs
	f54KX3NfU6aSz38Pi1p7O44e9r+A1RKSG15ksC74tMHFwiU+ATJX51OlpahBDkBIxvFEi9PjZzI
	AQz87HXVnobPX2TwHjN3PD3H
X-Google-Smtp-Source: AGHT+IHDPN30IeTPgZSQ6r4lGFgS4tkcB9qst37osdGIW9i7ciqPaXGYBjTXuWeMR8vFNohAyFOWCQ==
X-Received: by 2002:a17:907:1909:b0:aa6:ac9b:6822 with SMTP id a640c23a62f3a-ab7f3344473mr607557566b.12.1739432317767;
        Wed, 12 Feb 2025 23:38:37 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53259517sm75356766b.65.2025.02.12.23.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:38:37 -0800 (PST)
Message-ID: <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
Date: Thu, 13 Feb 2025 07:38:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
To: Denzeel Oliva <wachiturroxd150@gmail.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, semen.protsenko@linaro.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212234034.284-4-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_233839_429929_CA802EDA 
X-CRM114-Status: GOOD (  15.40  )
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



On 2/12/25 11:40 PM, Denzeel Oliva wrote:
> Universal Serial Interface (USI) supports three types of serial interface
> such as Universal Asynchronous Receiver and Transmitter (UART), Serial
> Peripheral Interface (SPI), and Inter-Integrated Circuit (I2C).
> Each protocols can be working independently and configured as one of
> those using external configuration inputs.
> 
> Exynos990 SoC defines 18 USI nodes in PERIC0/1 blocks.
> Nodes have different depths from 64-256 bytes.

for the reviewer's peace of mind you shall specify whether you tested at
least an i2c, uart and spi node.

> 
> Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 1693 +++++++++++++++++++++
>  1 file changed, 1693 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> index aa056fdae..22ec92a45 100644
> --- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/clock/samsung,exynos990.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/samsung,exynos-usi.h>
>  
>  / {
>  	compatible = "samsung,exynos990";
> @@ -248,6 +249,808 @@ sysreg_peric0: syscon@10420000 {
>  			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
>  		};
>  
> +		usi_uart: usi@105400c0 {
> +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
> +			reg = <0x105400c0 0x20>;
> +			samsung,sysreg = <&sysreg_peric0 0x1000>;
> +			samsung,mode = <USI_V2_UART>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			serial_0: serial@10540000 {
> +				compatible = "samsung,exynos990-uart",
> +					     "samsung,exynos8895-uart";
> +				reg = <0x10540000 0xc0>;
> +				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&uart0_bus>;
> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
> +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> +				clock-names = "uart", "clk_uart_baud0";
> +				samsung,uart-fifosize = <256>;
> +				status = "disabled";

node properties shall be specified in a specific order. Follow similar
nodes that are already accepted, gs101 is one.

> +			};
> +		};
> +
> +		usi0: usi@105500c0 {

cut

> +
> +			hsi2c_0: i2c@10550000 {

cut

> +
> +			spi_0: spi@10550000 {

cut

> +			serial_2: serial@10550000 {

why not serial_0 since you're in USI0.

> +		};
> +
> +		usi_i2c_0: usi@105600c0 {
> +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
> +			reg = <0x105600c0 0x20>;
> +			samsung,sysreg = <&sysreg_peric0 0x1008>;
> +			samsung,mode = <USI_V2_I2C>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
> +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
> +			clock-names = "pclk", "ipclk";
> +			status = "disabled";
> +
> +			hsi2c_1: i2c@10560000 {
> +				compatible = "samsung,exynos990-hsi2c",
> +					     "samsung,exynosautov9-hsi2c";
> +				reg = <0x10560000 0xc0>;
> +				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&hsi2c1_bus>;
> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
> +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
> +				clock-names = "hsi2c", "hsi2c_pclk";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};

shouldn't you define serial and SPI too?

> +		};
> +

cut

> +			spi_8: spi@108e0000 {
> +				compatible = "samsung,exynos990-spi";
> +				reg = <0x108e0000 0x30>;
> +				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&spi8_bus>;
> +				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
> +					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
> +				clock-names = "spi", "spi_busclk0";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				fifo-depth = <256>;

that's a first. Does downstream define any SPI node with 256 bytes
FIFOs? Would you please point me to the downstream sources?

Cheers,
ta

