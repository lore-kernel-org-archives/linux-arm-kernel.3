Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D11FC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0qjpTqnwOT8F+S6Xael7lBooJw6Dvt+DoYZ8ijRRr4=; b=UIKSoujncE4JsTkyUJRppNz2z+
	rQ8C36BZkZQ8OBfMIgDLAyls8gBA7MW3dUD75Uv4+Hj5lSYtFOWRnTjrbrklOeUIGXfcof0OsSCQg
	iJPB4QGWqv5j+88PvrYhaYsvbkelMUcHdrbo/U8m5vZvpkEj98whj4qRO2omCdDhrZKNkQDM0hxJV
	+tw7wYiXYtzoe0G2U80RgPDoQ8H2jsk3GD2BLaCe+1bA+z8DSyoGTehVO+rRWc9RVv14ive6OIyQm
	eet+RL7y5FutnA3TowrRQCRAuR0kcs12nK+G6dZjCbp6kkeZpB6MGNsWfBgUaOp5RGjLWcdYctTDM
	3w/cJ3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx77Y-0000000C0kN-3oNm;
	Thu, 20 Aug 2026 18:04:08 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx77V-0000000C0k1-09Kf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 18:04:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so169851f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787249042; x=1787853842; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v0qjpTqnwOT8F+S6Xael7lBooJw6Dvt+DoYZ8ijRRr4=;
        b=J9tZoz8ByO771/i3IhNw8dxDxnhzffaK67QQIDuVPh+8XJmtNnHupxflGMxJfgGrHj
         8HiBoQmDGMfxHt8B1PboATgj2rXf99MQgq3aaA15gtCCaGcST9LZ8HGgM50qeQeiFr1E
         F9x7ojAoycyTDdmxN3qa5heQlS/+5CFGFVbpBxQTgDRMgQCDPSRDMqNmOwthSSGnwY0M
         EIBR1g1DB69csq627RBlNfLnZZrM3rV8s2CBHySGXHzC5kMkixL6xLVfOKdWZjH8PeH4
         q16m269SL+NyzWRp/KAUG2+ZFXg0kBhAx2T82ohzIt76zRLQ3ug4ffGLhqfZUTKm76yk
         8JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787249042; x=1787853842;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v0qjpTqnwOT8F+S6Xael7lBooJw6Dvt+DoYZ8ijRRr4=;
        b=etudPzXCFbvOe6wVf1FFdk6TWzqiUg7EK1VEvGGwEWioq7fC1nkw60h/wczvo98Aqa
         bq1o5j5/7u5yEn/DYiYIsef/UU4l/Gn/MI4gms5WLLhyEphOANg71Quc/fFOAdrLKUei
         rQqbxKNSPeszoxhbxV1iqEraecxFOS0Ofed7mhiNrHkbOzRJ8YqxZx6F4HG0zmLHIZj9
         EpLauF/9aot/aClMwHgkzfubUMRPloHawIaF0SWM9M0xZT6MKRQk7cA0ElkqoagBw7s7
         hBgWi8v4Qu8h0TzJOo21doBiVpLTG1XKloT0Dc5O23HSFxZXt/KKwqjW7S+Bs/z+5py4
         YRng==
X-Forwarded-Encrypted: i=1; AHgh+RpCCByfb4i2ttUV/6l5EOJ2iOz81rDiUVcbRcDtTOQ+7JSlSh2PxZeoWUk5ai2k42hVWP/HC1qFWB8uV0bl7MN2@lists.infradead.org
X-Gm-Message-State: AFuF++mX6NAuF5qTz+nWLzEiyHtlfu5TYOgEZC2WjQOtP1/Q5wM6ChT0
	KWMuz/EM0yOnS0CcZ4gquxAyS13fY9+wyuazkjSull1Z1560WWEhnjQ/0R/wU1o67wk=
