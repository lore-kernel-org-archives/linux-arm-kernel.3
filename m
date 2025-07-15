Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B089C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA5gdyFg1uZV5+jdJaA/+N++eUsrCQesqrVksX5qS1Q=; b=XuKUAQT/D/PQF+7IxfwiNamyGm
	TbeKTAHoNCgv00dSpNaJQfTOJ21kCNiT2BFjx7Lqn3KEDAS44cP2RShX960dwY89GI1x55leJfKkV
	NV3dYX6z1HON/NGy3vM1wEPkqC/LhxD/xsDRojisioSb8upsA/Z5mfRjmx8WZZGLiHtXO+ER69Ebw
	02lV8xxe7Kn3YC/rjqxp+D4ENSYR2nINvg7mQYPG0ZsTVkBkfFd/rDoUoG1ByDSYJqD0GsI2RRutJ
	LD18rACnkxkW1vq0MshOQ47YEBipbUAwrrlMf6m5KiYTSXLltHCDip8OZ811NvhVF4kMShXeta8Kq
	cnFS66pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl70-00000005y15-15pJ;
	Tue, 15 Jul 2025 19:14:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhWt-00000005aOs-3PIL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF30A465E1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87A0C4CEFA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752593113;
	bh=+iZhsBUWZSulP41RkMskAokjoebc7RkoZj+v+sID3+g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YoOGDjgFRp7HK1g5v9jpXVwss1E7P+fld3vFuN3PW900mdZ2CIwKK2cp5ZcvL7d0y
	 9rRd/bpND3G2dqZehY4LWofXABaXOQgm/nb+1xttzDLiQjJdi5jL7ugbavQg82q+3b
	 AGBvubAtgWiE5n5to9Jx9ziV0YD1VxPMz4+BkxJn+IGMoVDb1XsES5DIOQuW/g9a5t
	 duyU3WBsecV2D7qMPMaSHGSfgsD4D9rm3fTl6t2UqTys7O3DyAr/2W7dAETILAdjRa
	 qEMQr+XDIkQVK93cS4IC2Fftunhcd514xknZWlivvD4vvMxF9CcGIbO9BGGbOCqsBs
	 9dEzTc4bNiYtA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1131576566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:25:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+ySdNdXHdMtgQhI+7Mff/OmcPdy1ufVXOOBsBju6diZ2C5JCLOlwq6Z4j7hyQCFqYa+NK9xCGc53Irw+y5X1z@lists.infradead.org
X-Gm-Message-State: AOJu0YykfJboi08C3oiX6pfWkCs/4zmolwqqLKWGrz/cMXWAVaOsiotd
	sy9d1XBCeUlvaBIv2+zmmXw9xsiqu4IV0EOTl16LKcl9tNVwNmhOkRx2hR7k1NvYjA41qng62lR
	eart5q+4QenXtRmlxaADqDMpIMb3LVA==
X-Google-Smtp-Source: AGHT+IFhI1Gf1QWnLIvPSTSWf4gnALh46fJcdiVacHnkECq+ju3RTb7CbKGPKrz2qlxBZ7zAD9wzoI4qtasBTfMiC+U=
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id
 a640c23a62f3a-ae6fcbc35bfmr1706242066b.30.1752593112041; Tue, 15 Jul 2025
 08:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com> <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
