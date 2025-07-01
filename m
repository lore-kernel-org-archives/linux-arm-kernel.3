Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A18C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 02:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnucjgvU6q5mZapD58W0SglTLoe8Vn8lYPtV2HgiZ2Q=; b=YUDuDcy+ve7MLmjGzGeJy6Pp44
	KvBQP7RfwotSfpTmwifwRr2FKZ3ik85jLOdB1rCw+X3/YllBdmdlO5jpJU8nwI/zmeAExisHisD/w
	6FNiffXcEn7hcc91CSRMbePYXFzsYRS/7p0Dv4tgjjJHX+EKypUDdyE4m8znvwgKDbWH9W0HT+wL0
	WhDkIj/LCXX7ZUzWd6EMoKZgjMZghGZkhJDRGywDoDT1DMSAvbTbT/XWWTPgZLf1M9KFezSkBkpWa
	vdMWIs5/M0TK0tNVcMZZMvihVpYL/XgOzbUDUzOu7daNF3Xk64uNy0DyEcuMyna1XnCkGa/eUjUGe
	z1Ti+Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQaP-00000003rWo-2IKP;
	Tue, 01 Jul 2025 02:19:05 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWQY5-00000003rQF-1uJ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 02:16:42 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso15945185ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 19:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751336200; x=1751941000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnucjgvU6q5mZapD58W0SglTLoe8Vn8lYPtV2HgiZ2Q=;
        b=RBwXaDceEp4sq4JYkYlG2h9X3CM8nPfK6F5EBpwKBBb2uQYjtYH5dvOwGbpFGQbYc5
         FS3R5pHR9wyU+g582b96CuIUXVsFxnr7oh/OG2U8l/InGInBOlqqrHQlYpgRJ5IU28E7
         es/soLekm9OvuL6aLvynSu9zcalyHHKCqGIbJrIxFmF077XdZByV4O92GWIgbdo6vzar
         wURxwUXoHxo83AvlnjrKqsQqzIWnvslJJuEemM9Zh/n08SewNyI49x+etnMhyShOa2TT
         XuFhwjBhBiS89ztqutZleK4DZEen4OZyvnmvF03FOgYkRuVCj+zjD7A6mEJuunn2HkIE
         Obxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336200; x=1751941000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnucjgvU6q5mZapD58W0SglTLoe8Vn8lYPtV2HgiZ2Q=;
        b=P2HQtcgMvggJ/ucZ8PdycL/bPjfLp8o+B15b4UiK7p2bBdj0ORax+pHdlP0EOu49mi
         ni56j7ALYBSjFHcBRvKbnOsr4ZxYKXnZXp9+0xhjTW3ESTXnfa4vEVC6IGlUJ5UR+XCv
         pzX6bMF7+ZaXGsi9cHUvjxxEUeNnUhaHYyia5ha1Nzryy7vtZsm/iKzExaYTc6ecCu+c
         tgMuQJ+f6nXyIDP9vIrlvoYOWgGD/zin9CHPy5hsnVV7tYcPi1XwfAca2M6Qd4AvhXEF
         21tqyi+KSRr7/IuHi8aeqWpq5bdLtD05eBe79jKZOOL45r+PHDdWeiEA+BRGRkfrP2ve
         ZkAg==
X-Forwarded-Encrypted: i=1; AJvYcCX221DzsJWJd0AXXtc8fIs9JPqljNrbGHomog1WkAgRp3k9B1ceGuHYBXdN1xY2U2Tfp6ldDpYmcqcwzeN7nH+j@lists.infradead.org
X-Gm-Message-State: AOJu0YyVOQrdMpKRRKR+s6CfwiP8VvtOum55lngzLaott+09QBpdjq9F
	iTazIvGIVdWzhsKfCC2pYyFX18FZqDIDuaL/valU806kGogSn19JV6gGeHsuiezx1U1EJfrnbbw
	bZ+FzAelh0G/qMHTRJhC7qCYFplZ345A=
X-Gm-Gg: ASbGncumdbP87n8TSFVwOpRrLWTXNO1dmpBqWQmGH4ykgiuNjLXe4Tzr58IFqLi5uzi
	WnGOn0KKBbPDhXvaYsF1MT4Xr68RYdrWcOHoccNrXEmFE7vHn5pKgV+HbhxVDgcjyzQLs9WbHc9
	0vBUopLwvzpR/fQ7XsONCl3cFOQf9nek5pa99B3KGFM6A=
