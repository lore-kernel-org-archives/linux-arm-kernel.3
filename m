Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B870CAC5BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxxDdS9g/E2bCXmMMVj1KdY3LzJccHLzMEdhZUo/prk=; b=pktQJH9BIWAEEU7vuq4XFb1o0R
	5PYTuiDvrFASZE29MSC28cSsh2qbpR0zQZ2PvTrU9DunEoC+WczAcLNI0Km3mt+lesAYJ2WorbCr1
	hOd0NiopRKJqMAOwxn0wU2DW9MDyub7GJ+oQlvJrMI8nArslhioWEmj+R4q1UFjtO3Uq3ZH58AMWv
	ZePB1ly8CcEsNWbr16UPYOrYLmio47KB2+6rB+iuKeleEkxm3N/Ht2k9VffzH/15SryIwKRDcpXsx
	HiQCBlMV75i+zETL5w68p7c4pmCz28cqoLXL9JnQ9mbU0RSckqSyZEbBYSWhgIas1BhbejJn16CN0
	FqHr/SuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JbA-00000005yye-0AyI;
	Sat, 27 Sep 2025 01:19:40 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Jb7-00000005yvo-0CRt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 01:19:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2629607b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 18:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758935976; x=1759540776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxxDdS9g/E2bCXmMMVj1KdY3LzJccHLzMEdhZUo/prk=;
        b=NOtrsg/pb66iCBX/t1x6frI0A33dvaDTDZER7w1S32JIb5RH0ZTvRTgQkdAxbY/e+3
         A9tH8g/C5dX0CEC9uEp7CpkAS3OX91DWRJJu0HNGYtiOSqnfVEUEGfwfSP1FGb/Jc6yy
         Gvu+2jJQfnj/WKAlspG2pHwi5tPHmuKM+neJHveGeeDsNDgK5u9ht2v4EtW2WbmceWLQ
         orMCQ19vphnXaFs4EVUe0Xv5c0bENOgT5skHCukUbWh1FVA2bW45SUrHtJ/hPPDjew0i
         PIEtzxZjisZ2mkpZG0d1aTpk5utsYWCCQaalC6ZFtrxaCWLIbL+qz36pWueDI4rIb9mh
         lyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935976; x=1759540776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vxxDdS9g/E2bCXmMMVj1KdY3LzJccHLzMEdhZUo/prk=;
        b=X2jb8OUXpzg5okIFZ8ElSWxbqbkGYvOtLwKw8RH3kA7gTnWcOBqPDQaV88i3iA6k8H
         s7eWRS2/2rti5rAchqZjswNALcTfw0y1utROAhfSHl/f/iB3JogLzu0yHGfXXIUmbTuL
         oQZvfmsmDluZ2oogqo3NZsCbcZnfzLHB+fIK1HBDhgyI+2esMRZzlk1rGjbci+78BC8g
         sMkzps6WM0UFJ2kQWtGY2xn7DzFN+8aFxd+6Kltizqndo6az/TbxPZ3Cs0h/AuSHQdqq
         PJdKvE4sv3xwCqCOXBJFwqQjeQBS7s171v/esd7RN0OdwyRE8b2sOMojBeG4fOwqx6Wt
         s8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjj2iNxF0bNJdE+W/DX5OQIg4qrr3QivCXds4YMEPjgV3dkClSbmIKX+ECvifL5A/9SI6sZoN9JvLf4WVw5eyp@lists.infradead.org
X-Gm-Message-State: AOJu0YxFAJrWWPDIFPgLabF8VbJmOUkBu4eTjmnKympWEce/ifwY0OUb
	IXWbO7CAHMgB01jWxojR1tUa9FWgdRPoo4/G6Rzj8yL0gPQEIaSln+Ye
