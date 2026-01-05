Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87353CD0405
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=; b=zJPYelff6P3LnYTouIS9arl/o5
	RNKXXsxyZmlWPnMGOsiENuKI66Qk74p9VztUyICwSjSJromD5sUvSNqF4kt31qM98RG3I4H3UOzbR
	hQm7TPo2dXdQfsYUQsT4a9JtO2m+AC/SNdC7MHFaqMhdGzHoH0mTjumZDVBlW30eiub4Oz9blXv8F
	In0B2cpQxs2CqUIu4FkK523L8pi9oOAGgZbe7WuPnSsOYLkkjHH0AfhoKBWg3r9eFhPvXR0u9fo0U
	fP6+gkYh5dgWMiaKXy7TSN782QdiCkk8+jChPOwUl3to4XDVSqnzNoQRpIjZX/+1nvP+m9k0xj+qx
	WSzrxuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrpO-0000000C6U3-11Tv;
	Mon, 05 Jan 2026 21:09:26 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrpL-0000000C6Tg-1Da2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 21:09:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29f0f875bc5so4686855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767647362; x=1768252162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=;
        b=aYC1bLsActI3x5rSv5WZ0JKaONe7Nb4n0Gui9OvKgxpvIQ8e/ID9E98CDHmIwez7HT
         iDk0Nnz1Asi8EK4Dw2WF5tB53oe/RYvP3oNkqVpSRD/2yr8ALLN2dEL7u7OhTtXJxn6a
         il357q3HHThcqOPcDq/J0hj2y1xtsctVKvCtHLB2oxGS2ouc/q4luUppc5zLvA8Xz0ct
         8p6DqdZ/K7U5Ghju/MEZqRyRmvoS1G/cjBpYajEw4sErtPLo8tlY0UsMiV3pP01Y6D6V
         nNqPPfNvi8a8+yxMtKM7bHDENpiGQkxeQ6VqyTrKhUfmQDFK8zmCAoQrGXH+4zgfISdY
         8yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767647362; x=1768252162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tSkxCKwZXCfTTNee+KHC5cdt2q9BOYUvx4EdY3LV9o=;
        b=rxkaANzlAzrxTsJQJ4C2XTyXSPCMqRjXrzRuDQAWO05UnN78qinL78EwhetpuwfSa+
         zjvL4Ur1JxwXd+jvzMqjA7ZfVqgU5u5hbtr8WpK1AP4mvfPSjWyxfhiuyA6Ejz7bfePT
         sH7Zit4pKwNI2eXtJ2vTPjJ+ZP55DHnWMUGOjBJVDZprt6jXAXfZwokqTX1MYhk9C6r6
         3ORphgWuNxf00ce7qx231i+024n1i+KJuYcsQiCWy9wdtZ7rXyszHQolgfhtHi1v65qZ
         4jNn1kEhs/KuoasrhK7wpb+Fagy8W8zZB+P2fY8CMptqt96ycs6IP+nKaFTYgWGBTepA
         qd8w==
X-Forwarded-Encrypted: i=1; AJvYcCUjlELJb4lEQbvgXhOJbvDSDBJRjgkJUw6eaAqVirKmUYqbCmYF86lQnMcWDn804LXTKBBkscIoQza3fnxG7dav@lists.infradead.org
X-Gm-Message-State: AOJu0YyFtpzZBrw9b1dqamO/92fw/ZCFWsA8LQ7ZLs289h0ZscKvYys0
	Gz123a85uyZUy+N5KJC4MfNFGHFbc5fowNe/+IHhF7sjvctODsQQC2MEh5P9YV7uVns=
X-Gm-Gg: AY/fxX4i+NRmCvb4oqDNvbfIdPgqth5Sp3diC1KoFRRbPEUXEJFkclzOD/k0UJcvc/E
	VIpJI8cs41APjw908xNgmOGnaa/q4UMizlAwe4vm0dFyBXny6jYP5G4YZSDuZwdBoA0Qj8qfOAD
	aAHYYuJ+F57b5R9QSAdYndLxkKnXUkhE6rsgztimpcmd+KpC4qL9zrzL4I31ipyFRIbuMIv/d2n
	zoM/6ITTZWR0sHFT12+msYxqh15+pZXC2KPP9h3eha4QHYYzKcssxDOiLdkk/honucZ2rTQBOyc
	XpPigOohSjln7EY44IdLsvdqENOyJcN3pbrHqvbkdu2Trn0gzUewjP/aLuY5kiowdp10wF1yvd3
	9LfQ6NPvBj/37M7+4hLH8xiboJgUU+YRW20Lwm6Z5YOneBeFeqsdB/m2tnmHa/Qr1m/3ZZcg8Ki
	Cngr7DlWvrUsbi6g==
X-Google-Smtp-Source: AGHT+IHXo6DMFCW0WpfI4RbwmQ0/+SMw7AIolM0jI+6hLOC2qL1pTqhGB59TCu4aAjBQnNj3aCaTnQ==
X-Received: by 2002:a17:903:2f46:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a3e2d7896dmr8294395ad.4.1767647361918;
        Mon, 05 Jan 2026 13:09:21 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:3f6b:5551:220f:8f13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3ba03f9sm1721825ad.0.2026.01.05.13.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:09:21 -0800 (PST)
Date: Mon, 5 Jan 2026 14:09:19 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, daniel.baluta@nxp.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: only reset carveout memory
 at RPROC_OFFLINE state
Message-ID: <aVwof_w31EMxi5st@p14s>
References: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218071750.2692132-1-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_130923_334925_5C383702 
X-CRM114-Status: GOOD (  21.00  )
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

On Thu, Dec 18, 2025 at 03:17:50PM +0800, Shengjiu Wang wrote:
> Do not reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.
> 
> Fixes: c4c432dfb00f ("remoteproc: imx_dsp_rproc: Add support of recovery and coredump process")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> ---
> changes in v2:
> - refine commit message.
>

Applied.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index d03017d6b214..ac8aa71aa56c 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -984,9 +984,11 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
>  	 * Clear buffers after pm rumtime for internal ocram is not
>  	 * accessible if power and clock are not enabled.
>  	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> +	if (rproc->state == RPROC_OFFLINE) {
> +		list_for_each_entry(carveout, &rproc->carveouts, node) {
> +			if (carveout->va)
> +				memset(carveout->va, 0, carveout->len);
> +		}
>  	}
>  
>  	ret = imx_dsp_rproc_elf_load_segments(rproc, fw);
> -- 
> 2.34.1
> 

