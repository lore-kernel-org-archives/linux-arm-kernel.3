Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063B4C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 04:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQM7nDGryU7B7FarIwhtY8mXOeTFvenOK1t/A6Vy+lo=; b=1QPShVjMQjjO91
	XAiBQ4u768rudKy2gS4gixdAnDMPAN8DjgqXNkMQF8uc39QOuhUAxkDLF9R7sKE3Vtvn+PnxzlII4
	JKAfP70CDHaDtUGIDxc841w8Zqrq2M4AO5MdhrkbBvcOMSNzQSczfmMxkkKkr+sDfxtv3PIJW3iy2
	EyKTl4O3IDCQS8W4SwdujngezRjY/qp3v3TIl1W+YHxxFxXl+ymoaA6HyGhCpZ4V/ypKaSD/zjTuu
	+OMHHaZDHcssDiQl7xtaasgsFlaLtQ82gw40a9jFmqjrBjClX4jViM6++pY7PXDEtIDEarjxWgv4+
	XCgUjW6ZsCvFT/Cvl0kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6RR-00000001DvZ-2YCG;
	Mon, 30 Jun 2025 04:48:29 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6P7-00000001Dh5-2vFn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 04:46:06 +0000
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32add56e9ddso15762031fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 21:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751258763; x=1751863563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQM7nDGryU7B7FarIwhtY8mXOeTFvenOK1t/A6Vy+lo=;
        b=t5T1nOGDg8MVgIDx2tw38Z9t79nH7NHrKLICS/PlP/QJoqmihbldaneY4HHhDyCjwx
         zvC7LqZ4zUtUFvfrzx06WNRSS7AR2GNtjTvfpi0wD86Ig9izA80NhZiyf/GNrPCx/8pK
         C3IP5W+LBHAhaynYpE0lSfKIlbkdjV9aA1LrxGlLK6eKeKfAscbZyFoIntb3XfTDCQpa
         HkpDdIStKAn0ep/SswwJll31gHX0Vjn2EeSguZzYfzg4iHOIw9HDlveGXdcylWsMzPR8
         D5YXmEv3KEVvEZTdDYiIgYT+PciGBklJy53G9m9ewoBEZmkSthwaYgIoSrptAVxkA4Ep
         NpNg==
X-Forwarded-Encrypted: i=1; AJvYcCXx5MwTJOu7zi2TZzQa1c7Gk63DsIPP6forVhGVe6TLKTwqBmiXpdaQ/n4SH27oDN3usFtLO5njpnYxk7tR8dtA@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVwX4h2CeEZmA+2z0wRwcGoUrogBKPFXVhx7EHCbMSzlmfNCB
	yqwaASj/KyxTxQgL9yPgXReXOe2/vjN+8veBbvKij/BwcKv/V4elHrrgUKwkJTcB
X-Gm-Gg: ASbGncuQjqCtFphYvyWYmDaoyI80Mg/ge8eZ2zmhWKSiiQvHMfjOJSx2MEkP1mY7RQa
	vVR/f1qhDO2aqDiKB0wpYcSwKU6FAFqf74O6D336FFMPYdZhH+qTzxVlGxnffJVZCTn2cnrKakL
	rWtRZuChPGNlKilyjiDUxdkOad58plYmVUsRn0Yawz+hv29wSszwl1MxkKQFwz4ty7eEAZj4WNW
	oCk+bIXHSOsyXZv73lrbJ5J4/kxHa85oi+gWGHSQEiBQ5vtFJijfnNN/FrVZTyesXkQ2UbTfwbO
	MnfkapzpAqvpcU5xREBeT8xNnmuxjiPE2xvLw7yZ/DzjTLFJKzvtMVxFhMyvmFJlTvO+8f1ZUA4
	XWZL6n32sHZOd6bMODXI=
X-Google-Smtp-Source: AGHT+IGp/m+rdLpsxceUay6I6abWWZ6ifDdkyuth5cZo0omsZ6Ky5NT+0AbdiUYXHTICBbYpbxOUCA==
X-Received: by 2002:a2e:7c14:0:b0:32a:666e:9f14 with SMTP id 38308e7fff4ca-32cdc4cae76mr26645091fa.19.1751258762732;
        Sun, 29 Jun 2025 21:46:02 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2eebe81sm11759321fa.83.2025.06.29.21.46.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 21:46:02 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32add56e9ddso15761791fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 21:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvZowfvzPQCrHi5viIdpQfJf89UirXFFL8K1w0QHCc9FfxoZ+Z2H1SriEiNZozmoLJai7En3AXb/NjttMxlBqV@lists.infradead.org
