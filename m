Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C936C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 17:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYaF4rQQYYQxNckUKR5qLC2a/dsvjDTTBdvWeL+AwCI=; b=DeA2RQQqKUbCxgxnObTXt3nSHY
	J9dlY3rjL6Ac5KDzkyPUykRHUHL+e5rdbA8TnlsJqcCtB8+Vdcmkdil/TImO7T8IqhCcjxwFT7L6Y
	IbYnV2FBxk+NQ5As6KvQ8QIGa07tujez2KLdf0ICBfMqiyfJZV9PLbdzA0/bOr1o9uO2smOQMshvH
	JCPv7ySvnlc1qjR6gBeBDHOjVlX2iTjpBy31vh2x0+22Z/+rjFzJPLVw3etlyYJ5o2v3uaxomBhFa
	/TGUGm8g6/SeChADLPv5+F3+hqfxJHQBVV+WHeWyeCVuViY9+n5LoaK/i+8H/7U2XkvAlh3baPusn
	7ZUxAOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5t8-00000008I86-0y87;
	Wed, 16 Jul 2025 17:25:50 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5qe-00000008HyF-1X1x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 17:23:17 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2ea34731c5dso124558fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752686595; x=1753291395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYaF4rQQYYQxNckUKR5qLC2a/dsvjDTTBdvWeL+AwCI=;
        b=cuf1DGQdpYLsrXME/ubDgUHES/76xipLDf7g+FDubDyEaRyh8lJ6Jww/uWUq+x+jYF
         KeIjCvVtLG6WwwHMx6I+G4P74+0WVM5xUFkms+VqyAqYcMoEC+keahVXxd0uXGJzNtVr
         VhHH/I/nLh4e/FjEiMuWZgzpm1JHxNNLAxknUgAz/OkSySOxvts1jRHG1k/vv1aOKY9x
         wHNZqUR/QNxgJnYB2vQoiachVSqKrMYzR5ttASArmgWvs/ZwQ5n3T6OcFaASuwonvLvB
         4ggtK5b2sMpCzPtOlwk8N37Mdx2fRMxUT7hfPaC8zztJlYX19P8lsCUko2ZIdNEhGpQy
         Nzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686595; x=1753291395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYaF4rQQYYQxNckUKR5qLC2a/dsvjDTTBdvWeL+AwCI=;
        b=P2lfTTwuEZCOw+mnxtUhGc/V6dBK01fTzjG6RD+SDVBJ2FKU3bLZA29hLWeDy1wjSQ
         xW2YprbesmZvkf6+0ArfyZC2X37NU82jl/3XOBzRnDLKjenwuaH+pai5Svvwv0KqDbyO
         aBgF5w23icnOQq76hSN0BgUsuW1+CJsADsyiK0YfkyzZVbUJpHdN8egkNgvC5s7e+ttv
         miM3Od3zjqJuiGjCBHzmzQ5KO/Ylc99cSLyjv4W2U4f51BtnBwncq7Irfl1yigiqXhs2
         mDJh0d9nJY90NYlKy9zIIM3qWZScwXg7DnO+EY5p70U5mmUwnL+F7JX2pM7dZ2hVE6rs
         ohSw==
X-Forwarded-Encrypted: i=1; AJvYcCWUxdynoyW2lGWeWe38O0KsKuhZZ88FqBhbHf2eGMp/iyEu1Q+om58S4+oDQYTHp+B5txkEi8E7yquGed3aoWLs@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd/3VQSLT0w9wuhflWkKOKUTspK985HRwgHq//jb5Mkpgz4f//
	RJ17qyoptpj1aPngaLCaCvdJxbRlIFeNOG43WmU3yX2/mQm8shkMsMkW
X-Gm-Gg: ASbGncvlhtZluF/ooy379G6oGkARN1bIqR3HLyaCHuDIrcRtCAlYaBHbRI8KT95GeCr
	Fvz0WgLFsdMzalZnx6ZZxGFaFa+ZSw0frBhEXEb/J9geKtRbYk61K6WaIDd0ldkF5r0DmXPjDsC
	Ka//7aAMQt8hTqecwjWcdTCGmMKMmiVvU26msHyMJfiovLFlBKF7umfabXJVFH3ycAzFTFnBe/9
	9rL032iQ/vrFLyMStdKo6EIP5WdGYiF4IVPnjlWhzcz01Kj4NRp5Z3aiue5owadbqiRbr73xREk
	/5r29ooZNawW1Y3rqlmjvGx+49CmUpPMtzsb3vxBOIE0xxH/aZ7M5ssV3yA2XACmtnRtwUyAdRM
	5AwGvRDVr6GMqyQQMk/M=
