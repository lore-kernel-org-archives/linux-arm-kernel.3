Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B4C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF3TQXTjTwLlsmEr6Vx8Y4aN4YqmuAbAC+QoJEmyUXM=; b=N8M84rYCJQ1N7zLz5/uHMDyMxq
	pYKxRlnxVQUQDSzAXvn9PobDi1c0SRG+hlNpQ1/xQ4O/WR60Jm61gdsQKjCj9j2j6YgLWzg3VpGoS
	xpv/NboZ/QegOow9yLHxLoQXAuo7zlghocBlmTXh9Y4FL9A0q6QKQbji1WDhpMv1JzFVFjLNbbmNi
	UJXNz5dstQ9ZpHIoIHVFVecwQz0R4FkVE5OpXltHnJrXWYJKHnfU6FtBB+Rqbs7x143KKil3XIWNd
	OdRBLvgDBn5GMivSkpKuSRIceiHHb/2YxwNMAhrNdlodLo+2FtaX0Dw+trlLJqrxiLyM0yBCfIT4c
	mg9vHANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Uu7-00000007RK7-3d4x;
	Mon, 28 Apr 2025 20:16:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Us9-00000007R11-33Ka
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 20:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sF3TQXTjTwLlsmEr6Vx8Y4aN4YqmuAbAC+QoJEmyUXM=; b=rAuEw7pIs1yJvVl12iTeFV+CR0
	ZOsk3xmlQF6FIGlJKdVfz7ZROH/no/RiidLMDPPE/jDMi7fiv8e6RM4mwVJMIMH02yPX6McIlh6hR
	Ai2dyqj4GNbNFw5ZwkKfRmVNYKbi+qrFEtjVi+J2E6dh9T5kxAcJZVmwymIWNyAk8hTuatBd2Btgk
	kgJg1eMxlV+Y90KmVYppK6DrMH07m2wSQUY2HGaZ2nOaX+byO4XHsaWljO6UAn0VwcOv0jCiPWIF/
	PZufw9NV1BRavRlt42qJ6bQXWtuciZ+TUTqzQfpsyYvC/h67+T62DjD7uFG5e0pXKQx9lo6c8E/Ut
	jbVPtmGQ==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Us6-0000000D1k7-10dq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:14:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2263428c8baso5705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745871271; x=1746476071; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sF3TQXTjTwLlsmEr6Vx8Y4aN4YqmuAbAC+QoJEmyUXM=;
        b=A0XJWEydqJbqKPtO52s7E6UdVEl8/JkbSomMstRH0+iLA+7E7gOhu4udTKI+zEDk2E
         Ne0nPF+XA8d3BKH82pbo7KvpLZTsOdvdr1L+2n66xr0IiMPNBGLbESPJdxhU09Fqwpp2
         1bCNERKpCsMtiT1QrliZCHqkcQpk+zpOPEJOI5gsd+63+Hf18i2vkUDi+JdZAwa9oQIM
         7RdGSDva2kS27P4Mnh46luDwdG/yOnjZp9ybN7z7v2Ozk5feAvmGqs9NFjIL5wtdhBuo
         OcVOY8J1lf0ev1ie1Bt+lhO5YXVTUkVBQPfJml4FL62U3HkHO0uesIKkpcfmmm6jnvFr
         L4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871271; x=1746476071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF3TQXTjTwLlsmEr6Vx8Y4aN4YqmuAbAC+QoJEmyUXM=;
        b=eJ5Ey9laT0oh1QphzkoCxn1JSlynzW3fH9azKDWzNkwLU1MR15c9dHyl1YSUS7M6Ff
         yYsH4s6XUro65B2dT2ATdY+WvcfMuJFyRBeJtbOC4glFVt+pXDZJraTuRVmGe0qZs7Dh
         iZryq8ealD8qwsVjo1J8oYvERZcTHzJRuQbzM4L0L6C6NMw6t/EgXnBgEhlvn4+lKjzi
         jgNwFfQnP3V6qadkyTekOI8i00K+41ATOqoViKbszyj8uyVgrhSi8A6y8f5x+1KKzP0h
         QO3rV+2N0Qv8NDNWfhJyjQM847p9MFBuob/gKd6lETkRsFvBZZ6ED+uDdoC2+ecCT+zo
         ryQw==
