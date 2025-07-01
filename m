Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6566CC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/LzDFUd08uVqn1UnqBLix0fV11YVLJxk07IbCif910=; b=HD9DnRcbeRPpHMSnTeh/eVEI4I
	LWRZu8f7QIdLCRaLdQtxpxOHbG/t73n5KEbLOEPgQa0MMJU8tnsu7uIJZrZgIhh7c55/6R3qHuP5n
	8011mYB+/D7pb9/XzNaP96kxTFLojiibtvVtQ3Jr7qygDY5bCudpy8ymEs6eBKdJueLQM+ezlbYtj
	Mp3FLcDhh1idbCkf0TLvWkr290ChFAQRk4dlUCYPLPmJNSZJza8OdeSgZEZC5MFwEc8AQYRLtuQQI
	9HmnU5hTh3IaqY8fMzWIQBrVJovfkbpZNduDgBIRAojPGEGfQZvKf7RCKZAWY/22Oy5t7UCiZSqzc
	JFLBx3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdWM-00000005ysM-2p9K;
	Tue, 01 Jul 2025 16:07:46 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbx3-00000005hWC-3OYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:27:14 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1475521b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751380033; x=1751984833; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D/LzDFUd08uVqn1UnqBLix0fV11YVLJxk07IbCif910=;
        b=F0YG5XAQ1Cjd9M+oTW76RhbcXhttiouYmZmPKIznJiU6a9IRGLYpPPdF8ti2SATGYt
         jIq9loVg3Bzheazw1w7U9Tt/3lPHYaZcWujnQSmuPjHOy5uHXWYATzjipT5OFXxMinCg
         /Rp10ppjC9ttVbY+TVDgX9UU1aBOK27YWlTx/n/BHIAYwu1kNwAycHCBVizLdh9yXGXX
         81/cs+oVS69O2/WgC89IRDH/M1NhcsKa1Cbc8YiLduKY/IihpUB6/Ltlamq6NIeyZr1V
         DmpBKqMPiiaRNqUJcWCnReCOSi7GPR3k27sZEHnw/XDRNJHtFM7zGSy/Ipp08qiWQCrz
         EnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380033; x=1751984833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/LzDFUd08uVqn1UnqBLix0fV11YVLJxk07IbCif910=;
        b=mgVcpvFrQsd04ZJExzeFuRzl0FHOEEXdvBOAOVCzc9YjEbvro2xiWU5gEEpGWmxBnR
         e0n1FsYQiFi+5MSFDOBN6JzYPtG1IoyXMcyRsuIp7X4S3ROb32GFYN41VSXC+iiE0WDn
         FntbIL7+jDh32RV+PEBqqPIltuCT+OkwHh4CbIPmLylpD0rd4YztKxuKuQU1vjXaNm6g
         Zu+hhhLLOmefgZLXXwiHFQEYI6ZNMUPgX+32sKD8x/bymZC5RKdXN3Vsvtft2C5t2/Sz
         vHig5gIG3e7zOVupj3xxsf7GF8t5ajWiaiIWV3g9Q0CfRCw1h9aUBjP/ODLGcL6i+rOk
         xXjA==
X-Forwarded-Encrypted: i=1; AJvYcCVgDFo/sSvTrtKm5NRLIQxl0jS+xEvuM5zKXFnVLbvTie/w5qzuZiKYtyGiMBLx19jDiUKfA8SMGY5VM0G3NA8e@lists.infradead.org
X-Gm-Message-State: AOJu0YwEDB5CWvLr3/l7crRFuxgTKH+MNRX/yy1HwM/VsAUxCF/QHwj7
	iGaMtTrJatvSVrTg0JXwcXvrQxjlkm58yjEtWTRGwm6tZKfNyYpVzodw6PT+KAAPUGua1wyxXpF
	yPvdgK08=
X-Gm-Gg: ASbGncsCZJzD6M6EUg0YF3bIeTVfSYKCShUdEkBkxdwK0f3gGY1V89OEb83P/O8Y8Bb
	eFbppLbkjs6nN5STfPpq/xAJAVwt/k9NFcODj2njwn7XpBVHOZfsXoPeOMJwIm+/YUWp9zEZtzd
	Zz6OCTbS0X0ssFqQPKjsScZDYJNWmqujkT59Iv9BP3GLpNxtWHNBnoNw/B31O3k9DGwGxmTGY80
	hhjLe1+PBVcYmvhU7MR/MQti6zg8negpJ4R37X5EJF/ma1y2rCzfWTzyfMbvzBLI9bE2AMUh6/P
	qBxrMTPEG+FwCYy109fp66KLm6o1UjL6qAB7uoV9h2yALm39+maUFnvXaJKbUFu5Ra+XeqecGlD
	f
X-Google-Smtp-Source: AGHT+IHWDplP+mSvwBbgNyXECwNqolDcVKxeCipzxq0AEnaLJRzr3NaK42vQj7ZRYIVHVNCBCyQvdA==
X-Received: by 2002:a05:6a00:3a0f:b0:748:f3b0:4db6 with SMTP id d2e1a72fcca58-74af6f4a507mr24062703b3a.11.1751380032554;
        Tue, 01 Jul 2025 07:27:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:94b9:2bc2:7ead:7a72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5580fb6sm11294397b3a.89.2025.07.01.07.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:27:12 -0700 (PDT)
