Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E228C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhUcXStbQHEQGgrql9pf04utNrK9UGJvJvDDzUdzIwk=; b=zkuNbqMy0uhKQf/O2wqAxvxxeX
	079eMDzLh30PlHioMMZ0uWjbm0M5aBgknNsZF3uQk0nkclO9Ac/IZHVLVuNM1VrHi+j1GutGuQDTh
	b2/BGc6noOTa/CjCIlYI1owGrnKMlsV3fHtAYF/Yx+r4pndLfLSQM0odinglpT4PSc3cgj6+pEIIo
	2RQ1vq0Haty3ioNJjfwplWGpKzAyReauMnTyuzvsrjikfCg7EZJo0Y3S20YWlAGmgS5ExABlIdce6
	RbsEz+ZMGhTTe5mqG3j/p++Rf1iKJvtUiT157ANITmFXflIufHWBaLYCZ3OafUlmUPOYj0fviY6jb
	VaX52ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodGH-00000004iw1-24AU;
	Tue, 28 Jul 2026 08:34:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodGF-00000004iux-01qm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 08:34:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-495437bb891so6348565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 01:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227641; x=1785832441; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhUcXStbQHEQGgrql9pf04utNrK9UGJvJvDDzUdzIwk=;
        b=dqv+3OAP5iNczFv12y9fITo3PpBuCUyHzxU/+K9R+YW44g/l/q4THtI9G9afMJVIPy
         /jre0hf5FqJktdofzn2MkPxOTzPWZP876dtPCn+cAYxMiw0e7JppH29Ma+WcjaghFxBK
         6fhFPv0tRZmQWUGctB3YnPASJ5sePwy6t/TaffJ0+v8iipFAO0PSQG6RKKqNJOn5nw21
         TvTISO3zvBBNEYvIcxbtwlZFIKpdPt3waobi1XxRzV4peeF0VBriWRKJEtXIDK3rN2P7
         2Pgz2R1tQHc7T7CXxmM1GuUYWbrqPSlz8/2CbAQGzSBF6E+mKECREBMMLpq0dpvmISfD
         Kjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227641; x=1785832441;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhUcXStbQHEQGgrql9pf04utNrK9UGJvJvDDzUdzIwk=;
        b=ZymwH48Om79CHPhdK+KZnfIgubJ7SoI26AK79yDPaNTqI3BKkflMKuXQIR9FivGCGn
         bEy2t6wKJI6c4c+6/Ya1bwwyR8hqBwfD6jzJTc0YWUvMkQWW0qCQ8uSRKJ0iZKaCEmvz
         KZv099UfDhil0XQvsyAsbHt88BTg3BAWWF3KZmuP+lKhc3qCRJQT008Jgo3GWbXbh/Gu
         ZYX1xG+n0tPctMOc7nrPi7eshLmsS7X1YtErLHMLKlMTTFtJWDpoH9rgQ2mu5WoLqmm9
         ToBX49IqNFovSvfAkWObutsj0bOhIuqHx4BZdTR+ZLHx7VDSlSq0wi7jIiGO6zUC6CQX
         dncg==
X-Forwarded-Encrypted: i=1; AHgh+Rq17d1/w8NPZVagPaPXzoI6osTplqDB5i7Q4W6bYKgAujtAXDeQlaCsrLDLD4ECvWOO419hv7UnF5jyxhsPRKkz@lists.infradead.org
X-Gm-Message-State: AOJu0YwLI0/v8BLhA+NFaZJFOTIRdBNkk1y3Mb3zycEppmwiyhLyPIUm
	Hs7IDgAngFZO92/zz+SwFGS5yHwsxSioWnc3Cmn50wBXz8+Q4VxTtl9JLFr7KBf1+rI=
