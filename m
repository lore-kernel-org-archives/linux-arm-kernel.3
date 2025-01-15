Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9163C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 04:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgmN9xvwVj3LAmFGvyYYHW/VcizSKvb2hYyIiEhfLdY=; b=4Y08OWEMyVX1z9yJ1rN5l92/e8
	6Y7NZe7Vx9NPU9dBFdklxB7eNU6eT6DVSjJImb73Fk+NMWYV8v9O/+kYITvKrA2bmbhvc8k/CE1AR
	m41ojMZLxubOt8c/SEIKrGA7xjHnK7E3NNEkOONsSqQ5b6MU4nAIDI6IOqU8M927989VYz1izubec
	x0xt3ZjVHbT1sIXOAFbDKAyvuUN7Y2yVOdhPwgaxxi4EZUpK3IhRW6TVXI5xgt8wmdwaTS6KmFSXG
	9YUrOldtOlHaV18ZOzvJZt+OztXEIlnRYiAFj3rHJ6K1uo2EqbZx0pF9eatTh1N6LEDGjqz/xPAoy
	4vjmTIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuvO-0000000Ab2V-02CP;
	Wed, 15 Jan 2025 04:22:38 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuu6-0000000Aass-0mY6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 04:21:20 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e399e904940so9802689276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 20:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736914877; x=1737519677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NgmN9xvwVj3LAmFGvyYYHW/VcizSKvb2hYyIiEhfLdY=;
        b=eDDuQYaEkTqiyn9b7bfJGE8IJlhLh8/RMeGDD56cRzoFhn7m7DPWffalPtkp+tbeuO
         klFE/JMESH6obfmH7tvLDbMt1X0l4qHUo23JmCBergaXqF7b4wFQk1bNT2PsbZCWOM1E
         JikkVNESNzmrPO4dEuDmZ1fmgphimINqG4wo/3cWo3V9byQikHVzAUqhyCSN2JRa6T1L
         ffn+Rx8CcOYR4T9wwyIb7JZPHdTThJLLx6fwkgA3GkqAPWwUTH9c5tZCENyYYZlcKDvk
         qQZAaCtJAfPQCtsL+HDmrIcRLTO0nhVzn++V8EEqOlh0dBQB+VynUi/pCWh1bl0ljQ0B
         sbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736914877; x=1737519677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgmN9xvwVj3LAmFGvyYYHW/VcizSKvb2hYyIiEhfLdY=;
        b=mow+7AfeEY9IxDPFfCrFTgEiQ4DfzYLi/Q6Dc52Iip8xTXA/ntFThnOupx1FgQY120
         Ntyi1LqoAF/WPPJgClLr9rJahC5OzgFOrO8oWllTSe8T8ns6DygTYD9rT8Hew5R+he8T
         tqFjB9Sl6ctA4npDzampo8ZYF0a+uZohPtOv2ZRPsAuxqDgqSjMoaR6LU+jhkXfie8qM
         a00f+fvg/pt5s1NH4TKMrMCSQMHVWbhFzb89DxMIUwdv4Fj6/UTsVjx41AfrYYiIOrpf
         od7ftMUYnV+FLQOXjb7HS0XAYJS2bXmoOCfx5I3ElCDITrhiUFulsU/8eyNw3yDpf3L9
         SYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXCt/jnXTLxxYohy60m0xLS7AfHI4Lc/En/dV/vlB8PACVengkJOYDRCrbe+vt1wKrh7PQuaTGZyH1zEpXniAkv@lists.infradead.org
X-Gm-Message-State: AOJu0YyRNWu8Q8fJVe/BIvccc2Z4jIZqGg5oNtcrkTt4faNfWVRgLeiM
	9laqSE1tgwwHxDrwd58ciPQ2nlKnLEkNsygh58r+dpH1PU5jHXdx
