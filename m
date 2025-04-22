Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D3BC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYHxgDGXO5+KmD5hIUPp/Tj+/YwJQfgj9/mg6ZyVl2Y=; b=0jn+OPRg8jljCybysV9LZYULLx
	3m2ve3Y1Y4kvtQgwwtoljEPR7BS3oq35/uiBpWEw4IaJmBNx//FsE+TCxgfUrWGiYCm4/LctXuB6U
	81F2afhPkzFEHfPSifo/a+UyUgNaE/k2FKNWqCzQcL7lGW7W8R8F1fxt1no1Zce28hYm27IpLDsLv
	ZZNnT3jWM7Pt1T9S4+Asnf2bI/R2AlsmqenaXLLBLMGZC2rM32iSsW0NttqCL1TTFLpxhjfkuJDz/
	0FxjmUAgfCgZkegEc/qOh5buoaLdJUK2vwYqa519L1DFV8ftiuXm5wJyz5iycuJTjhZ0YG3ZXIC9P
	IkbCx1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GkB-00000007xeI-344B;
	Tue, 22 Apr 2025 16:45:11 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FVu-00000007hu1-1r4d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:26:24 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so4441531a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 08:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745335581; x=1745940381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYHxgDGXO5+KmD5hIUPp/Tj+/YwJQfgj9/mg6ZyVl2Y=;
        b=QA8BlkgUq0KHmb/FrOb4g50RIl+jyVyEYH+oI3tBztemHA31b5pqTyYiKyHjnHZNPo
         iusxCCiZeo9veY4Ucn8SD9rfV5ADzVKJU0dC+pIjN5mz8Xplf8EhSLnRpDZ81O/WE09Y
         UgAauRiTuhApQuy0oONnL0CwXN9eALwI+0uYl6YZVQ9X43ZdoYdPNFKrlZdRLHzCfzuK
         zy/lIaQlJMXbuDTZLhjNyPnpKE8ZLZryn4RbPyFez9noIxCNz5Ic3PAZjd0ncg5vyHuO
         r6EyfLCquzsSumjlrM5i+LA3nVUL1kzYnGrHcgn2I8C5bhU7y7vxUFDVYh/IOOBLq6/M
         +kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745335581; x=1745940381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYHxgDGXO5+KmD5hIUPp/Tj+/YwJQfgj9/mg6ZyVl2Y=;
        b=eqWhudk60JpNEhS+SY0FedOUwxKjpXW51FyhS2j+42G2as9hNoVpF/frhESsFvZMuo
         h7nEkE+VctlATEGJRpl32O3k5C8MeN6mHP04genGm4QBDUZpyyvlFQpv4y7R0lyapTZL
         Rx3hR8MdoEcBnabgoMiWF4JGelP4ZZHeyGb/TRbQZJW1DDDhH2sb/Irvli7+i+BRjwU/
         7ua/+xYA0ieSGu+n3oJIXQf7Lacc7motr0Khs2nzkfeKwYBJNDgXvNWoAnw+MnvyWOHT
         BWy+q+wbgQQRT4yC0g/Sl95xlndsddXdVMQwmTHLZkjYZwuqDBps6Qhdax1uCVqdtGl2
         D5ng==
X-Forwarded-Encrypted: i=1; AJvYcCWGTijXoDsXAG658/xn4oCIdVvxuwJFKhvu02tDbW60Aw3/3PLehhRvBAwnhgzodH4qy2TLAxXXPcyoYV6OoiWY@lists.infradead.org
X-Gm-Message-State: AOJu0YxriSR0pUAgZA236WB5+GpT8yRXVwDKyPsK7axExnKSU+fiYlpk
	CB68B+iLWrDolIQAD/ADvZEqObUxoPaBINTsTk/So4gJ8MUYiiPayC5wQwfcDGE=
X-Gm-Gg: ASbGncvEUZJBnt0GVJCWEMfizHSZkjV1g1HbwLsEqR/GDkh0PUh8HO+n14sD68t8XeI
	8by5MqO8tdEw5hYLHT233rVanzTIPhuSiv6b8IutYfx8dTO8tw9bisZdk/3ThBle0v5nuTo2ffL
	eeBA/0D0VpbJRPJi09ENEDim4W3L7QONgYL9cMRuPc+NP1FkM4k11hU1Jvn8eDKrmmvf6nlBgbh
	twPocW8tDRsRR7EkBx+1gDZMboIzdf9Yl+nhNZgal1QihpRTzXkqz41bKUKfiVsewXrcOcTlNri
	wwC3SKbA393YUPxjX0EBWfaCT/iDcruoGPl/yQvE73Me
X-Google-Smtp-Source: AGHT+IFKdPqXfG2PDOZJlWrx5F/OcrmgSWRYGt4yShrlHtNv9ZIbsa8RQSsnfUd0cOhJjZ0RKioIng==
X-Received: by 2002:a17:90b:270b:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-3087bb422e9mr21115170a91.3.1745335581018;
        Tue, 22 Apr 2025 08:26:21 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2e83:e5cb:87bf:4641])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e0febd4sm8823408a91.36.2025.04.22.08.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 08:26:20 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:26:17 -0600
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
Subject: Re: [PATCH v5] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <aAe1GUqYT_Iv2ZmB@p14s>
References: <20250416075613.2116792-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416075613.2116792-1-iuliana.prodan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_082622_489515_9DF84BA6 
X-CRM114-Status: GOOD (  40.19  )
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

On Wed, Apr 16, 2025 at 10:56:13AM +0300, Iuliana Prodan (OSS) wrote:
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

Applied.

Thanks,
Mathieu

> ---
> Changes in v5:
> - Reviews from Mathieu Poirier:
>   - ensure resource length matches struct size exactly.
> - Link to v4: https://lore.kernel.org/all/20250409213030.3489481-1-iuliana.prodan@oss.nxp.com/
> 
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
> index b9bb15970966..a16d9c4238ed 100644
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
> +	    sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len) {
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