X-Google-Smtp-Source: AGHT+IG9SWP+MHsh8szcrl8wNTXVHhSFgBCOXHKMiWzbcl8aU95a6gY+Zlw34P4nvAj5tKAF9dH35A==
X-Received: by 2002:a05:6870:5b9e:b0:2e9:9e9:d94b with SMTP id 586e51a60fabf-2ffb257d356mr2547792fac.39.1752686595050;
        Wed, 16 Jul 2025 10:23:15 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff8dea112bsm1724708fac.43.2025.07.16.10.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:23:14 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:23:08 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
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
Message-ID: <20250716172308.lzh3aak24d6mt4cs@hiagonb>
References: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb>
 <aHfYQFvkJcdfq9K_@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHfYQFvkJcdfq9K_@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_102316_413718_5935ABBB 
X-CRM114-Status: GOOD (  60.02  )
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

On Wed, Jul 16, 2025 at 10:50:08AM -0600, Mathieu Poirier wrote:
> On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> > Hi Mathieu, Ulf,
> > 
> > On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
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
> > > >  	struct device *dev = priv->dev;
> > > > -	int ret;
> > > > -	struct dev_pm_domain_attach_data pd_data = {
> > > > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > -	};
> > > > +	int ret, i;
> > > > +	bool detached = true;
> > > >  
> > > >  	/*
> > > >  	 * If there is only one power-domain entry, the platform driver framework
> > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >  	if (dev->pm_domain)
> > > >  		return 0;
> > > >  
> > > > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > +	/*
> > > > +	 * If all the power domain devices are already turned on, the remote
> > > > +	 * core is already powered up and running when the kernel booted (e.g.,
> > > > +	 * started by U-Boot's bootaux command). In this case attach to it.
> > > > +	 */
> > > > +	for (i = 0; i < ret; i++) {
> > > > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > +			detached = false;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > 
> > > I was doing one final review of this work when I noticed the return code for
> > > dev_pm_domain_attach_list() is never checked for error.
> > 
> > As Ulf pointed out, the 'return' a few lines below will return the
> > negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> > will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> > 
> > Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> > rproc->state will still be set as RPROC_DETACHED because we are starting
> > 'detached' as true, but I am not seeing this as an issue because as
> > mentioned above the probe will fail anyway. Please let me know if you
> > see this as an issue.
> 
> Two things to consider here: 
> 
> (1) It is only a matter of time before someone with a cleaver coccinelle script
> sends me a patch that adds the missing error check.
> 
> (2) I think that @rproc->state being changed on error conditions is a bug
> waiting to happen.  This kind of implicit error handling is difficult to
> maintain and even more difficult for people to make enhancements to the driver.
> 
> Adding a simple error check will make sure neither of the above will happen.  It
> is a simple change and we are at rc6 - this work can still go in the merge
> window.

Sure, I can submit a new revision with this error check. Sorry I did not
see this before, I only had a close look at this '->state' now that you
asked on the previous email.

Thanks,

Hiago.

> 
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > > > +
> > > > +	if (detached)
> > > > +		priv->rproc->state = RPROC_DETACHED;
> > > > +
> > > >  	return ret < 0 ? ret : 0;
> > > >  }
> > > >  
> > > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > > >  		}
> > > >  	}
> > > >  
> > > > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > > > +		pm_runtime_enable(dev);
> > > > +		ret = pm_runtime_resume_and_get(dev);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > > +			goto err_put_clk;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret = rproc_add(rproc);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "rproc_add failed\n");
> > > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > > >  	struct rproc *rproc = platform_get_drvdata(pdev);
> > > >  	struct imx_rproc *priv = rproc->priv;
> > > >  
> > > > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > > +		pm_runtime_disable(priv->dev);
> > > > +		pm_runtime_put(priv->dev);
> > > > +	}
> > > >  	clk_disable_unprepare(priv->clk);
> > > >  	rproc_del(rproc);
> > > >  	imx_rproc_put_scu(rproc);
> > > > -- 
> > > > 2.39.5
> > > > 
> > 
> > On Tue, Jul 15, 2025 at 06:03:44PM +0200, Ulf Hansson wrote:
> > > On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the Cortex-M remote core is started and already running before
> > > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > > bootaux), the current driver is unable to attach to it. This is because
> > > > > the driver only checks for remote cores running in different SCFW
> > > > > partitions. However in this case, the M-core is in the same partition as
> > > > > Linux and is already powered up and running by the bootloader.
> > > > >
> > > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > > M-core's power domains are already on. If all power domain devices are
> > > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > > it.
> > > > >
> > > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > > consumer of the power domain provider without changing its current
> > > > > state.
> > > > >
> > > > > During probe, also enable and sync the device runtime PM to make sure
> > > > > the power domains are correctly managed when the core is controlled by
> > > > > the kernel.
> > > > >
> > > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > ---
> > > > > v6 -> v7:
> > > > >  - Added Peng reviewed-by.
> > > > > v5 -> v6:
> > > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > > >    by. Comment on imx-rproc.c improved.
> > > > > v4 -> v5:
> > > > >  - pm_runtime_get_sync() removed in favor of
> > > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > > >    this function.
> > > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > > >    function.
> > > > > v3 -> v4:
> > > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > > >    suggested by Ulf. This will now get the power status of the two
> > > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > > >    not. In order to do that, pm_runtime_enable() and
> > > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > > v2 -> v3:
> > > > >  - Unchanged.
> > > > > v1 -> v2:
> > > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > >    suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..24597b60c5b0 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include <linux/of_reserved_mem.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/pm_domain.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > >  #include <linux/reboot.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/remoteproc.h>
> > > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >  {
> > > > >       struct device *dev = priv->dev;
> > > > > -     int ret;
> > > > > -     struct dev_pm_domain_attach_data pd_data = {
> > > > > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > > -     };
> > > > > +     int ret, i;
> > > > > +     bool detached = true;
> > > > >
> > > > >       /*
> > > > >        * If there is only one power-domain entry, the platform driver framework
> > > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >       if (dev->pm_domain)
> > > > >               return 0;
> > > > >
> > > > > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > > +     /*
> > > > > +      * If all the power domain devices are already turned on, the remote
> > > > > +      * core is already powered up and running when the kernel booted (e.g.,
> > > > > +      * started by U-Boot's bootaux command). In this case attach to it.
> > > > > +      */
> > > > > +     for (i = 0; i < ret; i++) {
> > > > > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > > +                     detached = false;
> > > > > +                     break;
> > > > > +             }
> > > > > +     }
> > > >
> > > > I was doing one final review of this work when I noticed the return code for
> > > > dev_pm_domain_attach_list() is never checked for error.
> > > 
> > > The for loop covers the error condition correctly, I think. It's only
> > > when ret >=1 when the loop should be started - and ret is propagated
> > > to the caller a few lines below.
> > > 
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > 
> > > Kind regards
> > > Uffe
> > > 
> > > > > +
> > > > > +     if (detached)
> > > > > +             priv->rproc->state = RPROC_DETACHED;
> > > > > +
> > > > >       return ret < 0 ? ret : 0;
> > > > >  }
> > > > >
> > > > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > > > >               }
> > > > >       }
> > > > >
> > > > > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > > > > +             pm_runtime_enable(dev);
> > > > > +             ret = pm_runtime_resume_and_get(dev);
> > > > > +             if (ret) {
> > > > > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > > > +                     goto err_put_clk;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > >       ret = rproc_add(rproc);
> > > > >       if (ret) {
> > > > >               dev_err(dev, "rproc_add failed\n");
> > > > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > > > >       struct rproc *rproc = platform_get_drvdata(pdev);
> > > > >       struct imx_rproc *priv = rproc->priv;
> > > > >
> > > > > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > > > +             pm_runtime_disable(priv->dev);
> > > > > +             pm_runtime_put(priv->dev);
> > > > > +     }
> > > > >       clk_disable_unprepare(priv->clk);
> > > > >       rproc_del(rproc);
> > > > >       imx_rproc_put_scu(rproc);
> > > > > --
> > > > > 2.39.5
> > > > >
> > 
> > Best Regards,
> > 
> > Hiago.