X-Gm-Gg: ASbGncvJ5J7pku7FOT11+C6oTQQ0QvG4Y2qi+013N1OmoAAvXelO9HQYNw7/E+TN8p4
	v1xnPUc83oxjykNeahezON1oFOJUwcE+2GNkqieUkWtgI8QD9sJLSCLn1qe3opmT15WM8vhD4ZS
	S/NaaJ18/Rb4w4qTTb2+HMI47Nrk2APs1O87uFKn8pUluQXo1UzJFi4ZUmC/GErhNB88Yzyc+Jy
	K6n2vplNUAHvpyFFl+2+b0wGtYZ1mEWvgqoksrExTxgTq7c0xEcuM45
X-Google-Smtp-Source: AGHT+IHrwG631JlG6Kmi6EHjrQvbmsegz/2N5eZ1vXYpkplcJETDUhBkp5msbW+dENi/QpXLNfCV2w==
X-Received: by 2002:a05:690c:31a:b0:6ef:7370:96ee with SMTP id 00721157ae682-6f5312209femr224981027b3.12.1736914876619;
        Tue, 14 Jan 2025 20:21:16 -0800 (PST)
Received: from localhost ([2601:347:100:5ea0:e12f:d330:c8d6:a6b7])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f546c25dc1sm24136237b3.22.2025.01.14.20.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 20:21:15 -0800 (PST)
Date: Tue, 14 Jan 2025 23:21:13 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com,
	kevin.tian@intel.com, tglx@linutronix.de, maz@kernel.org,
	alex.williamson@redhat.com, joro@8bytes.org, shuah@kernel.org,
	reinette.chatre@intel.com, eric.auger@redhat.com,
	yebin10@huawei.com, apatel@ventanamicro.com,
	shivamurthy.shastri@linutronix.de, bhelgaas@google.com,
	anna-maria@linutronix.de, nipun.gupta@amd.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
	shameerali.kolothum.thodi@huawei.com, smostafa@google.com,
	ddutile@redhat.com
Subject: Re: [PATCH RFCv2 07/13] iommufd: Implement sw_msi support natively
Message-ID: <Z4c3ueuDgM7YqElp@thinkpad>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <f70451cf4274bc5955824efe9f98ec7dfdd10927.1736550979.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f70451cf4274bc5955824efe9f98ec7dfdd10927.1736550979.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_202118_241750_432C2002 
X-CRM114-Status: GOOD (  47.20  )
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

On Fri, Jan 10, 2025 at 07:32:23PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> iommufd has a model where the iommu_domain can be changed while the VFIO
> device is attached. In this case the MSI should continue to work. This
> corner case has not worked because the dma-iommu implementation of sw_msi
> is tied to a single domain.
> 
> Implement the sw_msi mapping directly and use a global per-fd table to
> associate assigned iova to the MSI pages. This allows the MSI pages to
> loaded into a domain before it is attached ensuring that MSI is not

s/loaded/be loaded/ ?

