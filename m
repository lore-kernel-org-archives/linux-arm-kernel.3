Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6615FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3m4melpCnWzZDkoEQyxDqJTJzU6ez2FlTtIyhuPHGY=; b=qoj7qYt7se32org8CVticwYsmo
	EvSRGo1j2yI5joRCmEUAmp0ci90v+furyt4lJ9ur4OV0zU/8u8xVS58e1UpY65ni4zd50pXwAtFpH
	4tA4UZ8/TMBx44Sr2bz0ASxRjkvN/RkoNCluHjzJbczpqtsQApdIvKG5Z7WnGgUWzwh+2Mxz8gWfw
	tAhfZyqMQD8oLH+XYUoLajQW0RzmnTW6U+oxeZAzPv4FitwZ6oVgkBReZGCa5YLjMZmkVDUGtvkFX
	O77CJEULWmlfJyDJvrPZIYtNFd+z4hwf2me5cgK9CZiLFbmY12AkBSMK/fhDtBltIzcsGoteyD8x2
	8rpui1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVSm-0000000D4cG-3dal;
	Mon, 24 Feb 2025 10:13:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVJG-0000000D2Fl-0GZh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:03:35 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-548430564d9so1810906e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740391411; x=1740996211; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3m4melpCnWzZDkoEQyxDqJTJzU6ez2FlTtIyhuPHGY=;
        b=gk+PRdUMRcRk02lSFGltnkqY8SW9FlfCxxl+2a5YGkKffy5v52NSGDSEPvOdCNzHC0
         L/hA2rgGRhu9eHXGIGnAL0mPWpnuMx49ot//TpPOLR4eMPIGb/Wu/wqt5JDWI6AvJX3d
         KpwQldNhtBFo5polKNR/FVOuJNTyixkvJaokc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391411; x=1740996211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3m4melpCnWzZDkoEQyxDqJTJzU6ez2FlTtIyhuPHGY=;
        b=IA168sPZSaKtTTzsiWge2SG//OJxyebJlvtZLpqwFgasPbMxDBBDMQkYT44tYJdIQo
         Nm7Vxg5g7lKHQGEmzxq+BxAQ7eV39IK+xpCLJ4J9kkoPu6z5kMqM//E7VMFdyqFF1dsB
         0jTwnkBoELdAyT4BUCxT9SDdNjnmmpr06xQL/w6CCgi0xjkYO/RdLbUCY+85PXccpMMI
         JLp55MROYkaKxHSDIRIjIIiJTHAm8ewTrw2pCuDuiWj9lBJxN8qFnc5ab7njescaGXY+
         0mhIy6SZT682hUcE1q1C8ky3TMvMUcYfGc/aYy3MSneSY2+9++Fp4Td4DafwLPhR30UJ
         qQVw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqAB75VOWBntLg3AV1ofFZGnbPAGwbS1W7nLJ8+XGn7Bf0DF6bfyX8HeKkRRRwpvK0aY1EFsHO9+JyzcUadAs@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGhzblBcGZxRPvKviloBKrnsDPGGGYVhwPbsfm2qNt79vih95
	1uy7AGLPCVvCdAJVfxeC9PIT4MMdalRtvOtdMUCCGq1Jbd9B+gt50kmPl43V0A11V4xnCfnbX5S
	fBOEdqj8I3Hfjuj2pOFO37F40exQY+4gbJ+ic
X-Gm-Gg: ASbGncvEwlSQjRpdYRp1JmNImBRZH9uZu4cCRJRZAvsI1zFRGUo2zC9HcvhPn0egcpt
	Sxai098imQAquMTboc7lKhGP5nDbfQSeAYS+4hqwBIxh4rQdqu+vux0hyIZsZZQjw4V0wURr5Bn
	Tejt+NXZ1Te4Hvvcd80/KxO7PtiQFCAp5waZA=
X-Google-Smtp-Source: AGHT+IH+opPQW01wmcpoFizx1l90WyOFRxctvcV9XH9wP9MyBr4k33vvvZ5yfnEZS/CIdmIFOBzQKToLr4utqj99bzA=
X-Received: by 2002:a05:6512:b1f:b0:545:8a1:5377 with SMTP id
 2adb3069b0e04-54839129b32mr3995806e87.2.1740391411500; Mon, 24 Feb 2025
 02:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20250220105514.43107-1-angelogioacchino.delregno@collabora.com> <20250220105514.43107-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250220105514.43107-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Feb 2025 18:03:20 +0800
