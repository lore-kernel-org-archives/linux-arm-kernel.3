Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DD2CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b1waI30m43a9rgbDHZrFDb+c/4Zyp2tRTfYwiyzcxw=; b=y3TQn8A1P/RSG54tYSRv3UErLm
	SGQGroX7vrlCB6mHr4V/3yhon134JqCpeSJ6YqXLjBrGIKeIL2JXd/fuY9TKaoPz15FCSAzEbMPGN
	C4bTVpp6Cj4bad3h9knIfRqUvC85skWE8Dlv8DLima8JRdU1ghakH/yIqVK37LmIqUICxNijp29LA
	4VSFrb64dhHQ2ux8z7MqYFEZragijqZQCCM+vKq3gvtd8aFHN4kQQh/WiMAkKMUi4P0o3DxcaOjlB
	H+Q928a+OMiibxYbiiq1iWP85d5r0fVx8VUMlfHvzYZUQBUYU35ijY1OK94EaB1gBobf4jbDPpSXC
	rMPKM7/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa66-0000000E1Sl-0JMQ;
	Wed, 03 Jun 2026 01:08:42 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa63-0000000E1SC-20pF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:08:40 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-91587626a3eso92429985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780448918; x=1781053718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5b1waI30m43a9rgbDHZrFDb+c/4Zyp2tRTfYwiyzcxw=;
        b=GR60uMOwX+JPN3N/nuZxNlHJ6XFZC27Whahg+hE9eMeDoTKb+JRh9wgTE+NOO2liNJ
         6WP0lOyC89a409NPtoxKdS3g8ayCD48ioU+xd9SgZ2gKKHlH7lgNnQQlvHMNMqxSgPCK
         N9kwHCpTv653XtKEPRnyXmefZNHXg5oHS0qiRgy8QI1yoW59ezHjuMlLfQIZSZpQVQe9
         QlLQm2EiROa43E4DXrtLLXBb6qF/3n9NPwkOssYXE0SMdULNvuTU+FPhP68+sDvOpPtb
         mNevdG1Eauu1e7owfZiMrBfpzuNAIxKifeqjDvZaRD4tJozA5wjT0mky4RT1FPnccQrN
         IrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448918; x=1781053718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b1waI30m43a9rgbDHZrFDb+c/4Zyp2tRTfYwiyzcxw=;
        b=fOvgeQzXkE4y8GV84BFSZsa5JQKSvMSzcZA69nbXJPeMaBMPxYKRbnUImhgRfEfEUX
         I+uX9tFqAkExiwPDFm7/4JsuXxVALxJNeP6Qk3uvWo+o74XM0v64VDkdbHoL8rQcKfzC
         g4ri10VYfLm4FR+Z1CBNgUYZyYEF4VuYuaIwiB7OhFY7pmUyK4SHgffVu2yigr3eb+F6
         nO2PGB7XNKUVPZLTSNxy6aM6fZAVapNz1Q3iW1DTPpFrcKdmOhMzcAkHO8V06S9Aqctq
         zLqHR6xeJEdF+YEgBkSaS7xCbCcNwcXYOmK5aW5f9j1t+/OBtLuakyeKjFonFynE12xl
         GJXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+1x7xsMk1OZCw6mBdZ1VSdTooNZF9DotnpxcGJC0juDvULziy2DNdXwRsn5tRIM6a00ZIQ1aJ/saMGy0WbJnR/@lists.infradead.org
X-Gm-Message-State: AOJu0YylajIGNGIydZBbV6WyBEtkdMl7lowku3G+vfcar6ud03vGni09
	3OkaInuJGcKMjDlfDAL6k15KOrdcDg/f5QhgM66ZKamnGoQXMo6Umfxt41KPq1rdQPTz4xNcRtB
	reJfiQi8=
X-Gm-Gg: Acq92OE0iELos4z4VtpdLL0TWV/QzwOnOURVgZw4x0/zklHVwNlnrp3RIt1WYpvp/SI
	hDf4fJKljsR0zGdwln5E7Hd8sjfxhfz/kVmws2hOj33gD/J/v2y2bfhXGCA9y4A30ebSZSArswg
	G0np9Xpz5dtXjzfD8BNSwcLlk76/OnP+uy7JHQfRsPCsWTuo75Dxy7VkPuV4JMause5SbZCre7S
	a3+tun4QLpCZPthwibrAphE59NLKSuPbdiL6dxngckb4yL2XQ6vZ9WupCp/zRhFcxXuTpDYHVCa
	q94uvScNf/YdJo3qHAMW1WWexVmomGEsy9sXc3wL/QTZWzZuH2676OJs7M5FzzAAm07U2GxXIsW
	/UaDIJUDB2+WFCnefeNmlkd2g1C+SRsoYioaINc5TOzlZU30JVAq48ApcjBsl3Cg3aaWFdK134t
	T9GUDWpK9vrnfZ8UzciOonkZj7B8JSjNT2hZ2tKjohpFILXwtgvx7C0C9ATcaHONZxfk0g5U3nE
	zCWRvgYBupwLR+L
X-Received: by 2002:a05:620a:1722:b0:911:de69:ee21 with SMTP id af79cd13be357-9158a656dbdmr268795585a.11.1780448917995;
        Tue, 02 Jun 2026 18:08:37 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c50bsm99840585a.24.2026.06.02.18.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:08:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUa60-00000004yEH-2fsG;
	Tue, 02 Jun 2026 22:08:36 -0300
Date: Tue, 2 Jun 2026 22:08:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	baolu.lu@linux.intel.com, boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org, dwmw2@infradead.org,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com,
	alikernel-developer@linux.alibaba.com
Subject: Re: [PATCH v2 01/30] iommu: introduce iova_to_phys_length in
 iommu_domain_ops
Message-ID: <20260603010836.GQ2487554@ziepe.ca>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-2-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602104637.1219810-2-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_180839_529916_81F787D2 
X-CRM114-Status: GOOD (  14.86  )
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

On Tue, Jun 02, 2026 at 06:46:08PM +0800, Guanghui Feng wrote:
> +/**
> + * iommu_iova_to_phys_length - Translate IOVA and return mapping page size
> + * @domain: IOMMU domain to query
> + * @iova: IO virtual address to translate
> + * @mapped_length: Output parameter for the PTE page size (e.g. 4KB/2MB/1GB)
> + *
> + * Like iommu_iova_to_phys() but additionally returns the page size of the
> + * PTE mapping at @iova through @mapped_length.
> + *
> + * Return: The physical address for the given IOVA, or PHYS_ADDR_MAX if no translation.
> + */
> +phys_addr_t iommu_iova_to_phys_length(struct iommu_domain *domain,
> +				       dma_addr_t iova,
> +				       size_t *mapped_length)
>  {
> +	if (mapped_length)
> +		*mapped_length = 0;
> +
>  	if (domain->type == IOMMU_DOMAIN_IDENTITY)
>  		return iova;

This doesn't seem right. It needs to return a mapped_length of
something that is not zero..

> -	if (domain->type == IOMMU_DOMAIN_BLOCKED)
> -		return 0;
> +	if (!domain->ops->iova_to_phys_length) {
> +		/* Fallback to legacy iova_to_phys without length info */
> +		if (domain->ops->iova_to_phys) {
> +			phys_addr_t phys = domain->ops->iova_to_phys(domain, iova);
> +			if (phys && mapped_length)
> +				*mapped_length = PAGE_SIZE;
> +			return phys ? phys : PHYS_ADDR_MAX;
> +		}

Follow success oriented flow..

Jason

