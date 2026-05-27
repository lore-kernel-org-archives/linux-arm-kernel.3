Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61680CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=; b=VcDO2keUuEELHlI1PzNrdp4gMG
	K4+Za29F1R9S1q5Rq6y/UYrJX3dwUogxRZr8fB+MR62Sa7koXRfcukZ4E1n1DeSV9TaeTNNSwLsp8
	P4W9DHZ0A9FdzNtlc9weDOsadqP5bdah2ZGqYqXrDRJzzq/hTdYZb/QMWUz5SwT8wSOLXikV3Yy3+
	ADEGOvLzg1E/vFocXAgf/UfpvJoJVnadtrT/70ohBQjHiJIwkOy13s/RGAeOzCQT+Y25dS0CRVVFx
	zIA2yO1nEkVG1adF6TRb9PebE211RbxxXUwHqFg/LbPYimcpQlU4K3GDnIrPt254enp8dE3rUYqNE
	MRHfKlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFcD-00000004KX4-1VhR;
	Wed, 27 May 2026 14:52:13 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFcA-00000004KW2-33q3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:52:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3664df32e91so13514235a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779893530; x=1780498330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
        b=vVuJiTq+HuIB6Nu61qFfzqLZr/QIxVOk+KcT2024/riWD45ToVch69vfT3m83HLDvJ
         1Xg53V2UUcVGeo5EhL8b7c6v380jVyfAcWQt+hDNCOOa87nrHQCPLvlyVQnRPMxxfrwR
         aBAwtc0PeqVO7/pYmnHL8aOz2XUcpFtd4VBYYMa++f4IuKwACi0BHMS9Kff5QMxyUKVW
         ux2avj01tHUPgvKLvik9Cs0hFaXM3wEFdqi8npZBcFHS1zTRO90NRO2n0BQhyabHwBZj
         We0BmYHpOm4RmiZSO73znjEGZp11TKvCObtIG+WrrtJIWb/4iL88smpy+B3opIxeY/AX
         wRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779893530; x=1780498330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GysSj+xcxKb96SCtQcauT9ZCA24G3J8cy9Fr5XJtfec=;
        b=LOPIA1d7JS89Kj9zBsZO63EzyxBXj++DXHlSd9hNxzz2FR6NZCCb2Dn+gNngW46Q/I
         C6pS3fR7GV/2uf519uoDcrOF09Y6avxZceqKEjBPKdEdf5o479ZamLWnb3W0tQO9y4UQ
         /IeFKM4T1AnJnvRHGRDdP2GZ1ffjz1xmaV+Jp+LRjkmt7g5SEo4hXhT2EQhCW/qmReUo
         p0Wqs0CohJjBhJnwjMfzuu7mK0Q9YSOIlY7bPiMSvO7YODbbvT8oYOemzFeQjHWDv1py
         R/ta0ZRNxdV+Fzx5i+hLRUnMpmrV2Q903137zaeptIY7EO5zj+WtmCFcaNeIKpelJiWk
         Xy1A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZthIpl1xZhprLqryMTeCfOSv7Jh9GGrBr3DWPUxG1RsD3oCqcedzgIqTjIksqgt8unUReSscF9+Ap21uFkCFY@lists.infradead.org
X-Gm-Message-State: AOJu0YyqrXIPKvRiA0mdxvO1YOqXz104PMz6mfmx0VNPjI3KWA7L2ykt
	jjSHI5TxVl3JfkW0YsDjeD4jErOihEzX8bA7zBNxCqE08jZbljtWKdrPVp98eZRcO2Q=
X-Gm-Gg: Acq92OECNmF/M/2zqvjeXy98D48+LaSiQO6am5pXMkLcQBO6qgsjduXSy5ZqSL7j+x7
	7HT3eOiL+7MBz0GtpuQpji7zRf8KuiOa8Dr4uFQ+eTxzJlEIl89fx++0P4KWmSfRwz0NBP2qZ1u
	Q57OTvVxloGWbt0nawk4Q6MvF5iyX/gEs9/D4iKdvgROV+mde9veyL6zArMxngeg5PkvUg0DxEv
	TpQoF3nvi0+iAJN5a2AgqdsDh4PGg+/z7htdOHTt0Azm+GW50gwkwyfHE7YA7TGaz1mAtm3K04p
	wC626CPw44wYnRR85qpscY+VrsTSYZPUFI7kWqfqA/VS4GWKTzLXAfqj64rGMOUxYBGI5eVNiQV
	5+kj80/TcIyMYSvyV3fvv73Mn5omZLdAWD7AIb9YEurYpQtzaoRBSxv8AeZNUwORZHfs8YSimhv
	1zZ48J6m5rmld7rz+XYLKfRkzmLuh0baJ9vtmiNw==
