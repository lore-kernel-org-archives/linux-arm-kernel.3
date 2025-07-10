Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B89AC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=; b=CBw0/xhQq/JX1pq0czpyLNeoTB
	XFwnCOCEC2yA7mmSEynHIcCpoSAllZYtzXoIyN/pmQz+lxdBndsGGFQzsq69Ke4CCQmVAYnOh1J/5
	2rTfdP2tdGSK6Z2F2ilHKJYotRGndyxX8DKZcT1yCVKVieTvJx24EBp6YEpZKJ136+Cp6TeqIr/YF
	BeRXkUeRRfD6c5gPfP2V6KNBFG0LAKzITjTIKiNU2BtFLFuiVsFjq+Q/YvuTMdCdByEJjlYkY08q1
	T5RoQ5n/mN3zPR10zO9zvNoDzcoXphq9MF+a77OE+cwWlOaSTJDUWPTJWZdbZRKDyAhoY7mk5QiMh
	0bx/2jkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZulx-0000000CXk7-4BEt;
	Thu, 10 Jul 2025 17:09:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsZC-0000000CALJ-3O53
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:48:07 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7494999de5cso721285b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752158885; x=1752763685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=;
        b=UUOjD3J8bU20PjO1+IyxT5vEBhJZE3mHEqyHNG59Yco2ayijeYmrkTs+txiaz9YZuQ
         X1yE0Qsn/oMZGKlIHou03ZFHv71Ki85PvmgG3B5XMZqR07W+j2TbeHDf/GQnX4uSZk+k
         myEucjE2d82eDkDMiYnnbC/OD/phP5I1b4NyXiBtd5TZdAR9K3u5GKkaI3YdMyR3YxUI
         es/cwBADQrQpmiRso4fCV8NISotVSzLLTJSiVLh6Ud5PQYkbsHtnzBHYiTOMpBCg/97P
         vjC+DuzeRXfluNRAw12AeJ1eMkm2PNvzYkSE9i96id6pFOhGu9LBOE6K012lg4rCc0hu
         bqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752158885; x=1752763685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccNFb5decGRIhbzkAZ9bEAXhYiv4SrqNXeSyqn4xl9E=;
        b=EwYaPVNAeupKBoN1Q1QHgHdcgUuBPhJaVszyLriCU637VWsvLV+xy+9AlTzgQJ5wO6
         jZ4A+J4A49ZoO+2H5bV6Mo9Nvmd4PpAX3dCO7a/KVvYp7X55IS8YZIOrxXtMbG0G4/YR
         FGpIGIUDIe0Z83++p8XX5lIIbQNCXA8lgzupsSpWbIBc/DyPENX/QmYSj4UrxY1unS+k
         FeaAFf2bazRJhi3Ievpd4z497H+l3dkpNuNqnPJfSjZ5ahJKyEEKIusw/m7zRaM+wclX
         hFgyGW0qv5BiPW7TbZvCAmPlqm/2kSeqfipfKlbFQVCKuaV/lJCunRze3eA27YpoHvPt
         IMkA==
X-Forwarded-Encrypted: i=1; AJvYcCW5gCgYfiNhlXLv2j8Z1laTzH6+PzN56RcsVi4AZ6polcNaPXXaiDCRrueOZAw7AgpgM2UakXlRqOkelKLcfBVr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Ol48R7itIqKfZ5oLtO9LraZlmxCT9+1FcXel0Z1gvex6lxvq
	IOjiy+tcVvfhyxtTadHbUVUDYRyGVg+0WXkT2zzr6a+9UMQowI6lJNscX1R7ReqNoBE=
X-Gm-Gg: ASbGnctKwbjrsOWc6MqUxVGWqkkRGKwOre3JdGAi+8EMhC36l7ZHJ8rkxMeT/JkAeLa
	gCHuw+6vehsgLkldLla6SMjbhMdV6dP+FmjCr2K7VRdvGfvBsvljQPBdtAxSLZwIfQlU5R0Gol5
	/DIuILWrWFOI1pdi04jeVETBUhXxW1WSqDZv4xgee3hgzxdMHxDxaPzFQPCwxa0glGNU0GVTllD
	mZCQPrnmwqDybuB1e93WViRCWHOqA1OIbjeVQJSBNJUspI4ysSGeJWXCEFycW5JevCt52b+oFWE
	BYVrjJK2lEMRUCl4gJ0uZ/pjp8cOJqYxyjwk+eD7d4KuAIQmvgZViA+fck3OwUT3BmCwVm8M3Is
	=
X-Google-Smtp-Source: AGHT+IGKNID1gQGS7oI+kpuFVzsANRPvMDcUoQn73a5qDrhqS0bdqghfssNgK8KQOfs1Md97STuJ/A==
X-Received: by 2002:a05:6a00:1795:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-74ea64572dcmr9520507b3a.10.1752158885496;
        Thu, 10 Jul 2025 07:48:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3c1:4dff:9df5:b97c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe727e33sm2514249a12.68.2025.07.10.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:48:05 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:48:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, iuliana.prodan@nxp.com,
	daniel.baluta@nxp.com
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: imx_dsp_rproc: Add support of
 recovery process
Message-ID: <aG_SosukEqUxrHvH@p14s>
References: <20250704052529.1040602-1-shengjiu.wang@nxp.com>
 <20250704052529.1040602-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704052529.1040602-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_074806_844700_0811FF88 
X-CRM114-Status: GOOD (  26.81  )
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

On Fri, Jul 04, 2025 at 01:25:28PM +0800, Shengjiu Wang wrote:
> When recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow. As the software reset is needed
> before DSP starts, so move software reset from imx_dsp_runtime_resume()
> to .load() to make the recovery work. And make sure memory is cleared
> before loading firmware.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 43 +++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5ee622bf5352..ba764fc55686 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -774,7 +774,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> -	struct rproc_mem_entry *carveout;
>  	int ret;
>  
>  	ret = imx_dsp_rproc_add_carveout(priv);
> @@ -785,15 +784,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  
>  	pm_runtime_get_sync(dev);
>  
> -	/*
> -	 * Clear buffers after pm rumtime for internal ocram is not
> -	 * accessible if power and clock are not enabled.
> -	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> -	}
> -
>  	return  0;
>  }
>  
> @@ -1022,13 +1012,39 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
> +	struct rproc_mem_entry *carveout;
> +	int ret;
> +
> +	/* Reset DSP if needed */
> +	if (dsp_dcfg->reset)
> +		dsp_dcfg->reset(priv);
> +	/*
> +	 * Clear buffers after pm rumtime for internal ocram is not
> +	 * accessible if power and clock are not enabled.
> +	 */
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		if (carveout->va)
> +			memset(carveout->va, 0, carveout->len);
> +	}
> +
> +	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +

This is a much better approach.  During my last review I said that I would not
move forward with this work until Daniel or Iuliana provide their R-B and yet,
they have not been added to the recipient list.

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load		= imx_dsp_rproc_load,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> @@ -1214,7 +1230,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>  {
>  	struct rproc *rproc = dev_get_drvdata(dev);
>  	struct imx_dsp_rproc *priv = rproc->priv;
> -	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	int ret;
>  
>  	/*
> @@ -1235,10 +1250,6 @@ static int imx_dsp_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> -	/* Reset DSP if needed */
> -	if (dsp_dcfg->reset)
> -		dsp_dcfg->reset(priv);
> -
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 

