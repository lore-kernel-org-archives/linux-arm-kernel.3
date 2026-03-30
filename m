Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4D11061B14
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMohgIf2kDkk6Cae0YiULQonmSDmJhFZPXEiKdJxSFI=; b=IKE/uqXlP8+JL47vqdHWZ4vkat
	XgzttxJmLXvq3VwZHds9AqAQDtGKOm/8Ki8Q0pR0Cqvc4DqWZMJ6GTeJzUkgeeKgMQEdtuA6CYPe9
	nBWn3qhVh3M0Ly51yNW9mYDST0iqNE9Nzzij0XDHJSJb9xwXYEvM31ThTPXwpZ5ZveNHr+lUHWM7e
	tSqm1UzEiTs6DPYM12gUVkTVMXX9tuwzPZ/EQ0pAnIKs+8GbxndD8bIUTeijJteN8HeBUkKHs8T7s
	o3uPf+uffPmsdkDpwQKja8yOMGpVZ31SCbxzPeVoLi/oCBcyumgtUwvA2xl4pYN/v+5+XR49EJwEZ
	CH0oaYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FNz-0000000Be2X-0Fxs;
	Mon, 30 Mar 2026 16:22:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FNw-0000000Be1O-2dLU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 16:22:41 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1432058a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774887759; x=1775492559; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMohgIf2kDkk6Cae0YiULQonmSDmJhFZPXEiKdJxSFI=;
        b=ZD9pvmHVMOJIqDWb5KWE69kuht1oErhPMfotoTfx6d5M9Vrz/HM6JtTchmr38mk3Rr
         QoGv9neiGLKGDIhGbizaSXrxqY92HsuzjFTPfXVG5ZXWe33UKyScBWTR73v0V85NdkjB
         tV4SyFTgOXTRpLjzsJFSNLJ/vrORmd724UKF1EEzgKsyxVvHgU5vb54nTHA8LzjJ7Ojs
         wVpVQLv5zd/4hRCepUndMgmPZrD/MyxjCXxBJ4c+1dLgW14C/e6T1zIVTZxE8gtCS5ae
         oH0HOtUIvXkOyfR4Wrdt3S0kD1GSCgfYEfJD/o5R2bhtSZPzsT5eEqJ8TAj2sPW1nckb
         9/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774887759; x=1775492559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMohgIf2kDkk6Cae0YiULQonmSDmJhFZPXEiKdJxSFI=;
        b=NLY0KO1ViBE6ekx61qV8oXqBT9AlAgqmalYOrgrEmNwrl8dRsT0DipHwgn6oudrikD
         x4OL6ykShh91jIA6NZwjVcu5FF8kqcazAeoGbYIO0KjIvEkleAywbP0yxjgpRmRLsH3U
         XyXMvS/MiRoI0IZUYskSoIUgNZQzeF0Rr9kY6MyzDOhger29BcGqFReDuYFKbu3hF0f2
         CkL68Wmva8+6A2IqIHtWrdf1yLyQL3db/GZOQU6gMIaRTc24T0fHqK6EFwYmFaZdVyH0
         S/wrb9wU+mm3i38efInf2Rp1JqaVrSnMTufg3L0R4zAY7VGZHhzcsl2T6BX9D+TCrXMA
         QSjw==
X-Forwarded-Encrypted: i=1; AJvYcCVNy6W3ZxXvws+Cz/hEl3mZiym8arD6/mNgps215jTmOogXCce98Nl3sEetrxe8qTo7oi11snxkW8nbLpNrUZcd@lists.infradead.org
X-Gm-Message-State: AOJu0YxM243ySiXugaNdQ7OcV7Mv7+KtkR2BusNvNwVfhfoC59+JPqeV
	UyycWFkoYrq3jtmSFtzNP1MqRYwYnb3wS6f1qBBmyqplZeJmCWQp1ec3bkO3pPAUyt8=
X-Gm-Gg: ATEYQzyKahOaRBhoFTgIB/jAKeKzsx+mLcyi5Ii311dfXX4R77z+smOr0y/e+YNZNxm
	2K8sZ4iem/fuUBgR7L16lJ7ekzsIldOl41eUBsIjqv8QkF64ERQHKjfnCqp38j2BKagNqOZb7w3
	5I5O+XPRRHdtAmMB/nsKKsc2RuLpgsi14JP/PiBCxNKWBAj2hFWXkK653WdYS+MsrWtNc8kzQ54
	nV0HIBBHLsfS7265KPh+jPocvvzxM5l6GuuDajy0CQhu6jMc+K0sSVx+q8DsNY4HAXcjBSNXl78
	Bd3OsaX1ODkx3FXUVXBY8a70Pf/vSw5M4xW4tDzMzz322N+5UuNVmytqi0MifabsCBSAPIWKxI+
	kyUw0t9FxqdiARGHCSy1N4EJUy8t46+6rlDzMF79Eaak4iUqM9Bju+T/jXAoXpgjqhH/N2Sif0c
	mROUpHMZIGj7xpvz9+9JX4yIw6Jm8=
