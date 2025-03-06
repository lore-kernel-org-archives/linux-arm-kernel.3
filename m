Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C570C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBQoogV3j30g7FrMy9Z3NT7u/NY7leEMjZRTS18vRj8=; b=xgAmvY4KtflHFruEgspWSjLWCN
	uteIJEDoT5DNENcKQup6sW19GdbkH0NapLTxm0tHQBlj1cwRhFoD8JxGttT/aQtb79ETB4Z8OSnJD
	2AAnRg8/o3zQxYWs0eZ9XOe2/ds52z5ZRhojSYDWj3fFOeUrsGIPQiJVzlGGHbaKCrMhJVKIjjS74
	pjD5Ziefd+xb2MSXAg9ASLlPtdK2/5rO/FWAxymiFS+6WbDpCiNtSKOikduRYuw0P7Y4CjFob+4/I
	FKz4MKchmNHuYt+AfTH93Rn29MOxRig/bclsndftqg2XMxYlMq8CiOfBzzT8U3GhhRC29lRbpyKeD
	B8LE55AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFO8-0000000Bk8e-0bEa;
	Thu, 06 Mar 2025 17:52:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFMW-0000000BjqD-0JkC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:50:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1824848a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 09:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741283422; x=1741888222; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBQoogV3j30g7FrMy9Z3NT7u/NY7leEMjZRTS18vRj8=;
        b=D8lOeNYhbiyhONk0gd40T7arFSWzeHJ4R0schEgHlW03LffOYZpU3rHlnQLE8Io6PY
         wIrSmksRoapAn1q3C40gbguswOtDdqRIerf4sh7IfRfcfT7w3fjI5gkbYGW9jWAwXQRr
         bg0dg26aWSvCU4A+yANL0UOQNNnYM2HzgRXSrFQhRIh8xOnNgtvBynAdrD33pYH/pO1M
         wyywZsC6boebwqyRr6CnoCeavYtvNtvRVXZLSnM+bJZjRkoFtN6uoJlAoK2nF551a4lD
         6Uj5YRwvJmQpuakreewGa1Fj4ShOs0+PmzPwwr2e0m497mbgvfSH6gqWRrBQ46VweCWg
         Dpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283422; x=1741888222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBQoogV3j30g7FrMy9Z3NT7u/NY7leEMjZRTS18vRj8=;
        b=G2IRdpAF/mcqGvper55m+dqxcabKFdl7ZhsqqeRRY7UKiA70aScsgNAYcOVDWDCOee
         1Ecb77tVVZhnBIYpdLjA676nOxhLJOyY9VhoNGkF/X11rIgkadIE5phhyTSt/Vp1rvrx
         9aRt8qUKow3Ek4fojOxEZ0lBeiPKYiRJpqlvGlLdsTfqBrEkQgzHlmd2izvT3r8ZvfbT
         JSOnt0BGuZVKynppMfdk6aUZNoBnZiEAPGfZTQaUuHnqHPyaFgYuiJbCkXPi5UuLZvhN
         6658/eNXkdHHlssVW+2wIxkNmxZBS5XwwkgHHDJtMcZ7zwYGyiaHAcDJKsax45eJa1PH
         2g4w==
X-Forwarded-Encrypted: i=1; AJvYcCWsYKjzwGdplwiOORuRarr3QMc+WD5ZgTj/MSJC3rPebfGUBssQAu2jpAiociebkPmCNTYgHGDCWccCZewVuKyD@lists.infradead.org
X-Gm-Message-State: AOJu0YyVkGRStr5BFG2klCCGEDauoGNpeJLz2LPQ7xyfWys7d8WvUMN4
	Zz0LlcOeh2gDtSmN1ybuASPrHeaHetwMX70ZSW9n36PyvrxunKGbhzP7i10lAzU=
