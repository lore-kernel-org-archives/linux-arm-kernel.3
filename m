Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930F5109316C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=; b=MV/ixj8UAj70u0kNa/HzRhsc9H
	8Fn7R8pPCQuvXvVI6f6Jw4CE7AdtDoSTEg5LXcK1IGTsaD4xe6TraxtB9ZFywcgCAM50Nd1A83vdl
	19WTatDGaAzHRKVIQOgQ+0sZpFPl94OW94PGevwSQ03gIR9XqmutuFCA+AHF9v8tqLbh1tjbdWCDJ
	bT5JrHRYFQjPDIeASb1AHmTh0NQZclpSW1ZfkO9ZT1XvrAnfcjmTmV4I3MoNGcHsrjIh73t8fp+aF
	IW+oOW52kcFKl2urmfoA93yqwSD3E90B+UB9HtD/r/BdnXnFNfkdgqv158TPuQJRtbQvIA9pptUMV
	GRjpd3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OJk-0000000BrhP-2KJ3;
	Fri, 20 Mar 2026 01:06:24 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OJi-0000000Brgp-1aoT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 01:06:23 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b941762394aso164104566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 18:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773968780; cv=none;
        d=google.com; s=arc-20240605;
        b=Awb6WnyPOP6thE6KAKY9VJy7im0l7NN/UkrzRdIC0ToOG47aEUjsAI8jCnypwR9tGY
         AZ4EqunVjvFFh3C6qIXYWasBr5i8swPCzkGIZW6k9G33oJd5gjc5KkzLLlB3xjLVCDXW
         BeAK7Lr/2QAqm7Kyt9E83odpDvHZLR34lnbI2/NHp89VsS9SxTAYDVA/1zL10VkF+o16
         uHN3hrvjS9095lP1j78nGmEynciebrQFz6DeZpvYTDfxhMOuBZemCKPijWgakr2Zc62f
         6e9sBZqj1nrx18aAmAh80llsM3gku1Zqr3u4qJrS8Vk7Wql51DCbVlUgOW+dxfYJIrnn
         kL5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        fh=c2alwXNOtd9QdiDsyIyPZTVZ3xWtcXERtDEK2Dz05P8=;
        b=Yo3QuuMbXsM+vuAC1BX/LuT0wmR2N4XW2G7/V7N5PAoFsJYFqqwuAESv8/QKE+QgUA
         0wCZYcSbVZjhT3EHX9w0e8izJHW5X0fHLTbTzJUzXtjMwhKdwkI1+WQ5c97R7RWC5xfS
         OKiJfQcpD1n2nXxisQgf7cNGxIeRpA0ow600a6K5Hhz8q8gjgDf4heJ/3Xdk28L0GOUc
         rqz3yzuUaJmu9bct17cdI62Vu1iuDwOBPyiGKIFCCXk4gJfrZS2CDpdmn6+QbRQWe7/B
         aLCiMybuH1wttQAbKVHEhWT46R1bZ7c69KEK7bKN2thxjKt9nV5/7pjbwU+m/2WbJCB8
         cmPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773968780; x=1774573580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        b=TTpsx/FScCQljd3D0u9ljX1xD8kPP7FAhSPcW/+MZzZ+8lIsXFo1dO4cUts87yioWU
         UIfJcGhwJYPm0q9251k002XK+NRzVQ1kgT5omGctKcRPdQ7IGosEW1QWnbu0JMOYd6oj
         7254gfrdoUM8U9p2iHD0TWwn5GlV8aX/wQdWx0w80wZoL8hMsy5CFF7lEgkTBwNYb7x7
         sql5VJewTE3joVCarKnDNUkRaaFmTxjO5egMJqD0IlXEyAetnSdCHgHDgASIELIMw2Bp
         lZzTfDWE/GjWn0X3Iwj20FetcKjy3CVS3POsMN4f2LZ6vjv2E2EkbMUPFceVVAsZ5Qup
         hFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773968780; x=1774573580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        b=Xlg0XYNsb4SBy55Dgy149eMHg2Kb8JZbniHvW1IRdMtjc65c74AFAqagdpi+IIxf7u
         MbOrJZH6HjzDCEXuP1ZhE5BZWyM2hLXguivCtR6Im1T/E/m6hvxxxaxhrYUrj8NrcDuB
         s+YhpjlOmWccsErFex+q1JzNk5wopXKzNIz85fpjTdxPycoFb7LXrY/npRCT/BngTW4C
         BqaUboQx4D1CjVF75csj2/e0FGyEzq7fM2Lici74YxBaBRMdLn9MH6Uq/9J6Vcw8OTdL
         66xRy78gRJfTf/9XVe8eD1yHIpm3zNSvwbkn2+/nY9d75ilbq6a7HtUXLQi5fdOojhKI
         Guag==
X-Forwarded-Encrypted: i=1; AJvYcCWwbK7h9taUzH03u1ISvx3Hij0JAhYaBX0qYFq5hNCrIBCZIqf2n8yszwsxKThha6s8Dz+Lpw+BXgiF+laBkwWz@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQKxTf/QRFbYQ6V+x/gztWruw2VErBKU0gTrstqRk3oozPq2l
	9m71zB6boyIsmEFTIDNlEPg7yJnmz/erb+pOSn3b2I4sE78w27i2mnWJeJxPT4lJDgZe9HV8zNe
	R7krozlVG/oU4MMW9YPIJTSm8EHr5+p4=
