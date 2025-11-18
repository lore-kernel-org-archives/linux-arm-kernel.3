Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3588ECEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=; b=MN+4gZ7Fwc0tHVmCDbtU8FMxCb
	48jJNDeB9sYFCBpKmIwX3VhQUnj/YYWFImkduMn5NM3znTncqpb8rUhY0mziJG3dulItOql2nXKbx
	eLQGXAmGU9hvB5UGvp6BcU6/0YVyPD2p13lbu/9vqpCAXrWwg401S2jfzprs7porRxpuJ3iKhxBGP
	nKXBZmePz82N1SG/g+I8/juz/JkHn9uKaTtHzUUOf6zoH/+xttBV6Cxaln7y69pIX6ZVqwdocMErE
	RFjKoh9eYZFCq8uRDUzxK4pwK4iV7vOKnMqYQKtYTbTT8Jk67aVkM155/UAAKdoTZtcq6XNVQ7ezs
	OhljJW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOkJ-00000000lOM-1IAZ;
	Tue, 18 Nov 2025 16:39:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOkH-00000000lNv-1mVP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:39:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2956d816c10so60238655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483996; x=1764088796; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=;
        b=Lo9FD0ZBpYjWWN1lg56ZpwmZIXJwnIPrsdwihhCoPHhls0/cv79ZcqKeCRqv/FQ0ud
         zzhsa2pqKamVjPMAVpm9dCzvzx1Y4YejrQPnzeerrHW3s9NrIib8PP+U/bq/6bEm3Wte
         ddjZUm2h2NehH0niAhvZt8M+BuwvG92gV+C+eqgzy+JKgQh/8PBMGkyoOHF+ogG3r//b
         fKNNfKwx0F/v2LNYdKYi0WFpP7XJMSf4u4QfwoVw/U1/GHUxyS6JYAyyD5rgPnWr+Nfw
         xQI3Awg2hGsUqOT/qXZ4mtJC6QY3+b6XAs3PSnWbdSR3slQiKvmFi7bePTG+F26nUeBp
         5i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483996; x=1764088796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hOaRCXxV1SPJvrWHDqTT1g2cG8DJ5zjGu5g8Phj524=;
        b=YwWNPQ1Ou3KVLQl8BNhbmzZnBP6vKwBs5Fz3CkenLc7aIjfDSJyBFSCPwo1l9U3/1L
         ewHTRjuFIjlGQ6zbEI1JT18aK4cRKMEm2U3nMJexZxw7pPhw4xqrwmDfhK+Q7+EYXkAG
         eQYZKDa6nCZMRjqep5ioz+gMI0xL/XzEu4Pd5hNxhJwDzmTk1RMCCW7uyNakPGs0lrBi
         2hGlaUktE2XNuFSa7P43Hi936SZxqhT1gMqF7KqvuQ0xY6HrI77bhmAyeAdfybBcZ0KT
         2H5cwjkmoofxxEfmGtVQV2r3ubG3opxAbTyrpshQyTDtC6lEWxIHsoTBbPX9GXMUxKVO
         wxVA==
X-Forwarded-Encrypted: i=1; AJvYcCXxoaiaf6Ty3dq3TW0BqMA0jt3+QAfXs1i8AvbJo0WL9bZyYsw0BvFUJNj4m6nyXDU+2RkXozl5B/fwdgij5O0l@lists.infradead.org
X-Gm-Message-State: AOJu0Yz13drF54lchKG+TmiS00AGodSQnsZIzRlGowq6cFfKHH7MxWP5
	a9C8USpTC6eLa76mc7OxqSuum55MGX3fgTmUEfisd4adBh8vAJ5Z1i2fVH3XqKcgG/k=
