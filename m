Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8152CC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjzsf2levIjNEqe5bEQKkMoPkf+yNNdouDikD7reK/E=; b=NoMp2cYqMycp3b9cZjpb9Twm2c
	iMRTKBQO0XxqJGtcyivajvK0j0HWISY9o5VbWzQdqMG1dehtYG6f5K9nyntz5fFAF2YcUwDZY2L09
	t7IjUAiBKHB52UcdJnrnQZ660JOmKIzLaXG9h7MWDZlHTgN8keMEw7qJ3mQn0CqfXsaDVhqkURZkA
	v5P8yfVlWUal/eBo18TQU5Qp1Ef2w2+Q6/0qDgHbI4HIUiI80v09+J6yPVrr7SHJlolhlsvzptS3X
	1yAC/iD7vxceekFY3VyzQiA7afjdCfA39jly3PTmrW4/yA1u+08Vh3P78zy/c8haJyvZHnz0orkHw
	pBOaZ2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5QA-00000008EQz-2eZk;
	Wed, 16 Jul 2025 16:55:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5Kf-00000008DlN-1NUL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:50:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso181087b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752684612; x=1753289412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hjzsf2levIjNEqe5bEQKkMoPkf+yNNdouDikD7reK/E=;
        b=p6qV1+CL/bDNJxNW3Qz7SMtvukS5z6f8BWcjtngIloUqiiRpT7eua8HK2jJTx+Tk+a
         ZuSwhX82h/bxnrC8cNoTj3fy9bocI9ZpGg57b17fYxJAgFIgfLJMdtVg9EgGuWbCMW+H
         7OZ3skMPN/1ie8WFoPy3iMkhinEhumcUfWAlCQ+LZYU7mZWgY8g7+JuOEvZbzaj/iaSB
         nL/tiQzp4izwY7gGZ0v7eEUR/m05EqEi7JINXW0sJ78rjTxlM5wg3yYc6KzX7o6NHjRH
         o50+l+b4m+9gdChWmsDg0+MZKd6Jsyfp9AJJkc2+2xX2nHQHZW0umvflMrZUniyK020m
         batQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752684612; x=1753289412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hjzsf2levIjNEqe5bEQKkMoPkf+yNNdouDikD7reK/E=;
        b=mAeE5LlccdmZ+Is7IGQ3vM3daWi50OAlGESvTveKmsOgGy1h2FGqVmD7v2BhUKLcoH
         j2TYkIAww1IlhEX5iczrXfIJYINY9IDbkisemgCROYQa+BUKT/WPcOfCh0tvGFSP67kW
         U7OsPIaVBrFhgBJ96Io+/Vv0/DT4SaVWrgMJ4a3w+zw5RNgPf26c+02Tgs54EXz0W8tC
         S6KfnM1TBJX/N3blTvzHf2GKdnfqCNj+AwVDTrsqCZlUxH7XxyKMYDZqsRdP2LIQE2P6
         o1OIKz222+WZ/i5NkZeSEC/oVMMBhJyxed7QQgsBqPB+Yqhrhj6yZ0vMuEgUI5qN0aEk
         OHUg==
X-Forwarded-Encrypted: i=1; AJvYcCVU1oKKiHwRJPUfhZfzPAjiPSqXjba3Gx2zajBMEeRLY+L5dAye8tmHTej0qVVZ+HAyxiLV55YLzTWGbadf73nh@lists.infradead.org
X-Gm-Message-State: AOJu0YxAFzMXtFlJnQm1YZOkyvTI2Fp6bsQN2vQJmyuJ/HDYLKh26si8
	WrkfSrqMqJUPLpSvjggwAOKQ1tC4EG2cYa74LyAPewVoSIbOFlfHOyCCRZfUYYgPWfk=
X-Gm-Gg: ASbGnctrLzoklH84mJuLyTTAR3/6Yulz0l4UBvsEmlM6Wdf/A2szRlFBqv39EiE4Til
	4SCvY4GfPpcbp1hh9FLs9lU2eQ56Q9e5fvkBC3EtBcTzQJYpMdQ46DlGtRaxlNQf+RL3kzVmqRI
	X5qJnD4Vo07nB/3lUAPgrdb+vf0ppp8YFZOC5qRfCQQU6sEt+Q+1IkKXdriq2c7EJwajpnGtx4n
	cjmrn3hhYyEYgErAycCTFBXfyln8ARR+EoQU/SpWC2MEH6rMYzJX7h64ulhQYcS0DMISFtcLSZV
	F165Rg8TOlvipDxwFHf1g1Ydlz9+tCHyF3hMg9+J9qbXIfpa6EZ6N2dHaPIYh7zqPgLvSV6Ynt/
	n1Fqiq4wFYzHdGkvJkZlVrJZ2mQ==