X-Gm-Gg: ATEYQzyYwVUYE+jF/FORN2Wff9NoYtkb34Pcz3GxuRFCMMambgQzP6Ydr57tN2IwIKJ
	UFs/dhLnIM5KSwDzN2PkuHvCdzg7EReRS9VUOYza+ofOdDruHwgSq3H7oLPhtCEb3z2+FNEn5M9
	lQXU5mG14FA+y9jpgHKtG++qDZt9XZ8OyM68X5NujDKc7huadsjOFZF5323i5WKnRICjFVJMhCU
	4J6Jtuk9ROyyMOCLXv0EP9U3SWBpy5UfkyOtDa3ebVMR8g9x5qv9f9xwWgrMwq3j+CbaSrty/0b
	ubPZ3u7F27QaUF/5nFojjXWcWGnDRCeEil4rdwFCFKlU+ZRqCfFivKi+X6XOS7BXpdGuok4SRcT
	0vD/x6w==
X-Received: by 2002:a17:907:8d85:b0:b97:f1a8:ecb7 with SMTP id
 a640c23a62f3a-b982f20c0b2mr81117866b.25.1773968779976; Thu, 19 Mar 2026
 18:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com> <20260320005737.GE950244@killaraus.ideasonboard.com>
In-Reply-To: <20260320005737.GE950244@killaraus.ideasonboard.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 18:06:07 -0700
X-Gm-Features: AaiRm53rx05Tqdc9FwzZoPf5XXpIJZUGAo0qoy3HNuWTkbHSxfZxEG9QI9aaaDs
Message-ID: <CAKxU2N81WEMkAPOVRHUORWodc21oW7wqvUJYVhd3uBJdLxRW4w@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_180622_456951_A3DD932F 
X-CRM114-Status: GOOD (  32.35  )
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

On Thu, Mar 19, 2026 at 5:57=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > On Thu, Mar 19, 2026 at 3:09=E2=80=AFPM Laurent Pinchart wrote:
> > > On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > > > Use a flexible arraay member to combine allocations.
> > > >
> > > > It looks like pipes never gets freed anywhere. Meaning this effecti=
vely
> > > > fixes a memory leak.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-----=
--
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> > > >  2 files changed, 6 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > index 16392420903a..657ffecc4d7e 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops=
 =3D {
> > > >
> > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > >  {
> > > > +     const struct mxc_isi_plat_data *pdata;
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct mxc_isi_dev *isi;
> > > >       unsigned int dma_size;
> > > >       unsigned int i;
> > > >       int ret =3D 0;
> > > >
> > > > -     isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > > > +     pdata =3D of_device_get_match_data(dev);
> > > > +     isi =3D devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_=
channels), GFP_KERNEL);
> > > >       if (!isi)
> > > >               return -ENOMEM;
> > > >
> > > >       isi->dev =3D dev;
> > > >       platform_set_drvdata(pdev, isi);
> > > >
> > > > -     isi->pdata =3D of_device_get_match_data(dev);
> > >
> > > I'd keep
> > >
> > >         isi->pdata =3D pdata;
> > >
> > > here and not below.
> >
> > Sure
> >
> > > > -
> > > > -     isi->pipes =3D kzalloc_objs(isi->pipes[0], isi->pdata->num_ch=
annels);
> > >
> > > Wouldn't it be simpler to just replace this with devm_kcalloc() ?
> >
> > That would only make sense if pipes remained a pointer. A flex array
> > member allows combining allocations since it doesn't take up extra
> > space.
>
> Yes, I understand that. My point was that with devm_kzalloc() here you
> won't need to change the mxc_isi_dev structure. The leak fix will be a
> one-liner patch.
Leak fix is not the point of the patch to be fair.
>
> > Technically kzalloc_flex is simpler but I assume a devm version of
> > that will be handled in another treewide commit.
> > >
> > >         isi->pipes =3D devm_kcalloc(dev, isi->pdata->num_channels,
> > >                                   sizeof(isi->pipes[0]), GFP_KERNEL);
> > >
> > > No other change would be needed.
> >
> > With a flex array member, that's a compile time error, which I use as
> > a hint to complete the conversion.
> >
> > > > -     if (!isi->pipes)
> > > > -             return -ENOMEM;
> > > > -
> > > >       isi->num_clks =3D devm_clk_bulk_get_all(dev, &isi->clks);
> > > >       if (isi->num_clks < 0)
> > > >               return dev_err_probe(dev, isi->num_clks, "Failed to g=
et clocks\n");
> > > > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device=
 *pdev)
> > > >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> > > >                                    "Failed to get ISI register map\=
n");
> > > >
> > > > +     isi->pdata =3D pdata;
> > > >       if (isi->pdata->gasket_ops) {
> > > >               isi->gasket =3D syscon_regmap_lookup_by_phandle(dev->=
of_node,
> > > >                                                             "fsl,bl=
k-ctrl");
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > index 3cbd35305af0..99532efa4e41 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> > > >       struct regmap                   *gasket;
> > > >
> > > >       struct mxc_isi_crossbar         crossbar;
> > > > -     struct mxc_isi_pipe             *pipes;
> > > >       struct mxc_isi_m2m              m2m;
> > > >
> > > >       struct media_device             media_dev;
> > > > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> > > >       struct v4l2_async_notifier      notifier;
> > > >
> > > >       struct dentry                   *debugfs_root;
> > > > +
> > > > +     struct mxc_isi_pipe             pipes[];
> > > >  };
> > > >
> > > >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>
> --
> Regards,
>
> Laurent Pinchart