> disrupted.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> [nicolinc: set sw_msi pointer in nested hwpt allocators]
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  23 +++-
>  drivers/iommu/iommufd/device.c          | 158 ++++++++++++++++++++----
>  drivers/iommu/iommufd/hw_pagetable.c    |   3 +
>  drivers/iommu/iommufd/main.c            |   9 ++
>  4 files changed, 170 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 063c0a42f54f..3e83bbb5912c 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -19,6 +19,22 @@ struct iommu_group;
>  struct iommu_option;
>  struct iommufd_device;
>  
> +struct iommufd_sw_msi_map {
> +	struct list_head sw_msi_item;
> +	phys_addr_t sw_msi_start;
> +	phys_addr_t msi_addr;
> +	unsigned int pgoff;
> +	unsigned int id;
> +};
> +
> +/* Bitmap of struct iommufd_sw_msi_map::id */
> +struct iommufd_sw_msi_maps {
> +	DECLARE_BITMAP(bitmap, 64);
> +};
> +
> +int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
> +		   phys_addr_t msi_addr);
> +
>  struct iommufd_ctx {
>  	struct file *file;
>  	struct xarray objects;
> @@ -26,6 +42,10 @@ struct iommufd_ctx {
>  	wait_queue_head_t destroy_wait;
>  	struct rw_semaphore ioas_creation_lock;
>  
> +	struct mutex sw_msi_lock;
> +	struct list_head sw_msi_list;
> +	unsigned int sw_msi_id;
> +
>  	u8 account_mode;
>  	/* Compatibility with VFIO no iommu */
>  	u8 no_iommu_mode;
> @@ -283,10 +303,10 @@ struct iommufd_hwpt_paging {
>  	struct iommufd_ioas *ioas;
>  	bool auto_domain : 1;
>  	bool enforce_cache_coherency : 1;
> -	bool msi_cookie : 1;
>  	bool nest_parent : 1;
>  	/* Head at iommufd_ioas::hwpt_list */
>  	struct list_head hwpt_item;
> +	struct iommufd_sw_msi_maps present_sw_msi;
>  };
>  
>  struct iommufd_hwpt_nested {
> @@ -383,6 +403,7 @@ struct iommufd_group {
>  	struct iommu_group *group;
>  	struct iommufd_hw_pagetable *hwpt;
>  	struct list_head device_list;
> +	struct iommufd_sw_msi_maps required_sw_msi;
>  	phys_addr_t sw_msi_start;
>  };
>  
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 38b31b652147..f75b3c23cd41 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -5,6 +5,7 @@
>  #include <linux/iommufd.h>
>  #include <linux/slab.h>
>  #include <uapi/linux/iommufd.h>
> +#include <linux/msi.h>
>  
>  #include "../iommu-priv.h"
>  #include "io_pagetable.h"
> @@ -293,36 +294,149 @@ u32 iommufd_device_to_id(struct iommufd_device *idev)
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, "IOMMUFD");
>  
> +/*
> + * Get a iommufd_sw_msi_map for the msi physical address requested by the irq
> + * layer. The mapping to IOVA is global to the iommufd file descriptor, every
> + * domain that is attached to a device using the same MSI parameters will use
> + * the same IOVA.
> + */
> +static struct iommufd_sw_msi_map *
> +iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
> +		       phys_addr_t sw_msi_start)
> +{
> +	struct iommufd_sw_msi_map *cur;
> +	unsigned int max_pgoff = 0;
> +
> +	lockdep_assert_held(&ictx->sw_msi_lock);
> +
> +	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
> +		if (cur->sw_msi_start != sw_msi_start)
> +			continue;
> +		max_pgoff = max(max_pgoff, cur->pgoff + 1);
> +		if (cur->msi_addr == msi_addr)
> +			return cur;
> +	}
> +
> +	if (ictx->sw_msi_id >=
> +	    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
> +		return ERR_PTR(-EOVERFLOW);
> +
> +	cur = kzalloc(sizeof(*cur), GFP_KERNEL);
> +	if (!cur)
> +		cur = ERR_PTR(-ENOMEM);
> +	cur->sw_msi_start = sw_msi_start;
> +	cur->msi_addr = msi_addr;
> +	cur->pgoff = max_pgoff;
> +	cur->id = ictx->sw_msi_id++;
> +	list_add_tail(&cur->sw_msi_item, &ictx->sw_msi_list);
> +	return cur;
> +}
> +
> +static int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
> +				  struct iommufd_hwpt_paging *hwpt_paging,
> +				  struct iommufd_sw_msi_map *msi_map)
> +{
> +	unsigned long iova;
> +
> +	lockdep_assert_held(&ictx->sw_msi_lock);
> +
> +	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
> +	if (!test_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap)) {
> +		int rc;
> +
> +		rc = iommu_map(hwpt_paging->common.domain, iova,
> +			       msi_map->msi_addr, PAGE_SIZE,
> +			       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
> +			       GFP_KERNEL_ACCOUNT);
> +		if (rc)
> +			return rc;
> +		set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
> +	}
> +	return 0;
> +}

