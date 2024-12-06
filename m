Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1EEE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxGgnsUUhsUmBPGq3PK5RvOu24w5vOz9HNq8JtdHRk0=; b=x4atySfDbWD28+e+fl7kKLoX4Y
	4kY6L9UeUotRi37TMP2edNV9N9pvXjsjUvLQIax3JPeQtr7x1k2JRZpUuifdpAmHvDCiPuSeiFMnh
	YyDnZ00cSUcaiKOJRDjjA/Jp1KHZuZ5tMNUIky60Vf8FWth3lnuXIk8UXtzzDerMmlDzQKzftHfXj
	F2uDDEtyxIrj7eFzhBqj4QP2Cs7tM8Y6ywYCRh0Dyh5uzBH87U3yrX6S86p9SgW+pP3JkAyh1TqdL
	3j4udi6LGyzuMS17Vp1qvlLBIcAQTMa4xqN/z4b8dNa5+uSG+fdfWMuT/Y36jRZjJUf+u70w93Lr5
	/EPzR1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbiI-00000002Gyy-2YuT;
	Fri, 06 Dec 2024 17:01:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbhE-00000002Glc-31qJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:00:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-215c54e5f24so20655505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733504451; x=1734109251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxGgnsUUhsUmBPGq3PK5RvOu24w5vOz9HNq8JtdHRk0=;
        b=qS42yLugwzwu8SvVlCG+p0hxAQGOgCO9v6wy9k53hQsjafJsyTnE526u492HActg8j
         e2PQwAdOTwNhDjMDCPEIca1Y19lJxCbWQnSWtuO1nEBt5Uhp6Ec1EUviP5adFuebxQ3e
         673wOYf7wCF3jde4VIi0nJNAL3FYTpvAQ76dwP2RYKEJnAZ0WSViGHRUw4Z6RMzzxqX3
         xmdVk8hUT0H4NnATrydxm4sJNyAv0s9A/EPcP5DMPZiJJcGeQshdGhO/ritD1KWyqNtQ
         ITCC2U+yQDgc+zFnGg3923lN18trBegog1rIB0mWXuDjibrz8/iYFD4PyUzzo5ZLgE31
         k15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733504451; x=1734109251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxGgnsUUhsUmBPGq3PK5RvOu24w5vOz9HNq8JtdHRk0=;
        b=LHqFhOq8YRA1Pdk7mPIr131vj4pSgiYGJJ465ZWvYdxWe25Z5somIqP9g+y+ZBNKmi
         ltQwZDBfW9FcC29rsHsuiFFwtluNDgRsqOzgyXYMJUWAIbA58+JNfHz1R5swRmY9lyFE
         KWX0MSF5xmEk4kjuu5w2Z9fG6pcI25b8GiSerNfkzWYVvArg7PbyEvsxXOvFy1c1+QLr
         GjsxEJ/3CCEAUi7B4a5Emt/HnmqQj31ga3/tAVRHjDriwAIf1V8VpUrYyHAHNk+cKwv6
         vEzpY+LV5C8fiSPSc8fkb387Si0wI4EPbFC8Dbr2mGG13lOYkG37osFW9q+KvLqprcAq
         CRgA==
X-Forwarded-Encrypted: i=1; AJvYcCXVvIB//O8PV5cu+uqzcxRBZG38v85BeeMEjljfaKhoBOPX5YJEb6XtGSd1UuU4fK4YySxBfvXgPTDlJsUaYPRK@lists.infradead.org
X-Gm-Message-State: AOJu0YyYR5uIlxpc32BCxqr32k4zBnsrRLMfsWL4O9oMYXkiqA+BWlrE
	FVkQinyK6bg8BxQ5o/60HqoJ+AaFRIzWCsPFACib7bde+bHLjnfov4MwtGtdkTc=
X-Gm-Gg: ASbGncsGNeAHR64ZnUZ/Lm/MrU0ILH3LsqiUsjfpFiw4zGUIRCgWj2NfLJBJtRoUe+/
	n7HvCd8cPYoMnSipQZGNMA293WPFyOLgkz+ofKyi7VFRAr+v1XZfNY0bxpsT6RV7Now5cpZyEqo
	E3o5+cKzBWk3uo5wZOTlTlpgbFxEhKMoGls858kgKxlcyMWbT7NmFp/4noouf3FthRR0ecui57p
	oyBbXZcQ4llidNO+dbDZ+96lVWjd+6+aOF/0PQfr125qw3cIMjclg==
X-Google-Smtp-Source: AGHT+IHio60POCQwXssDzXQZiYwth3e7luERgW9BPvBLeRV3WmOnlH5qo/y/wAO+5VJ4oh5kZtaUUw==
X-Received: by 2002:a17:902:db04:b0:215:9f5a:a236 with SMTP id d9443c01a7336-21614d1edeamr35753815ad.6.1733504450793;
        Fri, 06 Dec 2024 09:00:50 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:85b9:bc9c:71ff:f6c3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21627341853sm1522445ad.240.2024.12.06.09.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:00:50 -0800 (PST)
Date: Fri, 6 Dec 2024 10:00:47 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, andersson@kernel.org, hns@goldelico.com,
	b-padhi@ti.com, andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc/omap: Handle ARM dma_iommu_mapping
Message-ID: <Z1Mtv9cEobzvMSsS@p14s>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <6186e311cb6f64a787f87fd41e49a73f409b789c.1730136799.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6186e311cb6f64a787f87fd41e49a73f409b789c.1730136799.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_090052_768931_A1784852 
X-CRM114-Status: GOOD (  21.06  )
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

On Mon, Oct 28, 2024 at 05:58:35PM +0000, Robin Murphy wrote:
> It's no longer practical for the OMAP IOMMU driver to trick
> arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> the arch code's dma_iommu_mapping out of the way to avoid problems.
> 
> Fixes: 4720287c7bf7 ("iommu: Remove struct iommu_ops *iommu from arch_setup_dma_ops()")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/remoteproc/omap_remoteproc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 9ae2e831456d..3260dd512491 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -37,6 +37,10 @@
>  
>  #include <linux/platform_data/dmtimer-omap.h>
>  
> +#ifdef CONFIG_ARM_DMA_USE_IOMMU
> +#include <asm/dma-iommu.h>
> +#endif
> +
>  #include "omap_remoteproc.h"
>  #include "remoteproc_internal.h"
>  
> @@ -1323,6 +1327,19 @@ static int omap_rproc_probe(struct platform_device *pdev)
>  	/* All existing OMAP IPU and DSP processors have an MMU */
>  	rproc->has_iommu = true;
>  
> +#ifdef CONFIG_ARM_DMA_USE_IOMMU
> +	/*
> +	 * Throw away the ARM DMA mapping that we'll never use, so it doesn't
> +	 * interfere with the core rproc->domain and we get the right DMA ops.
> +	 */
> +	if (pdev->dev.archdata.mapping) {
> +		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(&pdev->dev);
> +
> +		arm_iommu_detach_device(&pdev->dev);
> +		arm_iommu_release_mapping(mapping);
> +	}
> +#endif
> +

Despite acknowledging this patch I never applied it, something I have corrected
now.

Thanks for Beleswar for bringing this to my attention.

Regards,
Mathieu

>  	ret = omap_rproc_of_get_internal_memories(pdev, rproc);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