X-Gm-Gg: ASbGncsDpNyEABXD3xor3O3GMi2ArOpPgn9VguKy6zThgUEptLXm6g47b42gkNZTICP
	0Wi+zuDd11IqkcTMEkK3cGqFZokeMKFkJdENvFs7jRVM24VGSIW4e4Bvh9OS0AQ7W10y5EnjnCZ
	hIXtfJOTZO6T/gC9ZPB0NmcpZgvJy2eIjUP3VNFyaZxxklUGQMoG1fODTqnljC03n+AKbGMxFBj
	fpQzTiy6BG9TlpeFFQQM24Ormf41BpZ+6jIoh27KO70YgpqjNu6QvclP9noim1aCxYCTquRHFK1
	x7qfNjzuJqrq+1D7TMlt+C/MruXc/8sTiY2ShNm1jZziE0VevARUlADIfF34ShXijQtJyCeKBBA
	OHIcJcI2TOoAs6alqRes9pU+QZgqFfcAbzK3HzrMB7Q==
X-Google-Smtp-Source: AGHT+IEuw7lP+OONVuRakn8p7umvJyj0yYMelaZ2GnOZVcPVl2Jjn+c4P5e7O7+KSTp0QvY6QfZBVg==
X-Received: by 2002:a05:6a20:7349:b0:2ba:1eb5:50e8 with SMTP id adf61e73a8af0-2e9a68ad8bdmr11497294637.17.1758935975658;
        Fri, 26 Sep 2025 18:19:35 -0700 (PDT)