X-Gm-Features: AWEUYZlFd5lIJJaJ8GXCoFcPly7FtrF4vnwbpBvHnY7fIIWUD-kvOn2uGY2D4Ss
Message-ID: <CAGXv+5E-mrt2o=b_nxmCdJqX9XbOhWsS+pLzkApS57EKD6kHEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: mediatek: mt8188: Add MTU3 nodes and
 correctly describe USB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com, pablo.sun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_020334_110563_4FBEDAF4 
X-CRM114-Status: GOOD (  17.62  )
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

On Thu, Feb 20, 2025 at 7:00=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MT8188 SoC has three USB controllers, and all of them are behind
> the MTU3 DRD controller.
>
> Add the missing MTU3 nodes, default disabled, for all USB controllers
> and move the related XHCI nodes to be children of their MTU3 DRD to
> correctly describe the SoC.
>
> In order to retain USB functionality on all of the MT8188 and MT8390
> boards, also move the vusb33 supply and enable the relevant MTU3 nodes
> with special attention to the MT8188 Geralt Chromebooks, where it was
> necessary to set the dr_mode of all MTU3 controllers to host to avoid
> interfering with the EC performing DRD on its own.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on MT8188 Ciri

> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      |  18 +++
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      | 121 ++++++++++++------
>  .../dts/mediatek/mt8390-genio-common.dtsi     |  28 ++++
>  3 files changed, 125 insertions(+), 42 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index b6abecbcfa81..faed5c8bc721 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -1103,6 +1103,12 @@ &u3phy2 {
>  };
>
>  /* USB detachable base */
> +&ssusb0 {
> +       dr_mode =3D "host";
> +       vusb33-supply =3D <&pp3300_s3>;
> +       status =3D "okay";
> +};
> +
>  &xhci0 {
>         /* controlled by EC */
>         vbus-supply =3D <&pp3300_z1>;
> @@ -1110,6 +1116,12 @@ &xhci0 {
>  };
>
>  /* USB3 hub */
> +&ssusb1 {
> +       dr_mode =3D "host";
> +       vusb33-supply =3D <&pp3300_s3>;
> +       status =3D "okay";
> +};
> +
>  &xhci1 {
>         vusb33-supply =3D <&pp3300_s3>;
>         vbus-supply =3D <&pp5000_usb_vbus>;
> @@ -1117,6 +1129,12 @@ &xhci1 {
>  };
>
>  /* USB BT */
> +&ssusb2 {
> +       dr_mode =3D "host";
> +       vusb33-supply =3D <&pp3300_s3>;
> +       status =3D "okay";
> +};
> +
>  &xhci2 {
>         /* no power supply since MT7921's power is controlled by PCIe */
>         /* MT7921's USB BT has issues with USB2 LPM */
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index d2e1ff7236b1..c226998b7e47 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1649,6 +1649,38 @@ spi5: spi@11019000 {
>                         status =3D "disabled";
>                 };
>
> +               ssusb1: usb@11201000 {
> +                       compatible =3D "mediatek,mt8188-mtu3", "mediatek,=
mtu3";
> +                       reg =3D <0 0x11201000 0 0x2dff>, <0 0x11203e00 0 =
0x0100>;
> +                       reg-names =3D "mac", "ippc";
> +                       ranges =3D <0 0 0 0x11200000 0 0x3f00>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       interrupts =3D <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP>;
> +                       assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>;
> +                       clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
> +                                <&topckgen CLK_TOP_SSUSB_TOP_REF>,
> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
> +                       clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> +                       phys =3D <&u2port1 PHY_TYPE_USB2>, <&u3port1 PHY_=
TYPE_USB3>;
> +                       wakeup-source;
> +                       mediatek,syscon-wakeup =3D <&pericfg 0x468 2>;
> +                       status =3D "disabled";
> +
> +                       xhci1: usb@0 {
> +                               compatible =3D "mediatek,mt8188-xhci", "m=
ediatek,mtk-xhci";
> +                               reg =3D <0 0 0 0x1000>;
> +                               reg-names =3D "mac";
> +                               interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               assigned-clocks =3D <&topckgen CLK_TOP_SS=
USB_XHCI>;
> +                               assigned-clock-parents =3D <&topckgen CLK=
_TOP_UNIVPLL_D5_D4>;
> +                               clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB=
_XHCI>;
> +                               clock-names =3D "sys_ck";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 eth: ethernet@11021000 {
>                         compatible =3D "mediatek,mt8188-gmac", "mediatek,=
mt8195-gmac",
>                                      "snps,dwmac-5.10a";
> @@ -1746,27 +1778,6 @@ queue3 {
>                         };
>                 };
>
> -               xhci1: usb@11200000 {
> -                       compatible =3D "mediatek,mt8188-xhci", "mediatek,=
mtk-xhci";
> -                       reg =3D <0 0x11200000 0 0x1000>,
> -                             <0 0x11203e00 0 0x0100>;
> -                       reg-names =3D "mac", "ippc";
> -                       interrupts =3D <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0=
>;
> -                       phys =3D <&u2port1 PHY_TYPE_USB2>,
> -                              <&u3port1 PHY_TYPE_USB3>;
> -                       assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP>,
> -                                         <&topckgen CLK_TOP_SSUSB_XHCI>;
> -                       assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>,
> -                                                <&topckgen CLK_TOP_UNIVP=
LL_D5_D4>;
> -                       clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
> -                                <&topckgen CLK_TOP_SSUSB_TOP_REF>,
> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
> -                       clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> -                       mediatek,syscon-wakeup =3D <&pericfg 0x468 2>;
> -                       wakeup-source;
> -                       status =3D "disabled";
> -               };
> -
>                 mmc0: mmc@11230000 {
>                         compatible =3D "mediatek,mt8188-mmc", "mediatek,m=
t8183-mmc";
>                         reg =3D <0 0x11230000 0 0x10000>,
> @@ -1867,42 +1878,68 @@ imp_iic_wrap_c: clock-controller@11283000 {
>                         #clock-cells =3D <1>;
>                 };
>
> -               xhci2: usb@112a0000 {
> -                       compatible =3D "mediatek,mt8188-xhci", "mediatek,=
mtk-xhci";
> -                       reg =3D <0 0x112a0000 0 0x1000>,
> -                             <0 0x112a3e00 0 0x0100>;
> +               ssusb2: usb@112a1000 {
> +                       compatible =3D "mediatek,mt8188-mtu3", "mediatek,=
mtu3";
> +                       reg =3D <0 0x112a1000 0 0x2dff>, <0 0x112a3e00 0 =
0x0100>;
>                         reg-names =3D "mac", "ippc";
> -                       interrupts =3D <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0=
>;
> -                       phys =3D <&u2port2 PHY_TYPE_USB2>;
> -                       assigned-clocks =3D <&topckgen CLK_TOP_SSUSB_XHCI=
_3P>,
> -                                         <&topckgen CLK_TOP_USB_TOP_3P>;
> -                       assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>,
> -                                                <&topckgen CLK_TOP_UNIVP=
LL_D5_D4>;
> +                       ranges =3D <0 0 0 0x112a0000 0 0x3f00>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       interrupts =3D <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       assigned-clocks =3D <&topckgen CLK_TOP_USB_TOP_3P=
>;
> +                       assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>;
>                         clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>=
,
>                                  <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
>                                  <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
>                         clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> +                       phys =3D <&u2port2 PHY_TYPE_USB2>;
> +                       wakeup-source;
> +                       mediatek,syscon-wakeup =3D <&pericfg 0x470 2>;
>                         status =3D "disabled";
> +
> +                       xhci2: usb@0 {
> +                               compatible =3D "mediatek,mt8188-xhci", "m=
ediatek,mtk-xhci";
> +                               reg =3D <0 0 0 0x1000>;
> +                               reg-names =3D "mac";
> +                               interrupts =3D <GIC_SPI 536 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               assigned-clocks =3D <&topckgen CLK_TOP_SS=
USB_XHCI_3P>;
> +                               assigned-clock-parents =3D <&topckgen CLK=
_TOP_UNIVPLL_D5_D4>;
> +                               clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB=
_3P_XHCI>;
> +                               clock-names =3D "sys_ck";
> +                               status =3D "disabled";
> +                       };
>                 };
>
> -               xhci0: usb@112b0000 {
> -                       compatible =3D "mediatek,mt8188-xhci", "mediatek,=
mtk-xhci";
> -                       reg =3D <0 0x112b0000 0 0x1000>,
> -                             <0 0x112b3e00 0 0x0100>;
> +               ssusb0: usb@112b1000 {
> +                       compatible =3D "mediatek,mt8188-mtu3", "mediatek,=
mtu3";
> +                       reg =3D <0 0x112b1000 0 0x2dff>, <0 0x112b3e00 0 =
0x0100>;
>                         reg-names =3D "mac", "ippc";
> -                       interrupts =3D <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0=
>;
> -                       phys =3D <&u2port0 PHY_TYPE_USB2>;
> -                       assigned-clocks =3D <&topckgen CLK_TOP_SSUSB_XHCI=
_2P>,
> -                                         <&topckgen CLK_TOP_USB_TOP_2P>;
> -                       assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>,
> -                                                <&topckgen CLK_TOP_UNIVP=
LL_D5_D4>;
> +                       ranges =3D <0 0 0 0x112b0000 0 0x3f00>;
> +                       #address-cells =3D <2>;
> +                       #size-cells =3D <2>;
> +                       interrupts =3D <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0=
>;
> +                       assigned-clocks =3D <&topckgen CLK_TOP_SSUSB_XHCI=
_2P>;
> +                       assigned-clock-parents =3D <&topckgen CLK_TOP_UNI=
VPLL_D5_D4>;
>                         clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>=
,
>                                  <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
>                                  <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
>                         clock-names =3D "sys_ck", "ref_ck", "mcu_ck";
> -                       mediatek,syscon-wakeup =3D <&pericfg 0x460 2>;
> +                       phys =3D <&u2port0 PHY_TYPE_USB2>;
>                         wakeup-source;
> +                       mediatek,syscon-wakeup =3D <&pericfg 0x460 2>;
>                         status =3D "disabled";
> +
> +                       xhci0: usb@0 {
> +                               compatible =3D "mediatek,mt8188-xhci", "m=
ediatek,mtk-xhci";
> +                               reg =3D <0 0 0 0x1000>;
> +                               reg-names =3D "mac";
> +                               interrupts =3D <GIC_SPI 533 IRQ_TYPE_LEVE=
L_HIGH 0>;
> +                               assigned-clocks =3D <&topckgen CLK_TOP_US=
B_TOP_2P>;
> +                               assigned-clock-parents =3D <&topckgen CLK=
_TOP_UNIVPLL_D5_D4>;
> +                               clocks =3D <&pericfg_ao CLK_PERI_AO_SSUSB=
_2P_XHCI>;
> +                               clock-names =3D "sys_ck";
> +                               status =3D "disabled";
> +                       };
>                 };
>
>                 pcie: pcie@112f0000 {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index a37cf102a6e9..fd977daa4185 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -1011,13 +1011,25 @@ &u3phy2 {
>         status =3D "okay";
>  };
>
> +&ssusb0 {
> +       dr_mode =3D "host";
> +       vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> +       status =3D "okay";
> +};
> +
>  &xhci0 {
>         status =3D "okay";
> +};
> +
> +&ssusb1 {
> +       dr_mode =3D "host";
>         vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> +       status =3D "okay";
>  };
>
>  &xhci1 {
>         status =3D "okay";
> +       vdd-supply =3D <&usb_hub_fixed_3v3>;
>         vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
> @@ -1037,6 +1049,22 @@ hub_3_0: hub@2 {
>                 reset-gpios =3D <&pio 7 GPIO_ACTIVE_HIGH>;
>                 vdd-supply =3D <&usb_hub_fixed_3v3>;
>         };
> +
> +       port {
> +               xhci_ss_ep: endpoint {
> +                       remote-endpoint =3D <&typec_con_ss>;
> +               };
> +       };
> +};
> +
> +&ssusb2 {
> +       interrupts-extended =3D <&gic GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>,
> +                             <&pio 220 IRQ_TYPE_LEVEL_HIGH>;
> +       interrupt-names =3D "host", "wakeup";
> +
> +       dr_mode =3D "host";
> +       vusb33-supply =3D <&mt6359_vusb_ldo_reg>;
> +       status =3D "okay";
>  };
>
>  &xhci2 {
> --
> 2.48.1
>
>

