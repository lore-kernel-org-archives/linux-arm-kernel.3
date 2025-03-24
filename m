Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8325C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5vgk90XdjvD//xy5cJrxojmSgOgyA8sd6HdwMa8sAQ=; b=W0yuc/p301tr765QDFHDGnUP6M
	Ltz5ogmtNUNoJJeWMQ4/nX92hym3jDJY9B1WRGjMrJX0TNa4fZCnaysinuHTeP1DEKcXF/wCAIRlp
	zlI/UdGl3XotfTKwgxT4zq1ofWk28FWjQY/N4oEEGqTn/swJBhFX0tcaMYq4fHqO8AhWgMhGWEgLl
	Ahzo3jwQbBuqkTNsTgTUxAwIsL2X1R0gySI1m6FD6mZWLK0az9RLRCJdo7T1BKMhB9CaJuliDQvTT
	XSpLOQHxPc1q1FTGo+iZh3zfszHAYSwLy60GYeisA03PBhnVHB73ewXrmbuoaO9FnmS7pb64Ogs0P
	ExTHAjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkW8-00000003cCU-2j7e;
	Mon, 24 Mar 2025 16:19:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkOG-00000003b5h-1CG0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:11:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-225df540edcso109040015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742832662; x=1743437462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r5vgk90XdjvD//xy5cJrxojmSgOgyA8sd6HdwMa8sAQ=;
        b=v+3/UteBCtYYPLvTVsNjEDD7Kb4cBR5PCx+RVlDoC/V788OC3H4WRugmybM86jmzc5
         2ok2DJpo1FIaGc08zhOOgu+ViNgxgR/hga/Bp0nBCGzz+/O3J3LVEhWOSyd1Snn1Z5na
         1IoVpAVraj4v11/qS6JO289eKiza1D4Ij/lRFHjVMbG/noWqGn2WEFKgk8n3mFcxPB6P
         +8h5xWUwUyZYtsGQVsr3VyLrwkbaUGgmXq4VyBooQYQDJwW2YDUp225vmZwsJP13E41I
         fPlomdIVmzJsm2AZvrt4EBxOVt32UZRGomUzeMOETRA1zC15YEvEalbjp6y6d1AtBjcp
         ClIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742832662; x=1743437462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5vgk90XdjvD//xy5cJrxojmSgOgyA8sd6HdwMa8sAQ=;
        b=dwlPG5NhXT7e8ZIeUtxfGtatyukvRVUsdkilu5pynm4/INdz6DWyVo7udsiuqYJ4St
         9JnPRQ3G7+RkMeM8uB4KxA2gTFIjjMotx6V1Kv8W06+tEjhnVrXfkxzTe/+mKvLp3+3e
         aPbGGHwUK6kPLtWJLuf2DvJA2Tb63QMiU/H5c8qwdiBVKHPpa4qYdJ+tof+Qoy5Pjz4D
         Z4KVUx23vMP6154NPw1NppnI5ep7YQ01eMh1kxUoLDD5J7r21LH4UjnyPIgxiaaLb8OO
         rCsuhIv/Y4hnFMyN1k+q9c2FC2wL0Ky00sTtDRJ7OVXrpCJqhqG+2hhwKNj2MuH4a+gm
         Ry4g==
X-Forwarded-Encrypted: i=1; AJvYcCV/h/EKDFfRC1+L4d/9gsgp1LyUuLxQov1bBKoq06C4w3d4/+TyXA/1nJYr+w9PwusJuG+DCJUoX6kM1DWIW1dE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9SBHK74vhvdigqJP9iVsp48dyqLeS572qy7FLxZsBL4v5lW6/
	PQLda/gAdsf7u6Cob0ZwGdmcwIohkY0AtckI0Xp1ozx7xkvH12Df4meCxhvXt7Q=
X-Gm-Gg: ASbGncvweg9WYTFtALeq4y6/RhfmiZ2OczooTXFBgsb9woxZNSu4ArQrH3B+vI5XrqV
	ZJ1v6gf8LrYyU6iey+FhYahwM6x2RPMhDZ5desZKpYdp0iehSi+JeRtkw9rIkM/kgLbSBH30Iud
	tLizuEjC8aQqmfhUB9JfIHjCsYzpc2gNxtRnDT+pJGjJTFCT7iLXCHFVkUnYlD3qqgWIa9HN5al
	iHRJYrBf1uKIM9zdrFODLJ/58iczQZFfTI/hqvGJdM4GRGrVdr4Zzvqvq57u998lrzcg/NrezQf
	Gqzp5JkGIP6lPFPfCB7qKV+97KCLdMCyfN+alsZj/Y5pq6PD