Received: from ?IPV6:2408:8262:245d:4074:5a47:caff:fe76:9e11? ([2401:b60:5:2::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2733fsm5603756b3a.94.2025.09.26.18.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 18:19:35 -0700 (PDT)
Message-ID: <1bb00ad6-ffe1-4783-909b-032dfb984180@gmail.com>
Date: Sat, 27 Sep 2025 09:19:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R76S
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250922091509.2695565-1-cnsztl@gmail.com>
 <20250922091509.2695565-2-cnsztl@gmail.com>
 <DD2V17FJ29MV.3YDX1VUWGKEH@cknow.org>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <DD2V17FJ29MV.3YDX1VUWGKEH@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_181937_129592_4CBEE960 
X-CRM114-Status: GOOD (  19.93  )
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

On 2025/9/27 0:07, Diederik de Haas wrote:
> On Mon Sep 22, 2025 at 11:15 AM CEST, Tianling Shen wrote:
>> The NanoPi R76S (as "R76S") is an open-sourced mini IoT gateway
>> device with two 2.5G, designed and developed by FriendlyElec.
>>
>> Specification:
>> - Rockchip RK3576
>> - 2/4GB LPDDR4X RAM
>> - 2x 2500Base-T (PCIe, rtl8125b)
>> - 3x LEDs (Power, LAN, WAN)
>> - 32GB eMMC
>> - MicroSD Slot
>> - MDMI 1.4/2.0 OUT
>> - M.2 E-Key SDIO slot
>> - USB 3.0 Port
>> - USB Type-C 5V Power
>>
>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>   .../boot/dts/rockchip/rk3576-nanopi-r76s.dts  | 860 ++++++++++++++++++
>>   2 files changed, 861 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
>> index ad684e3831bc..2d4a1e29db6f 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5-v1.2-wifibt.dtbo
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-m5.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-nanopi-r76s.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
>> new file mode 100644
>> index 000000000000..731789a69677
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
>> @@ -0,0 +1,860 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>> +/*
>> + * Copyright (c) 2025 FriendlyElec Computer Tech. Co., Ltd.
>> + * (http://www.friendlyelec.com)
>> + *
>> + * Copyright (c) 2025 Tianling Shen <cnsztl@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/pinctrl/rockchip.h>
>> +#include <dt-bindings/soc/rockchip,vop2.h>
>> +
>> +#include "rk3576.dtsi"
>> +
>> +/ {
>> +	model = "FriendlyElec NanoPi R76S";
>> +	compatible = "friendlyarm,nanopi-r76s", "rockchip,rk3576";
>> +
>> +	aliases {
>> +		mmc0 = &sdhci;
>> +		mmc1 = &sdmmc;
>> +		mmc2 = &sdio;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:1500000n8";
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&reset_button_pin>;
>> +
>> +		button-reset {
>> +			label = "reset";
>> +			gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <50>;
>> +			linux,code = <KEY_RESTART>;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
>> +	gpio-leds {
>> +		compatible = "gpio-leds";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&lan_led_pin>, <&power_led_pin>, <&wan_led_pin>;
> 
> It is recommended to use the labels in the schematics to define the
> pinctl nodes (and thus their references). In quite a lot of cases that's
> indeed the case, but not for gpio-keys (USER_BUT) or these gpio-leds
> pinctls.

I cannot find any specific naming rules from the gpio-keys[1] and 
gpio-leds[2] bindings, did I miss any update?

I think this naming matches the current practice at least in rockchip's 
dt tree.

1. 
https://www.kernel.org/doc/Documentation/devicetree/bindings/input/gpio-keys.yaml
2. 
https://www.kernel.org/doc/Documentation/devicetree/bindings/leds/leds-gpio.yaml

> 
>> +
>> +		led-0 {
>> +			color = <LED_COLOR_ID_GREEN>;
>> +			function = LED_FUNCTION_LAN;
>> +			gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +		power_led: led-1 {
> 
> power_led is never referenced, so you can drop it.
> 

This will be used by some downstream projects but I'm fine to remove it 
here.

Thanks,
Tianling.

> Cheers,
>    Diederik
> 
>> +			color = <LED_COLOR_ID_RED>;
>> +			function = LED_FUNCTION_POWER;
>> +			gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "heartbeat";
>> +		};
>> +
>> +		led-2 {
>> +			color = <LED_COLOR_ID_GREEN>;
>> +			function = LED_FUNCTION_WAN;
>> +			gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +
>> +	hdmi-con {
>> +		compatible = "hdmi-connector";
>> +		hdmi-pwr-supply = <&vcc5v_hdmi_tx>;
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_con_in: endpoint {
>> +				remote-endpoint = <&hdmi_out_con>;
>> +			};
>> +		};
>> +	};
>> +
>> +	sdio_pwrseq: sdio-pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		clocks = <&hym8563>;
>> +		clock-names = "ext_clock";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_reg_on_h>;
>> +		post-power-on-delay-ms = <200>;
>> +		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
>> +	};
>> +
>> +	vcc5v_dcin: regulator-vcc5v-dcin {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-name = "vcc5v_dcin";
>> +	};
>> +
>> +	vcc5v_hdmi_tx: regulator-vcc5v-hdmi-tx {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&hdmi_tx_on_h>;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-name = "vcc5v_hdmi_tx";
>> +		vin-supply = <&vcc5v0_sys_s5>;
>> +	};
>> +
>> +	vcc3v3_rtc_s5: regulator-vcc3v3-rtc-s5 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-name = "vcc3v3_rtc_s5";
>> +		vin-supply = <&vcc5v0_sys_s5>;
>> +	};
>> +
>> +	vcc5v0_device_s0: regulator-vcc5v0-device-s0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-name = "vcc5v0_device_s0";
>> +		vin-supply = <&vcc5v_dcin>;
>> +	};
>> +
>> +	vcc5v0_sys_s5: regulator-vcc5v0-sys-s5 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-name = "vcc5v0_sys_s5";
>> +		vin-supply = <&vcc5v_dcin>;
>> +	};
>> +
>> +	vcc5v0_usb_otg0: regulator-vcc5v0-usb-otg0 {
>> +		compatible = "regulator-fixed";
>> +		enable-active-high;
>> +		gpios = <&gpio0 RK_PD1 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&usb_otg0_pwren_h>;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-name = "vcc5v0_usb_otg0";
>> +		vin-supply = <&vcc5v0_sys_s5>;
>> +	};
>> +
>> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <1100000>;
>> +		regulator-max-microvolt = <1100000>;
>> +		regulator-name = "vcc_1v1_nldo_s3";
>> +		vin-supply = <&vcc5v0_sys_s5>;
>> +	};
>> +
>> +	vcc_1v8_s0: regulator-vcc-1v8-s0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		regulator-name = "vcc_1v8_s0";
>> +		vin-supply = <&vcc_1v8_s3>;
>> +	};
>> +
>> +	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <2000000>;
>> +		regulator-max-microvolt = <2000000>;
>> +		regulator-name = "vcc_2v0_pldo_s3";
>> +		vin-supply = <&vcc5v0_sys_s5>;
>> +	};
>> +
>> +	vcc_3v3_s0: regulator-vcc-3v3-s0 {
>> +		compatible = "regulator-fixed";
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-name = "vcc_3v3_s0";
>> +		vin-supply = <&vcc_3v3_s3>;
>> +	};
>> +};
>> +
>> +&combphy0_ps {
>> +	status = "okay";
>> +};
>> +
>> +&combphy1_psu {
>> +	status = "okay";
>> +};
>> +
>> +&cpu_b0 {
>> +	cpu-supply = <&vdd_cpu_big_s0>;
>> +};
>> +
>> +&cpu_b1 {
>> +	cpu-supply = <&vdd_cpu_big_s0>;
>> +};
>> +
>> +&cpu_b2 {
>> +	cpu-supply = <&vdd_cpu_big_s0>;
>> +};
>> +
>> +&cpu_b3 {
>> +	cpu-supply = <&vdd_cpu_big_s0>;
>> +};
>> +
>> +&cpu_l0 {
>> +	cpu-supply = <&vdd_cpu_lit_s0>;
>> +};
>> +
>> +&cpu_l1 {
>> +	cpu-supply = <&vdd_cpu_lit_s0>;
>> +};
>> +
>> +&cpu_l2 {
>> +	cpu-supply = <&vdd_cpu_lit_s0>;
>> +};
>> +
>> +&cpu_l3 {
>> +	cpu-supply = <&vdd_cpu_lit_s0>;
>> +};
>> +
>> +&gpu {
>> +	mali-supply = <&vdd_gpu_s0>;
>> +	status = "okay";
>> +};
>> +
>> +&hdmi {
>> +	status = "okay";
>> +};
>> +
>> +&hdmi_in {
>> +	hdmi_in_vp0: endpoint {
>> +		remote-endpoint = <&vp0_out_hdmi>;
>> +	};
>> +};
>> +
>> +&hdmi_out {
>> +	hdmi_out_con: endpoint {
>> +		remote-endpoint = <&hdmi_con_in>;
>> +	};
>> +};
>> +
>> +&hdmi_sound {
>> +	status = "okay";
>> +};
>> +
>> +&hdptxphy {
>> +	status = "okay";
>> +};
>> +
>> +&i2c1 {
>> +	status = "okay";
>> +
>> +	pmic@23 {
>> +		compatible = "rockchip,rk806";
>> +		reg = <0x23>;
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		interrupt-parent = <&gpio0>;
>> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
>> +			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
>> +		system-power-controller;
>> +
>> +		vcc1-supply = <&vcc5v0_sys_s5>;
>> +		vcc2-supply = <&vcc5v0_sys_s5>;
>> +		vcc3-supply = <&vcc5v0_sys_s5>;
>> +		vcc4-supply = <&vcc5v0_sys_s5>;
>> +		vcc5-supply = <&vcc5v0_sys_s5>;
>> +		vcc6-supply = <&vcc5v0_sys_s5>;
>> +		vcc7-supply = <&vcc5v0_sys_s5>;
>> +		vcc8-supply = <&vcc5v0_sys_s5>;
>> +		vcc9-supply = <&vcc5v0_sys_s5>;
>> +		vcc10-supply = <&vcc5v0_sys_s5>;
>> +		vcc11-supply = <&vcc_2v0_pldo_s3>;
>> +		vcc12-supply = <&vcc5v0_sys_s5>;
>> +		vcc13-supply = <&vcc_1v1_nldo_s3>;
>> +		vcc14-supply = <&vcc_1v1_nldo_s3>;
>> +		vcca-supply = <&vcc5v0_sys_s5>;
>> +
>> +		rk806_dvs1_null: dvs1-null-pins {
>> +			pins = "gpio_pwrctrl1";
>> +			function = "pin_fun0";
>> +		};
>> +
>> +		rk806_dvs1_pwrdn: dvs1-pwrdn-pins {
>> +			pins = "gpio_pwrctrl1";
>> +			function = "pin_fun2";
>> +		};
>> +
>> +		rk806_dvs1_rst: dvs1-rst-pins {
>> +			pins = "gpio_pwrctrl1";
>> +			function = "pin_fun3";
>> +		};
>> +
>> +		rk806_dvs1_slp: dvs1-slp-pins {
>> +			pins = "gpio_pwrctrl1";
>> +			function = "pin_fun1";
>> +		};
>> +
>> +		rk806_dvs2_dvs: dvs2-dvs-pins {
>> +			pins = "gpio_pwrctrl2";
>> +			function = "pin_fun4";
>> +		};
>> +
>> +		rk806_dvs2_gpio: dvs2-gpio-pins {
>> +			pins = "gpio_pwrctrl2";
>> +			function = "pin_fun5";
>> +		};
>> +
>> +		rk806_dvs2_null: dvs2-null-pins {
>> +			pins = "gpio_pwrctrl2";
>> +			function = "pin_fun0";
>> +		};
>> +
>> +		rk806_dvs2_pwrdn: dvs2-pwrdn-pins {
>> +			pins = "gpio_pwrctrl2";
>> +			function = "pin_fun2";
>> +		};
>> +
>> +		rk806_dvs2_rst: dvs2-rst-pins {
>> +			pins = "gpio_pwrctrl2";
>> +			function = "pin_fun3";
>> +		};
>> +
>> +		rk806_dvs2_slp: dvs2-slp-pins {
>> +			pins = "gpio_pwrctrl2";
>> +			function = "pin_fun1";
>> +		};
>> +
>> +		rk806_dvs3_dvs: dvs3-dvs-pins {
>> +			pins = "gpio_pwrctrl3";
>> +			function = "pin_fun4";
>> +		};
>> +
>> +		rk806_dvs3_gpio: dvs3-gpio-pins {
>> +			pins = "gpio_pwrctrl3";
>> +			function = "pin_fun5";
>> +		};
>> +
>> +		rk806_dvs3_null: dvs3-null-pins {
>> +			pins = "gpio_pwrctrl3";
>> +			function = "pin_fun0";
>> +		};
>> +
>> +		rk806_dvs3_pwrdn: dvs3-pwrdn-pins {
>> +			pins = "gpio_pwrctrl3";
>> +			function = "pin_fun2";
>> +		};
>> +
>> +		rk806_dvs3_rst: dvs3-rst-pins {
>> +			pins = "gpio_pwrctrl3";
>> +			function = "pin_fun3";
>> +		};
>> +
>> +		rk806_dvs3_slp: dvs3-slp-pins {
>> +			pins = "gpio_pwrctrl3";
>> +			function = "pin_fun1";
>> +		};
>> +
>> +		regulators {
>> +			vdd_cpu_big_s0: dcdc-reg1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-enable-ramp-delay = <400>;
>> +				regulator-min-microvolt = <550000>;
>> +				regulator-max-microvolt = <950000>;
>> +				regulator-name = "vdd_cpu_big_s0";
>> +				regulator-ramp-delay = <12500>;
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdd_npu_s0: dcdc-reg2 {
>> +				regulator-boot-on;
>> +				regulator-enable-ramp-delay = <400>;
>> +				regulator-min-microvolt = <550000>;
>> +				regulator-max-microvolt = <950000>;
>> +				regulator-name = "vdd_npu_s0";
>> +				regulator-ramp-delay = <12500>;
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdd_cpu_lit_s0: dcdc-reg3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <550000>;
>> +				regulator-max-microvolt = <950000>;
>> +				regulator-name = "vdd_cpu_lit_s0";
>> +				regulator-ramp-delay = <12500>;
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +					regulator-suspend-microvolt = <750000>;
>> +				};
>> +			};
>> +
>> +			vcc_3v3_s3: dcdc-reg4 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <3300000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-name = "vcc_3v3_s3";
>> +
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt = <3300000>;
>> +				};
>> +			};
>> +
>> +			vdd_gpu_s0: dcdc-reg5 {
>> +				regulator-boot-on;
>> +				regulator-enable-ramp-delay = <400>;
>> +				regulator-min-microvolt = <550000>;
>> +				regulator-max-microvolt = <900000>;
>> +				regulator-name = "vdd_gpu_s0";
>> +				regulator-ramp-delay = <12500>;
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +					regulator-suspend-microvolt = <850000>;
>> +				};
>> +			};
>> +
>> +			vddq_ddr_s0: dcdc-reg6 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-name = "vddq_ddr_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdd_logic_s0: dcdc-reg7 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <550000>;
>> +				regulator-max-microvolt = <800000>;
>> +				regulator-name = "vdd_logic_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcc_1v8_s3: dcdc-reg8 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <1800000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-name = "vcc_1v8_s3";
>> +
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt = <1800000>;
>> +				};
>> +			};
>> +
>> +			vdd2_ddr_s3: dcdc-reg9 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-name = "vdd2_ddr_s3";
>> +
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdd_ddr_s0: dcdc-reg10 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <550000>;
>> +				regulator-max-microvolt = <1200000>;
>> +				regulator-name = "vdd_ddr_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcca_1v8_s0: pldo-reg1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <1800000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-name = "vcca_1v8_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcca1v8_pldo2_s0: pldo-reg2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <1800000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-name = "vcca1v8_pldo2_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdda_1v2_s0: pldo-reg3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <1200000>;
>> +				regulator-max-microvolt = <1200000>;
>> +				regulator-name = "vdda_1v2_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcca_3v3_s0: pldo-reg4 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <3300000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-name = "vcca_3v3_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vccio_sd_s0: pldo-reg5 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <1800000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-name = "vccio_sd_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vcca1v8_pldo6_s3: pldo-reg6 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <1800000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-name = "vcca1v8_pldo6_s3";
>> +
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt = <1800000>;
>> +				};
>> +			};
>> +
>> +			vdd_0v75_s3: nldo-reg1 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <750000>;
>> +				regulator-max-microvolt = <750000>;
>> +				regulator-name = "vdd_0v75_s3";
>> +
>> +				regulator-state-mem {
>> +					regulator-on-in-suspend;
>> +					regulator-suspend-microvolt = <750000>;
>> +				};
>> +			};
>> +
>> +			vdda_ddr_pll_s0: nldo-reg2 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <850000>;
>> +				regulator-max-microvolt = <850000>;
>> +				regulator-name = "vdda_ddr_pll_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdda0v75_hdmi_s0: nldo-reg3 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <837500>;
>> +				regulator-max-microvolt = <837500>;
>> +				regulator-name = "vdda0v75_hdmi_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdda_0v85_s0: nldo-reg4 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <850000>;
>> +				regulator-max-microvolt = <850000>;
>> +				regulator-name = "vdda_0v85_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +
>> +			vdda_0v75_s0: nldo-reg5 {
>> +				regulator-always-on;
>> +				regulator-boot-on;
>> +				regulator-min-microvolt = <750000>;
>> +				regulator-max-microvolt = <750000>;
>> +				regulator-name = "vdda_0v75_s0";
>> +
>> +				regulator-state-mem {
>> +					regulator-off-in-suspend;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c2 {
>> +	status = "okay";
>> +
>> +	hym8563: rtc@51 {
>> +		compatible = "haoyu,hym8563";
>> +		reg = <0x51>;
>> +		#clock-cells = <0>;
>> +		clock-output-names = "hym8563";
>> +		interrupt-parent = <&gpio0>;
>> +		interrupts = <RK_PA5 IRQ_TYPE_LEVEL_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&rtc_int_l>;
>> +		wakeup-source;
>> +	};
>> +};
>> +
>> +&pcie0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_perstn>;
>> +	reset-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_HIGH>;
>> +	vpcie3v3-supply = <&vcc_3v3_s3>;
>> +	status = "okay";
>> +};
>> +
>> +&pcie1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie1_perstn>;
>> +	reset-gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
>> +	vpcie3v3-supply = <&vcc_3v3_s3>;
>> +	status = "okay";
>> +};
>> +
>> +&pinctrl {
>> +	bt {
>> +		bt_reg_on_h: bt-reg-on-h {
>> +			rockchip,pins = <3 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +
>> +		bt_wake_host_h: bt-wake-host-h {
>> +			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
>> +		};
>> +
>> +		host_wake_bt_h: host-wake-bt-h {
>> +			rockchip,pins = <3 RK_PD0 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		reset_button_pin: reset-button-pin {
>> +			rockchip,pins = <4 RK_PA2 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	gpio-leds {
>> +		lan_led_pin: lan-led-pin {
>> +			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +
>> +		power_led_pin: power-led-pin {
>> +			rockchip,pins = <2 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +
>> +		wan_led_pin: wan-led-pin {
>> +			rockchip,pins = <4 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>> +	hdmi {
>> +		hdmi_tx_on_h: hdmi-tx-on-h {
>> +			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>> +	hym8563 {
>> +		rtc_int_l: rtc-int-l {
>> +			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	pcie {
>> +		pcie0_perstn: pcie0-perstn {
>> +			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +
>> +		pcie1_perstn: pcie1-perstn {
>> +			rockchip,pins = <0 RK_PC7 RK_FUNC_GPIO &pcfg_pull_up>;
>> +		};
>> +	};
>> +
>> +	usb {
>> +		usb_otg0_pwren_h: usb-otg0-pwren-h {
>> +			rockchip,pins = <0 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +
>> +	wifi {
>> +		wifi_wake_host_h: wifi-wake-host-h {
>> +			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
>> +		};
>> +
>> +		wifi_reg_on_h: wifi-reg-on-h {
>> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
>> +		};
>> +	};
>> +};
>> +
>> +&sai6 {
>> +	status = "okay";
>> +};
>> +
>> +&sdmmc {
>> +	bus-width = <4>;
>> +	cap-mmc-highspeed;
>> +	cap-sd-highspeed;
>> +	disable-wp;
>> +	no-mmc;
>> +	no-sdio;
>> +	sd-uhs-sdr104;
>> +	vmmc-supply = <&vcc_3v3_s3>;
>> +	vqmmc-supply = <&vccio_sd_s0>;
>> +	status = "okay";
>> +};
>> +
>> +&sdio {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +	bus-width = <4>;
>> +	cap-sd-highspeed;
>> +	cap-sdio-irq;
>> +	disable-wp;
>> +	keep-power-in-suspend;
>> +	mmc-pwrseq = <&sdio_pwrseq>;
>> +	no-mmc;
>> +	no-sd;
>> +	non-removable;
>> +	sd-uhs-sdr104;
>> +	vmmc-supply = <&vcc_3v3_s3>;
>> +	vqmmc-supply = <&vcc_1v8_s3>;
>> +	wakeup-source;
>> +	status = "okay";
>> +
>> +	rtl8822cs: wifi@1 {
>> +		reg = <1>;
>> +		interrupt-parent = <&gpio0>;
>> +		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_HIGH>;
>> +		interrupt-names = "host-wake";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_wake_host_h>;
>> +	};
>> +};
>> +
>> +&sdhci {
>> +	bus-width = <8>;
>> +	cap-mmc-highspeed;
>> +	full-pwr-cycle-in-suspend;
>> +	mmc-hs400-1_8v;
>> +	mmc-hs400-enhanced-strobe;
>> +	no-sdio;
>> +	no-sd;
>> +	non-removable;
>> +	status = "okay";
>> +};
>> +
>> +&saradc {
>> +	vref-supply = <&vcca_1v8_s0>;
>> +	status = "okay";
>> +};
>> +
>> +&u2phy0 {
>> +	status = "okay";
>> +};
>> +
>> +&u2phy0_otg {
>> +	phy-supply = <&vcc5v0_usb_otg0>;
>> +	status = "okay";
>> +};
>> +
>> +&uart0 {
>> +	status = "okay";
>> +};
>> +
>> +&uart5 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart5m0_xfer &uart5m0_ctsn &uart5m0_rtsn>;
>> +	uart-has-rtscts;
>> +	status = "okay";
>> +
>> +	bluetooth {
>> +		compatible = "realtek,rtl8822cs-bt";
>> +		enable-gpios = <&gpio3 RK_PC7 GPIO_ACTIVE_HIGH>;
>> +		device-wake-gpios = <&gpio3 RK_PD0 GPIO_ACTIVE_HIGH>;
>> +		host-wake-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_wake_host_h &host_wake_bt_h &bt_reg_on_h>;
>> +	};
>> +};
>> +
>> +&usbdp_phy {
>> +	status = "okay";
>> +};
>> +
>> +&usb_drd0_dwc3 {
>> +	dr_mode = "host";
>> +	extcon = <&u2phy0>;
>> +	status = "okay";
>> +};
>> +
>> +&vop {
>> +	status = "okay";
>> +};
>> +
>> +&vop_mmu {
>> +	status = "okay";
>> +};
>> +
>> +&vp0 {
>> +	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>> +		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
>> +		remote-endpoint = <&hdmi_in_vp0>;
>> +	};
>> +};
> 


