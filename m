Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C85D30CC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 20:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3PB19UpbesWMeT0R3+l59gQeDUb0GCMAUDX3FFcChs=; b=V6PqscS+etAJFNpJpmQYt2cZVY
	oG+T6YfLmHZVYEFiumLblimR5p5++mSXM3ZeOXpUKQYyd3wygA3FWXr8JOkVByCJH5FXQ4yQu56po
	O5Ws+9SL7aUlvD29Ix8ncIBvXfvKMU6AgaFjWX+c495/XZO/0bPws5DL0W/Rxyjxt7UNn0jQM29rr
	FPQ77FhyBmcDWnfzbI2iYwy45Qc8faqPV5IY6U6L5vSA/w3VXBgDurKpcSKDzfUe+qNXx0k+woizm
	m8/+vjcihcmhBCGyUER0o0laROngMbh9q7PvcSeX8WpkZFpxtzvedWnGLXb4dVh8h/T7KueskJ8Da
	/wRl/ibQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfkiB-00000007fau-2rOF;
	Tue, 13 Jan 2026 20:09:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfki9-00000007faX-1JQB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 20:09:54 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b87003e998bso31425466b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 12:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768334991; x=1768939791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3PB19UpbesWMeT0R3+l59gQeDUb0GCMAUDX3FFcChs=;
        b=OyVEqHBpYn+VzhLI/Bfwhfc1wGniUTiehpZWfPQaL6q6E/pkJE3ZoGj497J4kYIUey
         Hsqv/J3cJlhRwdJIjfqN8N3iZt3wrbGS+zKVwnADi94HgNCFgqW/EpEDPt7dpyLmVCCw
         Lr+/f1UuAUFAi63G/G7V1Pt1xiK/ygz+n5KTQs2EaRnZXZg5CAzCdi3eDPRivbGVZlWk
         KAgtHjnGEOJHjRD8lIayDsHGKGVGTRM/m8xZpKC0rNT2MDdxLIrvAmvv94wz/87DnUjo
         hicmTg1CeBGtebAikxX1TdAE2uiv3LFnQ371oJfwSdcHz8BKaGSB56ckmhzFx0+CHPeQ
         7clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768334991; x=1768939791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3PB19UpbesWMeT0R3+l59gQeDUb0GCMAUDX3FFcChs=;
        b=iyLgNCF9GLvxXD7+nD2fhWoUMOQrm0mNN9/s9OXOwI5A4Q9MHLo9UwjNo8aulCrV3T
         Y5xuTge8+7G5lJPvXH+jbMzgzTb06ZxE6mhXPLvqMw3p9iLL5TMbt22GEgK+wS5CoF5g
         9/yhtJ6+dpNfqopx6gtxY67WRCtGGLBQ66ry2YnYoSSa4VNrxTFxG1Gwq101pP7Fc/ka
         a+lCSn6JLz9/vjT6HQbRmRR3epnNcoG5uo/vN+xXFlBWxKpE06lSfUPKskLA8Rr3cAhk
         /vpkRYVQL6UdIp99RcWO5+RFp1x76NHDfMKGYNtyd/Ty2+A1Ua/8oSCm/NCGiPzd7YSg
         R6tw==
X-Forwarded-Encrypted: i=1; AJvYcCXdBJvWy9cu57a/41T+rN835ddAijysJGLBvNV76ltUopVs3Qhm6QkGncn3Kez8cW3fU38HH955Yc7yZOElgg5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YywTojkLZjql1HWbVUgNIJ5EWE2wljugCMXejrwv1XjmigaW0PE
	HiJEI8wPW1zR/R5vHaubq4Vh6o4YcUn9J4C/Ob2nqx4UTNgJd52rdh1VIjBLG+NI/nUKHTkwW4A
	e30PmQyRBesnaDEwPbL35r1Nm6vx891Xti7NgqHnunQ==
X-Gm-Gg: AY/fxX65om/eC7TNFusN2mBKTCstZ5IQnoZZh6QXUa/eJf3l82q1/SMInrLmGraqu0X
	fAHsUGFf/ABrJ76gXVoAmTyAWVEOzoO/FfNY1tXvrYuR0GD3UK84EjEvi6BL+H/nxCfZemUYiDA
	v/yO4PD+iYv0EszZhuEuFQo2nl/cnpKzcn5rBp4zp/tkvB5a4JqDJobZ9K1OnUomvTEV3Q6eYdg
	0Vc5rHWcuq/JrJGeR1Q0S3BStwECL0WiOrIKhQWNXLtgubB3dYx4jHWR5DcSOIMiZhXP/1eYSM4
	EZy4Pc2mTuvmBgXutX/tPul+vWq714cIJX1Sy6vCS0hOOVyHh5hx2JKJFd87
X-Received: by 2002:a17:907:9483:b0:b87:191f:4fab with SMTP id
 a640c23a62f3a-b8761d928b1mr18947166b.26.1768334991113; Tue, 13 Jan 2026
 12:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-16-robert.marko@sartura.hr> <858ca139-61c5-45e3-a2c9-d0af414e3592@tuxon.dev>
In-Reply-To: <858ca139-61c5-45e3-a2c9-d0af414e3592@tuxon.dev>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 13 Jan 2026 21:09:40 +0100
X-Gm-Features: AZwV_QhCSNrQ25JXSm6moAYHvYjCfUUDQoR1FC1MV_mP0oSiXaM4vWsMWx6MKV0
Message-ID: <CA+HBbNFYBhtvUxd45O7eP_1JYENxeGZOkA+yUsEdztOSSi9Gdg@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] arm64: dts: microchip: add EV23X71A board
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.org, lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_120953_398783_D1AA5D05 
X-CRM114-Status: GOOD (  26.82  )
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

