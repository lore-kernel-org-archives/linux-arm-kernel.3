Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85120C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 21:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqytGXi5W+0oM2gaVZGROmPugYrBG6LtgSr2NAWPIkU=; b=hiNvd/I+NNBg8KgfuJiH8kWdMJ
	NhI+jEiNzyZsTv4ddnZjuIU6vQjAzWyTKIhK5UgetgJvlbpxc6L84tb7JAby+dooxl9CcnaNcwrXM
	s/qSyK0sAeKRkQd5vZRacHP1AtsG04P9CCIn+gCjBMlbDTBIUA/vZ0wAGKWVx74qI6yv4HfqtUiBu
	RjGcAejMpwTYylhIRaMwhugfGZH7i5NXf3pgIdJIoz/4zlvA68n7W+uhtnQ66ha045X6vbBECAnSt
	lGAxGq2ML332w1OtzbU1dQdpfGWQE7GCgmZNxNP52ag1vOcujYvp3npgbJzssUy7pRIGikPgYq4lp
	cEsghiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhx9s-00000006oft-2f4i;
	Fri, 01 Aug 2025 21:19:20 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhx7I-00000006oTw-0c4N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 21:16:41 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e8bbb02b887so2003148276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 14:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754082999; x=1754687799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqytGXi5W+0oM2gaVZGROmPugYrBG6LtgSr2NAWPIkU=;
        b=uJQ3M1SSXgH3OUg/Sr/G0NSHaNWWP8mxKFXpbAHf7FrbgLkK2yOpQgmLnkYno3fFsC
         duSzKz/egSbtlZxQlxUl8VLHqyt7cHEwd00ibGi/LQPBwfcyx4enlTwaaWDDKxKy0DAD
         6QhwlYtx6hmSm3SWOXkhg/R8+JG8I7i4w6ebEivkAqKbK9oI9xcQuOLvJ0jEz68JPFHq
         hblD6I7yF22lBCIrQOUVgFbIkwp7EY5DoWfNtvOeHRddP1+IeGQ4X8yke4fdFC5mC2Jd
         KdfJr3i8gFVznHmHn1at1QXIQBVc6RGEWr3Z0KLEr5/JCumh0PHptzsJcrnAnyWUqPay
         wjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754082999; x=1754687799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqytGXi5W+0oM2gaVZGROmPugYrBG6LtgSr2NAWPIkU=;
        b=GgVeE9v5Ixe1W+OudlMbyV1k9MV7p+z9xwL1JyAJqf/V1MM3MfrWfHCuqeWh2zdF9s
         Bn62i1EGkO9P7e/+KEUfGkFN/Ft2f9LXJmeLbWi03vLxMqrnFUOJvTlMu+FHQE6h5B9U
         Ue7PqrsXFcZZvSPJ7kwlLMSm5t7SovV3e6S1udfcXEqirnwEEcNV7xP2H5FNdZk46q5w
         gWIK5W+M5LH5QH5XwGVAsfoSe5jdLvoZjCdMtcYLQP8GrZBULU0dUpUAmaT8duKfzdCm
         FfyBtsfwU6r43rtVVxzLqjAuKG5SmQlN58VGAKszbcWwhPCRhwDWJM66Asot/icsNRwk
         Aqeg==
X-Forwarded-Encrypted: i=1; AJvYcCXBgnd/MgKT3rbDGVjG6/4SE1f2vAU/db3hwD2+ZY+PCK5sHgnk6FBv6eKIXF0NpYBNXMV5QWuu49+DPol+gzJF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/2b9lbf95+/Agg0w4Ye72AJTOAmcohTyo95tle/HW6xlFBgQi
	Vsvn5nuM9zW4N1ceSiTruefVozas84JIDZ/9I6vL+2xL7jPz/D14n1fwVfPHdnGXl+Wawmpo611
	eVhLFh39lLag6+4KmYSBLIfI6KGkLu0wX0TGl0p/CIC/Tzlk8nVZlv9o=
