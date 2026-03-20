Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EB11091931
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 00:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=; b=4hDdvaTrz1CNumURm674BsW/CQ
	uschiXzOl+OV/LT9V1B7+WDZYmfsQ3+KFooZV4g9Ez+ZHOlNewETdU7UeKiTKx1EIRUlEvXmnjrvT
	qixDPwRsO7a4MzAfUbH4/uBD7N+Ul5NiD1AO0XUqhb2X1d7MM9MmAm/RN23OxyvYxycsqc8KYnYsj
	G9HtDNXSD0YEFwh2EtSA6inn7De/wJmTYiWyUON439scBIoHGNw3jnq9dQtyeeEgtf7By4o62b66x
	yFNYzn+1Jly3Hw/3U/8J074L3Gemc/JFeHMOfplcLV8iYuQpI+RFNR8HXfESTMOJvOI+fGU3JB/Gb
	nDwdx2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3NSl-0000000BozJ-2dgs;
	Fri, 20 Mar 2026 00:11:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3NSi-0000000Boyt-0z08
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 00:11:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b9813eed77eso16555566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 17:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773965494; cv=none;
        d=google.com; s=arc-20240605;
        b=WMctjusWbt7ja02Ns4MpEQ2vKibDEOxVGK91//CCgPKd/yF3xsrJapOWv/5ql7ED8a
         6tdXDnLU0sUi6+6KzXFMwSeJR3+mck8AmHru/jkIbSCEUzjMNHla9k3qIWiUvTptAmMl
         wofLh7DCwLI/GYfIvTv5/88aJJArMuh5swsTqekR8L10dkMTaIwJ8NaqXGr80lW61uaG
         sTlUhuRgla+4vdxA7qNJtIp2d+T5a1PlLq/IP0BIzpoHpzN3G4F2GATHwpiW7CSP6RBY
         g2QROIPgzDPYo+XjkMBLVvYwKZQOTE2MkVAJN7H5Ng7x7MwNL1XHP2t9aoNkuF+6P793
         LFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        fh=z6MgOmgqPNlO1+PixeQvQHPG6GQiWibEQ/l8raIo21Q=;
        b=N4n5Nfbg626qbVBwcWC9s4avmque3s/qBhpmHCoxG6YBDc4hKc6hfQLO2KNXyIiAnZ
         0JZQmy13PAxvL5kKVgjY9pQAz83GU63A7nDWnJNTmfVUYjbzpR9pU+VwqJdNrSDAFZWt
         H1TfJilLeqBnwU5OzBHaswf7VO+gpovq23gZWeZeMN791PRQZcXasrUFn0sG9oeDq0X4
         yUGtFrQ1YMFX4Wv2tT/1UFuCc+BmiFSxm91fa+9U6Mh/cqAVHdfzMIIcd1L6EzLkJEG7
         Qly2QNRf4sKC+TUo1wVQt28mewTQa8yEtklOMQvOh6olhJDaZpCxblywPtWr+FEVcmlQ
         E0Cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965494; x=1774570294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        b=lJiVCTb0cSP9m5kRjmSsb9VYrfR1ZjFDlH1C+aKOeMfLBTY7LILYCyTITlRA7W1iXd
         4yAY5wmY/Qk+uCdSEJOj0faMaERbrofvWrp1G2E4N7PaONz3H18BNAGHYkcBcZ7WiOkg
         VqFYqbLdI1eWP6BFJun9Nv/+S9eqwGVv7wVUWsrQIGBw0rU94iNKj1ERs5f6xT/1AXsW
         035i0VuG2RiNyUHQEVxCZrreLocWGACA9Db0/N6kuvB4spnvbNidQAqjKu44OzzLRlLD
         5WVjOscn+g3sZ3m0ukeifhvHnlNn+U2MU4rcujw8nGDyGqgpzZRl7Whp66JHUs1SkXi2
         Efmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965494; x=1774570294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        b=cy2RGPRmQYfp5F1sk5hEM9f3u1xhtYFV0wCMgqEoT73OW8iHsuFlgNdLz0VSm/+E8w
         vvbJJmAFhYjBM+uYvK2wknGAuJLcSA9zxKJG45N4sNO5ZbSwS0Y9REz1HEnKx0eARdfU
         sfpGHQEwkK0+D/TbyZEHSFy+sAFyrDRbThS7OgO4sWHL966cGqsyVST40Js5srvhrGYM
         uuz6UBh+fxgdiNqnWeQi9TS+ATy6n0W0SIcItfH27zsx1z2colOpvJRr1oZZbQF4oSmf
         /yQEJTgadG47N7u2/0UhPDtIEYpnf/lqlk2QjczBKuM0I58Bhda1lIr+6Y9AwJWlu+CZ
         xeZw==