X-Gm-Gg: ASbGncsX4BXYciT+k8PkkP/E+bvBXSvTMgEDhmJop5ci34IZ+Sr1Xn6/wejpgoLJTnO
	a0eJFB/8z92Fnqp+YriR9nqkrfl4uj0029gJGGfPI4SE14Ez2BvfT1XAY2vz7LxOorfMsfFaDAA
	j2qgyfmrFTSyJ8Tm/X+yEg6LHeLrFUq8FzSx+XUV5qvg9gRKO3xpeT0Yu3UxgAAqCGnXA59GOgH
	hZe8kvML0nwikeCbHtJ6TCpVrlv/ywMuqgn0E89aOD+jlZwvirdR6/Du8f30xiY5zwS0azlU4wQ
	TPXwvxujyAljEYEHKE+z+me/sa3a7I9pql3QWNZMJEitoU4=
X-Google-Smtp-Source: AGHT+IGEuTXsYktLG7Gbe5A2wqYq14IVrHxmlthLo8VbHdBbTToc9qLW5FvoQCp4OUC59CVSGAIxyg==
X-Received: by 2002:a17:90b:1d4f:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-2ff6175a47dmr6758129a91.7.1741283422491;
        Thu, 06 Mar 2025 09:50:22 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:d45:b21a:9b36:7bcc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109fda8esm15294235ad.101.2025.03.06.09.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:50:21 -0800 (PST)
Date: Thu, 6 Mar 2025 10:50:18 -0700
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
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: conditionally wait for
 FW_READY
Message-ID: <Z8ngWhbkO2770qMq@p14s>
References: <20250305123923.514386-1-iuliana.prodan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305123923.514386-1-iuliana.prodan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_095024_132427_0738C951 
X-CRM114-Status: GOOD (  44.98  )
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

On Wed, Mar 05, 2025 at 02:39:23PM +0200, Iuliana Prodan (OSS) wrote:
> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> 
> Some DSP firmware requires a FW_READY signal before proceeding,
> while others do not.
> Introduce imx_dsp_rproc_wait_fw_ready() to check the resource table
> and determine if waiting is needed.
> 
> Use the WAIT_FW_READY flag (bit 1) to distinguish cases where
> waiting is required, as bit 0 is reserved for VIRTIO_RPMSG_F_NS
> in OpenAMP and mentioned in rpmsg documentation (not used in Linux,
> so far).

VIRTIO_RPMSG_F_NS is used in [1].

[1]. https://elixir.bootlin.com/linux/v6.14-rc5/source/drivers/rpmsg/virtio_rpmsg_bus.c#L1051