So, does sw_msi_lock protect the present_sw_msi bitmap? If so, you
should use non-atomic __set_bit(). If not, you'd do something like:

        if (test_and_set_bit(...))
                return 0;

        rc = iommu_map(...);
        if (rc)
                clear_bit(...);

        return rc

Now it looks like a series of atomic accesses, which is not atomic, and it
misleads...

> +
> +/*
> + * Called by the irq code if the platform translates the MSI address through the
> + * IOMMU. msi_addr is the physical address of the MSI page. iommufd will
> + * allocate a fd global iova for the physical page that is the same on all
> + * domains and devices.
> + */
> +#ifdef CONFIG_IRQ_MSI_IOMMU
> +int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
> +		   phys_addr_t msi_addr)
> +{
> +	struct device *dev = msi_desc_to_dev(desc);
> +	struct iommu_attach_handle *raw_handle;
> +	struct iommufd_hwpt_paging *hwpt_paging;
> +	struct iommufd_attach_handle *handle;
> +	struct iommufd_sw_msi_map *msi_map;
> +	struct iommufd_ctx *ictx;
> +	unsigned long iova;
> +	int rc;
> +
> +	raw_handle =
> +		iommu_attach_handle_get(dev->iommu_group, IOMMU_NO_PASID, 0);

Nit: no need to break the line.

> +	if (!raw_handle)
> +		return 0;
> +	hwpt_paging = find_hwpt_paging(domain->iommufd_hwpt);
> +
> +	handle = to_iommufd_handle(raw_handle);
> +	/* No IOMMU_RESV_SW_MSI means no change to the msi_msg */
> +	if (handle->idev->igroup->sw_msi_start == PHYS_ADDR_MAX)
> +		return 0;
> +
> +	ictx = handle->idev->ictx;
> +	guard(mutex)(&ictx->sw_msi_lock);
> +	/*
> +	 * The input msi_addr is the exact byte offset of the MSI doorbell, we
> +	 * assume the caller has checked that it is contained with a MMIO region
> +	 * that is secure to map at PAGE_SIZE.
> +	 */
> +	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
> +					 msi_addr & PAGE_MASK,
> +					 handle->idev->igroup->sw_msi_start);
> +	if (IS_ERR(msi_map))
> +		return PTR_ERR(msi_map);
> +
> +	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
> +	if (rc)
> +		return rc;
> +	set_bit(msi_map->id, handle->idev->igroup->required_sw_msi.bitmap);

Same here. I guess, sw_msi_lock protects required_sw_msi.bitmap,
right?

Thanks,
Yury

