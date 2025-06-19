Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0A1C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrdYKQcH3sp0apOchPLnA+m1+Ly6Mzn8RffcZko3gSE=; b=Mn2Ezqva1X89fKSsqwgdlpjLwV
	KGkzMBAEWhtEOXupU1Xec0CN3L4kbYu1lC0r9se+4Sp6ZXS01yrgGQkTkvOr+09/cFS8toN05VpAa
	YS57etoKcbvil4VXNlh59ZIh+r392VmKmo6Y0gFGTp9Z8j2tpGJL9S/K63Nuf9DYFZ/xWTnqT36Hv
	9z7wFdNXBONSILumqdsYka2MXbrJ9rGc5jgiexZfsp1W1nA3UxKJlXUxPq7fXvZs4X1ZutOzbUSzO
	A2ANt9RggLxqiMEb6k38d3rIuTky4tbXQ8NrR3FBN79RLCBYGayq4x86FbBorBV+c/0xmwQ2gIzxu
	y8U/c4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRY-0000000DRUK-3d7I;
	Thu, 19 Jun 2025 15:44:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCTh-0000000Ckan-2ZU0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 10:26:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-235e389599fso166575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750328801; x=1750933601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrdYKQcH3sp0apOchPLnA+m1+Ly6Mzn8RffcZko3gSE=;
        b=x3HOx6VEGsfrkjLH3NK04LqqZvvZZRzdMBTbradLmetreiyPX/LR8Fr1lT2ephC/o3
         bk+DlkNszJxa57fz7falnJjRHipPIgPoE85hGi9sxmQJ3+VHBS8zqPvIxJT0chud6cJV
         IH1lZzUclECRMqTtVu7pU9l9Lof2K6YEFqQRLl+PSihOxosF6+40LnYowHt/rGx0SfCK
         /PCxcoc6x7yxscq8DZx0PEbcbL3nYVf+r8cVCI5Zil1nUZPg0eZnDttvqp+XtvfV+u/f
         9jZvBe5tIE0XfL5DyImtm6q3oeHazisjPicQ/aBonZ8iC+n9E1Rt1tumtrnMPp9RO1JG
         2EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750328801; x=1750933601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrdYKQcH3sp0apOchPLnA+m1+Ly6Mzn8RffcZko3gSE=;
        b=maMCqu8uryW34tfDC5Ed6mPJ3D8HVRFEJeKOn7IfaxujkDXMKqDz1TMvGHxDJ69mYy
         KsJc2qRQtquva0b6sRdw5E4NfQiJQ3ZBwNDp/6LqsxNeD3mpXC2kKqAD5NERPp7az77I
         98AnAOvwHYiL2V10huccs1WW3dV51Tzq2U1E//JOIqVFWELnf6LGiJSX4etsgIP8XDEF
         QYqd7PWROdiClqT2vpQPYbirWptF4y0/EN8powL/6rEEaFif7oqNgsppUzSk7zzhhXbQ
         eGTNHEBikDzQTLJgSSYwfXZ4VY5yW6p5zo3UfvEGbiHMVd7f45oBRNnM7MKT02ml9e6B
         3QDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNTikkw+0p6ShWkim7vBhA8HghnIENWV0wmv7Jiymj1Ok2YMLGgO47wtHQ5oL7dFwZTwyTqKBOCqH7jXDnMBUT@lists.infradead.org
X-Gm-Message-State: AOJu0YzodvcKANtChPKmpwoG/ZlNIPH5sZ4OzJi1p4z6QVoE/P21eZCt
	z+EPzZBu471EIBIhd6tW0SwnR3713U0FaLpcR1J5RnGLhkTZTBxhmgt+Z+mmtZqJAA==