X-Gm-Gg: AR+sD116TdtceIvGTHal+nqcEDjPA4eGJYKHEG/25gqo+SlJR0u2w9+SFQVSYjZtN08
	kEE7SeRf+OceRKCjEZpd2rYZZPRjMkAf8Wqh3F9vsgg/I8SP9SMVFZpabSr1XVGttberJH+Ew4G
	OKQeyTIJxoPejCamtQHzv710R/DhM0KtAA8hKGCyQ2UwvYMCldjD1s1qdEiMLUvvjlQKtGbDj2k
	CTUMyaSq+BHEIpxX8+9mC27EdWnycfbU/Qd2OC4as/rDA1+VrQrz6l8/LvVwXwj36Tk0Jx04y1U
	+p4uTvwhaKJikfFx7qkE/BhMja3eXqgqXOOS9Mx566g3DEAtnhF4ydhLL4NnVBXBvVB/W6voHvE
	mDPIgr9QVl/QxzSU4d4rJZdFtJ3c6o8FOZgd/qdLihsZtikxeSYDnevzXRtlNzJWYS6JbfvlPOT
	1TMH6A5kJEqSo0aG32f4VxZ5etxxjFyZEahCxjDpT0qLtD4QsLC+2turwefg==
X-Received: by 2002:a05:600c:4f92:b0:495:6b4c:fccc with SMTP id 5b1f17b1804b1-496c6575c2fmr12813725e9.10.1785227640542;
        Tue, 28 Jul 2026 01:34:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f99fa7asm325811625e9.2.2026.07.28.01.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:34:00 -0700 (PDT)
Message-ID: <55e28633-d71e-4cc5-a682-341c329054f6@linaro.org>
Date: Tue, 28 Jul 2026 10:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
To: robazza.alberto@proton.me, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260726201647.264108-1-robazzalberto@gmail.com>
 <20260726201647.264108-4-robazzalberto@gmail.com>
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
In-Reply-To: <20260726201647.264108-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_013403_083866_15E9653B 
X-CRM114-Status: GOOD (  24.42  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/26/26 22:16, Alberto Robazza wrote:
> The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
> an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
> BCM4345C5 Bluetooth over UART_A), HDMI audio output.
> 
> According to the original Linux dts, the board is a modded version
> of the ODROID-N2, with Amlogic A311D instead of the original S922X
> and WiFi and Bluetooth support.
> So the device tree builds on meson-g12b-a311d.dtsi and
> meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
> extended with the board-specific GPIO wiring for the AP6256 handling,
> and some modifications for the led, GPIO_ACTIVE_LOW instead of
> GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
> in the Odroid N2).
> 
> Add the "orbbec,zora-p1" compatible to the amlogic.yaml board binding
> (the "orbbec" vendor prefix is already registered) and the new DTB to
> the Makefile.
> 
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
>   2 files changed, 104 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa..83fb38b94 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> index 000000000..fe20d39a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-a311d.dtsi"
> +#include "meson-g12b-odroid-n2.dtsi"
> +
> +/ {
> +	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
> +	model = "Orbbec Zora P1";
> +
> +	leds {
> +		//The status led on Zora is actually green, same pin as N2, but reversed polarity

Use proper comment with /* and */

> +		led-blue {
> +			label = "p1:green";
> +			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
> +		};

Please use the new bindings with function and color properties instead if label.

> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>;
> +	};
> +
> +	sound {
> +		model = "ZORA-P1";
> +	};
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +/* AP6256 Wi-Fi: Broadcom BCM43456 over SDIO. */
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	max-frequency = <100000000>;
> +	non-removable;
> +	disable-wp;
> +	keep-power-in-suspend;
> +
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	vmmc-supply = <&tflash_vdd>;
> +	vqmmc-supply = <&vddao_1v8>;
> +
> +	wifi@1 {
> +		compatible = "brcm,bcm4329-fmac";
> +		reg = <1>;
> +	};
> +};
> +
> +/* AP6256 Bluetooth: Broadcom BCM4345C5 over UART_A. */
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4345c5";
> +		shutdown-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
> +	};
> +};
> +
> +//vddcpu regulators same as Odroid N2+

Use proper comment with /* and */

> +&vddcpu_a {
> +	regulator-min-microvolt = <680000>;
> +	regulator-max-microvolt = <1040000>;
> +
> +	pwms = <&pwm_ab 0 1500 0>;
> +};
> +
> +&vddcpu_b {
> +	regulator-min-microvolt = <680000>;
> +	regulator-max-microvolt = <1040000>;
> +
> +	pwms = <&pwm_AO_cd 1 1500 0>;
> +};

Thanks,
Neil

