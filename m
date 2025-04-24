Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EA1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIj64A9Kj7dSdNG5r+KzTmwdGPe5B5brgWerOzNi7es=; b=k/KG8PS4SqJ/Ao
	eh/dfUsF00263M05IdGL2Lp/k9Z14On0b5pP27cEvL8YYEt4vB0VMuoCewZr0vl1J7H4NcYwGnx24
	947GGK0KSc6LMMBjVsluqn+kW1bfiQaF7c3a4dVPqfxyGkkwRXzCAKCkpS5GP1k3B+LbSBLanXfSq
	pj6gete4iAi6qLtrDxfbL5pcsfImr/Cws1BWIOJWO+DZnAkIHnXAosq7mh1gqIdZNgSzrFuVAU45n
	S6DD6+FLE/kBwbPLRxvQjiKtKXdSlr80eCsnjRyTRg9BbD4Dd6GQWkbS9bQDkXuyrc1cFq7seE0Oh
	jhbG/7e2WWG0T7LPJ8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vOV-0000000DyH7-433N;
	Thu, 24 Apr 2025 12:09:31 +0000
Received: from mail-lf1-f49.google.com ([209.85.167.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tp8-0000000DgKl-0AYI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:28:55 +0000
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499659e669so888004e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490531; x=1746095331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SIj64A9Kj7dSdNG5r+KzTmwdGPe5B5brgWerOzNi7es=;
        b=NbroIXENyYsUL0TmfE4TP9XcYIYgrT7Me9yx/jEhCW7osHb6tM9h1umfKe+rGmOM7R
         9FeDxWaysWPNm5YfQlRqgCOBLSs9e0gbgaRMZnSWsUtaGiKdFs9MyaNRYuEnYgV+zUZ6
         eDDcsEdjwRL1gkDr/coEM0a8qeRD5tBCxZaZr7IYHLLbQM8a1OGJzcTo+ey3ITLWsvUg
         TE8CYcNAXR9XtyexEuU1CEmcfR+IJvadRTJrC2TQCjbFf+JpAGb2B9jVrVU7T3HkphJs
         zOjfJ42DSdgWdgPlrAfoIuPyoAGiBe3Cd51wz025Xvg0tniVLJydEV+Myz25vp2zb9Ej
         t+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWxZdt5FV8b3bo64gYwuGHn8K25SCJ1TT2/2n3eE+CcCb1hFBG0QK9oHffck8vTk9BsyjWWDEJIQ7bwx2jEAar5@lists.infradead.org
X-Gm-Message-State: AOJu0YzNel9KzbR7Hr0OwibLhCsfU0Gw3Yj1/Rga3LUkIlqiszO/+adL
	y1RL199td9+UYjpr+wMjRgacRY7nzoTQ+CS7P6GUuf4ulXZlessmOt6atdDn
X-Gm-Gg: ASbGncuZqVzHgwDsu2qFpk9o8N7Tv0t61CrKVbrTToEnVB+XbDLSzlEoHfXN6++Myjx
	MN0AYwNs7Rg9xXb2U7dFtKZ/m6jeo9rmwLCZVH7Sa2ReDSR/5oDDp//2nKvbBKqPUDiCZulU5DJ
	PfHOwTnV+4abwnWOK96fKsu6Gzp4e3kvdfZChl7j/Jnhva+ItvjW2Q9kwHLT/yltM1QYSBm5BJZ
	MK4QcW0PefHJSwmygxzDSFmAaeG2SU/DYt8Be+d2fXLnowsHmhC3WDvdB9hgXuKC10jpX2Lzqo3
	yYGL3b24gPHgtVijnJlr6CVDOosKNpXbBiGL7a4WH6G5a5fGi4J0IwcqUB4Jm+HOqAEj8AvkGw=
	=
X-Google-Smtp-Source: AGHT+IF7en6o0MqaW3pf6KVBq3ryrC4bRJU5iS9LxctwkP/TVFlRtuwZRsI3An7tAs3RY6x8yuTMbQ==
X-Received: by 2002:a05:6512:39c9:b0:549:9044:94a9 with SMTP id 2adb3069b0e04-54e7c426de5mr555234e87.25.1745490530559;
        Thu, 24 Apr 2025 03:28:50 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26293sm186139e87.49.2025.04.24.03.28.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:28:49 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30c0517142bso8018921fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:28:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+0ECo9bq9MJ9UP/99PVlQ6278Qa5K6/PHDs98Pym9Ijv2BRaKd+TwrZ3hFjLde6V8s2DK7gAEqwZTQuQvBelc@lists.infradead.org
X-Received: by 2002:a05:651c:1513:b0:30c:4346:b1ae with SMTP id
 38308e7fff4ca-3179ffc88femr9768651fa.33.1745490529368; Thu, 24 Apr 2025
 03:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <20250423-01-sun55i-emac0-v1-3-46ee4c855e0a@gentoo.org> <20250424014314.146e088f@minigeek.lan>
 <20250424032836-GYC47799@gentoo>
In-Reply-To: <20250424032836-GYC47799@gentoo>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 24 Apr 2025 18:28:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v65WaC_6vExOoeRvhQxvk3fhiEyJL8Cfhyeq7vseMtoYUQ@mail.gmail.com>
X-Gm-Features: ATxdqUETS2xqqAY8auwUfOgAexX7AZr4wXke2z1Y8iAkz-BxG6Ttd6UjjiwNFRU
Message-ID: <CAGb2v65WaC_6vExOoeRvhQxvk3fhiEyJL8Cfhyeq7vseMtoYUQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
To: Yixun Lan <dlan@gentoo.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032854_080332_AEEC9702 
X-CRM114-Status: GOOD (  28.92  )
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

On Thu, Apr 24, 2025 at 11:28=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Andre,
>
> On 01:43 Thu 24 Apr     , Andre Przywara wrote:
> > On Wed, 23 Apr 2025 22:03:24 +0800
> > Yixun Lan <dlan@gentoo.org> wrote:
> >
> > Hi Yixun,
> >
> > thanks for sending those patches!
> >
> > > Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> > > including the A527/T527 chips.
> >
> > maybe add here that MAC0 is compatible to the A64, and requires an
> > external PHY. And that we only add the RGMII pins for now.
> >
> ok
>
> > > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 42 ++++++++++++++++=
++++++++++
> > >  1 file changed, 42 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/ar=
m64/boot/dts/allwinner/sun55i-a523.dtsi
> > > index ee485899ba0af69f32727a53de20051a2e31be1d..c3ba2146c4b45f72c2a56=
33ec434740d681a21fb 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > > @@ -126,6 +126,17 @@ pio: pinctrl@2000000 {
> > >                     interrupt-controller;
> > >                     #interrupt-cells =3D <3>;
> > >
> > > +                   emac0_pins: emac0-pins {
> >
> > Both the alias and the node name should contain rgmii instead of emac0,
> > as the other SoCs do, I think:
> >                       rgmii0_pins: rgmii0-pins {
> >
> ok
> > > +                           pins =3D "PH0", "PH1", "PH2", "PH3",
> > > +                                   "PH4", "PH5", "PH6", "PH7",
> > > +                                   "PH9", "PH10","PH13","PH14",
> > > +                                   "PH15","PH16","PH17","PH18";
> >
> > I think there should be a space behind each comma, and the
> > first quotation marks in each line should align.
> >
> will do
>
> > PH13 is EPHY-25M, that's the (optional) 25 MHz output clock pin, for
> > PHYs without a crystal. That's not controlled by the MAC, so I would
> > leave it out of this list, as also both the Avaota and the Radxa don't
> > need it. If there will be a user, they can add this separately.
> >
> make sense
>
> > > +                           allwinner,pinmux =3D <5>;
> > > +                           function =3D "emac0";
> > > +                           drive-strength =3D <40>;
> > > +                           bias-pull-up;
> >
> > Shouldn't this be push-pull, so no pull-up?
> >
> will drop

It would be better to have an explicit "bias-disable" here.
That way you are not depending on the bootloader setting a
certain state, or depending on the reset default.

ChenYu

> > The rest looks correct, when compared to the A523 manual.
> >
> thanks for review
>
> --
> Yixun Lan (dlan)