X-Gm-Gg: ASbGncttEY/bSGZGprgrA2yAwKuJrT1LrTz3Kc1s+QNGbR33i7YbeAaIq/96jYQbING
	vTUYT9T2/VsZnjyX7pcVKFgMyifjXzC6Ng8YC9NmCoeLOmvJbYDtEoVHQKar5qLL48ywKxu8+du
	eMwWGsbNdhHwKN0mft80lm1qpgDcnE3R1gHS5Qe9djvjusnN0r5bo9dtGQnvejYbEMVQ2U0s+dy
	dIB8KeMugyGbBdUP0q4iAwKxsb2YuMZBMP5FoBDaT3hScfeOhXIJPCnMf8qE2xIn63CXbWtbqF1
	C9Mp2F2nqqHD+E6jGArIh8bsd70SawXpLieHCLx1WHjAoyyVC7ZmjILvOlriHkodxNbhFUkNzUW
	d/7WSFArPPy7A+Dn3TOLL
X-Google-Smtp-Source: AGHT+IGiUkrhNhPK9lXuO365Ne3OwVoTaAk8SvrZ2YyadUl+5Mml/HIcLv4k3/+1+30tV1lrdYYgXA==
X-Received: by 2002:a17:902:e5c3:b0:224:6c8:8d84 with SMTP id d9443c01a7336-237cca5ada5mr2619125ad.4.1750328800415;
        Thu, 19 Jun 2025 03:26:40 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b04e4sm12850712b3a.121.2025.06.19.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 03:26:39 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:26:28 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 08/25] iommufd/viommu: Add driver-defined vDEVICE
 support
Message-ID: <aFPl1LD8r3Du-Far@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <937d515032be07af36c06a4adb662ee2f7693c75.1749884998.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_032641_673078_9F8AFD4C 
X-CRM114-Status: GOOD (  37.31  )
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

