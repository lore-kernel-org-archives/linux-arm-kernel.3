Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE0D5E39B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 11:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGpnRGebtces+H0p57KZ/VOg+pG46erIWNYz0tqupxk=; b=3J7USMK1/twaqP
	vBJQKeHs3kUjJVnRClJP5Hwo4uiajzGgmv/6nuc8DN0X0oe1OPeSQT4Btp+kQTjdHOqtviANpYqqI
	yTXPimdTx5HCuPtjwFijOgZu8+2Iwcr95TDHm/XMHe+wCfMadNROzRI+PK+G31yCHn/7JIMSFmjh1
	HpoyPVAotRzENMk908sQXHMWyyffB+s6d81ZI0CvfSParOTvjxz0dUjakS5z/RzFhiFrLSE0IYtNw
	16vD3tTtNl/DDSVpqVybjQgdJO8xLpOW9gFhblWpu23yYudLGz6/ClFILzHX7KbSf9jZkNde6OyYz
	kJ51G+JSbz//+raSdmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA5w8-0000000ElKc-24eH;
	Sun, 10 Nov 2024 11:16:56 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA5uC-0000000EkhU-1JN5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 11:14:58 +0000
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a0c160b94so4377758e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 03:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731237293; x=1731842093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGpnRGebtces+H0p57KZ/VOg+pG46erIWNYz0tqupxk=;
        b=H4u1dO2HElhjS5yswRKmdv7Qvr5H38YRF7SKKn2jFqZy3T0evkoCRtq2IgqM0qdKya
         ep+BOTaXHBhGMnpvxDs+D016qH7QM4nYLk2YMOIN7wgl0bGYRzZ2VTFtUZiks+296ZQG
         XHZutB0E408pPjLfCBRcOF9FQvGajAPMMbTGwjZ9Av/ExvUD8rF7tQ4vsEHA1g0EHY/X
         kYazHP7LWr7SdiwBiX+7lbo5k+bvfuZzqj9T1twnFYysr/+jWEeq+L2iYAlSkctP7U+0
         Qy1I91nVhRbWYBUUzOTAM+Cmpp4Ly8dzOWljQ7yifmLvdhQCwC0mqsr9CCdEb9q/X1ft
         QVag==
X-Forwarded-Encrypted: i=1; AJvYcCURqGBl/CRmcSSZ19m1uz7pqdKmZ+Gp7wck93dhkUaN37fC8Hwvr6cp8vGqTqlPmRjSCbChYTT4bHZgy/ryPg5B@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Dq1kAEEc8rX1shJZFMj+c1SE+f8JubrTk4+u7d5G4YRFGMce
	r/2C4/NKOUfYiHSIQBemVi1n0IRCSMDGwADfFrTdJ2CxGwRzbmjcObR+EYr5
X-Google-Smtp-Source: AGHT+IG+Npwp1PbCK7LIyNKTx/Mtkhk9gdDQiyc0bCsA2MsD75/Qq/RcMd7sAvVDo/MJ5l3yAt48Qg==
X-Received: by 2002:a05:6512:3e0b:b0:52e:987f:cfc6 with SMTP id 2adb3069b0e04-53d862ebfadmr3236344e87.51.1731237293101;
        Sun, 10 Nov 2024 03:14:53 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9dbesm1184420e87.190.2024.11.10.03.14.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2024 03:14:52 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539ee1acb86so4126645e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 03:14:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA5TbB4oP2veKyQu3+oomgGfbE/KcTtLaAMbiAw3mcG3Ac9mqnq3zJwFxvxwXOOdBP7WCByQQSoy/0lP9MzT93@lists.infradead.org
X-Received: by 2002:a05:6512:238b:b0:535:6cde:5c4d with SMTP id
 2adb3069b0e04-53d862b35a5mr3583802e87.3.1731237292733; Sun, 10 Nov 2024
 03:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20241107014240.24669-1-andre.przywara@arm.com>
 <CAGb2v64HUp4Xwgc3fw1fMVTBQFV2kHSVbs7=XBufzJpQ9hkuzg@mail.gmail.com> <20241110102157.2703463e@minigeek.lan>
