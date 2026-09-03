Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F89CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8MY7PnwVmu/gEhUahNDDwC7ZqCJxgd/Hx/DEmiiGPk=; b=pbo2R49klKW3U62TJ9IyV4GSKt
	RRiqDIZ44rQtyNfjS40H4bBp/m5J6AvO1vlxBJBVXelAa128TVfgC1obEg02O2KksiOYjLcaBY3qM
	KW9f7I97sLtMm7F6fsSgWQ1WGl1iiR8SOcSVeA3YSweY3Bu8C/CnARNtZK58VInG5G8U8RB5besIA
	IX/YiNSRNqP5XOutIR3c015TdwapEr/0iUbpl2QkZ8Ir2VkSFuWF1u8kLDgNtCq2r1QQqXkUW8AhG
	y6PR65E1ME7gXs1STtRLMuGRBWQY7rUeN412KMPABNPIy4I8w+egvzNpBd5PaIP8+kU30JxvNZrTk
	iaNqtWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21k6-0000000GYqB-2kl5;
	Thu, 03 Sep 2026 07:20:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21k4-0000000GYoa-2WMJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:20:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so20003145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788420010; x=1789024810; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8MY7PnwVmu/gEhUahNDDwC7ZqCJxgd/Hx/DEmiiGPk=;
        b=TqgFiUzFkEevN7MJS3bPHdAuOuuB/bDFBcNITTq5p3JI66yKWw0TXqoRmdd2vqw4+K
         YuuFF8rnZClsI8o/886Cr7XbzVAh3Dnh0EGl9/9ljrWxu/yKz2VZQvCOxOnnrk/Cz95T
         UbuKEtwea9UPXEx5LyxYCy3Uiu6lN2KwXlmue2umKoPwBNdUENab527UoXCyZhB0b4WU
         rPZDNa4gXskexef4wN5BXBrtWnd5GAEksbFrt7Z7557gh2ggEdXnsg1z4dqiduHW8W9B
         dn7kyCysFvp/WDaM7cL2mzpbYnxpa+mq/Q38ejyo/IcT/IC+rjUUrqQpnIv+jJm6DWeb
         5zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420010; x=1789024810;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8MY7PnwVmu/gEhUahNDDwC7ZqCJxgd/Hx/DEmiiGPk=;
        b=Gag/REphUbzAR0gAyx/Ma+E+ebPLZKAg8CLYfHzQobhGzdiv+1nt5YjBfThdpJJZC8
         B9e8Usn3m80teZm3DMCrvyBIhjvaE6byQVT1yzZ6TmVQyfPe5y1IkfnFJ2LL8wLMrGvg
         Qe4FxUzRkaAnqo1FKcQXwG8jbAU+ikD11Kw5ZG4kuJGHtkgvpGtYZwOGck7qekpsy5/n
         XlpkPCsCC8OnQyk0CPYubQ6E7evwcDIt/Ztz3jw7O2NshLDUq1pIHk4VTRUkZ9QbBFZN
         nT6WULbLp/178ZWkHGXVQq3oRvdhFKEE6/2PnqsTyIAN3Kr7SlpYdp5SRQ0I7OQ/PnIj
         rZbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFr1vcBqFSXqaPWDNggUqI1X2f7vUB5hY6MVNplKa5KprWu7wfrGvb+ZBkr8lXGbl7kOWxYjC8qRag663a7fUh@lists.infradead.org
X-Gm-Message-State: AFuF++mBpfn0wPauNzReLMLtFiF/V+gpFN+T0Zzm6U1mal6zNhKTyU4R
	Cg2WlUbf/LWWu2l7jzRdouuhwhr1F272FtiZOil5Mc1xxMDRjUIuJY5DUA+U7Gp1Asg=
X-Gm-Gg: AYBFou1ObSgmsL9X5zPjyMJvTffRqX7tb4f0YR7U+GIE2375RJhqHJaJSr3yooFUGH+
	oqbxhIIFV1QW5f9t/nHu9xA/0QRog4vlQpLN1zk7Sskn14oNqGfE1bHWotzQvN9OASv2FGbyMD1
	hkmSJKvpJhXYpCK/pw0Ie9tkxnRiNf371e32cJXxZBJlLo0NUCyDaxsHQ2rNsCulmNECm8dg9Nz
	YPlHsOYFCH1u7uKk9x7sg5TKbLXF8ptfqcATMyS60u+3mdnX8PXt7LeAz4sDU17UFoj5ysdmfug
	txuwT2r1+AR0ayzk01ThgZFruHNgDzZS1r0zSDusxdg2N19y59HEOj2+wR1D2vUHuyC4hb6D9E6
	qjN5fhM7VD1/Q514mfZOzKuM2WcaBEdfZs7nUK1/80wVZibRO0bgpu3fMc8IZDenp8XbeyFdgyv
	kJmjnlTY2KT/sZpwAtQdFBftIC24ryEWAtROBOcl1GLuwEB+zRbVN6ufcKbuxHiW2GbDX4tA+Gh
	5gTPdwiaYA/IAbk7X2EapSQ0zBiYIRNz7O0/u/c0sk=
