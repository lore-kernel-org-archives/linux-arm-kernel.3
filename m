Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63FCC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwXr5JQBPkaBLHWGddnnrahSfTIk8BLpRxGvjvBeRX0=; b=Qy3w8FHATjmT9E
	13kq9oo7dqMvHD8tb0B5chx2Nu4MtXBzWDmExbNdiwEumUkVB6YWW0cYkjNbCH77T/KxA5Qni/D8W
	0MVAWozRqNNnhwCg97Xyyfn6/gTHQLYTKCg41BnpbmWdz3ltntl8WEgoAF7i3CoJ1MigYNbAfliUW
	RZ14okZTsdTBnjhbxo6yGbf1ks2pnGEz+sRFrwQEFIuNmgAOkg+QevFR0CcQBiE8JLPsTbnqjHNW4
	NuaPSMys+NROcTgBhK/1IzHeSXS2KOdbleIzQd4yhf4eLrpY1eht00k5SlWeCTu7xpVq+9ikV/DZf
	Iz2l4xhbeg/z1I0yxlpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8ca-00000005Tfh-22yB;
	Tue, 08 Jul 2025 13:44:32 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8Ms-00000005RCE-1GbU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:28:19 +0000
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86d029e2bdeso185957039f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981291; x=1752586091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwXr5JQBPkaBLHWGddnnrahSfTIk8BLpRxGvjvBeRX0=;
        b=uxxd+/fTqd+q1l6pcO3UhJHD3830TenGrnw++iqkuJ9FVhUXpychJ1dfoEW921ZdQl
         PH713JoFcWeyA8kdj7iU2HynXsFQbGRHnom1ZupQeIO2fjzMI7uuRgWzM8+/8LKWBNvq
         9ctHMFUTKzmhXwSBpbxBQXjQkmg0hsjvnzR9LeoCsy18G99g63LA7mM2JUvwQKayGpU0
         5rIPJnpmMHLeKGH5fIMtKRXQRNneP5P1ulMFNQvU/d6KLj41+9UcJ2P56NnJq40H6kER
         EUx6UHcHHeSGGCEzU/YPiXPu/wLlM/sety6t9eLIAJG+XofA4IEJMN7mwb7Dsh1TDMN4
         DI/g==
X-Forwarded-Encrypted: i=1; AJvYcCX7cqKJDQyoIkzU8ryiU1+J7Ll7o+vgduWBlTYENT0nMY/WPHxFDMG7WxD5C87xzm0mWzhAUg+8cvDWoShv9TnC@lists.infradead.org
X-Gm-Message-State: AOJu0YwHI2NVskv3pWqjQ2/uHtSiLv5EUj2vv2XKURaI0bIbfyDcyGRk
	ni4ovG33gPRKuNEt5e5Hfe/86AKOayGJKrKnZB8gBdkg61hcOg04thfYTTBT5uA3aNc=
X-Gm-Gg: ASbGncvUvHExJtP7XA7JtVO9W6KI5UE8kCmDBVG7uXOACt1lh1LQJ/GiLH9umZkO8tb
	W+KDtovLoY45FZ4y9aQsJAs3EatJcb3cMnrC//CTUTLXS4bkujvQv+HOLBypez5PfVwwP5cXXwd
	/N6r9nrBnrZDF28/IF7kPCkjKLrKaQInoYlQ9M7tzyHNY+1PkLo6YIGnQMJ01qP7q473TGfkymZ
	cKJ9Tjzf942jV1plne6/Ungzlms0wJZJunChHiS4VFHBaiATBPnwFRNT59fPyEKkqxHWf+cL6uy
	jEKM2VnbcY8dz+vQEuSC95wAY/0vA0mgiWdfEpFT52mhe81fY41ny9x/zYur0EcLAoSGURU9W1Q
	5oZCvU+QrLXrSRIU=
X-Google-Smtp-Source: AGHT+IF4FKfiajjV/sPtAasL29DptYv9AEdKkrt5KM6ml6RqpeB94zvmoXUndzXXREi1W13Bj47Wgw==
X-Received: by 2002:a05:6e02:522:b0:3e1:433e:2605 with SMTP id e9e14a558f8ab-3e154e63815mr23332615ab.9.1751981291041;
        Tue, 08 Jul 2025 06:28:11 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e0f9b8daecsm32527365ab.20.2025.07.08.06.28.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8794259ffe8so51622739f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:28:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVADFi5m0Pv/S/BlLKRRebj9wPMgG527J/a8fTQUD7Pl1V/KVObGKzyY+/tigc1UbjoKeQdb7WRqSzChSELW/xe@lists.infradead.org
