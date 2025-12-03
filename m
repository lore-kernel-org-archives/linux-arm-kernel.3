Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 750D6D1269B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 10:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pqzcwy0aG8j3v2uib4LvNWbMTBU5XU/UWKj8WABA/Yc=; b=zx3Qe4+hOqry6ZoNrITJlOO+VB
	hveypM0Md6PbxtNpAT1oSi0Q6rCxnuLDg3ifNGWn1JDGie7qx3MMEhfvy4cqIwuSgihdKI8nDhXhP
	zcCkm0C0LqRu3X+uvEIoMhLy4dzcbZjy5ZcbozpbKgwc4MpWU+xzyuU3fYMJm+8z6ngi/mY1ZVhuH
	Y+GFcdOe2SbaSZdyI1NK2jF7t0A7vqHJMR9ST+dFHfH1XwToTsMnpm2CSvWq8mZKuP0rr0PXc8HbX
	Z7zIf+ltalpWxCaEAvThqHsKS/bo5FvVYtLwer/OvvOuLQIas/M8d/ccAAiKEWxvlIq1UNmrgVbBa
	2kz8b6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkPO-00000006SvZ-1iLJ;
	Wed, 03 Dec 2025 10:48:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkPL-00000006Sue-0T3C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 10:48:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42e2ce8681eso2987968f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 02:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764758905; x=1765363705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pqzcwy0aG8j3v2uib4LvNWbMTBU5XU/UWKj8WABA/Yc=;
        b=Qr/pvA9nYty9lg05T4BubbaiNv3hC8XRM08HJhrEcDFpaJaPTyHbqVrJlz013QuZOg
         NqdrtVJvO7ufivLLrv1KkRLq+g8B7nAHYvgGdDd1Vr5JpPYs/qrVYOhh1jrBEoNeXaud
         paGzWxuDS53W7fR2IG5RCcCU6EU/fja8SG4hWZdrRHP8WgcIosaP7NRqTvYotsSX/1Os
         BN+6v1DdGYCZCSr5buxfAeJDRIsS3H9zK/2FnQ/lY9U4X4mYmoRkxpDGbqer+MP8FgbV
         JDZK/CtnGK0S2Gq9yEZk4lNv+zqjGIFSpyVwXlcFtXMJtQN4ByFE+W5YAHbzVEoZjfb8
         0V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764758905; x=1765363705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pqzcwy0aG8j3v2uib4LvNWbMTBU5XU/UWKj8WABA/Yc=;
        b=JPellfkUG2NNqgTfJI8SsrKL6wFl9BfswzH6ECLO3kYQcFGxivqkA6O2qoCphbpPIH
         x/ZvnizwwUg/ZF1d0QYEoRPz6AByEUJZ60m9cfWpL+XS5IvdW3t3Nob0WCvfxNVgbdw/
         X0IRRQWfJSqk6hpZbrJMZtEtoLcmJnCSVxyVsZ7v91ENsGVhyTTKGR39GYiFCPNv10kO
         kVqHO4S4l2FQyPE62wvzInXh0UjF21V01QBwdec+xiuLKZSEAQ0+Wc7dZ6uMVe7hBncQ
         auzkPKCSPfGYyaQWXl/JxLV839sr+20Tca7LYVnBUNQKuDAZ8kBLbkBD0zJgSZDnH2QA
         5PTw==
X-Forwarded-Encrypted: i=1; AJvYcCWJEkgx1ZslbmO4RKBVwdHf0hefOdmJZVmeIm9sL9EIu/Y1geoLsw/xH6E9ckoR1GD6zuFuijsJT8MLlDVXn1XO@lists.infradead.org
X-Gm-Message-State: AOJu0YwBIFhD36wIC3OQBhr8164Xh0NR7ZkU7ofVQHEIlMRCVxZp0ezf
	wuv3yG9AW7HXLK5n+7jV0YgSpJb+NGNWet3S0qMhiSA+ge3gGajoB6fD
