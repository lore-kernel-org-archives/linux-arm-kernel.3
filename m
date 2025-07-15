Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4BFC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9+Gf6mbowZuZalonETpZ6jadnzxH+LjmxECpwT8Dno=; b=dv6SG+3m62KSvZq9h/qIu369U4
	u48m5vL3KKZo9jpLvq4S9K3cWCY9N2pFQGihIHYISUUyb48wyKA6IlgawTw7OV1MKB36UZMnDG+//
	h6Tj28UgXyY5vVbTiRQC2brUfd9dVQy8x0kU5D8onwWxCHKN2uGZKBgMENvoKWziKdRfPsI7MVTOQ
	nsZ3gtH0c1tKnY0+yJB78sLuLWwXyprxsVZUlev1Hg8hb5e8jauDehID255k/m7TyjFMRW+RwW1HP
	fNkyB9C9eqrYxeCOQEVCLJk5Yp3PI4TmSvRro5e/KCnq9ECabjFF016289d73gETGQ1YigjaNmbjL
	dWOk09GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl7l-00000005zLH-1txN;
	Tue, 15 Jul 2025 19:15:33 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubi8j-00000005h2R-2UOp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:04:23 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-711a3dda147so60803397b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752595460; x=1753200260; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G9+Gf6mbowZuZalonETpZ6jadnzxH+LjmxECpwT8Dno=;
        b=IqJ1ZUUekfegoWpUn2hmvNkx8PqoxEhWUmFi1/mLtGgDwJINb+MgxHOAmKXHC1WvNV
         0y508bfwtpIIBE5yorpy74z6CgFr1ZwdS4vcRYS+Ks78m/8/gsQ1GaFUMywldQWQX7Be
         ryZQfGQV46jSmTwCX3ELTPEO6H2tPQmNR2NtxmDy3RiPaibfykcPCNSRYu9mBRoWggLi
         NwohoiloR1CtRbTWJPoQ3YM6VpartWpewrlpgWeFkAjCvLJPpTtqJ2/w+5Qc2/ihiwR4
         +fFDu5n/baIcirRRTbkWfMu73vdGbRwY9/mnhwyXmzvhZbnA3UULkSGWWx3zaH2i68EQ
         04qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595460; x=1753200260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9+Gf6mbowZuZalonETpZ6jadnzxH+LjmxECpwT8Dno=;
        b=PluZNVw7/yp2sswzVKCeChobiMXIScc/2yFhXnngMGoLGOqAVXcWYfQyOqraWT6lkn
         h3vfx9qqDSYlRzQ26As6+F8/quJhpYbVhqVIqGVc6PeoBaeXX8089fQuH9Ds+GydFkLw
         G803bNa033lMjNKDw2OByGf2+Owpnu+0Ze6lCivI/XF4dZPbUHnedRJQ4PoK9SV16B4+
         AanBU7v6FA6dE0XAkxJ2qNxWMkoYzUeK/U2Tiwbm+jtM46j+mKIzZYNc7/QwZoTBps7a
         58mdf1f+kkHsuDveQ6/HKP8cF6ajJAXdblfVW+W9rH501coExyDtJqx6+fa/X2ww5Tcg
         owsA==
X-Forwarded-Encrypted: i=1; AJvYcCUj+DBsHp1C5AmWe6wOfw8hOGbpYpt8OEnMn4UWSZcsZa3KeieMZov6Njxp44+PfPTaRW8G91vAeyMWIDx3CrVV@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCTQovFT09wV99H5H9VEZ3EQ/1KLrWRq0usVD9lAfPySFabn9
	FzJa8Yk1ko7UYnTBzgdM9K6zXq8sAHs6/Nwu+gBoHQy0Vdlo5JUJiFFZuuCoBGJ/kiCOAArG24q
	A5nrLLUiUwXg0phlw6j3/Bidj9ZENQMBjTMcdKI7ygw==
X-Gm-Gg: ASbGncvAG/rDsKnvEE5QdaL4q5hpb5+hzeEf0aA2cSc2Lz5W9zBeX29jT7hHiD8///d
	pkaNNzeXAi5jfi9vxkfycUG06pj3HVBOwZC8ZT1CuVJJ0phPLasqXNGv6BLp5obPdMVw6OxXnWm
	8yFUzvjXAy9EpRJx+TXrnyTmievOa811oigGiB+6CvXIsHZjoQff+ZpXdQnZvb74jBx9PnM6ynd
	TRKrlvy