X-Gm-Gg: AR+sD1054NK5EgagJBlSfTSvkNltZPSrh93V0So6WaLnm5x4lHBAgZgY8vQPbWW+ovT
	m+esOHFpLaq3PUHaBX1ZGXBooPC8+qQJsDKCYTUcA9xTOhNBqlymWCk9xsJ0YKitZNcWSriebr8
	zCZLbbW8KKkjsJSYIqAzz2+aSHJx6QixQWqfHIgU+b+e6uVsj7p5d7s7hh3w6xOvKob6DtPlrEA
	4V+whMV6V0xX99If55liAmnL14p2kAalq0PkubIZwR7dujEfZ05sOC8IkZHOn5HeBBhHlaCOf+c
	pdIhTy8mkyZeGjjl+7iY+90+550DRlUVa0tRCyqdaTnKdieVk0PVBe+bvvEqw+EInjnKs60JOAJ
	It3IZ6AmJ7YRButNubDV8m9RRW+fW7zHwkmAplN3Lx4ENJyg2w4Myb68NhfgrZlO1MVWR/D0dxc
	MLvCWDrDmVLcKhhgxzVv40NrQgNRS+WZ1UmY2jMQ1cJWzaxr6MOxGPu01u74T6+/96hK4N5E1JY
	gzN8w==
X-Received: by 2002:a05:6000:310f:b0:481:5bce:4485 with SMTP id ffacd0b85a97d-482c0b973acmr747490f8f.13.1787249041680;
        Thu, 20 Aug 2026 11:04:01 -0700 (PDT)
