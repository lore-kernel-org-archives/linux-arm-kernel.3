Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C3CC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nfLaDrIv4HHM2VYxZ0QSILSPZOjC+nFi2raIsra4eo=; b=pPxL9hhJ1wdEzd3TpPcoLctJEO
	96XbzcM0e8nRogEWVlbVTaFk06kAKvQKhtZu6w9244LHePQIeXCKb6OLIt4Ky0hq9X8dkAmDNdgXF
	KgavFM/I/QVWpjSluinqTPrb5PE7uxrrj3ftT8m8rs7Ef07k6lXY+x65otMpUYfV/u6VVrEFh8XX8
	otVDLxjL0anv6kSKRwUMrI4Wt4lRgREfTdDFmne3LF4EfMRl3yHTbdBdWAEwjpx94aN/FfbUESW1B
	75CHk/Si7ZCCoWbLoc4wP1fwGEdEEBAxYjO41gV/bNXSFHJVTkSjMeYx7V+wvVWNlXynFYUq4zKWK
	Vc2TaZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUry-00000009Zes-3q4d;
	Wed, 25 Jun 2025 18:29:14 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURHr-00000008zkO-20Ef
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:39:44 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so3073489a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750862381; x=1751467181; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nfLaDrIv4HHM2VYxZ0QSILSPZOjC+nFi2raIsra4eo=;
        b=XsAEK8Q2Z5TuaKLr8pHA8eLdP5nTCQIM+h/60N4Mda5dNwAbR2VTPq6XMtGuyzgcbx
         SbLiMA7nJroE9rkPs27yBL+0IFs42Xw9bAruila1nUYLTvVw1I58N5FE5ssTYr4yUZsV
         4jrX8d0cBkDQ+8DWeiK5nAf28mvc7+texTVtHInW5/mrzGaSB7iNZkix0dYTAGq99FLm
         ab2uNKL4QDbp1O4cDDrbUjnNPZhceyoyyApP39g9YNTMxlfJ2gkOxBRJRnjSvgAQt11J
         ZxWam4bIpojL1LHCIbIaXgqXU8NFEwna4xsM/umokcmMCfI7mlI8B0gm2gyNevxFb8RF
         WpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862381; x=1751467181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nfLaDrIv4HHM2VYxZ0QSILSPZOjC+nFi2raIsra4eo=;
        b=f34aoXLob9Wm1zrZQQpBsMmEAAPMJ1uPB2mg30OUi5m6IpmEoTG53lYvh8jQaSDxBY
         C/Ia5aHLMaufqnPS+mnui//joZ038DMBKaxKsA6iASIdzgFqFzkjLmx5fPVCfFAGJ8RF
         MgZhh9ePvLIg+UOe/hf1L8R5i4McjvnoqMWvciqFs7H4af9J/6oR0h9eVAFQa4HQlK6k
         5xSpr6NFLozCwApUlbmKla4DaZI8u1kF0bB9QDurGDujuEcpL/RB/28CPi0x8rHi0M4U
         4fZVChZkY6vlGIgONbmT+Y+mydCIzvc78z4ma8+rNoDiu8bnWHaHvUWNvAPRHaUDxRyH
         bJGA==
X-Forwarded-Encrypted: i=1; AJvYcCUPIkjJ1wSSUCPKcUGEk9i7njcRDCiiOLJ7o5EKlADEji5sBsj4xUg4RG9gMUWyltTvACKqXAcgX22oIqq+BfGA@lists.infradead.org
X-Gm-Message-State: AOJu0YwTChlcYg6tvT3kxxF+U3T9VaXeDgiYg+ZbrrDibCCyiVkRHZah
	rVULMRmmy3vWWQgFatxZ5tabPacHcxBFfr5rl4QtWy7kG4lz+Ffd3yncnEvCAoIC4v4PBjGEH/g
	ya4ROH3l+kTBMCMQJJ8uGCShkokdx3pMz5w3zcMfvQA==
X-Gm-Gg: ASbGncsw40ONw0Sx3olsR7MXOklfSI/Q/pcpz3AW6xRyt3gLl3OhIcP9BmrxgwcZyVL
	706RqcF051l84K0kclr3/3PpnIzfnqRlrXV3pJEgQJafS0N03STycdPcx/R3i/MIh5HscF/ziJc
	OmXvd4Q6+2sAhZcS2O68KfXa5QQq0C+cenccTIHVo9eJr5yo6xmmmLRLYdze3ztP3IPJ4J8WlV+
	sw1ww==
X-Google-Smtp-Source: AGHT+IE3R4XbiDX3SYA4jSl4fNvcu/S1vq69n8Iz6TYDCXbK45875fCSUjjDmvhS6/h6ekIgErdfshIIh5wv3ORIDiQ=
X-Received: by 2002:a17:907:6d0b:b0:ae0:c539:b89a with SMTP id
 a640c23a62f3a-ae0c539bd16mr311563366b.19.1750862381102; Wed, 25 Jun 2025
 07:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s> <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
In-Reply-To: <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 25 Jun 2025 08:39:30 -0600
X-Gm-Features: Ac12FXxfnFqETZmTye9WOASdoWQr8KdaOBSc0QxWt1fCM_5NlgRJzqlsQfx7gyU
Message-ID: <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_073943_550210_079CD159 
X-CRM114-Status: GOOD (  41.28  )
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

