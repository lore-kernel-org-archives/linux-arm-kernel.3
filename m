Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57084CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1Ze1kviCEIrxhfhCfVhdFc8oKHfw0x+r03FrQAz5jM=; b=xqCN/9tOdT7s+B
	9tolyI/6hX4NeJEYWp7TVMOce6EB/9f7dolg42NQ8ZqYhNHr0Qc5GKFVfpjupa5ppPX5gEqtlQZRT
	T0MRiv006+VzAVpfmWXY8En8LC4XEpqsO+QJL0OR+ywiI7ui9QCqpboi90uaj7B+Jcsze7e0V34Qb
	ZErTBL7t10A10VIRLGJZxfJ6Nz2ZOXPhp+UGzy/V9K/vcF73zDS/IRg8Sgl91UEZNeHCJhUSuB62M
	aEb7EBoay1sTFJI6sl7f+EuOfJQ0JN3TsuojO57ySuPAthWOhlhtOCpUmIT7OdFk+WXOLpZWGMe0l
	d0O6RRvqzQ5l1ammcXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umETK-0000000EQhk-07Xh;
	Wed, 13 Aug 2025 16:37:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umDlG-0000000EG0I-3aom
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 15:51:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E9E245AEF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 15:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B13C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755100294;
	bh=Nned+2OXLAR4zbMBIAOqe5xsNi80BA2aVmJkwOizo/A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=i/jlqWEG2qrnzPbOAkn2pwy/ONAMApmORy6Hcv9pxZFQVqswqUP1H+G1evZke+33I
	 FJ6/+D/0HY40qcpoM/rkOknERVPvGNGN3fUmcTkfaKj5Ob06Ind2VR6bmjGC16sDV0
	 ogmjo0Y6BnY9SMKqN0w9ZOX0VXvj3d3tayjvpxXem+zc/hwV3xFYbzVAkX0RX6mkDt
	 4bcHHoBWDLQ2KF7fb3q77jgK8QzoWmHM6+T/aEXR1jjpW0JqhwtNEYftLG40UN9wOQ
	 DrxQiQsDQMPq1MvBwXuiGXcZYLD1Q/JZldBn7EHyTBz7a2IFCzJPzgFXqkNgsw0dJc
	 5KBKkl10clslA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3322a34e84fso57752811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 08:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfeqW02jE30H2iE8fmLrFek/Nm97WH4YqPggw01LdyI8eCbqCPcTnagc+LDDQNhRrKnUmHjUFIuYA6IFQt41Pw@lists.infradead.org
X-Gm-Message-State: AOJu0YwtHuhph7jSLenc6JY76EBv1qkmghz3jZ5DXTI5/Fj1VvKGsl0W
	4v5s+4zcoBgrVrIMhg12dWNmyVOQH5Fedp2AIV1UqDDyYHtmiFlXi5x+QJcj5CUV27TfvC5l3+0
	YCnXKE/2qRqNPtYtnpI3LDhfdr5cU+6I=
X-Google-Smtp-Source: AGHT+IF/AlFvjXg9axEmXPnPSPFeb7xCGFHKQ17NbUjRATjXnSeff8Hv94XSiaaI3kXUimdVd3Yinhj/CTkIyHUENJo=
X-Received: by 2002:a05:651c:20cf:20b0:332:6304:3076 with SMTP id
 38308e7fff4ca-333e9548740mr7131671fa.1.1755100292240; Wed, 13 Aug 2025
 08:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250813145540.2577789-1-wens@kernel.org> <20250813145540.2577789-7-wens@kernel.org>
 <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk>
In-Reply-To: <aJyraGJ3JbvfGfEw@shell.armlinux.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 13 Aug 2025 23:51:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
X-Gm-Features: Ac12FXym9NQN41ia2Vqvuf9FmKIFWMrTnliSDOIAEvwEtKHt0VT0y1bsZEx7Lbg
Message-ID: <CAGb2v67cKrQygew2CVaq5GCGvzcpkSdU_12Gjq9KR7tFFBow0Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250813_085134_933755_435DC66A 
X-CRM114-Status: GOOD (  19.08  )
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

On Wed, Aug 13, 2025 at 11:12=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Aug 13, 2025 at 10:55:36PM +0800, Chen-Yu Tsai wrote:
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > index 70d439bc845c..d4cee2222104 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> > @@ -94,6 +94,9 @@ &mdio0 {
> >       ext_rgmii_phy: ethernet-phy@1 {
> >               compatible =3D "ethernet-phy-ieee802.3-c22";
> >               reg =3D <1>;
> > +             reset-gpios =3D <&pio 7 8 GPIO_ACTIVE_LOW>; /* PH8 */
> > +             reset-assert-us =3D <10000>;
> > +             reset-deassert-us =3D <150000>;
>
> Please verify that kexec works with this, as if the calling kernel
> places the PHY in reset and then kexec's, and the reset remains
> asserted, the PHY will not be detected.

I found this to be a bit confusing to be honest.

If I put the reset description in the PHY (where I think it belongs),
then it wouldn't work if the reset isn't by default deasserted (through
some pull-up). This would be similar to the kexec scenario.

Whereas if I put the reset under the MDIO bus, then the core would
deassert the reset before scanning the bus.

It's confusing to me because the code already goes through the MDIO bus
device tree node and *knows* that there are PHYs under it, and that the
PHYs might have a reset. And it can even handle them _after_ the initial
bus scan.

Describing the PHY reset as a bus reset IMHO isn't correct.


ChenYu

