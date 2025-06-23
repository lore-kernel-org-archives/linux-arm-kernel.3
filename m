Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD06C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 20:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B76lja0U3ricMA/lF4InrpybN1h1UBAY2Q/OqGGhKjs=; b=xvC7liIR7tbDk0VW8uFYx0AK0r
	w4T5XjbkMKNg8B6s4yLrIFnZ0p8ECkkX6Y6r433Kbx9G54h8h6yKBYhNH+L5/Y8DKu53skI6dio85
	BSZGJmSyi7z5BAydxUR61tbhic470xHuCHfrFgKKJtevJ8aDzdVDqzpbN+ndrQepz3uIZ/qcxkI9E
	AwsB3VdYShB0k9I7w2RROj3Oz1eqyNoOUUvEAIj3jQyHjDTJ+xY0qCgvnG+t70ZKgA+YLOGAKAIPX
	LZ8V7fbxvb6a/r6QGccqH07QxBahUdBvuB8UVRIwnf0qXoOphr/Yc2qrMD6hIHLFLJanac9DSYP2Q
	SjPKDxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTo26-00000003wq9-0xia;
	Mon, 23 Jun 2025 20:44:50 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiiy-000000039nk-29Ve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:04:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso2778561a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691083; x=1751295883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B76lja0U3ricMA/lF4InrpybN1h1UBAY2Q/OqGGhKjs=;
        b=iz/0/JQ1T8oKq6eVgfpVBPsfqljSz6i0PsoHHKO+4Id+kyDXpdl3aEQRQF+Ggay66t
         DKlr3p8dcETqrxrYAT7rNuOHd728+ljTuRPtiUqsvZnDqrn91pBZxhMmRuy5tzw1WoMU
         n0DiJG9lPCf/6yT7VcnddzMvjd1bxq6uHeMUvMDt+9vf816g9hRQbxxEO+5UT5rT29In
         XbCHtFx9GZoaxilsqzGae5HRe+XDPkm7nyhhfru65PcshP/8Yvf3GSNZb9CNyGCLYvs4
         pVcUT2YnaoeckZLcLQe0kH0WpwlT06KWZnL+y8H7zFq5PJzMY2Nng7bkDV4eqOLnqrXC
         trYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691083; x=1751295883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B76lja0U3ricMA/lF4InrpybN1h1UBAY2Q/OqGGhKjs=;
        b=O9K5hI51UvHwPf6J6abjR4CU7i2iq8OvHrXNuYonLFIQZ65xHVZFFCyS5BbrxuFm1i
         FKWhA3Q7eysQCEqt5PD33FtBu3leSjxG0avXCqXwkyG7yjnKKyAvG/HMARZrsGYTyCCx
         Jr0ewGGLBniWEQpINPu+ER9PlN9+7Zhkp3gWDeaoZUz91sxsyMeWnY4PfUvhK3pUVbM8
         Fw4h/y2nIta0jFY9yZsYf0puBcKIbjdbB5+IT2v1vRy/o9Y44Bv6AZSD0TnJMyIrK+4c
         qny5caGQdrN4YBOjO9B7wWvx/dO61eIJRDzNynvTJVbtV90LoFBOSHkfWJT4Cl5ooXE1
         aKig==
X-Forwarded-Encrypted: i=1; AJvYcCWgaUAbBCW45Aie5q9VqX2SxB5+DngO/eS82jgRfmsBDSdSmouQjH5uu+n5Fy0PhbNf8hWTse17Jd/S1o26qBNW@lists.infradead.org
X-Gm-Message-State: AOJu0YyFCT31H/MZQv+Y3IQyiVFDFiBOup6Tf0w//nb9eC8cSM8H5H53
	oNkSJvEAsLCsj6LIWCppbfsUoiyjHlIuwyiOhmcqYBS4ejLY8epBRtU3vkaa4n071U8=
X-Gm-Gg: ASbGnctuJ1rpd63DPyAiRdWl91Ho0RcPwz+s8/8TeqfCAx37Pclc2JefOJR28Jdq5Sg
	iAZHMfRcgQSp23s2L+skDJ9RwFfjTKPYCMvFqjasYe4NeO0bAFHq9Mjng7q1gEArPsrz/0yzvqD
	S9glRV1yXhYDM9XqPlKhHj5+g9FtVi8RB8yuzyJK2272BOMVcgxH9pTOs3iiOGV0bKu3h1WLEB9
	j9sauVOEnLoQN7nU7p5LzVoMapwqoofMzp2MvE4C3pHrMl9j+/yj5aw+Ue24VFKbpVjFXmgdKcC
	ByZrgIg7AI4ek/LGyGY15UzbfyYyq1sqm4ZrsqNIKvlE0pOklk2fkfveH0qn2WXn