X-Google-Smtp-Source: AGHT+IFBCmctpYQ4hpqmpVFpQIoEcYogmxduh959NmT/NLJBG7pellcNPOyp5tqRpcLBqr3/eauADU/Eyz78hUd2K6M=
X-Received: by 2002:a05:690c:628a:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-717d5f3d391mr277841457b3.35.1752595460223; Tue, 15 Jul 2025
 09:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250629172512.14857-1-hiagofranco@gmail.com> <20250629172512.14857-4-hiagofranco@gmail.com>
 <aHZ0nK4ZZShAr6Xz@p14s>
In-Reply-To: <aHZ0nK4ZZShAr6Xz@p14s>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 18:03:44 +0200
X-Gm-Features: Ac12FXwY6h_tcywiVOBNLJxHQ4w9f0nkEbd-hKtDCoysqSLCUbGs7tyoy-l-SHk
Message-ID: <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_090421_655269_166D98FD 
X-CRM114-Status: GOOD (  46.17  )
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

On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > When the Cortex-M remote core is started and already running before
> > Linux boots (typically by the Cortex-A bootloader using a command like
> > bootaux), the current driver is unable to attach to it. This is because
> > the driver only checks for remote cores running in different SCFW
> > partitions. However in this case, the M-core is in the same partition as
> > Linux and is already powered up and running by the bootloader.
> >
> > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > M-core's power domains are already on. If all power domain devices are
> > on, the driver assumes the M-core is running and proceed to attach to
> > it.
> >
> > To accomplish this, we need to avoid passing any attach_data or flags to
> > dev_pm_domain_attach_list(), allowing the platform device become a
> > consumer of the power domain provider without changing its current
> > state.
> >
> > During probe, also enable and sync the device runtime PM to make sure
> > the power domains are correctly managed when the core is controlled by
> > the kernel.
> >
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v6 -> v7:
> >  - Added Peng reviewed-by.
> > v5 -> v6:
> >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> >    by. Comment on imx-rproc.c improved.
> > v4 -> v5:
> >  - pm_runtime_get_sync() removed in favor of
> >    pm_runtime_resume_and_get(). Now it also checks the return value of
> >    this function.
> >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> >    function.
> > v3 -> v4:
> >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> >    suggested by Ulf. This will now get the power status of the two
> >    remote cores power domains to decided if imx_rpoc needs to attach or
> >    not. In order to do that, pm_runtime_enable() and
> >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > v2 -> v3:
> >  - Unchanged.
> > v1 -> v2:
> >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> >    suggested.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 627e57a88db2..24597b60c5b0 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  {
> >       struct device *dev = priv->dev;
> > -     int ret;
> > -     struct dev_pm_domain_attach_data pd_data = {
> > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > -     };
> > +     int ret, i;
> > +     bool detached = true;
> >
> >       /*
> >        * If there is only one power-domain entry, the platform driver framework
> > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >       if (dev->pm_domain)
> >               return 0;
> >
> > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +     /*
> > +      * If all the power domain devices are already turned on, the remote
> > +      * core is already powered up and running when the kernel booted (e.g.,
> > +      * started by U-Boot's bootaux command). In this case attach to it.
> > +      */
> > +     for (i = 0; i < ret; i++) {
> > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > +                     detached = false;
> > +                     break;
> > +             }
> > +     }
>
> I was doing one final review of this work when I noticed the return code for
> dev_pm_domain_attach_list() is never checked for error.

The for loop covers the error condition correctly, I think. It's only
when ret >=1 when the loop should be started - and ret is propagated
to the caller a few lines below.

>
> Thanks,
> Mathieu
>

Kind regards
Uffe

> > +
> > +     if (detached)
> > +             priv->rproc->state = RPROC_DETACHED;
> > +
> >       return ret < 0 ? ret : 0;
> >  }
> >
> > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > +             pm_runtime_enable(dev);
> > +             ret = pm_runtime_resume_and_get(dev);
> > +             if (ret) {
> > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > +                     goto err_put_clk;
> > +             }
> > +     }
> > +
> >       ret = rproc_add(rproc);
> >       if (ret) {
> >               dev_err(dev, "rproc_add failed\n");
> > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> >       struct rproc *rproc = platform_get_drvdata(pdev);
> >       struct imx_rproc *priv = rproc->priv;
> >
> > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > +             pm_runtime_disable(priv->dev);
> > +             pm_runtime_put(priv->dev);
> > +     }
> >       clk_disable_unprepare(priv->clk);
> >       rproc_del(rproc);
> >       imx_rproc_put_scu(rproc);
> > --
> > 2.39.5
> >

