Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12981C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b/74yZYlKWVL03d8QxZ+9D71zx2gtM8eY6+b6yqz9TE=; b=hYPRczNJgAfZnpXpgzSGOQq5xf
	Kt/6Nwx/5XPi5zTuO9EXHBk5rkPxjmiiLDLflL5+NlV/p5gatrHyz8BJ5GVcdrGH5X+7g8HD08+2s
	5u3vjxndAUNLVHluw+2Wh3+zvh0Bxm2HbVL3VPeab2WBEOhfQv5KXQ095LWDQkMGIKl5A4kIZznm5
	gY2GMpYWt0BoLKYWbXLkxnkowxcmlN4Qpl1tAbh0zfGHSwAJkimntFEWIevNINTmQR8rmEvcY+4Y5
	Nnyf+Ij44tgfXxHZKuQVK2/HXZlKc0p1s/ym3sOgMCfBWcZbhIinJlgasAjCsSBT1vsdUg/OsrWW1
	k9DZOkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjC8m-0000000H8u1-2Vsf;
	Sat, 15 Feb 2025 06:59:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjC7K-0000000H8o3-456I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 06:57:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4396794c044so15899335e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 22:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739602653; x=1740207453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b/74yZYlKWVL03d8QxZ+9D71zx2gtM8eY6+b6yqz9TE=;
        b=WlqV5aXkoAohOibOkaPNrDj8uQBiPU5UUK8myn0flwnq9haN23Puw2oxMqzapu0h6T
         ggIrnw/vexECxRDnGy++tJ2u7aF6LOwvk05ooY10sjDoiJsp1fYIX0/cgRuIb+vHfjj8
         /JOh/i6vvkLvhTzgxCufwOkHv07iPHioyYYPBWG2pnAsX4fV+t9IklUXRpEJPg9PHJcF
         uX8X3WWX0AFq20z6HGoldDEYYXvRx1sT+nBfVfjSizqbQh+hadCZpGYvg6who6Xy7TPE
         GNLHilnGvssGk+lNxGKFocL+5VQRmeN153LOswHA7SGg8sfQLTby84xfVfrtTfXgAX4t
         0Zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739602653; x=1740207453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/74yZYlKWVL03d8QxZ+9D71zx2gtM8eY6+b6yqz9TE=;
        b=m0O8Tz47ftt7VpOKI3LSBqvvznVgkKqc2YYZJvzuiurM+rEZc8v51ZHrbts+e84RZc
         JxbmGYdC1tZL8uR03vJBBzBBTQq86eqHxH39YKh5omYvA11tSY/cZNlNFr2qvxmZ2Gq9
         vpheLv3AbF+GvrVYR+dJzaHuk+Rd5tBU2k/F0UvJmpWri8xi8anHgkOUMtglbzK5tsRE
         ++N3ZALe8ccyAQOMzd95l1IywNfxQEVTlUZHJUmBNfEmJ+kLRVzf+Eu4v/jr83GpE07j
         ax3n9gI5dv46Kmzr52JzFGc72mEzRVJaFtK29B9dXeFKI4IPAU9Ebmmh20fZmvVDdJmW
         GJsA==
X-Forwarded-Encrypted: i=1; AJvYcCWoje/eOlTJe3I/1WbXl7MeYRb90jG8r+6t9P4WKxoLVf58RRVkt3sUpdQqPOjrO9IB7zCjAGH10oq4lUtzx+x7@lists.infradead.org
X-Gm-Message-State: AOJu0YwF3yTe331lSahNwqay6VV7zWx5ZNJhoOxxVKOgSShX4Qk7lRPK
	Dh6YCeSN+mdaBahmGsAp2/4ZDtILrTQIE4Bydi0kP3bGvoSP31bI
X-Gm-Gg: ASbGnctbWQ4zbrQPkyMdxkps1tpY+hhnJ6uuiBH1dUa7ZTyrrqXfVfpWg6BItVZq9W9
	MkOdIiu8HRk8ZjH4fJ+l26BUMtP1yvZ+QTSBgRYGNR8YdXXFWKt19dNna9Eh+YFndwrAOaE5lXm
	jlgh98d1TxWX8+XWeZTbAAE0tmzE5q4i9tXUB5iNk4mk5THbr8CndOyfJrIe+Yk1sQchOLo1K+O
	VDc2xLpOMRdVvqEYFMJNtXeiarWX1rJwBwnd0cbNs/zn2qomjYtIq7bO4Q9aXYdtpeT9cbaN0at
	Gx5gxH9KQV4xsCHMYlg=
X-Google-Smtp-Source: AGHT+IFjxR9kB7o/X7jJm3qzTaeRczgFmTbgBjdGs7eBWawd+pTz+2SLwRWzP2UGPPBOmUSQ10hDtw==
X-Received: by 2002:a5d:59a7:0:b0:38d:c087:98d5 with SMTP id ffacd0b85a97d-38f33f125d2mr2434940f8f.8.1739602652764;
        Fri, 14 Feb 2025 22:57:32 -0800 (PST)
Received: from tp440p.steeds.sam ([41.84.244.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm6401172f8f.1.2025.02.14.22.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 22:57:32 -0800 (PST)
Date: Sat, 15 Feb 2025 08:57:24 +0200
From: Sicelo <absicsz@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, hns@goldelico.com, b-padhi@ti.com,
	andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: omap3isp: Handle ARM dma_iommu_mapping
Message-ID: <Z7A61N13dZpu53xI@tp440p.steeds.sam>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34542c9552ce8cd12a5c292e79589acd964075d5.1730136799.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_225735_015950_03A4BAB3 
X-CRM114-Status: GOOD (  23.77  )
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

Hi

On Mon, Oct 28, 2024 at 05:58:36PM +0000, Robin Murphy wrote:
> It's no longer practical for the OMAP IOMMU driver to trick
> arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> the arch code's dma_iommu_mapping out of the way to avoid problems.
> 
> Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/media/platform/ti/omap3isp/isp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
> index 91101ba88ef0..b2210841a320 100644
> --- a/drivers/media/platform/ti/omap3isp/isp.c
> +++ b/drivers/media/platform/ti/omap3isp/isp.c
> @@ -1961,6 +1961,13 @@ static int isp_attach_iommu(struct isp_device *isp)
>  	struct dma_iommu_mapping *mapping;
>  	int ret;
>  
> +	/* We always want to replace any default mapping from the arch code */
> +	mapping = to_dma_iommu_mapping(isp->dev);
> +	if (mapping) {
> +		arm_iommu_detach_device(isp->dev);
> +		arm_iommu_release_mapping(mapping);
> +	}
> +
>  	/*
>  	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
>  	 * VAs. This will allocate a corresponding IOMMU domain.
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

I have finally found time to test this patch on the Nokia N900 and can
confirm it is working fine.

I was wondering - is there a reason that it is not merged yet? I tested
on 6.14-rc2, which did not have it, and notice it is also not in
linux-next.

If it helps:

Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>


