Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2634CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hTfGHM2qB3g/FLyvX8FCIrm9+eNCgSr89Naia4gruos=; b=jnQCTSuWANThqjuUtVjmJMtD2Q
	p31jcBB8JmUNl9ZJ7tjZMRT1Yg4xYxE4CBMxpa5PTBU5Mos0CSu63UfLHkjyzSGdIsazp9KkptO3+
	xJzjMXhOdH7HOB349uFjFx+sPBh7YVXJQCS9tWf9k51Z68qqq8XfuM3DxUJjm53iywQuVOXn5eUMy
	zp5y90XhKr7jo28/JEMWXSlgfxLiAs5rnb7AHiCZDSJ3erbUofQ9QEH6X8/N+hTvKvCUHb+2FgucC
	URwtdwAfA4cHjTYP0GEblHJkERXSREyY8GLm3riCQcet+RBuDz552/QY9yly14CVezK1ayINpB5mo
	Ns2648Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTq3E-00000009yv5-2ElN;
	Sun, 31 May 2026 23:58:40 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTq3C-00000009yuk-1QdN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 23:58:39 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-91562bf6c12so19209185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 16:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780271917; x=1780876717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTfGHM2qB3g/FLyvX8FCIrm9+eNCgSr89Naia4gruos=;
        b=dyE4aE7xclvL4Hrbj87yVf0654DaU7VMS9i5RFrRHi2Q/QaVNfcTiz7xUq6zLlhL2g
         0Q8QMu6I/Jh4AjYSfu3mV1/WniHVe4D1q/fy/wPsrnwqZm3G21tSvsjpRov3qYi3b/O4
         YMSdkA/5+W2Vyqs0TmvGYcloIgF1yPi1RGq3EwqxHT52iQzME1TJQK+TSLlxTbQh4e6h
         0DY4tVIy1IP0y6r+nO6pdk062kzFRjfM63J43qTgYvyTO4YhQkvbA13XKXp3NVBlZXbP
         xuFF5c185XkdOSo0qKlyWg1tWcxaxYq+yLAh+cFCixpFfaXy5vr+V/f2Oia+RII4ZUQT
         x4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780271917; x=1780876717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTfGHM2qB3g/FLyvX8FCIrm9+eNCgSr89Naia4gruos=;
        b=cL3TkX7ghmvYYeqDPmFRkWkBZ7I61k/JaQu8YnSYTuzM8lYXrrqa1pRx9mGwVmwX7S
         1diHjrIPOfLNPAc00mYORipM4TCqICwaGUnIknGLk3PxzYu7fzRIEyCyBUT9YpQNRnOr
         PlY9h0fKpYmWFiriNtpUDxOx9+fXGNRal3WZV8rHSQtPSSPS0VSzPNH3Dr22Juumy8w/
         BMgNVJB9GguifrdHKjbdhvyiucbR4n8dUCBKXIssRAIrZnJfG7CHoBOpP9MILi2VTkMl
         jNrMN9JRA9b8x3kP88pgOKJ6XoAxrZV208GH5uVaCm4Q3ml9GIpY+0+94WlAPX+RpUuM
         vUGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mRvGrL/Ie4H964P/8yc3+mty/KLNn8m4MRX+7EsxBCVb27WHPpTcOnc8vytiA8ZEpltKXd0mH7eqzg1wOLjg6@lists.infradead.org
X-Gm-Message-State: AOJu0YzuNVlblVH5qY/gagW4FGWneBXgkAIGkayeiTaBn/GvtrpkYgSM
	R2Hv+B7jwi8jDK4a3JQ+e0qQ653oaqYl0PkPM23qeGiDMNPWnSfvh1DN7WyfXxDtn54=
X-Gm-Gg: Acq92OFOOC3my2U1lG4dubfdHt1+C6bf+qYNC18UkgdUV2ufXQDUxFRVdSDN6Ri5A3E
	ATfEqmZ4nnf/A0ZNWghArJlXQkAkKx7Q2C8+yvaqZSDOXKGZkYfz3/dJU05Qo+uZ1wNAEkpdyw7
	rEL0r1wS65BE/k5J+cFHTzZD2pISCGmJ/sXGp+crzbI46usYNHikjPxAsxM0hEbs6IjAdCOJaAp
	t6x/ILckNlui2bc9B93qkR2AXcLeXDzw3fc7wljAig6lCMUKEm7MIjNwrsMyI3d9+RiERsONBqB
	BfA619wskqM3J1GyZFHzhjDhtGZoj7Z+IQf4lH2yaBnwv+uN7t2NDHdHZIKgIK2cwM7NMOWjgFL
	dMeI9fA4qHK3pNMFkWWIUpJPC4XBUDdutmfvYkq3wyinKTeyHxyCrUSMQqCxMjNudARWcR0tc7P
	uuxZTPM93ZUhcjPLzDZqWokNQVB15uK4KLLePkTty3Bsecz4/OA+CyfP+do2Cb7+bktLsokukF3
	1SHBQGQpTkftQDC