X-Forwarded-Encrypted: i=1; AJvYcCWXQ0D1dGDKSbgkKcuvSBbpcereTBHlmhZyX5477ZPp4rgt6EluY0Dho051Tk4sHPSI+waABB2Bzv+jAVP5fT0F@lists.infradead.org
X-Gm-Message-State: AOJu0YznvE5t+kRsa+x+SQy8pmytwksDngCvnItDzdzylL5kRAOScBg4
	aLbHTSUyFS2HBJqN1lWm22DOATtGadRSIR3pkoNUhRBOEcQPBoZQz6iFej7YDjU3/0GE7WHZpB8
	livfZjvm2X6c4SqYmEcLTSfsKSrYZEh0=
X-Gm-Gg: ATEYQzwC46zJIhTkhdcQw84X0rTAF6vny+hRektQKLomSi3gtzT4S5np4o1+AusbfOo
	0otFFviVaif9TuovrTFwpisEpjg0UctTM7cPA1FaS9uX+ThHhaVJiqlsFV/ZmxeWkH0AG6KEEQb
	OhG11TROSu++uwFpUxcncUgyG3fsgbihZsjkyKeyAHk5o+/jXFHQF8DRevzCq6y0oBE2fo85URG
	++/buytuWGgF3AxEd+q0SyRCN47dXR7PFY+4ma/ZIRSIwjm8uqoEl0pwBqZkFXFK7Pgynr8+c1F
	B+/LUcmdxJUfTFU/pMdFWSy3BVKGzh2+fbdRzvOfqgeWbvFEZ8SDC3z2Ub/fy9yZhmN2H2vY5l7
	uyKACKSWF1CIURFUJ
X-Received: by 2002:a17:907:82a5:b0:b98:21eb:e362 with SMTP id
 a640c23a62f3a-b982f25b778mr71309566b.24.1773965493513; Thu, 19 Mar 2026
 17:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
In-Reply-To: <20260319220901.GD950375@killaraus.ideasonboard.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 17:11:22 -0700
X-Gm-Features: AaiRm52ILjwYSbA2_rf4fpvc5tasK399kECRpWwjEnLOwZZm6-7yacGmgm9khGg
Message-ID: <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260319_171136_533829_D902ABC8 
X-CRM114-Status: GOOD (  25.68  )
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

On Thu, Mar 19, 2026 at 3:09=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > Use a flexible arraay member to combine allocations.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 16392420903a..657ffecc4d7e 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops =3D=
 {
> >
> >  static int mxc_isi_probe(struct platform_device *pdev)
> >  {
> > +     const struct mxc_isi_plat_data *pdata;
> >       struct device *dev =3D &pdev->dev;
> >       struct mxc_isi_dev *isi;
> >       unsigned int dma_size;
> >       unsigned int i;
> >       int ret =3D 0;
> >
> > -     isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > +     pdata =3D of_device_get_match_data(dev);
> > +     isi =3D devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_chan=
nels), GFP_KERNEL);
> >       if (!isi)
> >               return -ENOMEM;
> >
> >       isi->dev =3D dev;
> >       platform_set_drvdata(pdev, isi);
> >
> > -     isi->pdata =3D of_device_get_match_data(dev);
>
> I'd keep
>
>         isi->pdata =3D pdata;
>
> here and not below.
Sure
>
> > -
> > -     isi->pipes =3D kzalloc_objs(isi->pipes[0], isi->pdata->num_channe=
ls);
>
> Wouldn't it be simpler to just replace this with devm_kcalloc() ?
That would only make sense if pipes remained a pointer. A flex array
member allows combining allocations since it doesn't take up extra
space.

Technically kzalloc_flex is simpler but I assume a devm version of
that will be handled in another treewide commit.
>
>         isi->pipes =3D devm_kcalloc(dev, isi->pdata->num_channels,
>                                   sizeof(isi->pipes[0]), GFP_KERNEL);
>
> No other change would be needed.
With a flex array member, that's a compile time error, which I use as
a hint to complete the conversion.
>
> > -     if (!isi->pipes)
> > -             return -ENOMEM;
> > -
> >       isi->num_clks =3D devm_clk_bulk_get_all(dev, &isi->clks);
> >       if (isi->num_clks < 0)
> >               return dev_err_probe(dev, isi->num_clks, "Failed to get c=
locks\n");
> > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pd=
ev)
> >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> >                                    "Failed to get ISI register map\n");
> >
> > +     isi->pdata =3D pdata;
> >       if (isi->pdata->gasket_ops) {
> >               isi->gasket =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> >                                                             "fsl,blk-ct=
rl");
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 3cbd35305af0..99532efa4e41 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> >       struct regmap                   *gasket;
> >
> >       struct mxc_isi_crossbar         crossbar;
> > -     struct mxc_isi_pipe             *pipes;
> >       struct mxc_isi_m2m              m2m;
> >
> >       struct media_device             media_dev;
> > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> >       struct v4l2_async_notifier      notifier;
> >
> >       struct dentry                   *debugfs_root;
> > +
> > +     struct mxc_isi_pipe             pipes[];
> >  };
> >
> >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>
> --
> Regards,
>
> Laurent Pinchart

