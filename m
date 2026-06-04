Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CCBCD6E6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHKibgV+RCLusPgB3KbLwXXB/tqYgf/ZSAW8CwOeGIc=; b=dEkUV3iMKfuJ5I05j/W2y9re5M
	4/qmKe2yRqUrjQu9poAXSQU9u61tenUn1ThkYsboyBcDAzY52iV+DgFaSvjp3SfRrN95rnmpnTMAV
	XDY3UXupiZgIuy+4c9G0pqn5/OCHm76B4zTg/ki3d7XHL/BHoawhi0B8zWdbpj2FLhSTdKjJQL362
	w0Fk0m7n31lJNYpaug3BBAjIzjvEzuNRZ/v6MSmgKbo3oOL1sYprjHUmgoeXlHF79lqUFAy/kNUKq
	PaSXlRsOcsZcHYr/cGV4ujXjZbCmH4TdA383/9hZmYGqMVPi32gshCKfRTw7h9K5KXaT/xSYWq0qn
	GFpUq3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV92N-0000000GtWQ-1OYO;
	Thu, 04 Jun 2026 14:27:11 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV92L-0000000GtVg-047g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:27:10 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-9157b949fc7so106440385a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780583228; x=1781188028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rHKibgV+RCLusPgB3KbLwXXB/tqYgf/ZSAW8CwOeGIc=;
        b=jVYZToXjNhDQp+VwyxkJ0khGYP95op4dJdYF+FEw2vFb+veY7xRn+RDQECelTX20lu
         VYFZohe/5hWSG8rOsA5bPCnTDSxG/eUfgv+u+mbe8bvubQNOyu1UOSWNQBFQHd84/PZs
         CCq0j6saHyRJOwCVLyI817zRDuTjR/IkTVQ7TO5CgKKe1YQ+QxdxcMzu8GAvSqVQDoep
         ST29ozhymu0jPISon4Fg+VZW0M2qKwB+NLZPj73Vb3M9yjxyEH/7DPOziNX0h0BkSCp+
         bs1zT70TRcRvQIe9+qPPu6emDMaJgT7OVrHD8fQ2jG1zsk9LaJgoyF31gjLipFJ/nIL8
         4mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583228; x=1781188028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHKibgV+RCLusPgB3KbLwXXB/tqYgf/ZSAW8CwOeGIc=;
        b=BGAoa9io4sByaIK1Q+5/j6FUFpPA8ylTfD6X0VuGIhVaumpBbDQBCk12yu/n2NAflm
         lbAC6p+T4gqtQ9Axg3LGSZX/ZivLtPN3c8fB7R0NQYgS4NUlRYGURYxP7f9HIwYqlNH/
         wwds3HZIfMqMej26rLJ/hIg+W1pl+UfS7BDNDDFTtPddeeEjQxs01AvS87Xm0YKuXrD4
         Jx1yCKDdI+kb7bybvObDkVOWdMrqg9h99LtMjBr+q88ayczsmJv+/36rv8XNHl3IiaOO
         DA+Gc9KEXgo5Utt3D9CrKyh87F01Oc/VZgtM3nZ6+IxuIr6CvZAA5ZNnouBzowEJZeH/
         BwFA==
X-Forwarded-Encrypted: i=1; AFNElJ/GIIdcW83wwjXbjqhu4QJOc4qzrh+UEhDC9jBkdhOUS+FtHAW+imVZcgsNHAFjgZ2T482zK6FjuO/I4RKUMVSs@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFU+iq8zg5VI9BiwR4W6gQXnTgXfHPpQCylYp2uusodnmUVfJ
	yntyVtfn5dysvUEXAGN4S1dlpr33dyQ1YNpO0fbTPaxjSFQm2CDA0YQO1AJ+sEDcTO4=
