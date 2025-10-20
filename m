Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04F7CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=; b=utQXrU/DBqj4MDaXGvjvnTQo3N
	tcAhwOLjKYOlHbL5ZSy9Ajb2L/3Kd55V7DEFe8EgtH54UIqVR4D7UYfm7Hn4UDFHMDZONM+H0RwqR
	NasnQyZFfDGTsxlAM+sz+uGzeYD31ZEzFKqJnRCbw4HnhrYeN3sVrah5V9Nl3QfWACO3tL+DGFDPP
	NlPj+vZbcP4MSlbLLkgKDIAhHseRz9dRno9pvIMpS9JR58kDGRHlv0el4Dx0Yf58Bgg0PRzv/J1HI
	kqOHmQNVMWqmizNhybpYGFTjaJvdD8DtVz5fu360tZ6X6XrT/W/wAlaFUiTuSmVzrv7KybcY03DC3
	3quHP5Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArwz-0000000EA1p-1JW5;
	Mon, 20 Oct 2025 15:37:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArwx-0000000EA10-07Ak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:37:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-33067909400so3435093a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760974650; x=1761579450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=;
        b=dOpCSZPDY4pHjM+pFt0K1muBvP8QhRi4JM2VlDzuIbjmGIpmkpSFdqNZznP7nczK2Z
         QzmUcR4Y9aTDNcD5KlkNO1SmLLIndEA9iMPwsmRUnEb6n7WEaNvA3DWtYBmVTUxhhxsm
         uE1GyK65aTG5cuGEPWPFcP/4OKjtKvBz/VmWJEVMrwx6jZNqYC/RrzLQ+z/guREWSXyw
         SiJtsQhWc/OVcKMHblTCrQ82A2L/vlz1Bl2aOtdFR4MQEA1nqZeu2Gd9QQ2bVkY56ec4
         79o/LNwlAaCzWVM1+EtPeHLtoviv1HrN7fJMEGhiT7Ax0uQZj91gL/RwVEQRJWyHT68W
         LB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760974650; x=1761579450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=An/szO/oyH3jWEETz4FjiP4MsyHyMfmUEnCotuUe/9s=;
        b=eHgVg48DDvbnOnlN2tTGJigd/nNYdP9QLFjsK1CrFkzYfWck3ewODiTU6TZoC26W9K
         I45V2zSdHFU1kBBqbDXodeALxthn6J6l06r3j++vfLhusO6PH+8Cu9WTteq6qtONXWxH
         yt4GoIlUNEUqtVJhLxeIvSO7dbAbXCofnin8oZpfwwtTdgmZcHacbAu/FXIzweA9CnIF
         NL8SNwlY6jAeOlGqVB4V6Qj9mQM8Powi8l4HSkppEHR0ua2VphTLIj4Sl7JbJRs8yz4G
         Z8efm19DU9ywKIRdLvvtl7OjtGpMgW6qiywmhUnUl5wh7r9l6Sxz46In04JlksEAsONL
         WAQA==
X-Forwarded-Encrypted: i=1; AJvYcCXkWRgRGZNvGgAfMFRzHciHndoA1qln6aX2wLYWeWaUmQgtQQ5YVyJsf8+XYw1BNm4BT/H0LNCd+zLTrCSU6/Cm@lists.infradead.org
X-Gm-Message-State: AOJu0YyCy5OlzZUsJOGqGAlRb91T+xXIRWgecjApJgyYce7N9gaSA7+Z
	kox5J/E+zhNi+OHbgBMg2J+TY4N6Ww+3oP9ZYll78SNjxTaj7gW6OAzTQ/PwbSwOiKE=
X-Gm-Gg: ASbGncskT8mOejEh/NdEy/iFErReUy1ShAudxxxONnkGgIzORbifo0JbiYWN/yrdtTs
	bOpmcNzUFLkyBlpYjHhIUe8TYeYhORpNNLCyH5tywlHKQ2KLb8PTml6sTE0qmm+VqsU9pn70n4h
	QtdP7OglPMZ0mk6NRUbVwkheKhsgOpnV0dDD0ryfWa3HPpPtJwY8goo6uOyUrnmeMdI/yc9OU9u
	+HSxZEUtWZeagswOrNmDohLFkZCcH2fSGyj8DE1ek9Rf/EOaChd7aop7P64LS/392qxGK6uXy0P
	+3Q85CcJYMkJQtNV3s2Yrbxo59kg9SvwEo/Uj+E0F5vw7b5zrIAkV8xpzr9vj9ENhDbhYiy+yMC
	lZPFV7PREyEfHqhhTzhp66fzQMbKg1Jf9l0b0vABQDEEDAiSSPzDV0LXyWHGkikauAkWDwj6gR2
	VZQ2vNc0t8ruKM3g==
X-Google-Smtp-Source: AGHT+IEmsmD6amTLvHHE+2cwS/e0HUauPuXtYyoBUNl10cvdG4E4NSTe+f3ScOSD6PoiCIK82vESEA==
X-Received: by 2002:a17:90a:d44f:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-33bcf880809mr18130535a91.12.1760974650080;
        Mon, 20 Oct 2025 08:37:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2360:6c8a:189d:ae5a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33ba93cbb7asm6652052a91.1.2025.10.20.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:37:29 -0700 (PDT)
Date: Mon, 20 Oct 2025 09:37:26 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support
 unconditionally
Message-ID: <aPZXNlY1MK4--Q_g@p14s>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_083731_068995_1C59E627 
X-CRM114-Status: GOOD (  22.03  )
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

On Wed, Oct 15, 2025 at 09:52:57PM +0800, Peng Fan wrote:
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 820b0cd5adbb17ce5665e7ec2786bca23f1a67ea..25f5cb4d414eabed7a166eb2a8ae5e20b6b4f667 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1119,12 +1119,10 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  			return dev_err_probe(dev, ret, "register restart handler failure\n");
>  	}
>  
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> -		ret = pm_runtime_resume_and_get(dev);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
> -	}
> +	pm_runtime_enable(dev);
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "pm_runtime get failed\n");
>  
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
> @@ -1135,10 +1133,8 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_put_pm:
> -	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(dev);
> -		pm_runtime_put_noidle(dev);
> -	}
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>  
>  	return ret;
>  }
> @@ -1148,10 +1144,8 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put_noidle(priv->dev);
> -	}
> +	pm_runtime_disable(priv->dev);
> +	pm_runtime_put_noidle(priv->dev);
>  }

Daniel - what is your take on this one?

>  
>  static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {
> 
> -- 
> 2.37.1
> 