In-Reply-To: <20250715034320.2553837-7-jacky_chou@aspeedtech.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 10:25:00 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
X-Gm-Features: Ac12FXx6Zdty1kF4V51gulFmHIQBgnZZ8rlts-SPK0sS7WQh8WbpLuYAl_mXY8I
Message-ID: <CAL_JsqJ4yeYGAyCwHi=4CBurxGOc5oAqTQqun+5+Ps4hxwDU9Q@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ARM: dts: aspeed-g6: Add PCIe RC node
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_082515_890621_4619DA3E 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Jul 14, 2025 at 10:43=E2=80=AFPM Jacky Chou <jacky_chou@aspeedtech.=
com> wrote:
>
> The AST2600 has one PCIe RC, and add the relative configure regmap.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 61 +++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/=
aspeed/aspeed-g6.dtsi
> index 8ed715bd53aa..ed99780b6860 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
> @@ -379,6 +379,67 @@ rng: hwrng@1e6e2524 {
>                                 quality =3D <100>;
>                         };
>
> +                       pcie_phy1: syscon@1e6ed200 {
> +                               compatible =3D "aspeed,pcie-phy", "syscon=
";
> +                               reg =3D <0x1e6ed200 0x100>;

This looks like part of something else? It should be a child of that.

If this is the controls for the PCIe PHY, then use the PHY binding
instead of your own custom phandle property.

> +                       };
> +
> +                       pcie_cfg: syscon@1e770000 {
> +                               compatible =3D "aspeed,pcie-cfg", "syscon=
";
> +                               reg =3D <0x1e770000 0x80>;

Looks like this is really part of the PCIe block as a h/w block isn't
going to start at offset 0xc0.


> +                       };
> +
> +                       pcie0: pcie@1e7700c0 {
> +                               compatible =3D "aspeed,ast2600-pcie";
> +                               device_type =3D "pci";
> +                               reg =3D <0x1e7700c0 0x40>;
> +                               linux,pci-domain =3D <0>;

No need for this. You only have 1 PCI host.

> +                               #address-cells =3D <3>;
> +                               #size-cells =3D <2>;
> +                               interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVE=
L_HIGH>;
> +                               bus-range =3D <0x80 0xff>;

Does this h/w not support bus 0-0x7f for some reason?

> +
> +                               ranges =3D <0x01000000 0x0 0x00018000 0x0=
0018000 0x0 0x00008000
> +                                         0x02000000 0x0 0x70000000 0x700=
00000 0x0 0x10000000>;
> +
> +                               status =3D "disabled";
> +
> +                               resets =3D <&syscon ASPEED_RESET_H2X>;
> +                               reset-names =3D "h2x";
> +
> +                               #interrupt-cells =3D <1>;
> +                               msi-parent =3D <&pcie0>;
> +                               msi-controller;
> +
> +                               aspeed,ahbc =3D <&ahbc>;
> +                               aspeed,pciecfg =3D <&pcie_cfg>;
> +
> +                               interrupt-map-mask =3D <0 0 0 7>;
> +                               interrupt-map =3D <0 0 0 1 &pcie_intc0 0>=
,
> +                                               <0 0 0 2 &pcie_intc0 1>,
> +                                               <0 0 0 3 &pcie_intc0 2>,
> +                                               <0 0 0 4 &pcie_intc0 3>;
> +                               pcie_intc0: interrupt-controller {
> +                                       interrupt-controller;
> +                                       #address-cells =3D <0>;
> +                                       #interrupt-cells =3D <1>;
> +                               };
> +
> +                               pcie@8,0 {
> +                                       reg =3D <0x804000 0 0 0 0>;
> +                                       #address-cells =3D <3>;
> +                                       #size-cells =3D <2>;
> +                                       device_type =3D "pci";
> +                                       resets =3D <&syscon ASPEED_RESET_=
PCIE_RC_O>;
> +                                       reset-names =3D "perst";
> +                                       clocks =3D <&syscon ASPEED_CLK_GA=
TE_BCLK>;
> +                                       pinctrl-names =3D "default";
> +                                       pinctrl-0 =3D <&pinctrl_pcierc1_d=
efault>;
> +                                       aspeed,pciephy =3D <&pcie_phy1>;
> +                                       ranges;
> +                               };
> +                       };
> +
>                         gfx: display@1e6e6000 {
>                                 compatible =3D "aspeed,ast2600-gfx", "sys=
con";
>                                 reg =3D <0x1e6e6000 0x1000>;
> --
> 2.43.0
>

