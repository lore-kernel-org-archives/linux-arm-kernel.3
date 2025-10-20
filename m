Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D06CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 18:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lgasQQcCbb45QPKrgRBKPXSjf6VXEtqHDLglvaizjD4=; b=TvHJ/eItqHauL+
	oacfJaAhUNz+/GwzjMlH6sz9kQZtkY3j+dBKAkqa4Ljy+bu28kjsQOEQ0cnr16mEjjiPQiXk9Kslh
	ZfVjWZpa5kmwqwDuv9JWr1pNGt4UQFwzyaHhqP1SyE0JujSgQtrgJBpQcG4wSFVQgHIsGnEkvXYpo
	fXv13gUjI7d+/g/BW1Ga+Oe6Zsr3A2bxa+r9NOcDQaZ9a/1qBmpcBe/hbVevriP9BXR+zi4xoSAof
	um2Ga9MSbiPpODTrJQqyROtXYLHRpD1CCYHsjmZgw0sUoA6hFr+FyBtttRIE4Kw+YMR/AIhJKa7ID
	wASlunBIAS2DrJiy5wpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuK7-0000000EapN-2LUB;
	Mon, 20 Oct 2025 18:09:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuK6-0000000Eaox-0jqI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65BF8620E3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 18:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0529EC2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760983773;
	bh=oKPrwAwmPcFNZGmDx1ZWXy1ZmIL+sig1bBBsB/7aJUU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=cElUcY9juSeNiBjy+AkG0mXLvgXLuSinG148FBwevxnzyyxzs38DdleUuvtzmuEzB
	 SH8INpi4KUw3KgsjR8GrstW4Y5gnuCHyF9IqUgXy2fy6SNyd/3rSmUFPZIfYZcOfqm
	 9ZtS2daVF952W50BeOX8oG+blrQfeL1PfB90fJJCHhcRX9KGb44VWLjGsQD2t9R1P5
	 cfmM/K5pGmIA8A9ihqTJP9ttrDFbwTSk13gkw49vtm3IBnMEgF2/YnE3tOEOxxxvhg
	 twMzL/eWbUVtqDHnTpBhxpsJnEW5584f2wrnVvVBbhoCuDoDNgIUrHKFVXCI8/52wX
	 TcbjfAXTQzR3Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3761e5287c9so53529291fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 11:09:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXMibZHXPkqW5qagfx3XcoXld+FODKEdcOAZPLKxmruwdH3U0OzNvcHL+qisSOHGqXza0n7MfBlJKnKxkT0wtHE@lists.infradead.org
X-Gm-Message-State: AOJu0YzDQXY35EJIpjd86K/lXxB3fhIC0qoJ2l192kqCAy8Mvv5XVcRM
	iQi37nYwLENIEG90YnUPPukn8L0h28J/OCo6wFIHSXNmK8JDSoTF0X4G4MXXaG4nb58DjMJR0wG
	WvQNSBat8FK//LqZDZj7aWQ+zyjIUrtk=
X-Google-Smtp-Source: AGHT+IFuWmZV6QNucFFpgj1UEioCDpFc0/s3jbB+5BwfcLRxENd3iLjRFZ6WKCDjV8YIsE8qTPZM2NSG8F6Mb8oD9G4=
X-Received: by 2002:a2e:bcc4:0:b0:36d:6ae3:8158 with SMTP id
 38308e7fff4ca-37797a0daa8mr37580611fa.25.1760983771244; Mon, 20 Oct 2025
 11:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251020171059.2786070-1-wens@kernel.org> <20251020171059.2786070-7-wens@kernel.org>
 <8591609.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <8591609.T7Z3S40VBb@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 21 Oct 2025 02:09:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
X-Gm-Features: AS18NWCT7E5mgPMwg3ZEBu9fYAxffaDigDTAPFUYOPP5rokDOnq4gkBQ9OJvhcg
Message-ID: <CAGb2v66osdLJa=_nTxz9wppUkxvu2fuS=NgYN8fKOUOLHw6-Ag@mail.gmail.com>
Subject: Re: [PATCH 06/11] clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll
 minimum rate
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 21, 2025 at 1:52=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne ponedeljek, 20. oktober 2025 ob 19:10:52 Srednjeevropski poletni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> > While the user manual states that the PLL's rate should be between 180
> > MHz and 3 GHz in the register defninition section, it also says the
> > actual operating frequency is 22.5792*4 MHz in the PLL features table.
> >
> > 22.5792*4 MHz is one of the actual clock rates that we want and is
> > is available in the SDM table. Lower the minimum clock rate to 90 MHz
> > so that both rates in the SDM table can be used.
>
> So factor of 2 could be missed somewhere?

Not sure what you mean? This PLL only gives *4 and *1 outputs.

> >
> > Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU =
PLLs")
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Best regards,
> Jernej
>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi=
-ng/ccu-sun55i-a523.c
> > index acb532f8361b..20dad06b37ca 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > @@ -300,7 +300,7 @@ static struct ccu_nm pll_audio0_4x_clk =3D {
> >       .m              =3D _SUNXI_CCU_DIV(16, 6),
> >       .sdm            =3D _SUNXI_CCU_SDM(pll_audio0_sdm_table, BIT(24),
> >                                        0x178, BIT(31)),
> > -     .min_rate       =3D 180000000U,
> > +     .min_rate       =3D 90000000U,
> >       .max_rate       =3D 3000000000U,
> >       .common         =3D {
> >               .reg            =3D 0x078,
> >
>
>
>
>