X-Received: by 2002:a5d:94cd:0:b0:86a:441:25ca with SMTP id
 ca18e2360f4ac-8794c5a73e5mr262803939f.6.1751981289780; Tue, 08 Jul 2025
 06:28:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan> <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
 <aG0bqasOYUwwgiQY@collins>
In-Reply-To: <aG0bqasOYUwwgiQY@collins>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 21:27:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64vYEkKm8D_6r_O+fg_tR4zG1Loai1BPVO5AiE-MO=DJw@mail.gmail.com>
X-Gm-Features: Ac12FXxFG0byldtdYQU-R8wlvBgWN23RRGAX9zRQbdtbd5Tg1tBGYvUbeASjhVY
Message-ID: <CAGb2v64vYEkKm8D_6r_O+fg_tR4zG1Loai1BPVO5AiE-MO=DJw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_062818_340699_BF3CB051 
X-CRM114-Status: GOOD (  35.81  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 8, 2025 at 9:22=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.io=
> wrote:
>
> Hi,
>
> Le Tue 08 Jul 25, 16:18, Chen-Yu Tsai a =C3=A9crit :
> > On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > On Mon,  7 Jul 2025 18:51:55 +0200
> > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > >
> > > Hi Paul,
> > >
> > > > The Liontron H-A133L board features an Ethernet controller with a
> > > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > > >
> > > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > > order to let the MDIO core properly reset it before trying to read
> > > > its identification registers. There's no other device on the MDIO b=
us.
> > >
> > > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > > was struggling with putting it either in the MAC or PHY node, though
> > > conceptually it would still belong in the latter, I think. But this
> > > might be a more generic problem: for most other devices we activate
> > > reset and clock gates *before* trying to access them, though this mig=
ht
> > > be historically different for Ethernet PHYs.
> >
> > The phylib core has code to deal with reset GPIOs listed under the PHY =
node.
> > It might be worth checking why that doesn't work.
>
> While this code does exist, it's too early to be called when the mdio bus=
 is
> trying to probe the phy. I was also surprised the existing reset gpio sup=
port
> in the phylib core didn't take effect (that's how I tried to implement it=
 first)
> only to find that the code was never called. It's only called once the ph=
y was
> probed and registered.

OK, that's definitely weird. The code looked like it just walked the DT
and registered PHY devices, upon which the GPIO lines would be found and
toggled.

ChenYu

> Cheers,
>
> Paul
>
> > OOTH, there's no code to deal with regulator supplies for PHYs.
> >
> > ChenYu
> >
> > > > The datasheet of the PHY mentions that the reset signal must be hel=
d
> > > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay)=
 to
> > > > be on the safe side without wasting too much time during boot.
> > > >
> > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > >
> > > Despite the above, this looks fine, and works for me:
> > >
> > > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > > Tested-by: Andre Przywara <andre.przywara@arm.com>
> > >
> > > Cheers,
> > > Andre
> > >
> > > > ---
> > > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++=
++++
> > > >  1 file changed, 19 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a=
133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > > index fe77178d3e33..90a50910f07b 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dt=
s
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dt=
s
> > > > @@ -65,6 +65,25 @@ &ehci1 {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&emac0 {
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&rmii0_pins>;
> > > > +     phy-handle =3D <&rmii_phy>;
> > > > +     phy-mode =3D "rmii";
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&mdio0 {
> > > > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > > +     reset-delay-us =3D <2000>;
> > > > +     reset-post-delay-us =3D <2000>;
> > > > +
> > > > +     rmii_phy: ethernet-phy@1 {
> > > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > > +             reg =3D <1>;
> > > > +     };
> > > > +};
> > > > +
> > > >  &mmc0 {
> > > >       vmmc-supply =3D <&reg_dcdc1>;
> > > >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > >
> > >
>
> --
> Paul Kocialkowski,
>
> Independent contractor - sys-base - https://www.sys-base.io/
> Free software developer - https://www.paulk.fr/
>
> Expert in multimedia, graphics and embedded hardware support with Linux.