X-Received: by 2002:a05:620a:bc8:b0:8cd:97de:bb52 with SMTP id af79cd13be357-9153d9703b8mr1495082185a.22.1780271916895;
        Sun, 31 May 2026 16:58:36 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153262e2a6sm837284285a.40.2026.05.31.16.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 16:58:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wTq39-00000001Lt5-3GHA;
	Sun, 31 May 2026 20:58:35 -0300
Date: Sun, 31 May 2026 20:58:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
	adrian.larumbe@collabora.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	liviu.dudau@arm.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, alex@shazbot.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, suravee.suthikulpanit@amd.com,
	dwmw2@infradead.org, xlpang@linux.alibaba.com,
	oliver.yang@linux.alibaba.com, shiyu.zsq@linux.alibaba.com,
	wei.guo.simon@linux.alibaba.com
Subject: Re: [PATCH 7/9] vfio/iommufd: use iova_to_phys_length for efficient
 unmap
Message-ID: <20260531235835.GX2487554@ziepe.ca>
References: <20260529115116.GR2487554@ziepe.ca>
 <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260531093637.3893199-8-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260531093637.3893199-8-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_165838_390791_7C3C97D9 
X-CRM114-Status: GOOD (  20.49  )
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

On Sun, May 31, 2026 at 05:36:35PM +0800, Guanghui Feng wrote:
>  		/*
> -		 * This is pretty slow, it would be nice to get the page size
> -		 * back from the driver, or have the driver directly fill the
> -		 * batch.
> +		 * Use iova_to_phys_length to get both the physical address
> +		 * and the PTE page size in a single page table walk, allowing
> +		 * us to skip ahead by the contiguous region size instead of
> +		 * walking the page tables for every PAGE_SIZE step.
>  		 */
> -		phys = iommu_iova_to_phys(domain, iova) - page_offset;
> -		if (!batch_add_pfn(batch, PHYS_PFN(phys)))
> -			return;
> -		iova += PAGE_SIZE - page_offset;
> +		phys = iommu_iova_to_phys_length(domain, iova, &pgsize) -
> +		       page_offset;
> +		if (!pgsize || pgsize < PAGE_SIZE)
> +			pgsize = PAGE_SIZE;

It is actually a bug if it returns something < PAGE_SIZE, it should
WARN_ON and try to continue.

> @@ -1177,25 +1177,41 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
>  
>  	iommu_iotlb_gather_init(&iotlb_gather);
>  	while (pos < dma->size) {
> -		size_t unmapped, len;
> +		size_t unmapped, len, pgsize;
>  		phys_addr_t phys, next;
>  		dma_addr_t iova = dma->iova + pos;
>  
> -		phys = iommu_iova_to_phys(domain->domain, iova);
> +		/* Single page table walk returns both phys and PTE size */
> +		phys = iommu_iova_to_phys_length(domain->domain, iova,
> +						  &pgsize);
>  		if (WARN_ON(!phys)) {
>  			pos += PAGE_SIZE;
>  			continue;
>  		}
> +		if (!pgsize || pgsize < PAGE_SIZE)
> +			pgsize = PAGE_SIZE;
>  
>  		/*
>  		 * To optimize for fewer iommu_unmap() calls, each of which
>  		 * may require hardware cache flushing, try to find the
>  		 * largest contiguous physical memory chunk to unmap.
> +		 *
> +		 * Calculate remaining contiguous bytes within this PTE from
> +		 * our position, then try to join following physically
> +		 * contiguous PTEs.
>  		 */
> -		for (len = PAGE_SIZE; pos + len < dma->size; len += PAGE_SIZE) {
> -			next = iommu_iova_to_phys(domain->domain, iova + len);
> +		len = pgsize - (iova & (pgsize - 1));
> +		for (; pos + len < dma->size; ) {
> +			size_t next_pgsize;

Things should be arranged so the iommu_iova_to_phys_length() always
returns the best length, either because it called into iommupt to get
it or because it accumulated internally on an old driver.

Probably to make this work well the API should include the last
address to reach so it can stop iterating at the right point.

Jason

