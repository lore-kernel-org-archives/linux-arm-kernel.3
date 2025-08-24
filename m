Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535E2CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzOfEpNdjJTuxZ1kpLwZLOSeGO8C4SiGKyC8MoOHcz4=; b=WXxCFfUV15bBsG
	v/lifvLt6oD53bIGMmeVOIN7M2/qDoW7zTqbpLwu/yCP83muDkn2wI8bSjNBGk2h4oZNeKsL7Aki/
	6WDbqwB5gkKtufT8fpf+YvZR+B3kIXkoTVr+396TFMCVJIZlNMVNwQ4jPkvyEplz8F+ezAc/DTlVD
	RxIuLo68lRVJE12x1PmwW82rqVq3XaxyupfuzgK5Xnov1y02D18xuGCgFnoo5mx7GqMOqCib3LTye
	eKhBUXkmFAvNp1jHZXGwooZVwz7qX1i9xTDCDcuzS7TGbdjPrD2BaI3Yn/sG7ZwdJsRRPFaabD+CA
	gY10GK0oPwav2T07mz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq57q-00000005pS5-09l5;
	Sun, 24 Aug 2025 07:26:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq4zU-00000005oxZ-455F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 07:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C53C8A5864D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 07:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67281C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756019890;
	bh=0fh0gGpu0t//MXZ11+UqTS4MNTzyq/dz/PwrJz2CL/g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=GpY7tpEmUzWQ22Ku/8Aky16LAV3UD5t3Z971mEpzjCUmAoio4DZ7IA4GlDl4szkk3
	 h8v2g+R4zUzOcepxb89+3pSTHdO67PEjvXym3zcGjr4bThbWkFDowPpE6ukY3xpEYz
	 bA4WsCdIKq8HR9j8nQAJgbKyzc3+fxwwY38X9cTQ0fI+cC9quWaEVeW7+xUxSr54Is
	 I4bD38wF7zSwtS02Ndp+9HkZMT3D3PrsYl33GxopTuesUKzRLcm47hCCZF9VO27i9e
	 /lILvLBNVZS4IavTMLQ9nMg8uvnAxKhuLTYFUh3ayol2R7wm6T6rcHpyZ/A3Hp/GV4
	 xO5ZjLFsli/qg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3366766118aso4799241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 00:18:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5W9tnP3Vh+WxNWXb7VcPH9PRRRqq4vL5WXmHLu4fXhOxL4jKGNxL8065hY/POTPvO/lEUyY72d412ggynYUa1@lists.infradead.org
X-Gm-Message-State: AOJu0YyiEvgoTX79eAGkKjo7lxgURTjehf5Z/a9z+I2wp53KWpkqg7ii
	PANE8T9oNLRHaYBcfpP8402IFeyqBYJ0CjOdJ8wbrXqchRROM/77WFHPRMiG6fvJphUJRlcjGxb
	lNq8F7IDboRYEs/ATpm7paM1TBVEkecM=
X-Google-Smtp-Source: AGHT+IEJYKJm9oxMtoKhPUUIqoRJqzRy7kx4QCxWtWwOw/B6CTvUqPHyV5enNtb9irkZ5kRX/OIWTP9CV/YtH0uF8lM=
X-Received: by 2002:a05:651c:31ca:20b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-33650b8a25fmr13646791fa.0.1756019888725; Sun, 24 Aug 2025
 00:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250813145540.2577789-1-wens@kernel.org> <20250813145540.2577789-7-wens@kernel.org>
 <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk> <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
 <aJy_qUbmqoOG-GBC@shell.armlinux.org.uk>
In-Reply-To: <aJy_qUbmqoOG-GBC@shell.armlinux.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 24 Aug 2025 09:17:56 +0200
X-Gmail-Original-Message-ID: <CAGb2v6532sc3tk99OYWu5A92NYgPF3J51vsDGnMM=TtrS4TQCw@mail.gmail.com>
X-Gm-Features: Ac12FXxzg5NyZyTyJnQtY_4IH-x_XLg3gCT00louWNGK9on2RVQmjCu1YaIrTDY
Message-ID: <CAGb2v6532sc3tk99OYWu5A92NYgPF3J51vsDGnMM=TtrS4TQCw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 06/10] arm64: dts: allwinner: a527: cubie-a5e:
 Add ethernet PHY reset setting
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_001813_142498_CE465DFA 
X-CRM114-Status: GOOD (  34.01  )
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

On Wed, Aug 13, 2025 at 6:39=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Aug 13, 2025 at 11:51:18PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Aug 13, 2025 at 11:12=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Wed, Aug 13, 2025 at 10:55:36PM +0800, Chen-Yu Tsai wrote:
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dt=
s b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > > index 70d439bc845c..d4cee2222104 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > > > @@ -94,6 +94,9 @@ &mdio0 {
> > > >       ext_rgmii_phy: ethernet-phy@1 {
> > > >               compatible =3D "ethernet-phy-ieee802.3-c22";
> > > >               reg =3D <1>;
> > > > +             reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> > > > +             reset-assert-us =3D <10000>;
> > > > +             reset-deassert-us =3D <150000>;
> > >
> > > Please verify that kexec works with this, as if the calling kernel
> > > places the PHY in reset and then kexec's, and the reset remains
> > > asserted, the PHY will not be detected.
> >
> > I found this to be a bit confusing to be honest.
> >
> > If I put the reset description in the PHY (where I think it belongs),
> > then it wouldn't work if the reset isn't by default deasserted (through
> > some pull-up). This would be similar to the kexec scenario.
>
> The reason for this is quite simple. While it's logical to put it in
> there, the problem is that the PHY doesn't respond on the MDIO bus
> while it's reset pin is asserted.
>
> Consequently, when we probe the MDIO bus to detect PHYs and discover
> the PHY IDs, we get no response, and thus we believe there isn't a
> device at the address. That means we don't create a device, and thus
> there's no mdio device for the address.

It feels like a limitation of the implementation though. With the split
of mdio_device and phy_device, maybe it's possible to add some API that
registers mdio_device first based on information from the DT, have its
reset deasserted, read back the PHY ID, then create the PHY device?

This limitation also applies to handling regulator supplies for the PHY,
which we currently resort to sticking under the MAC, which is even worse?

> There is a work-around, which is to encode the PHY ID in the DT
> compatible (check the ethernet-phy binding). However, note that we
> will then not read the actual PHY ID (maybe we should?) which means
> if the driver wants to know e.g. the revision, or during production
> the PHY changes, it will require DT to change.

Judging from previous board iterations, I think this is quite likely
to happen. If the additional SoC internal delay values stay the same,
I would prefer we not run into this.


Thanks
ChenYu

