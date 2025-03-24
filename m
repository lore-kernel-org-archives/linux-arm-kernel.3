Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B3C36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxmUD/FejQdyxymWW6D2EaGEGo6cGnFlUrvcW9z1uFY=; b=L9GdDbQCRK8ELcsYMNuvzPuXTs
	ZXA5KdYegM/shS7vUHDd8gSU7Tidrc9Pkd1pU0nO6TmTeUwD11ysWynvB12EdZuanPcUjE4tpTsv1
	FkCsmW+xSU0Qxs/8J9TRdHpo+ilOtXolhJEE8J3LZracrAXnYfXrBzQgQs3PcLH/SgVWH6o02Idtl
	tPOcKRt8dY6SOmH4txK6q5fa+9heXBtlcIglqyFHK0z5VfVinFBCy8jIvuEf+mB+0Q3FatZOabZd3
	1oX58nPchpWukAGLQUHze2P6/OTaeH2vG04vZ6vePYddduZ7hUt834XB4CFqjd+8oDerIqcw2uHdV
	V3rzKtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbsg-00000002Oga-0tnk;
	Mon, 24 Mar 2025 07:05:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbpq-00000002OPV-2z2u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 07:03:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso24834245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 00:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799777; x=1743404577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxmUD/FejQdyxymWW6D2EaGEGo6cGnFlUrvcW9z1uFY=;
        b=UXcEJk0Kr+loqfYmHS0VTVcJTm/c4PieXVXoXpuIeG9a4+45BvvpRwVH73qIuj/06T
         BHdGXJbB/gvpdScnWGfOAU8B61sp5fyuXUcAv/l71sKFKVDfB09d6aeR7YK90GBheXCl
         zi7jVrq8el6ys4jOyooUCRqTT9EGyLL6jEAkpNshl6+M7/WtEcwS7CUp7VBZ56srMDQ9
         sd8bQFNBz7bQPATep9imklGM2rtqrxV9JdKo+/wdxl7NdLnX61sE990/XHH4Zj0dNfC+
         NQXPJ9AHprFnTcQAllpGqFdJIPz+bmvdTrgPryDx+wXgFDpVyoeyCfeXMHUpLU9uktD+
         uVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799777; x=1743404577;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xxmUD/FejQdyxymWW6D2EaGEGo6cGnFlUrvcW9z1uFY=;
        b=wPTsYIVJG4mdhkXQv1NEVjpMHUWbZpzoqWMuR2l458yFR40Pswu7Ulfo2Cz93K1Ku2
         Xm9nCnh7hjnoneoqEzHl0LIkCSY0ToKS87tclUGiI5sta3O4riCKZTo4vQ1//cWjN1QC
         dWR4mDYO1GU7eF62tOET/dxc8dm5FYeTWoTnk9X/0h5lB24IrUXoHWPnzo9ISj5HMNI2
         yTLp4pscSUyIR31TqXPaQReGg++CjpQBsNOtBVv2oGPFBJm2oKByzGcR6QaxZnDAt/TS
         UZ9sI5+gqjXmbSC62oCn7nrSsOw9vVTdUY+Xb7SUEKu+C7VQUxEQ9goGpeWNAjE8ZJSH
         gCEQ==
X-Gm-Message-State: AOJu0Yzv9pDwzD6k4f1eQSTkpfQ1BcHdK8jgFftkf7uzP2pPnyYKZidM
	CJxRH/5ZDa4TGwfpgoiwA4SxooqeTB7YLM63sw8lnebUVRQjDCTvhVmHDAoTdYg=
X-Gm-Gg: ASbGncvQlWNf+L0g+f5lyVJLRYYs6l9IjY+3TCFeSIgg/z9AEqsFNzjuz5AXk8z7NzK
	eJB6BtUZnRKlM2uFLRgN8zSoYO1zo7kI0T+U+XkCNb+KdzJGugNOwHeMAuLsQpSVxgFvm62hAyv
	M1Un54yRZRsPBd0c5zb2sOgGKPgJkvSII6p0XbLjOGELuplph2aIJaN9x/gX5ie+1aKzSbbp4iv
	04rjmV0jFqZDWD+fPFVL0/7C+UfSxcHz9Y6haniQnWjez2ssXXP+lnkS6DhScpXKXIo2H6RsyCz
	tkBfCWcvjsXjGLR3YAM6PEHD+q09kv9fmzSom0peyw4Ga4FJoC3P/KvtvMR1s9a79jhIDVp/fQU
	dW6ythtKWdFwh4wx2