X-Received: by 2002:a05:6512:401d:b0:553:297b:3d4e with SMTP id
 2adb3069b0e04-5550b8db1dbmr4122373e87.52.1751258762118; Sun, 29 Jun 2025
 21:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250411003827.782544-1-iuncuim@gmail.com> <20250411003827.782544-6-iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-6-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 30 Jun 2025 12:45:50 +0800
X-Gmail-Original-Message-ID: <CAGb2v67kxeF86iHJ3GsOVJT8FOyeM37D1Vdf1Kpdcb64jns_ng@mail.gmail.com>
X-Gm-Features: Ac12FXxCbl4LCury_E8IWa8MmYXdlGFWiz9aT6U77XKyQePtnslVgYEzqe88Heg
Message-ID: <CAGb2v67kxeF86iHJ3GsOVJT8FOyeM37D1Vdf1Kpdcb64jns_ng@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: allwinner: A523: Add thermal sensors and zones
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_214605_743920_9C71B9F4 
X-CRM114-Status: GOOD (  20.71  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Apr 11, 2025 at 8:40=E2=80=AFAM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The A523 processor has two temperature controllers, THS0 and THS1.
> THS0 has only one temperature sensor, which is located in the DRAM.
>
> THS1 does have 3 sensors:
> ths1_0 - "big" cores
> ths1_1 - "little" cores
> ths1_2 - gpu
>
> Add the thermal sensor configuration and the thermal zones
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index d626612bb..4f36032b2 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-ccu.h>
>  #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  / {
>         interrupt-parent =3D <&gic>;
> @@ -22,6 +23,7 @@ cpu0: cpu@0 {
>                         device_type =3D "cpu";
>                         reg =3D <0x000>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu1: cpu@100 {
> @@ -29,6 +31,7 @@ cpu1: cpu@100 {
>                         device_type =3D "cpu";
>                         reg =3D <0x100>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu2: cpu@200 {
> @@ -36,6 +39,7 @@ cpu2: cpu@200 {
>                         device_type =3D "cpu";
>                         reg =3D <0x200>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu3: cpu@300 {
> @@ -43,6 +47,7 @@ cpu3: cpu@300 {
>                         device_type =3D "cpu";
>                         reg =3D <0x300>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu4: cpu@400 {
> @@ -50,6 +55,7 @@ cpu4: cpu@400 {
>                         device_type =3D "cpu";
>                         reg =3D <0x400>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu5: cpu@500 {
> @@ -57,6 +63,7 @@ cpu5: cpu@500 {
>                         device_type =3D "cpu";
>                         reg =3D <0x500>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu6: cpu@600 {
> @@ -64,6 +71,7 @@ cpu6: cpu@600 {
>                         device_type =3D "cpu";
>                         reg =3D <0x600>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>
>                 cpu7: cpu@700 {
> @@ -71,6 +79,7 @@ cpu7: cpu@700 {
>                         device_type =3D "cpu";
>                         reg =3D <0x700>;
>                         enable-method =3D "psci";
> +                       #cooling-cells =3D <2>;
>                 };
>         };
>
> @@ -171,11 +180,39 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               ths1: thermal-sensor@2009400 {
> +                       compatible =3D "allwinner,sun55i-a523-ths1";
> +                       reg =3D <0x02009400 0x400>;
> +                       interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
> +                       clock-names =3D "bus", "gpadc";
> +                       resets =3D <&ccu RST_BUS_THS>;
> +                       nvmem-cells =3D <&ths_calibration>;
> +                       nvmem-cell-names =3D "calibration";
> +                       #thermal-sensor-cells =3D <1>;
> +               };
> +
> +               ths0: thermal-sensor@200a000 {
> +                       compatible =3D "allwinner,sun55i-a523-ths0";
> +                       reg =3D <0x0200a000 0x400>;
> +                       interrupts =3D <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC0>;
> +                       clock-names =3D "bus", "gpadc";
> +                       resets =3D <&ccu RST_BUS_THS>;
> +                       nvmem-cells =3D <&ths_calibration>;
> +                       nvmem-cell-names =3D "calibration";
> +                       #thermal-sensor-cells =3D <0>;
> +               };
> +
>                 sid: efuse@3006000 {
>                         compatible =3D "allwinner,sun50i-a523-sid", "allw=
inner,sun50i-a64-sid";
>                         reg =3D <0x03006000 0x1000>;
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> +
> +                       ths_calibration: thermal-sensor-calibration@38 {
> +                               reg =3D <0x38 0x14>;

Including unrelated bits is probably not correct. Instead I think it should
be two cells. The thermal driver then has to stitch them together or someth=
ing.

> +                       };
>                 };
>
>                 mmc0: mmc@4020000 {
> @@ -602,4 +639,105 @@ rtc: rtc@7090000 {
>                         #clock-cells =3D <1>;
>                 };
>         };
> +
> +       thermal-zones {
> +               cpu0_thermal: cpu0-thermal {
> +                       polling-delay-passive =3D <500>;
> +                       polling-delay =3D <1000>;
> +                       thermal-sensors =3D <&ths1 1>;
> +                       sustainable-power =3D <1200>;

Please describe in the commit log how the sustainable power values were
derived or sourced.

> +
> +                       trips {
> +                               cpu0_threshold: cpu-trip-0 {
> +                                       temperature =3D <70000>;
> +                                       type =3D "passive";
> +                                       hysteresis =3D <0>;
> +                               };
> +                               cpu0_target: cpu-trip-1 {
> +                                       temperature =3D <90000>;
> +                                       type =3D "passive";
> +                                       hysteresis =3D <0>;
> +                               };
> +                               cpu0_critical: cpu-trip-2 {
> +                                       temperature =3D <110000>;
> +                                       type =3D "critical";
> +                                       hysteresis =3D <0>;
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip =3D <&cpu0_target>;
> +                                       cooling-device =3D <&cpu0 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu1 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu2 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu3 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +
> +               cpu4_thermal: cpu4-thermal {
> +                       polling-delay-passive =3D <500>;
> +                       polling-delay =3D <1000>;
> +                       thermal-sensors =3D <&ths1 0>;
> +                       sustainable-power =3D <1600>;
> +
> +                       trips {
> +                               cpu4_threshold: cpu-trip-0 {
> +                                       temperature =3D <70000>;
> +                                       type =3D "passive";
> +                                       hysteresis =3D <0>;
> +                               };
> +                               cpu4_target: cpu-trip-1 {
> +                                       temperature =3D <90000>;
> +                                       type =3D "passive";
> +                                       hysteresis =3D <0>;
> +                               };
> +                               cpu4_critical: cpu-trip-2 {
> +                                       temperature =3D <110000>;
> +                                       type =3D "critical";
> +                                       hysteresis =3D <0>;
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip =3D <&cpu4_target>;
> +                                       cooling-device =3D <&cpu4 THERMAL=
_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu5 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu6 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>,
> +                                                        <&cpu7 THERMAL_N=
O_LIMIT THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +
> +               gpu-thermal {
> +                       polling-delay-passive =3D <500>;
> +                       polling-delay =3D <1000>;
> +                       thermal-sensors =3D <&ths1 2>;
> +                       sustainable-power =3D <2400>;
> +
> +                       trips {

We could have passive trip points here as well so thermal throttling of
the GPU could work.


ChenYu

> +                               gpu_temp_critical: gpu-trip-0 {
> +                                       temperature =3D <110000>;
> +                                       type =3D "critical";
> +                                       hysteresis =3D <0>;
> +                               };
> +                       };
> +               };
> +
> +               ddr-thermal {
> +                       polling-delay-passive =3D <0>;
> +                       polling-delay =3D <0>;
> +                       thermal-sensors =3D <&ths0>;
> +
> +                       trips {
> +                               ddr_temp_critical: ddr-trip-0 {
> +                                       temperature =3D <110000>;
> +                                       type =3D "critical";
> +                                       hysteresis =3D <0>;
> +                               };
> +                       };
> +               };
> +       };
>  };
> --
> 2.49.0
>

