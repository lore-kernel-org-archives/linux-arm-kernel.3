Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8D3E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrGaQVxaxcSeBe1e1Iik830FnwfS8wNvcS7rghuYjlk=; b=yr2gVx6ZXeZOFuDf+xoZwEV2C8
	jR4aBNPT+Szm0CBJdS2kw9gA8k8yOO36VH3YZ4jwr7UT4lUVw+ecEJjpIQ1ldeWwGdnyx14EMCZ8D
	cIXQ08mtV1wWzF1h3X6wbC3wfL9+5yMOMP3uXCarg/ZMmem9BBWb1xzCwDIAwtnG2Blxjv3x/PWEM
	pNJtDcmXMWumEZ5DZA3DXJrmXHARgALyJN1v+bdUv9o9+3GxhiUlPhUDPmKqD5VABMpcPryAhvO7e
	ZUPPgpgC3sbuitLaFlocgIHVLQS7VXuv092a7AVjqNl62/gqUVzbeJqU/XexpVXtL8APNVFVbJsIc
	OukPT7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmNn-0000000AFqp-33cF;
	Wed, 18 Feb 2026 18:34:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsmNm-0000000AFpk-0FKN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 18:34:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4837634de51so884825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771439680; x=1772044480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrGaQVxaxcSeBe1e1Iik830FnwfS8wNvcS7rghuYjlk=;
        b=G+W0gpU4D86pJoslCxqe4Q/hcv4RMUIWLtfbKbsOyp5p1mlV4OCU483vswXg/Sd7Eh
         Af0X5/apa2yPNboJeNNAxciiv1QukQqYagyRQ+VInjCpqLMNupu5EYeIhLzPCx++cbaB
         4TNOIPh3GYa8kZGwzrbe6Gjo5vZCO5OWta9pG1JbrV5j7AbeYPeN/iW5JcclzFR1fv6W
         NnE3A/cV1JM/LyNDvgJSsnDamxln7Ux2EIaZzcDvztzZYhNdIOymO+DzrzhYASrAJ9cT
         R9jcNlf1xDFT1Ubvxrz+scQ5q25FmFv5uy1RSXzfugLQKV4LRzemUGWsQ2is1iqwsytz
         nTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439680; x=1772044480;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FrGaQVxaxcSeBe1e1Iik830FnwfS8wNvcS7rghuYjlk=;
        b=Z21+03RTXPf0cBhq/p3bGNve3gxxJe0p/PqZ0ljmWDrr4mYGxKjk1+C8nTEvdF94wJ
         89K/czdBbjw9hUSbDFdoPqoNauXNN7IRRsXctEYyy9NxsP59JqosYRHb5VIrERskzqA0
         Kn9O2xEq1+OAUg8EeQwg7Chc5vSxMoZNvnMsTVCDed3+5AH1MW8OAqhdMl+pzYfTRv8D
         zc64k9xbmf2r9T+KfbbRbefbOhAj4yPn6gsn0N9Nh92f4xjRqiG1N/SQupFiNvY9cH3i
         MLy1awdS7BCGioZq8p17DkRUwcZPOhCUU+cocbKFERJs6NF9tm/MIXPo4ggaNBy/urAd
         sUzw==
X-Forwarded-Encrypted: i=1; AJvYcCU5iLZUhzrtHSk8MYfOkRrYvK0JD7PMJU27wRH7ta77vHJBPSnqxbmKdMBwNfA6QJZTd7sS8jaPb/rXL6u0QPfs@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkb+jDLW/vCp1yAVzFiY9CgRhNE1v/SpGElqZOqunGj0PmfP5f
	yenuugzcdUaY0sVein4kKP8bpgWYMN4nfRDvHD/l77PaSNfsJZ7Dazmq/zpLIOZ44ALzO/WPex6
	415mQ