X-Received: by 2002:a05:600c:83c4:b0:499:8ff5:8ecc with SMTP id 5b1f17b1804b1-49ce58268afmr184260015e9.15.1788420008556;
        Thu, 03 Sep 2026 00:20:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:bc03:561f:5dac:f48f? ([2a01:e0a:106d:1080:bc03:561f:5dac:f48f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm47704275e9.10.2026.09.03.00.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:20:07 -0700 (PDT)
Message-ID: <28a9c801-92a6-431c-aa54-1f203e3d2a6e@linaro.org>
Date: Thu, 3 Sep 2026 09:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260903-mibox4-dt-v1-0-f29f1e828ca3@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
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
In-Reply-To: <20260903-mibox4-dt-v1-2-f29f1e828ca3@stu.hqu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_002012_720160_E4EABE01 
X-CRM114-Status: GOOD (  17.46  )
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

Hi,

On 9/3/26 09:09, YuChia-Kan wrote:
> Add initial device tree support for the Xiaomi Mi Box 4
> (MDZ-21-AA), based on the Amlogic S905L SoC.
> 
> Enable the main on-board peripherals including eMMC, Wi-Fi,
> HDMI, CEC, USB, IR, audio, power LED, GPU and video decoder.
> 
> Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile              |   1 +
>   arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts | 340 ++++++++++++++++++++++
>   2 files changed, 341 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..9f357df5fc54 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-mibox4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts
> new file mode 100644
> index 000000000000..db774efb2898
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-mibox4.dts
> @@ -0,0 +1,340 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2026 YuChia-Kan <mail@raspberrykan.dev>
> +
> +/dts-v1/;
> +
> +#include "meson-gxl-s905x.dtsi"
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-aiu.h>
> +
> +/ {
> +	compatible = "xiaomi,mibox4", "amlogic,s905l", "amlogic,meson-gxlx";
> +	model = "Xiaomi Mi Box 4 (MDZ-21-AA)";
> +
> +	aliases {
> +		serial0 = &uart_AO;
> +		mmc0 = &sd_emmc_c;
> +		mmc1 = &sd_emmc_a;
> +		/delete-property/ mmc2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	av_mute: analog-audio-mute {
> +		compatible = "simple-audio-amplifier";
> +		sound-name-prefix = "AV";
> +		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	hdmi_connector: hdmi-connector {
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
> +	cvbs_connector: cvbs-connector {
> +		compatible = "composite-video-connector";
> +
> +		port {
> +			cvbs_connector_in: endpoint {
> +				remote-endpoint = <&cvbs_vdac_out>;
> +			};
> +		};
> +	};
> +
> +	hdmi_usb_5v: regulator-hdmi-usb-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "HDMI_USB_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-boot-on;
> +		regulator-always-on;
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
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	wifi32k: wifi32k {
> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_9 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +		post-power-on-delay-ms = <200>;
> +	};
> +
> +	leds: leds {
> +		compatible = "gpio-leds";
> +
> +		power_led: power-led {
> +			label = "mibox4:power";

Drop the label, add the color attribute.

> +			function = LED_FUNCTION_POWER;
> +			gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "Xiaomi-Mi-Box-4";
> +		audio-aux-devs = <&av_mute>;
> +		audio-widgets = "Line", "Lineout";
> +		audio-routing = "AV INL", "ACODEC LOLN",
> +				"AV INR", "ACODEC LORN",
> +				"Lineout", "AV OUTL",
> +				"Lineout", "AV OUTR";
> +
> +		clocks = <&clkc CLKID_MPLL0>,
> +			 <&clkc CLKID_MPLL1>,
> +			 <&clkc CLKID_MPLL2>;
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-rates = <294912000>, <270950400>, <393216000>;
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
> +&apb {
> +	mali: gpu@c0000 {
> +		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "gp", "gpmmu", "pp", "pmu",
> +			"pp0", "ppmmu0", "pp1", "ppmmu1",
> +			"pp2", "ppmmu2";
> +	};
> +};

Drop this, it's already defined in arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi

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
> +&cvbs_vdac_port {
> +	cvbs_vdac_out: endpoint {
> +		remote-endpoint = <&cvbs_connector_in>;
> +	};
> +};
> +
> +/delete-node/ &eth_mac;
> +/delete-node/ &sn;
> +/delete-node/ &bid;

Add a comment stating the nvmem layout is custom

> +
> +&efuse {
> +	wifi_mac: mac-address@c {
> +		reg = <0x0c 0x06>;
> +	};
> +};
> +
> +&ethmac {
> +	status = "disabled";
> +};
> +
> +&hdmi_tx {
> +	status = "okay";
> +	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
> +	pinctrl-names = "default";
> +	hdmi-supply = <&hdmi_usb_5v>;
> +};
> +
> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +&ir {
> +	status = "okay";
> +	pinctrl-0 = <&remote_input_ao_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_e_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&saradc {
> +	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
> +	status = "okay";
> +	vref-supply = <&vddio_ao18>;
> +};
> +
> +&sd_emmc_a {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	max-frequency = <50000000>;
> +	non-removable;
> +	no-mmc;
> +	no-sd;
> +	disable-wp;
> +	keep-power-in-suspend;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
> +
> +	rtl8723ds: wifi@1 {
> +		reg = <1>;
> +		nvmem-cells = <&wifi_mac>;
> +		nvmem-cell-names = "mac-address";
> +		interrupt-parent = <&gpio_intc>;
> +		interrupts = <GPIOX_7 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "host-wake";
> +	};
> +};
> +
> +&sd_emmc_b {
> +	status = "disabled";
> +};
> +
> +&sd_emmc_c {
> +	status = "okay";
> +	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
> +	pinctrl-1 = <&emmc_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	max-frequency = <100000000>;
> +	non-removable;
> +	disable-wp;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vddio_boot>;
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
> +	dr_mode = "host";
> +};
> +
> +&usb2_phy0 {
> +	phy-supply = <&hdmi_usb_5v>;
> +};
> +
> +&vdec {
> +	compatible = "amlogic,gxlx-vdec", "amlogic,gx-vdec";
> +};
> 

