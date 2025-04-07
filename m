Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C5AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 17:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YZX8FTm7gnnATlvkEU+CvdZ8Zmrv4/GwdsExPDms+c=; b=o7wbMf0tGIp73gGbQ02hDiwW76
	bjjwUgwhwyjqqZS0HwCLBcwmxg/Pg1nM1KEwHfbpiH8+M9GtWCOUtE9fZP9YA67VSHLDXGxE+mHx/
	ZqzhFMop7VluSgs0/b36KZ1aPx1rMt/DK7Zgho7ZdsgCxMeXGDILJLB6c/F3qhSTMVRCVU/hjRNbA
	B0za8P8B3ArEnh5QINADFKEwiVAYXTd2gn2HNPQPtCfOuLJzAsYPnn1aMuxhgQM7DPl+qL4ryf9mG
	+7Ks2joO7SITa+qUYjv+ZSisTM013qdIloQT3GJHVE2g6RLn8rAUC08Dm2NS4Y02REq5pjBNRHjz+
	3uw0dOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ps4-00000001JQl-11Q3;
	Mon, 07 Apr 2025 17:02:52 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pAK-000000018J3-2Yeh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:17:42 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2260c91576aso37843315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744042659; x=1744647459; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YZX8FTm7gnnATlvkEU+CvdZ8Zmrv4/GwdsExPDms+c=;
        b=Y2lVe0Ed4LrS3xqkUgI8GTO/k+0qHlqmpbhbgD0cX8tNgnro81mRIeGvkt5APsRXXp
         YTxYn7LmmLKdb1b3RQllMElmu2D0B1sgX0MpXC3jIFAZF+dnfWMZGn48iEqpHDHYgrFL
         /wqArsFxnlaZ0zliC70LrCylCeo+DuPaWKXde/vib94TnebbmTeAg1mkbMi3duY7wrDU
         CICKuv2JfvHjbokhPZTBI51UpJIdVulkNGbVb89wEcKQZsoAtpuKJzuwkYmzbCgXswOg
         QxeZgXEGNK8YfEH85sa5yKvZm/hcxbcYCgc5sxObNUd/kuZKce5EFSjoceFkf53CAQUj
         lTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042659; x=1744647459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YZX8FTm7gnnATlvkEU+CvdZ8Zmrv4/GwdsExPDms+c=;
        b=G2zgzZuKQ7KUlB1VZy7CHhlObdde5BOo01K/itVMiH7xfA9ntwjt41i8Ye/A2cSmNE
         oReEvnOlc+PnU1vOUsOw4F2xFmD4U3waQb/1Js0NkSOsIP5H8YH3LR+IXV988IouYYvI
         TyLg0NxZ1JlyqiUIUYPQYtwMcvBljvqPhATN/o6CaR2aQzo39d87Qx64btEQxxvjp+bK
         qveXIHUJxxogQsGnkqLvZ5xCJPo9RVi4iQ+FxJd9TaLR7rcg3qdEQ+DFQaGKL/3ftgz9
         9rIlpumf8PZjpzeDrl+iBmEyPKSBZ1hiYSHMgAyHrN5akF+Dr8haav2wR4CYUpMjo54/
         V6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUvvG9g30pI6gFcLsLBoSlsHXJSluLOVCS17bfv/fHo+89ks6ES0kKDV3iX1YDMTDWbs/RG1kIjkKUWa7fPcKNm@lists.infradead.org
X-Gm-Message-State: AOJu0YyW3yb6Z6rHgiE894OKoNZ/Lj1oBxNib1GQsfLFjFURd39PPlVS
	GVV1qTxn5S5fd0lQPsQZJroyyWi5Oq81WaO1KZn6XmjHLI2Eht0DC867nTLq35E=
X-Gm-Gg: ASbGncvyXqe9boh7sf19iobwC4RqQn07jP1jAJ9hHL6MReKNh0N2ajQbG7Y7z9585/w
	8OtjQQSpP7nxdkzN99wVn9FOdqJHkax/d+M8oLH2kv0k5cIGjWECd03lXWIqNipzN6pUWRUJZ1b
	7Ntu2Db34j2b8Kjaf+BV6xyY7xCtuL6Odj+1CAytjp5VQeMufyo4ik6VKq3Yh85IM3mKitVuQEZ
	UdOohgVgEX00GgzUojCx6GhaNR3wJ3y35Iu6jVhHx+9m5bviDZWsf9FMtaAhvzXvU53H8Hji5KX
	NJMCtlAw1lHpLIexUuNgne8yohkLehGbX288MAqCTNwsRfM=
X-Google-Smtp-Source: AGHT+IGV6fnvs4sscSKdOoEFY19/hs9fXnSrUMMOtavJUI+vrIykhaiZctAqp+tkYlgjXDshCo3m3A==
X-Received: by 2002:a17:902:d501:b0:227:ac2a:1dcf with SMTP id d9443c01a7336-22a8a06b403mr178027265ad.23.1744042659200;
        Mon, 07 Apr 2025 09:17:39 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8a1d:e713:b97:3a58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7be3sm8995261b3a.175.2025.04.07.09.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:17:38 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:17:35 -0600
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
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z_P6n5wQfGuSmV2B@p14s>
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_091740_673488_01337B32 
X-CRM114-Status: GOOD (  38.78  )
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

Good morning,

On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
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
>  drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..80d4470cc731 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define WAIT_FW_READY				BIT(1)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/* This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host NOT to wait for a FW_READY response.
> + */
> +#define FEATURE_DONT_WAIT_FW_READY		BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
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
> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
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
> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
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
> +	size_t expected_size;
> +
> +	if (!imx_dsp_rsc) {
> +		dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> +		goto ignored;
> +	}
> +
> +	/* Make sure resource isn't truncated */
> +	expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);

Something seems odd with this check... I don't see how adding
imx_dsp_rsc->len with 4 will give us any indication of the expected size.  To me
two checks are required here:

1) if (sizeof(*rsc) > avail)

2) if (sizeof(*rsc) != imx_dsp_rsc->len)

Otherwise I'm good with this new revision.

Thanks,
Mathieu

> +	if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
> +		dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> +		goto ignored;
> +	}
> +
> +	/*
> +	 * If FW_RSC_NXP_S_MAGIC number is not found then
> +	 * wait for fw_ready reply (default work flow)
> +	 */
> +	if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> +		dev_dbg(dev, "Invalid resource table magic number.\n");
> +		goto ignored;
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
> +		goto ignored;
> +	}
> +
> +	if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> +		priv->flags &= ~WAIT_FW_READY;
> +	else
> +		priv->flags |= WAIT_FW_READY;
> +
> +	return RSC_HANDLED;
> +
> +ignored:
> +	priv->flags |= WAIT_FW_READY;
> +	return RSC_IGNORED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
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
> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.kick		= imx_dsp_rproc_kick,
>  	.load		= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
> +	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -- 
> 2.25.1
> 