On Sun, Jan 11, 2026 at 3:42=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
>
> Hi, Robert,
>
> On 12/29/25 20:37, Robert Marko wrote:
> > Microchip EV23X71A is an LAN9696 based evaluation board.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > * Split from SoC DTSI commit
> > * Apply DTS coding style
> > * Enclose array in i2c-mux
> > * Alphanumericaly sort nodes
> > * Change management port mode to RGMII-ID
> >
> >   arch/arm64/boot/dts/microchip/Makefile        |   1 +
> >   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 +++++++++++++++++=
+
> >   2 files changed, 758 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> >
> > diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/d=
ts/microchip/Makefile
> > index c6e0313eea0f..09d16fc1ce9a 100644
> > --- a/arch/arm64/boot/dts/microchip/Makefile
> > +++ b/arch/arm64/boot/dts/microchip/Makefile
> > @@ -1,4 +1,5 @@
> >   # SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_LAN969X) +=3D lan9696-ev23x71a.dtb
> >   dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb125.dtb
> >   dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb134.dtb sparx5_pcb134_emmc.d=
tb
> >   dtb-$(CONFIG_ARCH_SPARX5) +=3D sparx5_pcb135.dtb sparx5_pcb135_emmc.d=
tb
> > diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/=
arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> > new file mode 100644
> > index 000000000000..435df455b078
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
>
> [ ...]
>
> > +&gpio {
> > +     emmc_sd_pins: emmc-sd-pins {
> > +             /* eMMC_SD - CMD, CLK, D0, D1, D2, D3, D4, D5, D6, D7, RS=
TN */
> > +             pins =3D "GPIO_14", "GPIO_15", "GPIO_16", "GPIO_17",
> > +                    "GPIO_18", "GPIO_19", "GPIO_20", "GPIO_21",
> > +                    "GPIO_22", "GPIO_23", "GPIO_24";
> > +             function =3D "emmc_sd";
> > +     };
> > +
> > +     fan_pins: fan-pins {
> > +             pins =3D "GPIO_25", "GPIO_26";
> > +             function =3D "fan";
> > +     };
> > +
> > +     fc0_pins: fc0-pins {
> > +             pins =3D "GPIO_3", "GPIO_4";
> > +             function =3D "fc";
> > +     };
> > +
> > +     fc2_pins: fc2-pins {
> > +             pins =3D "GPIO_64", "GPIO_65", "GPIO_66";
> > +             function =3D "fc";
> > +     };
> > +
> > +     fc3_pins: fc3-pins {
> > +             pins =3D "GPIO_55", "GPIO_56";
> > +             function =3D "fc";
> > +     };
> > +
> > +     mdio_pins: mdio-pins {
> > +             pins =3D "GPIO_9", "GPIO_10";
> > +             function =3D "miim";
> > +     };
> > +
> > +     mdio_irq_pins: mdio-irq-pins {
> > +             pins =3D "GPIO_11";
> > +             function =3D "miim_irq";
> > +     };
> > +
> > +     sgpio_pins: sgpio-pins {
> > +             /* SCK, D0, D1, LD */
> > +             pins =3D "GPIO_5", "GPIO_6", "GPIO_7", "GPIO_8";
> > +             function =3D "sgpio_a";
> > +     };
> > +
> > +     usb_ulpi_pins: usb-ulpi-pins {
> > +             pins =3D "GPIO_30", "GPIO_31", "GPIO_32", "GPIO_33",
> > +                    "GPIO_34", "GPIO_35", "GPIO_36", "GPIO_37",
> > +                    "GPIO_38", "GPIO_39", "GPIO_40", "GPIO_41";
> > +             function =3D "usb_ulpi";
> > +     };
> > +
> > +     usb_rst_pins: usb-rst-pins {
> > +             pins =3D "GPIO_12";
> > +             function =3D "usb2phy_rst";
> > +     };
> > +
> > +     usb_over_pins: usb-over-pins {
> > +             pins =3D "GPIO_13";
> > +             function =3D "usb_over_detect";
> > +     };
> > +
> > +     usb_power_pins: usb-power-pins {
> > +             pins =3D "GPIO_1";
> > +             function =3D "usb_power";
> > +     };
> > +
> > +     ptp_out_pins: ptp-out-pins {
> > +             pins =3D "GPIO_58";
> > +             function =3D "ptpsync_4";
> > +     };
>
> Could you please move this one upper to have all the entries in the gpio
> container alphanumerically sorted?
>
> > +
> > +     ptp_ext_pins: ptp-ext-pins {
> > +             pins =3D "GPIO_59";
> > +             function =3D "ptpsync_5";
> > +     };
>
> Same here.

Sure, I will make sure that pin nodes are alphabetical (I found some
more that are not) in v5.

>
> [ ...]
>
> > +             port29: port@29 {
> > +                     reg =3D <29>;
> > +                     phys =3D <&serdes 11>;
> > +                     phy-handle =3D <&phy3>;
> > +                     phy-mode =3D "rgmii-id";
> > +                     microchip,bandwidth =3D <1000>;
>
> There are some questions around this node from Andrew in v1 of this serie=
s,
> which I don't see an answer for in any of the following versions. Could y=
ou
> please clarify?

Sure, as for the RGMII I switched to rgmii-id so the PHY is adding the dela=
ys.
Though, I am not sure if its better to add them via MAC as it can add
the delays instead of the PHY,
so I am open to suggestions here.

As for the phys property, yes that is not required here as RGMII ports
are dedicated, there are no
SERDES lanes being used for them.

I have updated the bindings to account for this and it will be part of v5.

Regards,
Robert

>
> The rest looks good to me.
>
> Thank you,
> Claudiu
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

