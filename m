Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DFBD2502D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1llCMASQ3MobTxu6nXqP5vUtdWy7RUn8pLv2JvHCXy0=; b=ZZErK8klfW42cmkHID/NhNIFUI
	7QDskTwcVPVR13K8gi5pKWz56Su9ziZRqP3K9Ou0vhimzw7E3mHT/6MeVl9xOe/2c52m1nhg/EUY5
	8OVOODWkIr+JxK+/biOmzAFPQdgNiy9fTaCX6d+Lt8y007WtyF600FN0ppvqHUAMEGGrm0gViuMIF
	8HcvL0lmHqBEObPEDkAjfTrvtBrXbP9fv20QT4SkOURfZ12xAEwse+FJ8Q/5ff+km8DP3mVJ1ChcV
	p5/RpxgXW65/58+rHVeaqJqYugU4h836b0u+PcImmw6M/bjDzDE5eQD7qyYMItwSvZEoLXDRJpXeg
	Z6Nz+wLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1AL-00000004Rkw-0tcG;
	Sun, 11 Jan 2026 19:31:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf1AI-00000004Rjv-1LEk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 19:31:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-650854c473fso5702513a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 11:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768159912; x=1768764712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1llCMASQ3MobTxu6nXqP5vUtdWy7RUn8pLv2JvHCXy0=;
        b=Ig2SRmLxnwT4AMICQSf4PuMTrBeYl1R68IN46ea29gUkTuaaXBG+ZFydKeuf4rVwYc
         5v1JgAqsRx0HRdOs2/ZdfYlitqmxqY+OPPeHEtRDKGbjZ+SY7NwqTq+QnCi0+dP7VE3D
         n04menQCm6GfkRfMXHJ69eFzQPEOt13+JOGI5FbdcIbwLCC9i0GRKPr34NP+yodCxwor
         RJ0TUlmd3jqhXhQdl06pqvLP7wENIK/J5q7IyMG8fwZMS7woW0UCNBbWWdmC1unaXWdf
         WVJiRgdvSxb9IF2qXmH4ktzJYeK4/nALr9XLiR7IyXHHeaO8xUAzdA0QSiKKUUexVMxC
         9lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768159912; x=1768764712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1llCMASQ3MobTxu6nXqP5vUtdWy7RUn8pLv2JvHCXy0=;
        b=tVQUzSzRuEzEKdyVlc/FOEy9V6zioNlDrP1U3OBPhKzWOAK2k1lsyFQ41JjcxBQvE0
         LT2hF0ruvtWBI5MLCgfkcL9g727HOk0SHibDgugycCckHCF8mPRpvoDWns/52MSw5tLA
         yEuEOIyY0ViUmZdSBAg2ejoBgW+P9QDq3Y+B1Gxwx+IrUWkg7WmiHUSUpEdHzKkG1CY/
         khwIH6VqzwrlCjLnoPjicdbucSs6DX3w6wOocFyCjxvjQwRzwceq74AWOQEt0WO/4KK+
         o/powU6LphBwN7FPeVWO6N11R0nzoo+5pG/t1K2QHpNeF+MOi7mDtr9F5ArIRvoaQHd5
         MCuA==
X-Forwarded-Encrypted: i=1; AJvYcCVjAaPW5kP/MZ3l0SQOtugI8CJsB4fkEKRenVn4orcUvVXys5ONqYgxqIO6BTKafrcN5tOV6Wj75dofH77imELF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8I2nyNi0h8VCwq57gITi9Gi5XP1lttTMkvFsOragZO/E+dfbd
	SEtoy5Nkm+9EVo852rVssq1WRnKhdoruzz30Y0/MBh/dCinTXv/LL50Woxns1wXu5js9i6u1TPu
	sozlgYJyXKyiL2D3gorGvxO02/Q3QiFk=