X-Google-Smtp-Source: AGHT+IG0arZ0Y/HD/4QZM2Mtf9Bhh1MrJkEkPzLO727PMtNgzATpZ/biRDg0ZgLsatdiFJTVZd4WDA==
X-Received: by 2002:a05:6a20:2590:b0:220:2da8:325c with SMTP id adf61e73a8af0-2380e08ee88mr4831146637.0.1752684611666;
        Wed, 16 Jul 2025 09:50:11 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d5f3:b898:53e4:52db])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe57c48asm14184484a12.25.2025.07.16.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 09:50:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:50:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aHfYQFvkJcdfq9K_@p14s>
References: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716132552.bra37ucw4fcjwril@hiagonb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_095013_380005_F3FD4D9C 
X-CRM114-Status: GOOD (  56.80  )
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

On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> Hi Mathieu, Ulf,
> 
> On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > When the Cortex-M remote core is started and already running before
> > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > bootaux), the current driver is unable to attach to it. This is because
> > > the driver only checks for remote cores running in different SCFW
> > > partitions. However in this case, the M-core is in the same partition as
> > > Linux and is already powered up and running by the bootloader.
> > > 
> > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > M-core's power domains are already on. If all power domain devices are
> > > on, the driver assumes the M-core is running and proceed to attach to
> > > it.
> > > 
> > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > consumer of the power domain provider without changing its current
> > > state.
> > > 
> > > During probe, also enable and sync the device runtime PM to make sure
> > > the power domains are correctly managed when the core is controlled by
> > > the kernel.
> > > 
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v6 -> v7:
> > >  - Added Peng reviewed-by.
> > > v5 -> v6:
> > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > >    by. Comment on imx-rproc.c improved.
> > > v4 -> v5:
> > >  - pm_runtime_get_sync() removed in favor of
> > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > >    this function.
> > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > >    function.
> > > v3 -> v4:
> > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > >    suggested by Ulf. This will now get the power status of the two
> > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > >    not. In order to do that, pm_runtime_enable() and
> > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > v2 -> v3:
> > >  - Unchanged.
> > > v1 -> v2:
> > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > >    suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..24597b60c5b0 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/reboot.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/remoteproc.h>
> > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  {
> > >  	struct device *dev = priv->dev;
> > > -	int ret;
> > > -	struct dev_pm_domain_attach_data pd_data = {
> > > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > > -	};
> > > +	int ret, i;
> > > +	bool detached = true;
> > >  
> > >  	/*
> > >  	 * If there is only one power-domain entry, the platform driver framework
> > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  	if (dev->pm_domain)
> > >  		return 0;
> > >  
> > > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > +	/*
> > > +	 * If all the power domain devices are already turned on, the remote
> > > +	 * core is already powered up and running when the kernel booted (e.g.,
> > > +	 * started by U-Boot's bootaux command). In this case attach to it.
> > > +	 */
> > > +	for (i = 0; i < ret; i++) {
> > > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > +			detached = false;
> > > +			break;
> > > +		}
> > > +	}
> > 
> > I was doing one final review of this work when I noticed the return code for
> > dev_pm_domain_attach_list() is never checked for error.
> 
> As Ulf pointed out, the 'return' a few lines below will return the
> negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> 
> Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> rproc->state will still be set as RPROC_DETACHED because we are starting
> 'detached' as true, but I am not seeing this as an issue because as
> mentioned above the probe will fail anyway. Please let me know if you
> see this as an issue.

Two things to consider here: 

(1) It is only a matter of time before someone with a cleaver coccinelle script
sends me a patch that adds the missing error check.

(2) I think that @rproc->state being changed on error conditions is a bug
waiting to happen.  This kind of implicit error handling is difficult to
maintain and even more difficult for people to make enhancements to the driver.

Adding a simple error check will make sure neither of the above will happen.  It
is a simple change and we are at rc6 - this work can still go in the merge
window.

