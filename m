Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A313C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LM99SZJhiYckZeRf7zBWhT51kFSY0wK17dmbVXYXC8o=; b=U01ofzqwIpr5UwEKKMj1bNFWiw
	bAKkndH911MKPCNzMU/pXQKvnuntZtOrtN7fYQQWCf7IaZJOoLxZvWkDowFJ9vtZDoHX06cynxPRO
	7rUEuFB8Ab7vwaof7xASLgvAO0xFsd3I3TqOJftPeMW2c2dy7WBna2CUqENzPj+AH8rAa2AqkLwnm
	fGIytV1PyQs06B0GzGfHZWZjuA/qgMo/gncGQlDkiamXvF0DEAeYLNq970nQTgnosqnLGZ+4gUskt
	eKIE9frC+feeNQTdedcV7a2WSMotwyrxfk7NbTzCXMZvYWNRt6CqIW0NqdT29bMAyzLxKzlRiagzb
	dp6ZRW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm6A-00000007lPq-19k9;
	Sat, 22 Feb 2025 09:47:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlm4g-00000007lB6-20BR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:45:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38f504f087eso2404202f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 01:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740217529; x=1740822329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LM99SZJhiYckZeRf7zBWhT51kFSY0wK17dmbVXYXC8o=;
        b=E6PDvqNOktld/0y2QZT71gPKH84bkUIMWtKg3RUIHR5DIhQ+cJNM6cr5OqoLyTsXjY
         SokMbsuqCveFC5w20dMR8ycxZwHx7yBRtKl4BV/+OIL8WEsqpMdv9IZAlZU6O0df10Ne
         BKZ0ZBEjpClIxH0fNuAp7r2QsvLwOsHoL+JMDIhIVYun50KLPzQdWufioraHfNfp6dfd
         qV8DUqgHBVQdgIRNeCGnumaBRrwKKBhN8Nl+ee5K+IdigHH2+rSpP7LPyWJN4rUrhKV3
         Ix7okPsjgsL6uNkiJmVEaOoaPCDhyTxO+SgCkogrMX+LNKEEsjMU0uW8ee3GIcr94j+7
         oNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217529; x=1740822329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LM99SZJhiYckZeRf7zBWhT51kFSY0wK17dmbVXYXC8o=;
        b=MsjnL8bSkfZsLj3V1AyZfWPU02+yz2+xJ/wudRLoVo9WM8pPE0d0P4E3Pb4IWRIrxO
         b2yHNDNrj94vvL2wMIO0f6L5GIt0Onin2edX2inxisQCDaDMnEamJNVj59iL3jrfpn18
         jbsUnFNu2Ywdl45fGpUYEN6NEZNa+HlTEcAdnnXrB6ljO3qF18QmOf6lGoz7y+rWd7wT
         UpWlRaXYeLS5ZENFhxWNdo4qtCnUR2gWqMhAh+QzIObUkEtCrls8XnhBAD71m8jGVjBl
         778WXpMIMRLOB0km/BqbqgCxjJvhIGWpX5fLuGBjLe2i1F2ZilWeO1cw1wajIA37XFxr
         dvyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB6sW6u93OQfu2jgVmLVu0Z843prpZNck1G9awriwD9XKeeGZMJnLVGkoLCvcXr/uydSrtgEnHU48Pk/W0jSXh@lists.infradead.org
X-Gm-Message-State: AOJu0YxCvkUYl/S4B9NK6JJ/SJaFV47bwuffZRSyCPTCEJrMca9DcfeT
	yrBhhueREMWgpgfIK2UiMyUqtV7S9wkOInjgKq6TAmcCpDk6uKiA