X-Gm-Gg: ASbGncvBMz+lVPEhav311l4UvpO75bQzJjdhasTqlh5fTpB2byrlqWhYrM3nhtZVsfL
	gU+vcEK3UwKCoLrGcvWV8USCy3RFkHeEqqSbuK/DtWs9DVg2F4fMuqXmUXu+N3GXXYW4JfHbEbm
	TU8YN6Ndbg23q1kZw9qkOOHFeFmrRToTcp8PjpZm3di4r46KQFl+MR0T2r7j+t+jF/yagHBTS3O
	QP3oULmdrRd0b8SlUvw+3yCgM5BOBscRZTh45fuTBuqrF1NCrLp+Xr36IhJvGsn4QMLpmZalKW8
	lAyN2mLqlFtxWUHIA6RJI+/FweSjd/9/qMG2PCfK8Bz+F8IyN3k0W0UHCNFoxWUTUuwe6zWFplz
	ZMVt1cO2eoVSYt518ZVQPvo95+fBB47IjjRu+S88oNXDHcGdgBG9k9votVqvbeIs1NTvBE7uxoz
	nP2X8=
X-Google-Smtp-Source: AGHT+IFFlRKqGN0EFfOvRr2kyUDj7RRlM7hPl1xppO9T/OtL5bWQkM7hLz3RHkgvILrGF6je2OfB2w==
X-Received: by 2002:a17:902:f607:b0:298:1f9c:e0a2 with SMTP id d9443c01a7336-2986a76f992mr206752045ad.54.1763483996482;
        Tue, 18 Nov 2025 08:39:56 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:5650:f012:168c:76e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986e54f019sm143681775ad.15.2025.11.18.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:39:55 -0800 (PST)
Date: Tue, 18 Nov 2025 09:39:52 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 01/11] remoteproc: imx_dsp_rproc: simplify power
 domain attach and error handling
Message-ID: <aRyhWF5Wh5GxXsCg@p14s>
References: <20251111-imx-dsp-2025-11-11-v3-0-d05dcba737fa@nxp.com>
 <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-imx-dsp-2025-11-11-v3-1-d05dcba737fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_083957_464918_1BBF712B 
X-CRM114-Status: GOOD (  22.94  )
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

On Tue, Nov 11, 2025 at 09:41:12AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Refactor imx_dsp_attach_pm_domains() to use devm_pm_domain_attach_list()
> directly, removing manual detach logic and simplifying resource management.
> 
> Also replace verbose error handling in imx_dsp_rproc_probe() with
> dev_err_probe() for cleaner and more consistent error reporting.
> 
> No functional changes.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 6e78a01755c7bdc28cd93f00fe6f74affc3d96b0..c466363debbebe8f91b908b3bffaa32e9bf8b9a6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1062,14 +1062,12 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>  {
>  	struct device *dev = priv->rproc->dev.parent;
> -	int ret;
>  
>  	/* A single PM domain is already attached. */
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	return devm_pm_domain_attach_list(dev, NULL, &priv->pd_list);
>  }
>  
>  /**
> @@ -1186,35 +1184,25 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  
>  	/* There are multiple power domains required by DSP on some platform */
>  	ret = imx_dsp_attach_pm_domains(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_attach_pm_domains\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_attach_pm_domains\n");
> +
>  	/* Get clocks */
>  	ret = imx_dsp_rproc_clk_get(priv);
> -	if (ret) {
> -		dev_err(dev, "failed on imx_dsp_rproc_clk_get\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed on imx_dsp_rproc_clk_get\n");
>  
>  	init_completion(&priv->pm_comp);
>  	rproc->auto_boot = false;
>  	ret = rproc_add(rproc);
> -	if (ret) {
> -		dev_err(dev, "rproc_add failed\n");
> -		goto err_detach_domains;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "rproc_add failed\n");
>  
>  	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>  
>  	pm_runtime_enable(dev);
>  
>  	return 0;
> -
> -err_detach_domains:
> -	dev_pm_domain_detach_list(priv->pd_list);
> -
> -	return ret;
>  }
>  
>  static void imx_dsp_rproc_remove(struct platform_device *pdev)
> @@ -1224,7 +1212,6 @@ static void imx_dsp_rproc_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  	rproc_del(rproc);
> -	dev_pm_domain_detach_list(priv->pd_list);

This patch is giving me a compilation warning.

>  }
>  
>  /* pm runtime functions */
> 
> -- 
> 2.37.1
> 