> +
> +	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
> +	msi_desc_set_iommu_msi_iova(desc, iova, PAGE_SHIFT);
> +	return 0;
> +}
> +#endif
> +
> +/*
> + * FIXME: when a domain is removed any ids that are not in the union of
> + * all still attached devices should be removed.
> + */
> +
>  static int iommufd_group_setup_msi(struct iommufd_group *igroup,
>  				   struct iommufd_hwpt_paging *hwpt_paging)
>  {
> -	phys_addr_t sw_msi_start = igroup->sw_msi_start;
> -	int rc;
> +	struct iommufd_ctx *ictx = igroup->ictx;
> +	struct iommufd_sw_msi_map *cur;
> +
> +	if (igroup->sw_msi_start == PHYS_ADDR_MAX)
> +		return 0;
>  
>  	/*
> -	 * If the IOMMU driver gives a IOMMU_RESV_SW_MSI then it is asking us to
> -	 * call iommu_get_msi_cookie() on its behalf. This is necessary to setup
> -	 * the MSI window so iommu_dma_prepare_msi() can install pages into our
> -	 * domain after request_irq(). If it is not done interrupts will not
> -	 * work on this domain.
> -	 *
> -	 * FIXME: This is conceptually broken for iommufd since we want to allow
> -	 * userspace to change the domains, eg switch from an identity IOAS to a
> -	 * DMA IOAS. There is currently no way to create a MSI window that
> -	 * matches what the IRQ layer actually expects in a newly created
> -	 * domain.
> +	 * Install all the MSI pages the device has been using into the domain
>  	 */
> -	if (sw_msi_start != PHYS_ADDR_MAX && !hwpt_paging->msi_cookie) {
> -		rc = iommu_get_msi_cookie(hwpt_paging->common.domain,
> -					  sw_msi_start);
> +	guard(mutex)(&ictx->sw_msi_lock);
> +	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
> +		int rc;
> +
> +		if (cur->sw_msi_start != igroup->sw_msi_start ||
> +		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
> +			continue;
> +
> +		rc = iommufd_sw_msi_install(ictx, hwpt_paging, cur);
>  		if (rc)
>  			return rc;
> -
> -		/*
> -		 * iommu_get_msi_cookie() can only be called once per domain,
> -		 * it returns -EBUSY on later calls.
> -		 */
> -		hwpt_paging->msi_cookie = true;
>  	}
>  	return 0;
>  }
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index f7c0d7b214b6..538484eecb3b 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -156,6 +156,7 @@ iommufd_hwpt_paging_alloc(struct iommufd_ctx *ictx, struct iommufd_ioas *ioas,
>  			goto out_abort;
>  		}
>  	}
> +	iommu_domain_set_sw_msi(hwpt->domain, iommufd_sw_msi);
>  
>  	/*
>  	 * Set the coherency mode before we do iopt_table_add_domain() as some
> @@ -251,6 +252,7 @@ iommufd_hwpt_nested_alloc(struct iommufd_ctx *ictx,
>  		goto out_abort;
>  	}
>  	hwpt->domain->owner = ops;
> +	iommu_domain_set_sw_msi(hwpt->domain, iommufd_sw_msi);
>  
>  	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
>  		rc = -EINVAL;
> @@ -303,6 +305,7 @@ iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
>  		goto out_abort;
>  	}
>  	hwpt->domain->owner = viommu->iommu_dev->ops;
> +	iommu_domain_set_sw_msi(hwpt->domain, iommufd_sw_msi);
>  
>  	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
>  		rc = -EINVAL;
> diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
> index 97c5e3567d33..7cc9497b7193 100644
> --- a/drivers/iommu/iommufd/main.c
> +++ b/drivers/iommu/iommufd/main.c
> @@ -227,6 +227,8 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
>  	xa_init(&ictx->groups);
>  	ictx->file = filp;
>  	init_waitqueue_head(&ictx->destroy_wait);
> +	mutex_init(&ictx->sw_msi_lock);
> +	INIT_LIST_HEAD(&ictx->sw_msi_list);
>  	filp->private_data = ictx;
>  	return 0;
>  }
> @@ -234,6 +236,8 @@ static int iommufd_fops_open(struct inode *inode, struct file *filp)
>  static int iommufd_fops_release(struct inode *inode, struct file *filp)
>  {
>  	struct iommufd_ctx *ictx = filp->private_data;
> +	struct iommufd_sw_msi_map *next;
> +	struct iommufd_sw_msi_map *cur;
>  	struct iommufd_object *obj;
>  
>  	/*
> @@ -262,6 +266,11 @@ static int iommufd_fops_release(struct inode *inode, struct file *filp)
>  			break;
>  	}
>  	WARN_ON(!xa_empty(&ictx->groups));
> +
> +	mutex_destroy(&ictx->sw_msi_lock);
> +	list_for_each_entry_safe(cur, next, &ictx->sw_msi_list, sw_msi_item)
> +		kfree(cur);
> +
>  	kfree(ictx);
>  	return 0;
>  }
> -- 
> 2.43.0

