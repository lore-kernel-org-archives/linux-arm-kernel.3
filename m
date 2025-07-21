Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50538C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fP2qdhjigbAmBeoHDgFhVXmJAdHPCBK9T5wak81mhb8=; b=iiahxYxaZiaFmzYIw8i+kTBgTe
	oJZju48coSqfihAB5LxjnPH+B5qYFxgQ7JPuGUN1xrt0zWmqhcqhmqD4BGOfgrVTGi2OLsYOermgm
	x1+0XIRU+3alqL8PI08ldTunogml12Ac/mjY9xWQXih7yAGRfUVzBvlPvDb/qsuDOH9Y5kYnffdqU
	Vz7DDp3uYdE7GB4LccQlc8UnqDH/w8zsrSoP4t1QA+h9WsVPxE+lULIWwhZwuPjJyd13GhB3u97D4
	DEkX0To/GDKZ+pl3oUMcUQsaE0UOgmc+VpbPl7LJooHxYCqwLl5ux9FVkM1ctlLeEy1AjWMRLiUAD
	AxnKQFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udn0F-0000000Gq9B-2EFH;
	Mon, 21 Jul 2025 09:40:11 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmVQ-0000000Gkl5-3AhY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 09:08:21 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3df210930f7so19867335ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753088900; x=1753693700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fP2qdhjigbAmBeoHDgFhVXmJAdHPCBK9T5wak81mhb8=;
        b=MuQwYSak4U7TdcE6/LvZDZw+2Y/rEw1m/wPAkR+TacjGHAfpsHMOChMmw91G7tjJrJ
         JWRh/R1aE+AJtjOtqzEnzufaN93vgBU1CQq8VAQk99Sd0tWI5ETUwwxZPMRXPIVxxcCu
         DNT+kLt5k3HtLPrHFIpCEjLn91uLKTbF+IDX8rIJ5r/RBI34HWKn1IpEI6zb/VaKnyy7
         T0MMz2vCM0IXHPbmp7xQuOzdAXjHWnAoa9895w1FOhVJV3+Ez+177WuXorjchBRkGkzJ
         VOZX6ziT7Sk+DCqPDVh2kGIcumrSjGMbIQSVIAfDshPB9mULqO8dWL7YNM3oLCNS0UA2
         vgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753088900; x=1753693700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fP2qdhjigbAmBeoHDgFhVXmJAdHPCBK9T5wak81mhb8=;
        b=lkP8Rpn8dMbKM0WEv0H33VeOFPxOXNDp0A08wbN366GzDOw/89A6kLcVpcLbR0XbWC
         rkCXRmmPngumBKUTCjr9TJX8R73WUlDlh3lyo/2Vvf9T5kyiJPfabO1forlVo7fN1SfX
         NrwsRiWY3RFjHA2PjZeaBTBG4Bxg2PBthWacUTLStQUZKQ1gwJTAsJrFWdGnD029zCIl
         J0uRIT3wkO1aVV2w5OEvdNS8nbD8nr57jbwYA8azkp4vGnwPuCV6YzYS+NE2k3eA9ydN
         OfT0vKM/R/0QB3Co/vhrdLn+Hssqh3qTqrII7nUHhbooH1ySirXLnC2AoS/fyJgRitvJ
         mguA==
X-Forwarded-Encrypted: i=1; AJvYcCVUYL/tq5lxMlVhEJR72zwuhWTHP2BnfpP15qryIGcHBWvOHdBqKYHdwApnvOLt/LSuPndADJupFaE9ktsYhStg@lists.infradead.org
X-Gm-Message-State: AOJu0YyCT7HkXlMAgv8MAvSEqm50pEgXZL62jHEjBpjISbwfFyDBhGpm
	9rxyGIHqkL0uwEe3P/r6XwcQ35X23XptXYaQOWSVHwxf3JrzbQaRdLKRmWrbtc7v9fmos8DrayK
	xrB5XHIJKPHu2jqKb9AdIBn2JsetCunU=
X-Gm-Gg: ASbGnctO6qs28WDeqgq09CVRiFl+yPGNkixzNzKg7odkx+gRuwiE2FNjTS7VZjqcQ5n
	fn0Utyy1FhO+y2h5+jadoEiF14EiV3bArYNFsEaJ1BYAsp0cb0ahT2wfdsBdBmhQTFwcEKUd41t
	s7SS+/o8X3gWExrJylLtwBzTN3WOYhNOnoWbpJD3OeupVccvK7CKVpQ5cjY6Djy1+Ef6zkZojoC
	Lg6VsU=
X-Google-Smtp-Source: AGHT+IF18j1rx0DNGpmrwGS5dReQiw1r4g3RlvoyFjCSL132gx55Rm/6nV7uh+iqAAGP1WIjgLw0qylp3KDR5ZpttP4=
X-Received: by 2002:a05:6e02:164d:b0:3e2:84aa:f473 with SMTP id
 e9e14a558f8ab-3e28bd601a8mr140906605ab.1.1753088899813; Mon, 21 Jul 2025
 02:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com> <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