X-Google-Smtp-Source: AGHT+IHu9l7433gn0EAnhgFKQwsCXxEvdTHaeQKvMja0m0uBJNnzDbAjryY/LtbMGvfQPZ0rPzoLLg==
X-Received: by 2002:a17:90b:3802:b0:312:e8ed:758 with SMTP id 98e67ed59e1d1-3159d64cb4cmr21178261a91.13.1750691083145;
        Mon, 23 Jun 2025 08:04:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e07d027sm8343474a91.43.2025.06.23.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:04:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:04:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery
 process
Message-ID: <aFltBpXuEXVZ5gKn@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618062644.3895785-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_080444_577062_76556149 
X-CRM114-Status: GOOD (  32.55  )
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

Good day,

On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> when recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow.
> 
> So power enablement needs to be moved from prepare callback to start
> callback, power disablement needs to be moved from unprepare callback
> to stop callback, loading elf function also needs to be moved to start
> callback, the load callback only store the firmware handler.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5ee622bf5352..9b9cddb224b0 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
>   * @ipc_handle: System Control Unit ipc handle
>   * @rproc_work: work for processing virtio interrupts
>   * @pm_comp: completion primitive to sync for suspend response
> + * @firmware: firmware handler
>   * @flags: control flags
>   */
>  struct imx_dsp_rproc {
> @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
>  	struct imx_sc_ipc			*ipc_handle;
>  	struct work_struct			rproc_work;
>  	struct completion			pm_comp;
> +	const struct firmware			*firmware;
>  	u32					flags;
>  };
>  
> @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att_imx8ulp[] = {
>  
>  /* Initialize the mailboxes between cores, if exists */
>  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>  
>  /* Reset function for DSP on i.MX8MP */
>  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>  	struct device *dev = rproc->dev.parent;
> +	struct rproc_mem_entry *carveout;
>  	int ret;
>  
> +	pm_runtime_get_sync(dev);
> +
> +	/*
> +	 * Clear buffers after pm rumtime for internal ocram is not
> +	 * accessible if power and clock are not enabled.
> +	 */
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		if (carveout->va)
> +			memset(carveout->va, 0, carveout->len);
> +	}
> +
> +	ret = imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> +	if (ret)
> +		return ret;
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		ret = regmap_update_bits(priv->regmap,
> @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  
>  	if (rproc->state == RPROC_CRASHED) {
>  		priv->flags &= ~REMOTE_IS_READY;
> +		pm_runtime_put_sync(dev);

From this patch I understand that for a recovery to be successful, the
remote processor _has_ to go through a hard reset.  But here the PM runtime API
is used, meaning the remote processor won't be switched off if another device in
the same power domain still neeeds power.  If that is the case, the solution in
tihs patch won't work.

Thanks,
Mathieu

>  		return 0;
>  	}
>  
> @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  	else
>  		priv->flags &= ~REMOTE_IS_READY;
>  
> +	pm_runtime_put_sync(dev);
> +
>  	return ret;
>  }
>  
> @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> -	struct rproc_mem_entry *carveout;
>  	int ret;
>  
>  	ret = imx_dsp_rproc_add_carveout(priv);
> @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  		return ret;
>  	}
>  
> -	pm_runtime_get_sync(dev);
> -
> -	/*
> -	 * Clear buffers after pm rumtime for internal ocram is not
> -	 * accessible if power and clock are not enabled.
> -	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> -	}
> -
> -	return  0;
> -}
> -
> -/* Unprepare function for rproc_ops */
> -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> -{
> -	pm_runtime_put_sync(rproc->dev.parent);
> -
>  	return  0;
>  }
>  
> @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	/*
> +	 * Just save the fw handler, the firmware loading will be after
> +	 * power enabled
> +	 */
> +	priv->firmware = fw;
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
> -	.unprepare	= imx_dsp_rproc_unprepare,
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load		= imx_dsp_rproc_load,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> -- 
> 2.34.1
> 

