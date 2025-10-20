Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ECBCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=; b=yzoeYm9hnjW6vfu71psVhrb9lB
	znhYnuMdvPwVM3PtNkmtrdtka8TqRriutkrGsXCbf9BTUuzEP02SpDvSIxhCxIfj4SEbVZeBnO3Ck
	67AznXRzDlLmPb23dl8Ha/AGdQkcGgZz9/CGBpbLJQwX8WZoLwIWP18GdFr01as2P1jP3e8qWAjsT
	DR42NTXM22ysdIUXjf8MbSSPyJb6cFJLiGJQJtWaNkpvMfRWpVxaSSDR7ZcPBLFbx92hLwfuahw3G
	OSOJ+Z+jw2OVAluqJjgR+X95ifUtRlrzykjyYhVY/xdu5rRHf7oigbL4Iu5Lk/9uzjOuql7aRww9/
	IHxxs/2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt8q-0000000EO1U-45iL;
	Mon, 20 Oct 2025 16:53:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt8p-0000000EO0m-46GO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 16:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=; b=h2IO+FqZsGK4Ej5JeVDJkMRyhJ
	vqOVtAzz0m8L500PH1K61lUqDTFWkspwVuFXc08pN2S0GpEC3LaiYYJM5GImtqh7b3RG71Lzj4Ef+
	G6WEiZuVkMbKrkgAT7Jhn83ahSSckWkB0WwHIsE19iM4QTt7DjRBKoTLX1cwls+EHPGEhhL67S/ay
	g0oDcMPiSUnPeo8eNHf5GTAkRc2nPl4DqR3BA54Mk5eDZYM2HgE6JDUhkTOlJTqohiKhmtboWF4xo
	HO3d43KN+VyiVAqqV2udgwDAeGlTCs1liZgWU7GWMUQvi+1Pt/CCITIanw0pQzqiKVA8n4posOGn9
	UiLwekgw==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsH5-000000000qo-3ukW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:58:22 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b62fcddfa21so2961445a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760979225; x=1761584025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=;
        b=kTLqoFUA4McXi4vuBpet13cjQYoRdlleWrwpAfgI6Rd3qmNTtawIebV9zC+2nNOgub
         cnZ7UjJ6wpiufEycmjN5fvBgM6INMqRDLuUkDQoQAUM2fdZZQNKl9MR9nKRyMJIAPxsy
         TkFWD8IgEeKuD5o5vRP/N2v+jgiRttfQ6/m+07fNM54ij07+sG72WIXuDYsZnVmO6cBp
         jRCgiYlBraYkytqOIDmT8jUeiYLncA47UCcP5iCsHJ+7di0hv4OS/Y8Sz2mrh3cKd+xn
         MpQ4R8dKdUH1GiWDa4xFABuXSc2Pr3cuRw8AfSq+tUX41vm1LbOUdOKV2jLPlnN4P720
         ikAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979225; x=1761584025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tzrlp9ive4cPf/LVzIWWzUA3F4N61vvsn8OSNz8bN+E=;
        b=Gc67Lw8CmkZgs6sekPgi0rRmSlXNZP0iJCy684bPCAouUnWs1tmOYorqnTNxbsqsYu
         CIcvEgiiG9s8Ghs1X3znfr+6G5hKOzael7teDyVpgWPIjLEmk47jWhGM2VIy9UvMgO1/
         CSkligWjaxLb/dK3z4C3hmZxFPC6dxER09iXKe+5ixoaMv522HqM/B8EmbggnpZgYUJE
         Oijx8nS9Z2DwfI3yyrcE5ahpKzSEXkEv4mBtUglV5xUfmT5Mm09DEn2KQeyGpnxYWCdf
         bUonNqg1hkR/uTUo3OIr0ocq39X7QOJans0HFfSWMHRbTs2rgQd/XSbVohQT6P4sQYx2
         DC0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs9Ccf+7a1/jzpRFo9Wu8f4tAJitdLgjaIDUFxgwQXSkKTgL5jaWQ9E38AvpruXvtdSWy6UlLLuk+Cgf1x7+1d@lists.infradead.org
