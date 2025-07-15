Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F125C83F36
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33yHY0U8ND4bNjhKpzusNE0usrblN+UAP92ijnAvwrA=; b=us844AxkCMPzLfrjkFdfQAtqaJ
	Yk7fR/oKvRDs360m0sJV7QDqRWUUtZveWOxT7pojAzGbIFZiGOng0/10hQIaG5O4KgrlvsdIK/Uvl
	zQBSSwC2xZvVtcoCXWiHel4DXwo14dWj8FiWJcX06/YMg5/AVy5IJwrzOWJU6h4n4avTjLAani9q6
	An2PEz3dRLJviotsd6FIRry7vUHN8PiTRTaQTMX+byac7Z1RBEbBy55erDHffNpfYWBWlpyi7vW2J
	nWdxfE6QS3p8qtY+KAbLiTnocuStwpaCCxBav24+DGkipiaoXP5rTozlSL/TsbAMppaUO+GG2t8Vi
	8rXoyCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl73-00000005y5x-2lvG;
	Tue, 15 Jul 2025 19:14:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubheD-00000005bU8-1IqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 15:32:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2353a2bc210so56731995ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 08:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752593568; x=1753198368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=33yHY0U8ND4bNjhKpzusNE0usrblN+UAP92ijnAvwrA=;
        b=CiNj6q4FK+tXptFcHGy8bqllI954IjvsG309X2f3OPcsWfUfDPbfUKVT7fMV4ujyHd
         BX2pYCMYq0s4Nm2KDs0PtXmX4FwHxaM5eD+x73OZtra34zlv1JFnt0BPSt/XFwju82vl
         poU8YEEthc/EgN7dRBLv8RWgTIMhTeawXn3yYHH5elCv8+64VbhUBblk/1rIcncaLjNz
         OPkvy8jAUD+eTc26v0psujzRcqLiWAdAgXS99NMA5WmWiD6BNo79+ZlDtia/nRqe0Buq
         NnO9kngpx/byeMcBmJ7vzaBBkcNW1xFC0Yw/VLy0BPr7tjDvEACZYFKPXPYYNamv05s/
         cT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752593568; x=1753198368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33yHY0U8ND4bNjhKpzusNE0usrblN+UAP92ijnAvwrA=;
        b=b1aQYISTOOcZ5K/gkR4xOc+rer/Bz2srMTpemn76H/GbYeegQVTijvlMYYrOuZhhrS
         yt2+BLYtk/6dOk2ejtamcDGYcXj1VzgHxjFCFHFokMW3KWYRtBIYSw5lrffGh2uCGli5
         Z7VuvudKFxNzcx34nqIrEkRQKurohzF6GZyX/9L45HCkApba7seWh8QP5pezdMQmSu5C
         t+4J6AP8lIuZnfPGgGffnWiF4rPWYPPW/VlKPWZh9GhKOe9L1k7AgwlqUrGFI0d6+Ffs
         +urHKHYjmH0RKVKfGUXaTCsC1UnIvQK/T4dHVbvjvOxx9M6dqHInFxLFll6rloqsvpnU
         x/LA==
X-Forwarded-Encrypted: i=1; AJvYcCX4fZO4BT6/saxtFlCdqsrAjCcNBKPwLBtZ4GNOq9MH1u+0RKwedA0TSGL40uRKztbKL9oLvuxYZjc+Y4ePwuCX@lists.infradead.org
X-Gm-Message-State: AOJu0YwFGLt5xaWC/5uPt1yOTHo4QYKIA+GpfYOATPpCd8mTme8BFQ0Q
	7jL1P7o20BusLKUgfbK/K4OnIz2O2xSXw4sTg/RyOlfAbmgzkgWkSHnCkgXMFqeDIjBD3Ygjobn
	idNgChqU=
