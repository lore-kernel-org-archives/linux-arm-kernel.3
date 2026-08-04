Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F287FC55838
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=; b=j5Ea0uL4fJzYXNR+/5G4oDEVDc
	NmOuYPiUUNrYDpNsJIjr4g5Lkzk41iTomHafAWiy9U3muyaAL9ryKcVRMRnmRVVHruYLw9BiWNI6A
	PMo02TSptxwi8F7fvnsXv/mhWcIjwM73zYeLwGm/L38vVLMcp2amIEDfd6QutwqywTOr7Pgz4zZtZ
	lkDrWGJku8a2LkY7Ixrb2n4/6b+u2ldx/eNjo8+iY2uXBT6mT5eth2iz0W2H5Ab0MSEkC1e1fIx8x
	+6/0rzR9ybfcJwEI92GFWWO5tNZmHhGIyiVgTwr8lYFPDEhHDOd1Of8s1Bqn1VG96yMr1Ka6tQofK
	4m82VYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDzH-00000001mEe-44nk;
	Tue, 04 Aug 2026 12:11:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDzE-00000001mEC-2yOq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:11:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-69fc2261f2bso7266916a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845471; cv=none;
        d=google.com; s=arc-20260327;
        b=Un6ZWEpvjTJ0Roa/vgIjMN9VMp9hHfSh7J1XBDBdlBfdcqARdkTeKDm1DUuGvTYfKC
         wkjACkgOMwK+P0bON0otSrXjXsbTgboKbdb99NJph8XAAJRCJ+8gIdCl+6FM1h8qd/dm
         cnhIaBct7RZmuI+35FvSdqJc8F2I6p1uW0OTDRPlezHAtrTi9nY3VVOc3v7gPluzAEWU
         8/JHrJ7YDfmTEay0GpZYD0T6ioUIZKHEn41tUqFvNy6EbUcxbLYCwTgrzfOaHwdTBhSs
         btdenzQXuoj4PwQs98xw6iZMAeYUtIHAJcD1XnWCPlFjjvrXFY6OdvmDn/m2hu0FAu66
         5SZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=;
        fh=5jH0OExo74uHwIdPPHjE7LAzhd+2A6jYYNKYIMOA96o=;
        b=N3cMpTEXbW/ClG/qRxxJ7jgwYOVtMf9I8fvQ11KRjgI1nC6vjAUWjLMwfdYK41jls3
         4Z7BZHaeayW1KvwGaoN+fHbe8J1bnEm8EQKqm64ii1UFF2c3wxo5SPkup84SIsFhQ4mh
         FuokBUJMMGfKPdlFuftSwbzR8+h/fnYN4zZTCyrT/YSrgRh4nfb48FjUAFqmdLxKvIt4
         GXjI2jSP9yrpBFnCIwko7UnIitjtBvERwIBYMiaDbLf6ixiL2j5a3HqrhJL15R4+0vA/
         UwHH5ziUAYkRn8n4CD5UJ0DbVZdTx3IwMVtZhhIo9uS20UmyLcWJ7N2r6PfKiv0FNt+X
         uAKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845471; x=1786450271; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=;
        b=rTfu6bWxmwT77yXATaoHH3rtqMD5EMZSIR6TiIwnLW3QTVDzXXx7ikjo8nNiOPMbzO
         ekZWSSrsP0rlFez8TvBUIaiCw+PrQdMQ1ppkM9Gg50cZ8PiTI9LGtAPohsNiEG3YBb9K
         yXcIP2melsAejqlXI5xuAfP+6udDvfZkB0M1DvXOBVqF0jeHhM4Xdd0W67KuOZ/xc9YA
         L9tTzXJTpxh8P1WjszXBbiMk9BXNDf7/5mHIbqwarO8nmsr2cov8Ekl52QBTmbJezzHA
         QCojRP/04PKlikVs+fjzsZr9Mmki0Fa1AJW25R0X63VxxkGV0RaGVPQn8QiFWm21hL1B
         3jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845471; x=1786450271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vsb3Aci/GG0JEhBuZG8dTyz17+bE8CWDjlzeaMl85XE=;
        b=IE8JXKZImZzGEjiP0rLX4f/1R+5ujw8bHUE2gSfSp3X7jkTlK60d425dJ53ZrUypk9
         baLRN8v4n2asB+sZ0drVrqnWLXCjuBkXLovU6+0uJCGN/ODtDrOqyTDPEDR/4rZO27qn
         CzwRDAgdL9v5am+cBEVfrb5iFsvcdDhWrPpMomM6reFEJmBI4j7Iaxc+oevcLuBYoQHn
         2++TnFZzXJS+Ui7C/hBQU4rj8SceQq7JLouhzDl1TfKB0JDh27FfJLKmhQRilLkxhmIH
         84wRG2scyNMOPcBOZ9Afxd3Gp71ca/hPLdsQoAQe0/PCsipWB+Mac7uBVOxS0HZ7hEMU
         KZbg==