X-Received: by 2002:a17:902:e843:b0:2b2:5428:ead8 with SMTP id d9443c01a7336-2b2542902d6mr38590925ad.0.1774887759333;
        Mon, 30 Mar 2026 09:22:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e8c9:5e1e:f42a:2b73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24268aa4fsm83826645ad.36.2026.03.30.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:22:38 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:22:35 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Pass bootaddr to SM
 CPU/LMM reset vector
Message-ID: <acqjS440STRl2sK2@p14s>
References: <20260327-imx943-rproc-v2-0-a547a3588730@nxp.com>
 <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-imx943-rproc-v2-2-a547a3588730@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_092240_713207_AFD76DFB 
X-CRM114-Status: GOOD (  31.79  )
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

On Fri, Mar 27, 2026 at 10:42:03AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Cortex-M[7,33] processors use a fixed reset vector table format:
> 
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
> 
> In ELF images, the corresponding layout is:
> 
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
> 
> Reset_Handler:  --> ELF entry point address
>         ...
> 
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
> 
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
> 
>   ELF entry point:     0x0ffc211d
>   hardware reset base: 0x0ffc0000 (default reset value, sw programmable)
>

But why?  Why can't the ELF image be set to the right reset base?
 
> To derive the correct hardware reset address, the unused lower bits must
> be masked off. The boot code should apply a SoC-specific mask before
> programming the reset address registers, e.g.:
> 
>   reset_address = entry & reset_vector_mask
> 
> Current driver always programs the reset vector as 0. But i.MX94 CM33S's
> default reset base is 0x0ffc0000, so the correct reset vector must be
> passed to the SM API; otherwise the M33 Sync core cannot boot successfully.
> 
> rproc_elf_get_boot_addr() returns the ELF entry point, which is not the
> hardware reset vector address. To derive the proper reset vector, this
> patch introduces imx_rproc_get_boot_addr(), which masks the ELF entry
> point using the SoC‑specific 'reset_vector_mask'. The resulting reset
> vector address is then passed to the SM CPU/LMM reset vector API calls.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 17 ++++++++++++++---
>  drivers/remoteproc/imx_rproc.h |  2 ++
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 0dd80e688b0ea3df4c66e5726884dc86c8a5a881..d8ead42640881bd523d605fa7002935ef6e98077 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -345,7 +345,7 @@ static int imx_rproc_sm_cpu_start(struct rproc *rproc)
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	int ret;
>  
> -	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, rproc->bootaddr, true, false, false);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
>  		return ret;
> @@ -365,7 +365,7 @@ static int imx_rproc_sm_lmm_start(struct rproc *rproc)
>  	 * If the remoteproc core can't start the M7, it will already be
>  	 * handled in imx_rproc_sm_lmm_prepare().
>  	 */
> -	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, rproc->bootaddr);
>  	if (ret) {
>  		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
>  			dcfg->lmid, dcfg->cpuid, ret);
> @@ -739,6 +739,17 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
>  	return rproc_elf_find_loaded_rsc_table(rproc, fw);
>  }
>  
> +static u64 imx_rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	u32 reset_vector_mask = GENMASK_U32(31, 0);
> +
> +	if (priv->dcfg->reset_vector_mask)
> +		reset_vector_mask = priv->dcfg->reset_vector_mask;
> +
> +	return rproc_elf_get_boot_addr(rproc, fw) & reset_vector_mask;
> +}
> +
>  static const struct rproc_ops imx_rproc_ops = {
>  	.prepare	= imx_rproc_prepare,
>  	.attach		= imx_rproc_attach,
> @@ -752,7 +763,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> -	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.get_boot_addr	= imx_rproc_get_boot_addr,
>  };
>  
>  static int imx_rproc_addr_init(struct imx_rproc *priv,
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index d37e6f90548cec727b4aeb874680b42af85bdbb4..0d7d48352a1091ad24e8e083172ce6da6d26ae10 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -41,6 +41,8 @@ struct imx_rproc_dcfg {
>  	/* For System Manager(SM) based SoCs */
>  	u32				cpuid; /* ID of the remote core */
>  	u32				lmid;  /* ID of the Logcial Machine */
> +	/* reset_vector = elf_entry_addr & reset_vector_mask */
> +	u32				reset_vector_mask;
>  };
>  
>  #endif /* _IMX_RPROC_H */
> 
> -- 
> 2.37.1
> 

