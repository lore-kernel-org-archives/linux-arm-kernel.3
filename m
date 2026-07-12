Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5727BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egnmCxbrpH7UR+MZJeffNbFqc9tcIYQZ6W/rYZyeos8=; b=FoiOO4Myuh/ID45hSrHE1o41cB
	I/jOz1sf62s4My4jvzGTikr6Iimyzan1l0MN3iaVcXmsEWNKd4trCEUdVzYtzC+IOzNOGUc3y4Wkk
	L3yMADod/UcPUvIiRSbD/4XROysrEcYEf2rsVqYxEm+hVs5eMT5L1Egi1RVzPUFjoD9S/Cu37pgpo
	OmndDvgMSp7bo63nRNmVL1fbHWFrHGfIMiRKP4qwT8GT/5mQpmnjPZhr3PdmQRiAksWTKe1avAUV1
	PPXfntf55V//cMVYCcvI9+PmE8BJp1S0C6tALGywWLJf3JPBy4pjb/O84XMYxOMnKWptKNeGsJcFq
	l9sQ0PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2OY-00000007nq2-2AwE;
	Sun, 12 Jul 2026 22:11:30 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2OW-00000007npH-0MTf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:11:29 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8ff20870ac7so19322216d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783894286; x=1784499086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=egnmCxbrpH7UR+MZJeffNbFqc9tcIYQZ6W/rYZyeos8=;
        b=GAMxdru/6hzeV4H0DzMV/D4BzxicttWkFiRtP705r9yablPxd294ThNVio5GtDZnp+
         rHSlmpVdy7CrHt/Y43Pzga8E9n6Lz4dIdR6ucNdnrSIn9mayYENVTnbJTQ2/4krH8Ug7
         /df88uFwEY1zQDxyLHocYzR3u70W2kAtRfrN2SmeLYeLY9+Y2m6qmcxbrE7ear3ZyXsg
         L1JolIGoe1sFFZCua3eO8olOhiV7RMJflbqwzOj+kSBusO3LNCb41gJbjTK6ps0xWFq5
         gSFd7eAUui3GQW+6FygGwxsFO7R8lDsWaPettAZVaOIT/8lydXzTlJsXIgEBldbqfL++
         285w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894286; x=1784499086;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egnmCxbrpH7UR+MZJeffNbFqc9tcIYQZ6W/rYZyeos8=;
        b=Rx5MAwl8nxAYWDBOFKV3UMBEjYB8fHxYNt3YmBjHzwbQsDjYZvOLXGuHmT8CNeL4v0
         5nvgJFCrj4kZHa1GNuIXgZgc26DQylj2zFU3dtEfs2J/iffXGyVQm9aaxgxIEKfRszm3
         OJwjvNERV7bzq+gWDzZwgCE0NVOWJoZnvNIMlpkFF4ibD7pDXT3Y2wdGCX81AHIEV4H+
         3ouLK7v5olo4yto0ApShmSONjZGk53bFhwZTKYJYi4q+6N15JGOCI8DUVOKZ50fQ5tMi
         l4w1nZfkpUxCUBfru+J+4OlIvI7/ck7TPIxWLXoOsEn81aMCsT7TW77oVhVOpkVVzJ98
         JSVg==
X-Forwarded-Encrypted: i=1; AHgh+Rry84+dD9588zXQzSvATEBzLqggqQL+Ql0FwehTgV2ZbAJDnlHThaYJ0CJCJCLJwCccd/hCnLIxAS1okxTXoqvn@lists.infradead.org
X-Gm-Message-State: AOJu0YyODAds35242Tq1XpAjq3sJlaRBOYrvrwhMss/ocLf3ruKPxj8C
	313lgAYcWQdOwcnWuPpKxlkPCFJ8cg5tKgC1exXZ2/gvr1N8B0eaycCsYrp5KhX53ko=