X-Forwarded-Encrypted: i=1; AHgh+RrJJdjjfmq3riBz8D/3oNBhMoNcRNpxxPxCndv+BMWsINIwqGjk5M+1LjYFyK5uJ0nWFmvfr/FfyV0YWV4BuXKG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7xKgLjTmWSsP8kS/HwVNrPh8gnDpqtWcCkpA5qBjz034DSC8e
	p7beIXlPZ7fmol2GhXGzjefnWOrH7eZQerotaxwGVjXOBbWITGYArDH2EL9TB0rx2KsQq0j97s7
	ZgzaNu4ArOSvUzRTLwQMLEquQXDgkuvOlVQ0P7zRdnw==
X-Gm-Gg: AR+sD11Z8K/6d8xqLoiiK/wyXfD5ld+3aVGvAFWzrbtAycAUssJtVqX6aaa8JaV3o3K
	MLy0gke4hlLLM1jRmuAqCu8hBcBX72FZe6mcARsob8efgRf4FGvOCVzxVJQpYsEc2fHiiy3uqtP
	oqxyQfGyjRJlDvQdd8t4yET8wa7j3R8j1bWdb7icY7KLtA1azMpTXeh0Y9DGQV99tIzifb9mz0c
	Dq7BlmHpuSue0CYDUUXzuIo3hii1LMDt4Ba3F1XGJ8DcTtdTFqMfmUmYwMpD5hBZcU/E2cWYnTb
	ughxXm5CNwitmLu+ICNzILcVh+wCS7iaRSB5Lheu1Yr4bj+ZgkSuiq1brtvSVEmWAThSVeYR3xi
	ooUOC
X-Received: by 2002:a05:6402:42c5:b0:698:5f47:1d41 with SMTP id
 4fb4d7f45d1cf-6a0a7cc81e9mr11814433a12.14.1785845470442; Tue, 04 Aug 2026
 05:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-5-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-5-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:10:58 +0100
X-Gm-Features: AUfX_my5weg2jT-uccSdiEFc7BxP_O2P68CgoTH8rcU0z9Km9jZ7ROsAlTYjpo8
Message-ID: <CADrjBPp_m=XSn1rMTbXbRtdCQec8dh8kFnESBHtszs1wvd3TKg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: google: Move 'status' to the end to
 match coding style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_051112_960975_707C0F63 
X-CRM114-Status: GOOD (  19.61  )
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

