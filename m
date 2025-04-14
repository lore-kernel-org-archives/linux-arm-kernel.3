Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F48C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elgj3ZOFdOekNxu9YHg784/p7U8yNMODKbzLcLEGcmw=; b=qvhEz/SWihjvSX4jDmq7kVQ1vH
	rsQJBGZN3SswJ1M2KLuIZ4HyR8w5C690MmtDzFO/uh1M+99EbyZyIZIQTDq7SkaJ+9mCi9j7PKIMt
	cVPPFj6jpCmvMX/psS+tSSPxiN0pi3rZv3mxL6uEVJNylkJQEyIwPdwWNerazy7IjucfkMu2a8vIS
	UIqQy3jce8E87tiPz+rjZ/f4e1Cwy+X/D1I8OJ5AyXx7spFMZdm+dXfkfzFJ/LNfpE+qfVvynWzr9
	WIHeg8DXvauS+3+ML+McT3Na0K+RW1L00ysq0AuYpsmLn0E594q6zqp90wfdGn5p7Qb1pw1X2AKRF
	8LVOLIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Lxw-00000002g69-0lAG;
	Mon, 14 Apr 2025 15:43:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Lw3-00000002fn2-2ltA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 15:41:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22409077c06so59562435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744645282; x=1745250082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=elgj3ZOFdOekNxu9YHg784/p7U8yNMODKbzLcLEGcmw=;
        b=Yqq4pGSkL64PRz0RECuRDHZM6/TSboL8M85/ha4alu6YcFmQj8N+qsWkQ44tdaMQiK
         zY+2NIWgEWCI3Kfw8rz8cNDuIsV3JHPhTu3Cqv6UgggNJj/8BisfZcAGkoLrJ8pFQnWt
         PXHQP/K/aw8qM/mr6ZqtabYgEbzt/+aloTsT0re1PlbvL2wjon7tLJQ+iI6alfvKb0/W
         eZUhorNWSqac+NqdsCe26qc7icawRrribrQfu909CnE2w6tG8WyS9nRxRj9fvM3q3O6q
         NyLXn/Xw9i2XEVwNg4HMTzxEYbttcNhfobOFvcZXt3OED/704AfOgnH1iYhmYrOtf9qM
         5KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744645282; x=1745250082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elgj3ZOFdOekNxu9YHg784/p7U8yNMODKbzLcLEGcmw=;
        b=pNGR8TeR2yHyJEy2vYeRB/DSB1eYMj2ZE1EZSBRnZtKO77pyAY9dR/IA2VuvrYh1aE
         hKHWelg56TuXqu4AbA5xPARrXS/CQLr5l326qCU345bhetvXR5AIrSdqWGGceon5dVJL
         bDl0/w1o6QWBlJ6wHxOKrtT1UZohgSSFH+JlLwT5zbJ/PacvkNJ6K9vcS3SyEIkUSMdf
         L+FuhbFBO5dkLmlelCnaFxmo51TiA4XLdaCUW+IptAlEaA2lM6lca8ku9uBKmGcFPsDz
         gr+UOIuexE+ffLbwmGWTJGNzhUosjwTux+UgOK9DgCwYva3bnI8VyPH83PbgSuZwPFS0
         2HBg==
X-Forwarded-Encrypted: i=1; AJvYcCXz8SnoY/ygvag1ws3uEXv4P/CPyD39eFBNGIZqQR8+3AFsfxkFqowt3wR7UK5kqdclaZD1LglvY75xplr+mMqU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxiee2U2EuFvvazgj5w+g8bkXBRcmsuuT4k1VLbzpw5W7rT1UL9
	8ivccQFp4aPlQ+tN11/pmfZXK48QSKX7uxSejHANkSk9S3mxIrBLvzpX29k7ma0=
X-Gm-Gg: ASbGncuPnd92wCA3NirJRdYAdS6+uP4evLrIBW1cHCG6zG6v/E23ibY6q09+nbTawkB
	88yZ8iHFSoubEbOejC4tVm2oTFUuSuBdPPHOeQxWB8AY2FQ6ddhK4+ohqsLzSZ2cWqDYQ+lfxTl
	HKlESinYOIoKNHeqclvt534BWb0kpnwBHZus35Pvx4c3JiDHHfOXj/pTup8nrCPDYrNWKjBvpT/
	Pe1sodVtbgLRmvnPdhu2t/iQwfQKxCELyT3wEGIIywAK4/igJ0hYZTUyBmqd9lgLfPqdV2bwjdh
	pVd/ETq9mJrAUQJyRz+7WYVW4lG2V96hOKsOcAincQ==
X-Google-Smtp-Source: AGHT+IFmaJd8K2wTbkQ9KfdS3yzMTir1mRSVtiN6w//mvc5Njk/mc7f9WAGT+beU7YlMLRaLsVEzWw==
X-Received: by 2002:a17:902:e842:b0:223:5c33:56b4 with SMTP id d9443c01a7336-22bea4ad1abmr164559865ad.20.1744645282220;
        Mon, 14 Apr 2025 08:41:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:cc1f:6a:9d70:9f8b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbfacsm99984745ad.249.2025.04.14.08.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:41:21 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:41:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mpuaudiosw <Mpuaudiosw@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>, imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v4] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z_0snwzpkPTJqjWX@p14s>
