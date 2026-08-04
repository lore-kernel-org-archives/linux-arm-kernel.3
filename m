Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B40C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=; b=xikBS1dTKy/ub0Xu8QU0d36X8r
	Mj7Ukq/5qO8qF13t+r9QZohWZk4z0fGGpv2sGePm7GwjJGR229RGTEXL9WJ8pzO5ceh9rokw1my0W
	sze04DTOTuR1K4sY4KdufY2qENmtzlpjecz3PlY43qgDZAAavNzGAj5Y8iVeeH+xGFYlBZVQ21aFg
	2SEqbCkVflGrKyVpAmbkXnZlZt13Ch1tqVqpMNYLszFMfI+UxHjs8JE5wPh7a/aktnAbgIfGxsJuo
	iFtfHBTW5KdwEuTXPwuPL2HOtqmZ4p2YhhWZvOUmNWlf3mBa46c7aXE5zxHHQBBshzfijC4sDgwYd
	Z2iD4r6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDy3-00000001lyn-1W82;
	Tue, 04 Aug 2026 12:09:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDy0-00000001lxn-1AFS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:09:58 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6a10a1a4b11so3089981a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 05:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785845394; cv=none;
        d=google.com; s=arc-20260327;
        b=cjYNfvL8nKJN4E8qgS5uIZaY4xRK9ZFVqPzfMPX6oUnuQXkSZDtPJ4aEmDaA2pFxXW
         WUybJG7AukFCaWVivLZTwM7ulTIPTuv9CZA969i9i2AAwNi5wlgKnxHXydcIf9cHnWqW
         jqYbLDeDP5bSZG6lrfuxBDwjZ9qG67y/G+Q+dr+JDfAbCzNvPVF4x7YV00zdS2uzx6wf
         nqubQKcxOo7y7YkInDCDf97LPo4cRMXXd3oePo+PhN4hURua7grmwV9PZiv9OB/dVq5x
         K4TCkI7f13oroiY5l5tRzxHXdBcboLmXDbOaMwy5NZZn1tWu8rxMRH1jrEDmwkaQ0XSG
         8TGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=;
        fh=qsKgXR9nxJ6M3ZcnxmfewsCrshfpmCF7ZPo5NiPTOfM=;
        b=e9jWGgzT3/XdF7obkrbRPuTmuu5TtV6ZNFfXcY1CDW7tzmqgzrHOrby0DhqrZ4O2j+
         5J4V32VIHDyEPeAaK+WfIHe6Y46CMH1vPZpEFxu48hxlB9O6avhBI00RXLbD4Wc/Qz2I
         VYtm+O79BfgqbRQKMevVXjTcP1rJ0eU/YWvZSVWgIRpAmNzCIv9LTdi1P4vamHm+8iyV
         KshgluaVflJ24/5m+kPrjfSbpv0pueJshLZkH+xPnPms9nVmP2/wV8k/18o2L+Nd5woj
         Fj6QMl+Cg0VFn+EayX20mzeg7T3OGTBExJv10UmLqOuH2uYwOQ7qXqJkl7kr981LRqv+
         0Q6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785845394; x=1786450194; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=;
        b=k84YHWMZXBSoAAsKQUemDSEFohVC1xmdxa/B9O40gdvtjd8to06IH8QSKWC4KLDuZJ
         T96OL8p0HmjCaX4dZ7YPSE0NXsoNurNnY3dTJdihdE4qpJWgmqFNdCU54Pb82Vj3SxA2
         UsKBZPHrypvlu+DpA9zkh5w+OH4O38cVwz/XhFN2ZGnZ6QgoUxpbCDRJfFkNiSdFBOir
         7o7YLvqW1qMGLbCXvr0wB/3gBgLjkyYXV23AArPXBe9wmC69GoIbRJBHPJNlZqLL1fMO
         GFErpD9V1jAgyVXYsAfS7CYTDEvlNCOtk7vS0xVWkDy8HM7g77ertu9wopZv7WveQHvR
         eFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845394; x=1786450194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jei8t4G8dP/WHAA3ArvZkOSCI1ouVxL8YiLBglXmf+U=;
        b=lqye6YCxL1jrAhcHXZo/xu1F8dG9e8rOwSDAAERxMjqj88YvXkS6Jra80NnCojOFF8
         OIUmn1JbYgcjwZjPbr79WWnAiAXmxC21KlVNO7cWByBCE3ijluCFP+UaCko+uOSwLI/D
         XWpTceUq5m1FDfQ0P3dkFAGXPD/UkCwWogoF/HjIVrzE37R3Bxu6m9hNp0I3QBuqQFYA
         iIuzoEBCMux6FEw8XWVixZodelIbrSzX6pryKblGFVbyJdHGdFoG0Zn8vrTFijDvqI5N
         qzUNrUH3r1r4jkxp7Nw0RToeGyUS4n0z9lgyWFGk9HM2F/3ZtcswHzDobYRsCNlPXnqy
         VCug==