Received: from white-mocha.local ([2001:9e8:2f3:2d01:a8c3:fb9e:cfe9:fc36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d4asm12416365f8f.21.2026.08.20.11.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:04:01 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2
 BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Tan Siewert <tan.siewert@9elements.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com>
References: <20260727-ventura2_initial_dts-v9-0-504c0ec68039@gmail.com>
 <20260727-ventura2_initial_dts-v9-2-504c0ec68039@gmail.com>
Date: Thu, 20 Aug 2026 20:03:47 +0200
Message-Id: <178724902712.20555.7009712214570349708.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787249032; l=5992;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=xkWAHbvERekeZVhLd1I6wnLOphqgBrouvz38NaGNYY4=;
 b=0/jvytgo6mJLzFT571ev1e0JoXXcjVpaJpVyrgS3abI7bpwqvu3jemBPBCGtwqkZJ3BFd3enh
 VJQBdxWcwzhDGwXmSyj1PsTyM3CxG6hUAZpOcnhFY2e96Lc39yXoCz4
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_110405_693964_82D5D8B6 
X-CRM114-Status: GOOD (  25.15  )
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

Hi Kyle,

> Ventura2 is a Rack Management Controller. It is a modular
> device designed to manage liquid cooling systems and monitor hardware
> states within an IT rack. The system uses an AST2600 BMC for management.
> 
> RMCv2 serves several critical roles:
> - Detects liquid leakage at both tray and rack levels.
> - Communicates with and controls liquid cooling equipment.
> - Manages leakage events and executes system recovery protocols.
> 
> Key hardware features include:
> - An extensive I2C and IO expander topology to support comprehensive
>   sensor monitoring and backward compatibility with legacy trays.
> - MCTP over I2C support for asynchronous device communications.
> - A dual-flash design for BMC firmware redundancy.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>

*snip*

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> new file mode 100644
> index 000000000000..f1273ca31bf8
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> @@ -0,0 +1,3005 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	compatible = "facebook,ventura2-rmc", "aspeed,ast2600";
> +	model = "Facebook Ventura2 RMC";
> +
> +	aliases {
> +		/*
> +		* Pre-allocate I2C bus aliases for userspace predictability.
> +		* Several I2C channels are intentionally left empty in this
> +		* DTS as they are strictly reserved for future hardware
> +		* feature expansions and add-on boards that will interface
> +		* with these busses.
> +		*/
> +		/*
> +		* i2c switch 0-0077, pca9548, 8 child channels assigned
> +		* with bus number 16-23.
> +		*/

This alignment is one of the things that seem to be a false-positive for
dt-check-style in strict mode (value-whitespace). See [0] where Krzysztof said
that it may report false-positives, and "Review and investigate warnings from
'strict' mode, but do not fix them automatically without thinking".

@Krzysztof wdyt about this one?

> +		i2c16 = &i2c0mux0ch0;
> +		i2c17 = &i2c0mux0ch1;
> +		i2c18 = &i2c0mux0ch2;
> +		i2c19 = &i2c0mux0ch3;
> +		i2c20 = &i2c0mux0ch4;
> +		i2c21 = &i2c0mux0ch5;
> +		i2c22 = &i2c0mux0ch6;
> +		i2c23 = &i2c0mux0ch7;

*snip*

> +	spi {
> +		compatible = "spi-gpio";
> +		#address-cells = <1>;
> +		cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +		miso-gpios = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +		mosi-gpios = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +		num-chipselects = <1>;
> +		sck-gpios = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		#size-cells = <0>;

Shouldn't #address-cells and #size-cells be ordered together? If reported by
dt-check-style as issue, then it might be a false-positive.

> +
> +		tpm@0 {
> +			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +			reg = <0>;
> +			spi-max-frequency = <33000000>;
> +		};
> +	};
> +};
> +
> +&adc0 {
> +	pinctrl-0 =
> +		<&pinctrl_adc0_default &pinctrl_adc1_default
> +		&pinctrl_adc2_default &pinctrl_adc3_default
> +		&pinctrl_adc4_default &pinctrl_adc5_default
> +		&pinctrl_adc6_default &pinctrl_adc7_default>;
> +	pinctrl-names = "default";
> +	vref-supply = <&p1v8_bmc_aux>;
> +
> +	status = "okay";
> +};
> +
> +&adc1 {
> +	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc10_default>;
> +	pinctrl-names = "default";
> +	vref-supply = <&p2v5_bmc_aux>;
> +
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		label = "bmc";
> +		spi-max-frequency = <50000000>;
> +		m25p,fast-read;
> +
> +		status = "okay";
> +		#include "openbmc-flash-layout-128.dtsi"
> +	};
> +
> +	flash@1 {
> +		label = "alt-bmc";
> +		spi-max-frequency = <50000000>;
> +		m25p,fast-read;
> +
> +		status = "okay";

Missing '#include "openbmc-flash-layout-128-alt.dtsi"'?

> +	};
> +};

*snip*

> +&mac2 {
> +	phy-mode = "rmii";
> +	pinctrl-0 = <&pinctrl_rmii3_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	/*
> +	* The Marvell 88E6393X is initialized at boot via EEPROM
> +	* configuration and hardware straps.
> +	* The BMC connects via an RMII fixed-link; link parameters are fixed
> +	* by board design.
> +	*/

This kind of writing gives me the suspicion that it was written with assistance
by an LLM, but I might be wrong.

Either way, if you have used AI assistance for your series (or only for this
patch), even if you have only used it for the commit message, then you must
declare it via the "Assisted-by" trailer [1][2].

> +	fixed-link {
> +		full-duplex;
> +		speed = <100>;
> +	};
> +};
> +
> +&mac3 {
> +	pinctrl-0 = <&pinctrl_rmii4_default>;
> +	pinctrl-names = "default";
> +	use-ncsi;
> +
> +	status = "okay";
> +};
> +
> +&peci0 {
> +	status = "okay";
> +};

You mentioned that this is a rack management controller. Does it really require
PECI?

> +
> +&sgpiom0 {
> +	bus-frequency = <100000>;
> +	gpio-line-names =
> +	/*"input pin","output pin"*/
> +	/*A0 - A7*/
> +		"power-chassis-good","FM_PLD_HEARTBEAT_LVC3_R",
> +		"host0-ready","R_BMC_PTH_RST_BTN_L",
> +		"CONTROL_VT2_SUPPLY1_CLOSE","FM_MDIO_SW_SEL_PLD",
> +		"CONTROL_VT2_SUPPLY2_CLOSE","FM_88E6393X_BIN_UPDATE_EN_N",
> +		"CONTROL_VT2_SUPPLY3_CLOSE","Sequence_TransFR_Alert",

Why's "Sequence_TransFR_Alert" written in camelcase?

Tan

[0] https://lore.kernel.org/linux-aspeed/3523fefc-8ba8-4512-b088-7a94a2df73f8@oss.qualcomm.com/
[1] https://docs.kernel.org/process/submitting-patches.html#using-assisted-by
[2] https://docs.kernel.org/process/coding-assistants.html

-- 
Tan Siewert <tan.siewert@9elements.com>

