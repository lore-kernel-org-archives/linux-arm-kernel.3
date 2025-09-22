Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F39ACA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IhdqQk9DvI4AFmg9naSg1FH7sc1HQKYfUNgmIemfvA=; b=X6ATubuziDEyG2IR8LEAMh8DY1
	iJcOKDad5CjzyLWZLg+cy9rmtfq7G9JZHlC+BzVEc9XBoANAouvI0DPqyfqvX/bQXqwRjtGPiQ458
	q7ACqE5GU54FIiMfF+EtPkJCKmqgvzZ1IYdPMcGTebi+71T7NsOaqyakJVv2xCpum7boF2bxovI0I
	a1p3388yHndP98YqMrXQLM5x/l0EWSNgrzZFI/CBJfs7+VRo2fFvavLpLScaZS0dxgD+aXZsctqSS
	fafU+81dulLBwoCo156NX72gXtNX9CepmkVuH3Vb0CMcqTSANNQ2QzUhutjsmgjqra2ADyyIm/olU
	i2qhykwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jb8-0000000B0V6-0FRA;
	Mon, 22 Sep 2025 16:41:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jb4-0000000B0Tw-3Ov9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:41:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-269af38418aso49120745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 09:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758559262; x=1759164062; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IhdqQk9DvI4AFmg9naSg1FH7sc1HQKYfUNgmIemfvA=;
        b=Fmex0j6HU5PsC5oEI6CJaOeqPfc/tEGilDbR5Bdf9j5dS2GL/uOIKDcR7EXa4zknwI
         lhmcjtm9lo1kf2W+EyiD+MtJfN1DaR+EEi/yQDIqI7Etpi9ng2vKRtk3Uy7xVRj3+251
         uBmRQ8tAkL5rEQ7OCIqAzfUJy+TeXuS1boQhOYNTNqX+orzZj6wIyHXVcjWB4wjKCnji
         hacypdjeN75Y2x5X81KMY1yaSNbi+wXdA5maWUBj6wI9gthVIzn6hFKcSrEPeuk/oywu
         bFqm8jt+gxWxp6sHxwNGvq+Ophq3d6ZwmUTYxrntBrCz1QPhu9Ncm2orYld47iPKAXzr
         rJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758559262; x=1759164062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IhdqQk9DvI4AFmg9naSg1FH7sc1HQKYfUNgmIemfvA=;
        b=hrjmdoQ8nuiMolBqbeH1CNtQFkvG7bpqZnCvmT12jcta5DY7X4WhIJJrnRDbZUNqjU
         JaAaAx/XGS35E90b3ENwQTZ3dT11m2SMqxWKf2gB0P+nl5R/loZJi6O8ULfgTSdTAFwk
         yI7GGlIcWn0hdGHMUkQyxGW9jeE13itc8A31TszWsAFECHEfECBBFUaPKxYt95CX6hlh
         x7OlgX4FFh8ars+ETYG/06yvxvS+lWf6dweDL6Y6SsWKHH5uaYfB8bzUjIb5x7zdSLNf
         JO7Q+hcPDYN4+Z9C1sIddJsn32Yg2+TY05ZNpOz4wj8UsZmsIbRK/a62CyxtBp/XzgB7
         vIBw==
X-Forwarded-Encrypted: i=1; AJvYcCXQHAnGg18w7VtdLJzX7HtIcxWXa3dmXnVxmL5Bo364gqpBrt0bvEVCizpP+775+ZtzNtqz4swenYETHIegkxEk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz0tTzavHNz4ud/73RadHOJlu/gpJaJXG7FbFADaNN72MUiFcu
	paK8ul418/fs+E18Ubo3Amb4TQWBxvrLSPteegWGfuW/0/66411a3iYZGqklUFVJrvc=
X-Gm-Gg: ASbGncsixOAkKC1T4qfp/1mQ3m5rBjk0g2azk5KQpcE87lteRQxKMZJNKgueIr97LeE
	18520RhijX40gvVf9TA2Zu/w8XcQfrx8TbLkverOEj+BM6GZJ4ZvvQjfYcLDLZIGPIH3Um7UXQB
	PaixZWJ/3DZRWskxpL9nfvs2hEvUTvgyELCe1drm+j7yr2+QEtJbcdyI7Hgt8GxE3uVfLR7PSGs
	LPGberTco3rd1Eni01g1bqfyh2XyxmmXGNvw9u59v/ibcEsMXKBI/5Ym/DUB82z/LxP5TopdDrl
	yxR9zU9ZN8kevZCy5L+b9BRjlwHbfS5Bs+rqqlrBdY3g5oP2j1HPbeEFsGV2reMrSZJn0Wxvw0j
	JAKFmxGbBc/k/d0avBOv1E7tClpww05nmsQJ04uuasU/EvBv5uLsOZKQ+GV/VXrywcCTNBBUgx5
	9akxyLPNWOkWQbyru7QPH4DaSl