X-Forwarded-Encrypted: i=1; AHgh+RrD8yKhRK5pT3DwH80a5+OWvc2rIc5rVP+i7bTDcujatUuqaw3Cnb+yIuN1/y+QUytUNHQn3pjrfM0DDwvi1bJE@lists.infradead.org
X-Gm-Message-State: AOJu0YwJEaci/S7EZffLiuAMKOO4dnOnW42DyhN84yhf1NixJ0celVPa
	zxiBD8n5ScHQr5xq0ObTRpJJ30/Qxk07yo/oU73m9cfzFPVIYg3U6VbYEyHhmeCzzeC89iQQPKk
	hC1uzpgp7BZmxnjR0KKmJ7FaT8HjuMtq6V8C7xWn8e7mpeDOeN4umWnk=
X-Gm-Gg: AR+sD137uPT/lppujHDRQmjIbZwzI3MVxePP+gcjplXgGQJf/bPIUKm6+pRXyoNlh/P
	COqKSKlPA7vyrG+gTr+zxfOB1pb3xscjcbomjfJyroICLW2dX0jcYlZk0f3rJUyJGRVW7dveV9e
	l8lcmyYIEFAkzz1s6aB94DgvpvbGJMihna4mw2E+MiTDfJaWhfVuha5Mi5v57DhNu9rlq1U9pmG
	bfCYII8nU1YxOAd7jxLbAcMi7q8AMwP2YiwHlNBn2LBPdDFruyvGmQgIuoos9OdII8IXju8v4kH
	l3I3MPnxZL+5uhD9aN2Bkj1OlOnBaK1U56taZyIhgxY/QkGDq7g4f1HORXs9R16ccB8kBiFFMqC
	T/38=
X-Received: by 2002:a05:6402:44d7:b0:69c:72e2:a3d5 with SMTP id
 4fb4d7f45d1cf-6a0a7c61137mr10766363a12.6.1785845394084; Tue, 04 Aug 2026
 05:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
 <20260801-b4-dts-coding-style-strict-v2-4-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-4-f09a659ab80d@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Aug 2026 13:09:41 +0100
