Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E211DC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 20:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=; b=fJHM/7XYS9PDYAko/q3tpF06PA
	AOenLdKib85VLuPtRsq+9qLg4muKm8w67pdJfkUDbeDcpOQciwAzOxunL99weSLZuNAxKfl/NfNq2
	ZjqcJZXEtqTUaIo3LgfcrHAor44gPB4kY1kDJpo+35viNbOGZlQ27+6X5Ay9p8AziIJqEgHCVdR8Q
	N8Fjgg46X61jhF0ZjPhCCpACBPi9BV5k2NVrrLNsqibWI1WY2EzjeIEFNnvzEL17Wg0OuGD85KoRh
	uBeRUa61/WaoT9nD7IDlT/OTUc/niFMS/U0REZ9Pl4dsn2xLj3RAhPieLA+i4l3YgnBWvKHWwHjbO
	UwSjZJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Wnn-0000000FnBU-15gm;
	Sun, 06 Apr 2025 20:41:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WjG-0000000Fmq5-0mzb;
	Sun, 06 Apr 2025 20:36:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223fb0f619dso34107035ad.1;
        Sun, 06 Apr 2025 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743971789; x=1744576589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=;
        b=cpy+Q7W6rqViIYlpq/RrGdhF/Z4XMwn9hk7gphA1cX0WdwchJyKzp6vt2P7GI7P+Yv
         Q18ZM1UCL2G+SwakBNz75JGgENPxQnKwKMPwxn7tDnhVJupDcReUYApwQGs1bqUNZEu7
         J0wlrsJzr9d0dlK6C50l6wMFewk+IFBRG9139xh3oTJP9lNZLveoVJasBa09RjBG3EK4
         zt2Uu3LWOngJiRe8gD370tFT2o/UT8EyUbVRsOSw1q+R9CUEa8QPFyJiwu355gWWPB3W
         BFp26404AwT/b2h1THoEuWeIMCIWa9OqJk/WqdT8n3yXKzJoiKf+zmsnDYGEYJJtz0mg
         8bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971789; x=1744576589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTDKXTFTQLBPdri3otdi82MBqYNCG52DLi/ttprD1dA=;
        b=r3tSRMdFIHPtikFLhtEmn8RwNOrxG4hw755MQ14YGlUOMChxrlUpGifwgB5GVlhA/Z
         Y6i7QueXnP4Kva1pc+hByNb932IFuYniWM7Mw0yw2KERmjtPhELN88gcUi+DnZCVbAdH
         S2q/ukd2PfplQsFpcDQkvYXNPESS9aurYDrBA3dUCKeGQIR9uFrrvaH4bKP6LTu6isCk
         DA7RMXGOJHUlF1bf6FtyCQk9G/dkuBA26vJDiKAXFmwErcsL4nJDapCffe5DU/Cv2OS5
         O+Bybyk7luAGsVtq9/VSwDreWmi4U3UqszV6c3DAQTgI701sU9LGt/WrUTsX5uNhtrSx
         dJpg==
X-Forwarded-Encrypted: i=1; AJvYcCUPe8X/XHd8ei5nOR26OP4SyYVdMgYMHrsntAbEGFa3JAyADc59U++a1QNaQZUD3HkJalXeDAzA7DL4TmIpoJOV8w==@lists.infradead.org, AJvYcCUXkdy814N52IWhP2a+DoPUHxbqpcpnsi+r5VlXTHpegHl/h//ZACA71nS1yPrTDKn3pRgTiVZmmESLztMf@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFkjnjuQsMq5CJaHFuEYDHO8hW9xNcQ+udr9z4ILEoSnISpGA
	Gb8ySKmmJ640y63tKnPTA6bx9nPfs/oUxsBgt0hy7/7Fn8KfK6/5KZvhcIpFAZvlULY5Ja5uIHc
	Dx27J/a3o6+nGjMCiWmlOiFRpVJ8=
X-Gm-Gg: ASbGncurhS2BenYIxVFflnsFjVEjKI1ym93pv08AT7svk/AbotbyvFSZvOBbT14N5TN
	K4fx+47KuXA8Wr77CbBabt5O+jehOL0+dqjYMR8I2HErc0At6V32+X9tCgg6EVZu+0RgK6w8Mkg
	pbkjBnWpI8CZbXpnELNRZAu3Gk2rsg7VoUOHZSgAX9