On Sat, Jun 14, 2025 at 12:14:33AM -0700, Nicolin Chen wrote:
> NVIDIA VCMDQ driver will have a driver-defined vDEVICE structure and do
> some HW configurations with that.
> 
> To allow IOMMU drivers to define their own vDEVICE structures, move the
> struct iommufd_vdevice to the public header and provide a pair of viommu
> ops, similar to get_viommu_size and viommu_init.
> 
> Doing this, however, creates a new window between the vDEVICE allocation
> and its driver-level initialization, during which an abort could happen
> but it can't invoke a driver destroy function from the struct viommu_ops
> since the driver structure isn't initialized yet. vIOMMU object doesn't
> have this problem, since its destroy op is set via the viommu_ops by the
> driver viommu_init function. Thus, vDEVICE should do something similar:
> add a destroy function pointer inside the struct iommufd_vdevice instead
> of the struct iommufd_viommu_ops.
> 
> Note that there is unlikely a use case for a type dependent vDEVICE, so
> a static vdevice_size is probably enough for the near term instead of a
> get_vdevice_size function op.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  7 -------
>  include/linux/iommufd.h                 | 26 +++++++++++++++++++++++++
>  drivers/iommu/iommufd/viommu.c          | 26 ++++++++++++++++++++++++-
>  3 files changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 468717d5e5bc..e6b1eb2ab375 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -638,13 +638,6 @@ void iommufd_viommu_destroy(struct iommufd_object *obj);
>  int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd);
>  void iommufd_vdevice_destroy(struct iommufd_object *obj);
>  
> -struct iommufd_vdevice {
> -	struct iommufd_object obj;
> -	struct iommufd_viommu *viommu;
> -	struct device *dev;
> -	u64 id; /* per-vIOMMU virtual ID */
> -};
> -
>  #ifdef CONFIG_IOMMUFD_TEST
>  int iommufd_test(struct iommufd_ucmd *ucmd);
>  void iommufd_selftest_destroy(struct iommufd_object *obj);
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index 2d1bf2f97ee3..f3b5cfdb6d53 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -104,6 +104,16 @@ struct iommufd_viommu {
>  	enum iommu_viommu_type type;
>  };
>  
> +struct iommufd_vdevice {
> +	struct iommufd_object obj;
> +	struct iommufd_viommu *viommu;
> +	struct device *dev;
> +	u64 id; /* per-vIOMMU virtual ID */

Nit: Why not call this viommu_id?

> +
> +	/* Clean up all driver-specific parts of an iommufd_vdevice */
> +	void (*destroy)(struct iommufd_vdevice *vdev);
> +};
> +
>  /**
>   * struct iommufd_viommu_ops - vIOMMU specific operations
>   * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
> @@ -120,6 +130,14 @@ struct iommufd_viommu {
>   *                    array->entry_num to report the number of handled requests.
>   *                    The data structure of the array entry must be defined in
>   *                    include/uapi/linux/iommufd.h
> + * @vdevice_size: Size of the driver-defined vDEVICE structure per this vIOMMU
> + * @vdevice_init: Initialize the driver-level structure of a vDEVICE object, or
> + *                related HW procedure. @vdev is already initialized by iommufd
> + *                core: vdev->dev and vdev->viommu pointers; vdev->id carries a
> + *                per-vIOMMU virtual ID (refer to struct iommu_vdevice_alloc in
> + *                include/uapi/linux/iommufd.h)
> + *                If driver has a deinit function to revert what vdevice_init op
> + *                does, it should set it to the @vdev->destroy function pointer
>   */
>  struct iommufd_viommu_ops {
>  	void (*destroy)(struct iommufd_viommu *viommu);
> @@ -128,6 +146,8 @@ struct iommufd_viommu_ops {
>  		const struct iommu_user_data *user_data);
>  	int (*cache_invalidate)(struct iommufd_viommu *viommu,
>  				struct iommu_user_data_array *array);
> +	const size_t vdevice_size;
> +	int (*vdevice_init)(struct iommufd_vdevice *vdev);
>  };
>  
>  #if IS_ENABLED(CONFIG_IOMMUFD)
> @@ -224,4 +244,10 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
>  	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
>  	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_viommu,                 \
>  					((drv_struct *)NULL)->member)))
> +
> +#define VDEVICE_STRUCT_SIZE(drv_struct, member)                                \
> +	(sizeof(drv_struct) +                                                  \
> +	 BUILD_BUG_ON_ZERO(offsetof(drv_struct, member)) +                     \
> +	 BUILD_BUG_ON_ZERO(!__same_type(struct iommufd_vdevice,                \
> +					((drv_struct *)NULL)->member)))
>  #endif
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index c5eea9900c54..28ea5d026222 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -116,6 +116,8 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
>  		container_of(obj, struct iommufd_vdevice, obj);
>  	struct iommufd_viommu *viommu = vdev->viommu;
>  
> +	if (vdev->destroy)
> +		vdev->destroy(vdev);
>  	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
>  	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
>  	refcount_dec(&viommu->obj.users);
> @@ -126,6 +128,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  {
>  	struct iommu_vdevice_alloc *cmd = ucmd->cmd;
>  	struct iommufd_vdevice *vdev, *curr;
> +	size_t vdev_size = sizeof(*vdev);
>  	struct iommufd_viommu *viommu;
>  	struct iommufd_device *idev;
>  	u64 virt_id = cmd->virt_id;
> @@ -150,7 +153,22 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> -	vdev = iommufd_object_alloc_ucmd(ucmd, vdev, IOMMUFD_OBJ_VDEVICE);
> +	if (viommu->ops && viommu->ops->vdevice_size) {
> +		/*
> +		 * It is a driver bug for:
> +		 * - ops->vdevice_size smaller than the core structure size
> +		 * - not implementing a pairing ops->vdevice_init op
> +		 */
> +		if (WARN_ON_ONCE(viommu->ops->vdevice_size < vdev_size ||
> +				 !viommu->ops->vdevice_init)) {
> +			rc = -EOPNOTSUPP;
> +			goto out_put_idev;
> +		}
> +		vdev_size = viommu->ops->vdevice_size;
> +	}
> +
> +	vdev = (struct iommufd_vdevice *)_iommufd_object_alloc_ucmd(
> +		ucmd, vdev_size, IOMMUFD_OBJ_VDEVICE);
>  	if (IS_ERR(vdev)) {
>  		rc = PTR_ERR(vdev);
>  		goto out_put_idev;
> @@ -168,6 +186,12 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> +	if (viommu->ops && viommu->ops->vdevice_init) {
> +		rc = viommu->ops->vdevice_init(vdev);
> +		if (rc)
> +			goto out_put_idev;
> +	}
> +
>  	cmd->out_vdevice_id = vdev->obj.id;
>  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