X-Gm-Gg: AY/fxX5/eQlaAwi8rRcjFmUIJzC7dN2trNBk5oQZa3wXoRpglGHnR6ZMn9mIxNXdLjx
	o4dixGyDpnpqAXrAsdIRdv9TnPA/xItA326SZ//Lr9B0CG/pLhvVeZlxgpSNrRqDDLz+iQUFYNW
	DdNr0KnhNAT27HBcDsXDN6aZD12mlSwMq0o4aEr7OBzXPstJdntjPzDKOdTip95b+iT4E+X/8WP
	Uq2Nz3p8zw23AI65XyNQAhmFJY5x8fhI3l5c/X2ubeY5dGd06BNJ0L+qrYXVu45fng=
X-Google-Smtp-Source: AGHT+IFT/knNVJfiA11bK06YsQejbdfC7KAQjOrTau0qt16Y+07yWK0cpRf4pmTxw0HgBdiPh3Jnl9b4btWgBTwkc7s=
X-Received: by 2002:a05:6402:1488:b0:64c:ff6b:f56 with SMTP id
 4fb4d7f45d1cf-6507c0704e4mr14268114a12.9.1768159912220; Sun, 11 Jan 2026
 11:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-2-linux.amoon@gmail.com>
 <aVke1kQnHJLqWGHi@venus> <CANAwSgSd0TLrkxpnS5qdot8B7vkd4wH76-g8hAixqfbEtH4LyA@mail.gmail.com>
 <aWGJYt3VPWh1kC_v@venus>
In-Reply-To: <aWGJYt3VPWh1kC_v@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 12 Jan 2026 01:01:34 +0530
X-Gm-Features: AZwV_Qjk0PC1h4-nzgxSMCHjCoYMB6_DfqK9WUaQvz9oLKiSdDPd37nJhqh4lBo
Message-ID: <CANAwSgTGJ5mqoieWOse3OCO3pFepwn1eQx-Hu+O1Pj6hkpdNXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t:
 Correct Type-C pin bias settings
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Yongbo Zhang <giraffesnn123@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_113154_394920_B1EA6FC7 
X-CRM114-Status: GOOD (  44.83  )
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

Hi Sebastian,

I am having difficulty articulating my thoughts clearly right now;
please bear with me as I try to explain.

On Sat, 10 Jan 2026 at 04:41, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Thu, Jan 08, 2026 at 12:24:50PM +0530, Anand Moon wrote:
> > Hi Sebastian,
> >
> > Thanks for your review comments.
> >
> > On Sat, 3 Jan 2026 at 19:23, Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > >
> > > Hi,
> > >
> > > On Sat, Jan 03, 2026 at 02:01:17PM +0530, Anand Moon wrote:
> > > > As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
> > > > active-low signal. It requires a pull-up resistor to maintain a sta=
ble
> > > > high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable s=
ignal
> > > > requires a pull-down resistor to ensure it defaults to a low state,
> > > > preventing unintended power delivery during the boot sequence.
> > > >
> > > > Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
> > > > pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
> > > > electrical requirements.
> > > >
> > > > Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for R=
OCK 5B/5B+/5T")
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
> > > >     As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
> > > > ---
> > >
> > > Checking the schematics:
> > >
> > > 5B v1.45 - CC_INT_L - R2613 10K pull-up resistor
> > > 5B v1.45 - TYPEC5V_PWREN_H - GPIO is effectively unused because R9503=
5 is NC
> > >
> > > 5B+ v1.2 - CC_INT_L - R2613 10K pull-up resistor
> > > 5B+ v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
> > >
> > > 5T v1.2 - CC_INT_L - R2613 10K pull-up resistor
> > > 5T v1.2 - TYPEC5V_PWREN_H - R163 100K pull-down resistor
> > >
> > CC_INT_L is gpio interrupt pin to enable the I2C read operation.
> >
> > As per FUSB302 datasheet, here is the updated version of the commit mes=
sage
> >
> > Configure CC_INT_L as an active-low, open-drain output. Per the hardwar=
e design,
> > this pin utilizes an external pull-up and is driven LOW by the Type-C
> > controller to
> > signal the processor to perform I2C register reads.
> >
> > The TYPEC5V_PWREN_H pull-down resistor is turned on as a signal to
> > the Type-C regulator, which has an active-enable-high property. In this=
 context,