X-Gm-Gg: ASbGncvCpoOWec/pCNfWw+nJBSF+tJXbbRnTbiNTDR8nnd0UR8dDmmBhEcci4l/NOPV
	FPxkLGZfmdh3KRdbgI2suVGM4u/RNmWK2f+Y/s8pO/hZWlPFjk4ip/qPG7NgIX96GmXbwaL3YsN
	nKyy7i3RdhQ4VUbC7fUVD5mulcklXRTeHDuygQRDi64MTjYKIzJGHg2XOzoaSUAGJdnYbTrVpux
	5SgoionX5dNKLHZ5ir1qNxMqliZ0n73MtEoJBGlMGqo3zsbPdUxD3IJNDJu5q+jmv3FawvvgBrc
	ZAfqJu8rCLOVFIgzrdFovhvi/ggThCerLkFomop7gSafBuaaUnZD4DW5F0A8zU+opr1mQubyqBl
	c//6DgCr0K/P/rjfOa+Fg5ndBZEnmMLV7y1ouiRatPxodCvQOtht+0d+k+1vxCgNe1sMrQfxyPI
	hasIAb5a8j8UiBZStH
X-Google-Smtp-Source: AGHT+IGU+zTWxb7oJWKF6SgoxvEbG8MC6Zs0ybOgfpb5deisxlDFrb0fyykgbfmWUBQODvUaKcyUfw==
X-Received: by 2002:a05:6000:4203:b0:427:526:16aa with SMTP id ffacd0b85a97d-42f731cf22emr1651680f8f.58.1764758905050;
        Wed, 03 Dec 2025 02:48:25 -0800 (PST)
