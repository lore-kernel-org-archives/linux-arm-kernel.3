Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F61EDEC08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 03:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ck0SxwPDcv+Zqhqz8cZVKiShWiiww33rNFdcafCJLs=; b=hoECQuSocis2YEZQOkvBgLF85A
	oszal6PcxJjJnb+iLwC/oMd8w7wDzUdBsWlL7/UoFh6OkmfD81q0g3XeBS3+BMyWT8+mDpAqFqOk6
	drzzkHPLozZDdClWl5IooG0GtmRbBuVBiLHFYUigJH3NvDM5T8bGlQIdSKg61wOO639AVrz1i1EWJ
	1o4DK1BqfDUnqCXC2xzNLEtEhTFiBPZZu5PlUeCuDNRv8qMCgO4wdjWsi4jKoLDLCHJ3rY8IQb3A+
	CtLZRCSB/jkgRO8BcH8XkPuSO9ufn40PqVD454t4suIKmIYKRVxDbwkIA4M7tIkGRx0F6ZWUr2851
	9LeLT1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdBJ-0000000GOab-0vy1;
	Wed, 04 Mar 2026 03:45:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxdBH-0000000GOZs-0LYi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 03:45:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439b7c2788dso1879439f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 19:45:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772595949; cv=none;
        d=google.com; s=arc-20240605;
        b=IspoZKAFBvIAeuqxY3MjNnWVHBPO6jXFVDjD4nQyCY8VcOWlSvpG7Q0x7Qt6OAVC3r
         zRYEeQ9ayNBHPc2wjcsEhD7XQPr1qQyBi9pBV7D+C7V6tSEO3a8LMe4XOgF12U2a5hsU
         eYZD8z+LVRCfzrh1vvO2QXu+J1hbO/nCdwdVvC/TS2lQOYjPb1lraxb1az6NfJrQ+yHK
         ON6bABLtWWB6PNgP+06Tj6xjs/Xc1yoo7RdZKTY+q/ND1MZjVUzqpokPQnP6KyJ7YHMu
         bJwSribmmDj/BWenxPFcrSvFfkFpYgYrrojOrVkioUxijTEGl6u0GAPlCw+mk05XR4Lf
         wXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ck0SxwPDcv+Zqhqz8cZVKiShWiiww33rNFdcafCJLs=;
        fh=NSagDjSVL8vQLzHjPSxv8AzIEd0oJ7m+IUuhoswVgAQ=;
        b=WvMI81bZsWBbV5zAD6iOMcL2MqTAU6oMWss5he0EWRaZ0+eAvetCgHI6e92Cad6kR+
         KbenCKFL+WYsryxoSQgn8UAn6ltlqu0sH+GHmvpRfJhTf28YluaivsYSQ3Ewe3KHbRgZ
         JLgJpGCsx/Mu5+N20CdGlCne/tuOw7A5mtB1435yKySTGWo7Y7e4uX/fPpUh73RbHpFw
         maT5fZ/mwpoSXgg6NyWtonUM5fX5ZuwodI+OxLOCStAmVy8cAaluw1sFHRAmSFVzXsLV
         LEkACLu924xJnCtFzasPKn9MO656W81CdnvBPuybu6N0XfgrH62sBgZ08UQr+TZdYZGj
         cnqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595949; x=1773200749; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ck0SxwPDcv+Zqhqz8cZVKiShWiiww33rNFdcafCJLs=;
        b=fmIg1UnY30p6424AtdjLHzjf2vm2idkPPHNkjaYnu4CskTcthrz8znblfHelSiJNlA
         KNYggQvyos7T3qu5HptC93dngcBsZ7ygaCQt7cu51hKshwy2PY7IVVKacCOJnqCQYBWT
         9eQ3CcTA0jsf7tit95P0goTJh+XjgtQBPPBeMTZtbN9bw5O8VLgI2SJhinTp4XRTWarD
         k0yQXPYt+Me5IWeykfxMM7XM+SOMKTzV2UkBLpvEgYXsbLI4tl5uXNV2v/z1LsLpG+OJ
         f3YFZ4+S7Yvx7COTQaJauXtldEowOtqF62K1fJIB/sKx5J0U8bBCe5kFgHYb4TqKvijp
         NNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595949; x=1773200749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ck0SxwPDcv+Zqhqz8cZVKiShWiiww33rNFdcafCJLs=;
        b=C3wj3KhzUmHj6WRz581UDMPXVUQJkrLV6Z7FsJQ9hZ/yllrZeS1GEQ1pEAV6fiSvEt
         qoJPrnyWrWNJt1Bgs3BsHCk/hKu2ToAqQTnM6es8tQ1Olt9v6pppXT+oI7uh6VveRFfU
         KI1pyQ9U1Vy6q2bmG0frhcf/id77qMZ+CkeVI0VWEEqg+3WBpgAAXo5/4+PauC6bGG0x
         CxGiPNthkB1o0Ulz2t++YK/cGJh++pXdJCCKut9Nr0kGiwz0wCYfTEfw9mPBkdq2A47n
         MsAOZDYwD2391lVe+AO9dg9pnEIWiubdgeuNP4jf3emE4/Gl2yHxArTl6EhQx/vmph1q
         Fy1w==
