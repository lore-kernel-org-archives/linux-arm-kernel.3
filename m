Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC36C73C66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC7rm+Bwrl6nau/SPrD4L98tdg/BZZbxkCiAvlgkDgo=; b=ciRGxufMBrhDUTVNQ5QH4bGi8J
	cDootBJ0h7NzieqHulTyBbGKN4ESfoZjr/pJf40a25C8HFMJHs7jtzv/SFg1cXqACXH4ohWbAgjbn
	ZAMT4Y/b2jhEhPBdiSx+ZURm+BCHVDRyv8spyiKatRKWajjhtGTND3SKfy2kTUXdk8atcjp9jwQWv
	3qnSHXSMqLynRzkMwKG031fFllpNQlqSx+DZZbv3MQ/yk9dijKb6E7NTk4+nscXBBrD893g31dIbS
	u6BJRyUwfprD8I7eJQmNYXy2xL4uDVRuKjdGPiQdV2WCqoYmlJb7NhLMcBqKLgmSamwZab98IDXA4
	KhMfcJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZrk-000000080YO-3p82;
	Tue, 17 Jun 2025 17:12:56 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZEU-00000007sxa-0o4I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:32:23 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7d38d1eae03so567726185a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750177941; x=1750782741; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nC7rm+Bwrl6nau/SPrD4L98tdg/BZZbxkCiAvlgkDgo=;
        b=IqWqQiAyWCykB2r072NPZvTOoa0Kj573/8mCer0hGs5r2s4N9rxECoovca1kHgUvas
         LUDOSIxqAkgrrv4D3YO8dq1xySCtnsnhIl5xqvkdU5NItF1epg8/VkfiI9CeZaaFfalm
         NPmJsxCVf9mfndgPmeA8KemGyijyYq8MzykdLZ4Sxpx0oOt9G2IPgZDUxwm2czhIG0EG
         jVT8KzHoxdy1Si19uHulXO/FZlGtsTEkmFzQWoM6Vb0tJaW3rlQw6UyJwZ+D7uEqRZfK
         aIgU0OdlvGFvp9bKy/CgFvsDlZuZ8HU31d1m41g2V18urniHWs/XBbGb2Tk3IOXtdidO
         FmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177941; x=1750782741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC7rm+Bwrl6nau/SPrD4L98tdg/BZZbxkCiAvlgkDgo=;
        b=RkNLh+6Gz1S/C/NCVjnAgKwFVmcr09d2b7Xpon2XXHAFreFroUVpND8caMZDiiWAUj
         vCmc46TC1E9bC154zC1DpdPu5/sy5aFf7pYRgjZy+lWRP8NevWIMdfBEwt28/I+pJ9YG
         vrcB/Gf9ni4d3DbZfTAs8nQkH5HEvrjUvqwbm2WGbGMZIbFIjvNNWlvtmciAk9TE8Qd8
         x/97rp8SNg20UpyltPmR+KHUo5CJy4BRbj2/Hpi2rWxsefdphKU8xwuG+pUsk0D9Oy/U
         wk4i0E5ibfiYTp+zNtQIMM1p2NU1TDlSYdtI9SGvP/8DIgCZEenoOuQ+JJgFV2mGxOim
         gaoA==
X-Forwarded-Encrypted: i=1; AJvYcCUeN/YgtGVghOlgVdyUaAGPBwImPhOJ7i/lTjzEPzeMFNcIpt6JEZsSFMhePRnDhjIw/u0Pi/a0QFOYuPE9xENK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw74qjEilGbE1fGm/fB8b+z1sohw9BgO+GVeQR+7KQa++F31Or8
	tgHt6hpvWRqUqV9F02gYgA+IuK1D/BVtH4ACBzur6g+V4hlsP6W3W5Uirt75eoRW+Lw=
X-Gm-Gg: ASbGncuj5VYMW7DzKc6M/h14rYh+dC+vknaIn2wKBhwZi9I8Zi4IDXRTG+bIN1cPDzs
	2oyB+gNfoHi3bVNg4ckVROiJ2bIyL5IdAj9uES8ZzpMXs9WgN1jFSL4DPmk0efbXczKdICaRJYc
	eUjkRgyd5Ue0loQ9gDv/aCyXAbBPuG+7Mu0t6YOwY7KUiwpJi+tWG1awtLNh6conxQ0CULTswtd
	5gLUtH+wNM1xzucKUH34m02qU73kK3L5wfwxl1FjJFN4sUDSmuPFWgb74f7zW8O2jNggY2iCv8q
	j48saugRVdqseqJO1W1cIMEujjJEwSP9mch/ABScvvijwvsRld1Ujh2X+qEiTKTG39/RmSc3rL2
	QLYz2+gQkHl2PBN4Krrrd7prup0t6P/yX46aliQ==