Received: from owl5 ([2001:861:3201:3d10:5de7:b6f0:41df:be6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1caa86d0sm36929364f8f.39.2025.12.03.02.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 02:48:24 -0800 (PST)
Date: Wed, 3 Dec 2025 11:48:23 +0100
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 3/4] arm64: dts: mediatek: add device tree for
 Tungsten 510 board
Message-ID: <aTAVd6wJYheV7M4p@owl5>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
 <20251202-review-v4-3-93f5cd2a0d4a@gmail.com>
 <e9edd5f2-c0ff-48fa-baf9-659dd0073e3d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9edd5f2-c0ff-48fa-baf9-659dd0073e3d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_024827_362735_0F28A47C 
X-CRM114-Status: GOOD (  26.73  )
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

Hi Angelo,

On Wed, Dec 03, 2025 at 07:50:29AM +0100, AngeloGioacchino Del Regno wrote:
> Il 02/12/25 23:08, Gary Bisson ha scritto:
> > Add device tree to support Ezurio Tungsten 510 (MT8370) SMARC SOM [1] +
> > Universal SMARC carrier board [2].
> > It includes support for the MIPI-DSI BD070LIC3 display which uses the
> > Tianma TM070JDHG30 panel + TI SN65DSI84 MIPI-DSI to LVDS bridge [3].
> > 
> > [1] https://www.ezurio.com/product/tungsten510-smarc
> > [2] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
> > [3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display
> > 
> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > 
> 
> Hello!
> 
> Thanks for the patch, that's mostly good. Though, there are a few comments, please
> check below.

Thanks for the quick response, some comments inline below.

> > ---
> > Changes in v2:
> > - Updated nodes to be generic (pmic, i2c, usb-typec)
> > Changed in v3:
> > - None
> > Changed in v4:
> > - Fixed remaining DTB warnings
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile              |    1 +
> >   .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
> >   .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1510 ++++++++++++++++++++
> >   3 files changed, 1525 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index a4df4c21399e..30d169a31b10 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -99,6 +99,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts b/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
> > new file mode 100644
> > index 000000000000..d713ef77df3a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2025 Ezurio LLC
> > + * Author: Gary Bisson <bisson.gary@gmail.com>
> > + */
> > +/dts-v1/;
> > +#include "mt8370.dtsi"
> > +#include "mt83x0-tungsten-smarc.dtsi"
> > +
> > +/ {
> > +	model = "Ezurio Tungsten510 SMARC (MT8370)";
> > +	compatible = "ezurio,mt8370-tungsten-smarc", "mediatek,mt8370",
> > +		     "mediatek,mt8188";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi
> > new file mode 100644
> > index 000000000000..d71148d78781
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi
> > @@ -0,0 +1,1510 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2025 Ezurio LLC
> > + * Author: Gary Bisson <bisson.gary@gmail.com>
> > + */
> > +
> 
> ..snip..
> 
> > +
> > +&disp_dsi0 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		port@0 {
> > +			reg = <0>;
> > +			dsi0_in: endpoint {
> > +				remote-endpoint = <&dither0_out>;
> > +			};
> > +		};
> > +
> > +		port@1 {
> > +			reg = <1>;
> > +			dsi0_out: endpoint {
> > +				remote-endpoint = <&sn65dsi84_bridge_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dither0_in {
> > +	remote-endpoint = <&postmask0_out>;
> > +};
> > +
> > +&dither0_out {
> > +	remote-endpoint = <&dsi0_in>;
> > +};
> > +
> > +&eth {
> > +	phy-mode ="rgmii-id";
> > +	phy-handle = <&ethernet_phy0>;
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&eth_default_pins>;
> > +	pinctrl-1 = <&eth_sleep_pins>;
> > +	mediatek,mac-wol;
> > +	snps,reset-gpio = <&pio 27 GPIO_ACTIVE_LOW>;
> > +	snps,reset-active-low;
> > +	snps,reset-delays-us = <0 11000 1000>;
> > +	status = "okay";
> > +};
> > +
> > +&eth_mdio {
> > +	ethernet_phy0: ethernet-phy@7 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <0x7>;
> > +		interrupts-extended = <&pio 148 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +};
> > +
> > +&gamma0_out {
> > +	remote-endpoint = <&postmask0_in>;
> > +};
> > +
> > +&gpu {
> > +	mali-supply = <&mt6359_vproc2_buck_reg>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c0_pins>;
> > +	clock-frequency = <100000>;
> > +	status = "okay";
> > +
> > +	i2c-mux@73 {
> > +		compatible = "nxp,pca9546";
> > +		reg = <0x73>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&i2c0_mux_pins>;
> > +		reset-gpios = <&pio 6 GPIO_ACTIVE_LOW>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		i2c_mux_gp_0: i2c@0 {
> > +			clock-frequency = <100000>;
> > +			reg = <0>;
> 
> reg = <0>;
> clock-frequency = ...
> 
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c_mux_gp_1: i2c@1 {
> > +			clock-frequency = <100000>;
> > +			reg = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c_mux_gp_2: i2c@2 {
> > +			clock-frequency = <100000>;
> > +			reg = <2>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c_mux_gp_3: i2c@3 {
> > +			clock-frequency = <100000>;
> > +			reg = <3>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1_pins>;
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c2 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c2_pins>;
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +
> > +	i2c-mux@73 {
> > +		compatible = "nxp,pca9546";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&i2c_mux_smarc_lcd_pins>;
> > +		reg = <0x73>;
> > +		reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		i2c_mux_lcd_0: i2c@0 {
> > +			clock-frequency = <100000>;
> > +			reg = <0>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c_mux_lcd_1: i2c@1 {
> > +			clock-frequency = <100000>;
> > +			reg = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c_mux_lcd_2: i2c@2 {
> > +			clock-frequency = <100000>;
> > +			reg = <2>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		i2c_mux_lcd_3: i2c@3 {
> > +			clock-frequency = <100000>;
> > +			reg = <3>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +	};
> > +};
> > +
> > +&i2c3 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c3_pins>;
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c4 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c4_pins>;
> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +};
> > +
> > +&i2c_mux_gp_0 {
> > +	rv3028: rtc@52 {
> > +		compatible = "microcrystal,rv3028";
> > +		reg = <0x52>;
> > +		interrupts-extended = <&pio 42 IRQ_TYPE_LEVEL_LOW>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&rv3028_pins>;
> > +		#clock-cells = <0>;
> > +		wakeup-source;
> > +	};
> > +};
> > +
> > +&i2c_mux_gp_1 {
> > +	usb-typec@60 {
> > +		compatible = "ti,hd3ss3220";
> 
> reg always goes after compatible.
> 
> > +		interrupts-extended = <&pio 45 IRQ_TYPE_LEVEL_LOW>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&hd3ss3220_pins>;
> > +		reg = <0x60>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				hd3ss3220_in_ep: endpoint {
> > +					remote-endpoint = <&ss_ep>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +				hd3ss3220_out_ep: endpoint {
> > +					remote-endpoint = <&usb_role_switch>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c_mux_gp_2 {
> > +	codec@1a {
> 
> compatible
> reg
> clocks
> gpio-cfg
> 
> supplies
> 
> P.S.: Please read
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Noted, thanks. However for the wm8962 the gpio-cfg is recommended at the
per its doc, hope that's ok
("Documentation/devicetree/bindings/sound/wlf,wm8962.yaml).

> > +		#sound-dai-cells = <0>;
> > +		AVDD-supply = <&reg_1v8>;
> > +		CPVDD-supply = <&reg_1v8>;
> > +		DBVDD-supply = <&reg_3v3>;
> > +		DCVDD-supply = <&reg_1v8>;
> > +		MICVDD-supply = <&reg_3v3>;
> > +		PLLVDD-supply = <&reg_1v8>;
> > +		SPKVDD1-supply = <&reg_5v>;
> > +		SPKVDD2-supply = <&reg_5v>;
> > +		clocks = <&topckgen CLK_TOP_I2SO1>;
> > +		compatible = "wlf,wm8962";
> > +		gpio-cfg = <
> > +			0x0000 /* n/c */
> > +			0x0000 /* gpio2: */
> > +			0x0000 /* gpio3: */
> > +			0x0000 /* n/c */
> > +			0x8081 /* gpio5:HP detect */
> > +			0x8095 /* gpio6:Mic detect */
> > +		>;
> > +		reg = <0x1a>;
> > +	};
> > +};
> > +
> > +&i2c_mux_lcd_2 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +
> > +	bridge@2c {
> > +		compatible = "ti,sn65dsi84";
> > +		reg = <0x2c>;
> > +		enable-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&dsi0_sn65dsi84_pins>;
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +
> > +				sn65dsi84_bridge_in: endpoint {
> > +					remote-endpoint = <&dsi0_out>;
> > +					data-lanes = <1 2 3 4>;
> > +				};
> > +			};
> > +
> > +			port@2 {
> > +				reg = <2>;
> > +
> > +				sn65dsi84_bridge_out: endpoint {
> > +					remote-endpoint = <&dsi0_panel_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	touchscren@5d {
> > +		compatible = "goodix,gt911";
> > +		reg = <0x5d>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&ts_dsi0_goodix_pins>;
> > +		interrupts-extended = <&pio 146 IRQ_TYPE_LEVEL_HIGH>;
> > +		irq-gpios = <&pio 146 GPIO_ACTIVE_HIGH>;
> > +		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> > +
> > +&mfg0 {
> > +	domain-supply = <&mt6359_vproc2_buck_reg>;
> > +};
> > +
> > +&mfg1 {
> > +	domain-supply = <&mt6359_vsram_others_ldo_reg>;
> > +};
> > +
> > +&mmc0 {
> > +	status = "okay";
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc0_default_pins>;
> > +	pinctrl-1 = <&mmc0_uhs_pins>;
> > +	bus-width = <8>;
> > +	max-frequency = <200000000>;
> > +	cap-mmc-highspeed;
> > +	cap-mmc-hw-reset;
> > +	mmc-hs200-1_8v;
> > +	mmc-hs400-1_8v;
> > +	supports-cqe;
> > +	cap-mmc-hw-reset;
> 
> You added cap-mmc-hw-reset twice.
> 
> > +	no-sdio;
> > +	no-sd;
> > +	hs400-ds-delay = <0x1481b>;
> > +	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
> > +	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
> > +	non-removable;
> 
> Also, please reorder by name:
> 
> bus-width ...
> cap-mmc-highspeed;
> cap-mmc-hw-reset;
> hs400-ds-delay....
> max-frequency ....
> mmc-hs200-1_8v;
> mmc-hs400-1_8v;
> no-sd;
> no-sdio;
> non-removable;
> supports-cqe;
> 
> pinctrl properties
> 
> power supplies
> 
> status

Will do, note that this is a copy/paste of the already-upstream
mt8390-genio-common.dtsi.

> > +};
> > +
> > +&mmc1 {
> > +	status = "okay";
> > +	pinctrl-names = "default", "state_uhs";
> > +	pinctrl-0 = <&mmc1_default_pins>;
> > +	pinctrl-1 = <&mmc1_uhs_pins>;
> > +	bus-width = <4>;
> > +	max-frequency = <200000000>;
> > +	cap-sd-highspeed;
> > +	sd-uhs-sdr50;
> > +	sd-uhs-sdr104;
> > +	cd-gpios = <&pio 2 GPIO_ACTIVE_LOW>;
> > +	vqmmc-supply = <&mt6359_vsim1_ldo_reg>;
> > +	vmmc-supply = <&sdcard_en_3v3>;
> > +};
> > +
> > +&mmc2 {
> > +	status = "okay";
> 
> status at the end please
> 
> > +	pinctrl-names = "default", "state_uhs", "state_eint";
> > +	pinctrl-0 = <&mmc2_default_pins>;
> > +	pinctrl-1 = <&mmc2_uhs_pins>;
> > +	pinctrl-2 = <&mmc2_eint_pins>;
> 
> Sorry, but I truly hate /delete-property/.
> 
> > +	/delete-property/ interrupts;
> > +	interrupt-names = "msdc", "sdio_wakeup";
> > +	interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
> > +			      <&pio 172 IRQ_TYPE_LEVEL_LOW>;
> 
> You're lucky in this case, though, because you're the first user of MMC2! :-)
> 
> The solution here is:
>  - Change the interrupts property in mt8188.dtsi on mmc@1125000 to
>    `interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;`
>  - Override it here without `/delete-property/ interrupts;`

Ok, will do a mt8188 patch then, I'll modify all mmc nodes that way to
be consistent.

> > +	bus-width = <4>;
> 
> Please order the properties by name (bar X-supply, Y-pwrseq, status that go at
> the end).
> 
> > +	max-frequency = <200000000>;
> > +	cap-sd-highspeed;
> > +	sd-uhs-sdr104;
> > +	keep-power-in-suspend;
> > +	wakeup-source;
> > +	cap-sdio-irq;
> > +	no-mmc;
> > +	no-sd;
> > +	non-removable;
> > +	vmmc-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
> > +	vqmmc-supply = <&mt6359_vcn18_ldo_reg>;
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +};
> > +
> > +&mipi_tx_config0 {
> > +	status = "okay";
> > +};
> > +
> > +&mt6359codec {
> > +	mediatek,mic-type-0 = <1>;
> > +	mediatek,mic-type-1 = <3>;
> 
> You can drop mic-type-2 and dmic-mode, as the defaults for these are already zero.
> 
> > +	mediatek,mic-type-2 = <0>;
> > +	mediatek,dmic-mode = <0>;
> > +};
> > +
> 
> ..snip..
> 
> > +
> > +&mt6359_vproc2_buck_reg {
> > +	/* The name "vgpu" is required by mtk-regulator-coupler */
> > +	regulator-name = "vgpu";
> > +	regulator-min-microvolt = <550000>;
> > +	regulator-max-microvolt = <800000>;
> > +	regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
> > +	regulator-coupled-max-spread = <225000>;
> > +	regulator-always-on;
> 
> You don't need regulator-always-on here.
> 
> > +};
> > +
> > +&mt6359_vs2_buck_reg {
> > +	regulator-min-microvolt = <1600000>;
> > +	regulator-boot-on;
> > +};
> > +
> > +&mt6359_vpu_buck_reg {
> > +	regulator-name = "dvdd_adsp";
> 
> Is that for the MediaTek Audio DSP?

Yes and no, this design matches the EVK one from MTK on that rail, which
means the same rail is used as:
- DVDD_ADSP
- DVDD_SRAM_CORE
- DVDD_SRAM_MM
- AVDD075_DRV_DSI

> Thought Genio 500/700 were kind of "special" in having one just for that.
> 
> If so, you have to do this properly and add this to the ADSP power domain as a
> domain-supply, if this effectively enables basic power to the ADSP itself.
> 
> To do so, you must also change drivers/pmdomain/mediatek/mt8188-pm-domains.h and in
> MT8188_POWER_DOMAIN_ADSP you want to change `.caps` to
> 
> .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP |
> 	MTK_SCPD_DOMAIN_SUPPLY,
> 
> ...so that you can remove the regulator-always-on property here, and benefit from a
> nice bump in power efficiency (as you stop power leakages like so).

Considering the comment above, is it ok to leave it as-is (like it is
done in the mt8390-genio-common.dtsi)? Or would you like to change the
reg name to make it more obvious it's not only for adsp?

> > +	regulator-always-on;
> > +};
> > +
> > +&mt6359_vrf12_ldo_reg {
> > +	regulator-name = "va12_abb2_pmu";
> > +	regulator-always-on;
> > +};
> > +
> > +&mt6359_vsram_md_ldo_reg {
> > +	regulator-always-on;
> > +};
> > +
> > +&mt6359_vsram_others_ldo_reg {
> > +	/* The name "vsram_gpu" is required by mtk-regulator-coupler */
> > +	regulator-name = "vsram_gpu";
> > +	regulator-min-microvolt = <750000>;
> > +	regulator-max-microvolt = <800000>;
> > +	regulator-coupled-with = <&mt6359_vproc2_buck_reg>;
> > +	regulator-coupled-max-spread = <225000>;
> > +	regulator-always-on;
> 
> You don't need regulator-always-on here.
> 
> > +};
> > +
> > +&mt6359_vsim1_ldo_reg {
> > +	regulator-name = "vsim1_pmu";
> > +	regulator-max-microvolt = <1800000>;
> > +	regulator-enable-ramp-delay = <480>;
> > +};
> > +
> > +&mt6359_vufs_ldo_reg {
> > +	regulator-name = "vufs18_pmu";
> > +	regulator-always-on;
> > +};
> > +
> > +&ovl0_in {
> > +	remote-endpoint = <&vdosys0_ep_main>;
> > +};
> > +
> > +&pcie {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie_default_pins>;
> > +	status = "okay";
> > +};
> > +
> > +&pciephy {
> > +	status = "okay";
> > +};
> > +
> > +&pmic {
> > +	interrupt-parent = <&pio>;
> > +	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
> 
> Instead of interrupt-parent and interrupts, you can do:
> 
> interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> 
> > +
> > +	keys {
> > +		compatible = "mediatek,mt6359-keys";
> > +		mediatek,long-press-mode = <1>;
> > +		power-off-time-sec = <0>;
> > +
> > +		power-key {
> > +			linux,keycodes = <116>;
> 
> At the top of the file, properly ordered:
> #include <dt-bindings/input/linux-event-codes.h>
> 
> ...then, here:
> linux,keycodes = <KEY_POWER>;
> 
> > +			wakeup-source;
> > +		};
> > +	};
> > +};
> > +
> > +&postmask0_in {
> > +	remote-endpoint = <&gamma0_out>;
> > +};
> > +
> > +&postmask0_out {
> > +	remote-endpoint = <&dither0_in>;
> > +};
> > +
> > +&scp_cluster {
> > +	status = "okay";
> > +};
> > +
> > +&scp_c0 {
> > +	firmware-name = "mediatek/mt8188/scp.img";
> 
> You don't need (and can't have) firmware-name upstream: drop it.

Oops, that's a copy/paste from the collabora tree ;)

> > +	memory-region = <&scp_mem>;
> > +	status = "okay";
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-0 = <&spi0_pins>;
> > +	pinctrl-names = "default";
> > +	mediatek,pad-select = <0>;
> 
> vendor properties always at the end, before status = "okay";
> 
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> 
> ...but anyway, #address-cells, #size-cells are already declared in mt8188.dtsi and
> they even have the same values that you're assigning here. Drop those.
> 
> > +	status = "okay";
> > +};
> > +
> > +&spi1 {
> > +	pinctrl-0 = <&spi1_pins>;
> > +	pinctrl-names = "default";
> > +	mediatek,pad-select = <0>;
> 
> same comments apply here as well.
> 
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +};
> > +
> 
> ..snip..
> 
> > +&uart0 {
> > +	pinctrl-0 = <&uart0_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-0 = <&uart1_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&uart2 {
> > +	pinctrl-0 = <&uart2_pins>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> > +&ssusb0 {
> 
> Please reorder:
> 
> dr_mode
> maximum-speed
> usb-role-switch;
> wakeup-source;
> pinctrl-0
> pinctrl-names
> vusb33-supply
> status

Ok, will rework all ports.

> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&usbotg_pins>;
> > +	maximum-speed = "high-speed";
> > +	usb-role-switch;
> > +	dr_mode = "otg";
> > +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> > +	wakeup-source;
> > +	status = "okay";
> > +
> > +	connector {
> > +		compatible = "usb-c-connector";
> > +		label = "USB-C";
> > +		data-role = "dual";
> > +
> > +		ports {
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			port@0 {
> > +				reg = <0>;
> > +				hs_ep: endpoint {
> > +					remote-endpoint = <&usb_hs_ep>;
> > +				};
> > +			};
> > +
> > +			port@1 {
> > +				reg = <1>;
> > +				ss_ep: endpoint {
> > +					remote-endpoint = <&hd3ss3220_in_ep>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		port@0 {
> > +			reg = <0>;
> > +			usb_hs_ep: endpoint {
> > +				remote-endpoint = <&hs_ep>;
> > +			};
> > +		};
> > +
> > +		port@1 {
> > +			reg = <1>;
> > +			usb_role_switch: endpoint {
> > +				remote-endpoint = <&hd3ss3220_out_ep>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&u2port0 {
> > +	status = "okay";
> > +};
> > +
> > +&u3phy0 {
> > +	status = "okay";
> > +};
> > +
> > +&xhci0 {
> > +	vbus-supply = <&usb_p0_vbus>;
> > +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> > +	status = "okay";
> > +};
> > +
> > +&ssusb1 {
> 
> Please reorder:
> 
> dr_mode
> maximum-speed
> wakeup-source
> pinctrl-0
> pinctrl-names
> vusb33-supply
> status
> 
> > +	pinctrl-0 = <&usb1_pins>;
> > +	pinctrl-names = "default";
> > +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> > +	dr_mode = "host";
> > +	wakeup-source;
> > +	status = "okay";
> > +};
> > +
> > +&u2port1 {
> > +	status = "okay";
> > +};
> > +
> > +&u3port1 {
> > +	status = "okay";
> > +};
> > +
> > +&u3phy1 {
> > +	status = "okay";
> > +};
> > +
> > +&xhci1 {
> > +	vbus-supply = <&usb_p1_vbus>;
> > +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> > +	status = "okay";
> > +};
> > +
> > +&ssusb2 {
> 
> Please reorder:
> 
> dr_mode
> maximum-speed
> wakeup-source
> vusb33-supply
> status
> 
> > +	maximum-speed = "high-speed";
> > +	dr_mode = "host";
> > +	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> > +	status = "okay";
> > +	wakeup-source;
> > +};
> > +
> ..snip..
> 
> > +&vdosys0 {
> > +	port {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		vdosys0_ep_main: endpoint@0 {
> > +			reg = <0>;
> > +			remote-endpoint = <&ovl0_in>;
> > +		};
> > +	};
> > +};
> > +
> > +&watchdog {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&watchdog_pins>;
> > +};
> > +
> > +&pio {
> > +	audio_pins: audio-pins {
> > +		pins-aud-pmic {
> > +			pinmux = <
> > +				PINMUX_GPIO101__FUNC_O_AUD_CLK_MOSI
> > +				PINMUX_GPIO102__FUNC_O_AUD_SYNC_MOSI
> > +				PINMUX_GPIO103__FUNC_O_AUD_DAT_MOSI0
> > +				PINMUX_GPIO104__FUNC_O_AUD_DAT_MOSI1
> > +				PINMUX_GPIO105__FUNC_I0_AUD_DAT_MISO0
> > +				PINMUX_GPIO106__FUNC_I0_AUD_DAT_MISO1
> > +			>;
> 
> You don't need the extra lines...
> 
> 			pinmux = <PINMUX_GPIO101__FUNC_O_AUD_CLK_MOSI
> 				  PINMUX_GPIO102__FUNC_O_AUD_SYNC_MOSI
> 				  PINMUX_GPIO103__FUNC_O_AUD_DAT_MOSI0
> 				  PINMUX_GPIO104__FUNC_O_AUD_DAT_MOSI1
> 				  PINMUX_GPIO105__FUNC_I0_AUD_DAT_MISO0
> 				  PINMUX_GPIO106__FUNC_I0_AUD_DAT_MISO1>;
> 
> here and everywhere else please :-)
> 		
> > +		};
> > +
> > +		pins-pcm-wifi {
> > +			pinmux = <
> > +				PINMUX_GPIO121__FUNC_B0_PCM_CLK
> > +				PINMUX_GPIO122__FUNC_B0_PCM_SYNC
> > +				PINMUX_GPIO123__FUNC_O_PCM_DO
> > +				PINMUX_GPIO124__FUNC_I0_PCM_DI
> > +			>;
> > +		};
> > +
> > +		pins-i2s {
> > +			pinmux = <
> > +				PINMUX_GPIO119__FUNC_O_I2SO1_MCK
> > +				PINMUX_GPIO112__FUNC_O_I2SO1_WS
> > +				PINMUX_GPIO120__FUNC_O_I2SO1_BCK
> > +				PINMUX_GPIO113__FUNC_O_I2SO1_D0
> > +				PINMUX_GPIO110__FUNC_I0_I2SIN_D0
> > +			>;
> > +		};
> > +	};
> > +
> > +	disp_pwm0_pins: disp-pwm0-pins {
> > +		pins {
> > +			pinmux = <PINMUX_GPIO29__FUNC_O_DISP_PWM0>;
> > +			bias-pull-down;
> > +		};
> > +	};
> > +
> > +	dsi0_sn65dsi84_pins: dsi0-sn65dsi84-pins {
> > +		pins-irq {
> > +			pinmux = <PINMUX_GPIO128__FUNC_B_GPIO128>;
> > +			bias-pull-down;
> > +			input-enable;
> > +		};
> > +
> > +		pins-enable {
> > +			pinmux = <PINMUX_GPIO25__FUNC_B_GPIO25>;
> > +			bias-pull-down;
> > +		};
> > +	};
> > +
> > +	eth_default_pins: eth-default-pins {
> > +		pins-txd {
> > +			pinmux = <PINMUX_GPIO131__FUNC_O_GBE_TXD3>,
> > +				 <PINMUX_GPIO132__FUNC_O_GBE_TXD2>,
> > +				 <PINMUX_GPIO133__FUNC_O_GBE_TXD1>,
> > +				 <PINMUX_GPIO134__FUNC_O_GBE_TXD0>;
> > +			drive-strength = <MTK_DRIVE_8mA>;
> 
> Please don't use the MTK_DRIVE_x macros, we are in the process of removing them.
> 
> All those macros are defining the .. same number that you can read in the macro
> itself; as in:
> 
> MTK_DRIVE_(n)mA = n -> MTK_DRIVE_8mA = 8
> 
> So, remove all of them and use numbers directly.
> In this specific case it is `drive-strength = <8>;` - please do this here and
> everywhere else.

Ok. Should be able to offer a new revision later today.

Thanks,
Gary