X-Google-Smtp-Source: AGHT+IEoGNaUupWOV8xq/VF/UmZ75W1Egh/x7LX2TjiyozewvOd7dKD/hFx0PT4Ozuh1uRBEElDY6DKi0WQ9HbWmEgA=
X-Received: by 2002:a05:6e02:1527:b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3df4ab78488mr169121505ab.8.1751336200129; Mon, 30 Jun 2025
 19:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
 <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
 <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
 <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com> <aGLAEvhyjrCbZoIf@p14s>
In-Reply-To: <aGLAEvhyjrCbZoIf@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Jul 2025 10:16:21 +0800
X-Gm-Features: Ac12FXy80mkzgbzMVX8fGVYqHr03n47hheZnuVvSEZcgI5tUYYlWrg949W4MhsU
Message-ID: <CAA+D8ANLOxnfj9cWhbTUWHuFGt5Qb-upTmKfCyNxEb1ChJKjbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_191641_500778_89EF2C28 
X-CRM114-Status: GOOD (  54.81  )
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

On Tue, Jul 1, 2025 at 12:49=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Jun 26, 2025 at 09:32:06AM +0800, Shengjiu Wang wrote:
> > On Wed, Jun 25, 2025 at 10:39=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com>=
 wrote:
> > > >
> > > > On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
> > > > <mathieu.poirier@linaro.org> wrote:
> > > > >
> > > > > Good day,
> > > > >
> > > > > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > > > > when recovery is triggered, rproc_stop() is called first then
> > > > > > rproc_start(), but there is no rproc_unprepare_device() and
> > > > > > rproc_prepare_device() in the flow.
> > > > > >
> > > > > > So power enablement needs to be moved from prepare callback to =
start
> > > > > > callback, power disablement needs to be moved from unprepare ca=
llback
> > > > > > to stop callback, loading elf function also needs to be moved t=
o start
> > > > > > callback, the load callback only store the firmware handler.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++----=
--------
> > > > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remot=
eproc/imx_dsp_rproc.c
> > > > > > index 5ee622bf5352..9b9cddb224b0 100644
> > > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > > > > >   * @ipc_handle: System Control Unit ipc handle
> > > > > >   * @rproc_work: work for processing virtio interrupts
> > > > > >   * @pm_comp: completion primitive to sync for suspend response
> > > > > > + * @firmware: firmware handler
> > > > > >   * @flags: control flags
> > > > > >   */
> > > > > >  struct imx_dsp_rproc {
> > > > > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > > > > >       struct imx_sc_ipc                       *ipc_handle;
> > > > > >       struct work_struct                      rproc_work;
> > > > > >       struct completion                       pm_comp;
> > > > > > +     const struct firmware                   *firmware;
> > > > > >       u32                                     flags;
> > > > > >  };
> > > > > >
> > > > > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_r=
proc_att_imx8ulp[] =3D {
> > > > > >
> > > > > >  /* Initialize the mailboxes between cores, if exists */
> > > > > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *pr=
iv);
> > > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc=
, const struct firmware *fw);
> > > > > >
> > > > > >  /* Reset function for DSP on i.MX8MP */
> > > > > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > > > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rpro=
c *rproc)
> > > > > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_d=
cfg;
> > > > > >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> > > > > >       struct device *dev =3D rproc->dev.parent;
> > > > > > +     struct rproc_mem_entry *carveout;
> > > > > >       int ret;
> > > > > >
> > > > > > +     pm_runtime_get_sync(dev);
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Clear buffers after pm rumtime for internal ocram is n=
ot
> > > > > > +      * accessible if power and clock are not enabled.
> > > > > > +      */
> > > > > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > > +             if (carveout->va)
> > > > > > +                     memset(carveout->va, 0, carveout->len);
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firm=
ware);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > >       switch (dcfg->method) {
> > > > > >       case IMX_RPROC_MMIO:
> > > > > >               ret =3D regmap_update_bits(priv->regmap,
> > > > > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc =
*rproc)
> > > > > >
> > > > > >       if (rproc->state =3D=3D RPROC_CRASHED) {
> > > > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > > > > +             pm_runtime_put_sync(dev);
> > > > >
> > > > > From this patch I understand that for a recovery to be successful=
, the
> > > > > remote processor _has_ to go through a hard reset.  But here the =
PM runtime API
> > > > > is used, meaning the remote processor won't be switched off if an=
other device in
> > > > > the same power domain still neeeds power.  If that is the case, t=
he solution in
> > > > > tihs patch won't work.
> > > >
> > > > Thanks for reviewing.
> > > > With the case you mentioned, there is software reset to make the
> > > > recovery process work.
> > >
> > >
> > > Are you talking about a manual software reset of some other mechanism=
?
> > >
> > > If manual software reset, the recovery may or may not work and we
> > > simply don't know when that might be.  If it's another mechanism, the=
n
> > > that mechanism should be used in all cases.  Either way, I don't see
> > > how we can move forward with this patch.
> >
> > Not manual software reset,  in this driver we registered .reset() funct=
ion.
> > it has been called at imx_dsp_runtime_resume(),  I paste the function b=
elow.
> >
> > And I have tested the case you mentioned, the recovery works.
> >
> > /* pm runtime functions */
> > static int imx_dsp_runtime_resume(struct device *dev)
> > {
> >         struct rproc *rproc =3D dev_get_drvdata(dev);
> >         struct imx_dsp_rproc *priv =3D rproc->priv;
> >         const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >         int ret;
> >
> >         /*
> >          * There is power domain attached with mailbox, if setup mailbo=
x
> >          * in probe(), then the power of mailbox is always enabled,
> >          * the power can't be saved.
> >          * So move setup of mailbox to runtime resume.
> >          */
> >         ret =3D imx_dsp_rproc_mbox_init(priv);
> >         if (ret) {
> >                 dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
> >                 return ret;
> >         }
> >
> >         ret =3D clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
> >         if (ret) {
> >                 dev_err(dev, "failed on clk_bulk_prepare_enable\n");
> >                 return ret;
> >         }
> >
> >         /* Reset DSP if needed */
> >         if (dsp_dcfg->reset)
> >                 dsp_dcfg->reset(priv);
> >
> >         return 0;
> > }
> >
>
> Thanks for the clarification.  I would have been nice to have that kind o=
f
> explanation (not the copy paste of the imx_dsp_runtime_resume() function)=
 in the
> changelog.

Ok, will add it.

>
> That said, that is just one aspect of the things I find bizarre with this
> patchset - see below.
>
> > >
> > > >
> > > >
> > > > best regards
> > > > Shengjiu Wang
> > > >
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > > >               return 0;
> > > > > >       }
> > > > > >
> > > > > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc =
*rproc)
> > > > > >       else
> > > > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > > > >
> > > > > > +     pm_runtime_put_sync(dev);
> > > > > > +
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rpr=
oc *rproc)
> > > > > >  {
> > > > > >       struct imx_dsp_rproc *priv =3D rproc->priv;
> > > > > >       struct device *dev =3D rproc->dev.parent;
> > > > > > -     struct rproc_mem_entry *carveout;
> > > > > >       int ret;
> > > > > >
> > > > > >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > > > > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rp=
roc *rproc)
> > > > > >               return ret;
> > > > > >       }
> > > > > >
> > > > > > -     pm_runtime_get_sync(dev);
> > > > > > -
> > > > > > -     /*
> > > > > > -      * Clear buffers after pm rumtime for internal ocram is n=
ot
> > > > > > -      * accessible if power and clock are not enabled.
> > > > > > -      */
> > > > > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > > -             if (carveout->va)
> > > > > > -                     memset(carveout->va, 0, carveout->len);
> > > > > > -     }
> > > > > > -
> > > > > > -     return  0;
> > > > > > -}
> > > > > > -
> > > > > > -/* Unprepare function for rproc_ops */
> > > > > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > > > > -{
> > > > > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > > > > -
> > > > > >       return  0;
> > > > > >  }
> > > > > >
> > > > > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struc=
t rproc *rproc, const struct firmware *fw
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struc=
t firmware *fw)
> > > > > > +{
> > > > > > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Just save the fw handler, the firmware loading will be=
 after
> > > > > > +      * power enabled
> > > > > > +      */
> > > > > > +     priv->firmware =3D fw;
> > > > > > +
>
> Why is a new firwmare variable needed?  Why can't you just use rproc->fir=
mware?

 The "firmware" in "rproc->firmware" is "const char *firmware;"
* @firmware: name of firmware file to be loaded

But "const struct firmware *fw" is the result after request_firmware()
ret =3D request_firmware(&firmware_p, rproc->firmware, dev);
"firmware_p" is the "fw".

As the remoteproc_core.c has called request_firmware(), so we don't need to=
 call
the request_firmware() again.  so use the new "const struct firmware
*firmware;" for
saving the "fw".

Best regards
Shengjiu Wang
>
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> > > > > >       .prepare        =3D imx_dsp_rproc_prepare,
> > > > > > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> > > > > >       .start          =3D imx_dsp_rproc_start,
> > > > > >       .stop           =3D imx_dsp_rproc_stop,
> > > > > >       .kick           =3D imx_dsp_rproc_kick,
> > > > > > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > > > > > +     .load           =3D imx_dsp_rproc_load,
> > > > > >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> > > > > >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> > > > > >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_tabl=
e,
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >

