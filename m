Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02979C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhyBzxR8NyUZrkIJH4pc7IFsAn1vSN/LWAh25/3km3g=; b=ZyQSpXnmn1+xX4rEyjc30fKlKM
	NLuIa4EIBNXfGRpwblEGUNFdrEkkrtRH1ljGFWufK+r+YFMnEIYk0tH7Slklqi17AKegn71yt0pcC
	lSQTrijI6phYC7zJV9f232tcxUKtNGKa9OlssYKWgdkW+JjX39oYZidqjalTO1SRIdXABGUD0DHKd
	KHr7XtuVW00hvhEeeu6DEqb5zFX2nA+aH0811PR3K+UYY1eizKFoAvWP+iAqEmGYufgjaIvJYS0iM
	GWxxG3kL9SvRh8+36OYfAUBfcy1HnvxXM02jaxeq1/zNuZThxXtmJO5+2z5qQkqF53oUTbeL2pLkV
	JpBHBLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhv-00000009s2R-0YJ7;
	Tue, 29 Apr 2025 14:13:11 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kG4-00000009fWW-00vh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:40:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2264c9d0295so118055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745930419; x=1746535219; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhyBzxR8NyUZrkIJH4pc7IFsAn1vSN/LWAh25/3km3g=;
        b=y88GIe2oKnf++B5HwvYIsS9gE0QrpoAg68HzY8NdWXYjaZ45JJqlA4MczxmPAax4Ho
         iNVAUrTI8lTT8H+usJWVh6alDXbA9WVME6aGJmwjBIGYn4AU/X0PVvTTux9vS24aTptp
         YJs+Yb9HS4Qsu8xaLcjxJKSXxS805P8Fh4Oc0skzIlkcNj4CrhbLmqd1ceB9XY55IcFs
         XYZvXgYGkH9aJLJPPfwf2B1wCt2Z6n611cWeUbnPMJMCDWyDyw6ENTD7fTOrmh0CXTk0
         oG++9PUrz0Vmml/Bv7XLBm10rxN3Zwpavi1OsrmzvtIMXntH0Cb0WKibUQmG9X0qmfcf
         NZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745930419; x=1746535219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhyBzxR8NyUZrkIJH4pc7IFsAn1vSN/LWAh25/3km3g=;
        b=RPtj72flr81ptrE1VZHAZaUkxOufrG2JXPFN46b797APyLBsy+zQ+H7TdBzc6/soZA
         fFS4te1f+ajzxmCO/iaKnK/haRsVlC5+0cqrUa9vBHpVYewLGM0NHQtQEbIBFMgZKz7K
         pqxlslavAa5scMlzDxAZiHD6Xco5OEQLEQLitwM92wuShphmgT9PuTNJEMNdWqiHxzqD
         8rCE455R9k/na4pRPRjArDvp6rxspqhypii8QnOTIdIbEQbCofj/FyAPzJECw2x+eFcf
         FTdmUzI0n0xh8f0Dyspeo6H6aS37dmkeOZ5dkkuzCdAqGbtUn3oT8auLggcuLjLPHYTH
         6OZg==
X-Forwarded-Encrypted: i=1; AJvYcCWy6lzvZhd5dxA6NDrijo70ryeBa75wGQMFLV9bB9Zxz5XjxjHc8tOlfNNPqJNHHuSrHLSCYXZbbn0xXVbbMJc+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Kw5XxBxH8vw0y6su5s8YkH0fHOuDaFVVO42IemCR/ttLssYA
	/1O+zkI6Wsul5OERytcwvr9bSxcYRmUrsXiKrghW0e7Ij2lqH3UiHjxXdxQBJQ==
