Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B0FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 19:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG4PhgF2iuQKlnt9tqts0h+qTNM+2zZoQqXuH+Q+bnU=; b=T81mNRvsXXQbR9KOrv82rhTKic
	bgQI1xDOu8qtuwXsqckMfWgCSpl8LzbIm9rbO24/VZrONXkJ3DX9GgUFrwyaV3A2MZLixxIHsuzKe
	5PV3t1VaBu0s1b7MYzyXb4PaC92ixzpQ85Za8nYc/QhDfCVz2Wrz5pPlHYPgDA4aLNu/vW4fNY8Vj
	gEwW18eIW9TmLNMplBIlXPG/E+NsQdplQnM2YGaI1xe3No8yYGcosY8XrwIDHMlVdec79+a/HbW22
	rimv+HWf1KUMzJJ6r5La66amwVYpIACQgQZdMvoBQXKeZGaawtJm7cOJHEYXef2D4otj24tFM2UxH
	I4oqoe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOj44-00000005yuF-3AlM;
	Fri, 20 Dec 2024 19:53:36 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOj2u-00000005yiO-0Qok;
	Fri, 20 Dec 2024 19:52:25 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so4203837a12.2;
        Fri, 20 Dec 2024 11:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734724342; x=1735329142; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG4PhgF2iuQKlnt9tqts0h+qTNM+2zZoQqXuH+Q+bnU=;
        b=RIaaWwFe767liBqxOn2NTNpk88VvT9mLYyGbrhztB6FP5biR2N7KhjMnPvDbgLrZkL
         4xruCA2YZk343E+cpX8VYsS0gP7UGhPSxuZVQoUy6dMrTdQT7ZH0pKS3TiFUl/YJQxPk
         dW15g324vNH1RGkYl7TOJthGXSQbLJwWZWFR1HbDKMpbA7IBjdNXlUcWgH214qG0HR/z
         Kmf9LS0cGrnfk/UUxXpKmr1stoxURVBEKxaKw4Uos9izk3bezlCa5nXW/iNA8NWXILpj
         hYv3puZRNmlQ6q/WQMYsvFpqJdLgILxznwS+1XWXZZRDKnGSx4Zg5uiyRz6icCBgRQau
         eh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734724342; x=1735329142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG4PhgF2iuQKlnt9tqts0h+qTNM+2zZoQqXuH+Q+bnU=;
        b=EsYaxFA3vDJQL14qzEbOkBnA/TcUBc05wchZ8tGyPx34EeJf4dzdM7ncXoEz4r0Rle
         86SgQ2cUMrcRuJCdo7jbXLQHZ7h5B/guBaZ8XmG1NugFWv9YirzXfucOAxfxzT7DQJ42
         i0M34FYXC9ovjVYgSDA/gly7lZ14CxFIwqPrWUE0C7yiXbUPHpVyaI+Kr4p9vUg0ne0t
         lrGaHm2dPRY7GCx/P0ZZJmeGqk8f1otJXhDaOJoO2+PUMyQkG4d8CoGfYTTlaBaTu3un
         rQ9oJ6i2DU3BnyMoXlHGltnoQscRfxyJ2VbQcl5lirggZugOJhPDnB5MQ8FathrEebp4
         no0A==
X-Forwarded-Encrypted: i=1; AJvYcCV3KfZTDiOk6HOKiWgwtURfgeSTC4U/l4Mhm8Wo7TTDuZhHJ/r2gcSkC0uAi4LPM6fSj61VuczK90xx4x2yQiM=@lists.infradead.org, AJvYcCX9LO4BZej6TYOPQ7yKFc5VYoFhuRSzi6dRWwKG6qgUXUcHZIKTIdWn3gUR8udLiXXmR7rwOaf/cm2n9UDBXEV2@lists.infradead.org
X-Gm-Message-State: AOJu0YyEcxrS4Ezj7AW1TL+WEQ2+WFpNceHqKdOlGUp5szSeJk5ApGPY
	vpPnXcGSG4elIT4QULWeZ/YV9oA5K9BSffygI1OB3j0RJFdhUH+6L1zg9i3CtuSWDKLLyAibkwp
	n9oARIbsefki3moGa2pvWX/6cmxki6eNB
X-Gm-Gg: ASbGncuo+P9udFl5MlaWurcyfJzhIKuBwp5+BQpdoaFns3dy7ldNahY6Kxe9czZm4vc
	I/sOjCgUnLcuSrTzZRb/UsZ9wXp0tMgeT0YY/lPw=