X-Gm-Message-State: AOJu0YwWED5gJbGMBJp4xP9diw8+ZgTIUBNryhpBz5E5354Emqmh/yXN
	N200CeSeOKVcAd/6Ap5MAZyaZoDjrxH123uKnaQOrxwnsVDTTyVlDhOwSPDlN5NGLISYYfWLejA
	Ud2i5+Bf9N9umof8ekw8lfYbnpBoJ8fQ=
X-Gm-Gg: ASbGncta2bxU2Pngwv30pNQusszbFOQRJXv9rN4yz6Uw25aXrIGSeVuKSUwvh8kZmFZ
	gr0MMgXYus8MRoUj5W/eb1Jo6cXQ/jEVMWLmEelHoCcw5MUDULZetsHsf1O1KjdufMfT0JXAoUq
	gtDqkhsywKu3fCXwSAS0z5gZzuNT+P242+b18aV0+AdCLCPGB6KkelmXDv9SIwQXatHGCJv37nL
	SK3PUJNJjwlSgZSvFGm4NNzShA7LrPuahyj79g52SqCXEYTe2jtDCO+HvBE2PEw3s/DlF927CgR
	/SJhHjqMkl+Uyg==
X-Google-Smtp-Source: AGHT+IHRLawtbL1et4hkHzQFikS9RlkgNZ3tXH8Fnn3CVZHXzJcNVH96n3jZk81ZCVZWEMKh95kb9ashTsLbS1kPQ3M=
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id
 d9443c01a7336-290c9c8a738mr162660385ad.9.1760979225307; Mon, 20 Oct 2025
 09:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com> <aPZXNlY1MK4--Q_g@p14s>
In-Reply-To: <aPZXNlY1MK4--Q_g@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Oct 2025 19:53:30 +0300
X-Gm-Features: AS18NWCDDzyLXdoJ1ww-uT69WkAwCVMMmB4swG4QnzjbOUSySmr_LsY0EDRbg2A
Message-ID: <CAEnQRZDk0qLb2kegEZrE24oBfoKjqcc86N5e9QLB800vsKbOoA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_165820_210103_CF91F02F 
X-CRM114-Status: GOOD (  19.12  )
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

On Mon, Oct 20, 2025 at 6:40=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> > PM runtime support is safe and applicable across all i.MX platforms, no=
t
> > just those using the SCU API. Remove the conditional check and enable P=
M
> > runtime unconditionally to simplify the code and ensure consistent powe=
r
> > management behavior.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
> >  1 file changed, 8 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rp=
roc.c
> > index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb=
2a8ae5e20b6b4f667 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_devi=
ce *pdev)
> >                       return dev_err_probe(dev, ret, "register restart =
handler failure\n");
> >       }
> >
> > -     if (dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_enable(dev);
> > -             ret =3D pm_runtime_resume_and_get(dev);
> > -             if (ret)
> > -                     return dev_err_probe(dev, ret, "pm_runtime get fa=
iled\n");
> > -     }
> > +     pm_runtime_enable(dev);
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "pm_runtime get failed\n")=
;
> >
> >       ret =3D devm_rproc_add(dev, rproc);
> >       if (ret) {
> > @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_devic=
e *pdev)
> >       return 0;
> >
> >  err_put_pm:
> > -     if (dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_disable(dev);
> > -             pm_runtime_put_noidle(dev);
> > -     }
> > +     pm_runtime_disable(dev);
> > +     pm_runtime_put_noidle(dev);
> >
> >       return ret;
> >  }
> > @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_dev=
ice *pdev)
> >       struct rproc *rproc =3D platform_get_drvdata(pdev);
> >       struct imx_rproc *priv =3D rproc->priv;
> >
> > -     if (priv->dcfg->method =3D=3D IMX_RPROC_SCU_API) {
> > -             pm_runtime_disable(priv->dev);
> > -             pm_runtime_put_noidle(priv->dev);
> > -     }
> > +     pm_runtime_disable(priv->dev);
> > +     pm_runtime_put_noidle(priv->dev);
> >  }
>
> Daniel - what is your take on this one?

This is on my todo list for review. Will send it asap.