X-Google-Smtp-Source: AGHT+IEn/8UILucmSUjm3Ghk3vbiODu7JZ3ElN7VeLJXr7Tqd6s5+YqK3eHc6OVfIyOPTPJQFQWeeQ==
X-Received: by 2002:a05:6214:2344:b0:6fa:bd17:32a with SMTP id 6a1803df08f44-6fb47798100mr185358346d6.29.1750177940786;
        Tue, 17 Jun 2025 09:32:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb5f63431bsm8459256d6.43.2025.06.17.09.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:32:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRZER-00000006X8g-3Ob6;
	Tue, 17 Jun 2025 13:32:19 -0300
Date: Tue, 17 Jun 2025 13:32:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250617163219.GF1376515@ziepe.ca>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_093222_243202_70CBC866 
X-CRM114-Status: GOOD (  33.91  )
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

On Mon, Jun 16, 2025 at 04:55:51PM +0200, Benjamin Gaignard wrote:

> +static struct vsi_iommu *vsi_iommu_from_dev(struct device *dev)
> +{
> +	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
> +
> +	return data ? data->iommu : NULL;

It would be a serious bug if dev_iommu_priv_get() is null, don't check
for it, let it crash.

> +static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
> +{
> +	struct vsi_iommu_domain *vsi_domain;
> +
> +	if (!dma_dev)
> +		return NULL;
> +
> +	vsi_domain = kzalloc(sizeof(*vsi_domain), GFP_KERNEL);
> +	if (!vsi_domain)
> +		return NULL;
> +
> +	/*
> +	 * iommu use a 2 level pagetable.
> +	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
> +	 * Allocate one 4 KiB page for each table.
> +	 */
> +	vsi_domain->dt = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> +					      SPAGE_SIZE);
> +	if (!vsi_domain->dt)
> +		goto err_free_domain;
> +
> +	vsi_domain->dt_dma = dma_map_single(dma_dev, vsi_domain->dt,
> +					    SPAGE_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(dma_dev, vsi_domain->dt_dma)) {
> +		dev_err(dma_dev, "DMA map error for DT\n");
> +		goto err_free_dt;
> +	}
> +
> +	vsi_domain->pta = iommu_alloc_pages_sz(GFP_KERNEL | GFP_DMA32,
> +					       SPAGE_SIZE);
> +	if (!vsi_domain->pta)
> +		goto err_unmap_dt;
> +
> +	vsi_domain->pta_dma = dma_map_single(dma_dev, vsi_domain->pta,
> +					     SPAGE_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(dma_dev, vsi_domain->pta_dma)) {
> +		dev_err(dma_dev, "DMA map error for PTA\n");
> +		goto err_free_pta;
> +	}
> +	vsi_domain->pta[0] = vsi_mk_pta(vsi_domain->dt_dma);

> +
> +	vsi_table_flush(vsi_domain, vsi_domain->pta_dma, 1024);
> +	vsi_table_flush(vsi_domain, vsi_domain->dt_dma, NUM_DT_ENTRIES);

dma_map_single already flushes, put things in the write order and no
need to double flush.

> +	spin_lock_init(&vsi_domain->iommus_lock);
> +	spin_lock_init(&vsi_domain->dt_lock);
> +	INIT_LIST_HEAD(&vsi_domain->iommus);
> +
> +	vsi_domain->domain.geometry.aperture_start = 0;
> +	vsi_domain->domain.geometry.aperture_end   = DMA_BIT_MASK(32);
> +	vsi_domain->domain.geometry.force_aperture = true;

Initialize domain.pgsize_bitmap here and remove this:

+       .pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,

It is going away.

> +	return &vsi_domain->domain;
> +
> +err_free_pta:
> +	iommu_free_pages(vsi_domain->pta);
> +err_unmap_dt:
> +	dma_unmap_single(dma_dev, vsi_domain->dt_dma,
> +			 SPAGE_SIZE, DMA_TO_DEVICE);
> +err_free_dt:
> +	iommu_free_pages(vsi_domain->dt);
> +err_free_domain:
> +	kfree(vsi_domain);
> +
> +	return NULL;
> +}
> +
> +static phys_addr_t vsi_iommu_iova_to_phys(struct iommu_domain *domain,
> +					  dma_addr_t iova)
> +{
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	phys_addr_t pt_phys, phys = 0;
> +	u32 dte, pte;
> +	u32 *page_table;
> +
> +	spin_lock_irqsave(&vsi_domain->dt_lock, flags);

No locking should be here. Drivers are supposed to use cmpxchg to set
the new tables to avoid races, however there is complexity around the
cache flushing that this locking solves.

IDK, you might be better to use the new iommupt stuff since all these
algorithms including the complicated lockless cache flushing
optmization are sorted out there.

https://lore.kernel.org/linux-iommu/0-v3-a93aab628dbc+521-iommu_pt_jgg@nvidia.com/

> +	dte_index = vsi_iova_dte_index(iova);
> +	dte_addr = &vsi_domain->dt[dte_index];
> +	dte = *dte_addr;
> +	if (vsi_dte_is_pt_valid(dte))
> +		goto done;
> +
> +	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | GFP_DMA32);
> +	if (!page_table)
> +		return ERR_PTR(-ENOMEM);