X-Google-Smtp-Source: AGHT+IEvnuv2O4FApGfvybSU5o3Rs8N1aGcC10DtuNPFGrxOLbDjQAe94Ll7vrnr/jictCvIm++FnA==
X-Received: by 2002:a5d:5f4b:0:b0:391:4873:792f with SMTP id ffacd0b85a97d-3997f937b48mr11238511f8f.45.1742799777129;
        Mon, 24 Mar 2025 00:02:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f? ([2a01:e0a:3d9:2080:a356:8d0:d4d:bb5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd2798bsm112856625e9.20.2025.03.24.00.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:02:56 -0700 (PDT)
Message-ID: <f36875c5-73bb-4bf8-a59f-5df30043bbbe@linaro.org>
Date: Mon, 24 Mar 2025 08:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>,
 Christian Hewitt <christianshewitt@gmail.com>
References: <20250319190150.31529-2-funderscore@postmarketos.org>
 <20250319190150.31529-4-funderscore@postmarketos.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250319190150.31529-4-funderscore@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_000258_789318_D160BE5E 
X-CRM114-Status: GOOD (  22.44  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 19/03/2025 20:01, Ferass El Hafidi wrote:
> Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in
> 2020.  It is known as `xiaomi-aquaman` internally.  Specifications:
>   * Amlogic S805Y SoC
>   * Android TV 9, upgradable to Android TV 10
>   * 8 GB eMMC
>   * 1 GB of RAM
>   * Wi-Fi + Bluetooth
> 
> The devicetree is based on p241's DT, with some changes to better match
> the Mi TV Stick:
>   * there is no Ethernet port, no IR, no CVBS connector on the stick
>   * a white LED is present
>   * adjust memory to have 1 GB of RAM available
> 
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../meson-gxl-s805y-xiaomi-aquaman.dts        | 292 ++++++++++++++++++
>   .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
>   3 files changed, 303 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 2fbda8419..0921707f1 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-hub.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-wetek-play2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-libretech-ac.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805y-xiaomi-aquaman.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> new file mode 100644
> index 000000000..42c692017
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
> + * Heavily based on meson-gxl-s805x-p241.dtb:
> + *  - Copyright (c) 2018 BayLibre, SAS.
> + *    Author: Neil Armstrong <narmstrong@baylibre.com>
> + *    Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-aiu.h>
> +
> +#include "meson-gxl-s805y.dtsi"
> +
> +/ {
> +	compatible = "xiaomi,aquaman", "amlogic,s805y", "amlogic,meson-gxl";
> +	model = "Xiaomi Mi TV Stick (aquaman)";
> +
> +	aliases {
> +		serial0 = &uart_AO;
> +		serial1 = &uart_A;
> +	};
> +
> +	au2: analog-amplifier {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "AU2";
> +		VCC-supply = <&vcc_5v>;
> +		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-white {
> +			color = <LED_COLOR_ID_WHITE>;
> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +			panic-indicator;
> +		};
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x40000000>;
> +	};
> +
> +	vddio_boot: regulator-vddio-boot {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_BOOT";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	vddao_3v3: regulator-vddao-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDAO_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	vddio_ao18: regulator-vddio-ao18 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDDIO_AO18";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	vcc_3v3: regulator-vcc-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	vcc_5v: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "XIAOMI-AQUAMAN";
> +		audio-aux-devs = <&au2>;
> +		audio-widgets = "Line", "Lineout";
> +		audio-routing = "AU2 INL", "ACODEC LOLN",
> +				"AU2 INR", "ACODEC LORN",
> +				"Lineout", "AU2 OUTL",
> +				"Lineout", "AU2 OUTR";
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +
> +			codec-1 {
> +				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&acodec>;
> +			};
> +		};
> +	};
> +};
> +
> +&acodec {
> +	AVDD-supply = <&vddio_ao18>;
> +	status = "okay";
> +};
> +
> +&aiu {
> +	status = "okay";
> +};
> +
> +&cec_AO {
> +	status = "okay";
> +	pinctrl-0 = <&ao_cec_pins>;
> +	pinctrl-names = "default";
> +	hdmi-phandle = <&hdmi_tx>;
> +};
> +
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> +	pinctrl-names = "default";
> +	hdmi-supply = <&vcc_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vddio_ao18>;
> +};
> +
> +/* Wireless SDIO Module (Amlogic W155S1 / Realtek RTL8821CS) */
> +&sd_emmc_b {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <50000000>;
> +
> +	non-removable;
> +	disable-wp;
> +
> +	/* WiFi firmware requires power to be kept while in suspend */
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +
> +	sdio: wifi@1 {
> +		reg = <1>;
> +	}
> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	max-frequency = <200000000>;
> +	non-removable;
> +	disable-wp;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/*
> + * This is connected to the Bluetooth module
> + * Note: There's no driver for the Bluetooth module of some variants yet.
> + */
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +};
> +
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb {
> +	status = "okay";
> +	dr_mode = "otg";
> +	vbus-supply = <&vcc_5v>;
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
> new file mode 100644
> index 000000000..49b29b71f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Ferass El Hafidi <funderscore@postmarketos.org>
> + */
> +
> +#include "meson-gxl-s805x.dtsi"
> +
> +/ {
> +	compatible = "amlogic,s805y", "amlogic,meson-gxl";
> +};

I get:
Error: arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts:243.1-2 syntax error
FATAL ERROR: Unable to parse input tree

whil building, could you fix that ?

Neil

