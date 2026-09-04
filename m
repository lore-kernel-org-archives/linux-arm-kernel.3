Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11CCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 06:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gN/tVxMdD62h/mSsC0SLmiOrOP7gax7KrxgcdBdmMRw=; b=iBV78o/JeeUIUFhTD0U48igAAc
	gL5fYRJr6QPjWC/bMJAMTMQgIzk9Gf5tdPoivb4k8mM21HVeZkapQOpmZsNIOODv0RrNgYUpvWcOb
	c4OOTi5gMPur62DW0f7X7V3Oj7wIl+WzTq0zLPcNSd5XtF6VFTJrJKXAQbj6dJo6Desl/KwINup1G
	6sVY/jBOxMZtkOnxjDEkdqOFYbhScJrsKO71uhs93YruKg7DNJ8ISEdgsx9k2grm9roJPrUbobBU/
	Hb4hAX2i+gu7DFQhzkUpmPaj5MzpGkiI1ZDiIF+eNjtZ2eiMjo1h+Dwo4n7aiVvsovyZ74WFbst5v
	LQJUoUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NYQ-0000000194g-3VBy;
	Fri, 04 Sep 2026 06:37:38 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2NYN-0000000193w-3Sx7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 06:37:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso7150825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 23:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788503854; x=1789108654; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gN/tVxMdD62h/mSsC0SLmiOrOP7gax7KrxgcdBdmMRw=;
        b=fpTOaHjpW51/xw8MjdY/szM/jSmX7DxJ7sndVXjY0NCTLK4LCo8PQ8V/rz3D+eyA0W
         +eYO/8ORzvbRoOHx8d/fQxVfuxdRVwkv24CYBEt6MFW4Ints+G+0OEf8oUly5AS+ZrGO
         FFu3mZSZjGb2weutgg2wW0YxAfV7YYLDPY51Z/J2K/HZpFnbfn+fm0MdS50JT/pYdxDq
         xef4iVOfoecsRrPhbnJ7fZcAaDl0HC8yCIqFXGQxHh0TZls1BRStSJS7WUfjcV9MWpNT
         1pjIIGm4HxjySmnw7GFdwATTL92liL/pAriNU+5gcA82zkE8ow6miuS7Y5tqWzya3B9t
         16UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788503854; x=1789108654;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gN/tVxMdD62h/mSsC0SLmiOrOP7gax7KrxgcdBdmMRw=;
        b=bXz+9EauGhP3utpfIcFe+2K1Y/i0rCTtoZIjp3NmvVBhJqapCeaSYAgQsJixIMHK3m
         HYJWeT88YDGPcAHw4e4CPY8R6ULDfvptY3w4XG6ilT5wjihUsQZSpJHoapY7DV0qoqmi
         McZ7hptzeWsQf0WTtg4Bzbr4FBnn7OKYXteamMICLeNZGrcaDIHW7bcp1zYhguOXLrf7
         V8i3F2cgjWeoRJOh297VzSwHbFVnY1q9IKXwdM9KEBNjbzrWO/a/5zBWdEcThkUtpt2c
         62Y5Kw6b2JUzfQXZ7M9VifbrQi5tjK9tK2a1PbBb7sw5l6XlJ3KSSchVpwxzKILO/brI
         QrzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVeUxkgyeMDKcvJHTIv+nG/NubCiVEjHbzUR0y+3wTstv5txJb8yTSHpW+tfM1ItHcMa7FjN8WJe2eTrCeuaAm@lists.infradead.org
X-Gm-Message-State: AFuF++mVmw+iwEdDesIbnpEpf5k0F+fqEC/0tXxBeJl/75zVapT+PGnH
	mZQ5osd70YHhckFDsyYd4JBfownPGDmJuNaMmb/rkb1jWdffSqOhEQo5fyW9z8mA/9A=
X-Gm-Gg: AYBFou3CDFkPtXpHqExgVcXMRIxToZ0wW+miASR3/T9zTKSK+aRRl/P4C2fGHUan9uk
	2ZKi76/OKXRb9l95bYb4tg2OHNBPm1wiIsS0HMJqXNl5ez2w/M+tlyAE+6CpRbqGrfVX5x70WMS
	COW7GcTQLj7UEDomRDPwGIWdu64WfW4G+T9Tt4hv2Ir0ozoJ62gnNKcGu87pnSt85nJZcuNJSGW
	PQL6WM/7LQnbJhJWCtYqg6Bk48Ohjpm0D8yigVwzGCEufPCINHEcnU7z77HgCRoVy0oMgjkKAmv
	eA/7kl3sGs1FOMHEI3/5/zIcQdPyf9RuBf7/tN4yB+XAL8Am+HmaGpbCdl1OQyZEUr1GyTwm/+N
	vvziuGhNeGzlj4BYPE9CgUyVRdSxOOYvSP+XVAMOnzmxru2ZxDMI3dly5RewnREIM5VLrvoBXzY
	OMawWohpZwoWALgKmxRhenUDF1167mHh5Q5vAPhzF3yEHsy2MdEytp9Vm5nckHsXE3xbtMQzwXR
	5kdL8Sy7Vcq9Hvw9XqMVBAN9/MP4aOG8MP3/H6XYrVw
X-Received: by 2002:a05:600c:6088:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49cfc6cc100mr9741345e9.27.1788503853750;
        Thu, 03 Sep 2026 23:37:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e8f4:b358:2087:5bd3? ([2a01:e0a:106d:1080:e8f4:b358:2087:5bd3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b405fsm3950836f8f.28.2026.09.03.23.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 23:37:33 -0700 (PDT)
Message-ID: <94fc2be2-01a0-4d3b-8d27-a4c42d8449d4@linaro.org>
Date: Fri, 4 Sep 2026 08:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add Xiaomi Mi Box 4 support
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn>
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
In-Reply-To: <20260903-mibox4-dt-v3-2-1a8e395d923c@stu.hqu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_233735_974234_FC586870 
X-CRM114-Status: GOOD (  17.73  )
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

On 9/3/26 12:18, YuChia-Kan wrote:
> Add initial device tree support for the Xiaomi Mi Box 4
> (MDZ-21-AA), based on the Amlogic S905L SoC.
> 
> Enable the main on-board peripherals including eMMC, Wi-Fi,
> HDMI, CEC, USB, audio, power LED, GPU and video decoder.
> 
> Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>   .../dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts | 333 +++++++++++++++++++++
>   2 files changed, 334 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..ad6ab4216083 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -72,6 +72,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-vero4k.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-p271.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxlx-s905l-xiaomi-mibox4.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts
> new file mode 100644
> index 000000000000..3b293dc31086
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-xiaomi-mibox4.dts
> @@ -0,0 +1,333 @@
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
> +			color = <LED_COLOR_ID_WHITE>;
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
> +/*
> + * The Mi Box 4 uses a custom efuse layout extracted from the
> + * original firmware.
> + */
> +
> +/delete-node/ &eth_mac;
> +/delete-node/ &sn;
> +/delete-node/ &bid;
> +
> +&efuse {
> +	eth_mac: mac-address@0 {
> +		reg = <0x00 0x06>;
> +	};
> +
> +	bt_mac: mac-address@6 {
> +		reg = <0x06 0x06>;
> +	};
> +
> +	wifi_mac: mac-address@c {
> +		reg = <0x0c 0x06>;
> +	};
> +
> +	usid: serial-number@12 {
> +		reg = <0x12 0x10>;
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

