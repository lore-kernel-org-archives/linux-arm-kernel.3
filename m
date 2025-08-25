Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9547BCA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lf0SerB/BddtiPRZt6oTCzK0uyEGO4TRGC1HhfQpBU4=; b=ez09QdoO/DkLgk
	8raLGTPEa8mJ8SIBSdp/zaSQKbW6TsrvcIv1FrTV+hcBciBGG/nVOZsdC5m1m2bAYobNpHzi8u1ZQ
	xS3TYqRhVEs02clOhe0cnR8yz8cmFRXUTEdz673xESh1jkoo3fcVFk5lka+TY5G4aHj99k4PwvE49
	jEWe6IPjFQELc/trRTFkYAC71Yyv7qLa8Opyvw34vMrDI8WtoVDdwPhT6YDlB8qYrx5AyZpPxgLT5
	/RT/s3BNyaaMfTNXMbeBK1s4QasOAyr45uYz9vrlbYClrCBUsH4Xd2yyfMVyPtOKKdmzkb99WMM4G
	D1kF+HAZB+pK7YDvZh+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcY6-00000009Afr-1xQC;
	Mon, 25 Aug 2025 19:08:10 +0000
Received: from mail-lf1-f54.google.com ([209.85.167.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZK8-00000008YAb-1wPU;
	Mon, 25 Aug 2025 15:41:33 +0000
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f474af957so877006e87.1;
        Mon, 25 Aug 2025 08:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136488; x=1756741288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lf0SerB/BddtiPRZt6oTCzK0uyEGO4TRGC1HhfQpBU4=;
        b=MzpSnoSCb2c3awzqLSzVATIihLmNMhzUzAb73CQ2fyVxtmBxSDXB8FxsKPr79Yc7U0
         nzxSCbxQUbrgOLptJv9wUeUIKxtT6qRvVaPG2OujoEu211eB8LFf1l3/EQddfhNWXWE3
         ComLM8YOR3kibAM6RbzIQvRTUsQyhIBC1eqWYEXguiAIvvJLmf2UHo0dQA3T+v0EWeeH
         swy25rb3EHub5zgjfGKzzm3H+PaMYxpTkgBg613YGL3vmmq0tVOCAYkQ++o9mWw9oykX
         gvhwppqBjvxlSWH+LQz/7uBsrDYFfWWUcInFI6ZpN/rxdgpdK/bpp0cLnPWuZXwkzXzB
         wOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAwnOCggWxXjAH8k7p7GtK/H/KA2RE9ulrNVsWXR7Qz6Inzhelkmjf38uc6/A+AXlnbCAfveu+kieH@lists.infradead.org, AJvYcCWE8krUHpSEo8ZbWOkFPyxt01J9rB6EwRUpCvXQ0KGlK6yIamF4Uck/uwdarEJoQ6ioHdf3h5M6aw5sWQuxcM+E@lists.infradead.org
X-Gm-Message-State: AOJu0YwiXB2MaF8L07up9L6Ww9OO9CroIRXLSlzx7DUjfbqckBp5r6pi
	Rhx9c8It17o32aj0jChfd/0QIlCNxmcPA1hMOmQfJZacFxai3Mc9a8IURDe3i3xkHZs=
X-Gm-Gg: ASbGncsSEaf2TwcWwG/UfqvZa9rwjE2CPI6wn0hfiGTgeFsOpsJm6aIrCT5de3lkJCI
	h9SEXEAmzCC0SnslSWctIaY8H6Y3TpidABzuN/DXsF+YBkfcg+KDturP5OUkKX60t0/+zNF4Why
	FAVaOacSk7Bfxdb92gwOZFewJUaR4qwP258LFZqlUftCbuFTECGOW2IXEtam6khjnP//ckMsIYH
	WkaLbEo9rYcNaKed9SZVooVlIEkjFqWnbeLTsjlpe3aH4SS8YHYMBJPj/joZnflOcFLYvIlc3Xr
	Cqia8ZBiaBl94WEqfHtAYpotc+6mRLHgI22tDNmxys0zM+UjrtiC7pNbMetEejDTEIrHGJJukTh
	/tY87l+L0CaAmqqxlp4bLazYs7zSePOHq2O87NxH8GQavWGDuj3tUky71gcYgmBchFQ==
X-Google-Smtp-Source: AGHT+IG8158U2K9Ozy3WV6WZwFe7PtbroYoB3Nd5ASdb6zhCw8TXMYk7xHi1mJPEMFGtGSgGbEKsig==
X-Received: by 2002:a05:6512:6506:b0:55b:8f9d:4d00 with SMTP id 2adb3069b0e04-55f0c6a09f2mr3635185e87.3.1756136487908;
        Mon, 25 Aug 2025 08:41:27 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bc72sm1686165e87.79.2025.08.25.08.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 08:41:24 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-33670e8c975so9674501fa.3;
        Mon, 25 Aug 2025 08:41:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOYEP8gV3efo3prY6Ij1fLTKPb3Dr7ycwB1Q/GNe/MgYf6k7r+bOJU+Fkx62rXMWclmz4izlYPhadn@lists.infradead.org, AJvYcCW/LgcAqQpR6QqlI9i5gok8/qlagdjgSRR5fZm7Appgyo7jmpf7GZ3k9ZzqIz+TE8GzFc1sBujKV7yhaMoA9PaP@lists.infradead.org
X-Received: by 2002:a05:651c:31c5:b0:333:b656:a685 with SMTP id
 38308e7fff4ca-33650e3812dmr36899791fa.1.1756136484611; Mon, 25 Aug 2025
 08:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250816084700.569524-1-iuncuim@gmail.com> <20250816084700.569524-6-iuncuim@gmail.com>
 <20250816144936.3f2738cc@minigeek.lan>
In-Reply-To: <20250816144936.3f2738cc@minigeek.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 25 Aug 2025 17:41:12 +0200
X-Gmail-Original-Message-ID: <CAGb2v64vMvs+UN4AJWZAGnU+ZQRBQBheqnRKzbMmd10UMdOxCw@mail.gmail.com>
X-Gm-Features: Ac12FXyXTRSXu5z7cM1Z4ILcGzs0omRgBCqYp8gycWr1OzOdi7Cz8MsXeBWG_GU
Message-ID: <CAGb2v64vMvs+UN4AJWZAGnU+ZQRBQBheqnRKzbMmd10UMdOxCw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
To: Andre Przywara <andre.przywara@arm.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_084132_506282_C2167E8F 
X-CRM114-Status: GOOD (  24.91  )
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

On Sat, Aug 16, 2025 at 3:52=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sat, 16 Aug 2025 16:46:58 +0800
> iuncuim <iuncuim@gmail.com> wrote:
>
> Hi,
>
> > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> >
> > After adding the phy driver, we can also add phy node. In addition to t=
he
> > clk and reset lines, the power domain PD_PCIE is declared in this node
> > according to the bsp dtb. So let's mention it.
> > Currently, phy driver does not support role selection and only works in
> > USB3.0 mode.
>
> That's the current limitation of the proposed Linux driver, but should
> not affect the binding or DT:
>
> >
> > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index e4ed4fa82..233365496 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -606,6 +606,16 @@ mdio0: mdio {
> >                       };
> >               };
> >
> > +             combophy: phy@4f00000 {
> > +                     compatible =3D "allwinner,sun55i-a523-usb3-pcie-p=
hy";
> > +                     reg =3D <0x04f00000 0x100000>;
> > +                     clocks =3D <&ccu CLK_USB3>;
>
> Will we need more clocks (or resets) when supporting PCIe later? If
> yes, we should add them already now, even if they are not used by the
> current driver.
>
> > +                     resets =3D <&ccu RST_BUS_PCIE_USB3>;
> > +                     #phy-cells =3D <0>;
>
> I think we should use one PHY cell here, to allow users to select the
> PHY path they need. A USB3.0-only driver implementation could choose to
> ignore it, or require the number to be 0 only, rejecting anything else.
> But this way we keep compatibility with newer DTs.

Agreed. It seems this is the common case for combined PHYs. The last
cell tells which type of PHY is to be used.

ChenYu

> Cheers,
> Andre
>
> > +                     power-domains =3D <&pck600 PD_PCIE>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               ppu: power-controller@7001400 {
> >                       compatible =3D "allwinner,sun55i-a523-ppu";
> >                       reg =3D <0x07001400 0x400>;
>