X-Received: by 2002:a17:90b:3fcb:b0:367:c442:3f20 with SMTP id 98e67ed59e1d1-36a6762cebdmr25100604a91.19.1779893529666;
        Wed, 27 May 2026 07:52:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7baasm19906738a91.9.2026.05.27.07.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:52:08 -0700 (PDT)
Date: Wed, 27 May 2026 08:52:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, geert+renesas@glider.be, magnus.damm@gmail.com,
	patrice.chotard@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, tanmay.shah@amd.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/5] remoteproc: switch exact-match drivers to
 wc-ioremap callbacks
Message-ID: <ahcFFkc2b0Pq9icR@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-3-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-3-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_075210_788567_513EB7CD 
X-CRM114-Status: GOOD (  23.74  )
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

On Thu, May 14, 2026 at 09:21:26AM -0700, Ben Levinsky wrote:
> Replace the exact-match carveout map and unmap callbacks in the
> existing remoteproc drivers with the common wc-ioremap helpers. This
> covers xlnx_r5_remoteproc, rcar_rproc, st_remoteproc, stm32_rproc,
> imx_rproc, and imx_dsp_rproc.
> 
> Leave the zynqmp R5 TCM callbacks alone because they also clear the
> mapped memory and are therefore not exact matches for the shared
> helpers.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 36 ++++---------------
>  drivers/remoteproc/imx_rproc.c          | 32 ++---------------
>  drivers/remoteproc/rcar_rproc.c         | 33 ++---------------
>  drivers/remoteproc/st_remoteproc.c      | 31 ++--------------
>  drivers/remoteproc/stm32_rproc.c        | 34 ++----------------
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
>  6 files changed, 18 insertions(+), 195 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 008741af9f11..2d9f14fbef1d 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -644,32 +644,6 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
>  	mbox_free_channel(priv->rxdb_ch);
>  }
>  
> -static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> -				     struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  /**
>   * imx_dsp_rproc_add_carveout() - request mailbox channels
>   * @priv: private data pointer
> @@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
> -					   att->size, da, imx_dsp_rproc_mem_alloc,
> -					   imx_dsp_rproc_mem_release, "dsp_mem");
> +					   att->size, da,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
> +					   "dsp_mem");
>  
>  		if (mem)
>  			rproc_coredump_add_segment(rproc, da, att->size);
> @@ -732,8 +708,8 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					    imx_dsp_rproc_mem_alloc,
> -					    imx_dsp_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
>  		if (!mem)
>  			return -ENOMEM;
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 7f54322244ac..6249815b54d8 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -600,35 +600,6 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  	return va;
>  }
>  
> -static int imx_rproc_mem_alloc(struct rproc *rproc,
> -			       struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %p+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int imx_rproc_mem_release(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -692,7 +663,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		/* Register memory region */
>  		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
>  					   resource_size(&res), da,
> -					   imx_rproc_mem_alloc, imx_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   "%.*s", strchrnul(res.name, '@') - res.name,
>  					   res.name);
>  		if (!mem)
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index 3c25625f966d..e3121fadd292 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -19,35 +19,6 @@ struct rcar_rproc {
>  	struct reset_control *rst;
>  };
>  
> -static int rcar_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = &rproc->dev;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int rcar_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_prepare(struct rproc *rproc)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  		mem = rproc_mem_entry_init(dev, NULL,
>  					   res.start,
>  					   resource_size(&res), da,
> -					   rcar_rproc_mem_alloc,
> -					   rcar_rproc_mem_release,
> +					   rproc_mem_entry_ioremap_wc,
> +					   rproc_mem_entry_iounmap,
>  					   res.name);
>  
>  		if (!mem)
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index a07edf7217d2..486180cdccb4 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -88,33 +88,6 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
>  		dev_err(dev, "failed to send message via mbox: %d\n", ret);
>  }
>  
> -static int st_rproc_mem_alloc(struct rproc *rproc,
> -			      struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (!va) {
> -		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int st_rproc_mem_release(struct rproc *rproc,
> -				struct rproc_mem_entry *mem)
> -{
> -	iounmap(mem->va);
> -
> -	return 0;
> -}
> -
>  static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct device *dev = rproc->dev.parent;
> @@ -138,8 +111,8 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), res.start,
> -						   st_rproc_mem_alloc,
> -						   st_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s",
>  						   strchrnul(res.name, '@') - res.name,
>  						   res.name);
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..7ac8265b60ac 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -113,35 +113,6 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
>  	return -EINVAL;
>  }
>  
> -static int stm32_rproc_mem_alloc(struct rproc *rproc,
> -				 struct rproc_mem_entry *mem)
> -{
> -	struct device *dev = rproc->dev.parent;
> -	void *va;
> -
> -	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
> -	va = (__force void *)ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va)) {
> -		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
> -			&mem->dma, mem->len);
> -		return -ENOMEM;
> -	}
> -
> -	/* Update memory entry va */
> -	mem->va = va;
> -
> -	return 0;
> -}
> -
> -static int stm32_rproc_mem_release(struct rproc *rproc,
> -				   struct rproc_mem_entry *mem)
> -{
> -	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
> -	iounmap((__force __iomem void *)mem->va);
> -
> -	return 0;
> -}
> -
>  static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
>  					      struct stm32_rproc *ddata)
>  {
> @@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  			mem = rproc_mem_entry_init(dev, NULL,
>  						   (dma_addr_t)res.start,
>  						   resource_size(&res), da,
> -						   stm32_rproc_mem_alloc,
> -						   stm32_rproc_mem_release,
> +						   rproc_mem_entry_ioremap_wc,
> +						   rproc_mem_entry_iounmap,
>  						   "%.*s", strchrnul(res.name, '@') - res.name,
>  						   res.name);
>  			if (mem)
> @@ -957,4 +928,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
>  MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
>  MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
>  MODULE_LICENSE("GPL v2");
> -

Spurious change.

> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 45a62cb98072..e5d1903c9636 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -447,45 +447,6 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_mem_region_map()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem descriptor to map reserved memory-regions
> - *
> - * Callback to map va for memory-region's carveout.
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_mem_region_map(struct rproc *rproc,
> -				    struct rproc_mem_entry *mem)
> -{
> -	void __iomem *va;
> -
> -	va = ioremap_wc(mem->dma, mem->len);
> -	if (IS_ERR_OR_NULL(va))
> -		return -ENOMEM;
> -
> -	mem->va = (void *)va;
> -
> -	return 0;
> -}
> -
> -/*
> - * zynqmp_r5_rproc_mem_unmap
> - * @rproc: single R5 core's corresponding rproc instance
> - * @mem: mem entry to unmap
> - *
> - * Unmap memory-region carveout
> - *
> - * return: always returns 0
> - */
> -static int zynqmp_r5_mem_region_unmap(struct rproc *rproc,
> -				      struct rproc_mem_entry *mem)
> -{
> -	iounmap((void __iomem *)mem->va);
> -	return 0;
> -}
> -
>  /*
>   * add_mem_regions_carveout()
>   * @rproc: single R5 core's corresponding rproc instance
> @@ -522,8 +483,8 @@ static int add_mem_regions_carveout(struct rproc *rproc)
>  			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  							 (dma_addr_t)res.start,
>  							 resource_size(&res), res.start,
> -							 zynqmp_r5_mem_region_map,
> -							 zynqmp_r5_mem_region_unmap,
> +							 rproc_mem_entry_ioremap_wc,
> +							 rproc_mem_entry_iounmap,
>  							 "%.*s",
>  							 strchrnul(res.name, '@') - res.name,
>  							 res.name);
> @@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
>  		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
>  						 dma_addr,
>  						 len, da,
> -						 zynqmp_r5_mem_region_map,
> -						 zynqmp_r5_mem_region_unmap,
> +						 rproc_mem_entry_ioremap_wc,
> +						 rproc_mem_entry_iounmap,
>  						 sram->sram_res.name);
>  		if (!rproc_mem) {
>  			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
> -- 
> 2.34.1
> 