X-Gm-Gg: ASbGncsRFGn+Xbq2N+X6p4bfqhLanKIM1av/efENJMKGQ5CFV2Z0xsBnotzq83P733I
	aFiaTTI1Sbw9PFJ42Hr3d4k95qbfzWO1X3v1v0fwnHS/xJKGxuetFLo2PLDjY9C4JDn13vkwJAM
	gDyQ3JBf0LSmI5ORGKVcoNyD/JUpuQGU5vjO+2rust/dkNAJclc6rog7dAU8cwBD8Y7kLT3bT2W
	bK7EeNmWJpf2zrTs+6I5mpfl76RAplk3MwleFNqQuSzjRbEIOfpLBiQo9cZvNRDyZt8IwnDuY9I
	shLHS4UZCUf8DwByslz3KQUuskdzqEW/1d77vFZHAvxfDFD/VUcTaDAVChPtet1RjtQcmaGE
X-Google-Smtp-Source: AGHT+IH/V/T2eUYQJIXG2EPtw/1cOV7MQT9tuyQOLSioTulIDCv1mtnsV9bjGKGjf9rlwz1NRxgL8g==
X-Received: by 2002:a17:902:e786:b0:216:201e:1b63 with SMTP id d9443c01a7336-22de85f23admr2173255ad.11.1745930418710;
        Tue, 29 Apr 2025 05:40:18 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd2fcsm10065488b3a.179.2025.04.29.05.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:40:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 12:40:07 +0000
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
Subject: Re: [PATCH v2 11/22] iommufd: Add for-driver helpers
 iommufd_vcmdq_depend/undepend()
Message-ID: <aBDIpz7w8wxIn_AF@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a25c9454c17663f9e79b37bc2908bf3a99856be6.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_054020_071651_D97F0ED7 
X-CRM114-Status: GOOD (  31.69  )
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