X-Google-Smtp-Source: AGHT+IHVq/OJ+5eWqAgV0C40CkVvYiB3g3UpuuHrRaTOdnWvFTptDTYS2PzO/EixgKcm/7GKrRXQgpJN+Y1ESqaqhMM=
X-Received: by 2002:a17:902:f610:b0:220:fce7:d3a6 with SMTP id
 d9443c01a7336-22a8a06b429mr135619515ad.23.1743971789179; Sun, 06 Apr 2025
 13:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net> <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
 <Z-vjWFFWvo1gesCe@probook>
In-Reply-To: <Z-vjWFFWvo1gesCe@probook>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Apr 2025 22:36:18 +0200
X-Gm-Features: ATxdqUGmtk00PreuVDRwGTRsD3__is8AGxXyJNh6rRQ0MhHTNzn1k6d2MHuZvGY
Message-ID: <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_133630_233483_AB19BC4B 
X-CRM114-Status: GOOD (  33.67  )
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

On Tue, Apr 1, 2025 at 3:00=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net>=
 wrote:
>
> On Sun, Mar 30, 2025 at 11:10:28PM +0200, Martin Blumenstingl wrote:
> > Thanks for your patch!
> >
> > On Sun, Mar 23, 2025 at 1:38=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
> > <devnull+j.ne.posteo.net@kernel.org> wrote:
> > [...]
> > > +               eth_phy0: ethernet-phy@0 {
> > > +                       /* IC Plus IP101A (0x02430c54) */
> > > +                       reg =3D <0>;
> > Does reg =3D <1> also work on your board?
> > 0 is the broadcast address. It's unfortunately something that we still
> > have incorrect in a lot of .dts files.
>
> Unfortunately not. I tried addresses 1 to 31 without success, which
> seems strange; my guess was that the PHY should respond to one of them.
> I get this error:
>
> # ip l set eth0 up
> [    6.806847] meson6-dwmac c9410000.ethernet eth0: Register MEM_TYPE_PAG=
E_POOL RxQ-0
> [    6.810609] meson6-dwmac c9410000.ethernet eth0: __stmmac_open: Cannot=
 attach to PHY (error: -19)
Thanks for testing. Let's keep it at zero then.

> >
> > [...]
> > > +&i2c_AO {
> > > +       status =3D "okay";
> > > +       pinctrl-0 =3D <&i2c_ao_pins>;
> > > +       pinctrl-names =3D "default";
> > > +
> > > +       pmic@32 {
> > > +               compatible =3D "ricoh,rn5t618";
> > > +               reg =3D <0x32>;
> > > +               system-power-controller;
> > Here I'm a bit surprised:
> > Aren't some of the outputs used to drive VCCK (CPU power rail) and
> > VDDEE (everything else power rail, which also powers the GPU)?
>
> Unfortunately I don't have schematics and I wasn't able to trace the
> connections on the board because they're so tiny. So it's quite possible =
that
> you're right, but I can't be sure.
>
> Are there voltage sensors in the Meson8 SoC that I could use to establish=
s the
> relation between PMIC outputs and SoC supplies?
There aren't any sensors (that I'm aware of). But you can check
/sys/kernel/debug/regulator/regulator_summary and compare the values
with the ones from arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
Also the vendor u-boot and kernel logs may provide some information.

> >
> > [...]
> > > +&usb1 {
> > > +       status =3D "okay";
> > > +       dr_mode =3D "host";
> > > +       /*
> > > +        * This bus features a Realtek RTL8188 2.4GHz WiFi module, wi=
th a
> > > +        * 3.3V supply voltage that must be enabled before use.
> > > +        */
> > > +       vbus-supply =3D <&wifi_3v3>;
> > If you want to go for perfection then you can use
> > Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml as
> > reference.
> > It's also an "onboard" USB device which requires toggling a GPIO and re=
gulators.
> > The driver side is super easy to manage as it's generic (meaning: it
> > parses any GPIO and regulator as long as the USB ID is registered):
> > drivers/usb/misc/onboard_usb_dev.c
>
> I considered using onboard_usb_dev, but then came to the conclusion that
> I don't need it because I don't need reset sequencing, only power.
>
> > That way you can just describe the RTL8188 on the USB bus and assign
> > it's vd33-supply without having to (ab)use vbus-supply of the USB
> > controller.
>
> This does sound reasonable. I'll reconsider the onboard_usb_dev
> approach.
Thank you for the onboard usb device patches (for those who are curious: [0=
])!


[0] https://lore.kernel.org/lkml/20250403-rtl-onboard-v1-0-10ca9a6a4ee0@pos=
teo.net/