X-Google-Smtp-Source: AGHT+IEUktCIjYcV/UliuBFwLd7ktQyPdWhUBdENSBLSBk2b6FUGTx7qO3Kt+i5xGhua1KlGlHJUIg==
X-Received: by 2002:a05:6a00:4648:b0:736:491b:5370 with SMTP id d2e1a72fcca58-73905a28b22mr22284141b3a.10.1742832661421;
        Mon, 24 Mar 2025 09:11:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1300:9465:2fd2:e14f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390614afb5sm8086630b3a.121.2025.03.24.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:11:00 -0700 (PDT)
Date: Mon, 24 Mar 2025 10:10:57 -0600
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
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
Message-ID: <Z-GEEVMXUysX1Hhu@p14s>
References: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318215007.2109726-1-iuliana.prodan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_091104_341293_98F0003B 
X-CRM114-Status: GOOD (  34.06  )
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

Good day Iuliana,

On Tue, Mar 18, 2025 at 11:50:07PM +0200, Iuliana Prodan (OSS) wrote:
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
> Changes in v2:
> - Reviews from Mathieu Poirier:
>   - Use vendor-specific resource table entry.
>   - Implement resource handler specific to the i.MX DSP.
> - Revise commit message to include recent updates.
> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> 
>  drivers/remoteproc/imx_dsp_rproc.c | 59 +++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..1729bfbc602e 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
>  MODULE_PARM_DESC(no_mailboxes,
>  		 "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
>  
> +/* Flag indicating that the remote is up and running */
>  #define REMOTE_IS_READY				BIT(0)
> +/* Flag indicating that the host should wait for a firmware-ready response */
> +#define HOST_WAIT_FW_READY			BIT(1)

Right now the default behavior is to wait for a ready message from the remote
processor.  We need to keep this implementation in order to remain backward
compatible with older firwmare images.  As such the above should be:

#define HOST_DONT_WAIT_FW_READY			BIT(1)

>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/* This flag is set in the DSP resource table's features field to indicate
> + * that the firmware requires the host to wait for a FW_READY response.
> + */
> +#define WAIT_FW_READY				BIT(0)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -136,6 +144,19 @@ struct imx_dsp_rproc_dcfg {
>  	int (*reset)(struct imx_dsp_rproc *priv);
>  };
>  
> +/**
> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> + * @len: length of the resource entry
> + * @features: feature flags supported by the i.MX DSP firmware
> + *
> + * This represents a DSP-specific resource in the firmware's
> + * resource table, providing information on supported features.
> + */
> +struct fw_rsc_imx_dsp {
> +	uint32_t len;
> +	uint32_t features;
> +};
> +

This needs a version field and magic number.  Have a look at what Xilinx did for
inspiration [1] (both magic and complement of the magic number).  You will also
need a "__packed" attribute for the structure.

[1].
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/remoteproc/xlnx_r5_remoteproc.c#L103

>  static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
>  	/* dev addr , sys addr  , size	    , flags */
>  	{ 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> @@ -300,6 +321,39 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
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
> +
> +	if (!imx_dsp_rsc || imx_dsp_rsc->len != sizeof(imx_dsp_rsc->features)) {
> +		priv->flags |= HOST_WAIT_FW_READY;

Unless I am missing something, this way of enforcing the default behavior won't
work because in older images, function imx_dsp_rproc_handle_rsc() will never be
called.

To fix this I suggest renaming HOST_WAIT_FW_READY to
HOST_DONT_WAIT_FOR_FW_READY.  That way the host can skip waiting for a FW ready
message only when it was specifically told to do so.

Thanks,
Mathieu

> +		return RSC_IGNORED;
> +	}
> +
> +	if (imx_dsp_rsc->features & WAIT_FW_READY)
> +		priv->flags |= HOST_WAIT_FW_READY;
> +	else
> +		priv->flags &= ~HOST_WAIT_FW_READY;
> +
> +	return RSC_HANDLED;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> @@ -335,8 +389,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (priv->flags & HOST_WAIT_FW_READY)
> +		return imx_dsp_rproc_ready(rproc);
>  
>  	return ret;
>  }
> @@ -936,6 +990,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
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