X-Forwarded-Encrypted: i=1; AJvYcCU+X3w1segiH0ujhgQ90qrZZTM3kwPT2rGy8ohgqhOpb4YgHUnm8ojt+/vYGow1+5fYyVzHshoyqUD5fWQoJyL2@lists.infradead.org
X-Gm-Message-State: AOJu0YyfEyHMix5BrDNnQY03vvcqUGj/D/pU6ZETo1jRi/vJ2CGJzj1n
	a5ezXGrS7apUniM+4LwW+BFZ7mkMRqUEdK4xO3MwxCxKGS4z0qWIMIJPwgh0Mg==
X-Gm-Gg: ASbGncv+J39I3Ef8YbDfP4RxTTSRUCY2WRKf3UK5CuV5L5JEkn6NWvsttzLBlLlDhEp
	s/SMNKQteuV32ucCLBdGB7cWxHS7lRzb2BaGQrT8uuzzclvaLmemwEYi8fHNkEFERtK8obVFCdN
	xAU9rpxpjdPLgpG5NpvRilt1ArujWNSbV0/M7wLXCnveizQ5R/lFRzsXmDjY3eu3WqOlHtUogr8
	uGYmmVywcx+fmdkzTSUuEWSrcvtMC1fX/wgVGUlLz0Z3frQd78BSOfiyjyDLRvAK/n3DdoqpnzQ
	cVQnI5tmD5eR4yJ/OnWrnT0DZnNzF/5/giPqIGQpoq0LUno5A2k951VD9Wv+AlxldWNGLpme
X-Google-Smtp-Source: AGHT+IGmtl/Kj7Dfb3LKwjogpzMnxm1K7d+HjcHQ0Rw+sVKLpRXDlU7ddaIuIujt0mHKuRlgJFYRhQ==
X-Received: by 2002:a17:902:ce0d:b0:21f:4986:c7d5 with SMTP id d9443c01a7336-22de6c488fcmr714075ad.8.1745871271079;
        Mon, 28 Apr 2025 13:14:31 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fadea8d8sm7669029a12.64.2025.04.28.13.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:14:30 -0700 (PDT)
Date: Mon, 28 Apr 2025 20:14:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 08/22] iommufd: Abstract iopt_pin_pages and
 iopt_unpin_pages helpers
Message-ID: <aA_hm_AD4Xzm3qJZ@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d44272c153e7596c3cef716044de3dc6c2a8254a.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_211434_672732_12E1C364 
X-CRM114-Status: GOOD (  34.37  )
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