> > the regulator is used to set the polarity of the GPIO used to enable or=
 disable
> > the regulator.
>
> I don't understand what you want to say here.

I'm sorry for not being clear here. Well, while investigating the bug crash=
,
I was looking for some more details on this issue.

Here is the datasheet for fuse302. It shares the interrupt pin details

[1} https://www.onsemi.com/download/data-sheet/pdf/fusb302b-d.pdf

SCL     Input                          I2C serial clock signal to be
connected to the phone-based I2C master.
SDA    Open-Drain I/O          I2C serial data signal to be connected
to the phone-based I2C master
INT_N Open-Drain Output    Active LOW open drain interrupt output used
to prompt the processor to
                                             read the I2C register bits.
>
> > > TLDR: All GPIOs have pull resistors in discrete hardware and do not
> > > need them muxed in the SoC.
> > >
> > It depends on the GPIO, pinctrl PMU configuration.
>
> as I try to say it does not depend on pinctrl configuration for any
> of the GPIOs you are touching. The pull resistors for them exist as
> components on the board.
>
I understand this correctly, but these registers utilize a high-to-low
state change specifically
to prevent subthreshold leakage current.

Please check the RK3588 Datasheet V0.1-20210727.pdf  (3.4 Electrical
Characteristics for General IO)
[2] https://gitlab.com/rock-chips/rk3588/rk3588-doc/-/raw/master/RK3588%20D=
atasheet%20V0.1-20210727.pdf?ref_type=3Dheads&inline=3Dtrue

> > I was thinking of converting the vbus5v0_typec regulator to 'regulator-=
gpio.'
> > to better reflect the hardware schematics. The TYPEC5V_PWREN_H signal
> > (GPIO2_B6_d) acts as a state controller rather than a simple enable pin=
,
> > and this change ensures the device tree aligns with that design
> >
> > [1] https://dl.radxa.com/rock5/5b/docs/hw/radxa_rock_5b_v1450_schematic=
.pdf
> > (page 28)
> >
> > $ git diff arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > index 5f58e339a052..387ff009ec76 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
> > @@ -57,9 +57,10 @@ rfkill-bt {
> >         };
> >
> >         vbus5v0_typec: vbus5v0-typec {
> > -               compatible =3D "regulator-fixed";
> > +               compatible =3D "regulator-gpio";
> >                 enable-active-high;
> > -               gpio =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> > +               gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> > +               states =3D <5000000 0x1>, <0 0x0>;
> >                 pinctrl-names =3D "default";
> >                 pinctrl-0 =3D <&vbus5v0_typec_en>;
> >                 regulator-name =3D "vbus5v0_typec";
> >
> > Could you please try this at your end?
>
> This is missing gpios-states, but I also see no point in testing
> that. Having one state as 0 effectively means this is a complicated
> version of regulator-fixed. The switch from "gpio" to "gpios" is
> valid though, since "gpio" is deprecated.
>
Typically, a regulator-fixed GPIO input pin is used as EN to enable
the regulator.

However, in this case, TYPEC5V_PWREN_H is being used to signal on/off
to the FUSB302.
As the GPIO-controlled interrupt pin is used to enable or disable i2C
controller.
This is the reason I want to switch from regulator-fixed to regulator-gpio.
ok I will add gpios-states=3D <1>;

That=E2=80=99s why I requested these changes to be reviewed and tested.

[2] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/regulator/gpio-regulator.yaml

Please let me know if these adjustments are incorrect; if so, we can
discard them.
Currently, I'm not making the desired progress.

> Greetings,
>
> -- Sebastian
Thanks
-Anand
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

