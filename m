Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5B6D43379
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rMK1Q2ahD4EZ/sgz2Aa4gk5obzAN4PTkk6x7PuveCU=; b=BOOLiEoN/p6yDZ
	1ddSDiMmZgTxz6rA+/hwBDjyAaK/uKaXzBhA9avDwQUmeOqcvVkUs6+e9VWphIrbgOJXtzbJT1jRD
	B13WvtUAy/pFjbqw6sJmo/FV6qmbmpaRrJ8uQG6SmsTeAiKTqUCHKZbH2850AmU7crrPWTKEoleP2
	3+YEwc7l2wQ8M9fPSokxBzu4CCubgks6NOkXCVkHZrLxB17fR4KI1kkRDhr8qqRDCHuGiC6RO5m2V
	BlHV47UeiWawnw/yuVOSGZhfIc1qaEX8QqPodW1OH0xvyxQLZG/oXDr3TG7YWudT7ggBDl0BV4EEN
	uK6BHCG8NxOHaYWIQTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Jg-00000007d0E-3fQ1;
	Thu, 07 Nov 2024 16:25:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95C6-00000007acl-3vLb;
	Thu, 07 Nov 2024 16:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 16CDC5C58AB;
	Thu,  7 Nov 2024 16:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4033EC4CED2;
	Thu,  7 Nov 2024 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730996232;
	bh=zN+pl9zJR84rYItU6Yg9zEk1E0RL8c2wM8TpZNYN80A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:From;
	b=ChUGDMoA8DTbMWlkKGtZgJKs5aW68D2goW+t7eAPWd6wsq0X9UD1ZnWqyC9fLe6i6
	 zQYcx0Z2q+miHhym4U3ndivoR+haHo2mps+TVog5Th8VZmkqmBmnLXELuNrL7LGtQq
	 yFeDQSD0bzvArdYIyAhuHUorlpDarJI6BHpVEjn5a00vcgdO2eeERsazoH1RfKroPF
	 EaqvBjJJwp3KEiIw2KxgIsTwyJ90vXqcknAYRVvTCM98lWJxpYimjLCt3B1s9+5RvY
	 tC2WOZqpXrota8kAa6GW9oSebcYmow0p8PG0HqhZ00TmDcqGeCkzZParu4KVW7G5sA
	 a5ZPwxKZ+x24A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so1819343e87.1;
        Thu, 07 Nov 2024 08:17:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVWW8jifDrHlMzIsw9If9SlOSNelAfLmeNV0Dp9A1FAEedY1MonjEMowm+FuSs5SePtwB4G/Bx8vwnFKba53/w=@lists.infradead.org, AJvYcCVy/pz8SNIssM6xaq1xd8p2CvfzaxgQg8EOVg2tRm3doR12t/HKnQpOwy02b1V81Fx7Ldl0e5gDZNapoo8UJTGh@lists.infradead.org
X-Gm-Message-State: AOJu0YwPvHLUNo8Jo09+Seh3MRdGKWFrUcZK9VzStKeiTS/JMNXrXlrk
	MZPfRsoXGiV3wurZ7dEmTJXvkDhXGLuLv5rXje9SaVbeU0x19cHgT2E3qDasahNC+Fhf6YPboI0
	xP1GbRxeC5xSox3CmKU+JqY0V3PI=
X-Google-Smtp-Source: AGHT+IFTwC5oSyOppuutH6sQ9QNYhG4XSpDWF3RZsZH50TypzUpILgioGVWRfVgBkbwirmI6YuHNZSrQGLMfHq+3uPw=
X-Received: by 2002:a05:651c:98d:b0:2fb:522c:7ee2 with SMTP id
 38308e7fff4ca-2ff1e930d0fmr4176911fa.21.1730996230502; Thu, 07 Nov 2024
 08:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20241025175415.887368-1-wens@kernel.org> <pe2ornjaqn24i7e3x64rfdtqbp2c347mc5okgj5y6bfvkwnv6z@jux5yei3vxxa>