X-Gm-Gg: ASbGncv8mErf8vE4wfcnaZokyXBxSn1raZmNGVcLl8kK+v0YFJR2ogeZlNO5cSyzKYr
	R6Oz8pmYfol4SauJB0+dwAvbPdGLTl+FwVsgdsI40/36hFqJym6OaeemrGHubZhBTkm+Gjqv1Ta
	nXeJbbXCJRgr5MqbXZ0m+1DFsdofZA6omJv/0kUkigHZhLpT3ChC2Gsfxm+r3pP6wX8zGjAoaRk
	Dxatz7RyCIg1UQ/6UWbOnGv0w/fkEHOqkaDeGEpsXTBmROlCV9VNz63DJ+BkzYjJGNj3MIke46v
	TB+MvmjYnb6/hwwjQoC9Z3xBe26Cx05X7+hdu8zVKp58MOC/24DOaSso/k7CUtqs87uyjOAq+7J
	7Wg==
X-Google-Smtp-Source: AGHT+IElc5lFlH37PVUP+d0Nts8TxGEBKie4yrCYq8UZcLNclnFFC/us6pnWUIep7DBJZWJMU/+Bqg==
X-Received: by 2002:a5d:6daa:0:b0:38f:28cb:4d35 with SMTP id ffacd0b85a97d-38f6e95b175mr5481843f8f.13.1740217528506;
        Sat, 22 Feb 2025 01:45:28 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8dd6sm26089591f8f.62.2025.02.22.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:45:28 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH 5/8] arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
Date: Sat, 22 Feb 2025 10:45:27 +0100
Message-ID: <1916004.CQOukoFCf9@jernej-laptop>
In-Reply-To: <20250216092827.15444-6-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-6-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_014530_554967_FCE4A97F 
X-CRM114-Status: GOOD (  19.39  )
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

