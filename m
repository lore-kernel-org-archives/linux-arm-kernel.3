Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4259C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 01:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2EwLg93SXSSQVXZxXCP07cbUPvvbYIPUncv9vbnwSI=; b=Ccjk6lT0QpUirtyktfLEgi2Gyz
	quJ89c6J5S1ey8xxlvePAJ/58p+4brzqYBjtXik/SYrkKqcfml272+6bfkSRnHMXtuhorpg0hyorW
	jhXTXbnh+AkcikTphKTT8qaJFsMk5/M3t98MI6bC5bo0Zu6itlSVl6iEUQyI+qts/imAz8ubC1JgV
	wtV4WsW1qIf4MiCLM/yrgcJgn9k6/P+f9Ql7OiklGpTcoNJAwlfeC2wU5etXj1JgLexdyjQpgbgkX
	G6kgRuX6lO4VgbcIdoUSFaeHtHMJ/KdrZgNe1LOknmI9r8Gv4u3rE7QO/DFll+LRESSR+y8dfNpmL
	43Ta5ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbXg-0000000APIL-3Rw6;
	Thu, 26 Jun 2025 01:36:44 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbTP-0000000AP04-02sR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 01:32:20 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3de1875bf9dso3993625ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 18:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750901538; x=1751506338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2EwLg93SXSSQVXZxXCP07cbUPvvbYIPUncv9vbnwSI=;
        b=RonuWpKLhaUPHvNdsNzUraNW15octnurfOL4KjBJrHw9cdD/KiuHnGU0OVVoyqhCIu
         5MzW9+Sd6gefWqvE6fQAy+z8NcZmGhV+8EjlNazUqA+8tuR+zO0eM131Pk2CPbllWRdC
         LvO5ANh+uUdkHMGoZyAhuJr8bqTA1ZDtigkkixl5XCCrZ0DsoxEkJGWstXRQBaC4fdRC
         y+8VuvOLVVVX/pNLpzZRapzE7GdyJD7QYQL4v9/bQUGAZxdA+iLkqKyxdoROKlXfdSHv
         9zGEtJ2+Kj4iDkdQavrtN74F8pXtUCLtzi67AzqtlUCrWI+sLiEWG2pV+AlqT2ineOuZ
         Tv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750901538; x=1751506338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2EwLg93SXSSQVXZxXCP07cbUPvvbYIPUncv9vbnwSI=;
        b=NQ6FQaFPErObuj7kRHIvW1YWjgy2Zmc4mxHrOjD11ZOBxtexKLfrADqHzbXd4S+TYd
         LocNVRh+GWKIBCSsrvN1dioVZD9kFiVWkYEoSDxPUbVeInZJopc5nGPizEi0iBgXXBiB
         h4pjAaeJ+V+5T6D/Povg5JPY89/URCtAuO4p7iqzvZ7PXcOgbttRj6SW10ZfbsonDinY
         IGO7rWe6I0nLA9aeZH3Vus35kSbmE4fCC4XRLe0+/RklZRDEOGVpcMRjdoMat40GtZom
         X0fcWCa/res5w4vK0tvew1eV/iNRZYl6LxWvQehsEMhSKx4ySBXu4Sh+54JicR2SI8wY
         Egxw==
X-Forwarded-Encrypted: i=1; AJvYcCVxUuInbykVJZ+6kC87PYwLKifJewVnQdbp1d+xVfedQPBdSimwjKnf7w0wZjEGjd0oecQX9qD1R78Fa/6z6OZC@lists.infradead.org
X-Gm-Message-State: AOJu0YyHXzm8EMQ519HHk8NNmQV107Z+VpAzfSKc9FVPg1ecLSfiDr97
	eI/JeoUdy5U/J31Gg8H7RCEw2V/sc+YorliaKhtiNCn89pAdsArL8uN2pnaRgcgP3lPIlKqNhwY
	Pj/a5O5eXOyTBhbnBz8Z2IN3QoDLLR90=