On Sat, 1 Aug 2026 at 16:07, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> 'status' property is special, thus DTS coding style expects it to be
> always the last property preceded with a blank line, as reported by
> dt-check-style:
>
>   [required-blank-lines] "status" must be preceded by a blank line
>   [property-order] property 'vcc-supply' out of canonical order (should s=
ort before 'status')
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  2 +
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 12 +++-
>  arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  2 +
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 70 ++++++++++++++++=
++++++
>  4 files changed, 85 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/ar=
m64/boot/dts/exynos/google/gs101-oriole.dts
> index 36721adcaa23..c5a3958c2320 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -39,6 +39,7 @@ ldo31m {
>
>  &cont_splash_mem {
>         reg =3D <0x0 0xfac00000 (1080 * 2400 * 4)>;
> +
>         status =3D "okay";
>  };
>
> @@ -47,5 +48,6 @@ &framebuffer0 {
>         height =3D <2400>;
>         stride =3D <(1080 * 4)>;
>         format =3D "a8r8g8b8";
> +
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/=
arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index 5227cd4e314b..a12f2b88d72d 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -32,6 +32,7 @@ framebuffer0: framebuffer-0 {
>                         vci-supply =3D <&s2mpg10_ldo22m>;
>                         vddi-supply =3D <&s2mpg11_bucka>;
>                         /* format properties to be added by actual board =
*/
> +
>                         status =3D "disabled";
>                 };
>         };
> @@ -98,6 +99,7 @@ cont_splash_mem: splash@fac00000 {
>                         /* size to be updated by actual board */
>                         reg =3D <0x0 0xfac00000 0x0>;
>                         no-map;
> +
>                         status =3D "disabled";
>                 };
>         };
> @@ -856,8 +858,9 @@ &serial_0 {
>  };
>
>  &ufs_0 {
> -       status =3D "okay";
>         vcc-supply =3D <&ufs_0_fixed_vcc_reg>;
> +
> +       status =3D "okay";
>  };
>
>  &ufs_0_phy {
> @@ -867,6 +870,7 @@ &ufs_0_phy {
>  &usbdrd31 {
>         vdd10-supply =3D <&reg_placeholder>;
>         vdd33-supply =3D <&reg_placeholder>;
> +
>         status =3D "okay";
>  };
>
> @@ -875,6 +879,7 @@ &usbdrd31_dwc3 {
>         usb-role-switch;
>         role-switch-default-mode =3D "peripheral";
>         maximum-speed =3D "super-speed-plus";
> +
>         status =3D "okay";
>
>         port {
> @@ -893,6 +898,7 @@ &usbdrd31_phy {
>         vdd33-usb20-supply =3D <&reg_placeholder>;
>         vdda-usbdp-supply =3D <&reg_placeholder>;
>         vddh-usbdp-supply =3D <&reg_placeholder>;
> +
>         status =3D "okay";
>
>         port {
> @@ -904,20 +910,24 @@ usbdrd31_phy_orien_switch: endpoint {
>
>  &usi_uart {
>         samsung,clkreq-on; /* needed for UART mode */
> +
>         status =3D "okay";
>  };
>
>  &usi8 {
>         samsung,mode =3D <USI_MODE_I2C>;
> +
>         status =3D "okay";
>  };
>
>  &usi12 {
>         samsung,mode =3D <USI_MODE_I2C>;
> +
>         status =3D "okay";
>  };
>
>  &watchdog_cl0 {
>         timeout-sec =3D <30>;
> +
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm=
64/boot/dts/exynos/google/gs101-raven.dts
> index a422542715f2..7c4273796a22 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
> @@ -35,6 +35,7 @@ ldo14s {
>
>  &cont_splash_mem {
>         reg =3D <0x0 0xfac00000 (1440 * 3120 * 4)>;
> +
>         status =3D "okay";
>  };
>
> @@ -43,5 +44,6 @@ &framebuffer0 {
>         height =3D <3120>;
>         stride =3D <(1440 * 4)>;
>         format =3D "a8r8g8b8";
> +
>         status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 86933f22647b..edc38f2d1183 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -624,6 +624,7 @@ watchdog_cl0: watchdog@10060000 {
>                         interrupts =3D <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
>                         samsung,cluster-index =3D <0>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -636,6 +637,7 @@ watchdog_cl1: watchdog@10070000 {
>                         interrupts =3D <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         samsung,syscon-phandle =3D <&pmu_system_controlle=
r>;
>                         samsung,cluster-index =3D <1>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -707,6 +709,7 @@ usi1: usi@109000c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_0>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1000>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_1: i2c@10900000 {
> @@ -721,6 +724,7 @@ hsi2c_1: i2c@10900000 {
>                                 interrupts =3D <GIC_SPI 635 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c1_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -734,6 +738,7 @@ serial_1: serial@10900000 {
>                                 pinctrl-0 =3D <&uart1_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -748,6 +753,7 @@ spi_1: spi@10900000 {
>                                 interrupts =3D <GIC_SPI 635 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi1_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -762,6 +768,7 @@ usi2: usi@109100c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_1>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1004>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_2: i2c@10910000 {
> @@ -776,6 +783,7 @@ hsi2c_2: i2c@10910000 {
>                                 interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c2_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -789,6 +797,7 @@ serial_2: serial@10910000 {
>                                 pinctrl-0 =3D <&uart2_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -803,6 +812,7 @@ spi_2: spi@10910000 {
>                                 interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi2_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -817,6 +827,7 @@ usi3: usi@109200c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_2>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1008>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_3: i2c@10920000 {
> @@ -831,6 +842,7 @@ hsi2c_3: i2c@10920000 {
>                                 interrupts =3D <GIC_SPI 637 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c3_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -844,6 +856,7 @@ serial_3: serial@10920000 {
>                                 pinctrl-0 =3D <&uart3_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -858,6 +871,7 @@ spi_3: spi@10920000 {
>                                 interrupts =3D <GIC_SPI 637 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi3_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -872,6 +886,7 @@ usi4: usi@109300c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_3>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x100c>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_4: i2c@10930000 {
> @@ -886,6 +901,7 @@ hsi2c_4: i2c@10930000 {
>                                 interrupts =3D <GIC_SPI 638 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c4_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -899,6 +915,7 @@ serial_4: serial@10930000 {
>                                 pinctrl-0 =3D <&uart4_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -913,6 +930,7 @@ spi_4: spi@10930000 {
>                                 interrupts =3D <GIC_SPI 638 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi4_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -927,6 +945,7 @@ usi5: usi@109400c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_4>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1010>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_5: i2c@10940000 {
> @@ -941,6 +960,7 @@ hsi2c_5: i2c@10940000 {
>                                 interrupts =3D <GIC_SPI 639 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c5_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -954,6 +974,7 @@ serial_5: serial@10940000 {
>                                 pinctrl-0 =3D <&uart5_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -968,6 +989,7 @@ spi_5: spi@10940000 {
>                                 interrupts =3D <GIC_SPI 639 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi5_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -982,6 +1004,7 @@ usi6: usi@109500c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_5>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1014>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_6: i2c@10950000 {
> @@ -996,6 +1019,7 @@ hsi2c_6: i2c@10950000 {
>                                 interrupts =3D <GIC_SPI 640 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c6_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1009,6 +1033,7 @@ serial_6: serial@10950000 {
>                                 pinctrl-0 =3D <&uart6_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1023,6 +1048,7 @@ spi_6: spi@10950000 {
>                                 interrupts =3D <GIC_SPI 640 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi6_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1037,6 +1063,7 @@ usi7: usi@109600c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_6>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1018>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_7: i2c@10960000 {
> @@ -1051,6 +1078,7 @@ hsi2c_7: i2c@10960000 {
>                                 interrupts =3D <GIC_SPI 641 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c7_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1064,6 +1092,7 @@ serial_7: serial@10960000 {
>                                 pinctrl-0 =3D <&uart7_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1078,6 +1107,7 @@ spi_7: spi@10960000 {
>                                 interrupts =3D <GIC_SPI 641 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi7_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1092,6 +1122,7 @@ usi8: usi@109700c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0=
_IPCLK_7>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x101c>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_8: i2c@10970000 {
> @@ -1106,6 +1137,7 @@ hsi2c_8: i2c@10970000 {
>                                 interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c8_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1119,6 +1151,7 @@ serial_8: serial@10970000 {
>                                 pinctrl-0 =3D <&uart8_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1133,6 +1166,7 @@ spi_8: spi@10970000 {
>                                 interrupts =3D <GIC_SPI 642 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi8_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1148,6 +1182,7 @@ usi_uart: usi@10a000c0 {
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1020>;
>                         samsung,mode =3D <USI_MODE_UART>;
> +
>                         status =3D "disabled";
>
>                         serial_0: serial@10a00000 {
> @@ -1160,6 +1195,7 @@ serial_0: serial@10a00000 {
>                                 pinctrl-0 =3D <&uart0_bus>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <256>;
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1174,6 +1210,7 @@ usi14: usi@10a200c0 {
>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1=
_IPCLK_2>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric0 0x1028>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_14: i2c@10a20000 {
> @@ -1188,6 +1225,7 @@ hsi2c_14: i2c@10a20000 {
>                                 interrupts =3D <GIC_SPI 643 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c14_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1201,6 +1239,7 @@ serial_14: serial@10a20000 {
>                                 pinctrl-0 =3D <&uart14_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1215,6 +1254,7 @@ spi_14: spi@10a20000 {
>                                 interrupts =3D <GIC_SPI 643 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi14_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1254,6 +1294,7 @@ usi0: usi@10d100c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_1>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1000>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_0: i2c@10d10000 {
> @@ -1268,6 +1309,7 @@ hsi2c_0: i2c@10d10000 {
>                                 interrupts =3D <GIC_SPI 651 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c0_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1281,6 +1323,7 @@ serial_usi0: serial@10d10000 {
>                                 pinctrl-0 =3D <&uart0_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1295,6 +1338,7 @@ spi_0: spi@10d10000 {
>                                 interrupts =3D <GIC_SPI 651 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi0_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1309,6 +1353,7 @@ usi9: usi@10d200c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_2>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1004>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_9: i2c@10d20000 {
> @@ -1323,6 +1368,7 @@ hsi2c_9: i2c@10d20000 {
>                                 interrupts =3D <GIC_SPI 652 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c9_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1336,6 +1382,7 @@ serial_9: serial@10d20000 {
>                                 pinctrl-0 =3D <&uart9_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1350,6 +1397,7 @@ spi_9: spi@10d20000 {
>                                 interrupts =3D <GIC_SPI 652 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi9_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1364,6 +1412,7 @@ usi10: usi@10d300c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_3>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1008>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_10: i2c@10d30000 {
> @@ -1378,6 +1427,7 @@ hsi2c_10: i2c@10d30000 {
>                                 interrupts =3D <GIC_SPI 653 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c10_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1391,6 +1441,7 @@ serial_10: serial@10d30000 {
>                                 pinctrl-0 =3D <&uart10_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1405,6 +1456,7 @@ spi_10: spi@10d30000 {
>                                 interrupts =3D <GIC_SPI 653 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi10_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1419,6 +1471,7 @@ usi11: usi@10d400c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_4>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x100c>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_11: i2c@10d40000 {
> @@ -1433,6 +1486,7 @@ hsi2c_11: i2c@10d40000 {
>                                 interrupts =3D <GIC_SPI 654 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c11_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1446,6 +1500,7 @@ serial_11: serial@10d40000 {
>                                 pinctrl-0 =3D <&uart11_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1460,6 +1515,7 @@ spi_11: spi@10d40000 {
>                                 interrupts =3D <GIC_SPI 654 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi11_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1474,6 +1530,7 @@ usi12: usi@10d500c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_5>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1010>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_12: i2c@10d50000 {
> @@ -1488,6 +1545,7 @@ hsi2c_12: i2c@10d50000 {
>                                 interrupts =3D <GIC_SPI 655 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c12_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1501,6 +1559,7 @@ serial_12: serial@10d50000 {
>                                 pinctrl-0 =3D <&uart12_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1515,6 +1574,7 @@ spi_12: spi@10d50000 {
>                                 interrupts =3D <GIC_SPI 655 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi12_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1529,6 +1589,7 @@ usi13: usi@10d600c0 {
>                                  <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0=
_IPCLK_6>;
>                         clock-names =3D "pclk", "ipclk";
>                         samsung,sysreg =3D <&sysreg_peric1 0x1014>;
> +
>                         status =3D "disabled";
>
>                         hsi2c_13: i2c@10d60000 {
> @@ -1543,6 +1604,7 @@ hsi2c_13: i2c@10d60000 {
>                                 interrupts =3D <GIC_SPI 656 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&hsi2c13_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1556,6 +1618,7 @@ serial_13: serial@10d60000 {
>                                 pinctrl-0 =3D <&uart13_bus_single>;
>                                 pinctrl-names =3D "default";
>                                 samsung,uart-fifosize =3D <64>;
> +
>                                 status =3D "disabled";
>                         };
>
> @@ -1570,6 +1633,7 @@ spi_13: spi@10d60000 {
>                                 interrupts =3D <GIC_SPI 656 IRQ_TYPE_LEVE=
L_HIGH 0>;
>                                 pinctrl-0 =3D <&spi13_bus>;
>                                 pinctrl-names =3D "default";
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1609,6 +1673,7 @@ usbdrd31_phy: phy@11100000 {
>                         clock-names =3D "phy", "ref", "ctrl_aclk", "ctrl_=
pclk", "scl_pclk";
>                         #phy-cells =3D <1>;
>                         samsung,pmu-syscon =3D <&pmu_system_controller>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1622,6 +1687,7 @@ usbdrd31: usb@11110000 {
>                         clock-names =3D "bus_early", "susp_clk", "link_ac=
lk", "link_pclk";
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
> +
>                         status =3D "disabled";
>
>                         usbdrd31_dwc3: usb@0 {
> @@ -1635,6 +1701,7 @@ usbdrd31_dwc3: usb@0 {
>                                 snps,has-lpm-erratum;
>                                 snps,dis_u2_susphy_quirk;
>                                 snps,dis_u3_susphy_quirk;
> +
>                                 status =3D "disabled";
>                         };
>                 };
> @@ -1698,6 +1765,7 @@ ufs_0: ufs@14700000 {
>                         phys =3D <&ufs_0_phy>;
>                         phy-names =3D "ufs-phy";
>                         samsung,sysreg =3D <&sysreg_hsi2 0x710>;
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1709,6 +1777,7 @@ ufs_0_phy: phy@14704000 {
>                         #phy-cells =3D <0>;
>                         clocks =3D <&ext_24_5m>;
>                         clock-names =3D "ref_clk";
> +
>                         status =3D "disabled";
>                 };
>
> @@ -1812,6 +1881,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
>                         /* TODO: update once support for this CMU exists =
*/
>                         clocks =3D <0>;
>                         clock-names =3D "pclk";
> +
>                         status =3D "disabled";
>                 };
>
>
> --
> 2.53.0
>