In-Reply-To: <pe2ornjaqn24i7e3x64rfdtqbp2c347mc5okgj5y6bfvkwnv6z@jux5yei3vxxa>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 8 Nov 2024 00:16:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66WNDVDVqncPNjep3Usqwj2txuXVMxK_Uy0fSgbMFbX_Q@mail.gmail.com>
Message-ID: <CAGb2v66WNDVDVqncPNjep3Usqwj2txuXVMxK_Uy0fSgbMFbX_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: orangepi-5-plus: Enable USB 3.0 ports
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Chen-Yu Tsai <wens@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_081715_101270_D18362A6 
X-CRM114-Status: GOOD (  26.38  )
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

On Mon, Oct 28, 2024 at 6:47=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wr=
ote:
>
> Hello Chen-Yu,
>
> On Sat, Oct 26, 2024 at 01:54:15AM GMT, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The Orange Pi 5 Plus has its first USB 3.0 interface on the SoC wired
> > directly to the USB type C port next to the MASKROM button, and the
> > second interface wired to a USB 3.0 hub which in turn is connected to
> > the USB 3.0 host ports on the board, as well as the USB 2.0 connection
> > on the M.2 E-key slot.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> CCing the DTS author would be nice. :)

Ack.

> Thanks for submitting this. I found a few issues. See below:
>
> > ---
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 132 ++++++++++++++++++
> >  1 file changed, 132 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index dd03c9db6953..b826c5e368aa 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -177,6 +177,18 @@ daicodec: simple-audio-card,codec {
> >               };
> >       };
> >
> > +     vbus_typec: vbus-typec-regulator {
> > +             compatible =3D "regulator-fixed";
> > +             enable-active-high;
> > +             gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&typec5v_pwren>;
> > +             regulator-name =3D "vbus_typec";
>
> This is named vbus5v0_typec in the schematic.

Ack.

> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +     };
> > +
> >       vcc3v3_pcie30: vcc3v3-pcie30-regulator {
> >               compatible =3D "regulator-fixed";
> >               enable-active-high;
> > @@ -339,6 +351,56 @@ &i2c6 {
> >       clock-frequency =3D <400000>;
> >       status =3D "okay";
> >
> > +     usbc0: usb-typec@22 {
> > +             compatible =3D "fcs,fusb302";
> > +             reg =3D <0x22>;
> > +             interrupt-parent =3D <&gpio0>;
> > +             interrupts =3D <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&usbc0_int>;
> > +             vbus-supply =3D <&vbus_typec>;
> > +             status =3D "okay";
> > +
> > +             usb_con: connector {
> > +                     compatible =3D "usb-c-connector";
> > +                     label =3D "USB-C";
> > +                     data-role =3D "dual";
> > +                     op-sink-microwatt =3D <1000000>;
> > +                     power-role =3D "dual";
> > +                     sink-pdos =3D
> > +                             <PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM=
)>;
>
> The board can't sink power from this port. It's a source only port. So si=
nk-pdos
> can be lower, so that if you plug this into type-c hub as a peripheral, t=
he hub
> doesn't need to reserve 5W for this port.
>
> op-sink-microwat can also be lower. The port will not sink any power when
> connected to 5V VBUS externally.
>
> Otherwise you can probably keep power-role =3D "dual";

I guess it should just be power-role =3D "source";
And then drop all the sink related properties.

> > +                     source-pdos =3D
> > +                             <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM=
)>;
>
> This port can't source 3A. U22 (SY6280AAC) is configured via Rset for 1.4=
4A
> limit. So let's say 1.5A.

Probably 1.4A to be safe?

> > +                     try-power-role =3D "source";
> > +
> > +                     ports {
> > +                             #address-cells =3D <1>;
> > +                             #size-cells =3D <0>;
> > +
> > +                             port@0 {
> > +                                     reg =3D <0>;
> > +                                     usbc0_hs: endpoint {
> > +                                             remote-endpoint =3D <&usb=
_host0_xhci_drd_sw>;
> > +                                     };
> > +                             };
> > +
> > +                             port@1 {
> > +                                     reg =3D <1>;
> > +                                     usbc0_ss: endpoint {
> > +                                             remote-endpoint =3D <&usb=
dp_phy0_typec_ss>;
> > +                                     };
> > +                             };
> > +
> > +                             port@2 {
> > +                                     reg =3D <2>;
> > +                                     usbc0_sbu: endpoint {
> > +                                             remote-endpoint =3D <&usb=
dp_phy0_typec_sbu>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +     };
> > +
> >       hym8563: rtc@51 {
> >               compatible =3D "haoyu,hym8563";
> >               reg =3D <0x51>;
> > @@ -480,6 +542,16 @@ vcc5v0_usb20_en: vcc5v0-usb20-en {
> >                       rockchip,pins =3D <3 RK_PB7 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> >               };
> >       };
> > +
> > +     usb-typec {
> > +             usbc0_int: usbc0-int {
> > +                     rockchip,pins =3D <0 RK_PD3 RK_FUNC_GPIO &pcfg_pu=
ll_up>;
> > +             };
> > +
> > +             typec5v_pwren: typec5v-pwren {
> > +                     rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pu=
ll_none>;
> > +             };
> > +     };
> >  };
> >
> >  &pwm2 {
> > @@ -871,6 +943,22 @@ &tsadc {
> >       status =3D "okay";
> >  };
> >
> > +&u2phy0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&u2phy0_otg {
> > +     status =3D "okay";
> > +};
> > +
> > +&u2phy1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&u2phy1_otg {
>
> Needs:
>         phy-supply =3D <&vcc5v0_host>;

You probably mean vcc5v0_sys?

The power switch that feeds the ports is controlled by the hub directly.
The hub is powered off vcc5v0_sys.

> > +     status =3D "okay";
> > +};
> > +
> >  &u2phy2 {
> >       status =3D "okay";
> >  };
> > @@ -899,6 +987,33 @@ &uart9 {
> >       status =3D "okay";
> >  };
> >
> > +&usbdp_phy0 {
> > +     mode-switch;
> > +     orientation-switch;
> > +     sbu1-dc-gpios =3D <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
> > +     sbu2-dc-gpios =3D <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
> > +     status =3D "okay";
> > +
> > +     port {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             usbdp_phy0_typec_ss: endpoint@0 {
> > +                     reg =3D <0>;
> > +                     remote-endpoint =3D <&usbc0_ss>;
> > +             };
> > +
> > +             usbdp_phy0_typec_sbu: endpoint@1 {
> > +                     reg =3D <1>;
> > +                     remote-endpoint =3D <&usbc0_sbu>;
> > +             };
> > +     };
> > +};
> > +
> > +&usbdp_phy1 {
> > +     status =3D "okay";
> > +};
> > +
> >  &usb_host0_ehci {
> >       status =3D "okay";
> >  };
> > @@ -907,6 +1022,18 @@ &usb_host0_ohci {
> >       status =3D "okay";
> >  };
> >
> > +&usb_host0_xhci {
> > +     dr_mode =3D "otg";
>
> This is the default. No need to have it here.

Ack.

Thanks
ChenYu

> Kind regards,
>         o.
>
> > +     usb-role-switch;
> > +     status =3D "okay";
> > +
> > +     port {
> > +             usb_host0_xhci_drd_sw: endpoint {
> > +                     remote-endpoint =3D <&usbc0_hs>;
> > +             };
> > +     };
> > +};
> > +
> >  &usb_host1_ehci {
> >       status =3D "okay";
> >  };
> > @@ -915,6 +1042,11 @@ &usb_host1_ohci {
> >       status =3D "okay";
> >  };
> >
> > +&usb_host1_xhci {
> > +     dr_mode =3D "host";
> > +     status =3D "okay";
> > +};
> > +
> >  &vop_mmu {
> >       status =3D "okay";
> >  };
> > --
> > 2.39.5
> >

