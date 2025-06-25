Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2153C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 03:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=; b=HE/fpzuFuW+Fve5MMY9T7fYAoR
	kfbgu3GswpVWYZDS3mNlzFv2h0cs9BDPM5kDbIPZL36V0q9KJiXTKFkG9QZPbxFLjmXvM68qlpp/s
	wFyQj0j7PKkaCdGoIPbhZ0JyR/KJJkTqJngxeBtlvPe0Sx/fkRlWn6efLDuKfx/xFKCj4ssNK2RE2
	a71V0t9asrdJqcaFAekzxnnJNfK+uq75M39AYjHqo9lUl9evroXQu/UPZGwTAKUGM8J7hU8HigSBt
	ipreHCBShROMi209ZJmDpA4CQvsCQLqnD7Ac7zcOQj93IT6crjRo9bLOngY1wVCY+oAlVDNb6DSpx
	TMwO0xnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGny-00000007OyK-1N3z;
	Wed, 25 Jun 2025 03:28:10 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGla-00000007Oou-2Xj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 03:25:43 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so63499775ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821941; x=1751426741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=;
        b=iRBXMtRGmiADV68/HuGvE98LF6N+emu9ShfTqMiruzmr2HohHFBh3r58oXfPrU/1Al
         bUYz9LXmoQymWNJEdmPSXTIbOS4VXkPsUGFKdfCXADUOokDPoEv8OZz6xvCVuQOhvUTz
         kqsYg7ujF9KX2+H/q3rW2zfwJxAUAUVoSaAeSh+R/g9IVjr2hKfwtES3bl5d04F5+2TZ
         THkDCA7JflWcrGKbZjmou0OY+LDxmbp0zw7YCHkBjDisIPd3fy4yknDl7rMeSc3g/2cx
         /9zevpNn0zy87VPxD8PyzJ+mDVTkXrni6b0H2Kj3Sbt9GJOnbZ+ntPYnWV9rnZmZNQuE
         9opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821941; x=1751426741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=;
        b=W/vR3NwYrJ8NaFxF2Uo3zC6s3K9mKmF+HN+rng3xFIi0tseSfULAoCmM2RCo9duG52
         y1usMMBthxZmLPpnwd9srLwE/WHz+6vvrEqwBfVShNuWWCZkBQqunK7UTPuu0Zb1OCO2
         CReUOiYntz52fS3CmIbZXOdjjF7Tprv1dCkhUTGjIvb0HGMhlZ55tFoPnG7QdPRfkNof
         5AMa65AVVCeQUkYpVbJ5QvIRplK0pdpWDM/+jLV2Qh8kchlFr+4n0DVd9TA/f9mfqM3H
         OanFQ7Alh6hGoi2mlXrxHm8UxhUNFIh9ei64bYNGtOWmweo+5WPKE/e74Jf3ZjgDBNox
         3G9g==
X-Forwarded-Encrypted: i=1; AJvYcCWWBnqu61O1ZDO1qxC3r0yX5l2F+3y1vZQoOsLe06tF1pbP5e4f/gCasudM0UBXQhQNrWaGIOTnVIrCAaNQikdZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yznvu3hSj4/N108c7b4ljo+6zt7ilrPvu6joYouDCoUVNA6zdCA
	NoYeDiEhJZ9I680NOcBFucIp9vVP1QQCL7Pke8m8Ji+KrMaydtv3D9+b4NHELfkBK1EFF3g01ve
	2aq4Ld1NHKo93tqD6AwyEbEfnuGFKMJM=
X-Gm-Gg: ASbGncuVjz4vF4gBApt6pn8MlI4O7uuxKd27q5SmgsvYH7EdYVJ2FluTcks83gNnl42
	NU2PDXBbSNAZgZn+3JBhM7LD8wvVxLQINmkVOQXptHLyDgE9TC+CXpq2CLWq7XaoHg6u2c/023/
	0hjI9qsDN2gRDenvs51CIECLXF23xqGT/dd+es8qml/VXubya+a4Z8pA==
X-Google-Smtp-Source: AGHT+IGTb/5LGPPf3L0DL//MOyob2CFyZfg/IHtK/wNWTQnMHIKm1ENWEeAPJPDEIqD049xw5eck28OJqJkG6TTW8sI=
X-Received: by 2002:a05:6e02:1c09:b0:3dc:8075:ccd3 with SMTP id
 e9e14a558f8ab-3df3294954dmr17771145ab.9.1750821941152; Tue, 24 Jun 2025
 20:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