On Fri, Apr 25, 2025 at 10:58:03PM -0700, Nicolin Chen wrote:
> The new vCMDQ object will be added for HW to access the guest memory for a
> HW-accelerated virtualization feature. It needs to ensure the guest memory
> pages are pinned when HW accesses them and they are contiguous in physical
> address space.
> 
> This is very like the existing iommufd_access_pin_pages() that outputs the
> pinned page list for the caller to test its contiguity.
> 
> Move those code from iommufd_access_pin/unpin_pages() and related function
> for a pair of iopt helpers that can be shared with the vCMDQ allocator. As
> the vCMDQ allocator will be a user-space triggered ioctl function, WARN_ON
> would not be a good fit in the new iopt_unpin_pages(), thus change them to
> use WARN_ON_ONCE instead.
> 
> Rename check_area_prot() to align with the existing iopt_area helpers, and
> inline it to the header since iommufd_access_rw() still uses it.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/io_pagetable.h    |   8 ++
>  drivers/iommu/iommufd/iommufd_private.h |   6 ++
>  drivers/iommu/iommufd/device.c          | 117 ++----------------------
>  drivers/iommu/iommufd/io_pagetable.c    |  95 +++++++++++++++++++
>  4 files changed, 117 insertions(+), 109 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/io_pagetable.h b/drivers/iommu/iommufd/io_pagetable.h
> index 10c928a9a463..4288a2b1a90f 100644
> --- a/drivers/iommu/iommufd/io_pagetable.h
> +++ b/drivers/iommu/iommufd/io_pagetable.h
> @@ -114,6 +114,14 @@ static inline unsigned long iopt_area_iova_to_index(struct iopt_area *area,
>  	return iopt_area_start_byte(area, iova) / PAGE_SIZE;
>  }
>  
> +static inline bool iopt_area_check_prot(struct iopt_area *area,
> +					unsigned int flags)
> +{
> +	if (flags & IOMMUFD_ACCESS_RW_WRITE)
> +		return area->iommu_prot & IOMMU_WRITE;
> +	return area->iommu_prot & IOMMU_READ;
> +}
> +
>  #define __make_iopt_iter(name)                                                 \
>  	static inline struct iopt_##name *iopt_##name##_iter_first(            \
>  		struct io_pagetable *iopt, unsigned long start,                \
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 8d96aa514033..79160b039bc7 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -130,6 +130,12 @@ int iopt_cut_iova(struct io_pagetable *iopt, unsigned long *iovas,
>  void iopt_enable_large_pages(struct io_pagetable *iopt);
>  int iopt_disable_large_pages(struct io_pagetable *iopt);
>  
> +int iopt_pin_pages(struct io_pagetable *iopt, unsigned long iova,
> +		   unsigned long length, struct page **out_pages,
> +		   unsigned int flags);
> +void iopt_unpin_pages(struct io_pagetable *iopt, unsigned long iova,
> +		      unsigned long length);
> +
>  struct iommufd_ucmd {
>  	struct iommufd_ctx *ictx;
>  	void __user *ubuffer;
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index 2111bad72c72..a5c6be164254 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1240,58 +1240,17 @@ void iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long iova,
>  void iommufd_access_unpin_pages(struct iommufd_access *access,
>  				unsigned long iova, unsigned long length)
>  {
> -	struct iopt_area_contig_iter iter;
> -	struct io_pagetable *iopt;
> -	unsigned long last_iova;
> -	struct iopt_area *area;
> -
> -	if (WARN_ON(!length) ||
> -	    WARN_ON(check_add_overflow(iova, length - 1, &last_iova)))
> -		return;
> -
> -	mutex_lock(&access->ioas_lock);
> +	guard(mutex)(&access->ioas_lock);
>  	/*
>  	 * The driver must be doing something wrong if it calls this before an
>  	 * iommufd_access_attach() or after an iommufd_access_detach().
>  	 */
> -	if (WARN_ON(!access->ioas_unpin)) {
> -		mutex_unlock(&access->ioas_lock);
> +	if (WARN_ON(!access->ioas_unpin))
>  		return;
> -	}
> -	iopt = &access->ioas_unpin->iopt;
> -
> -	down_read(&iopt->iova_rwsem);
> -	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
> -		iopt_area_remove_access(
> -			area, iopt_area_iova_to_index(area, iter.cur_iova),
> -			iopt_area_iova_to_index(
> -				area,
> -				min(last_iova, iopt_area_last_iova(area))));
> -	WARN_ON(!iopt_area_contig_done(&iter));
> -	up_read(&iopt->iova_rwsem);
> -	mutex_unlock(&access->ioas_lock);
> +	iopt_unpin_pages(&access->ioas_unpin->iopt, iova, length);
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_access_unpin_pages, "IOMMUFD");
>  
> -static bool iopt_area_contig_is_aligned(struct iopt_area_contig_iter *iter)
> -{
> -	if (iopt_area_start_byte(iter->area, iter->cur_iova) % PAGE_SIZE)
> -		return false;
> -
> -	if (!iopt_area_contig_done(iter) &&
> -	    (iopt_area_start_byte(iter->area, iopt_area_last_iova(iter->area)) %
> -	     PAGE_SIZE) != (PAGE_SIZE - 1))
> -		return false;
> -	return true;
> -}
> -
> -static bool check_area_prot(struct iopt_area *area, unsigned int flags)
> -{
> -	if (flags & IOMMUFD_ACCESS_RW_WRITE)
> -		return area->iommu_prot & IOMMU_WRITE;
> -	return area->iommu_prot & IOMMU_READ;
> -}
> -
>  /**
>   * iommufd_access_pin_pages() - Return a list of pages under the iova
>   * @access: IOAS access to act on
> @@ -1315,76 +1274,16 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
>  			     unsigned long length, struct page **out_pages,
>  			     unsigned int flags)
>  {
> -	struct iopt_area_contig_iter iter;
> -	struct io_pagetable *iopt;
> -	unsigned long last_iova;
> -	struct iopt_area *area;
> -	int rc;
> -
>  	/* Driver's ops don't support pin_pages */
>  	if (IS_ENABLED(CONFIG_IOMMUFD_TEST) &&
>  	    WARN_ON(access->iova_alignment != PAGE_SIZE || !access->ops->unmap))
>  		return -EINVAL;
>  
> -	if (!length)
> -		return -EINVAL;
> -	if (check_add_overflow(iova, length - 1, &last_iova))
> -		return -EOVERFLOW;
> -
> -	mutex_lock(&access->ioas_lock);
> -	if (!access->ioas) {
> -		mutex_unlock(&access->ioas_lock);
> +	guard(mutex)(&access->ioas_lock);
> +	if (!access->ioas)
>  		return -ENOENT;
> -	}
> -	iopt = &access->ioas->iopt;
> -
> -	down_read(&iopt->iova_rwsem);
> -	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
> -		unsigned long last = min(last_iova, iopt_area_last_iova(area));
> -		unsigned long last_index = iopt_area_iova_to_index(area, last);
> -		unsigned long index =
> -			iopt_area_iova_to_index(area, iter.cur_iova);
> -
> -		if (area->prevent_access ||
> -		    !iopt_area_contig_is_aligned(&iter)) {
> -			rc = -EINVAL;
> -			goto err_remove;
> -		}
> -
> -		if (!check_area_prot(area, flags)) {
> -			rc = -EPERM;
> -			goto err_remove;
> -		}
> -
> -		rc = iopt_area_add_access(area, index, last_index, out_pages,
> -					  flags);
> -		if (rc)
> -			goto err_remove;
> -		out_pages += last_index - index + 1;
> -	}
> -	if (!iopt_area_contig_done(&iter)) {
> -		rc = -ENOENT;
> -		goto err_remove;
> -	}
> -
> -	up_read(&iopt->iova_rwsem);
> -	mutex_unlock(&access->ioas_lock);
> -	return 0;
> -
> -err_remove:
> -	if (iova < iter.cur_iova) {
> -		last_iova = iter.cur_iova - 1;
> -		iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
> -			iopt_area_remove_access(
> -				area,
> -				iopt_area_iova_to_index(area, iter.cur_iova),
> -				iopt_area_iova_to_index(
> -					area, min(last_iova,
> -						  iopt_area_last_iova(area))));
> -	}
> -	up_read(&iopt->iova_rwsem);
> -	mutex_unlock(&access->ioas_lock);
> -	return rc;
> +	return iopt_pin_pages(&access->ioas->iopt, iova, length, out_pages,
> +			      flags);
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, "IOMMUFD");
>  
> @@ -1431,7 +1330,7 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
>  			goto err_out;
>  		}
>  
> -		if (!check_area_prot(area, flags)) {
> +		if (!iopt_area_check_prot(area, flags)) {
>  			rc = -EPERM;
>  			goto err_out;
>  		}
> diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
> index 8a790e597e12..160eec49af1b 100644
> --- a/drivers/iommu/iommufd/io_pagetable.c
> +++ b/drivers/iommu/iommufd/io_pagetable.c
> @@ -1472,3 +1472,98 @@ int iopt_table_enforce_dev_resv_regions(struct io_pagetable *iopt,
>  	up_write(&iopt->iova_rwsem);
>  	return rc;
>  }
> +
> +static bool iopt_area_contig_is_aligned(struct iopt_area_contig_iter *iter)
> +{
> +	if (iopt_area_start_byte(iter->area, iter->cur_iova) % PAGE_SIZE)
> +		return false;
> +
> +	if (!iopt_area_contig_done(iter) &&
> +	    (iopt_area_start_byte(iter->area, iopt_area_last_iova(iter->area)) %
> +	     PAGE_SIZE) != (PAGE_SIZE - 1))
> +		return false;
> +	return true;
> +}
> +
> +int iopt_pin_pages(struct io_pagetable *iopt, unsigned long iova,
> +		   unsigned long length, struct page **out_pages,
> +		   unsigned int flags)
> +{
> +	struct iopt_area_contig_iter iter;
> +	unsigned long last_iova;
> +	struct iopt_area *area;
> +	int rc;
> +
> +	if (!length)
> +		return -EINVAL;
> +	if (check_add_overflow(iova, length - 1, &last_iova))
> +		return -EOVERFLOW;
> +
> +	down_read(&iopt->iova_rwsem);
> +	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova) {
> +		unsigned long last = min(last_iova, iopt_area_last_iova(area));
> +		unsigned long last_index = iopt_area_iova_to_index(area, last);
> +		unsigned long index =
> +			iopt_area_iova_to_index(area, iter.cur_iova);
> +
> +		if (area->prevent_access ||

Nit:
Shouldn't we return -EBUSY or something if (area->prevent_access == 1) ?
IIUC, this just means that an unmap attempt is in progress, hence avoid
accessing the area.

> +		    !iopt_area_contig_is_aligned(&iter)) {
> +			rc = -EINVAL;
> +			goto err_remove;
> +		}
> +
> +		if (!iopt_area_check_prot(area, flags)) {
> +			rc = -EPERM;
> +			goto err_remove;
> +		}
> +
> +		rc = iopt_area_add_access(area, index, last_index, out_pages,
> +					  flags);
> +		if (rc)
> +			goto err_remove;
> +		out_pages += last_index - index + 1;
> +	}
> +	if (!iopt_area_contig_done(&iter)) {
> +		rc = -ENOENT;
> +		goto err_remove;
> +	}
> +
> +	up_read(&iopt->iova_rwsem);
> +	return 0;
> +
> +err_remove:
> +	if (iova < iter.cur_iova) {
> +		last_iova = iter.cur_iova - 1;
> +		iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
> +			iopt_area_remove_access(
> +				area,
> +				iopt_area_iova_to_index(area, iter.cur_iova),
> +				iopt_area_iova_to_index(
> +					area, min(last_iova,
> +						  iopt_area_last_iova(area))));
> +	}
> +	up_read(&iopt->iova_rwsem);
> +	return rc;
> +}
> +
> +void iopt_unpin_pages(struct io_pagetable *iopt, unsigned long iova,
> +		      unsigned long length)
> +{
> +	struct iopt_area_contig_iter iter;
> +	unsigned long last_iova;
> +	struct iopt_area *area;
> +
> +	if (WARN_ON_ONCE(!length) ||
> +	    WARN_ON_ONCE(check_add_overflow(iova, length - 1, &last_iova)))
> +		return;
> +
> +	down_read(&iopt->iova_rwsem);
> +	iopt_for_each_contig_area(&iter, area, iopt, iova, last_iova)
> +		iopt_area_remove_access(
> +			area, iopt_area_iova_to_index(area, iter.cur_iova),
> +			iopt_area_iova_to_index(
> +				area,
> +				min(last_iova, iopt_area_last_iova(area))));
> +	WARN_ON_ONCE(!iopt_area_contig_done(&iter));
> +	up_read(&iopt->iova_rwsem);
> +}
> -- 
> 2.43.0
> 