X-Gm-Gg: AZuq6aJyPHyT6rCD7instYpJnspOkPcQolNfhm0WIt6K+gdRittkoZkf8iiMV2fzinC
	y/JcklMqMnSdpC+c5Ly4F6hR6HemPKwIFsCFxqb6HhWngN+rdetgU9Sx5jq/p6IX1DjEQrR2t1T
	SAWq7OlNKhh7xMu5nsZPsDx5VyQvcWTWlsMHk+ugQ958/uzgkNplcIxUgdHmEbXTJYomDBrbdyI
	Cjwfzb/Tx5dAct9hjBH6EXnIkF0y/H5vMMnpElRFBDUqG4J5k5rSnbZxtkVtT/BeEqJcxirr7Fb
	zEIvNJU25i3ifBUC61jL/ex+cGHs6YtfT0qk10twOdXpK8ytc1n0yz+2hnOpdXBxNDeuXzhcKxe
	tOC5cLpn4aLe4NRGTm9+OvvGtEv9mxo5HmCREsRaD+sQgLwE0SC8ClKJll/sQeiH1eUBG8ZqxcZ
	XGYih+0wZO1/qOffeSjPMaXw==
X-Received: by 2002:a05:600c:1da1:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-48371085905mr314322705e9.22.1771439679304;
        Wed, 18 Feb 2026 10:34:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:cf71:8cf8:56bb:5790])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4834d7e50casm577892565e9.8.2026.02.18.10.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 10:34:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