Date: Tue, 1 Jul 2025 08:27:09 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery
 process
Message-ID: <aGPwPW_f1qAZGmzd@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com>
 <aFltBpXuEXVZ5gKn@p14s>
 <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
 <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
 <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com>
 <aGLAEvhyjrCbZoIf@p14s>
 <CAA+D8ANLOxnfj9cWhbTUWHuFGt5Qb-upTmKfCyNxEb1ChJKjbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8ANLOxnfj9cWhbTUWHuFGt5Qb-upTmKfCyNxEb1ChJKjbg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_072713_856527_7006DCC9 
X-CRM114-Status: GOOD (  60.65  )
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

On Tue, Jul 01, 2025 at 10:16:21AM +0800, Shengjiu Wang wrote:
> On Tue, Jul 1, 2025 at 12:49 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Thu, Jun 26, 2025 at 09:32:06AM +0800, Shengjiu Wang wrote:
> > > On Wed, Jun 25, 2025 at 10:39 PM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jun 23, 2025 at 11:11 PM Mathieu Poirier
> > > > > <mathieu.poirier@linaro.org> wrote:
> > > > > >
> > > > > > Good day,
> > > > > >
> > > > > > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > > > > > when recovery is triggered, rproc_stop() is called first then
> > > > > > > rproc_start(), but there is no rproc_unprepare_device() and
> > > > > > > rproc_prepare_device() in the flow.
> > > > > > >
> > > > > > > So power enablement needs to be moved from prepare callback to start
> > > > > > > callback, power disablement needs to be moved from unprepare callback
> > > > > > > to stop callback, loading elf function also needs to be moved to start
> > > > > > > callback, the load callback only store the firmware handler.
> > > > > > >
> > > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > > ---
> > > > > > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
> > > > > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > > index 5ee622bf5352..9b9cddb224b0 100644
> > > > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > > > > > >   * @ipc_handle: System Control Unit ipc handle
> > > > > > >   * @rproc_work: work for processing virtio interrupts
> > > > > > >   * @pm_comp: completion primitive to sync for suspend response
> > > > > > > + * @firmware: firmware handler
> > > > > > >   * @flags: control flags
> > > > > > >   */
> > > > > > >  struct imx_dsp_rproc {
> > > > > > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > > > > > >       struct imx_sc_ipc                       *ipc_handle;
> > > > > > >       struct work_struct                      rproc_work;
> > > > > > >       struct completion                       pm_comp;
> > > > > > > +     const struct firmware                   *firmware;
> > > > > > >       u32                                     flags;
> > > > > > >  };
> > > > > > >
> > > > > > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att_imx8ulp[] = {
> > > > > > >
> > > > > > >  /* Initialize the mailboxes between cores, if exists */
> > > > > > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > > > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
> > > > > > >
> > > > > > >  /* Reset function for DSP on i.MX8MP */
> > > > > > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > > > > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
> > > > > > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > > > > > >       const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
> > > > > > >       struct device *dev = rproc->dev.parent;
> > > > > > > +     struct rproc_mem_entry *carveout;
> > > > > > >       int ret;
> > > > > > >
> > > > > > > +     pm_runtime_get_sync(dev);
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * Clear buffers after pm rumtime for internal ocram is not
> > > > > > > +      * accessible if power and clock are not enabled.
> > > > > > > +      */
> > > > > > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > > > +             if (carveout->va)
> > > > > > > +                     memset(carveout->va, 0, carveout->len);
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     ret = imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > > > > > > +     if (ret)
> > > > > > > +             return ret;
> > > > > > > +
> > > > > > >       switch (dcfg->method) {
> > > > > > >       case IMX_RPROC_MMIO:
> > > > > > >               ret = regmap_update_bits(priv->regmap,
> > > > > > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> > > > > > >
> > > > > > >       if (rproc->state == RPROC_CRASHED) {
> > > > > > >               priv->flags &= ~REMOTE_IS_READY;
> > > > > > > +             pm_runtime_put_sync(dev);
> > > > > >
> > > > > > From this patch I understand that for a recovery to be successful, the
> > > > > > remote processor _has_ to go through a hard reset.  But here the PM runtime API
> > > > > > is used, meaning the remote processor won't be switched off if another device in
> > > > > > the same power domain still neeeds power.  If that is the case, the solution in
> > > > > > tihs patch won't work.
> > > > >
> > > > > Thanks for reviewing.
> > > > > With the case you mentioned, there is software reset to make the
> > > > > recovery process work.
> > > >
> > > >
> > > > Are you talking about a manual software reset of some other mechanism?
> > > >
> > > > If manual software reset, the recovery may or may not work and we
> > > > simply don't know when that might be.  If it's another mechanism, then
> > > > that mechanism should be used in all cases.  Either way, I don't see
> > > > how we can move forward with this patch.
> > >
> > > Not manual software reset,  in this driver we registered .reset() function.
> > > it has been called at imx_dsp_runtime_resume(),  I paste the function below.
> > >
> > > And I have tested the case you mentioned, the recovery works.
> > >
> > > /* pm runtime functions */
> > > static int imx_dsp_runtime_resume(struct device *dev)
> > > {
> > >         struct rproc *rproc = dev_get_drvdata(dev);
> > >         struct imx_dsp_rproc *priv = rproc->priv;
> > >         const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> > >         int ret;
> > >
> > >         /*
> > >          * There is power domain attached with mailbox, if setup mailbox
> > >          * in probe(), then the power of mailbox is always enabled,
> > >          * the power can't be saved.
> > >          * So move setup of mailbox to runtime resume.
> > >          */
> > >         ret = imx_dsp_rproc_mbox_init(priv);
> > >         if (ret) {
> > >                 dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
> > >                 return ret;
> > >         }
> > >
> > >         ret = clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
> > >         if (ret) {
> > >                 dev_err(dev, "failed on clk_bulk_prepare_enable\n");
> > >                 return ret;
> > >         }
> > >
> > >         /* Reset DSP if needed */
> > >         if (dsp_dcfg->reset)
> > >                 dsp_dcfg->reset(priv);
> > >
> > >         return 0;
> > > }
> > >
> >
> > Thanks for the clarification.  I would have been nice to have that kind of
> > explanation (not the copy paste of the imx_dsp_runtime_resume() function) in the
> > changelog.
> 
> Ok, will add it.
> 
> >
> > That said, that is just one aspect of the things I find bizarre with this
> > patchset - see below.
> >
> > > >
> > > > >
> > > > >
> > > > > best regards
> > > > > Shengjiu Wang
> > > > >
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > > >               return 0;
> > > > > > >       }
> > > > > > >
> > > > > > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> > > > > > >       else
> > > > > > >               priv->flags &= ~REMOTE_IS_READY;
> > > > > > >
> > > > > > > +     pm_runtime_put_sync(dev);
> > > > > > > +
> > > > > > >       return ret;
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
> > > > > > >  {
> > > > > > >       struct imx_dsp_rproc *priv = rproc->priv;
> > > > > > >       struct device *dev = rproc->dev.parent;
> > > > > > > -     struct rproc_mem_entry *carveout;
> > > > > > >       int ret;
> > > > > > >
> > > > > > >       ret = imx_dsp_rproc_add_carveout(priv);
> > > > > > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
> > > > > > >               return ret;
> > > > > > >       }
> > > > > > >
> > > > > > > -     pm_runtime_get_sync(dev);
> > > > > > > -
> > > > > > > -     /*
> > > > > > > -      * Clear buffers after pm rumtime for internal ocram is not
> > > > > > > -      * accessible if power and clock are not enabled.
> > > > > > > -      */
> > > > > > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > > > -             if (carveout->va)
> > > > > > > -                     memset(carveout->va, 0, carveout->len);
> > > > > > > -     }
> > > > > > > -
> > > > > > > -     return  0;
> > > > > > > -}
> > > > > > > -
> > > > > > > -/* Unprepare function for rproc_ops */
> > > > > > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > > > > > -{
> > > > > > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > > > > > -
> > > > > > >       return  0;
> > > > > > >  }
> > > > > > >
> > > > > > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
> > > > > > >       return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> > > > > > > +{
> > > > > > > +     struct imx_dsp_rproc *priv = rproc->priv;
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * Just save the fw handler, the firmware loading will be after
> > > > > > > +      * power enabled
> > > > > > > +      */
> > > > > > > +     priv->firmware = fw;
> > > > > > > +
> >
> > Why is a new firwmare variable needed?  Why can't you just use rproc->firmware?
> 
>  The "firmware" in "rproc->firmware" is "const char *firmware;"
> * @firmware: name of firmware file to be loaded
> 
> But "const struct firmware *fw" is the result after request_firmware()
> ret = request_firmware(&firmware_p, rproc->firmware, dev);
> "firmware_p" is the "fw".

Ah yes, of course.

> 
> As the remoteproc_core.c has called request_firmware(), so we don't need to call
> the request_firmware() again.  so use the new "const struct firmware
> *firmware;" for
> saving the "fw".
> 
> Best regards
> Shengjiu Wang
> >
> > > > > > > +     return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > >  static const struct rproc_ops imx_dsp_rproc_ops = {
> > > > > > >       .prepare        = imx_dsp_rproc_prepare,
> > > > > > > -     .unprepare      = imx_dsp_rproc_unprepare,
> > > > > > >       .start          = imx_dsp_rproc_start,
> > > > > > >       .stop           = imx_dsp_rproc_stop,
> > > > > > >       .kick           = imx_dsp_rproc_kick,
> > > > > > > -     .load           = imx_dsp_rproc_elf_load_segments,
> > > > > > > +     .load           = imx_dsp_rproc_load,
> > > > > > >       .parse_fw       = imx_dsp_rproc_parse_fw,
> > > > > > >       .handle_rsc     = imx_dsp_rproc_handle_rsc,
> > > > > > >       .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > >
> > > > > >

