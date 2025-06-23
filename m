Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03281C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=; b=nW2gMegzV9c8rprBbDH0ohgB/X
	hy4GeKuruLEUqL+5CasoH2h7jqI2DsJy6TpVx5Rddz5q3TlDt18tw1sRdvjJ0X9hNJinc+XC4+CKY
	bl2dTUthSXZKYAL6c4Tmo3mxd+PUeUv466W5piMFzLKi9XZJqiMlATK0fdMyZ/roaBG1bSyNK3+UH
	VuW6RH//JfuCPK78ZQFSm/U8fseAjQav8AZFWbI5M0a6enXuaGfpkEnPvf3ZGb3UkX5cdU4mCFcCR
	qtkWRwDcEmr1IHnKdGa2GoZfcgUsvRQpJbXwMQIAWIg0Sn4M+fyoh2QamvxpGXuvBpJ4gLsp9ruXV
	/wFFpFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTn3E-00000003owm-3ca1;
	Mon, 23 Jun 2025 19:41:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTj7H-00000003EtE-2h2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:29:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234bfe37cccso55986445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692591; x=1751297391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=;
        b=jDwmdqyupHxyiaNLGiSKri934K6IXYYZM/OnkYouqTEjBE3iyWTPGMDtM3U0DWPP3t
         32lDyY7iWM5vPYY1vs1EwZ0ao3vI/YUxHHXyQCmYDvbGmwK1sVHC6m0VGyJl2xIKDM+r
         MvGF0m+RC+1aXd3t8ZzDm5s4UIjndcesfrEj+htu7phYLGDAiaHqafCmd6ISYXm21hDh
         arka9jtg/H2lfuFKQ6kFo0WllUZmXKwQFYEb4usZh9xvh/BwKmv/DqADONK5jL5j7zio
         fKK7kWUlz+9GI75yM4LrrWis/R0D5TSo7y06tDrdgKKbj8TSNyEbXrFbgCxpDYwe35oP
         nqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692591; x=1751297391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=;
        b=X8525WJSQ0x5L+2DaH+r7XEGijtq0Y4hSL4QSeWPunsigYvoVY22vX3TrgmchanwFI
         g8OfoG2v0oCRD7xe2ijlgO+TSo1VT42pcdkXZRPQOsHVJMDxTDk0z1zD72HZPunrA8cH
         5P7YSCkkYl7OUU1UkCIZwAdYtmIc50TvwoBC3h5jgkf9V8rVi1LqS+vrziRE6wUlZOkb
         nWHlJ++LzouwkhSmCe4lKGnt4b+2UnwL1csUczfour4vwFEyUfLQtUk/Qc/iT8USSLFI
         GhYSmMrZBeWOealRp88zQCo8GTtiFp5qRPuscwqT/7QTfOqSq1IENggMprxtOj6xZk0c
         0uUw==
X-Forwarded-Encrypted: i=1; AJvYcCXxeuUeKBKed4eBdr6Eja8AvrrNQN4Kw5WWTCU//4R/09qO58W/sytmyGaxvQmri0sQSVBIu0saZkmS/bvnst95@lists.infradead.org
X-Gm-Message-State: AOJu0YzsyVNwdcpycbPOF3zab38dpM3nlBGK9afpNCJWSWDgqvrrcOw6
	yzk+zdhKXCdyg8Lz3Ks9hgjStaDwIwQS2SMGDFF83rXrb/G+OBk406AgmnXIIGfM1qU=
X-Gm-Gg: ASbGncssssqfRwfSrnQC8mdXwl2nilRG5cAyz1sz7jlnj5qsTfat9iva5oOs/b0rJpp
	VzUUvpx2LEOuWuSekN+XgEdvuZFuG1yRX+OqtOZE/7U1J/YJ7flFyPmIMscJS5KVNrmGwBQw31b
	ZQXz69epWQcMH3EFD5lDBv2kIeO6NSUdzdP0ZqmcWvyPPFzjJq18Cc94Nb0MfNWqJSvyhzjV1vO
	TSvuFYwqPONeojBasq1PCaqwm5H3fdE4ut/ucMB3tvqeHtEJl+l2SI+Zi/AaeA9Lz0hTPsy+azl
	O780c9C17xGl1rwFzRUbrdZLV5e76ugnJU+xVJqoTnQ1rRkWFh3tSSsZfakvBpWQ4jssPjIhouQ
	=
X-Google-Smtp-Source: AGHT+IE/tDEriXoZY84SIRgiQjRfx7Nqv/jCO1aRGKRzkXGAXMW0IvvtgLzNFd2r0jGkIlFdCJKogw==
X-Received: by 2002:a17:902:d501:b0:235:f3df:bc26 with SMTP id d9443c01a7336-237d976311fmr188832525ad.3.1750692590758;
        Mon, 23 Jun 2025 08:29:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12427cdsm7052225a12.39.2025.06.23.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:29:50 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:29:47 -0600
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
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aFly61yCMttkp12e@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-4-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-4-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_082951_699974_DF0A578E 
X-CRM114-Status: GOOD (  41.36  )
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

On Tue, Jun 17, 2025 at 04:34:50PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the remote core is started before Linux boots (e.g., by the
> bootloader), the driver currently is not able to attach because it only
> checks for cores running in different partitions. If the core was kicked

Again, we have a nomenclature issue here with "If the core was kicked by the
bootloader".  What does "kicked" mean here?  Is it just powered and held in
reset or is it executing.  And are you referring to the A core or the M core?


> by the bootloader, it is in the same partition as Linux and it is
> already up and running.
> 
> This adds power mode verification through dev_pm_genpd_is_on(), enabling
> the driver to detect when the remote core is already running and
> properly attach to it if all the power domain devices are on.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), letting the platform device become a
> consumer of the power domain provider. With that the current power state
> of the genpds will not change, allowing the detection of the remote core
> power state.
> 
> We enable and sync the device runtime PM during probe to make sure the
> power domains are correctly managed when the core is controlled by the
> kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
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
> index 627e57a88db2..b53083f2553e 100644
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
> +	 * core is already up when the kernel booted (e.g. kicked by the
> +	 * bootloader). In this case attach to it.

Same comment as above.  What got kicked?  A core or M core.  And what does
"kicked" mean?  I can guess what is happening but guessing rarely leads to
anything positive.

In the next revision, please use other words than "kicked".


> +	 */
> +	for (i = 0; i < ret; i++) {
> +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +			detached = false;
> +			break;
> +		}
> +	}
> +
> +	if (detached)
> +		priv->rproc->state = RPROC_DETACHED;
> +

Ok for the above.

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