In-Reply-To: <aFltBpXuEXVZ5gKn@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Jun 2025 11:25:29 +0800
X-Gm-Features: Ac12FXzRQJouDdZDx5KrobO9xlf8zpg91IyZbOOnLAWOvOD5rocTnkVsx4AQ2xM
Message-ID: <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_202542_673885_F3E5AC58 
X-CRM114-Status: GOOD (  34.89  )
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

On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > when recovery is triggered, rproc_stop() is called first then
> > rproc_start(), but there is no rproc_unprepare_device() and
> > rproc_prepare_device() in the flow.
> >
> > So power enablement needs to be moved from prepare callback to start
> > callback, power disablement needs to be moved from unprepare callback
> > to stop callback, loading elf function also needs to be moved to start
> > callback, the load callback only store the firmware handler.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
> >  1 file changed, 36 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5ee622bf5352..9b9cddb224b0 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> >   * @ipc_handle: System Control Unit ipc handle
> >   * @rproc_work: work for processing virtio interrupts
> >   * @pm_comp: completion primitive to sync for suspend response
> > + * @firmware: firmware handler
> >   * @flags: control flags
> >   */
> >  struct imx_dsp_rproc {
> > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> >       struct imx_sc_ipc                       *ipc_handle;
> >       struct work_struct                      rproc_work;
> >       struct completion                       pm_comp;
> > +     const struct firmware                   *firmware;
> >       u32                                     flags;
> >  };
> >
> > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att=
_imx8ulp[] =3D {
> >
> >  /* Initialize the mailboxes between cores, if exists */
> >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const =
struct firmware *fw);
> >
> >  /* Reset function for DSP on i.MX8MP */
> >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc=
)
> >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> >       struct device *dev =3D rproc->dev.parent;
> > +     struct rproc_mem_entry *carveout;
> >       int ret;
> >
> > +     pm_runtime_get_sync(dev);
> > +
> > +     /*
> > +      * Clear buffers after pm rumtime for internal ocram is not
> > +      * accessible if power and clock are not enabled.
> > +      */
> > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +             if (carveout->va)
> > +                     memset(carveout->va, 0, carveout->len);
> > +     }
> > +
> > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > +     if (ret)
> > +             return ret;
> > +
> >       switch (dcfg->method) {
> >       case IMX_RPROC_MMIO:
> >               ret =3D regmap_update_bits(priv->regmap,
> > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> >
> >       if (rproc->state =3D=3D RPROC_CRASHED) {
> >               priv->flags &=3D ~REMOTE_IS_READY;
> > +             pm_runtime_put_sync(dev);
>
> From this patch I understand that for a recovery to be successful, the
> remote processor _has_ to go through a hard reset.  But here the PM runti=
me API
> is used, meaning the remote processor won't be switched off if another de=
vice in
> the same power domain still neeeds power.  If that is the case, the solut=
ion in
> tihs patch won't work.

Thanks for reviewing.
With the case you mentioned, there is software reset to make the
recovery process work.

best regards
Shengjiu Wang

>
> Thanks,
> Mathieu
>
> >               return 0;
> >       }
> >
> > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> >       else
> >               priv->flags &=3D ~REMOTE_IS_READY;
> >
> > +     pm_runtime_put_sync(dev);
> > +
> >       return ret;
> >  }
> >
> > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >       struct imx_dsp_rproc *priv =3D rproc->priv;
> >       struct device *dev =3D rproc->dev.parent;
> > -     struct rproc_mem_entry *carveout;
> >       int ret;
> >
> >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpr=
oc)
> >               return ret;
> >       }
> >
> > -     pm_runtime_get_sync(dev);
> > -
> > -     /*
> > -      * Clear buffers after pm rumtime for internal ocram is not
> > -      * accessible if power and clock are not enabled.
> > -      */
> > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > -             if (carveout->va)
> > -                     memset(carveout->va, 0, carveout->len);
> > -     }
> > -
> > -     return  0;
> > -}
> > -
> > -/* Unprepare function for rproc_ops */
> > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > -{
> > -     pm_runtime_put_sync(rproc->dev.parent);
> > -
> >       return  0;
> >  }
> >
> > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc =
*rproc, const struct firmware *fw
> >       return 0;
> >  }
> >
> > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmwa=
re *fw)
> > +{
> > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > +
> > +     /*
> > +      * Just save the fw handler, the firmware loading will be after
> > +      * power enabled
> > +      */
> > +     priv->firmware =3D fw;
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> >       .prepare        =3D imx_dsp_rproc_prepare,
> > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> >       .start          =3D imx_dsp_rproc_start,
> >       .stop           =3D imx_dsp_rproc_stop,
> >       .kick           =3D imx_dsp_rproc_kick,
> > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > +     .load           =3D imx_dsp_rproc_load,
> >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > --
> > 2.34.1
> >
>