On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com> wrote=
:
>
> On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Good day,
> >
> > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > when recovery is triggered, rproc_stop() is called first then
> > > rproc_start(), but there is no rproc_unprepare_device() and
> > > rproc_prepare_device() in the flow.
> > >
> > > So power enablement needs to be moved from prepare callback to start
> > > callback, power disablement needs to be moved from unprepare callback
> > > to stop callback, loading elf function also needs to be moved to star=
t
> > > callback, the load callback only store the firmware handler.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++----------=
--
> > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/=
imx_dsp_rproc.c
> > > index 5ee622bf5352..9b9cddb224b0 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > >   * @ipc_handle: System Control Unit ipc handle
> > >   * @rproc_work: work for processing virtio interrupts
> > >   * @pm_comp: completion primitive to sync for suspend response
> > > + * @firmware: firmware handler
> > >   * @flags: control flags
> > >   */
> > >  struct imx_dsp_rproc {
> > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > >       struct imx_sc_ipc                       *ipc_handle;
> > >       struct work_struct                      rproc_work;
> > >       struct completion                       pm_comp;
> > > +     const struct firmware                   *firmware;
> > >       u32                                     flags;
> > >  };
> > >
> > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_a=
tt_imx8ulp[] =3D {
> > >
> > >  /* Initialize the mailboxes between cores, if exists */
> > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, cons=
t struct firmware *fw);
> > >
> > >  /* Reset function for DSP on i.MX8MP */
> > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rpr=
oc)
> > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> > >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> > >       struct device *dev =3D rproc->dev.parent;
> > > +     struct rproc_mem_entry *carveout;
> > >       int ret;
> > >
> > > +     pm_runtime_get_sync(dev);
> > > +
> > > +     /*
> > > +      * Clear buffers after pm rumtime for internal ocram is not
> > > +      * accessible if power and clock are not enabled.
> > > +      */
> > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > +             if (carveout->va)
> > > +                     memset(carveout->va, 0, carveout->len);
> > > +     }
> > > +
> > > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       switch (dcfg->method) {
> > >       case IMX_RPROC_MMIO:
> > >               ret =3D regmap_update_bits(priv->regmap,
> > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc=
)
> > >
> > >       if (rproc->state =3D=3D RPROC_CRASHED) {
> > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > +             pm_runtime_put_sync(dev);
> >
> > From this patch I understand that for a recovery to be successful, the
> > remote processor _has_ to go through a hard reset.  But here the PM run=
time API
> > is used, meaning the remote processor won't be switched off if another =
device in
> > the same power domain still neeeds power.  If that is the case, the sol=
ution in
> > tihs patch won't work.
>
> Thanks for reviewing.
> With the case you mentioned, there is software reset to make the
> recovery process work.


Are you talking about a manual software reset of some other mechanism?

If manual software reset, the recovery may or may not work and we
simply don't know when that might be.  If it's another mechanism, then
that mechanism should be used in all cases.  Either way, I don't see
how we can move forward with this patch.

>
>
> best regards
> Shengjiu Wang
>
> >
> > Thanks,
> > Mathieu
> >
> > >               return 0;
> > >       }
> > >
> > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc=
)
> > >       else
> > >               priv->flags &=3D ~REMOTE_IS_READY;
> > >
> > > +     pm_runtime_put_sync(dev);
> > > +
> > >       return ret;
> > >  }
> > >
> > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rp=
roc)
> > >  {
> > >       struct imx_dsp_rproc *priv =3D rproc->priv;
> > >       struct device *dev =3D rproc->dev.parent;
> > > -     struct rproc_mem_entry *carveout;
> > >       int ret;
> > >
> > >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *r=
proc)
> > >               return ret;
> > >       }
> > >
> > > -     pm_runtime_get_sync(dev);
> > > -
> > > -     /*
> > > -      * Clear buffers after pm rumtime for internal ocram is not
> > > -      * accessible if power and clock are not enabled.
> > > -      */
> > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > -             if (carveout->va)
> > > -                     memset(carveout->va, 0, carveout->len);
> > > -     }
> > > -
> > > -     return  0;
> > > -}
> > > -
> > > -/* Unprepare function for rproc_ops */
> > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > -{
> > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > -
> > >       return  0;
> > >  }
> > >
> > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rpro=
c *rproc, const struct firmware *fw
> > >       return 0;
> > >  }
> > >
> > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firm=
ware *fw)
> > > +{
> > > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > > +
> > > +     /*
> > > +      * Just save the fw handler, the firmware loading will be after
> > > +      * power enabled
> > > +      */
> > > +     priv->firmware =3D fw;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> > >       .prepare        =3D imx_dsp_rproc_prepare,
> > > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> > >       .start          =3D imx_dsp_rproc_start,
> > >       .stop           =3D imx_dsp_rproc_stop,
> > >       .kick           =3D imx_dsp_rproc_kick,
> > > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > > +     .load           =3D imx_dsp_rproc_load,
> > >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> > >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> > >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > > --
> > > 2.34.1
> > >
> >