On Fri, Apr 25, 2025 at 10:58:06PM -0700, Nicolin Chen wrote:
> NVIDIA Virtual Command Queue is one of the iommufd users exposing vIOMMU
> features to user space VMs. Its hardware has a strict rule when mapping
> and unmapping multiple global CMDQVs to/from a VM-owned VINTF, requiring
> mappings in ascending order and unmappings in descending order.
> 
> The tegra241-cmdqv driver can apply the rule for a mapping in the LVCMDQ
> allocation handler, however it can't do the same for an unmapping since
> the destroy op returns void.
> 
> Add iommufd_vcmdq_depend/undepend() for-driver helpers, allowing LVCMDQ
> allocator to refcount_inc() a sibling LVCMDQ object and LVCMDQ destroyer
> to refcount_dec().
> 
> This is a bit of compromise, because a driver might end up with abusing
> the API that deadlocks the objects. So restrict the API to a dependency
> between two driver-allocated objects of the same type, as iommufd would
> unlikely build any core-level dependency in this case.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommufd.h        | 47 ++++++++++++++++++++++++++++++++++
>  drivers/iommu/iommufd/driver.c | 28 ++++++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index e91381aaec5a..5dff154e8ce1 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -232,6 +232,10 @@ struct iommufd_object *_iommufd_object_alloc(struct iommufd_ctx *ictx,
>  					     size_t size,
>  					     enum iommufd_object_type type);
>  void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj);
> +int iommufd_object_depend(struct iommufd_object *obj_dependent,
> +			  struct iommufd_object *obj_depended);
> +void iommufd_object_undepend(struct iommufd_object *obj_dependent,
> +			     struct iommufd_object *obj_depended);
>  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>  				       unsigned long vdev_id);
>  int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
> @@ -252,6 +256,17 @@ static inline void iommufd_object_abort(struct iommufd_ctx *ictx,
>  {
>  }
>  
> +static inline int iommufd_object_depend(struct iommufd_object *obj_dependent,
> +					struct iommufd_object *obj_depended)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void iommufd_object_undepend(struct iommufd_object *obj_dependent,
> +					   struct iommufd_object *obj_depended)
> +{
> +}
> +
>  static inline struct device *
>  iommufd_viommu_find_dev(struct iommufd_viommu *viommu, unsigned long vdev_id)
>  {
> @@ -329,4 +344,36 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
>  		static_assert(offsetof(typeof(*drv_struct), member.obj) == 0); \
>  		iommufd_object_abort(ictx, &drv_struct->member.obj);           \
>  	})
> +
> +/*
> + * Helpers for IOMMU driver to build/destroy a dependency between two sibling
> + * structures created by one of the allocators above
> + */
> +#define iommufd_vcmdq_depend(vcmdq_dependent, vcmdq_depended, member)          \
> +	({                                                                     \
> +		static_assert(__same_type(struct iommufd_object,               \
> +					  vcmdq_dependent->member.obj));       \
> +		static_assert(offsetof(typeof(*vcmdq_dependent),               \
> +					      member.obj) == 0);               \
> +		static_assert(__same_type(struct iommufd_object,               \
> +					  vcmdq_depended->member.obj));        \
> +		static_assert(offsetof(typeof(*vcmdq_depended),                \
> +					      member.obj) == 0);               \
> +		iommufd_object_depend(&vcmdq_dependent->member.obj,            \
> +				      &vcmdq_depended->member.obj);            \
> +	})
> +
> +#define iommufd_vcmdq_undepend(vcmdq_dependent, vcmdq_depended, member)        \
> +	({                                                                     \
> +		static_assert(__same_type(struct iommufd_object,               \
> +					  vcmdq_dependent->member.obj));       \
> +		static_assert(offsetof(typeof(*vcmdq_dependent),               \
> +					      member.obj) == 0);               \
> +		static_assert(__same_type(struct iommufd_object,               \
> +					  vcmdq_depended->member.obj));        \
> +		static_assert(offsetof(typeof(*vcmdq_depended),                \
> +					      member.obj) == 0);               \
> +		iommufd_object_undepend(&vcmdq_dependent->member.obj,          \
> +					&vcmdq_depended->member.obj);          \
> +	})
>  #endif
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index 7980a09761c2..fb7f8fe40f95 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -50,6 +50,34 @@ void iommufd_object_abort(struct iommufd_ctx *ictx, struct iommufd_object *obj)
>  }
>  EXPORT_SYMBOL_NS_GPL(iommufd_object_abort, "IOMMUFD");
>  
> +/* A per-structure helper is available in include/linux/iommufd.h */
> +int iommufd_object_depend(struct iommufd_object *obj_dependent,
> +			  struct iommufd_object *obj_depended)
> +{
> +	/* Reject self dependency that dead locks */
> +	if (obj_dependent == obj_depended)
> +		return -EINVAL;
> +	/* Only support dependency between two objects of the same type */
> +	if (obj_dependent->type != obj_depended->type)
> +		return -EINVAL;
> +
> +	refcount_inc(&obj_depended->users);
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_object_depend, "IOMMUFD");
> +
> +/* A per-structure helper is available in include/linux/iommufd.h */
> +void iommufd_object_undepend(struct iommufd_object *obj_dependent,
> +			     struct iommufd_object *obj_depended)
> +{
> +	if (WARN_ON_ONCE(obj_dependent == obj_depended ||
> +			 obj_dependent->type != obj_depended->type))
> +		return;
> +
> +	refcount_dec(&obj_depended->users);
> +}
> +EXPORT_SYMBOL_NS_GPL(iommufd_object_undepend, "IOMMUFD");
> +
>  /* Caller should xa_lock(&viommu->vdevs) to protect the return value */
>  struct device *iommufd_viommu_find_dev(struct iommufd_viommu *viommu,
>  				       unsigned long vdev_id)

If I'm getting this right, I think we are setting up dependencies like:
vcmdq[2] -> vcmdq[1] -> vcmdq[0] based on refcounts of each object,
which ensures that the unmaps happen in descending order..

If that's right, Is it fair to have iommufd_vcmdq_depend/undepend in the
core code itself? Since it's a driver-level limitation, I think we
should just have iommufd_object_depend/undepend in the core code and the
iommufd_vcmdq_depend/undepend can move into the CMDQV driver?

> -- 
> 2.43.0
> 

Thanks,
Praan