> 
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > +	if (detached)
> > > +		priv->rproc->state = RPROC_DETACHED;
> > > +
> > >  	return ret < 0 ? ret : 0;
> > >  }
> > >  
> > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > >  		}
> > >  	}
> > >  
> > > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > > +		pm_runtime_enable(dev);
> > > +		ret = pm_runtime_resume_and_get(dev);
> > > +		if (ret) {
> > > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > +			goto err_put_clk;
> > > +		}
> > > +	}
> > > +
> > >  	ret = rproc_add(rproc);
> > >  	if (ret) {
> > >  		dev_err(dev, "rproc_add failed\n");
> > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > >  	struct rproc *rproc = platform_get_drvdata(pdev);
> > >  	struct imx_rproc *priv = rproc->priv;
> > >  
> > > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > +		pm_runtime_disable(priv->dev);
> > > +		pm_runtime_put(priv->dev);
> > > +	}
> > >  	clk_disable_unprepare(priv->clk);
> > >  	rproc_del(rproc);
> > >  	imx_rproc_put_scu(rproc);
> > > -- 
> > > 2.39.5
> > > 
> 
> On Tue, Jul 15, 2025 at 06:03:44PM +0200, Ulf Hansson wrote:
> > On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > >
> > > > When the Cortex-M remote core is started and already running before
> > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > bootaux), the current driver is unable to attach to it. This is because
> > > > the driver only checks for remote cores running in different SCFW
> > > > partitions. However in this case, the M-core is in the same partition as
> > > > Linux and is already powered up and running by the bootloader.
> > > >
> > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > M-core's power domains are already on. If all power domain devices are
> > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > it.
> > > >
> > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > consumer of the power domain provider without changing its current
> > > > state.
> > > >
> > > > During probe, also enable and sync the device runtime PM to make sure
> > > > the power domains are correctly managed when the core is controlled by
> > > > the kernel.
> > > >
> > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > v6 -> v7:
> > > >  - Added Peng reviewed-by.
> > > > v5 -> v6:
> > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > >    by. Comment on imx-rproc.c improved.
> > > > v4 -> v5:
> > > >  - pm_runtime_get_sync() removed in favor of
> > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > >    this function.
> > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > >    function.
> > > > v3 -> v4:
> > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > >    suggested by Ulf. This will now get the power status of the two
> > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > >    not. In order to do that, pm_runtime_enable() and
> > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > v2 -> v3:
> > > >  - Unchanged.
> > > > v1 -> v2:
> > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > >    suggested.
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 627e57a88db2..24597b60c5b0 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -18,6 +18,7 @@
> > > >  #include <linux/of_reserved_mem.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_domain.h>
> > > > +#include <linux/pm_runtime.h>
> > > >  #include <linux/reboot.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/remoteproc.h>
> > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >  {
> > > >       struct device *dev = priv->dev;
> > > > -     int ret;
> > > > -     struct dev_pm_domain_attach_data pd_data = {
> > > > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > -     };
> > > > +     int ret, i;
> > > > +     bool detached = true;
> > > >
> > > >       /*
> > > >        * If there is only one power-domain entry, the platform driver framework
> > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >       if (dev->pm_domain)
> > > >               return 0;
> > > >
> > > > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > +     /*
> > > > +      * If all the power domain devices are already turned on, the remote
> > > > +      * core is already powered up and running when the kernel booted (e.g.,
> > > > +      * started by U-Boot's bootaux command). In this case attach to it.
> > > > +      */
> > > > +     for (i = 0; i < ret; i++) {
> > > > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > +                     detached = false;
> > > > +                     break;
> > > > +             }
> > > > +     }
> > >
> > > I was doing one final review of this work when I noticed the return code for
> > > dev_pm_domain_attach_list() is never checked for error.
> > 
> > The for loop covers the error condition correctly, I think. It's only
> > when ret >=1 when the loop should be started - and ret is propagated
> > to the caller a few lines below.
> > 
> > >
> > > Thanks,
> > > Mathieu
> > >
> > 
> > Kind regards
> > Uffe
> > 
> > > > +
> > > > +     if (detached)
> > > > +             priv->rproc->state = RPROC_DETACHED;
> > > > +
> > > >       return ret < 0 ? ret : 0;
> > > >  }
> > > >
> > > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > > >               }
> > > >       }
> > > >
> > > > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > > > +             pm_runtime_enable(dev);
> > > > +             ret = pm_runtime_resume_and_get(dev);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > > +                     goto err_put_clk;
> > > > +             }
> > > > +     }
> > > > +
> > > >       ret = rproc_add(rproc);
> > > >       if (ret) {
> > > >               dev_err(dev, "rproc_add failed\n");
> > > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > > >       struct rproc *rproc = platform_get_drvdata(pdev);
> > > >       struct imx_rproc *priv = rproc->priv;
> > > >
> > > > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > > +             pm_runtime_disable(priv->dev);
> > > > +             pm_runtime_put(priv->dev);
> > > > +     }
> > > >       clk_disable_unprepare(priv->clk);
> > > >       rproc_del(rproc);
> > > >       imx_rproc_put_scu(rproc);
> > > > --
> > > > 2.39.5
> > > >
> 
> Best Regards,
> 
> Hiago.

