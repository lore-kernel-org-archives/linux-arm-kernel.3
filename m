Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B95C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWuA5n/7XV52piKpzEtlj4+eRvGXTp7zsvMDV3q1c/g=; b=KQ1t4wNAe/hHe52dMLBSTQXgSW
	8RY3n9/RjG1OcgDfifAwy1zzYJl6lKWbF7pmtPXtgL43t5EhKx1GeODNwnFD4497MxPMiY1d9Kdpm
	QBgzlq+gJIchw2Zx0E1eirPcNw5jQ3eUkLcYjeVXVZKaJDasbpl377kLe1uj+KXtdJaDNnOY+iS/s
	DW7Au3vm5VIHyuYR8KNkaCv2XqSnYY/iyy2j59fZi5SPuSP4gCEgxXFUgQ9pfwCzYa7mMxnBzzv77
	Eq15LCJFiYP7Bie88itChOdn3nFrGxTnCc+PfOi/yhcJQFtSJKWKlRHQDDiUA8Gr7bZBPPZ6Q5+D5
	0v8faNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRw17-0000000Am9j-3qu6;
	Wed, 18 Jun 2025 16:52:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuEH-0000000AVnN-0drS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 14:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nWuA5n/7XV52piKpzEtlj4+eRvGXTp7zsvMDV3q1c/g=; b=HLW7p9rBkU7sOrgSYEAZwEFefe
	UaWd1NEqCBLS7goXVUsM4TFud7T6xzP9Q+nXvT4mGfv2mXAKvBEWS+q1ZTiFQBRmwXMP2gSNmDXO4
	fXHmGgXNC4c4HlTyKGiWiQI/H8iYL/cwNI5V6UkEDQwdFyquRaJUX746f9cdBTdQetaqd/gHSm8ds
	s6zQB1zqoBNTJoJp1oBQ5iL5gCI9Coe7Zg4dZVEzqP+lkOUeSaqo23p13b55JxNM11IkfakB5WinJ
	Kgc0q+YIlTJb/6kz8hq/YMEInPPsY6qKoY67EVDVb4paLrQ7FG/qz2xfrPqfhe5GholdbdvlDfYf9
	pWVh4jNA==;
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuEE-000000047aQ-1iJ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 14:57:32 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7d3e7641b76so71548285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750258648; x=1750863448; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWuA5n/7XV52piKpzEtlj4+eRvGXTp7zsvMDV3q1c/g=;
        b=fRIi+RUuAlTr55qnUST6K28RL559QqjaC3qKJontlZhXsSifrbY+2oAJ711aDq8Wvu
         N7Y/Xf4vxLvrT7CjYIfLeKtdzB0Q/eon2HqsKOnL4ZvD1iL8hplsgvjerVF9LXlUju/s
         tLVuDfPdOL2QskJXHYsxkca0cMAufvDDYJXe4B8/F8sr03JBv0zfT8H5S0RL0oFX/Fuc
         jgq9MUncridmoe+qtQ95NCQS9y/h8ZI/AMekbRBToshDo8gUjBPg3GzZWcslrEIKPvLX
         gGva54NI7UjplBvaSMQAywJh7TUoooEdaz9bdUfsnWYtURd05RZE724gl9ODja1jgaO+
         Vxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750258648; x=1750863448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWuA5n/7XV52piKpzEtlj4+eRvGXTp7zsvMDV3q1c/g=;
        b=ULm13XEEzetx01OUFusFHamgr6yVP7wyzqjeuhrViuWL4OkUGgBQWCUeFg7MZCODaA
         Qu7zDGqP+2wREY5KKtG1R0gTkJA2LIsAK13CLlEoTyDM6TTFtjIS6v2JUNtwWZ8jrBcs
         FzBoZ87qNygKlO5kbD60LL88eWUO/S16LZ5khRqOeWTjl3CSbeldXG2RrAdMCVeyxVYb
         51PZInXBrF+2Sa0GcXSz3VUPDQh1H2Az44vXpVnKTPZilFppvCaHdSQo8Vb207fBk+6g
         aihOT5L9oChQ7kzuWDDVQ/94gYQnpacXHCwII/SBjezf4wDryK/iJKB69vGuPAt8y+2y
         GukA==
X-Forwarded-Encrypted: i=1; AJvYcCXeSD+rpvkCp3b/4qt6CKCGwaFuwvI4xV1kECqztOlC+6cO8tIjxYIjMybpJf6gCEz7g1GEhN3gOpM4bFcPObwU@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9EEDgT090vwPQp3z11qu1PBaZ+h+wxy3wbzXdVAkixUte1wxW
	jONtTPVnqCYpwHunOKEugVmdsu7mZ7s3nPI8SjRZSovlHa7FsPVWldTpEyqHQR5gJk3iBpQWmQr
	RGKwa
