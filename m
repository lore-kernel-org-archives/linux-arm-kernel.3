Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B35ACD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 17:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=; b=ZCfZTOT/cFztOnkW/ShkyHOwmG
	wDztj1FGgkwPMUZ3yQW8ohalAXtEJfAzGaZYr2PvwnPtXnuC2nlgVMohob2x3gFD2cKMlkfcbIhiB
	JkJiPRxSI7Pw0yiOLmLW+tFpXvHZ0X7rm17VtEFsTlkw1SVbJUDWmuIjBTwcRouhHOmz0pdU5VeUl
	6SKMhlKej+ACueaqKaG+w2Y9mb1hqBHxs8kepVYYD4pGahEWmzo2m63TidLOe6y/4ZWwHiyTaFqW3
	kpi3AfRxGXZMIADy7YwcDMsARtQNsqZUtZqa1hQE8dX7PsBLw1ukuHeW1uc+KUmbP3QK5ZiX1ZwM1
	Vm78RsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIJQ-00000004b5B-3fE4;
	Wed, 27 May 2026 17:45:00 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIJO-00000004b4W-0p1u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 17:44:59 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c80170db7d6so4802170a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 10:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779903897; x=1780508697; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
        b=vtvyAEayTuuHT8jYIWTgXuR5pAl51wXzl5onJGffsbiYv4ASWPUECBxQdyge+DLD8h
         HRGuZkkXV/7T9oqe3u4TXEfpftJhOiJNr32CnegUGAzKR02RPhiarTnFYEnUtscqNPdK
         apRzsNZ8G69NncYTRJaLvkmvi8Bbd+4BozOV4CxpyB2i5uRbDWz2Asn5rhskKyGbWJET
         i9fVazz5YpgKjS+AhN7HyEPveOP563OtTVOsnlMcUW86zSBeiijyPtAqcmU14zBlxhOD
         yreE74KdgxyR5TTCrVsW3IFk+RMrnnHlUmQDrrOyXZhGl0Ji4nb7xeO1QwvVrOYtVSIp
         VUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779903897; x=1780508697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IIwHB4tc8Zk/JmkEkdDm+906F5b3wX8vQAJk7Bu7kM=;
        b=gLp5hVDPntypudVOLaGGtzUEaA459pnqzHgzZMEEO742aS2cq3CmLSi2sUm5DmLCDK
         em7SIgjygNpT3R4Jhb8WjKZa6z770c+gOx+7BlprEXTroqY8/p53r5rgli31rhcg4YiA
         fSqx6f7VWKxb5BR1/xlxc6jLbLV/qmPv6tx9ksNB+jv84I/eev3e48tXETeE7IB/W7bX
         JTXdm0i1jv9r8AYMOaqpsy3pMn6VpI5UH2QgGKYEsaKLI+emKoqFrFTf7hqkdQTNzxnS
         krenZh72g87cIAXBNlDzVzSztbXkglzAHy2Y+jDkieUwsqdV9vMaYHI0du+cI87DXrA5
         tZLg==
X-Forwarded-Encrypted: i=1; AFNElJ84qRAV2cLUGX9SxfSMlBS+H10Tfx83ze1krv7rJDhPR3CXse0rHQOUot58e+8cIl9ant2w+JsCppSmiwQbn0jy@lists.infradead.org
X-Gm-Message-State: AOJu0YyUC/OZ9hsxP04Nblr7DD7X/n27B6/ldmurHF4/6fXI20udmkQ0
	98ibvi3vfWZRJSiFI26cx80bqjwPug17H2LlqGFCbKnYftsFy/sGmPUuXFc037ASJc0=
X-Gm-Gg: Acq92OGqI4fujoGtcN+opRzDsTv+b9fRmlgUfsAUGCI0Heyh7IFc+GUDYdaAxEjYJPT
	pwwf2U5p66zc3WNMNOPQZRx1dKOyjbaOHMxVPJfoYkrOhNeyylwK9a6o0Z+ELMFOsrCe9C7vLOv
	QhWGd9a2Ug9pOqqSrekazKLYIgytm4GAmyXV8Qh86V1od/IkZKwWYQ75JZ735uKxn0PrTxQrA6U
	PR2oxsTL6tbQXBAivuv3NN259mpNnlnjB6wQ3+cHwtGPCI6J+zUAwStoPkyfyn6PuoQSeXZKiWX
	REKaQi3T+psNxast5PqQK2Ix1b1UV4TeqTQHMqVvGW2QlTDIG+QKPUxLQVl+JhXrtzR1944o3ht
	BSTgOVIhOAfW5Tc4QgQShhgHPDaXRyMAxv2ub4tPlGVLpCBU1FqRJIN5MVCRg3b90adZvaYU1z1
	v0rLiNXmXNpvcz7IZpXO8AwBsiJes=
X-Received: by 2002:a05:6a21:a06:b0:3a5:8542:61a4 with SMTP id adf61e73a8af0-3b329340e22mr25394375637.25.1779903896893;
        Wed, 27 May 2026 10:44:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9466:b49b:cd0e:2dac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm2814639b3a.45.2026.05.27.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:44:56 -0700 (PDT)