Dne nedelja, 16. februar 2025 ob 10:27:12 Srednjeevropski standardni =C4=8D=
as je Ryan Walklin napisal(a):
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> The Allwinner H616 has a display pipeline similar to other Allwinner
> devices, specifically the A10, but using a newer display engine
> revision (DE33).
>=20
> Not all output pins are exposed on all package variants, for example
> only the H700 and T507 have LCD pins exposed, but all variants support
> HDMI output. However on the die these are connected to a display engine
> via a TCON TOP and one or more timing controllers (TCONs).
>=20
> HDMI output support is not provided in this series (but will be in a
> subsequent patch) so for now note this within the relevant node to
> prevent a DT compiler error.
>=20
> Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
> timing controllers are compatible with the existing R40 driver.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/=
boot/dts/allwinner/sun50i-h616.dtsi
> index ab8b70ce7df89..242bac95840f8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> @@ -7,9 +7,12 @@
>  #include <dt-bindings/clock/sun50i-h616-ccu.h>
>  #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
>  #include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/sun8i-de2.h>
> +#include <dt-bindings/clock/sun8i-tcon-top.h>
>  #include <dt-bindings/reset/sun50i-h616-ccu.h>
>  #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/reset/sun8i-de2.h>
> =20
>  / {
>  	interrupt-parent =3D <&gic>;
> @@ -909,6 +912,136 @@ ohci3: usb@5311400 {
>  			status =3D "disabled";
>  		};
> =20
> +		tcon_top: tcon-top@6510000 {
> +			compatible =3D "allwinner,sun50i-h6-tcon-top";
> +			reg =3D <0x06510000 0x1000>;
> +			clocks =3D <&ccu CLK_BUS_TCON_TOP>,
> +				 <&ccu CLK_TCON_TV0>;
> +			clock-names =3D "bus", "tcon-tv0";
> +			clock-output-names =3D "tcon-top-tv0";
> +			#clock-cells =3D <0>;
> +			resets =3D <&ccu RST_BUS_TCON_TOP>;
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon_top_mixer0_in: port@0 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <0>;
> +
> +					tcon_top_mixer0_in_mixer0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&mixer0_out_tcon_top_mixer0>;
> +					};
> +				};
> +
> +				tcon_top_mixer0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +
> +					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&tcon_lcd0_in_tcon_top_mixer0>;
> +					};
> +
> +					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
> +						reg =3D <2>;
> +						remote-endpoint =3D <&tcon_tv0_in_tcon_top_mixer0>;
> +					};
> +				};
> +
> +				tcon_top_hdmi_in: port@4 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <4>;
> +
> +					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
> +						reg =3D <0>;
> +						remote-endpoint =3D <&tcon_tv0_out_tcon_top>;
> +					};
> +				};
> +
> +				tcon_top_hdmi_out: port@5 {
> +					reg =3D <5>;
> +
> +					tcon_top_hdmi_out_hdmi: endpoint {
> +						/* placeholder for HDMI  - remote-endpoint =3D <&hdmi_in_tcon_top>=
;*/
> +					};
> +				};
> +			};
> +		};
> +	=09
> +		tcon_lcd0: lcd-controller@6511000 {
> +			compatible =3D "allwinner,sun8i-r40-tcon-lcd";
> +			reg =3D <0x06511000 0x1000>;
> +			interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
> +			clock-names =3D "ahb", "tcon-ch0";
> +			clock-output-names =3D "tcon-data-clock";
> +			#clock-cells =3D <0>;
> +			resets =3D <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_TCON_LCD1>;
> +			reset-names =3D "lcd", "lvds";

That's not true, is it? LVDS should be LVDS reset. Check my WIP patch:
https://github.com/jernejsk/linux-1/commit/8b090dc866d4c4b5b0a1804da021a9f4=
4c67d5f1

It turns out that H616 clock driver missed LVDS reset, as it can be seen he=
re:
https://github.com/jernejsk/linux-1/commit/88bad1a59876f5d385bcd45a363784ed=
2beec6ae#diff-b340c978bcdbe240f7b99f4d0d96ea130a8acb1a5786a8efbb24d9e7a0b14=
e53R1084

I also commented on this series:
https://lore.kernel.org/linux-sunxi/20250213172248.158447-1-macroalpha82@gm=
ail.com/T/#t

Best regards,
Jernej

> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon_lcd0_in: port@0 {
> +					reg =3D <0>;
> +
> +					tcon_lcd0_in_tcon_top_mixer0: endpoint {
> +						remote-endpoint =3D <&tcon_top_mixer0_out_tcon_lcd0>;
> +					};
> +				};
> +
> +				tcon_lcd0_out: port@1 {
> +					reg =3D <1>;
> +				};
> +			};
> +		};
> +	=09
> +		tcon_tv0: lcd-controller@6515000 {
> +			compatible =3D "allwinner,sun50i-h6-tcon-tv",
> +				     "allwinner,sun8i-r40-tcon-tv";
> +			reg =3D <0x06515000 0x1000>;
> +			interrupts =3D <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&ccu CLK_BUS_TCON_TV0>,
> +				 <&tcon_top CLK_TCON_TOP_TV0>;
> +			clock-names =3D "ahb", "tcon-ch1";
> +			#clock-cells =3D <0>;
> +			resets =3D <&ccu RST_BUS_TCON_TV0>;
> +			reset-names =3D "lcd";
> +			status =3D "disabled";
> +
> +			ports {
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +
> +				tcon_tv0_in: port@0 {
> +					reg =3D <0>;
> +
> +					tcon_tv0_in_tcon_top_mixer0: endpoint {
> +						remote-endpoint =3D <&tcon_top_mixer0_out_tcon_tv0>;
> +					};
> +				};
> +
> +				tcon_tv0_out: port@1 {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +					reg =3D <1>;
> +
> +					tcon_tv0_out_tcon_top: endpoint@1 {
> +						reg =3D <1>;
> +						remote-endpoint =3D <&tcon_top_hdmi_in_tcon_tv0>;
> +					};
> +				};
> +			};
> +		};
> +
>  		rtc: rtc@7000000 {
>  			compatible =3D "allwinner,sun50i-h616-rtc";
>  			reg =3D <0x07000000 0x400>;
>=20