X-Google-Smtp-Source: AGHT+IHw+159hiFsyu+IFJW9f4JY5lsobJW27krUETxABDh1/EPmaUo06Sj/Uioa8IFYFJi7hH1/AsGIIC/dPh0Baok=
X-Received: by 2002:a05:6402:3224:b0:5d4:34a5:e2f4 with SMTP id
 4fb4d7f45d1cf-5d81de38bdfmr3805995a12.31.1734724341360; Fri, 20 Dec 2024
 11:52:21 -0800 (PST)
MIME-Version: 1.0
References: <20241220163227.1501912-1-alicja.michalska@9elements.com>
 <17251add-40b7-4d18-8626-2d74b29532fc@kwiboo.se> <9a210e3d-90eb-42d4-83fd-7bbad7b00e86@9elements.com>
In-Reply-To: <9a210e3d-90eb-42d4-83fd-7bbad7b00e86@9elements.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Fri, 20 Dec 2024 14:52:09 -0500
Message-ID: <CAMdYzYoraXsZK3Uwe3QBVjt0cHn_GyOvR=57+qD-UrrwRE2TzA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: ROCK3B: Correct clock rates for
 Ethernet PHYs
To: Alicja Michalska <alicja.michalska@9elements.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_115224_149600_6A31E401 
X-CRM114-Status: GOOD (  42.71  )
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

Good Afternoon,

On Fri, Dec 20, 2024 at 12:54=E2=80=AFPM Alicja Michalska
<alicja.michalska@9elements.com> wrote:
>
> Hello Jonas,
>
>
> On 20/12/2024 18:09, Jonas Karlman wrote:
> > Have you used mainline or vendor u-boot when testing?
> >
> > There is an existing issue with RTL8211F PHYs that they must be reset
> > before Linux can identify them, see [1] for more details on the issue.
> >
> > Mainline U-Boot will reset the Ethernet PHYs on this board and that
> > should allow for Linux to identify and use the Ethernet PHYs.
> >
> > [1] https://lore.kernel.org/r/47d55aca-bee6-810f-379f-9431649fefa6@kwib=
oo.se/
>
> Thank you for the link. I've tested with vendor-provided U-Boot build:
>
> U-Boot latest-2023.10-11-cc60ff40-gcc60ff40 (Aug 14 2024 - 03:56:35 +0000=
)
>
> I can test with upstream in upcoming days.
>
> > The snps,reset props is deprecated and reset- props should be used in
> > the PHY node.
> >
> > This also changes to use 20/100 ms delay instead of current 20/50ms
> > delay. If anything it could be changed to 20/80ms, I have only seen
> > datasheets for rtl8211f mention minimum 10 ms and minimum 30-76 ms.
> >
> >> +
> >> +    tx_delay =3D <0x36>;
> >> +    rx_delay =3D <0x2d>;
> > Are you having issue with use of rgmii-id on your board?
>
> Interesting insight, thank you!
>
> I have to admit that I haven't read the current documentation, just seen =
that other RK356X boards in the tree used it. My apologies.
>
> I've ran into issues with rgmii-id, but that's with vendor U-Boot (as men=
tioned above), will try with upstream next and see a follow-up if I will st=
ill experience issues.

rgmii-id sets the phy to handle the tx and rx delays. All of the
various rgmii settings require the board to be built to specific
tolerances for the data lines. Rockchip based boards seem to forgo
this design phase, instead using rgmii (no built in delays) and set
the delays in the Rockchip gmac driver instead, using the tx_delay and
rx_delay values in the device tree. The tx_delay and rx_delay value
must be tuned correctly for your hardware. If you wish to use them
you'll need to set rgmii, then find the lowest and highest values that
work for all variations of hardware supported by the device tree then
take the middle value. If you wish to use rgmii-id, these values
should be omitted or set to zero as they are additive to the existing
delays.