X-Google-Smtp-Source: AGHT+IEfgeLF7s67XVRDD8PRT9D2ccPv3NRL1m9Ax/Yy510Mn/2xkDPBuMAlPcQAyv9mkisQ4XQ6SQ==
X-Received: by 2002:a17:902:c402:b0:267:8049:7c7f with SMTP id d9443c01a7336-269ba3e9219mr175928935ad.7.1758559262001;
        Mon, 22 Sep 2025 09:41:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4631:7929:7e95:6485])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698018167asm136546225ad.57.2025.09.22.09.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:41:01 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:40:58 -0600
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
Subject: Re: [PATCH 4/6] remoteproc: imx_rproc: Use devm_clk_get_enabled()
 and simplify cleanup
Message-ID: <aNF8GgKGvokLq0mf@p14s>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-4-00ce23dc9c6e@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917-imx_rproc_c2-v1-4-00ce23dc9c6e@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_094102_867061_B18FD9C5 
X-CRM114-Status: GOOD (  24.91  )
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

On Wed, Sep 17, 2025 at 09:19:16PM +0800, Peng Fan wrote:
> Replace separate calls to devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled(), which combines clock acquisition and enabling
> into a single managed step. Simplify the probe logic and remove the need
> for manual clock disable in error and remove paths.
> 
> Also, update error handling to eliminate redundant cleanup steps and use
> return-based error propagation where appropriate. Improve code clarity and
> reduce the chance of resource leaks or incorrect ordering in cleanup paths.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e30b61ee39dacc88f9e938f8c6ffe61fef63dbda..c6cfb308ddb376f370fd4492f8a84f734602bac8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1006,26 +1006,19 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  {
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> -	int ret;
>  
>  	/* Remote core is not under control of Linux or it is managed by SCU API */
>  	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>  		return 0;
>  
> -	priv->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(priv->clk)) {
> -		dev_err(dev, "Failed to get clock\n");
> -		return PTR_ERR(priv->clk);
> -	}
> -
>  	/*
>  	 * clk for M4 block including memory. Should be
>  	 * enabled before .start for FW transfer.
>  	 */
> -	ret = clk_prepare_enable(priv->clk);
> -	if (ret) {
> +	priv->clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
>  		dev_err(dev, "Failed to enable clock\n");
> -		return ret;
> +		return PTR_ERR(priv->clk);
>  	}
>  
>  	return 0;
> @@ -1134,7 +1127,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  						    imx_rproc_sys_off_handler, rproc);
>  		if (ret) {
>  			dev_err(dev, "register power off handler failure\n");
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  
>  		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
> @@ -1142,7 +1135,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  						    imx_rproc_sys_off_handler, rproc);
>  		if (ret) {
>  			dev_err(dev, "register restart handler failure\n");
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  	}
>  
> @@ -1150,32 +1143,30 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		ret = devm_pm_runtime_enable(dev);
>  		if (ret) {
>  			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  
>  		ret = pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  
>  		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
>  		if (ret) {
>  			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> -			goto err_put_clk;
> +			goto err_put_scu;
>  		}
>  	}
>  
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> -		goto err_put_clk;
> +		goto err_put_scu;
>  	}
>  
>  	return 0;
>  
> -err_put_clk:
> -	clk_disable_unprepare(priv->clk);
>  err_put_scu:
>  	imx_rproc_put_scu(rproc);
>  
> @@ -1187,7 +1178,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	clk_disable_unprepare(priv->clk);

/home/mpoirier/work/remoteproc/kernel/drivers/remoteproc/imx_rproc.c: In
function ‘imx_rproc_remove’:
/home/mpoirier/work/remoteproc/kernel/drivers/remoteproc/imx_rproc.c:1179:27:
warning: unused variable ‘priv’ [-Wunused-variable]
 1179 |         struct imx_rproc *priv = rproc->priv;
      |                           ^~~~
  AR      drivers/remoteproc/built-in.a
  AR      drivers/built-in.a
  AR      kernel/module/built-in.a
  AR      kernel/built-in.a

>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
>  }
> 
> -- 
> 2.37.1
> 

