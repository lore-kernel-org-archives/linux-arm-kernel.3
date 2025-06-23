Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E9EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=; b=cxQSRUKAeS9lWc9851a0ISKrmv
	/DIKybz2yU81tv0V35YJg880gAsfHGCwlIXjaOx2orcYyDjsCePg4OYDiB/S4DKqeATs4snzyVol4
	ampWZa780gMvuD2wqy1h5d9Tlleq9CwqnbzpbU/VDOYlV/17HIvCog7gaibeWhaZOo3M0bonJbMxU
	5LG/op/5ePz8dTiO3L4Fi00PelBjAiAGa1F9yz3l+WbjQ74xsnQE4a8RDcKOxDcx08IW1lWCcerLS
	YY3mByibo0k04eyGBsot/edADS34AQnBCfF6p8LLk8Yuj/UP4jdghHg59bBkgKuG0UtF+kQGg/BLI
	mpVnyB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmHN-00000003kmz-0Zy3;
	Mon, 23 Jun 2025 18:52:29 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTitn-00000003BlC-3xSX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:15:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23694cec0feso39407285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 08:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691755; x=1751296555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=;
        b=oyEH3UNPwmZDmLg6L/c6dcY2qZgTymgFfrds5k3P1ShC9MaaawMbShw/lwUz5ISGLp
         8JY0/o5sqCGbIMn5dn+3ogDuT4lP+dz+5EqfXjYCeSFD0PB/08p8amUfFa2CrGwcQG0w
         Jwym5sk7FUeDpMiq1oaJfmxaFN7r5hYtCkIc6uqo4ue3wvyNXcBz2EQFxkWoe7lW4hND
         eKZNmhRnUJpZSYVMArNpM7/ei6Ffca2/bFWP2qF5LPB3ykaYX/GWZSwyoBEfG+zRSFrr
         xedwNzhSW/SzgWjeqirROj3Wt4wraYPq1+XeAG4ZFlnemX5mzIVfCw5ZEf9I43JzXI24
         QMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691755; x=1751296555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T27t2nmr6ecFVKTwe7GdRGC1UuMYhsoPFZxzjgMw7XA=;
        b=j3Hb4KCHsjIhnVgB2lpYwHizWQt3pWYFU2/FUs8xkrh9BOalDPHE4f6OXP399pp6G5
         2iMZnQChc93IqDFWyJjhOg3ri3AiVnqMTxNcRzNS/Hs8x8rGh9GHc559fzWwe86CkxMd
         K2bzxa/sBDJy/Vx1SQUrhWjxTSRF1PsSdtc508dKXghwWZbHBcz/orxypVUXhzvF984z
         EIeBoDOg7JcLB0vQyJMFBXOcd1pvnpRvDvxphPh3Ecr4JNtuO3yWW0FsoxLtC80fvzim
         yJ4dd+fsz9HiSsf+40ezczOGUGdMq3Q8n65u4eNKD/zVZUwQhpCCX2zkhHytozdImi7v
         1S+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgQoKOFQfGvTsD8lsMADM8gmJorsmAATv8ABTQkHr7AQvBxp3glyIPi2DRdrddkN2ewIRGXv8lIv/VON1/3sv9@lists.infradead.org
X-Gm-Message-State: AOJu0YzjVDWzHQYLKvSzkXCTEqiKZZBGRqgdMryrH4uzZ2ryR01oY4l9
	68xfmpzY1ZO5jExxlgFzApcg+zj4GcH9OPwS1gGOwDyT0PveAY9eQB8W+adPeN6pLek=
X-Gm-Gg: ASbGnctADaQlVT4d04xN6/A//Lhkp9yICEcSUqd7RzvCg+8Q104w3qa6TIxcXUmvcek
	pomFu9RDDjJ5a2Crint/iNm4PdSjOOueZmAEKYJXxjzzjIw8fVVRa1aNypJR3zND2dhRBk015uX
	ZjC3c9ATEpGsjdlRm+x0f0ld7Zf5yBnXbuw5xHfHAevl33Tk0GOc1DPIVkemBDiShfLnq1zj2Kj
	SfR0hsNgSsDZWAfo6Vb5UTnzCNhCO4WrIKPwAVQCaxIahZ4EcpGK8OteIuo5Sg/0cfKmWk21Hwa
	VA5Bpu2l3OC1ajJsJMstyT46d3SjQXYNL9s49fcwAdlB9bUPSSc/4sECKjn7Ejcb
X-Google-Smtp-Source: AGHT+IGEfd7ew/DbegL4/ehEu6z8rdU2NqGKWQUxfqGQJFlSmPlquHaa0QFJscSdtTcWRu86BS4OCA==
X-Received: by 2002:a17:903:1b66:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-237d96dfe41mr236501275ad.10.1750691755197;
        Mon, 23 Jun 2025 08:15:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866488csm85961605ad.158.2025.06.23.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:15:54 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:15:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: skip clock enable when
 M-core is managed by the SCU
Message-ID: <aFlvqK6SHvWHIpMn@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-3-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-3-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_081555_984149_54461A58 
X-CRM114-Status: GOOD (  22.97  )
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

Hi Hiago,

On Tue, Jun 17, 2025 at 04:34:49PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> For the i.MX8X and i.MX8 family SoCs, when the M-core is powered up
> by the bootloader, M-core and Linux are in same SCFW (System Controller
> Firmware) partition, so linux has permission to control M-core.

Ok

> 
> But when M-core is started, the SCFW will automatically enable the clock

I find the "But when M-core is started" part confusing.  Started by who?  And
are you making a distinction between "powered up" and "started"?  It is not
possible for someone that doesn't have HW documentation to understand what is
going on. 

> and configure the rate, and any users that want to enable the clock will
> get error 'LOCKED' from SCFW. So current imx_rproc.c probe function
> fails because clk_prepare_enable also fails. With that, the M-core power
> domain is powered off when it is still running, causing a SCU (System
> Controller Unit) fault reset, and the system restarts.
> 
> To address the issue, ignore handling the clk for i.MX8X and i.MX8 M-core,
> because SCFW will automatically enable and configure the clock.
> 
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v4 -> v5:
>  - Unchanged.
> v3 -> v4:
>  - Unchanged.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Commit description updated, as suggested. Fixed Peng Fan email.
> ---
>  drivers/remoteproc/imx_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f1..627e57a88db2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1029,8 +1029,8 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux */
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	/* Remote core is not under control of Linux or it is managed by SCU API */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
>  		return 0;
>  
>  	priv->clk = devm_clk_get(dev, NULL);
> -- 
> 2.39.5
> 

