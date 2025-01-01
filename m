Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4B2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jan 2025 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIrh5/xF9foHE2ZtaHkAInkCtUR6yzl9To1EWrJQ0MA=; b=48tqTTY+3e327t
	11H+HPtFX+Dsap2bhfcjqlKfVwCbTrVMjDwIk2J23/0/GDwuph9Uvsl7Sm0WeMC5nN8In1bMiV4ft
	WrPclopJjS4QTcE4NJAZ3KyAFqKDSKPJtJ09zsw0za1ltudrTJfIWm7f6xYjs5/G1qbx3dcP54+zp
	plVFYSzWkpEJUCQ5Cp2EArOTmtadLJ4dJS1oSYENxm1bgbkZxSRhneA4BaGwsWbhAlysg07Xn3iJq
	TgRnHIDyAgF6tCamqRdlJRyGmMOY4tWwOnAV1JAJ3XN20zHbZLi7FKbWR/Ayvqdp41vHKAgsl9Sis
	iyX2zHR5zuoSnhiIoMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSuXn-00000008S4V-2Us8;
	Wed, 01 Jan 2025 08:57:35 +0000
Received: from mail-lj1-f174.google.com ([209.85.208.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSuWY-00000008RsD-0Jqh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jan 2025 08:56:19 +0000
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30227ccf803so124475191fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 00:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735721774; x=1736326574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIrh5/xF9foHE2ZtaHkAInkCtUR6yzl9To1EWrJQ0MA=;
        b=WpsZb8fEdAGB1Xa7WZH1/Akm6ddk2LkPg+sS8BCQmt6/deOWczfc/tl/35twPS7TYL
         fbpJ9wsh9FlQX+dxLo2v44ak7fM2YlmTDsfFMKczj7RrjNq1aK1hUdNn3nUIonxBntNr
         fU5qjR+VdSZfxCpmqmY2tcj1QtpGV5MFzpBzDq6lhvGWAFZvS3nRUiuanMXxbXbIeov4
         s/TT2zV6kFrs3nltg/XuQGcYRs5nJkvLAD8kTzNDue2xY/jIA8XV04Dp1Y4ntSg9jNNK
         lhRYt644GVF4Us2VQIA01tkvlFKdeGJ+6sNp9tEXVIOfPM6KQJwOChlZm0BU0H2T0Hd7
         a8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdgvfK6oHcde5Ly4Ea4kIQGRa11Yq1FxwxUSEusMf500OnmaP+fS+pzTsmn0ef/V1CkpQioZumJIHc+3lmVeTU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8f+rXGY+xW7Qk5r4R7/8RuXOmfN/gskHUmdptT3g612V9/1Tt
	xKuhQCzF2hiQF9JeaMYGHcpTY9v5rLl+7yhka7lqJvfS54gg8c6O4s1z3XhP
X-Gm-Gg: ASbGncu7YtlViEuaLNYOHyopUnTxocS3zkHyezQ1Qo5+4eVgrkeNpIOqftM9Pe+qxgM
	2F4MNeY5e3ndMhWWVQ7fT4N5U0TMlRZN4al8AgXNT0Q41nQUxFMHkIzenLTYmimN408aWIbNI1p
	DiSGNkkbhQ32hINKCKEf3QuptyeHTTfXKWF279fhD6Xoj7fy/79qm4dkEkS6qWORJrsoe8LVsiP
	IlgJX1uIG/F0UfzN3wLBo8jT0oxXgcVr3cZ/cozP0v8YMa3Uh2uHGhfJSvoMgomrQeGd1bnByVU
	8RvKJ+YF1aaL4g==
X-Google-Smtp-Source: AGHT+IHmh6lQY4hGL8wEsdepj+Pee+b86fndlUA9qTWcHytPJC2OYmoeBhIOEmyyDY+h7ytB6UWKew==
X-Received: by 2002:a2e:be1a:0:b0:302:244a:da2c with SMTP id 38308e7fff4ca-304685f71b6mr120151921fa.31.1735721773738;
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082d64sm39318561fa.109.2025.01.01.00.56.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30227ccf803so124475001fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jan 2025 00:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUl7ESCTiiyg+UJPXjZ9rJaXUN2Eq4yIMgSIsDjLiVANFA0h2lanoDbM6COx/XATiI9bhwAh6nLTszDnYPCnFWz@lists.infradead.org
X-Received: by 2002:a2e:a54a:0:b0:300:34b2:f8a3 with SMTP id
 38308e7fff4ca-304685482c3mr137981211fa.13.1735721773198; Wed, 01 Jan 2025
 00:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20241221094122.27325-1-ryan@testtoast.com> <20241221094122.27325-3-ryan@testtoast.com>
 <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com> <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
In-Reply-To: <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Jan 2025 16:56:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Message-ID: <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_005618_164746_474A7642 
X-CRM114-Status: GOOD (  26.54  )
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

On Mon, Dec 23, 2024 at 5:20=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> Hi Chen-Yu,
>
> Thanks for the review!
>
> On Mon, 23 Dec 2024, at 6:15 AM, Chen-Yu Tsai wrote:
> > On Sat, Dec 21, 2024 at 5:41=E2=80=AFPM Ryan Walklin <ryan@testtoast.co=
m> wrote:
>
> >> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver s=
un50i_h616_codec_codec =3D {
> >>  };
> >>
> >>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D =
{
> >> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
> >> +       SOC_DAPM_PIN_SWITCH("Speaker"),
> >
> > Why?
>
> The speaker amp is controlled by a GPIO, this needs a specific card contr=
ol to toggle on and off, discrete from the line-out volume. Muting the outp=
ut entirely is not what is required, hence the separate control. I also und=
erstand (although it is IMO not well documented on the user-space side) tha=
t "Speaker" has a specific meaning to the user-space routing. Can add this =
to the merge message.

It should be documented, and probably a separate patch. This patch is
for the headphone. Also, "Speaker" is a DAPM widget name and that widget
is what toggles the GPIO. So it's actually the kernel side routing.

And also, you can't remove the "LINEOUT" pin because it is referenced from
existing device trees.


> >> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_cr=
eate_card(struct device *dev)
> >>
> >>         card->dev               =3D dev;
> >>         card->owner             =3D THIS_MODULE;
> >> -       card->name              =3D "H616 Audio Codec";
> >> +       card->name              =3D "h616-audio-codec";
> >
> > Why?
>
> As mentioned in the cover letter, ALSA UCM in user space uses the card na=
me to detect and apply the relevant configuration, by loading /usr/share/al=
sa/ucm2/conf.d/<driver_name>/<card_name>.conf. Spaces are therefore removed=
 in the card name to make this easier to manage. Happy to add this to the c=
ommit message too, and this could be changed to card->long_name if it is de=
sired to maintain a human-readable card->name.

This should also be a separate patch. And yes please add `long_name` to
keep the human friendly name.

ChenYu

> See https://github.com/alsa-project/alsa-ucm-conf/pull/491/files for the =
UCM patch.
>
> >> @@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_de=
vice *pdev)
> >>                 return ret;
> >>         }
> >>
> >> +       scodec->gpio_hp =3D devm_gpiod_get_optional(&pdev->dev, "allwi=
nner,hp-det",
> >> +                                                 GPIOD_IN);
> >
> > Just put it on the same line. Lines can go up to 100 characters.
>
> Thanks, will do.
>
> Regards,
>
> Ryan
>