In-Reply-To: <CAEnQRZDeXrhHaU-tiAizXL3cNK-6rpbACx9QGNVpV8GBEKAPYQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 21 Jul 2025 17:08:03 +0800
X-Gm-Features: Ac12FXzQmStbQ2f20k4GC_7DKq8-KQmdC6HQD5O_YE8Y5hNo-EjvRf34-Q_a6Ww
Message-ID: <CAA+D8AOzxf2J5GwzH0MZps3r3_qRYBsp+s40L8uVL6v_cGhz5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, mathieu.poirier@linaro.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_020820_803682_2EAD7F4A 
X-CRM114-Status: GOOD (  32.40  )
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

On Fri, Jul 18, 2025 at 7:24=E2=80=AFPM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> On Fri, Jul 4, 2025 at 8:29=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
> >
> > When recovery is triggered, rproc_stop() is called first then
> > rproc_start(), but there is no rproc_unprepare_device() and
> > rproc_prepare_device() in the flow. As the software reset is needed
> > before DSP starts, so move software reset from imx_dsp_runtime_resume()
> > to .load() to make the recovery work. And make sure memory is cleared
> > before loading firmware.
>
> Hello Shengjiu,
>
> Commit mostly looking good but the key point when writing a commit
> is to explain why the commit is needed and less about what the
> commit does (this should be obvious from the source code).
>
>
> So, I would start with the context and that is:
>
> Following commit: 6eed169c7fefd9cdbbccb5ba7a98470cc0c09c63
>     remoteproc: imx_rproc: Enable attach recovery for i.MX8QM/QXP
>
> enabled FW recovery, but is broken because <and here explain the reason t=
hat
> you mostly described in the original commit>.
>
> Then at the end add the Fixes tag.

Thanks for comments, will update in next version.

Best regards
Shengjiu Wang
>
> Also, allow me on more day on Monday to test this patch.
>
> Thanks,
> Daniel.
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
> >  1 file changed, 27 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5ee622bf5352..ba764fc55686 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >         struct imx_dsp_rproc *priv =3D rproc->priv;
> >         struct device *dev =3D rproc->dev.parent;
> > -       struct rproc_mem_entry *carveout;
> >         int ret;
> >
> >         ret =3D imx_dsp_rproc_add_carveout(priv);
> > @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpr=
oc)
> >
> >         pm_runtime_get_sync(dev);
> >
> > -       /*
> > -        * Clear buffers after pm rumtime for internal ocram is not
> > -        * accessible if power and clock are not enabled.
> > -        */
> > -       list_for_each_entry(carveout, &rproc->carveouts, node) {
> > -               if (carveout->va)
> > -                       memset(carveout->va, 0, carveout->len);
> > -       }
> > -
> >         return  0;
> >  }
> >
> > @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc =
*rproc, const struct firmware *fw
> >         return 0;
> >  }
> >
> > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmwa=
re *fw)
> > +{
> > +       struct imx_dsp_rproc *priv =3D rproc->priv;
> > +       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> > +       struct rproc_mem_entry *carveout;
> > +       int ret;
> > +
> > +       /* Reset DSP if needed */
> > +       if (dsp_dcfg->reset)
> > +               dsp_dcfg->reset(priv);
> > +       /*
> > +        * Clear buffers after pm rumtime for internal ocram is not
> > +        * accessible if power and clock are not enabled.
> > +        */
> > +       list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +               if (carveout->va)
> > +                       memset(carveout->va, 0, carveout->len);
> > +       }
> > +
> > +       ret =3D imx_dsp_rproc_elf_load_segments(rproc, fw);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> >         .prepare        =3D imx_dsp_rproc_prepare,
> >         .unprepare      =3D imx_dsp_rproc_unprepare,
> >         .start          =3D imx_dsp_rproc_start,
> >         .stop           =3D imx_dsp_rproc_stop,
> >         .kick           =3D imx_dsp_rproc_kick,
> > -       .load           =3D imx_dsp_rproc_elf_load_segments,
> > +       .load           =3D imx_dsp_rproc_load,
> >         .parse_fw       =3D imx_dsp_rproc_parse_fw,
> >         .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> >         .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *=
dev)
> >  {
> >         struct rproc *rproc =3D dev_get_drvdata(dev);
> >         struct imx_dsp_rproc *priv =3D rproc->priv;
> > -       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >         int ret;
> >
> >         /*
> > @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device =
*dev)
> >                 return ret;
> >         }
> >
> > -       /* Reset DSP if needed */
> > -       if (dsp_dcfg->reset)
> > -               dsp_dcfg->reset(priv);
> > -
> >         return 0;
> >  }
> >
> > --
> > 2.34.1
> >
> >
>

