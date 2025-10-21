Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D425CCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 03:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lU61NbIuf1vInzy+Pn+xBUBJmxeYDZOSeRKP9GXZEqE=; b=uMfWuhPBi9VM5a
	zdKdMXcu5Z8wxRWqX9yp1KOI7k9+cQASy1a3peds2e5vQtPuKRsETn/8xdrugORbfnZSMNWuRve/A
	6MRkMvHpRj9yyYazzUGGCy5plMaLFqSZT6T9UPgkG0H+OwTlN6weu+onsQKdfH+0HUyFME9UfRc96
	GeK6qf0RCplNgHPzJfSh4aQTLAcAoVNEYgqh9UxbNFOBPW1ySwWB2CqeWkwyx1Jb+0J2DHBIgQaxh
	NLUeNwX1xHVz5CpjvtY+E8akwbuGrRdx1bqcgXUtiYxupbHySBp9N3bbrMp53XGWY7ONBZw1CEL/9
	XEPWgfdpbO2meAgAxgbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3P5-0000000FkU7-3tPq;
	Tue, 21 Oct 2025 03:51:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3P4-0000000FkTZ-3MUk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 03:51:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E058D61287
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 03:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF7DC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761018663;
	bh=aJyeINSKb1G3tVPbGfkA5Oqt5hmeaylrgY+aIoalhhg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=HVgViDMkKZyvApVhmfWv3KaZ8/4va6fCYtgkcHLXNQ7NMfudTTrSY5nHZ4EadmT/9
	 XwBmth48HLf8nsMOU5qd0efJHOyRa89Y9z72n1dfnMt4DLM/8gqMn9Pix024YQu4RX
	 5KPKEsfohJLWL9nLdcYixumNDgSRT722sxa8fLY0i83WAIgo7ePG7FZ9F/ir2iRYmy
	 cG4swh7viqYBG+yUcLIN5Yx6x+seEABCcMcQHdbG3l8Cjx+xJkOlrKMaz/SkjIOfk/
	 tqjmJKrP7t3jKNYeBUtXjkngniGzDxyiS7POP002wvICcSY2sRx9XWGtYEvfl3Lp+u
	 yWPkTkLyxh/8A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-36c0b946cb5so41095231fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 20:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1XPyntIBEGjOMuKlOLK08NgVJIO4Ah3yCG5aQBVoY+IYns2ldvpFqxjG6BCna7PrZicU39ARlaXpAK+8uJ+gj@lists.infradead.org
X-Gm-Message-State: AOJu0YxmMmWLdClBhIVFIB2PpclB6/yw/R0THYu4UtRss5eOHI8qlzjz
	9oWmkMXjsOTj4QJmjRiapoi2ygQ1RkaXcMJpGbfXsYmvIKM5Z9+VdWSURt20eAGiCMtJY2MwokD
	ZKu7aI1Z+P45Krai855/N/FnFl/bWfFQ=
X-Google-Smtp-Source: AGHT+IG8vasmm5hWdGe7KBlLp5chhcRp+eBr/myvEiV96lMVwrmDdir100cF1onLwBZjh0GCzdDPuKXAZ1yS7H+1U/g=
X-Received: by 2002:a2e:bc81:0:b0:372:9e15:8970 with SMTP id
 38308e7fff4ca-37797a0ca11mr52596901fa.23.1761018661756; Mon, 20 Oct 2025
 20:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251020171059.2786070-1-wens@kernel.org> <20251020171059.2786070-5-wens@kernel.org>
 <13867454.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <13867454.uLZWGnKmhe@jernej-laptop>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 21 Oct 2025 11:50:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v65+U2L8=HM6DimzVw=saK6rbR4Bzg7Nwz0Jyq6UXJkf=g@mail.gmail.com>
X-Gm-Features: AS18NWBDmVKtQm8S428O1qs2kjY6UgewUb3LycjUD4uEQoxwe6OCMS4j1ARdxWY
Message-ID: <CAGb2v65+U2L8=HM6DimzVw=saK6rbR4Bzg7Nwz0Jyq6UXJkf=g@mail.gmail.com>
Subject: Re: [PATCH 04/11] ASoC: sun4i-spdif: Support SPDIF output on A523 family
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

