Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CA9C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9F+TxAK59NeECzWaCSq6LsZiiaeXm1m0Z32HekzxZw=; b=faNqf+lx2OCH/x0aXVzE/xE+nC
	QtwCDpyVZqgWjOAvCvQUEEwbL2g4TOb4z2UtfcWvZ2i49DJuu1cIVNtCtHym5ojy6AossM2cAFJwS
	kwHos2PZ8tGvfl2YpMGOZ2InZ+NxWvSaOw91XumCCIcY4FBivNJmfTXh5XrnsELJBZvUupZxf5Zvv
	hRtsbYH2un4m145JMPIH4ZdwOx4tp6DiOnsDZmKUj3iYBFlOq29oAZOxX9/96Hx75fYM+7GSi9B7w
	O16Ap/dtcFyrrq4scq1uVQB41SG9t7b1FQtP8edElPoBD0LwjpzdMDSFxE0d/ggqbqeIALfzWLN0D
	vUCiPISA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKur-00000001vRK-3f38;
	Mon, 27 Jan 2025 08:56:21 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKtX-00000001vHE-0RcN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 08:55:00 +0000
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so1961192241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 00:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737968095; x=1738572895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9F+TxAK59NeECzWaCSq6LsZiiaeXm1m0Z32HekzxZw=;
        b=Vnrhk1N/Bfyux2wthLKeoNxCmLgoSxDTab+wA6ZNlFgc0ID6qGQAEN5Q1YBs5Q5LWD
         iRWvEU1adCXVegP3JqLZcEWHhD9GXZG8dTXVyZGtlxCnFqlgKofRTik4rHrWvt8HJcHM
         9lqQ7Pl3JOazqU2FcdvYOmGfcpH3VIb8TISkE1Wc8+dZRh1dyAwYblaBcey/wj0DHOoc
         PzMARYOYoX6cEVyk812wiB5Fci3bmfgghE0KUeI8l4vfX2dZfZ+eU8+wJDqX10X/4bgI
         bzT7tGAcmfDONdvKgSeppX3WGekM+iqMwihhV4JzC0xPBwBr3lPPbZkwecvtVA3Uq1rj
         EZZA==
X-Forwarded-Encrypted: i=1; AJvYcCXfdbADFIo5Xzt9W/opuUVajfrcEmuaK4fvsrGsj1LJzrVg0xbTjfpb1Z8U0cZeaZgCFQAMRRTL9PdDNsT1AD9V@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvuj27Znh/av5h0iI2e0DnxxONlFjTXWi3AzMd9V0Lj93Np/zS
	7HQB3qPHVJkMAMMYq5AMS+2KJogbD+IKZ+vJcRFPirLeHfVZwzXs2//32331
X-Gm-Gg: ASbGncuU1I7NFZFCfuADW6Bt42F3fYF4viI20Dokw6FERmD/xxo1StZ7bcEoCwOXdqQ
	uFEE2QNUt0OiDJjvtnp3XqVnFzN3bnZ96DiD2jywHIavOKAAWia2BRJJrO+aHC14YXsMRR5kJZ+
	bq0MjTj9Wz4OrcBUVdkMb2dvPeguPEx4OLe8P+xCSihPtFlYEcWYkz1fUkUTg/X1GQ0on8UxehW
	uvKnk/o6rjZOao81/hgnbveqrMaItoOlh3DXHCm+EO5aw3Ad2iIu1gjEDMuGtwOjLJby0r1IrfH
	Rq4YkuAolgsJUS5V04HpeqjsEq0SoTqykdk4w3hyU48=
X-Google-Smtp-Source: AGHT+IGKdzDRusVhfy/mAxPKHz/fr2lNmBHS9rnCBvrYaPHP222gVxUkQnWTC7OTUvzn/Oo+txTAew==
X-Received: by 2002:a05:6102:358a:b0:4af:b94a:3c3e with SMTP id ada2fe7eead31-4b690b7d1b7mr33129265137.5.1737968094919;
        Mon, 27 Jan 2025 00:54:54 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9c41966sm1811038241.31.2025.01.27.00.54.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 00:54:54 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso3544288137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 00:54:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcFZVpSYhuPauWFKGsOoZVk1hR5XKn8XwrxiFRN0hHNct3J5gvvJnD5LVD51ZiRNsZi3F1/kUM0Xjny5FX968N@lists.infradead.org
X-Received: by 2002:a05:6102:cc7:b0:4af:f8b9:bea3 with SMTP id
 ada2fe7eead31-4b690c133femr33227684137.15.1737968094127; Mon, 27 Jan 2025
 00:54:54 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
 <20250125121826.6abbe7de@jic23-huawei> <3c7f5a92-254c-4ce1-9813-80c98c1f549e@tuxon.dev>
In-Reply-To: <3c7f5a92-254c-4ce1-9813-80c98c1f549e@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Jan 2025 09:54:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPPTyuJuWDEuHFT8EQCTVpy5=UtDh9GajdWUvZBNqy0g@mail.gmail.com>
X-Gm-Features: AWEUYZlBCMBeiGGvD1sWSlFCz6506_HlXAlHnEL_mbLHnwjAY1mMPTgOEuwKsRo
Message-ID: <CAMuHMdUPPTyuJuWDEuHFT8EQCTVpy5=UtDh9GajdWUvZBNqy0g@mail.gmail.com>
Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Jonathan Cameron <jic23@kernel.org>, rafael@kernel.org, daniel.lezcano@linaro.org, 
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com, 
	sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_005459_147922_AD4FAFAE 
X-CRM114-Status: GOOD (  26.58  )
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

Hi Claudiu,

On Mon, 27 Jan 2025 at 09:33, Claudiu Beznea <claudiu.beznea@tuxon.dev> wro=
te:
> On 25.01.2025 14:18, Jonathan Cameron wrote:
> > On Wed, 22 Jan 2025 11:29:19 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that repo=
rts
> >>> the junction temperature. The temperature is reported through a dedic=
ated
> >>> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
> >>>
> >>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> Thanks for your patch!
> >>
> >>> --- /dev/null
> >>> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
> >>
> >>> +static int rzg3s_thermal_probe(struct platform_device *pdev)
> >>> +{
> >>> +       struct rzg3s_thermal_priv *priv;
> >>> +       struct device *dev =3D &pdev->dev;
> >>> +       int ret;
> >>> +
> >>> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >>> +       if (!priv)
> >>> +               return -ENOMEM;
> >>> +
> >>> +       priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> >>> +       if (IS_ERR(priv->base))
> >>> +               return PTR_ERR(priv->base);
> >>> +
> >>> +       priv->channel =3D devm_iio_channel_get(dev, "tsu");
> >>
> >> Given there's only a single IIO channel, you could pass NULL instead
> >> of the name, and drop "io-channel-names" from the DT bindings.
> >> I don't know what's the IIO policy w.r.t. unnamed channels, though.
> >
> > It's supported, so fine as long as no future additional names show up.
> > Will just fallback to index 0 I think.
>
> If everyone agrees, I would keep the name, too, to avoid complications in
> case this IP variant will be extended on future SoCs.

Fine for me.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