X-Gm-Gg: Acq92OFOm6RCQs8biBvhSpIm5GtgO5oaEGWKkUtbDSPhHdeFZ6MlCJqq9JkvA2rbRh/
	GqDxucVzhhyKv+PwAHtiFa2rBoa9haT5NhjbKx3ooN7kP0rdVOxsUNLi9w1i2qjfukBwYauTcmQ
	uKLLu5kPnd9b4uATo4j9ibKUUk8PxQhfHVpdaDvM4OEvb2fRPCT7B1sMNrgP0L4KSv/p2IdRWXd
	x+aeZzplZC9BbWUNktsG0q3bjM4aMPyXCSnHD4O00WKNLEK/UBWIwptBdRvFX6nQAjkUlQSTgQt
	/4cQSGzCOF/UKcbpHMObLEgd69YsFOYU3TIz9w9ZJqQuLcH+jygVgWrrqEwL13Knj3aiagOLxdh
	IDdECiSCgj2Xgd7ejrcG0pmsDMLIe74VlxT9kAFTDLhQQ7fjnwS0YBNLQexJVZhKKGhlT8B9p8G
	wTwsvpN5AbDCHa8B5eLiRd6wYGfada317WPOCubQ1j0h0J2ST5hXbzqkBm5cH7rQSdIEvzWMENA
	GrP6SMeJjvdNpBeSiaXIYjLBOg=
X-Received: by 2002:a05:620a:6cc2:b0:90f:b39e:ec8 with SMTP id af79cd13be357-9158a6998c8mr1313811585a.17.1780583227568;
        Thu, 04 Jun 2026 07:27:07 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3e0d55sm600410185a.43.2026.06.04.07.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:27:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wV92I-00000008IGV-29F2;
	Thu, 04 Jun 2026 11:27:06 -0300
Date: Thu, 4 Jun 2026 11:27:06 -0300
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
Subject: Re: [PATCH v3 23/32] vfio: use iova_to_phys_length for efficient
 unmap
Message-ID: <20260604142706.GZ2487554@ziepe.ca>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-24-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603151804.1963871-24-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_072709_080480_6A8DBB9F 
X-CRM114-Status: GOOD (  19.84  )
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

On Wed, Jun 03, 2026 at 11:17:55PM +0800, Guanghui Feng wrote:
> Use iommu_iova_to_phys_length() to get PTE page size, allowing
> traversal by actual mapping granularity instead of PAGE_SIZE steps.
> 
> Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
> Acked-by: Shiqiang Zhang <shiyu.zsq@linux.alibaba.com>
> Acked-by: Simon Guo <wei.guo.simon@linux.alibaba.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c8151ba54de3..115d88d7003e 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1177,25 +1177,42 @@ static long vfio_unmap_unpin(struct vfio_iommu *iommu, struct vfio_dma *dma,
>  
>  	iommu_iotlb_gather_init(&iotlb_gather);
>  	while (pos < dma->size) {
> -		size_t unmapped, len;
> +		size_t unmapped, len, pgsize;
>  		phys_addr_t phys, next;
>  		dma_addr_t iova = dma->iova + pos;
>  
> -		phys = iommu_iova_to_phys(domain->domain, iova);
> -		if (WARN_ON(!phys)) {
> +		/* Single page table walk returns both phys and PTE size */
> +		phys = iommu_iova_to_phys_length(domain->domain, iova,
> +						  &pgsize);
> +		if (WARN_ON(phys == PHYS_ADDR_MAX)) {
>  			pos += PAGE_SIZE;
>  			continue;
>  		}
> +		if (WARN_ON(!pgsize || pgsize < PAGE_SIZE))
> +			pgsize = PAGE_SIZE;
>  
>  		/*
>  		 * To optimize for fewer iommu_unmap() calls, each of which
>  		 * may require hardware cache flushing, try to find the
>  		 * largest contiguous physical memory chunk to unmap.
> +		 *
> +		 * mapped_length already accounts for contiguous entries
> +		 * from iova, then try to join following physically
> +		 * contiguous PTEs.
>  		 */
> -		for (len = PAGE_SIZE; pos + len < dma->size; len += PAGE_SIZE) {
> -			next = iommu_iova_to_phys(domain->domain, iova + len);
> +		len = min_t(size_t, pgsize, dma->size - pos);
> +		for (; pos + len < dma->size; ) {
> +			size_t next_pgsize;
> +
> +			next = iommu_iova_to_phys_length(domain->domain,
> +							  iova + len,
> +							  &next_pgsize);

vfio should not be calling it twice, the core code needs to give the
best length as efficiently as it can. not open coding this in callers.

I think I've said this three times now

Jason

