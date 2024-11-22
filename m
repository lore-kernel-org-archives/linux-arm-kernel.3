Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0705E69185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=rJCH9nWJjky2yqQTB+ixJsGdpraq6q8U4lLr4lweLak=; b=lROgzY6SGlx7CC
	B3bAzFNBy/GfjSLwDwlxES8wrlCx7ApwBlx2d95YsrDz2GcH6hG9bPwdgzlEhlUsOHwtbBx7s/hN6
	zqRnIykftiFXqDKGqqMHgH+Y8PMxKnVoKMtRXPV6nhwdqk+rp5IkOCrbfIyMG/nrgoKiovAng8XsH
	sU4ZH7WELDB0o7BQz1yryvC+R58eKp62c0Zb5uXVT12m4SKE7j6lR6IMzCEdbHiLj3y+zSTzxkrUQ
	Ebr1KSEvlGKLWkkWG6HMr5Bfo4PxjjnSRzVqo+cM1aI8TH6sywBfZF16BwEM4ZPjiHYwwc8HHCH2C
	f0NEo6Q9C1Un2HOrMn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYHL-000000036Ld-3KJo;
	Fri, 22 Nov 2024 18:21:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEYGO-000000036An-248Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 18:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA26FA41500;
	Fri, 22 Nov 2024 18:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C30C4CECE;
	Fri, 22 Nov 2024 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732299614;
	bh=6vSGD8e+Q9TRY4zmcvouTkj38cuQb4dQn7OnYsD0ibA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KuA8KUPZLoQzRFFXa7LQwUfk9Y596zdnH+rzlqlv+jSr3pgHb8fCWG4T7hE+0eUT5
	 1O5uB4GKtJX6woemgTFladuO5a6D3vaCSKw8p63j2DW/+N+j/w3OddfrYOsGZkl/Ad
	 y0x8A9A17LEEasDucAsf3SGTFwAYzW0Y0d8Pv/ak5CuO+WFHk3C2ofpLUPTVN2HfU2
	 DQkMfgOsuIzz3gES/49+Isprivya5qUI7uPl1qDQBRNL5tT5SO+LknOlUKt6zEp2uq
	 HRYlKvMXYGt+pB3A9qnjgJUZms0Be5dlqtuq0N8/laoYEIFDcwQThrjcQPk+YuNCjH
	 mMh7U2yQ0/qXw==
Date: Fri, 22 Nov 2024 12:20:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com
Subject: Re: [PATCH v3 10/25] pci/p2pdma: Don't initialise page refcount to
 one
Message-ID: <20241122182013.GA2435164@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27381b50b65a218da99a2448023b774dd75540df.1732239628.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_102016_665707_4F154111 
X-CRM114-Status: GOOD (  31.15  )
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

On Fri, Nov 22, 2024 at 12:40:31PM +1100, Alistair Popple wrote:
> The reference counts for ZONE_DEVICE private pages should be
> initialised by the driver when the page is actually allocated by the
> driver allocator, not when they are first created. This is currently
> the case for MEMORY_DEVICE_PRIVATE and MEMORY_DEVICE_COHERENT pages
> but not MEMORY_DEVICE_PCI_P2PDMA pages so fix that up.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Previously suggested tweaks to subject line prefix and content:
https://lore.kernel.org/all/20240629212851.GA1484889@bhelgaas/
https://lore.kernel.org/all/20240910134745.GA577955@bhelgaas/

I had the impression that you agreed there was the potential for some
confusion here, but it doesn't look like it was addressed.

So again, a PCI patch labeled "don't init refcount to one" where the
content initializes the refcount to one in p2pdma.c is still confusing
since (IIUC) the subject line refers to the NON-PCI code.

Maybe some sort of "move refcount init from X to p2pdma" or addition
of *who* is no longer initializing refcount to one would clear this
up.

> ---
> 
> Changes since v2:
> 
>  - Initialise the page refcount for all pages covered by the kaddr
> ---
>  drivers/pci/p2pdma.c | 13 +++++++++++--
>  mm/memremap.c        | 17 +++++++++++++----
>  mm/mm_init.c         | 22 ++++++++++++++++++----
>  3 files changed, 42 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index 4f47a13..2c5ac4a 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -140,13 +140,22 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
>  	rcu_read_unlock();
>  
>  	for (vaddr = vma->vm_start; vaddr < vma->vm_end; vaddr += PAGE_SIZE) {
> -		ret = vm_insert_page(vma, vaddr, virt_to_page(kaddr));
> +		struct page *page = virt_to_page(kaddr);
> +
> +		/*
> +		 * Initialise the refcount for the freshly allocated page. As
> +		 * we have just allocated the page no one else should be
> +		 * using it.
> +		 */
> +		VM_WARN_ON_ONCE_PAGE(!page_ref_count(page), page);
> +		set_page_count(page, 1);
> +		ret = vm_insert_page(vma, vaddr, page);
>  		if (ret) {
>  			gen_pool_free(p2pdma->pool, (uintptr_t)kaddr, len);
>  			return ret;
>  		}
>  		percpu_ref_get(ref);
> -		put_page(virt_to_page(kaddr));
> +		put_page(page);
>  		kaddr += PAGE_SIZE;
>  		len -= PAGE_SIZE;
>  	}
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 40d4547..07bbe0e 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -488,15 +488,24 @@ void free_zone_device_folio(struct folio *folio)
>  	folio->mapping = NULL;
>  	folio->page.pgmap->ops->page_free(folio_page(folio, 0));
>  
> -	if (folio->page.pgmap->type != MEMORY_DEVICE_PRIVATE &&
> -	    folio->page.pgmap->type != MEMORY_DEVICE_COHERENT)
> +	switch (folio->page.pgmap->type) {
> +	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
> +		put_dev_pagemap(folio->page.pgmap);
> +		break;
> +
> +	case MEMORY_DEVICE_FS_DAX:
> +	case MEMORY_DEVICE_GENERIC:
>  		/*
>  		 * Reset the refcount to 1 to prepare for handing out the page
>  		 * again.
>  		 */
>  		folio_set_count(folio, 1);
> -	else
> -		put_dev_pagemap(folio->page.pgmap);
> +		break;
> +
> +	case MEMORY_DEVICE_PCI_P2PDMA:
> +		break;
> +	}
>  }
>  
>  void zone_device_page_init(struct page *page)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 4ba5607..0489820 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1015,12 +1015,26 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>  	}
>  
>  	/*
> -	 * ZONE_DEVICE pages are released directly to the driver page allocator
> -	 * which will set the page count to 1 when allocating the page.
> +	 * ZONE_DEVICE pages other than MEMORY_TYPE_GENERIC and
> +	 * MEMORY_TYPE_FS_DAX pages are released directly to the driver page
> +	 * allocator which will set the page count to 1 when allocating the
> +	 * page.
> +	 *
> +	 * MEMORY_TYPE_GENERIC and MEMORY_TYPE_FS_DAX pages automatically have
> +	 * their refcount reset to one whenever they are freed (ie. after
> +	 * their refcount drops to 0).
>  	 */
> -	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
> -	    pgmap->type == MEMORY_DEVICE_COHERENT)
> +	switch (pgmap->type) {
> +	case MEMORY_DEVICE_PRIVATE:
> +	case MEMORY_DEVICE_COHERENT:
> +	case MEMORY_DEVICE_PCI_P2PDMA:
>  		set_page_count(page, 0);
> +		break;
> +
> +	case MEMORY_DEVICE_FS_DAX:
> +	case MEMORY_DEVICE_GENERIC:
> +		break;
> +	}
>  }
>  
>  /*
> -- 
> git-series 0.9.1