X-Gm-Gg: ASbGnctQ9uvF8L7mwyrOjWWSI3X5nOCGUCciDFcqr8dW4tw815aQTRLHSxjHNA8MasX
	71hjTP6yUppIciDkIIXW1YG/lRe3G4QH17AgjQ+Bu+FfqPQelOgEDKfxQqZt/0WwqmF9yC6AY9Q
	kaKG41jDoHaiFe+EAfMmasDyKbK4xbpct0vteo6Sk7YwAKWDnCRbFT29Caxa1bGCICJ4xJ1RgJo
	LG+OiKr3qSlgVvzOEZFMfl0HWd4TJ9qH9pU4Kkq/lSC7xnR8vRTW1SFckUpFGvGSo1e2dwtLrOe
	nlt8YgMW/LlXUZZDJGECV2kY7ExemEDJ1mxv0X1403/LA1xBcPC+PAuABV/b73LSYcHV1IpmCO1
	9uQvQOAwz8JS4WDED7GTDWb+v1AaJ6plPiQ99tw==
X-Google-Smtp-Source: AGHT+IEqAm8w07CYn9jssi0u9N9oTKmQEBd4zXaVvYiKXP4kVC2Pg2ZszP/NIklhkByTPLh6hrPUVw==
X-Received: by 2002:a05:620a:2720:b0:7d3:8fd2:c0cd with SMTP id af79cd13be357-7d3c6d0c5e6mr2844239185a.56.1750258645240;
        Wed, 18 Jun 2025 07:57:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8edf51fsm771719285a.93.2025.06.18.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:57:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRuE7-00000006osS-460H;
	Wed, 18 Jun 2025 11:57:23 -0300
Date: Wed, 18 Jun 2025 11:57:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250618145723.GR1376515@ziepe.ca>
References: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
 <20250618140923.97693-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618140923.97693-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_155730_710971_8637A8D8 
X-CRM114-Status: GOOD (  20.23  )
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

On Wed, Jun 18, 2025 at 04:09:12PM +0200, Benjamin Gaignard wrote:
> +config VSI_IOMMU
> +	bool "Verisilicon IOMMU Support"
> +	depends on ARM64
> +	select IOMMU_API
> +	select ARM_DMA_USE_IOMMU

ARM_DMA_USE_IOMMU is only used by ARM32, you don't need it if you
depends on ARM64

> +static void vsi_iommu_release_device(struct device *dev)
> +{
> +	struct vsi_iommu *iommu = dev_iommu_priv_get(dev);
> +
> +	device_link_remove(dev, iommu->dev);
> +}

This does not seem right, release is supposed to reprogram the HW to
stop walking any page table.

You should implement a static blocked (or identity?) domain that idles
the hardware and use that as the blocked and release_domain in the
ops.

The logic around vsi_iommu_detach_device() and
vsi_iommu_attach_device() is also not quite right. The attach can
happen while iommu->domain is already set and doesn't deal with
removing the iommu from the old domain's list.

I would probably change vsi_iommu_enable() into vsi_iommu_set_paging()
and then presumably vsi_iommu_disable() is vsi_iommu_set_blocking() ?

vsi_iommu_detach_device() should be deleted and integrated into the
blocked domain and attach error unwind.

> +static int vsi_iommu_of_xlate(struct device *dev,
> +			      const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev;
> +
> +	if (!dev_iommu_priv_get(dev)) {
> +		iommu_dev = of_find_device_by_node(args->np);
> +		if (WARN_ON(!iommu_dev))
> +			return -EINVAL;
> +
> +		dev_iommu_priv_set(dev, platform_get_drvdata(iommu_dev));
> +	}

The driver should ideally not be calling dev_iommu_priv_set/get here,
and this leads the reference doesn't it? Do what ARM did to locate
the iommu_dev.

I would also add a comment here:

> +static int vsi_iommu_map(struct iommu_domain *domain, unsigned long _iova,
> +                        phys_addr_t paddr, size_t size, size_t count,
> +                        int prot, gfp_t gfp, size_t *mapped)
> +{
> +       struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +       unsigned long flags;
> +       dma_addr_t pte_dma, iova = (dma_addr_t)_iova;
> +       u32 *page_table, *pte_addr;
> +       u32 dte, pte_index;
> +       int ret;

/*
 * IOMMU drivers are not supposed to lock the page table, however this
 * driver does not safely handle the cache flushing or table
 * installation across concurrent threads so locking is used as a simple
 * solution.
 */

> +       spin_lock_irqsave(&vsi_domain->dt_lock, flags);

Jason