Date: Wed, 27 May 2026 11:44:53 -0600
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
Subject: Re: [PATCH v2 5/5] remoteproc: switch drivers to optional
 resource-table helper
Message-ID: <ahctlW_4AKS6IHYt@p14s>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
 <20260514162129.1504162-6-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514162129.1504162-6-ben.levinsky@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_104458_273335_58F8EF54 
X-CRM114-Status: GOOD (  30.32  )
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

On Thu, May 14, 2026 at 09:21:29AM -0700, Ben Levinsky wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that already treat a missing resource table as non-fatal:
> xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
> imx_dsp_rproc.
> 
> Keep thin local parse_fw() wrappers in each driver so the helper only
> centralizes the return-value handling. That lets each platform retain
> control over whether the missing-table case is logged and at what
> severity, while other parsing failures continue to propagate to the
> caller.
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c      | 24 ++++++++++-----
>  drivers/remoteproc/imx_rproc.c          | 25 ++++++++-------
>  drivers/remoteproc/rcar_rproc.c         | 25 ++++++++-------
>  drivers/remoteproc/stm32_rproc.c        | 23 +++++++++-----
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 41 +++++++++----------------
>  5 files changed, 73 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 2d9f14fbef1d..2ff74f7938f6 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
>  	return ret;
>  }
>  
> -static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -

Why is this getting moved after imx_dsp_rproc_load()?


>  static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -990,6 +982,22 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
> +				  const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +

I am not overly fond of having to check rproc->table_ptr for the printout.  How
about:

#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)        \
        ({                                                                      \
                int ret = rproc_elf_load_rsc_table(rproc, fw);                  \
                if (ret == -EINVAL) {                                           \
                        dev_func(&rproc->dev, fmt, ##__VA_ARGS__);              \
                        return 0;                                               \
                } else {                                                        \
                        return ret;                                             \
                }                                                               \
        })

in remoteproc_internal.h and something like:

static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
                                  const struct firmware *fw)
{
        rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
                "no resource table found for this firmware\n");
}

in the clients?

>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
>  	.unprepare	= imx_dsp_rproc_unprepare,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 6249815b54d8..58c63f97ebf7 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> -static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static void imx_rproc_kick(struct rproc *rproc, int vqid)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -768,6 +757,20 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  	return rproc_elf_find_loaded_rsc_table(rproc, fw);
>  }
>  
> +static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index e3121fadd292..b7a39014b6bb 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret)
> -		dev_info(&rproc->dev, "No resource table in elf\n");
> -
> -	return 0;
> -}
> -
>  static int rcar_rproc_start(struct rproc *rproc)
>  {
>  	struct rcar_rproc *priv = rproc->priv;
> @@ -99,6 +88,20 @@ static int rcar_rproc_stop(struct rproc *rproc)
>  	return err;
>  }
>  
> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "No resource table in elf\n");
> +
> +	return 0;
> +}
> +
>  static struct rproc_ops rcar_rproc_ops = {
>  	.prepare	= rcar_rproc_prepare,
>  	.start		= rcar_rproc_start,
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 7ac8265b60ac..a4d42b755c74 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
>  	}
>  }
>  
> -static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	if (rproc_elf_load_rsc_table(rproc, fw))
> -		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
> -
> -	return 0;
> -}
> -
>  static irqreturn_t stm32_rproc_wdg(int irq, void *data)
>  {
>  	struct platform_device *pdev = data;
> @@ -623,6 +615,21 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
>  	return (__force struct resource_table *)ddata->rsc_va;
>  }
>  
> +static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_warn(&rproc->dev,
> +			 "no resource table found for this firmware\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops st_rproc_ops = {
>  	.prepare	= stm32_rproc_prepare,
>  	.start		= stm32_rproc_start,
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index e5d1903c9636..9b9f07d152e6 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
>  	return ret;
>  }
>  
> -/*
> - * zynqmp_r5_parse_fw()
> - * @rproc: single R5 core's corresponding rproc instance
> - * @fw: ptr to firmware to be loaded onto r5 core
> - *
> - * get resource table if available
> - *
> - * return 0 on success, otherwise non-zero value on failure
> - */
> -static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> -{
> -	int ret;
> -
> -	ret = rproc_elf_load_rsc_table(rproc, fw);
> -	if (ret == -EINVAL) {
> -		/*
> -		 * resource table only required for IPC.
> -		 * if not present, this is not necessarily an error;
> -		 * for example, loading r5 hello world application
> -		 * so simply inform user and keep going.
> -		 */
> -		dev_info(&rproc->dev, "no resource table found.\n");
> -		ret = 0;
> -	}
> -	return ret;
> -}
> -
>  /**
>   * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
>   * adds carveouts for TCM bank and reserved memory regions
> @@ -843,6 +816,20 @@ static int zynqmp_r5_detach(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
> +{
> +	int ret;
> +
> +	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
> +	if (ret)
> +		return ret;
> +
> +	if (!rproc->table_ptr)
> +		dev_info(&rproc->dev, "no resource table found.\n");
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.prepare	= zynqmp_r5_rproc_prepare,
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
> -- 
> 2.34.1
> 