X-Gm-Gg: AfdE7cmidmZ2MEwLOACrv5IkAqyBxnKqX+tDpm7trp0uwPkpNsDG0NvVLVo76CdoTrG
	RRxGjBFELqGh9oXlkQ9POya0cYpcJeWO/qdxkfKeR/exVEzDdmkMLyfj234Qu3pbYIGgl8xOrOn
	CWblJW/A0lWOhZUtWyk/bn+zuCDIz+LfBQwj0Bo5R+sOy32Ln9ab4xPlHxbsZQKOYUm1vm1DWEf
	IOdLvhg3Jq+BO/rJUEwafQGeGRCGe9KaSAeASmnk9XI/UKo/wWnjyA/XROVK8uxXVcZGAwu1H/k
	TCKhM+Bq1WfybV3ye8WJKK6ok4Q1lVT1KAv7JwD+E8sRheo8PO37rxMDcR5epuMKdGFs2YDuJM1
	oz1A4Z2z0t8MLmYVTU+GFovzIoFDBv2aSiE6vAshhg0C78z9+0MGCen+5x7h4
X-Received: by 2002:ad4:5dc3:0:b0:8f1:440c:7f81 with SMTP id 6a1803df08f44-903fe450e71mr71838966d6.4.1783894286578;
        Sun, 12 Jul 2026 15:11:26 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd50e10f4sm113814616d6.1.2026.07.12.15.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:11:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wj2OT-0000000Bo42-2Ctj;
	Sun, 12 Jul 2026 19:11:25 -0300
Date: Sun, 12 Jul 2026 19:11:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Drake <dan@reactivated.net>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	nick.hollinghurst@raspberrypi.com
Subject: Re: [PATCH 5/6] iommu: Add Broadcom BCM2712 IOMMU driver
Message-ID: <20260712221125.GD1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-bcm2712-iommu-submit-v1-5-80e10cdde2ea@reactivated.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_151128_246231_9FC0D4D7 
X-CRM114-Status: GOOD (  16.56  )
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

On Sun, Jul 12, 2026 at 10:18:55PM +0100, Daniel Drake wrote:
> +static int bcm2712_iommu_of_xlate(struct device *dev,
> +				  const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev = of_find_device_by_node(args->np);
> +	struct bcm2712_iommu *mmu = platform_get_drvdata(iommu_dev);
> +
> +	dev_iommu_priv_set(dev, mmu);
> +	return 0;
> +}

Any chance this could work the way that smmuv3 does? I view it as the
more modern example..

> +static int bcm2712_iommu_map_pages(struct iommu_domain *domain,
> +				   unsigned long iova, phys_addr_t paddr,
> +				   size_t pgsize, size_t pgcount, int prot,
> +				   gfp_t gfp, size_t *mapped)
> +{
> +	struct bcm2712_iommu_domain *mydomain = to_bcm2712_domain(domain);
> +	struct pt_iommu *pt = &mydomain->pt.iommu;
> +
> +	return pt->ops->map_range(pt, bcm2712_iova_to_offset(mydomain, iova),
> +				  paddr, pgsize * pgcount, prot, gfp, mapped);
> +}

These ops should not be present, the iommpt provides the ops directly
through a macro;

> +static const struct iommu_ops bcm2712_iommu_ops = {
> +	.identity_domain = &bcm2712_identity_domain,
> +	.domain_alloc_paging = bcm2712_iommu_domain_alloc,
> +	.probe_device = bcm2712_iommu_probe_device,
> +	.device_group = generic_single_device_group,
> +	.of_xlate = bcm2712_iommu_of_xlate,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev	 = bcm2712_iommu_attach_dev,
> +		.iotlb_sync      = bcm2712_iommu_sync,
> +		.iotlb_sync_map  = bcm2712_iommu_sync_map,
> +		.flush_iotlb_all = bcm2712_iommu_sync_all,
> +		.free		 = bcm2712_iommu_domain_free,
> +		.map_pages       = bcm2712_iommu_map_pages,
> +		.unmap_pages     = bcm2712_iommu_unmap_pages,
> +		.iova_to_phys    = bcm2712_iova_to_phys,
> +	},

"default_domain_ops" should ideally be split out to a "paging domain
ops" static and set directly during alloc_paging. They are not really
"default" anymore if the driver has unique ops for every domain type.

Then use something like:

		IOMMU_PT_DOMAIN_OPS(bcm2712),

To define all the page table related ops automatically.

Any chace the HW can do a blocking_domain, or is the only way to do
that with an empty paging domain?

Jason