X-Gm-Gg: ASbGncsMY3yPrrfv9L7VZFuJFtw7kQRsUZT9RlIjvf4pFcZEIOIf8uBwPtCcKirGiU/
	TWJscXx+YMEaJrSmdF+WEvXEu8KJ/iSJbY9UEeIE37qYV8uxDcDB2Yo/r9H/J4K4q0RHEAa952r
	Ap5Ol1ctBmrIcAYVxbN1F/uFi/EdWTNhXzxbJ4FJoZ8No=
X-Google-Smtp-Source: AGHT+IHz+VsrRavqFHcBYE4ToM940Svxo+zF/Y7cUyGrx0/zEzml+SYXAqKOyb1f1Bo8G4+cR0SQBG/7tugWWFi/fUA=
X-Received: by 2002:a05:6e02:250f:b0:3df:43d1:6a58 with SMTP id
 e9e14a558f8ab-3df43d16cadmr1016265ab.20.1750901537921; Wed, 25 Jun 2025
 18:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
 <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com> <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
In-Reply-To: <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 26 Jun 2025 09:32:06 +0800
X-Gm-Features: Ac12FXxhWHni_zYrB3Bk_G8eq5XhUuxIqHIxn2dIntxFypfP4zKffU6DWcZMA_E
Message-ID: <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_183219_050921_3B548A0D 
X-CRM114-Status: GOOD (  45.31  )
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

