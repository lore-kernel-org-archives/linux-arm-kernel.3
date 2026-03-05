Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38964EEF314
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfTie6sjjRqoc8VvjGkPKWkDcR9MnH5s+DJKluUMEqw=; b=wvkFlYF2yuq401phxHGp3CziP+
	plP1UkFgOseXV8RxEgy91DE+xmoXdjPrZf5HB2Wi162gG1f2HvNU9ukLKyPfi0YL1j8WE12QHY+Ai
	3c1OHouIDCzzdS3GLi6XI3CXvhAhGh22rWyStLOOzShmuRAHKZeabma6mCfubIthIKl3/NnTGKB70
	7hht8Ng9T8DDICSA5KRaU3du/BhesdRd0TDFnqm7JvHTbFPsNw4KSezIvqvl5KcuYGhQTINS5lrKf
	9eAlejk5oApnuIHh+6u4/PFsYr9ZBEdI9o5qxSjxpXt8SftR0SizGGcIhNM7vmF6TzNZEyXGKoCY+
	dzizxlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy33J-000000015N8-3iX3;
	Thu, 05 Mar 2026 07:23:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy33H-000000015MD-0ST3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:23:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439c944bb62so1132958f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772695397; cv=none;
        d=google.com; s=arc-20240605;
        b=MLr9VeuqM5cEAPlF6TF73jmG5uzM5ef/YFGda3YC/X5o7HrRzrdfWVTQpjMy5u2sDR
         CNC6vhFghpmQllhmedNIFlx2JAnt3sXE9Q6oNRY2jrfNK/veGB7U7jy/qikWHZI3lA1H
         YBn1CDIrfERHVRbLplr6moqMPARPR5tRNUUrS45n3pkZBXjez+YBYkCZqjeHlbFu6R+H
         tyjMx/3LyFA7K0c7eJW0eZlhtVt4/8N4eVMhp0qU6p2pHl4x6C6Vd7o7KOTp9QeFFKcN
         H5fTu6XGPrCHydRFSRYd1xY5p2XKIaYLcgHFPsudAdL/5Dc3HiilcIVpwkEDlkwtz5Ef
         bYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfTie6sjjRqoc8VvjGkPKWkDcR9MnH5s+DJKluUMEqw=;
        fh=DqMf6R4UQU3N6YHm7b86H8Cc8YvUO7UepcIdwlC74vA=;
        b=Lg7z8axMnYXuwxiShj3CUba2kIbTfD6n+deDAhd2AxJPMLQ1dGW8Ta1dihrGVBZALQ
         UIOnd18JiQ/M5DR2Em1xrtb/Ic+ACJggwDewAOQyVto2S06PEkMdGKHAcchsVY0eaHqL
         /0+xxYBt7Cci/O5ce+ROlSX1hvNiGqQ8vfE2eZnqUMtY0kbUsllhArOfMTPgvBXCs17Y
         NyftWsdb3DI0zKKqfjQgiP04AsXu79vpYvvnkhh8D5ZG8/Eurg3kkUSphdeXcz0J8c28
         WI3ZkJYm4eqatPhKaqtW5Bc8XAewADRjzvEqSSChrcTwzN7q/4CNGcZjjGoS0ddo437P
         pO4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772695397; x=1773300197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfTie6sjjRqoc8VvjGkPKWkDcR9MnH5s+DJKluUMEqw=;
        b=Rtua5nYzH9tmiQwdQbQhv8rKX1kFdMWOVwVKwPznak+rngJOBRwS9wY1wn2tkupwQC
         bW2jO61OBcpZF9htvasheehXweDswXs4Ey8z70UqT7Ug38FPG6ZKqCnQOVCOckDTUilv
         kAplVZ1oWGpCJmZeutjK4VqoQbKEbrN26JR/PMDEtE/S6uTXcXC36xNZdRCeHUHAI+tp
         2/BsQxZptfjEKI/tIYMt05fh8qizXHsrUPXyh3g/QnYNakrm+lopKK7dj7OURMP6hGQV
         3XF+/KM1ajP1aBWd+ApADam3h/xEOlVhtNvrP0mq9yhGz9T8RsgLGUR2dn8G1Vrl99Gl
         neIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772695397; x=1773300197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfTie6sjjRqoc8VvjGkPKWkDcR9MnH5s+DJKluUMEqw=;
        b=DP50cxGzjecikMxrnFzPsfSQzXY9Yrk6CJR+5OvBWK8g8gV81A6fk8IqdhVYr1ogIO
         Kra+bV31wuNx/Ier1tk+Zx5EFK2AFnIp1m2OF7tI8FX55moV0hxrbCpq5hH5DndQhJIs
         28Cqq0Y90Ki+7FWs7nh+gs46G419iUu8hS473zFDRwsqoqIZinxzr8aL+7Y+AQ8YoeYm
         ntF1K3C1vkXtErrXxyiZDdFMx4uHriEMJEvIGl4QmJ2V5OnMVtMnFl97CHcx+Dhut7dK
         r+jJmXguc4q+nB9rZLSOYkQupBmX4qqjUE5bToVSoET2D/emFVkp4xbT7/QnzFlEVl2N
         jDoA==
