Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37DBCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=; b=t4H+VSzR2J5xZqhIA9Sz2X/fgs
	Xl9IkhKHp788AbcUlegqMzHHGnid19GsA/xN/hk7LZmaFv7sbfBsCkoLC/IIm7onUu3a0HDAJWZXZ
	6G6h62fURXolfeHuFm3Ymw014nxWJow9A4jQJGRijRXEe0x3jIb6R7NYK4FuPj32H2SuAQ7x84XM0
	ELEP0Kzrqqc8HETSBumiMB1pEtAT80bc4QG4ec+D508n78gGoWliPkOGz6t2V+YivbNuUUmnRnKlo
	YkTBv7TJirHXJYPKTRPgD4qobuOt67TEEBQENkWjZc/b2i8yxH8dDW2AVBzqSXk/y63AB5bcJGsDN
	9YPZdgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j4O-0000000Aw3y-2cH7;
	Mon, 22 Sep 2025 16:07:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j4L-0000000Aw3J-2t3Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:07:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso3497959b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758557232; x=1759162032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=;
        b=yn+LQUpEs3Z527ScfAbX1OOit7Qeq4MhUShg8/QBFETIOejkgPAptW8SO4gISA/B9p
         HUmpiA8OfFafCEITeWW7gzBOOhyzkePzmpUnDg0K6wF/I0myIMc7ks5fI79Gesrr7FSq
         JMrq/YkXsD60uYjgut/FXJfFVWRMqJx1g/QkSeDY39RhZA0fFT88+YlbKG8ftTHzJP4N
         NuPUF/eTCnI4yAKT1o7bZ2tDOwjM0BmuenjFx7dvPbakvD4WQGdv9PYy6klG8uAOqhrG
         Q7TYcFai8Vmmz/Rq3RguUzKdnxlTD8xWwEPToBZIKVFIRCFVRTFqSh7jEP1fGgBLH1/f
         EpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557232; x=1759162032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=;
        b=hezA/L8FZ4Mb74efzGG2sxwYg8iZQoG9zaJsAnfQ1ecdkFdN9xxMpmEP+oPGvYpyaC
         cI5XwAxRR2r+O5k1uyIUG2Q8Y5L+f6NXst15WEQ8yX+MS4iQQJhmI/Trpc/8zCj/vogX
         88sBO+CVQCifJ+XNDAu1weTyPFCNGGtZ67IQDbWX6qjbUZ0Axp6SrRJ0sXQ8Pn6dl87D
         XsIYxivUdhjZnWsC4JWYWv4R4XFn6Qp+Wgc1BqyJZPuiThrAssCg/zp2/zyzLNySBPOE
         2pNnjho7eZVRL/A9BAL+L7wvkRJiJRwJs+IPynSFmd2XIeaAKweZ9ObayflE6OYmBKs7
         lbjA==
X-Forwarded-Encrypted: i=1; AJvYcCWuIIHQ6Dr2zVirVGQ+T2MqwevurC0Bd0yEe7+glu/noFPgk+A2MbKhCbWMzdxwHZkUgp3Pl7mzMsmdOGOvib34@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6aCqGEmt7+TgEpsGZvQuedSxL0c2B6brJaxM+cPy2KoPPnWX0
	aTx9/uAQJ8sWuYKY6PpCLZQ1HvdHOoR5NzPLm8TRfbTw8JgFdX/GGBTlrLybYRWWats=
X-Gm-Gg: ASbGncu+502Kj7B3YgYOwGP2XlGskWhC02QPEvdewwZrtyNEPsunA6Ztutz/T6l+RPs
	AbIAk61W6mN31mY9BXHAFwqL7D1qnhTynW2FS79oaqTPcn0ilZjy6skj8tyN5I/tD0qdOTgp/Jj
	VbjrkMGnPg/tMzq7V+pG7xu5h43SWjwI2zqn2a2pMEpxuhFC0cLc8GxHOYb/u/I5PT7wjGU7uNB
	gjcHvAQO8iZsUqS51PgVFTsezLy8rRUcsOBBSkMg3YoY/JefsYyevp79sjVxkluDmcJ2ZLyWeXE
	EOE+w05Llu9ugZVEIAYnwp7/LTlPkYmE8+etfJyyXdNOuvmb0eJrS/RQB9KviNFlcAPw7Pm2/TQ
	e8c+DsCAOrjqSu7VBmJCbf3knFbqTFDTgVYuk3DVcUAwBXzuQR3e3FH4SHVJMB96P3/KvPj65oG
	AnYE+39wQo09Np5lo7a5etBpNgvOi5lNpdBFk=
X-Google-Smtp-Source: AGHT+IH2NzERQbi1RoTQELtlO5ZOlqSD7C5iySM5N99gbWGr6H6ojxxoxB4xZsUBWMUxh34xDnn+dA==
X-Received: by 2002:a17:902:ccd2:b0:267:99bf:6724 with SMTP id d9443c01a7336-269ba50876fmr165383605ad.31.1758557232460;
        Mon, 22 Sep 2025 09:07:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4631:7929:7e95:6485])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803184d3sm133896545ad.116.2025.09.22.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:07:11 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:07:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Message-ID: <aNF0LFkuS_hADmrz@p14s>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_090713_740170_24525E08 
X-CRM114-Status: GOOD (  26.91  )
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

On Wed, Sep 17, 2025 at 09:19:13PM +0800, Peng Fan wrote:
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines.

Where is this mentioned?  I have looked in [1] and couldn't find anything.

[1]. Documentation/power/runtime_pm.rst

> Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.
> 
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.
> 
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.
> 
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +	struct device *dev = data;
> +
> +	pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> +		ret = devm_pm_runtime_enable(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +			goto err_put_clk;
> +		}
> +
>  		ret = pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			dev_err(dev, "pm_runtime get failed: %d\n", ret);
>  			goto err_put_clk;
>  		}
> +
> +		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +			goto err_put_clk;
> +		}
>  	}
>  
>  	ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put(priv->dev);
> -	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> 
> -- 
> 2.37.1
> 