On Wed, Jun 25, 2025 at 10:39=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com> wro=
te:
> >
> > On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > Good day,
> > >
> > > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > > when recovery is triggered, rproc_stop() is called first then
> > > > rproc_start(), but there is no rproc_unprepare_device() and
> > > > rproc_prepare_device() in the flow.
> > > >
> > > > So power enablement needs to be moved from prepare callback to star=
t
> > > > callback, power disablement needs to be moved from unprepare callba=
ck
> > > > to stop callback, loading elf function also needs to be moved to st=
art
> > > > callback, the load callback only store the firmware handler.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++--------=
----
> > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotepro=
c/imx_dsp_rproc.c
> > > > index 5ee622bf5352..9b9cddb224b0 100644
> > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > > >   * @ipc_handle: System Control Unit ipc handle
> > > >   * @rproc_work: work for processing virtio interrupts
> > > >   * @pm_comp: completion primitive to sync for suspend response
> > > > + * @firmware: firmware handler
> > > >   * @flags: control flags
> > > >   */
> > > >  struct imx_dsp_rproc {
> > > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > > >       struct imx_sc_ipc                       *ipc_handle;
> > > >       struct work_struct                      rproc_work;
> > > >       struct completion                       pm_comp;
> > > > +     const struct firmware                   *firmware;
> > > >       u32                                     flags;
> > > >  };
> > > >
> > > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc=
_att_imx8ulp[] =3D {
> > > >
> > > >  /* Initialize the mailboxes between cores, if exists */
> > > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, co=
nst struct firmware *fw);
> > > >
> > > >  /* Reset function for DSP on i.MX8MP */
> > > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *r=
proc)
> > > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> > > >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> > > >       struct device *dev =3D rproc->dev.parent;
> > > > +     struct rproc_mem_entry *carveout;
> > > >       int ret;
> > > >
> > > > +     pm_runtime_get_sync(dev);
> > > > +
> > > > +     /*
> > > > +      * Clear buffers after pm rumtime for internal ocram is not
> > > > +      * accessible if power and clock are not enabled.
> > > > +      */
> > > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > +             if (carveout->va)
> > > > +                     memset(carveout->va, 0, carveout->len);
> > > > +     }
> > > > +
> > > > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware=
);
> > > > +     if (ret)
> > > > +             return ret;
> > > > +
> > > >       switch (dcfg->method) {
> > > >       case IMX_RPROC_MMIO:
> > > >               ret =3D regmap_update_bits(priv->regmap,
> > > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rpr=
oc)
> > > >
> > > >       if (rproc->state =3D=3D RPROC_CRASHED) {
> > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > > +             pm_runtime_put_sync(dev);
> > >
> > > From this patch I understand that for a recovery to be successful, th=
e
> > > remote processor _has_ to go through a hard reset.  But here the PM r=
untime API
> > > is used, meaning the remote processor won't be switched off if anothe=
r device in
> > > the same power domain still neeeds power.  If that is the case, the s=
olution in
> > > tihs patch won't work.
> >
> > Thanks for reviewing.
> > With the case you mentioned, there is software reset to make the
> > recovery process work.
>
>
> Are you talking about a manual software reset of some other mechanism?
>
> If manual software reset, the recovery may or may not work and we
> simply don't know when that might be.  If it's another mechanism, then
> that mechanism should be used in all cases.  Either way, I don't see
> how we can move forward with this patch.

Not manual software reset,  in this driver we registered .reset() function.
it has been called at imx_dsp_runtime_resume(),  I paste the function below=
.

And I have tested the case you mentioned, the recovery works.

/* pm runtime functions */
static int imx_dsp_runtime_resume(struct device *dev)
{
        struct rproc *rproc =3D dev_get_drvdata(dev);
        struct imx_dsp_rproc *priv =3D rproc->priv;
        const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
        int ret;

        /*
         * There is power domain attached with mailbox, if setup mailbox
         * in probe(), then the power of mailbox is always enabled,
         * the power can't be saved.
         * So move setup of mailbox to runtime resume.
         */
        ret =3D imx_dsp_rproc_mbox_init(priv);
        if (ret) {
                dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
                return ret;
        }

        ret =3D clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
        if (ret) {
                dev_err(dev, "failed on clk_bulk_prepare_enable\n");
                return ret;
        }

        /* Reset DSP if needed */
        if (dsp_dcfg->reset)
                dsp_dcfg->reset(priv);

        return 0;
}

>
> >
> >
> > best regards
> > Shengjiu Wang
> >
> > >
> > > Thanks,
> > > Mathieu
> > >
> > > >               return 0;
> > > >       }
> > > >
> > > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rpr=
oc)
> > > >       else
> > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > >
> > > > +     pm_runtime_put_sync(dev);
> > > > +
> > > >       return ret;
> > > >  }
> > > >
> > > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *=
rproc)
> > > >  {
> > > >       struct imx_dsp_rproc *priv =3D rproc->priv;
> > > >       struct device *dev =3D rproc->dev.parent;
> > > > -     struct rproc_mem_entry *carveout;
> > > >       int ret;
> > > >
> > > >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc =
*rproc)
> > > >               return ret;
> > > >       }
> > > >
> > > > -     pm_runtime_get_sync(dev);
> > > > -
> > > > -     /*
> > > > -      * Clear buffers after pm rumtime for internal ocram is not
> > > > -      * accessible if power and clock are not enabled.
> > > > -      */
> > > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > -             if (carveout->va)
> > > > -                     memset(carveout->va, 0, carveout->len);
> > > > -     }
> > > > -
> > > > -     return  0;
> > > > -}
> > > > -
> > > > -/* Unprepare function for rproc_ops */
> > > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > > -{
> > > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > > -
> > > >       return  0;
> > > >  }
> > > >
> > > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rp=
roc *rproc, const struct firmware *fw
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct fi=
rmware *fw)
> > > > +{
> > > > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > > > +
> > > > +     /*
> > > > +      * Just save the fw handler, the firmware loading will be aft=
er
> > > > +      * power enabled
> > > > +      */
> > > > +     priv->firmware =3D fw;
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> > > >       .prepare        =3D imx_dsp_rproc_prepare,
> > > > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> > > >       .start          =3D imx_dsp_rproc_start,
> > > >       .stop           =3D imx_dsp_rproc_stop,
> > > >       .kick           =3D imx_dsp_rproc_kick,
> > > > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > > > +     .load           =3D imx_dsp_rproc_load,
> > > >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> > > >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> > > >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > > > --
> > > > 2.34.1
> > > >
> > >