In-Reply-To: <20241110102157.2703463e@minigeek.lan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 10 Nov 2024 19:14:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v65J=1xpNJtC0tba6yQKpE3ZYiHDppdWcoXN5EnaHdnGPw@mail.gmail.com>
Message-ID: <CAGb2v65J=1xpNJtC0tba6yQKpE3ZYiHDppdWcoXN5EnaHdnGPw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
To: Andre Przywara <andre.przywara@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal <masterr3c0rd@epochal.quest>, 
	Parthiban <parthiban@linumiz.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_031456_461914_25D66B24 
X-CRM114-Status: GOOD (  31.40  )
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

On Sun, Nov 10, 2024 at 6:22=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun, 10 Nov 2024 17:04:08 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> > On Thu, Nov 7, 2024 at 9:43=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> > > blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> > > And while this alone would make a trivial fix, the H616 falls back to
> > > the A100 compatible string, so we have to now match the H616 compatib=
le
> > > string explicitly against the description advertising 64K DMA blocks.
> >
> > Would be nice to know how this was discovered, and how the correct size
> > was determined. As far as I could find, the A133 user manual says its
> > 64K.
>
> Mmh, my copy (Revision 1.1, Jul.14, 2020) only mentions bits[12:0] in
> the DES1 DMA descriptor details, unconditional of SMHC0/1/2. And yes,

I see. I was looking at SMHC_BLKSIZ, which had 16 bits.

> this is in contradiction to the prose section in "5.3.1. Overview",
> which mentions a "Block size of 1 to 65535 bytes".
> Also that matches the observation: eMMC was working fine (as it was
> already limited to 8K), and the SD card was *somewhat* working: I could
> mount a FAT filesystem, and even list the (rather short) root
> directory, but any further action (reading file, benchmarking) would
> hang. Which would make sense given that the first actions probably
> don't ask for a block larger than 8K.

Thanks for explaining it.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> Cheers,
> Andre
>
>
>
> >
> > ChenYu
> >
> > > As the A100 is now compatible with the D1 description, let the A100
> > > compatible string point to that block instead, and introduce an expli=
cit
> > > match against the H616 string, pointing to the old description.
> > > Also remove the redundant setting of clk_delays to NULL on the way.
> > >
> > > Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller=
")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/mmc/host/sunxi-mmc.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mm=
c.c
> > > index d3bd0ac99ec46..e0ab5fd635e6c 100644
> > > --- a/drivers/mmc/host/sunxi-mmc.c
> > > +++ b/drivers/mmc/host/sunxi-mmc.c
> > > @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_e=
mmc_cfg =3D {
> > >         .needs_new_timings =3D true,
> > >  };
> > >
> > > -static const struct sunxi_mmc_cfg sun50i_a100_cfg =3D {
> > > +static const struct sunxi_mmc_cfg sun50i_h616_cfg =3D {
> > >         .idma_des_size_bits =3D 16,
> > >         .idma_des_shift =3D 2,
> > > -       .clk_delays =3D NULL,
> > >         .can_calibrate =3D true,
> > >         .mask_data0 =3D true,
> > >         .needs_new_timings =3D true,
> > > @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_m=
atch[] =3D {
> > >         { .compatible =3D "allwinner,sun20i-d1-mmc", .data =3D &sun20=
i_d1_cfg },
> > >         { .compatible =3D "allwinner,sun50i-a64-mmc", .data =3D &sun5=
0i_a64_cfg },
> > >         { .compatible =3D "allwinner,sun50i-a64-emmc", .data =3D &sun=
50i_a64_emmc_cfg },
> > > -       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun=
50i_a100_cfg },
> > > +       { .compatible =3D "allwinner,sun50i-a100-mmc", .data =3D &sun=
20i_d1_cfg },
> > >         { .compatible =3D "allwinner,sun50i-a100-emmc", .data =3D &su=
n50i_a100_emmc_cfg },
> > > +       { .compatible =3D "allwinner,sun50i-h616-mmc", .data =3D &sun=
50i_h616_cfg },
> > >         { /* sentinel */ }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
> > > --
> > > 2.46.2
> > >
> >
>