References: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_084123_731643_338F4282 
X-CRM114-Status: GOOD (  40.07  )
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

On Thu, Apr 10, 2025 at 12:30:30AM +0300, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Some DSP firmware requires a FW_READY signal before proceeding, while
> others do not.
> Therefore, add support to handle i.MX DSP-specific features.
> 
> Implement handle_rsc callback to handle resource table parsing and to
> process DSP-specific resource, to determine if waiting is needed.
> 
> Update imx_dsp_rproc_start() to handle this condition accordingly.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> Changes in v4:
> - Reviews from Mathieu Poirier:
>   - Adjusted len to include the size of struct fw_rsc_imx_dsp.
>   - Updated len validation checks.
> - Review from Frank Li:
>   - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
> - In probe(), set flags to WAIT_FW_READY to ensure the host waits
> for fw_ready when no vendor-specific resource is defined.
> - Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/
> 
> Changes in v3:
> - Reviews from Mathieu Poirier:
>   - Added version and magic number to vendor-specific resource table entry.
>   - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
>     - By default, wait for `fw_ready`, unless specified otherwise.
> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
> 
> Changes in v2:
> - Reviews from Mathieu Poirier:
>   - Use vendor-specific resource table entry.
>   - Implement resource handler specific to the i.MX DSP.
> - Revise commit message to include recent updates.
> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..e4212e624a91 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define WAIT_FW_READY				BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/*
> + * This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host NOT to wait for a FW_READY response.
> + */
> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
>  
>  #define IMX8ULP_SIP_HIFI_XRDC			0xc200000e
>  
> +#define FW_RSC_NXP_S_MAGIC			((uint32_t)'n' << 24 |	\
> +						 (uint32_t)'x' << 16 |	\
> +						 (uint32_t)'p' << 8 |	\
> +						 (uint32_t)'s')
>  /*
>   * enum - Predefined Mailbox Messages
>   *
> @@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
>  	int (*reset)(struct imx_dsp_rproc *priv);
>  };
>  
> +/**
> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> + *
> + * @len: length of the resource entry
> + * @magic_num: 32-bit magic number
> + * @version: version of data structure
> + * @features: feature flags supported by the i.MX DSP firmware
> + *
> + * This represents a DSP-specific resource in the firmware's
> + * resource table, providing information on supported features.
> + */
> +struct fw_rsc_imx_dsp {
> +	uint32_t len;
> +	uint32_t magic_num;
> +	uint32_t version;
> +	uint32_t features;
> +} __packed;
> +
>  static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> @@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	return -ETIMEDOUT;
>  }
>  
> +/**
> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> + * @rproc: remote processor instance
> + * @rsc_type: resource type identifier
> + * @rsc: pointer to the resource entry
> + * @offset: offset of the resource entry
> + * @avail: available space in the resource table
> + *
> + * Parse the DSP-specific resource entry and update flags accordingly.
> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> + * to signal readiness before proceeding with execution.
> + *
> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> + */
> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> +				    void *rsc, int offset, int avail)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +	struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> +	struct device *dev = rproc->dev.parent;
> +
> +	if (!imx_dsp_rsc) {
> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> +		return RSC_IGNORED;
> +	}
> +
> +	/* Make sure resource isn't truncated */
> +	if (sizeof(struct fw_rsc_imx_dsp) > avail ||

We agree on that part.

> +	    sizeof(struct fw_rsc_imx_dsp) < imx_dsp_rsc->len) {

From the above, "sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len" would be a
valid condition when it clearly isn't.  I am still convinced the only
valid option is:

            sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)

I am happy to change my mind but would need more information.

Thanks,
Mathieu

> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> +		return RSC_IGNORED;
> +	}
> +
> +	/*
> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
> +	 * wait for fw_ready reply (default work flow)
> +	 */
> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> +		dev_dbg(dev, "Invalid resource table magic number.\n");
> +		return RSC_IGNORED;
> +	}
> +
> +	/*
> +	 * For now, in struct fw_rsc_imx_dsp, version 0,
> +	 * only FEATURE_DONT_WAIT_FW_READY is valid.
> +	 *
> +	 * When adding new features, please upgrade version.
> +	 */
> +	if (imx_dsp_rsc->version > 0) {
> +		dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
> +			 imx_dsp_rsc->version);
> +		return RSC_IGNORED;
> +	}
> +
> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> +		priv->flags &= ~WAIT_FW_READY;
> +
> +	return RSC_HANDLED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (priv->flags & WAIT_FW_READY)
> +		return imx_dsp_rproc_ready(rproc);
>  
>  	return ret;
>  }
> @@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> @@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>  	priv = rproc->priv;
>  	priv->rproc = rproc;
>  	priv->dsp_dcfg = dsp_dcfg;
> +	/* By default, host waits for fw_ready reply */
> +	priv->flags |= WAIT_FW_READY;
>  
>  	if (no_mailboxes)
>  		imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
> -- 
> 2.25.1
> 