X-Gm-Gg: ASbGnctcMn9blTxIIVJW6+XMMXKIpMxgxIUgJN2kAAvdcj1TQerBYshkWJlhsEwZVeC
	VUUy1/QB/EwWe6KXJVSrqfeiDc1/1SFCUXLOMZXQMEJ6kRS825Rz7kh6tq69vzKIHJuWGNURHfY
	bZ+NyvyRbvBBzsG6b4DnJzobt0J+KzlAdKF5QDWTnyyx8v/dLln/MAsewhgFsK1uUWG3acES/66
	seYwQ==
X-Google-Smtp-Source: AGHT+IHHaG/CRQsgr7p3Tfo0TOmissc2XOtsczFCXIZQMTy/37MHX8ykJpsP195uACiVjXZcG5lM7NxM/YllXNG+MPA=
X-Received: by 2002:a05:690c:d92:b0:710:f46d:cec3 with SMTP id
 00721157ae682-71b7f5bc0cemr14721927b3.5.1754082998934; Fri, 01 Aug 2025
 14:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com> <20250730074253.1884111-3-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250730074253.1884111-3-ivo.ivanov.ivanov1@gmail.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Aug 2025 16:16:25 -0500
X-Gm-Features: Ac12FXwMiWZ8AseZWaIlhH5Rvp_XOCb061jYqpt1d42-G4p8qP_4Vml5fYl6nvg
Message-ID: <CAPLW+4nONOm+86vfPNMbTVFUGT7mo5qnefs=S3kSn0R8EEqpRg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] arm64: dts: exynos2200: use 32-bit address space
 for /soc
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_141640_216149_5BE87936 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, Jul 30, 2025 at 2:43=E2=80=AFAM Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> All peripherals on this SoC are mapped under the 32-bit address space
> (0x0 -> 0x20000000), so enforce that.
>
> Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>
> ---
> This was suggested at [1].
>
> [1] https://lore.kernel.org/all/CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq=
5UyVbks+-w@mail.gmail.com
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos2200.dtsi | 72 +++++++++++-----------
>  1 file changed, 36 insertions(+), 36 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot=
/dts/exynos/exynos2200.dtsi
> index 6b5ac02d0..943e83851 100644
> --- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
> @@ -221,22 +221,22 @@ psci {
>                 method =3D "smc";
>         };
>
> -       soc {
> +       soc@0 {
>                 compatible =3D "simple-bus";
> -               ranges;
> +               ranges =3D <0x0 0x0 0x0 0x20000000>;
>
> -               #address-cells =3D <2>;
> -               #size-cells =3D <2>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
>
>                 chipid@10000000 {
>                         compatible =3D "samsung,exynos2200-chipid",
>                                      "samsung,exynos850-chipid";
> -                       reg =3D <0x0 0x10000000 0x0 0x24>;
> +                       reg =3D <0x10000000 0x24>;
>                 };
>
>                 cmu_peris: clock-controller@10020000 {
>                         compatible =3D "samsung,exynos2200-cmu-peris";
> -                       reg =3D <0x0 0x10020000 0x0 0x8000>;
> +                       reg =3D <0x10020000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&cmu_top CLK_DOUT_TCXO_DIV3>,
> @@ -250,7 +250,7 @@ cmu_peris: clock-controller@10020000 {
>                 mct_peris: timer@10040000 {
>                         compatible =3D "samsung,exynos2200-mct-peris",
>                                      "samsung,exynos4210-mct";
> -                       reg =3D <0x0 0x10040000 0x0 0x800>;
> +                       reg =3D <0x10040000 0x800>;
>                         clocks =3D <&cmu_top CLK_DOUT_TCXO_DIV3>, <&cmu_p=
eris CLK_MOUT_PERIS_GIC>;
>                         clock-names =3D "fin_pll", "mct";
>                         interrupts =3D <GIC_SPI 943 IRQ_TYPE_LEVEL_HIGH 0=
>,
> @@ -270,8 +270,8 @@ mct_peris: timer@10040000 {
>
>                 gic: interrupt-controller@10200000 {
>                         compatible =3D "arm,gic-v3";
> -                       reg =3D <0x0 0x10200000 0x0 0x10000>,     /* GICD=
 */
> -                             <0x0 0x10240000 0x0 0x200000>;    /* GICR *=
 8 */
> +                       reg =3D <0x10200000 0x10000>,     /* GICD */
> +                             <0x10240000 0x200000>;    /* GICR * 8 */
>
>                         #interrupt-cells =3D <4>;
>                         interrupt-controller;
> @@ -294,7 +294,7 @@ ppi_cluster2: interrupt-partition-2 {
>
>                 cmu_peric0: clock-controller@10400000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric0";
> -                       reg =3D <0x0 0x10400000 0x0 0x8000>;
> +                       reg =3D <0x10400000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -306,17 +306,17 @@ cmu_peric0: clock-controller@10400000 {
>
>                 syscon_peric0: syscon@10420000 {
>                         compatible =3D "samsung,exynos2200-peric0-sysreg"=
, "syscon";
> -                       reg =3D <0x0 0x10420000 0x0 0x2000>;
> +                       reg =3D <0x10420000 0x2000>;
>                 };
>
>                 pinctrl_peric0: pinctrl@10430000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x10430000 0x0 0x1000>;
> +                       reg =3D <0x10430000 0x1000>;
>                 };
>
>                 cmu_peric1: clock-controller@10700000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric1";
> -                       reg =3D <0x0 0x10700000 0x0 0x8000>;
> +                       reg =3D <0x10700000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -328,23 +328,23 @@ cmu_peric1: clock-controller@10700000 {
>
>                 syscon_peric1: syscon@10720000 {
>                         compatible =3D "samsung,exynos2200-peric1-sysreg"=
, "syscon";
> -                       reg =3D <0x0 0x10720000 0x0 0x2000>;
> +                       reg =3D <0x10720000 0x2000>;
>                 };
>
>                 pinctrl_peric1: pinctrl@10730000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x10730000 0x0 0x1000>;
> +                       reg =3D <0x10730000 0x1000>;
>                 };
>
>                 cmu_hsi0: clock-controller@10a00000 {
>                         compatible =3D "samsung,exynos2200-cmu-hsi0";
> -                       reg =3D <0x0 0x10a00000 0x0 0x8000>;
> +                       reg =3D <0x10a00000 0x8000>;
>                         #clock-cells =3D <1>;
>                 };
>
>                 usb32drd: phy@10aa0000 {
>                         compatible =3D "samsung,exynos2200-usb32drd-phy";
> -                       reg =3D <0x0 0x10aa0000 0x0 0x10000>;
> +                       reg =3D <0x10aa0000 0x10000>;
>
>                         clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
>                         clock-names =3D "phy";
> @@ -360,7 +360,7 @@ usb32drd: phy@10aa0000 {
>
>                 usb_hsphy: phy@10ab0000 {
>                         compatible =3D "samsung,exynos2200-eusb2-phy";
> -                       reg =3D <0x0 0x10ab0000 0x0 0x10000>;
> +                       reg =3D <0x10ab0000 0x10000>;
>
>                         clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
>                                  <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
> @@ -374,7 +374,7 @@ usb_hsphy: phy@10ab0000 {
>
>                 usb: usb@10b00000 {
>                         compatible =3D "samsung,exynos2200-dwusb3";
> -                       ranges =3D <0x0 0x0 0x10b00000 0x10000>;
> +                       ranges =3D <0x0 0x10b00000 0x10000>;
>
>                         clocks =3D <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
>                         clock-names =3D "link_aclk";
> @@ -406,7 +406,7 @@ usb_dwc3: usb@0 {
>
>                 cmu_ufs: clock-controller@11000000 {
>                         compatible =3D "samsung,exynos2200-cmu-ufs";
> -                       reg =3D <0x0 0x11000000 0x0 0x8000>;
> +                       reg =3D <0x11000000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -418,27 +418,27 @@ cmu_ufs: clock-controller@11000000 {
>
>                 syscon_ufs: syscon@11020000 {
>                         compatible =3D "samsung,exynos2200-ufs-sysreg", "=
syscon";
> -                       reg =3D <0x0 0x11020000 0x0 0x2000>;
> +                       reg =3D <0x11020000 0x2000>;
>                 };
>
>                 pinctrl_ufs: pinctrl@11040000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11040000 0x0 0x1000>;
> +                       reg =3D <0x11040000 0x1000>;
>                 };
>
>                 pinctrl_hsi1ufs: pinctrl@11060000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11060000 0x0 0x1000>;
> +                       reg =3D <0x11060000 0x1000>;
>                 };
>
>                 pinctrl_hsi1: pinctrl@11240000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11240000 0x0 0x1000>;
> +                       reg =3D <0x11240000 0x1000>;
>                 };
>
>                 cmu_peric2: clock-controller@11c00000 {
>                         compatible =3D "samsung,exynos2200-cmu-peric2";
> -                       reg =3D <0x0 0x11c00000 0x0 0x8000>;
> +                       reg =3D <0x11c00000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -450,17 +450,17 @@ cmu_peric2: clock-controller@11c00000 {
>
>                 syscon_peric2: syscon@11c20000 {
>                         compatible =3D "samsung,exynos2200-peric2-sysreg"=
, "syscon";
> -                       reg =3D <0x0 0x11c20000 0x0 0x4000>;
> +                       reg =3D <0x11c20000 0x4000>;
>                 };
>
>                 pinctrl_peric2: pinctrl@11c30000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x11c30000 0x0 0x1000>;
> +                       reg =3D <0x11c30000 0x1000>;
>                 };
>
>                 cmu_cmgp: clock-controller@14e00000 {
>                         compatible =3D "samsung,exynos2200-cmu-cmgp";
> -                       reg =3D <0x0 0x14e00000 0x0 0x8000>;
> +                       reg =3D <0x14e00000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -471,12 +471,12 @@ cmu_cmgp: clock-controller@14e00000 {
>
>                 syscon_cmgp: syscon@14e20000 {
>                         compatible =3D "samsung,exynos2200-cmgp-sysreg", =
"syscon";
> -                       reg =3D <0x0 0x14e20000 0x0 0x2000>;
> +                       reg =3D <0x14e20000 0x2000>;
>                 };
>
>                 pinctrl_cmgp: pinctrl@14e30000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x14e30000 0x0 0x1000>;
> +                       reg =3D <0x14e30000 0x1000>;
>
>                         wakeup-interrupt-controller {
>                                 compatible =3D "samsung,exynos2200-wakeup=
-eint",
> @@ -487,7 +487,7 @@ wakeup-interrupt-controller {
>
>                 cmu_vts: clock-controller@15300000 {
>                         compatible =3D "samsung,exynos2200-cmu-vts";
> -                       reg =3D <0x0 0x15300000 0x0 0x8000>;
> +                       reg =3D <0x15300000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -497,12 +497,12 @@ cmu_vts: clock-controller@15300000 {
>
>                 pinctrl_vts: pinctrl@15320000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x15320000 0x0 0x1000>;
> +                       reg =3D <0x15320000 0x1000>;
>                 };
>
>                 cmu_alive: clock-controller@15800000 {
>                         compatible =3D "samsung,exynos2200-cmu-alive";
> -                       reg =3D <0x0 0x15800000 0x0 0x8000>;
> +                       reg =3D <0x15800000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>,
> @@ -512,7 +512,7 @@ cmu_alive: clock-controller@15800000 {
>
>                 pinctrl_alive: pinctrl@15850000 {
>                         compatible =3D "samsung,exynos2200-pinctrl";
> -                       reg =3D <0x0 0x15850000 0x0 0x1000>;
> +                       reg =3D <0x15850000 0x1000>;
>
>                         wakeup-interrupt-controller {
>                                 compatible =3D "samsung,exynos2200-wakeup=
-eint",
> @@ -524,7 +524,7 @@ wakeup-interrupt-controller {
>                 pmu_system_controller: system-controller@15860000 {
>                         compatible =3D "samsung,exynos2200-pmu",
>                                      "samsung,exynos7-pmu", "syscon";
> -                       reg =3D <0x0 0x15860000 0x0 0x10000>;
> +                       reg =3D <0x15860000 0x10000>;
>
>                         reboot: syscon-reboot {
>                                 compatible =3D "syscon-reboot";
> @@ -536,7 +536,7 @@ reboot: syscon-reboot {
>
>                 cmu_top: clock-controller@1a320000 {
>                         compatible =3D "samsung,exynos2200-cmu-top";
> -                       reg =3D <0x0 0x1a320000 0x0 0x8000>;
> +                       reg =3D <0x1a320000 0x8000>;
>                         #clock-cells =3D <1>;
>
>                         clocks =3D <&xtcxo>;
> --
> 2.43.0
>
>