X-Gm-Features: AUfX_mxuN5Q1A0xEeX4rZ1XnLBRRG-u0-05MQYuftCBPTDnQctf3eV8dHANyUJg
Message-ID: <CADrjBPqqQxE6qnwdrG2YnTW_+sieuynHSqBUXQu05ptii6kVLw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] arm64: dts: exynos: Re-order clocks and align
 continued properties
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
X-CRM114-CacheID: sfid-20260804_050956_557120_52F83068 
X-CRM114-Status: GOOD (  14.60  )
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
> Trivial white-space only changes to adjust to DTS coding style
> (clocks-names should follow clocks) and fix dt-check-style strict
> warnings like:
>
>   [property-order] property 'clocks' out of canonical order (should sort =
before 'clock-names')
>   [continuation-alignment] continuation should align to column 39 (under =
< or ")
>
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 282 ++++++++++++++---------=
------
>  1 file changed, 141 insertions(+), 141 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot=
/dts/exynos/exynos5433.dtsi
> index ebd63b9e244d..d318c87effaa 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> @@ -400,14 +400,14 @@ cmu_top: clock-controller@10030000 {
>                         reg =3D <0x10030000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_mphy_pll",
> -                               "sclk_mfc_pll",
> -                               "sclk_bus_pll";
>                         clocks =3D <&xxti>,
> -                               <&cmu_cpif CLK_SCLK_MPHY_PLL>,
> -                               <&cmu_mif CLK_SCLK_MFC_PLL>,
> -                               <&cmu_mif CLK_SCLK_BUS_PLL>;
> +                                <&cmu_cpif CLK_SCLK_MPHY_PLL>,
> +                                <&cmu_mif CLK_SCLK_MFC_PLL>,
> +                                <&cmu_mif CLK_SCLK_BUS_PLL>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_mphy_pll",
> +                                     "sclk_mfc_pll",
> +                                     "sclk_bus_pll";
>                 };
>
>                 cmu_cpif: clock-controller@10fc0000 {
> @@ -415,8 +415,8 @@ cmu_cpif: clock-controller@10fc0000 {
>                         reg =3D <0x10fc0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk";
>                         clocks =3D <&xxti>;
> +                       clock-names =3D "oscclk";
>                 };
>
>                 cmu_mif: clock-controller@105b0000 {
> @@ -424,10 +424,10 @@ cmu_mif: clock-controller@105b0000 {
>                         reg =3D <0x105b0000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_mphy_pll";
>                         clocks =3D <&xxti>,
> -                               <&cmu_cpif CLK_SCLK_MPHY_PLL>;
> +                                <&cmu_cpif CLK_SCLK_MPHY_PLL>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_mphy_pll";
>                 };
>
>                 cmu_peric: clock-controller@14c80000 {
> @@ -447,26 +447,26 @@ cmu_fsys: clock-controller@156e0000 {
>                         reg =3D <0x156e0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_ufs_mphy",
> -                               "aclk_fsys_200",
> -                               "sclk_pcie_100_fsys",
> -                               "sclk_ufsunipro_fsys",
> -                               "sclk_mmc2_fsys",
> -                               "sclk_mmc1_fsys",
> -                               "sclk_mmc0_fsys",
> -                               "sclk_usbhost30_fsys",
> -                               "sclk_usbdrd30_fsys";
>                         clocks =3D <&xxti>,
> -                               <&cmu_cpif CLK_SCLK_UFS_MPHY>,
> -                               <&cmu_top CLK_ACLK_FSYS_200>,
> -                               <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
> -                               <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
> -                               <&cmu_top CLK_SCLK_MMC2_FSYS>,
> -                               <&cmu_top CLK_SCLK_MMC1_FSYS>,
> -                               <&cmu_top CLK_SCLK_MMC0_FSYS>,
> -                               <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> -                               <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
> +                                <&cmu_cpif CLK_SCLK_UFS_MPHY>,
> +                                <&cmu_top CLK_ACLK_FSYS_200>,
> +                                <&cmu_top CLK_SCLK_PCIE_100_FSYS>,
> +                                <&cmu_top CLK_SCLK_UFSUNIPRO_FSYS>,
> +                                <&cmu_top CLK_SCLK_MMC2_FSYS>,
> +                                <&cmu_top CLK_SCLK_MMC1_FSYS>,
> +                                <&cmu_top CLK_SCLK_MMC0_FSYS>,
> +                                <&cmu_top CLK_SCLK_USBHOST30_FSYS>,
> +                                <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_ufs_mphy",
> +                                     "aclk_fsys_200",
> +                                     "sclk_pcie_100_fsys",
> +                                     "sclk_ufsunipro_fsys",
> +                                     "sclk_mmc2_fsys",
> +                                     "sclk_mmc1_fsys",
> +                                     "sclk_mmc0_fsys",
> +                                     "sclk_usbhost30_fsys",
> +                                     "sclk_usbdrd30_fsys";
>                 };
>
>                 cmu_g2d: clock-controller@12460000 {
> @@ -474,12 +474,12 @@ cmu_g2d: clock-controller@12460000 {
>                         reg =3D <0x12460000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_g2d_266",
> -                               "aclk_g2d_400";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_G2D_266>,
> -                               <&cmu_top CLK_ACLK_G2D_400>;
> +                                <&cmu_top CLK_ACLK_G2D_266>,
> +                                <&cmu_top CLK_ACLK_G2D_400>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_g2d_266",
> +                                     "aclk_g2d_400";
>                         power-domains =3D <&pd_g2d>;
>                 };
>
> @@ -488,24 +488,24 @@ cmu_disp: clock-controller@13b90000 {
>                         reg =3D <0x13b90000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_dsim1_disp",
> -                               "sclk_dsim0_disp",
> -                               "sclk_dsd_disp",
> -                               "sclk_decon_tv_eclk_disp",
> -                               "sclk_decon_vclk_disp",
> -                               "sclk_decon_eclk_disp",
> -                               "sclk_decon_tv_vclk_disp",
> -                               "aclk_disp_333";
>                         clocks =3D <&xxti>,
> -                               <&cmu_mif CLK_SCLK_DSIM1_DISP>,
> -                               <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> -                               <&cmu_mif CLK_SCLK_DSD_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> -                               <&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
> -                               <&cmu_mif CLK_ACLK_DISP_333>;
> +                                <&cmu_mif CLK_SCLK_DSIM1_DISP>,
> +                                <&cmu_mif CLK_SCLK_DSIM0_DISP>,
> +                                <&cmu_mif CLK_SCLK_DSD_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_TV_ECLK_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_VCLK_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_ECLK_DISP>,
> +                                <&cmu_mif CLK_SCLK_DECON_TV_VCLK_DISP>,
> +                                <&cmu_mif CLK_ACLK_DISP_333>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_dsim1_disp",
> +                                     "sclk_dsim0_disp",
> +                                     "sclk_dsd_disp",
> +                                     "sclk_decon_tv_eclk_disp",
> +                                     "sclk_decon_vclk_disp",
> +                                     "sclk_decon_eclk_disp",
> +                                     "sclk_decon_tv_vclk_disp",
> +                                     "aclk_disp_333";
>                         power-domains =3D <&pd_disp>;
>                 };
>
> @@ -513,8 +513,8 @@ cmu_aud: clock-controller@114c0000 {
>                         compatible =3D "samsung,exynos5433-cmu-aud";
>                         reg =3D <0x114c0000 0x1000>;
>                         #clock-cells =3D <1>;
> -                       clock-names =3D "oscclk", "fout_aud_pll";
>                         clocks =3D <&xxti>, <&cmu_top CLK_FOUT_AUD_PLL>;
> +                       clock-names =3D "oscclk", "fout_aud_pll";
>                         power-domains =3D <&pd_aud>;
>                 };
>
> @@ -523,8 +523,8 @@ cmu_bus0: clock-controller@13600000 {
>                         reg =3D <0x13600000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "aclk_bus0_400";
>                         clocks =3D <&cmu_top CLK_ACLK_BUS0_400>;
> +                       clock-names =3D "aclk_bus0_400";
>                 };
>
>                 cmu_bus1: clock-controller@14800000 {
> @@ -532,8 +532,8 @@ cmu_bus1: clock-controller@14800000 {
>                         reg =3D <0x14800000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "aclk_bus1_400";
>                         clocks =3D <&cmu_top CLK_ACLK_BUS1_400>;
> +                       clock-names =3D "aclk_bus1_400";
>                 };
>
>                 cmu_bus2: clock-controller@13400000 {
> @@ -541,8 +541,8 @@ cmu_bus2: clock-controller@13400000 {
>                         reg =3D <0x13400000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_bus2_400";
>                         clocks =3D <&xxti>, <&cmu_mif CLK_ACLK_BUS2_400>;
> +                       clock-names =3D "oscclk", "aclk_bus2_400";
>                 };
>
>                 cmu_g3d: clock-controller@14aa0000 {
> @@ -550,8 +550,8 @@ cmu_g3d: clock-controller@14aa0000 {
>                         reg =3D <0x14aa0000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_g3d_400";
>                         clocks =3D <&xxti>, <&cmu_top CLK_ACLK_G3D_400>;
> +                       clock-names =3D "oscclk", "aclk_g3d_400";
>                         power-domains =3D <&pd_g3d>;
>                 };
>
> @@ -560,12 +560,12 @@ cmu_gscl: clock-controller@13cf0000 {
>                         reg =3D <0x13cf0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_gscl_111",
> -                               "aclk_gscl_333";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_GSCL_111>,
> -                               <&cmu_top CLK_ACLK_GSCL_333>;
> +                                <&cmu_top CLK_ACLK_GSCL_111>,
> +                                <&cmu_top CLK_ACLK_GSCL_333>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_gscl_111",
> +                                     "aclk_gscl_333";
>                         power-domains =3D <&pd_gscl>;
>                 };
>
> @@ -574,8 +574,8 @@ cmu_apollo: clock-controller@11900000 {
>                         reg =3D <0x11900000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "sclk_bus_pll_apollo";
>                         clocks =3D <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_AP=
OLLO>;
> +                       clock-names =3D "oscclk", "sclk_bus_pll_apollo";
>                 };
>
>                 cmu_atlas: clock-controller@11800000 {
> @@ -583,8 +583,8 @@ cmu_atlas: clock-controller@11800000 {
>                         reg =3D <0x11800000 0x2000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "sclk_bus_pll_atlas";
>                         clocks =3D <&xxti>, <&cmu_mif CLK_SCLK_BUS_PLL_AT=
LAS>;
> +                       clock-names =3D "oscclk", "sclk_bus_pll_atlas";
>                 };
>
>                 cmu_mscl: clock-controller@150d0000 {
> @@ -592,12 +592,12 @@ cmu_mscl: clock-controller@150d0000 {
>                         reg =3D <0x150d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_jpeg_mscl",
> -                               "aclk_mscl_400";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_SCLK_JPEG_MSCL>,
> -                               <&cmu_top CLK_ACLK_MSCL_400>;
> +                                <&cmu_top CLK_SCLK_JPEG_MSCL>,
> +                                <&cmu_top CLK_ACLK_MSCL_400>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_jpeg_mscl",
> +                                     "aclk_mscl_400";
>                         power-domains =3D <&pd_mscl>;
>                 };
>
> @@ -606,8 +606,8 @@ cmu_mfc: clock-controller@15280000 {
>                         reg =3D <0x15280000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_mfc_400";
>                         clocks =3D <&xxti>, <&cmu_top CLK_ACLK_MFC_400>;
> +                       clock-names =3D "oscclk", "aclk_mfc_400";
>                         power-domains =3D <&pd_mfc>;
>                 };
>
> @@ -616,8 +616,8 @@ cmu_hevc: clock-controller@14f80000 {
>                         reg =3D <0x14f80000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk", "aclk_hevc_400";
>                         clocks =3D <&xxti>, <&cmu_top CLK_ACLK_HEVC_400>;
> +                       clock-names =3D "oscclk", "aclk_hevc_400";
>                         power-domains =3D <&pd_hevc>;
>                 };
>
> @@ -626,12 +626,12 @@ cmu_isp: clock-controller@146d0000 {
>                         reg =3D <0x146d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_isp_dis_400",
> -                               "aclk_isp_400";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_ISP_DIS_400>,
> -                               <&cmu_top CLK_ACLK_ISP_400>;
> +                                <&cmu_top CLK_ACLK_ISP_DIS_400>,
> +                                <&cmu_top CLK_ACLK_ISP_400>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_isp_dis_400",
> +                                     "aclk_isp_400";
>                         power-domains =3D <&pd_isp>;
>                 };
>
> @@ -640,14 +640,14 @@ cmu_cam0: clock-controller@120d0000 {
>                         reg =3D <0x120d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_cam0_333",
> -                               "aclk_cam0_400",
> -                               "aclk_cam0_552";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_ACLK_CAM0_333>,
> -                               <&cmu_top CLK_ACLK_CAM0_400>,
> -                               <&cmu_top CLK_ACLK_CAM0_552>;
> +                                <&cmu_top CLK_ACLK_CAM0_333>,
> +                                <&cmu_top CLK_ACLK_CAM0_400>,
> +                                <&cmu_top CLK_ACLK_CAM0_552>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_cam0_333",
> +                                     "aclk_cam0_400",
> +                                     "aclk_cam0_552";
>                         power-domains =3D <&pd_cam0>;
>                 };
>
> @@ -656,20 +656,20 @@ cmu_cam1: clock-controller@145d0000 {
>                         reg =3D <0x145d0000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "sclk_isp_uart_cam1",
> -                               "sclk_isp_spi1_cam1",
> -                               "sclk_isp_spi0_cam1",
> -                               "aclk_cam1_333",
> -                               "aclk_cam1_400",
> -                               "aclk_cam1_552";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_SCLK_ISP_UART_CAM1>,
> -                               <&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
> -                               <&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
> -                               <&cmu_top CLK_ACLK_CAM1_333>,
> -                               <&cmu_top CLK_ACLK_CAM1_400>,
> -                               <&cmu_top CLK_ACLK_CAM1_552>;
> +                                <&cmu_top CLK_SCLK_ISP_UART_CAM1>,
> +                                <&cmu_top CLK_SCLK_ISP_SPI1_CAM1>,
> +                                <&cmu_top CLK_SCLK_ISP_SPI0_CAM1>,
> +                                <&cmu_top CLK_ACLK_CAM1_333>,
> +                                <&cmu_top CLK_ACLK_CAM1_400>,
> +                                <&cmu_top CLK_ACLK_CAM1_552>;
> +                       clock-names =3D "oscclk",
> +                                     "sclk_isp_uart_cam1",
> +                                     "sclk_isp_spi1_cam1",
> +                                     "sclk_isp_spi0_cam1",
> +                                     "aclk_cam1_333",
> +                                     "aclk_cam1_400",
> +                                     "aclk_cam1_552";
>                         power-domains =3D <&pd_cam1>;
>                 };
>
> @@ -678,23 +678,23 @@ cmu_imem: clock-controller@11060000 {
>                         reg =3D <0x11060000 0x1000>;
>                         #clock-cells =3D <1>;
>
> -                       clock-names =3D "oscclk",
> -                               "aclk_imem_sssx_266",
> -                               "aclk_imem_266",
> -                               "aclk_imem_200";
>                         clocks =3D <&xxti>,
> -                               <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> -                               <&cmu_top CLK_DIV_ACLK_IMEM_266>,
> -                               <&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +                                <&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
> +                                <&cmu_top CLK_DIV_ACLK_IMEM_266>,
> +                                <&cmu_top CLK_DIV_ACLK_IMEM_200>;
> +                       clock-names =3D "oscclk",
> +                                     "aclk_imem_sssx_266",
> +                                     "aclk_imem_266",
> +                                     "aclk_imem_200";
>                 };
>
>                 slim_sss: slim-sss@11140000 {
>                         compatible =3D "samsung,exynos5433-slim-sss";
>                         reg =3D <0x11140000 0x1000>;
>                         interrupts =3D <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk";
>                         clocks =3D <&cmu_imem CLK_PCLK_SLIMSSS>,
>                                  <&cmu_imem CLK_ACLK_SLIMSSS>;
> +                       clock-names =3D "pclk", "aclk";
>                 };
>
>                 pd_gscl: power-domain@105c4000 {
> @@ -954,8 +954,8 @@ pmu_system_controller: system-controller@105c0000 {
>                         compatible =3D "samsung,exynos5433-pmu", "simple-=
mfd", "syscon";
>                         reg =3D <0x105c0000 0x5008>;
>                         #clock-cells =3D <1>;
> -                       clock-names =3D "clkout16";
>                         clocks =3D <&xxti>;
> +                       clock-names =3D "clkout16";
>
>                         mipi_phy: mipi-phy {
>                                 compatible =3D "samsung,exynos5433-mipi-v=
ideo-phy";
> @@ -975,13 +975,13 @@ reboot: syscon-reboot {
>
>                 gic: interrupt-controller@11001000 {
>                         compatible =3D "arm,gic-400";
> +                       reg =3D <0x11001000 0x1000>,
> +                             <0x11002000 0x2000>,
> +                             <0x11004000 0x2000>,
> +                             <0x11006000 0x2000>;
>                         #address-cells =3D <0>;
>                         #interrupt-cells =3D <3>;
>                         interrupt-controller;
> -                       reg =3D <0x11001000 0x1000>,
> -                               <0x11002000 0x2000>,
> -                               <0x11004000 0x2000>,
> -                               <0x11006000 0x2000>;
>                         interrupts =3D <GIC_PPI 9 0xf04>;
>                 };
>
> @@ -1190,13 +1190,13 @@ gsc_0: video-scaler@13c00000 {
>                         compatible =3D "samsung,exynos5433-gsc";
>                         reg =3D <0x13c00000 0x1000>;
>                         interrupts =3D <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> -                                     "aclk_gsclbend", "gsd";
>                         clocks =3D <&cmu_gscl CLK_PCLK_GSCL0>,
>                                  <&cmu_gscl CLK_ACLK_GSCL0>,
>                                  <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
>                                  <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
>                                  <&cmu_gscl CLK_ACLK_GSD>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> +                                     "aclk_gsclbend", "gsd";
>                         iommus =3D <&sysmmu_gscl0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1205,13 +1205,13 @@ gsc_1: video-scaler@13c10000 {
>                         compatible =3D "samsung,exynos5433-gsc";
>                         reg =3D <0x13c10000 0x1000>;
>                         interrupts =3D <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> -                                     "aclk_gsclbend", "gsd";
>                         clocks =3D <&cmu_gscl CLK_PCLK_GSCL1>,
>                                  <&cmu_gscl CLK_ACLK_GSCL1>,
>                                  <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
>                                  <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
>                                  <&cmu_gscl CLK_ACLK_GSD>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> +                                     "aclk_gsclbend", "gsd";
>                         iommus =3D <&sysmmu_gscl1>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1220,13 +1220,13 @@ gsc_2: video-scaler@13c20000 {
>                         compatible =3D "samsung,exynos5433-gsc";
>                         reg =3D <0x13c20000 0x1000>;
>                         interrupts =3D <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> -                                     "aclk_gsclbend", "gsd";
>                         clocks =3D <&cmu_gscl CLK_PCLK_GSCL2>,
>                                  <&cmu_gscl CLK_ACLK_GSCL2>,
>                                  <&cmu_gscl CLK_ACLK_XIU_GSCLX>,
>                                  <&cmu_gscl CLK_ACLK_GSCLBEND_333>,
>                                  <&cmu_gscl CLK_ACLK_GSD>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu",
> +                                     "aclk_gsclbend", "gsd";
>                         iommus =3D <&sysmmu_gscl2>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1294,10 +1294,10 @@ scaler_0: scaler@15000000 {
>                         compatible =3D "samsung,exynos5433-scaler";
>                         reg =3D <0x15000000 0x1294>;
>                         interrupts =3D <0 402 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         clocks =3D <&cmu_mscl CLK_PCLK_M2MSCALER0>,
>                                  <&cmu_mscl CLK_ACLK_M2MSCALER0>,
>                                  <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         iommus =3D <&sysmmu_scaler_0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1306,10 +1306,10 @@ scaler_1: scaler@15010000 {
>                         compatible =3D "samsung,exynos5433-scaler";
>                         reg =3D <0x15010000 0x1294>;
>                         interrupts =3D <0 403 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         clocks =3D <&cmu_mscl CLK_PCLK_M2MSCALER1>,
>                                  <&cmu_mscl CLK_ACLK_M2MSCALER1>,
>                                  <&cmu_mscl CLK_ACLK_XIU_MSCLX>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         iommus =3D <&sysmmu_scaler_1>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1318,11 +1318,11 @@ jpeg: codec@15020000 {
>                         compatible =3D "samsung,exynos5433-jpeg";
>                         reg =3D <0x15020000 0x10000>;
>                         interrupts =3D <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu", "sclk=
";
>                         clocks =3D <&cmu_mscl CLK_PCLK_JPEG>,
>                                  <&cmu_mscl CLK_ACLK_JPEG>,
>                                  <&cmu_mscl CLK_ACLK_XIU_MSCLX>,
>                                  <&cmu_mscl CLK_SCLK_JPEG>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu", "sclk=
";
>                         iommus =3D <&sysmmu_jpeg>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1331,10 +1331,10 @@ mfc: codec@152e0000 {
>                         compatible =3D "samsung,exynos5433-mfc";
>                         reg =3D <0x152e0000 0x10000>;
>                         interrupts =3D <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         clocks =3D <&cmu_mfc CLK_PCLK_MFC>,
>                                  <&cmu_mfc CLK_ACLK_MFC>,
>                                  <&cmu_mfc CLK_ACLK_XIU_MFCX>;
> +                       clock-names =3D "pclk", "aclk", "aclk_xiu";
>                         iommus =3D <&sysmmu_mfc_0>, <&sysmmu_mfc_1>;
>                         iommu-names =3D "left", "right";
>                         power-domains =3D <&pd_mfc>;
> @@ -1344,9 +1344,9 @@ sysmmu_decon0x: sysmmu@13a00000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a00000 0x1000>;
>                         interrupts =3D <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_DECON0X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_DECON0X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_DECON0X>;
> +                       clock-names =3D "aclk", "pclk";
>                         power-domains =3D <&pd_disp>;
>                         #iommu-cells =3D <0>;
>                 };
> @@ -1355,9 +1355,9 @@ sysmmu_decon1x: sysmmu@13a10000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a10000 0x1000>;
>                         interrupts =3D <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_DECON1X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_DECON1X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_DECON1X>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_disp>;
>                 };
> @@ -1366,9 +1366,9 @@ sysmmu_tv0x: sysmmu@13a20000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a20000 0x1000>;
>                         interrupts =3D <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_TV0X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_TV0X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_TV0X>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_disp>;
>                 };
> @@ -1377,9 +1377,9 @@ sysmmu_tv1x: sysmmu@13a30000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13a30000 0x1000>;
>                         interrupts =3D <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_disp CLK_ACLK_SMMU_TV1X>,
> -                               <&cmu_disp CLK_PCLK_SMMU_TV1X>;
> +                                <&cmu_disp CLK_PCLK_SMMU_TV1X>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_disp>;
>                 };
> @@ -1388,9 +1388,9 @@ sysmmu_gscl0: sysmmu@13c80000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13c80000 0x1000>;
>                         interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL0>,
>                                  <&cmu_gscl CLK_PCLK_SMMU_GSCL0>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1399,9 +1399,9 @@ sysmmu_gscl1: sysmmu@13c90000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13c90000 0x1000>;
>                         interrupts =3D <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL1>,
>                                  <&cmu_gscl CLK_PCLK_SMMU_GSCL1>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1410,9 +1410,9 @@ sysmmu_gscl2: sysmmu@13ca0000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x13ca0000 0x1000>;
>                         interrupts =3D <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_gscl CLK_ACLK_SMMU_GSCL2>,
>                                  <&cmu_gscl CLK_PCLK_SMMU_GSCL2>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_gscl>;
>                 };
> @@ -1421,9 +1421,9 @@ sysmmu_scaler_0: sysmmu@15040000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15040000 0x1000>;
>                         interrupts =3D <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER0>,
> -                               <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
> +                                <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER0>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1432,9 +1432,9 @@ sysmmu_scaler_1: sysmmu@15050000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15050000 0x1000>;
>                         interrupts =3D <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mscl CLK_ACLK_SMMU_M2MSCALER1>,
> -                               <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
> +                                <&cmu_mscl CLK_PCLK_SMMU_M2MSCALER1>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1443,9 +1443,9 @@ sysmmu_jpeg: sysmmu@15060000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15060000 0x1000>;
>                         interrupts =3D <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mscl CLK_ACLK_SMMU_JPEG>,
> -                               <&cmu_mscl CLK_PCLK_SMMU_JPEG>;
> +                                <&cmu_mscl CLK_PCLK_SMMU_JPEG>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mscl>;
>                 };
> @@ -1454,9 +1454,9 @@ sysmmu_mfc_0: sysmmu@15200000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15200000 0x1000>;
>                         interrupts =3D <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mfc CLK_ACLK_SMMU_MFC_0>,
> -                               <&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
> +                                <&cmu_mfc CLK_PCLK_SMMU_MFC_0>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mfc>;
>                 };
> @@ -1465,9 +1465,9 @@ sysmmu_mfc_1: sysmmu@15210000 {
>                         compatible =3D "samsung,exynos-sysmmu";
>                         reg =3D <0x15210000 0x1000>;
>                         interrupts =3D <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "aclk", "pclk";
>                         clocks =3D <&cmu_mfc CLK_ACLK_SMMU_MFC_1>,
> -                               <&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
> +                                <&cmu_mfc CLK_PCLK_SMMU_MFC_1>;
> +                       clock-names =3D "aclk", "pclk";
>                         #iommu-cells =3D <0>;
>                         power-domains =3D <&pd_mfc>;
>                 };
> @@ -1620,8 +1620,8 @@ adc: adc@14d10000 {
>                         compatible =3D "samsung,exynos5433-adc", "samsung=
,exynos7-adc";
>                         reg =3D <0x14d10000 0x100>;
>                         interrupts =3D <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
> -                       clock-names =3D "adc";
>                         clocks =3D <&cmu_peric CLK_PCLK_ADCIF>;
> +                       clock-names =3D "adc";
>                         #io-channel-cells =3D <1>;
>
>                         status =3D "disabled";
>
> --
> 2.53.0
>