X-Forwarded-Encrypted: i=1; AJvYcCUgZNc/q8AM4Dmv3QedCE/EbNpKaRvTuXgzExqrXzxH2RfuD9T1x+zg1jcOdSFwc4PuBJ3Jx4troL25F9C7BWOY@lists.infradead.org
X-Gm-Message-State: AOJu0YzzF5vF5SPa3qYv1iNiHqk63Enmhjp9ZUju/jiFt8TNBkKsZjLK
	jz2XC0LW4D743w+AimyDtKv/3gyR/CK2IDuxxrS7AAwwhg46BEMsYv8r9N8S007qMRRohmOaX5v
	oe7fXixKNKPuYuqcv4r6S+O7pwebrUZY=
X-Gm-Gg: ATEYQzzcLBm3gxKxCzjclTN6KyZo73awvJ2pm/kH1G8tGHJmdHRNg8G9vHGD+4zM5fu
	zYMxoFzNQzrx8Z7u0MBTNRKFjJgSDQcrxdrRHsyL37sST0JynDMgYZc17/PQ3HPNVqeAw49SGo3
	Dzsty/Qdy76gjXk/L1Nu9JDG26XL3ZqFqwMwdOnqCrSyz5tinWAth8fekORl4iEC9qCSMchzCFz
	bobZR7Zdvo4jeWtgf08AyQb0nTVlc6Aitb2XewQf5yRJgfslko3UmsZZVhNLubtRV1dqpnHefr9
	fTvGLhWFJxquq2DtAbxVvaoAPHqRDrd3sjQZxlA=
X-Received: by 2002:a05:6000:430e:b0:439:b791:f91b with SMTP id
 ffacd0b85a97d-439c7fad55cmr8856048f8f.13.1772695396641; Wed, 04 Mar 2026
 23:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20260228205418.2944620-1-dennis@ausil.us> <20260228205418.2944620-3-dennis@ausil.us>
 <CALWfF7LZV07x7zAgufE_aa58s7x6e_ODAM2LgZqjbEakDticpA@mail.gmail.com>
 <CAABkxwsJ2ZnytCcHEvXWzNkjwzNThoTR23FAeHJLdf4JjXJEMg@mail.gmail.com>
 <CALWfF7+gdNqSgzk4uAnVRkG8vT9FwJDV46VXpb26hd7BzdaGcw@mail.gmail.com> <CAABkxwtG2e5LpjS-sScmn46DY3eXd6tyNCc1oNHKqoaO+PVwuA@mail.gmail.com>
In-Reply-To: <CAABkxwtG2e5LpjS-sScmn46DY3eXd6tyNCc1oNHKqoaO+PVwuA@mail.gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Thu, 5 Mar 2026 01:23:05 -0600
X-Gm-Features: AaiRm51FK2TekjfReO5yyq_AsAFtqk-i8QQCiDNrxrloJyJp6EjAnYYZQPYBnc0
Message-ID: <CALWfF7+_wRDW1UpV-Z05OOqQYDH=mS50aqKf46WvdHJubg7gKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Dennis Gilmore <dennis@ausil.us>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_232319_177175_7DDC5132 
X-CRM114-Status: GOOD (  20.20  )
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

On Thu, Mar 5, 2026 at 12:50=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> wr=
ote:
>
> On Tue, Mar 3, 2026 at 9:45=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> =
wrote:
> >
> > On Tue, Mar 3, 2026 at 1:43=E2=80=AFPM Dennis Gilmore <dennis@ausil.us>=
 wrote:
> > >
> > > On Mon, Mar 2, 2026 at 11:57=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.=
com> wrote:
> > > >
> > > > Hi Dennis,
> > > >
> > > > Some curiosities below,
> > > >
> > > > On Sat, Feb 28, 2026 at 2:54=E2=80=AFPM <dennis@ausil.us> wrote:
> > > > <snip>
> > > > > +
> > > > > +       /* Pro uses gpio-leds instead; pwm0 LED is not wired up *=
/
> > > > > +       /delete-node/ pwm-leds;
> > > > <snip>
> > > > > +
> > > > > +       gpio-leds {
> > > > > +               compatible =3D "gpio-leds";
> > > > > +               pinctrl-names =3D "default";
> > > > > +               pinctrl-0 =3D <&leds_rgb>;
> > > > > +
> > > > > +               blue-led {
> > > > > +                       color =3D <LED_COLOR_ID_BLUE>;
> > > > > +                       function =3D LED_FUNCTION_STATUS;
> > > > > +                       gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH=
>;
> > > > How come you decided gpio-leds instead of pwm-leds for this? GPIO1 =
C6
> > > > is muxed with PWM15_IR_M2
> > >
> > > the downstream dts uses gpio-leds  the GPIO comes from the schematic
> > It should be fine to upgrade to pwm-leds when adding into mainline.
> > The Orange 5 Plus did.
> > In the downstream DTS, they used gpio-led for the green led
> > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2=
b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-pl=
us.dts#L31-L36
> > But in the mainline kernel, it was converted to use pwm-led.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts?id=3D236d225e1ee=
72a28aa7c2b1e39894e4390bbf51c
> >
> > Jimmy
>
> Is there a reason the blue led was not converted from GPIO to PWM, and
> only the green led was?
There is no PWM muxed with GPIO3 A6. So the only option is GPIO.

Jimmy

>
> Dennis