In-Reply-To: <20260218112036.36905-1-linux-kernel-dev@aliel.fr> (Ronald
	Claveau's message of "Wed, 18 Feb 2026 12:20:33 +0100")
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
	<20260218112036.36905-1-linux-kernel-dev@aliel.fr>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 18 Feb 2026 19:34:37 +0100
Message-ID: <1jecmh6gua.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_103442_131913_54B38AE1 
X-CRM114-Status: GOOD (  13.60  )
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

On mer. 18 f=C3=A9vr. 2026 at 12:20, Ronald Claveau <linux-kernel-dev@aliel=
.fr> wrote:

> Add fixed clock and EMMC support for Amlogic T7 SoC family dtsi.

One topic per patch please

>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 129 ++++++++++++++++++++
>  1 file changed, 129 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-t7.dtsi
> index 6510068bcff9..b84281e5cdd8 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>   */
>=20=20
> +#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
> +#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/amlogic,t7-pwrc.h>
>  #include "amlogic-t7-reset.h"
> @@ -224,6 +226,24 @@ apb4: bus@fe000000 {
>  			#size-cells =3D <2>;
>  			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>=20=20
> +			clkc: clock-controller@0 {
> +				compatible =3D "amlogic,t7-peripherals-clkc";
> +				reg =3D <0x0 0x0 0x0 0x49c>;
> +				#clock-cells =3D <1>;
> +				clocks =3D <&xtal>,
> +						 <&fpll CLKID_FDIV2>,
> +						 <&fpll CLKID_FDIV2P5>,
> +						 <&fpll CLKID_FDIV3>,
> +						 <&fpll CLKID_FDIV4>,
> +						 <&fpll CLKID_FDIV5>,
> +						 <&hifi_pll CLKID_HIFI_PLL>,
> +						 <&mpll CLKID_MPLL2>,
> +						 <&mpll CLKID_MPLL3>,
> +						 <&gp0_pll CLKID_GP0_PLL>;
> +				clock-names =3D "xtal", "fdiv2", "fdiv2p5", "fdiv3", "fdiv4",
> +							  "fdiv5", "hifi", "mpll2", "mpll3", "gp0";
> +			};
> +
>  			reset: reset-controller@2000 {
>  				compatible =3D "amlogic,t7-reset";
>  				reg =3D <0x0 0x2000 0x0 0x98>;
> @@ -250,6 +270,68 @@ gpio: bank@4000 {
>  					#gpio-cells =3D <2>;
>  					gpio-ranges =3D <&periphs_pinctrl 0 0 157>;
>  				};
> +
> +				emmc_ctrl_pins: emmc-ctrl {
> +					mux-0 {
> +						groups =3D "emmc_cmd";
> +						function =3D "emmc";
> +						bias-pull-up;
> +						drive-strength-microamp =3D <4000>;
> +					};
> +
> +					mux-1 {
> +						groups =3D "emmc_clk";
> +						function =3D "emmc";
> +						bias-disable;
> +						drive-strength-microamp =3D <4000>;
> +					};
> +				};
> +
> +				emmc_data_4b_pins: emmc-data-4b {
> +					mux-0 {
> +						groups =3D "emmc_nand_d0",
> +								 "emmc_nand_d1",
> +								 "emmc_nand_d2",
> +								 "emmc_nand_d3";
> +						function =3D "emmc";
> +						bias-pull-up;
> +						drive-strength-microamp =3D <4000>;
> +					};
> +				};
> +
> +				emmc_data_8b_pins: emmc-data-8b {
> +					mux-0 {
> +						groups =3D "emmc_nand_d0",
> +								 "emmc_nand_d1",
> +								 "emmc_nand_d2",
> +								 "emmc_nand_d3",
> +								 "emmc_nand_d4",
> +								 "emmc_nand_d5",
> +								 "emmc_nand_d6",
> +								 "emmc_nand_d7";
> +						function =3D "emmc";
> +						bias-pull-up;
> +						drive-strength-microamp =3D <4000>;
> +					};
> +				};
> +
> +				emmc_ds_pins: emmc-ds {
> +					mux {
> +						groups =3D "emmc_nand_ds";
> +						function =3D "emmc";
> +						bias-pull-down;
> +						drive-strength-microamp =3D <4000>;
> +					};
> +				};
> +
> +				emmc_clk_gate_pins: emmc_clk_gate {
> +					mux {
> +						groups =3D "GPIOB_8";
> +						function =3D "gpio_periphs";
> +						bias-pull-down;
> +						drive-strength-microamp =3D <4000>;
> +					};
> +				};
>  			};
>=20=20
>  			gpio_intc: interrupt-controller@4080 {
> @@ -262,6 +344,38 @@ gpio_intc: interrupt-controller@4080 {
>  					<10 11 12 13 14 15 16 17 18 19 20 21>;
>  			};
>=20=20
> +			fpll: clock-controller@8040 {
> +				compatible =3D "amlogic,t7-fpll";
> +				reg =3D <0x0 0x8040 0x0 0x20>;
> +				#clock-cells =3D <1>;
> +				clocks =3D <&xtal>;
> +				clock-names =3D "xtal";
> +			};
> +
> +			gp0_pll: clock-controller@8080 {
> +				compatible =3D "amlogic,t7-gp0-pll";
> +				reg =3D <0x0 0x8080 0x0 0x20>;
> +				#clock-cells =3D <1>;
> +				clocks =3D <&xtal>;
> +				clock-names =3D "in0";
> +			};
> +
> +			hifi_pll: clock-controller@8100 {
> +				compatible =3D "amlogic,t7-hifi-pll";
> +				reg =3D <0x0 0x8100 0x0 0x20>;
> +				#clock-cells =3D <1>;
> +				clocks =3D <&xtal>;
> +				clock-names =3D "in0";
> +			};
> +
> +			mpll: clock-controller@8180 {
> +				compatible =3D "amlogic,t7-mpll";
> +				reg =3D <0x0 0x8180 0x0 0x20>;
> +				#clock-cells =3D <1>;
> +				clocks =3D <&fpll CLKID_FPLL_DCO>;
> +				clock-names =3D "in0";
> +			};
> +
>  			uart_a: serial@78000 {
>  				compatible =3D "amlogic,t7-uart", "amlogic,meson-s4-uart";
>  				reg =3D <0x0 0x78000 0x0 0x18>;
> @@ -276,6 +390,21 @@ sec_ao: ao-secure@10220 {
>  				reg =3D <0x0 0x10220 0x0 0x140>;
>  				amlogic,has-chip-id;
>  			};
> +
> +			sd_emmc_c: mmc@8c000{
> +				compatible =3D "amlogic,meson-axg-mmc";
> +				reg =3D <0x0 0x8c000 0x0 0x800>;
> +				interrupts =3D <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
> +				status =3D "disabled";
> +				clocks =3D <&clkc CLKID_SYS_SD_EMMC_C>,
> +						 <&clkc CLKID_SD_EMMC_C>,
> +						 <&gp0_pll CLKID_GP0_PLL>;
> +				clock-names =3D "core", "clkin0", "clkin1";
> +				assigned-clocks =3D <&clkc CLKID_SD_EMMC_C_SEL>;
> +				assigned-clock-parents =3D <&xtal>;
> +				no-sdio;
> +				no-sd;
> +			};
>  		};
>=20=20
>  	};

--=20
Jerome