> This flag is set by the remote processor in the dfeatures member of
> struct fw_rsc_vdev, indicating supported virtio device features.
> 
> Update imx_dsp_rproc_start() to handle this condition accordingly.
> 
> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 84 +++++++++++++++++++++++++++---
>  1 file changed, 77 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index b9bb15970966..8eefaee28061 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright 2021 NXP */
> +/* Copyright 2021, 2025 NXP */
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> @@ -38,6 +38,15 @@ MODULE_PARM_DESC(no_mailboxes,
>  #define REMOTE_IS_READY				BIT(0)
>  #define REMOTE_READY_WAIT_MAX_RETRIES		500
>  
> +/*
> + * This flag is set by the remote processor in the dfeatures member of
> + * struct fw_rsc_vdev, indicating supported virtio device features
> + *
> + * Use bit 1 since bit 0 is used for VIRTIO_RPMSG_F_NS
> + * in OpenAMP and mentioned in kernel's rpmsg documentation
> + */
> +#define WAIT_FW_READY				BIT(1)
> +
>  /* att flags */
>  /* DSP own area */
>  #define ATT_OWN					BIT(31)
> @@ -300,13 +309,74 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
>  	return -ETIMEDOUT;
>  }
>  
> +/*
> + * Determines whether we should wait for a FW_READY reply
> + * from the remote processor.
> + *
> + * This function inspects the resource table associated with the remote
> + * processor to check if the firmware has indicated that waiting
> + * for a FW_READY signal is necessary.
> + * By default, wait for FW_READY unless an RSC_VDEV explicitly
> + * indicates otherwise.
> + *
> + * Return:
> + *   - true: If we should wait for FW READY
> + *   - false: If FW_READY wait is not required
> + */
> +static bool imx_dsp_rproc_wait_fw_ready(struct rproc *rproc)
> +{
> +	struct device *dev = &rproc->dev;
> +	struct fw_rsc_hdr *hdr;
> +	struct fw_rsc_vdev *rsc;
> +	int i, offset, avail;
> +
> +	/*
> +	 * If there is no resource table, wait for FW_READY
> +	 * unless no_mailboxes module param is used
> +	 */
> +	if (!rproc->table_ptr)
> +		return true;
> +
> +	/* Iterate over each resource entry in the resource table */
> +	for (i = 0; i < rproc->table_ptr->num; i++) {
> +		offset = rproc->table_ptr->offset[i];
> +		hdr = (void *)rproc->table_ptr + offset;
> +		avail = rproc->table_sz - offset - sizeof(*hdr);
> +
> +		/* Ensure the resource table is not truncated */
> +		if (avail < 0) {
> +			dev_err(dev, "Resource table is truncated\n");
> +			return true;
> +		}
> +
> +		/* Check if the resource type is a virtio device */
> +		if (hdr->type == RSC_VDEV) {
> +			rsc = (struct fw_rsc_vdev *)((void *)hdr + sizeof(*hdr));
> +
> +			/* vdev does not require waiting for FW_READY */
> +			return !!(rsc->dfeatures & WAIT_FW_READY);

From a virtIO perspective where one virtIO device pertains to one virtIO driver,
your approach is valid.  From a remoteproc perspecrtive though, we have one
virtIO driver [2] used by several implementation (NXP, ST, TI, ...).  So far,
information conveyed by rsc->dfeatures was applicable to all implementation and
things need to remain that way.  Otherwise, it is a matter of time before custom
and global features start clashing.

Using rsc->dfeatures in the way you do above means the resource table in the FW
image needs to be mofidied.  As such, you could take advantage of the vendor
specific resource table entry already supported by the remoteproc framework [3].
From there you provide a resource handler specific to the iMX DSP driver and
things just work.  Moreover, you wouldn't have to parse the whole resource table
every time imx_dsp_rproc_start() is called.

Hopefully this works for you.

Thanks,
Mathieu

[2]. https://elixir.bootlin.com/linux/v6.14-rc5/source/drivers/rpmsg/virtio_rpmsg_bus.c#L1054
[3]. https://elixir.bootlin.com/linux/v6.14-rc5/source/drivers/remoteproc/remoteproc_core.c#L1044

> +		}
> +	}
> +
> +	/*
> +	 * By default, wait for the FW_READY
> +	 * unless a vdev entry disables it
> +	 */
> +	return true;
> +}
> +
>  /*
>   * Start function for rproc_ops
>   *
> - * There is a handshake for start procedure: when DSP starts, it
> - * will send a doorbell message to this driver, then the
> - * REMOTE_IS_READY flags is set, then driver will kick

> - * a message to DSP.
> + * The start procedure involves a handshake: when the DSP starts, it
> + * sends a doorbell message to this driver, which sets the
> + * REMOTE_IS_READY flag. The driver then sends a message to the DSP.
> + *
> + * Before proceeding, the driver checks if it needs to wait for a
> + * firmware ready reply using imx_dsp_rproc_wait_fw_ready().
> + * If waiting is required, it calls imx_dsp_rproc_ready() to complete
> + * the initialization.
> + * If waiting is not required, the start function returns.
>   */
>  static int imx_dsp_rproc_start(struct rproc *rproc)
>  {
> @@ -335,8 +405,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  
>  	if (ret)
>  		dev_err(dev, "Failed to enable remote core!\n");
> -	else
> -		ret = imx_dsp_rproc_ready(rproc);
> +	else if (imx_dsp_rproc_wait_fw_ready(rproc))
> +		return imx_dsp_rproc_ready(rproc);
>  
>  	return ret;
>  }
> -- 
> 2.25.1
> 

