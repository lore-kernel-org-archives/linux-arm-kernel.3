Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A026106FD82
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usWIIk9dbk+WzTwF2qByIwW3dROKldfPMVwsNMlY308=; b=GyUu+VvHIvhGkg
	LU4fB+CJKdcs6ifXGCBVXoMU0TbZRpgmNDiIrotbTH5j9sHWmLy1+F0oSFlaMbifuczVRdpJhqkgq
	AFbj4Qfmhvw1z2h4GimA/FYKaW5tLKm0JH7Prf3mUtgZKhjnjwzUFalYHCN5rig1w91a16lItgUyL
	7I1H/tQtCQsKIM0isZ/qHxCRG5b0pAEIkcTmiu6Svwa0mkZ3ZGxbYt4OMJvcc/OAPa1BPpkxr47NH
	XoS83fhNcXsGUgNZLEdCFKe341Klyj91U6N3S6YOAItZJZPKk0EE7ajupAU0yVi2PfmBG8PFb9wlc
	s7OsMld03xwJ3bi/MZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vh9-0000000Gjsb-3sZ8;
	Fri, 13 Mar 2026 06:08:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vh8-0000000Gjrl-39F3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4190160130
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E973BC19424
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773382101;
	bh=orM5K8/7CHqa8T7Py1fyX7mMHWEfOFajrWwcTwGiGbo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=WM97ZEW/dU787GDBAOVCbEUV7wIXAuxHkjisG6RX7bDJmWx6rJpXUeZsZ33EmzATW
	 GbKfoc7u6z/r0qPatxS8Jx2MQiXxb96emzM1g1pK0uAF8Bh6K26vSbEr4zjwr8xyKN
	 k36RRr3eqMv+WDbgSo0JdvBOM89Take9aeHKfMy68XNIX7YWQv0G9OeK/o8J9GY8al
	 nRwbMDmMJ/MvKVrRe1WIKtCs9obZGJXh2UY0RjvxohbXiMwnI3w0XHHIsunscDjh4I
	 k7bew+KDGLN6/57RMIc0cnvDds+b35s2LNrHRHqzhtZJaCAh5YN/bMeWay17j14dGR
	 a+t3bK/seWkCQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a46657a9fso18462761fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 23:08:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWB9HJzOA/XHd8z4UIKRJWw1e+SBIrY4TpihfySXymMnJgXZ/v5vJfOOfi/nXaoj5f3Hq9e4lVQzf4Bnkvq/Wjl@lists.infradead.org
X-Gm-Message-State: AOJu0YzI6jrikHVzHnvYS655v7cri//4k67qON0zqd5DemmYb2bqkbpz
	t4LmBMm09KdeSr2yxZA+zGLGRzvQpZ+i43Y9AP5m2z/zrRkNCkRkhCxGJk4URkrHX2q56visGip
	SoCT5PGXHAi+CkuDxkUy0ZaYBiDpCGrQ=
X-Received: by 2002:a2e:8a86:0:b0:387:2df:f3ee with SMTP id
 38308e7fff4ca-38a8978752fmr6557441fa.33.1773382099086; Thu, 12 Mar 2026
 23:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260313020823.1592389-1-sherry.sun@nxp.com> <20260313020823.1592389-7-sherry.sun@nxp.com>
In-Reply-To: <20260313020823.1592389-7-sherry.sun@nxp.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 13 Mar 2026 14:08:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65dvWRqugwBAORB_dD+3Part+OieCe9hnSR781g-6NgZA@mail.gmail.com>
X-Gm-Features: AaiRm52-YD_vTip-QztGRiYxgL7k6zRpm-Clb44P3TJreIxPFicxmd8vkCMHT1k
Message-ID: <CAGb2v65dvWRqugwBAORB_dD+3Part+OieCe9hnSR781g-6NgZA@mail.gmail.com>
Subject: Re: [PATCH V8 06/13] arm: dts: imx6qdl: Add Root Port node and PERST property
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com, 
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Mar 13, 2026 at 10:08=E2=80=AFAM Sherry Sun <sherry.sun@nxp.com> wr=
ote:
>
> Since describing the PCIe PERST# property under Host Bridge node is now
> deprecated, it is recommended to add it to the Root Port node, so
> creating the Root Port node and add the reset-gpios property in Root
> Port.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi |  5 +++++
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi         | 11 +++++++++++
>  arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts |  5 +++++
>  3 files changed, 21 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/bo=
ot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> index ba29720e3f72..fe9046c03ddd 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
> @@ -754,11 +754,16 @@ lvds0_out: endpoint {
>  &pcie {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_pcie>;
> +       /* This property is deprecated, use reset-gpios from the Root Por=
t node. */
>         reset-gpio =3D <&gpio7 12 GPIO_ACTIVE_LOW>;

I'd say just remove the old description.

You're asking for trouble by describing the same thing in two different pla=
ces.

>         vpcie-supply =3D <&reg_pcie>;

I would probably also take this chance to just convert to the proper PCI
slot supply, and just add pwrctrl support into your PCIe driver.


>         status =3D "okay";
>  };
>
> +&pcie_port0 {
> +       reset-gpios =3D <&gpio7 12 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pwm1 {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_pwm1>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/n=
xp/imx/imx6qdl.dtsi
> index 4dc2c410cf61..9438862b9927 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> @@ -302,6 +302,17 @@ pcie: pcie@1ffc000 {
>                                  <&clks IMX6QDL_CLK_PCIE_REF_125M>;
>                         clock-names =3D "pcie", "pcie_bus", "pcie_phy";
>                         status =3D "disabled";
> +
> +                       pcie_port0: pcie@0 {
> +                               compatible =3D "pciclass,0604";
> +                               device_type =3D "pci";
> +                               reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +                               bus-range =3D <0x01 0xff>;
> +
> +                               #address-cells =3D <3>;
> +                               #size-cells =3D <2>;
> +                               ranges;
> +                       };
>                 };
>
>                 aips1: bus@2000000 { /* AIPS1 */
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts b/arch/arm/bo=
ot/dts/nxp/imx/imx6qp-sabreauto.dts
> index c5b220aeaefd..6b12cab7175f 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts
> @@ -45,10 +45,15 @@ MX6QDL_PAD_GPIO_6__ENET_IRQ         0x000b1
>  };
>
>  &pcie {
> +       /* This property is deprecated, use reset-gpios from the Root Por=
t node. */
>         reset-gpio =3D <&max7310_c 5 GPIO_ACTIVE_LOW>;
>         status =3D "okay";
>  };
>
> +&pcie_port0 {
> +       reset-gpios =3D <&max7310_c 5 GPIO_ACTIVE_LOW>;
> +};
> +
>  &sata {
>         status =3D "okay";
>  };
> --
> 2.37.1
>
>

