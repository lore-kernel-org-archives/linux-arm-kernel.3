Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4A7C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9s1MLqZ99Jjf0BTVsynVNUuDrFuTR6hcyH+PJ/kt3J0=; b=GdwiSHTErTGSYZWNOzyob1VW0Q
	szeWf7FDHYoGDlrAMdvKfQu5zYG4GIiNTWav6DNS9Yf4Z+Z8CVSUKvo48JVJ7t7GfxTVREKs7GLge
	iGJ7J8MKzesbo6XevriRc8F827vkmlD5xLmXzkp5UGRMQwQ1lMx24q4NwuRp3/t7o+6am8PmbnHeD
	UkZdVHcfIcnHemZklREhHee66koCXrvjtlM3Tz7xw2kSl2/lrzydHhUg7Vc+hUWE+EXdi2HxCqejG
	uZ0m9PFaf841GimF1ndOT/35J5XbYNC0GBeQjfhAiZhvBgnYvhhb6aKM/b27WcZqQvEw17cVEPdrD
	VtIiEYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUEt-00000005W9b-1slW;
	Tue, 18 Mar 2025 10:32:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuU7C-00000005Ucz-2nhB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 10:24:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so19323395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 03:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742293444; x=1742898244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9s1MLqZ99Jjf0BTVsynVNUuDrFuTR6hcyH+PJ/kt3J0=;
        b=RMCqdeiZmX8j6Uwwh1+E2CjwwCjXRssv7nOwo9GKX38oV4Dgb3viNv6kWKyMv4f8pA
         Fmto1blpfGgy7U8HyfSsPBywSL1sag4utAGsczVzhKZkAU6O4twqotAtFLq/bx4lfxEF
         SRkUUyP8A9pNu2iruCj3r5YoJvmDxX++PzRRVZBv21PBYTsEOEES61KmPpLtc87LRjFl
         mYWhRuvKYijrlB8I1Iufe1WwN5c39AB0c68cICv5cRVTZNJJahgnkbhbFg1EXYgNGxPV
         UjCZ5rGZ/qUV+8jfDSMLq7/2TgU26gj1Ox7BFmuLasg+YfiZ0c+OXwdDyK2QCS5qUPHH
         Ye2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293444; x=1742898244;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9s1MLqZ99Jjf0BTVsynVNUuDrFuTR6hcyH+PJ/kt3J0=;
        b=NDH+wxiGEgG3ibA6k4VxWcuwqjz50fVqsXoF52E8vVnJhDRHC3Dp+i6eHVYNFAhUTv
         r40ZpkMDVehk6LJHKJFGssgePacGaPW5b6Q94Lv7L3dSH0ZtzD42BBHS0p6nF76WKqbB
         Y4OMcYvgQcViwx4mch1McLiNutHPzX3d64GXRiRXUdllqKQQTSCaoobay/8KIX1YER/b
         O9k5NlQU9muFeytAeEw9c4m5hOcnVSZVsl4JNlZzIVT5ksTWxZGPGboT5WOf5CDjoBCp
         /SBmP82hb4XUP+YhNxEBLrgYUA333abNaVP83BAVYUzZIked2YwSySnUGpNG8ebohrIx
         R5CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh8+j7IG69B7LbECNdnBoe8ASwBx72+neUJERVsdsMNCXPeLlb8LQl8Miqbkuwkith2lyzqWl25jI9Qq00PmKh@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgw/Q6RfWgF3TaC95KJYDojgIqPzqZVpYm9TiRQtrIYVOChiG
	oxgrnt4imb3aIEvckp4CzQnvEHXt/cXuAiO5Tp1hjTycdaKcayt4+GFqPAsoXHs=
X-Gm-Gg: ASbGncuq+8HvW5A2JTF2K6m9lSBLEcKTI7lQhKdeiCS+T5J2uTIl85pvIkjMzIm6QW2
	jg27PXwpG2SAr7H32+yePOAGboQzSUwP0YLltccqqcTzPAmBAsiAjjNhkbOj/H6iETcibTdKv1q
	qa6BlrGklAUomFAbhCtwq8xeovGqdsKTckvQH33AlpfpOIeoSIxRHuvoqnudWEIy/qu+HDKwPDT
	OYKyWfjcvqDEIRVfJ5vcFSubCkYKqAwrJgY/2kNotv9wH9DHDe3z0t7+by6OgMM4Yyv/HcMfP30
	ZIRAkiz31m7kUyrEf1NHOu/UyNJx417zV+KjsvX9MJWI+rhqR/dgiiHj+HF0QAPnHVD+Vk3m8XW
	sDDT2EApDrPWyEUDI1Ma4lQ==