>
> >> +
> >>      status =3D "okay";
> >>  };
> >>
> >>  &gmac1 {
> >>      assigned-clocks =3D <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
> >>      assigned-clock-parents =3D <&cru SCLK_GMAC1_RGMII_SPEED>, <&cru C=
LK_MAC1_2TOP>;
> >> -    clock_in_out =3D "input";
> >> -    phy-handle =3D <&rgmii_phy1>;
> >> -    phy-mode =3D "rgmii-id";
> >> +    assigned-clock-rates =3D <0>, <125000000>;
> >> +    clock_in_out =3D "output";

Instead, I suspect the clocks here are your issue. Looking at the
schematic at [1] your board is designed to feed the phy clock into the
SoC. This isn't the current clock configuration in your device tree,
you had it set to input, but the clock parents are wrong and will
default to using the internal SoC clock source for the mac. I suspect
setting the assigned clock rate is what fixed your issue.

I wrote the rk3566-quartz64-a.dts to be an example for how the new soc
behaves. I recommend looking at it for an example for how the clocks
are supposed to be set up for proper input [2].

> >>      phy-supply =3D <&vcc_3v3>;
> >> +    phy-mode =3D "rgmii";
> >> +    phy-handle =3D <&rgmii_phy1>;
> >>      pinctrl-names =3D "default";
> >>      pinctrl-0 =3D <&gmac1m1_miim
> >>                   &gmac1m1_tx_bus2
> >>                   &gmac1m1_rx_bus2
> >>                   &gmac1m1_rgmii_clk
> >> -                 &gmac1m1_rgmii_bus
> >> -                 &gmac1m1_clkinout>;
> >> +                 &gmac1m1_rgmii_bus>;
> >> +    snps,reset-gpio =3D <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> >> +    snps,reset-active-low;
> >> +    snps,reset-delays-us =3D <0 50000 150000>;
> > Same here, but now this is 50/150 ms?
> I wasn't sure about those delays, as I've taken them from vendor's source=
s. They did seem awfully high, though.
> >> +
> >> +    tx_delay =3D <0x47>;
> >> +    rx_delay =3D <0x28>;
> > Same here, is use of rgmii-id causing issues on your boards?
> Answer above :)
> >> +
> >>      status =3D "okay";
> >>  };
> >>
> >> +&mdio0 {
> >> +    rgmii_phy0: ethernet-phy@0 {
> >> +            compatible =3D "ethernet-phy-ieee802.3-c22";
> >> +            reg =3D <0>;
> > The phy addr used for these boards is 0x1.
> >
> >> +    };
> >> +};
> >> +
> >> +&mdio1 {
> >> +    rgmii_phy1: ethernet-phy@0 {
> >> +            compatible =3D "ethernet-phy-ieee802.3-c22";
> >> +            reg =3D <0>;
> > Same here.
> Makes sense, other boards in the tree had it configured the same way.
> >> +    };
> >> +};
> > There should be no need to move these nodes, they should already be in
> > alphabetical order?
> There's no reason to, just thought moving them closer to PHYs would look =
cleaner and make a bit more sense. It's just a nitpick though.
> >> +
> >>  &gpu {
> >>      mali-supply =3D <&vdd_gpu>;
> >>      status =3D "okay";
> >> @@ -512,26 +540,6 @@ &i2s1m0_sdi0
> >>      status =3D "okay";
> >>  };
> >>
> >> -&mdio0 {
> >> -    rgmii_phy0: ethernet-phy@1 {
> >> -            compatible =3D "ethernet-phy-ieee802.3-c22";
> > If you want to use vendor u-boot you can probably change this to
> > "ethernet-phy-id001c.c916".
> >
> >> -            reg =3D <1>;
> >> -            reset-assert-us =3D <20000>;
> >> -            reset-deassert-us =3D <50000>;
> >> -            reset-gpios =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> >> -    };
> >> -};
> >> -
> >> -&mdio1 {
> >> -    rgmii_phy1: ethernet-phy@1 {
> >> -            compatible =3D "ethernet-phy-ieee802.3-c22";
> > Same here.
>
> True, but in this case it likely wouldn't be accepted in upstream, right?
>
> I really would prefer devicetrees to be passed to the OS by bootloader, j=
ust like ACPI does on x86 and some (i.e Ampere) platforms.
>
> This way we wouldn't need to maintain per-board DTs in the tree, and woul=
d keep functionality between kernel versions/BSDs... but one can dream, huh=
? :)

The device-tree is supposed to describe hardware without regards to a
specific operating system. If written correctly, it will work no
matter what software is running on top of it. While there are some
specific tweaks to make the operating systems behave correctly around
broken hardware, a lot of the deviations from this standard are due to
legacy trees and are being cleaned up over time.

>
> Thank you,
>
> Alicja

Very Respectfully,
Peter Geis

[1] https://dl.radxa.com/rock3/docs/hw/3b/Radxa_ROCK_3B_V1.51_SCH.pdf
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts?h=3Dv6.13-rc3#n267

>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