X-Gm-Gg: ASbGncs2U/DNgLgvkjxO4HpVHm1nJ1QwZufuGFvcJarNsxeSyFcNEBkY5a8RooaeW5z
	ncUdb3WFE6kXRzUco5U21iNPJ6pVNtVbtb6Lv70XtcXoFZtvoJUFyc4bg9DqKRhVZKMkGs7ohyq
	0QtD+Txx8eAhn/KTRDrp5C+Y3+jqnhUKtD1osLa2X2Mu6nM06X3jZZk7ytnl95QHSPS3Mb9C0/Y
	Zk36us3zXdcLxYkHDKEJ2aYhzN5jwErWoUS/THoq7U+TsbJzFZLnB5o7r8TdgZoNyVznOM3oEN4
	uDE6EjI1AtQtBwSfxUgEYqf0EmkQLwu+P7Ap7Mpu4rViaqn1bcUPfnhh2chLrKB1Dea4+AMEWyZ
	27Ogm2svpNqZEhuhvDU+g2ef0
X-Google-Smtp-Source: AGHT+IHkJUK5ENBeylJNtS4qtHpCbavXcR17LDaafdWZuI5joLSCqs8sTEoGsBj18ccUt3gtd70HMA==
X-Received: by 2002:a17:903:2c8:b0:237:d25b:8f07 with SMTP id d9443c01a7336-23dee0d7c54mr275182995ad.44.1752593567667;
        Tue, 15 Jul 2025 08:32:47 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3f17:6d67:cf82:708])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4323cd5sm110969645ad.126.2025.07.15.08.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 08:32:47 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:32:44 -0600
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
Message-ID: <aHZ0nK4ZZShAr6Xz@p14s>
References: <20250629172512.14857-1-hiagofranco@gmail.com>
 <20250629172512.14857-4-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629172512.14857-4-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_083249_359911_F6952C1A 
X-CRM114-Status: GOOD (  41.43  )
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

On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the Cortex-M remote core is started and already running before
> Linux boots (typically by the Cortex-A bootloader using a command like
> bootaux), the current driver is unable to attach to it. This is because
> the driver only checks for remote cores running in different SCFW
> partitions. However in this case, the M-core is in the same partition as
> Linux and is already powered up and running by the bootloader.
> 
> This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> M-core's power domains are already on. If all power domain devices are
> on, the driver assumes the M-core is running and proceed to attach to
> it.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), allowing the platform device become a
> consumer of the power domain provider without changing its current
> state.
> 
> During probe, also enable and sync the device runtime PM to make sure
> the power domains are correctly managed when the core is controlled by
> the kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v6 -> v7:
>  - Added Peng reviewed-by.
> v5 -> v6:
>  - Commit description improved, as suggested. Added Ulf Hansson reviewed
>    by. Comment on imx-rproc.c improved.
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..24597b60c5b0 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>  	struct device *dev = priv->dev;
> -	int ret;
> -	struct dev_pm_domain_attach_data pd_data = {
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> -	};
> +	int ret, i;
> +	bool detached = true;
>  
>  	/*
>  	 * If there is only one power-domain entry, the platform driver framework
> @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +	/*
> +	 * If all the power domain devices are already turned on, the remote
> +	 * core is already powered up and running when the kernel booted (e.g.,
> +	 * started by U-Boot's bootaux command). In this case attach to it.
> +	 */
> +	for (i = 0; i < ret; i++) {
> +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +			detached = false;
> +			break;
> +		}
> +	}

I was doing one final review of this work when I noticed the return code for
dev_pm_domain_attach_list() is never checked for error. 

Thanks,
Mathieu

> +
> +	if (detached)
> +		priv->rproc->state = RPROC_DETACHED;
> +
>  	return ret < 0 ? ret : 0;
>  }
>  
> @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_enable(dev);
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret) {
> +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_disable(priv->dev);
> +		pm_runtime_put(priv->dev);
> +	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> -- 
> 2.39.5
> 

