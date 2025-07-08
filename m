Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E052AC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F8a42AL8Gvhq3V8KbpdB8ciKkimXt8q0Er3Jq8Vtdrk=; b=t0zM8xOPf25Q60
	abWVb8avFkgV4QnyZ/3n2HJHGNDcilMMoDO9/I6dvDnD037ygVPyUDGD9lN3/jgnoWfI1JLcRm26B
	qVrtAeBWDDQ3qTlA+l6km9qill0xsIaM1RsoWhiARP3rB4Dnu5tFjgFq4Ru8CEJ6c9UZBmPV5QBZD
	et6mRmGg/H/hCUAo5C/BWKrahodLwFoHBupd5gWyAGJ4JohPRu+CPJbTNTa9yFjdGqNZ8cTbdnZ3F
	kz+1JPs83l2By7EWO159X2Qu/boG9mecQytblZrdLZG2WPI5/SZTZNb4drwMHvrnbj1QxP+WUeDS+
	Yn9u3FbYiHxTTZspD0Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Zo-00000004j1U-35Nm;
	Tue, 08 Jul 2025 08:21:20 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3XT-00000004ioo-3MTl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:18:57 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b165c80cso4010484e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751962729; x=1752567529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8a42AL8Gvhq3V8KbpdB8ciKkimXt8q0Er3Jq8Vtdrk=;
        b=KyV9Wke4IXqoHOiEMzeQ08jWoIzfCpTmKGLjZbwRFhcB/jRjMq8Z4+b4F0u/RHkDHr
         8RbQ/dR3VImYSIBsR3hhBUt5xWVok4t5s44GeQLLUKIqHI8Bdm9FqPpwogN7wOjoUUIg
         UiVrMQzCCeVb1khDMAgb4ayz5DcJBP5mlKxJLMgHsYEQXbHbY3rdWgl2Nu0jvfc+6PY+
         H8rPWCvpJPFCgLECoWBHXNTkj9+Bg9DhCQR91DfBK5xegoCBtHjH4zkNHmwU4r0peYht
         cPEomarmlDJucpqdHaEm4+eDE8g+66QJwioT4XcZyNB8R+2CEHZUx8jS7v5lTj9h91B1
         irOg==
X-Forwarded-Encrypted: i=1; AJvYcCWNwB7aXLibn+VHmqic5zs7r+nv+ExyJAFCVyLJ0v8baULsxyDSqh/LdBYsSILnP6fcmzvdVhIczriU0x4vVUsM@lists.infradead.org
X-Gm-Message-State: AOJu0YzWDx8lBXA7CX3B3CbponjXO095w6ocYduRZYm5nNpuJN7Fx8Xy
	25DCluM8I8IrDUKtRnxT3qfbZblZ2F+VC9wc5/ZBLrA4pLdbhERPjY3IwWrLWhLZ
X-Gm-Gg: ASbGnct8pFMMuF+LVOq7Mp72AEwBMpyhOLob7sk/Z39/kkGRdPaEDoNN74KgXWSIbYg
	NDURnOJPe+zgDlslrUc8J7fls3vZVtE6Vg0WvtxuYkgZhZaBgC2PS5Uqs1mAwC4aAMfWPPJfyql
	05P4jFA7ZwRzqSDZEs3sfT1VQvpRbAbkzXA3Fkd5UKAThaILhrR/sCIqxalak5ZVdqYwHzatefQ
	z5jGffE+yR7A1vtzYVB8NCILS8OO12k1MesxQsP7Tn6aYw6a5j+R/HVi83Rw5C3PTto/D1/lBrO
	iYeTScRQe6isKvZwXXv7vgJFEIqXh8XPUAw7+lrvuap79gMCrf6T1LaOxTLzp+yfDd/8QGJnyo1
	2evGAtHy9DfOGgVccJwA=
X-Google-Smtp-Source: AGHT+IFiddYdZqNCyUIUzCtpD1ZLqlMCG7KfyIekFPlm3+QDDYw9fyOwWq9sa0nxD+uhEnsB9CB0gQ==
X-Received: by 2002:a05:6512:1252:b0:553:2154:7bd0 with SMTP id 2adb3069b0e04-557f82f5770mr601440e87.5.1751962728554;
        Tue, 08 Jul 2025 01:18:48 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c2288sm1588308e87.222.2025.07.08.01.18.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 01:18:48 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b561a861fso34344241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqk1qstLD8iHDqyipvkF8PhFWBfxorFNteuxN/8H6y8Fid6eC+YZsGS353jd09LwSI1Gha91MNxpuf7Jy90RhY@lists.infradead.org
X-Received: by 2002:a05:651c:1a0a:b0:32c:b83d:64ab with SMTP id
 38308e7fff4ca-32f39b07025mr4745291fa.24.1751962727665; Tue, 08 Jul 2025
 01:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250707165155.581579-1-paulk@sys-base.io> <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
In-Reply-To: <20250708003348.58fe509f@minigeek.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 8 Jul 2025 16:18:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
X-Gm-Features: Ac12FXxSawVr5l8DSW2OyggsnlD_AQQGgECd75bIDcC2Q3K6HqehhpaNB0rYrHE
Message-ID: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_011855_839934_1B82A94D 
X-CRM114-Status: GOOD (  26.50  )
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

On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Mon,  7 Jul 2025 18:51:55 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > The Liontron H-A133L board features an Ethernet controller with a
> > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> >
> > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > order to let the MDIO core properly reset it before trying to read
> > its identification registers. There's no other device on the MDIO bus.
>
> putting the PHY reset GPIO into the MDIO node is a clever solution, I
> was struggling with putting it either in the MAC or PHY node, though
> conceptually it would still belong in the latter, I think. But this
> might be a more generic problem: for most other devices we activate
> reset and clock gates *before* trying to access them, though this might
> be historically different for Ethernet PHYs.

The phylib core has code to deal with reset GPIOs listed under the PHY node=
.
It might be worth checking why that doesn't work.

OOTH, there's no code to deal with regulator supplies for PHYs.

ChenYu

> > The datasheet of the PHY mentions that the reset signal must be held
> > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > be on the safe side without wasting too much time during boot.
> >
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>
> Despite the above, this looks fine, and works for me:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>
>
> Cheers,
> Andre
>
> > ---
> >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > index fe77178d3e33..90a50910f07b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > @@ -65,6 +65,25 @@ &ehci1 {
> >       status =3D "okay";
> >  };
> >
> > +&emac0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&rmii0_pins>;
> > +     phy-handle =3D <&rmii_phy>;
> > +     phy-mode =3D "rmii";
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio0 {
> > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > +     reset-delay-us =3D <2000>;
> > +     reset-post-delay-us =3D <2000>;
> > +
> > +     rmii_phy: ethernet-phy@1 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <1>;
> > +     };
> > +};
> > +
> >  &mmc0 {
> >       vmmc-supply =3D <&reg_dcdc1>;
> >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>
>