On Tue, Oct 21, 2025 at 1:49=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi,
>
> Dne ponedeljek, 20. oktober 2025 ob 19:10:50 Srednjeevropski poletni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> > The TX side of the SPDIF block on the A523 is almost the same the
> > previous generations, the only difference being that it has separate
> > module clock inputs for the TX and RX side.
> >
> > Since this driver currently only supports TX, add support for a
> > different clock name so that TX and RX clocks can be separated
> > if RX support is ever added. Then add support for the A523.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> > ---
> >  sound/soc/sunxi/sun4i-spdif.c | 28 +++++++++++++++++++++++++---
> >  1 file changed, 25 insertions(+), 3 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdi=
f.c
> > index 34e5bd94e9af..6a58dc4311de 100644
> > --- a/sound/soc/sunxi/sun4i-spdif.c
> > +++ b/sound/soc/sunxi/sun4i-spdif.c
> > @@ -177,6 +177,7 @@ struct sun4i_spdif_quirks {
> >       bool has_reset;
> >       unsigned int val_fctl_ftx;
> >       unsigned int mclk_multiplier;
> > +     const char *tx_clk_name;
> >  };
> >
> >  struct sun4i_spdif_dev {
> > @@ -323,6 +324,7 @@ static int sun4i_spdif_hw_params(struct snd_pcm_sub=
stream *substream,
> >       }
> >       mclk *=3D host->quirks->mclk_multiplier;
> >
> > +     dev_info(&pdev->dev, "Setting SPDIF clock rate to %u\n", mclk);
> >       ret =3D clk_set_rate(host->spdif_clk, mclk);
> >       if (ret < 0) {
> >               dev_err(&pdev->dev,
> > @@ -542,7 +544,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai =
=3D {
> >               .formats =3D SUN4I_FORMATS,
> >       },
> >       .ops =3D &sun4i_spdif_dai_ops,
> > -     .name =3D "spdif",
>
> Why this change?

Now that you mention it, this looks bogus to me as well. I'll drop it.

> >  };
> >
> >  static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks =3D {
> > @@ -572,6 +573,14 @@ static const struct sun4i_spdif_quirks sun50i_h6_s=
pdif_quirks =3D {
> >       .mclk_multiplier =3D 1,
> >  };
> >
> > +static const struct sun4i_spdif_quirks sun55i_a523_spdif_quirks =3D {
> > +     .reg_dac_txdata =3D SUN8I_SPDIF_TXFIFO,
> > +     .val_fctl_ftx   =3D SUN50I_H6_SPDIF_FCTL_FTX,
> > +     .has_reset      =3D true,
> > +     .mclk_multiplier =3D 1,
> > +     .tx_clk_name    =3D "tx",
> > +};
> > +
> >  static const struct of_device_id sun4i_spdif_of_match[] =3D {
> >       {
> >               .compatible =3D "allwinner,sun4i-a10-spdif",
> > @@ -594,6 +603,15 @@ static const struct of_device_id sun4i_spdif_of_ma=
tch[] =3D {
> >               /* Essentially the same as the H6, but without RX */
> >               .data =3D &sun50i_h6_spdif_quirks,
> >       },
> > +     {
> > +             .compatible =3D "allwinner,sun55i-a523-spdif",
> > +             /*
> > +              * Almost the same as H6, but has split the TX and RX clo=
cks,
> > +              * has a separate reset bit for the RX side, and has some
> > +              * expanded features for the RX side.
> > +              */
> > +             .data =3D &sun55i_a523_spdif_quirks,
> > +     },
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sun4i_spdif_of_match);
> > @@ -635,6 +653,7 @@ static int sun4i_spdif_probe(struct platform_device=
 *pdev)
> >       const struct sun4i_spdif_quirks *quirks;
> >       int ret;
> >       void __iomem *base;
> > +     const char *tx_clk_name =3D "spdif";
>
> Reverse tree?

I think that only applies to the network tree.

> Otherwise it looks good.

Thanks!

ChenYu

> Best regards,
> Jernej
>
> >
> >       dev_dbg(&pdev->dev, "Entered %s\n", __func__);
> >
> > @@ -671,9 +690,12 @@ static int sun4i_spdif_probe(struct platform_devic=
e *pdev)
> >               return PTR_ERR(host->apb_clk);
> >       }
> >
> > -     host->spdif_clk =3D devm_clk_get(&pdev->dev, "spdif");
> > +     if (quirks->tx_clk_name)
> > +             tx_clk_name =3D quirks->tx_clk_name;
> > +     host->spdif_clk =3D devm_clk_get(&pdev->dev, tx_clk_name);
> >       if (IS_ERR(host->spdif_clk)) {
> > -             dev_err(&pdev->dev, "failed to get a spdif clock.\n");
> > +             dev_err(&pdev->dev, "failed to get the \"%s\" clock.\n",
> > +                     tx_clk_name);
> >               return PTR_ERR(host->spdif_clk);
> >       }
> >
> >
>
>
>
>