Don't use get_zeroed_page for page table memory.

> +
> +	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
> +	if (dma_mapping_error(dma_dev, pt_dma)) {
> +		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
> +		free_page((unsigned long)page_table);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	dte = vsi_mk_dte(pt_dma);
> +	*dte_addr = dte;
> +
> +	vsi_table_flush(vsi_domain, pt_dma, NUM_PT_ENTRIES);
> +	vsi_table_flush(vsi_domain,
> +			vsi_domain->dt_dma + dte_index * sizeof(u32), 1);

Double flushing again.

> +static int vsi_iommu_map_iova(struct vsi_iommu_domain *vsi_domain, u32 *pte_addr,
> +			      dma_addr_t pte_dma, dma_addr_t iova,
> +			      phys_addr_t paddr, size_t size, int prot)
> +{
> +	unsigned int pte_count;
> +	unsigned int pte_total = size / SPAGE_SIZE;
> +	phys_addr_t page_phys;
> +
> +	assert_spin_locked(&vsi_domain->dt_lock);
> +
> +	for (pte_count = 0; pte_count < pte_total; pte_count++) {
> +		u32 pte = pte_addr[pte_count];
> +
> +		if (vsi_pte_is_page_valid(pte))
> +			goto unwind;
> +
> +		pte_addr[pte_count] = vsi_mk_pte(paddr, prot);

So why is this:

#define VSI_IOMMU_PGSIZE_BITMAP 0x007ff000

If the sizes don't become encoded in the PTE? The bits beyond 4k
should reflect actual ability to store those sizes in PTEs, eg using
contiguous bits or something.

> +		paddr += SPAGE_SIZE;
> +	}
> +
> +	vsi_table_flush(vsi_domain, pte_dma, pte_total);
> +
> +	return 0;
> +unwind:
> +	/* Unmap the range of iovas that we just mapped */
> +	vsi_iommu_unmap_iova(vsi_domain, pte_addr, pte_dma,
> +			     pte_count * SPAGE_SIZE);
> +
> +	iova += pte_count * SPAGE_SIZE;
> +	page_phys = vsi_pte_page_address(pte_addr[pte_count]);
> +	pr_err("iova: %pad already mapped to %pa cannot remap to phys: %pa prot: %#x\n",
> +	       &iova, &page_phys, &paddr, prot);

No pr_errs prints on normal errors.

> +static void vsi_iommu_detach_device(struct iommu_domain *domain,
> +				    struct device *dev)
> +{
> +	struct vsi_iommu *iommu;
> +	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
> +	unsigned long flags;
> +	int ret;
> +
> +	/* Allow 'virtual devices' (eg drm) to detach from domain */
> +	iommu = vsi_iommu_from_dev(dev);
> +	if (WARN_ON(!iommu))
> +		return;
> +
> +	dev_dbg(dev, "Detaching from iommu domain\n");
> +
> +	if (!iommu->domain)
> +		return;
> +
> +	spin_lock_irqsave(&vsi_domain->iommus_lock, flags);
> +	list_del_init(&iommu->node);
> +	spin_unlock_irqrestore(&vsi_domain->iommus_lock, flags);

The list del should probably be after the vsi_iommu_disable()? We
expect invalidations to continue to keep the IOTLB consistent until
the HW is no longer walking the page table.

> +static struct iommu_device *vsi_iommu_probe_device(struct device *dev)
> +{
> +	struct vsi_iommudata *data;
> +	struct vsi_iommu *iommu;
> +
> +	data = dev_iommu_priv_get(dev);
> +	if (!data)
> +		return ERR_PTR(-ENODEV);
> +
> +	iommu = vsi_iommu_from_dev(dev);
> +
> +	pr_info("%s,%d, consumer : %s, supplier : %s\n",
> +		__func__, __LINE__, dev_name(dev), dev_name(iommu->dev));

No prints

> +	/*
> +	 * link will free by platform_device_del(master) via
> +	 * BUS_NOTIFY_REMOVED_DEVICE
> +	 */
> +	data->link = device_link_add(dev, iommu->dev,
> +				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +
> +	/* set max segment size for dev, needed for single chunk map */
> +	if (!dev->dma_parms)
> +		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> +	if (!dev->dma_parms)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));

I'm not sure this should be in an iommu driver??? Doesn't dma-iommu.c
deal with this stuff

> +static void vsi_iommu_release_device(struct device *dev)
> +{
> +	struct vsi_iommudata *data = dev_iommu_priv_get(dev);
> +
> +	device_link_del(data->link);

Leaking data..

> +static int vsi_iommu_of_xlate(struct device *dev,
> +			      const struct of_phandle_args *args)
> +{
> +	struct platform_device *iommu_dev;
> +	struct vsi_iommudata *data;
> +
> +	data = devm_kzalloc(dma_dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	dev_info(dev, "%s,%d\n", __func__, __LINE__);
> +	iommu_dev = of_find_device_by_node(args->np);
> +
> +	data->iommu = platform_get_drvdata(iommu_dev);
> +
> +	dev_iommu_priv_set(dev, data);

Can you use iommu_fwspec_add_ids() instead of this?

The only thing 'data' is doing here is to pass the iommu_dev, it is
much better if you can get that from the fwspec in probe, like say ARM
does it:

	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);

	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);

And then don't allocate memory in the of_xlate.

> +static struct iommu_ops vsi_iommu_ops = {
> +	.domain_alloc_paging = vsi_iommu_domain_alloc_paging,
> +	.probe_device = vsi_iommu_probe_device,
> +	.release_device = vsi_iommu_release_device,
> +	.device_group = generic_single_device_group,
> +	.pgsize_bitmap = VSI_IOMMU_PGSIZE_BITMAP,

move pgsize_bitmap to alloc paging


> +static int vsi_iommu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct vsi_iommu *iommu;
> +	struct resource *res;
> +	int num_res = pdev->num_resources;
> +	int err, i;
> +
> +	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
> +	if (!iommu)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, iommu);

This should be done last after the function can't fail

> +
> +	iommu->group = iommu_group_alloc();
> +	if (IS_ERR(iommu->group)) {
> +		err = PTR_ERR(iommu->group);
> +		goto err_unprepare_clocks;
> +	}

This should not be in iommu drivers. I'm guessing you want
generic_single_device_group() ?

> +	/*
> +	 * use the first registered sysmmu device for performing
> +	 * dma mapping operations on iommu page tables (cpu cache flush)
> +	 */
> +	if (!dma_dev)
> +		dma_dev = &pdev->dev;

Huh? This is racey, and why? What is the reason not to use the current
device always? Put the dev in the iommu_domain during
domain_alloc_paging and get it from  dev->iommu->iommu_dev->dev.

> +
> +	pm_runtime_enable(dev);
> +
> +	err = iommu_device_sysfs_add(&iommu->iommu, dev, NULL, dev_name(dev));
> +	if (err)
> +		goto err_put_group;
> +
> +	err = iommu_device_register(&iommu->iommu, &vsi_iommu_ops, dev);
> +	if (err)
> +		goto err_remove_sysfs;

Register should usually be last.

> +	for (i = 0; i < iommu->num_irq; i++) {
> +		int irq = platform_get_irq(pdev, i);
> +
> +		if (irq < 0)
> +			return irq;
> +
> +		err = devm_request_irq(iommu->dev, irq, vsi_iommu_irq,
> +				       IRQF_SHARED, dev_name(dev), iommu);
> +		if (err)
> +			goto err_unregister;
> +	}

Why allocate interrupts after registration?

Jason