X-Google-Smtp-Source: AGHT+IHtzyqVRAga6Hl6uXNlyniza06JK+93mCeNwBJWGNRf6bcJIa0OCbOvW1yls2I+teoXyKiouQ==
X-Received: by 2002:a05:6000:1566:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-3996bb560d6mr2356028f8f.25.1742293444284;
        Tue, 18 Mar 2025 03:24:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a10sm17870384f8f.36.2025.03.18.03.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 03:24:03 -0700 (PDT)
Message-ID: <61a0eb6c-aa15-4316-9e4b-929c3cad13c9@linaro.org>
Date: Tue, 18 Mar 2025 11:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: amlogic: Add Ugoos AM3
To: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
 <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
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
In-Reply-To: <20250314-ugoos-am3-v2-2-422104b0cec5@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_032406_703282_6DA3681D 
X-CRM114-Status: GOOD (  25.28  )
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

On 14/03/2025 00:11, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC,
> with a board design that is very close to the Q20x development boards.
> The MMC max-frequency properties are copied from the downstream device
> tree.
> 
>    https://ugoos.com/ugoos-am3-16g
> 
> The following functionality has been tested and is known to work:
>   - debug serial port
>   - "update" button inside the case
>   - USB host mode, on all three ports
>   - HDMI video/audio output
>   - eMMC, MicroSD, and SDIO WLAN
>   - S/PDIF audio output
>   - Ethernet
>   - Infrared remote control input
> 
> The following functionality doesn't seem to work:
>   - USB role switching and device mode on the "OTG" port
>   - case LED
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
> 
> V2:
> - Fix vendor name in patch subject
> - Remove incorrect override of SDIO pwrseq reset line
> ---
>   arch/arm64/boot/dts/amlogic/Makefile               |  1 +
>   .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
>   .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++++
>   3 files changed, 93 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 2fbda8419c65a3056410ac45ca3ddaceb69ea4f5..bf2bc14528bfa27e8d6ae2730085fc356d6c6dd8 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> index 45ccddd1aaf0546632c81a52c8917a923beae883..4223b26f7d0f3aa47e42e9434d24f73b20441981 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> @@ -97,7 +97,7 @@ sdio_pwrseq: sdio-pwrseq {
>   		clock-names = "ext_clock";
>   	};
>   
> -	cvbs-connector {
> +	cvbs_connector: cvbs-connector {
>   		compatible = "composite-video-connector";
>   
>   		port {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..ba871f3f53bb99b47b325bae228b59b722c5123b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 J. Neuschäfer <j.ne@posteo.net>
> + *
> + * Debug UART (3.3V, 115200 baud) at the corner of the board:
> + *   (4) (3) (2) [1]
> + *   Vcc RXD TXD GND
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
> +
> +#include "meson-gxm.dtsi"
> +#include "meson-gx-p23x-q20x.dtsi"
> +
> +/ {
> +	compatible = "ugoos,am3", "amlogic,s912", "amlogic,meson-gxm";
> +	model = "Ugoos AM3";
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 0>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1710000>;
> +
> +		button-function {
> +			label = "Update";
> +			linux,code = <KEY_VENDOR>;
> +			press-threshold-microvolt = <10000>;
> +		};
> +	};
> +};
> +
> +&cvbs_connector {
> +	/* Not used on this board */
> +	status = "disabled";
> +};
> +
> +&ethmac {
> +	pinctrl-0 = <&eth_pins>;
> +	pinctrl-names = "default";
> +
> +	/* Select external PHY by default */
> +	phy-handle = <&external_phy>;
> +
> +	amlogic,tx-delay-ns = <2>;
> +
> +	/* External PHY is in RGMII */
> +	phy-mode = "rgmii";
> +
> +	status = "okay";
> +};
> +
> +&external_mdio {
> +	external_phy: ethernet-phy@0 {
> +		/* Realtek RTL8211F (0x001cc916) */
> +		reg = <0>;
> +
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> +
> +		interrupt-parent = <&gpio_intc>;
> +		/* MAC_INTR on GPIOZ_15 */
> +		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&i2c_B {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c_b_pins>;
> +
> +	rtc: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +	};
> +};
> +
> +/* WLAN: Atheros 10k (QCA9377) */
> +&sd_emmc_a {
> +	max-frequency = <200000000>;
> +};
> +
> +/* eMMC */
> +&sd_emmc_c {
> +	max-frequency = <100000000>;
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