X-Forwarded-Encrypted: i=1; AJvYcCW+EqtH4yWtD/VmOqgK9VJOZfObBensMuFBelj1+RspLMz/NNBqTYq3jQmYc/TkFhEAooHPZiCahHeAqG4yfiL9@lists.infradead.org
X-Gm-Message-State: AOJu0YzTNpnBf9iU+BbMUGlB/wxYUsHdIrzbW1SC8sca11Zq+dAfCY5f
	78rQzB5x5dO4mR8tDifp7scIlFB9PcB4RdwWxlymJQWz/d2UWFsc7CMM7xR0y6fuJnvALU77NgR
	hz5cKRmxO6eiJuoMUqDONOefuivfcAF8=
X-Gm-Gg: ATEYQzyloqonchD2CyxbyA87QJcNbb+EoaDu5B2kQHt82Zr0d7m0OJeMHKq/6LJdiTo
	yP7EHAXwNoy0tRuSldEOaYfP15HzhM2SGXe0Km6nHuLYS02kAopaHD/2pKYDqbwHJw5wfuSqR4k
	HpXZ5P/RaNpLYUWXp0MHYa151iWD4lLocfs9pUUsoyw6PVHiobpEu/2MlhiTXgvQh642fV90uNB
	sLQX7krhs0dlHhS5UU603GktbGVZVSmFD7qr893vaR0+VR7kShkIqjHgGF8v94LFKdRBbOzPlgT
	lle0g/rGsleAazZu1x/R0xoaizZNJaAexu2KqI8=
X-Received: by 2002:a05:6000:1acc:b0:439:ac53:a94d with SMTP id
 ffacd0b85a97d-439c80005a2mr1016259f8f.29.1772595949061; Tue, 03 Mar 2026
 19:45:49 -0800 (PST)
MIME-Version: 1.0
References: <20260228205418.2944620-1-dennis@ausil.us> <20260228205418.2944620-3-dennis@ausil.us>
 <CALWfF7LZV07x7zAgufE_aa58s7x6e_ODAM2LgZqjbEakDticpA@mail.gmail.com> <CAABkxwsJ2ZnytCcHEvXWzNkjwzNThoTR23FAeHJLdf4JjXJEMg@mail.gmail.com>
In-Reply-To: <CAABkxwsJ2ZnytCcHEvXWzNkjwzNThoTR23FAeHJLdf4JjXJEMg@mail.gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Tue, 3 Mar 2026 21:45:37 -0600
X-Gm-Features: AaiRm510_muOP2trKshqRAe1MQ9prhJ4qP0ttHmvpYHaggzE4klTOIJdcnDBxLM
Message-ID: <CALWfF7+gdNqSgzk4uAnVRkG8vT9FwJDV46VXpb26hd7BzdaGcw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260303_194551_172703_4D901D95 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, Mar 3, 2026 at 1:43=E2=80=AFPM Dennis Gilmore <dennis@ausil.us> wro=
te:
>
> On Mon, Mar 2, 2026 at 11:57=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com>=
 wrote:
> >
> > Hi Dennis,
> >
> > Some curiosities below,
> >
> > On Sat, Feb 28, 2026 at 2:54=E2=80=AFPM <dennis@ausil.us> wrote:
> > <snip>
> > > +
> > > +       /* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> > > +       /delete-node/ pwm-leds;
> > <snip>
> > > +
> > > +       gpio-leds {
> > > +               compatible =3D "gpio-leds";
> > > +               pinctrl-names =3D "default";
> > > +               pinctrl-0 =3D <&leds_rgb>;
> > > +
> > > +               blue-led {
> > > +                       color =3D <LED_COLOR_ID_BLUE>;
> > > +                       function =3D LED_FUNCTION_STATUS;
> > > +                       gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
> > How come you decided gpio-leds instead of pwm-leds for this? GPIO1 C6
> > is muxed with PWM15_IR_M2
>
> the downstream dts uses gpio-leds  the GPIO comes from the schematic
It should be fine to upgrade to pwm-leds when adding into mainline.
The Orange 5 Plus did.
In the downstream DTS, they used gpio-led for the green led
https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65da2b7b6=
47c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.d=
ts#L31-L36
But in the mainline kernel, it was converted to use pwm-led.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/a=
rch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts?id=3D236d225e1ee72a2=
8aa7c2b1e39894e4390bbf51c

Jimmy

