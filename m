Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6841CD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjXyN1rYbvjp4a1JYQoZrj8n0hmsK/P4C6YKjbOfWXA=; b=k5ORwg6Y2PoLOgyNCYAaFi+s5r
	CJ3DyihfP5/9u+1CLlE+NzKwxBCqdsIrcyQvojal60CJ/JMglOO7h3lVT0tmt16H3+xC39ZvuY+AS
	Jj8N70YeOfX0SZX4e+BCkq5CDp7xu+uJyZ4VbjPAn9vaWkAGa/52eEGjApPhTmGWTbDikFSppebKa
	CXtO7+eMdRd21axqh8RcaXaR+3Cq4IIQ80fI2bFEOtzgzjGC0zvHyzmT+NFi8ri4tUUst2DYG41Ji
	CPX0lLwwn0GKj+rOQM3gBVKiWmNuqV0QPP6ZVll1Ggo8FZUQ5w/QdVU4mPsPregmokdylaFSry/Fl
	qdVVlqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8rn-0000000Gsbr-3AXp;
	Thu, 04 Jun 2026 14:16:15 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8rl-0000000GsbW-13L8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:16:14 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-9159da9bba5so52627685a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780582572; x=1781187372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IjXyN1rYbvjp4a1JYQoZrj8n0hmsK/P4C6YKjbOfWXA=;
        b=bU8pUoCfgVRjFN3otAWRxbmGXTajvFSlNur9KMCaui8Ihkw40BMb6eb5IoWcU8GGHk
         DEWnyG40HL+sJhrBBnGxGToqXEZo4NyMFmCPSvpdeNWR4DEOLQUgXnZ2GLzeuM8Cmf78
         q9+uBgI/RCJhwNCi/wbb6tcMyQmxere6XU9kDRen0T+vx1IEJzRbA04nkBPcYvkdaU5d
         zG9lf0KVD4sPddEed0SAmW6fRbVtFm63WSw7uMyzRKXTvbWmuv/9b5Dgpr3J3cJ8NcsT
         Uy0pHgaBrasgchW1kZrBddCD94ih6q59dbIrv+OdDZF2jpdHeKv8A2bvVYh1z7zuoQZV
         HJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780582572; x=1781187372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjXyN1rYbvjp4a1JYQoZrj8n0hmsK/P4C6YKjbOfWXA=;
        b=MbTad7128M3GMKR8H0+9wJO+71ZhaYGvyyUSyD8QgtWT6+wMDJLhuQuGUTJVqnYSQ3
         JU+KBhnqCk3JZOgFOBVGNd358HxFXtFb3qV2U9n9/KGPXmxZpOBZLoypPg0eod8i0S1S
         kYQfbPREA/Csf5vkAUWCAifAT7hsu6tJ/K7Ve0EifcOlJL9y4XG+0xfDALMpIQ7zzqG1
         BFgvTkVkGghZNGlr2ajJoOT2IBp1XqNtSeZ5VchzbJPRcGnHKFVkYpxhepwXrbh+UxLs
         Uh9yLmcap04eb3SGEFcqVjfHKubu5V99SNKmU79uFJEACDifeIY/RV8D8ksHz/GH5rWf
         8Y3w==
X-Forwarded-Encrypted: i=1; AFNElJ+Og+Gv5GDP1KqC9dgzh3x9ysM7FSV3OqlbG8d4kTtxyG/V88WxFC2ODGWkGC3jANcueW6OcoSrEUG8lwcGKQI8@lists.infradead.org
X-Gm-Message-State: AOJu0YymHquDc2c20OLmtVfBrhgpZZrYfkUM2U8IeN30IADQLTe6zsVY
	MVY2f3+ZgNF2dhn/HDT3YkSgDBGuQlzCe8J81882SRJS9WTuGHtIro6LBkvS+EI18KU=
X-Gm-Gg: Acq92OFKrijPUeJ84sqWOIuAOxdRpN1INsupe2g4Yk2s/IdtShXzDd+cD5g6+Qnx7kQ
	jNtGr3PHNI5+yrsC7XUsbkvi2dcKqjbDHJmxkf160ItFePkiwYLW19/cAqNKAa6r+ZFYH7NnjvG
	xPcAgid9EUuMqmlMzLyLhuTTTsSEnlcAQ7OEVbGz7eMIjkz+rCC9rHl76864ODwSWWiV2OIJVgQ
	t2YgvscBeW5daZYERX7ME+X1RVJxk3/5GSWcobGzZi6wCrtdpbmspM5bkvK7P4oR3+daV/nO1+d
	RGOBraOkKZzBOGekIP2vuFFLpgLE8a0KrPIJcwvr4iB8vydj+4DtbkzcPLEo7SPy2M06zQKjYbU
	0CqWcTwcMw0eb+fvEYVBgXbpijP3OPmD6gksGOHSte8JEZbnQHpXzw1diS9/q6hwKXXj+09SHfz
	p1KqklnKEbzbDDbzmINiS5ZjW0ZET28PEQlUTNkPl9X/71WZSvMkkwkSW4DD/9SWoAfVjbdZupx
	7/LxLA59HAAkRHv
X-Received: by 2002:a05:620a:7081:b0:915:7b23:4afd with SMTP id af79cd13be357-9158a7292d8mr1364770885a.16.1780582571570;
        Thu, 04 Jun 2026 07:16:11 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3b637esm580303885a.32.2026.06.04.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:16:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wV8ri-00000008HMt-1ns6;
	Thu, 04 Jun 2026 11:16:10 -0300
Date: Thu, 4 Jun 2026 11:16:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	alikernel-developer@linux.alibaba.com, baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com
Subject: Re: [PATCH v3 01/32] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
Message-ID: <20260604141610.GX2487554@ziepe.ca>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-2-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603151804.1963871-2-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_071613_301478_D156B16B 
X-CRM114-Status: GOOD (  13.77  )
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

On Wed, Jun 03, 2026 at 11:17:33PM +0800, Guanghui Feng wrote:
> +phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
> +				       dma_addr_t iova,
> +				       size_t *mapped_length)
>  {

This should take in an ending point so the accumulation knows when to
stop, otherwise it is too hard to use.

> -	if (domain->type == IOMMU_DOMAIN_IDENTITY)
> +	phys_addr_t phys;
> +
> +	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
> +		if (mapped_length)
> +			*mapped_length = PAGE_SIZE;
>  		return iova;
> +	}
>  
> -	if (domain->type == IOMMU_DOMAIN_BLOCKED)
> -		return 0;
> +	if (mapped_length)
> +		*mapped_length = 0;
> +
> +	if (domain->ops->iova_to_phys_length)
> +		return domain->ops->iova_to_phys_length(domain, iova, mapped_length);
> +
> +	/* Fallback to legacy iova_to_phys without length info */
> +	if (!domain->ops->iova_to_phys)
> +		return PHYS_ADDR_MAX;
> +
> +	phys = domain->ops->iova_to_phys(domain, iova);
> +	if (!phys)
> +		return PHYS_ADDR_MAX;

And to properly clean up the callers all the non-iommupt paths should
manually do accumulation here as well.

Basically if you call this function you get a maximal contiguous
physical range as efficiently as possible.

Jason

