Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11E9C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=; b=lvCDFNkHmQM7MFPVOmBuWBJ9bS
	8JmdsEGvhCR1XbgLvoc1lhY1Eq/1n47KTIbbkefneITpYaJQKKXoMUDgapt7IaIZSaz01Vf8rUw4A
	W/1DRsm6Iuohm2gzPYaVZawR9M7wS/apq8glp3m3h06ElEuXD9jCh/2kLoH9imKhV+l6jrksNFjmi
	l+5CFHLK+jPQgBqX2KyH62yUQjgzQRLxymC3F12xWXsRmm6GeUhJSMJ5h9kw7oKEgFnQnLgZNgscT
	5CWQB1wVvJDR34ByVmlOsJ+yhiDHzkssd2s2HXG61fRLTRTDRKlju39DnjJo7/GBFcHP9XRwHC+T1
	5IejBOaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbOw-00000005amm-0A7U;
	Tue, 01 Jul 2025 13:51:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa8S-00000005JQA-3lGY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:30:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-237f18108d2so175525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751373052; x=1751977852; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=;
        b=H5ff3tDkO/7riRuJm3/EZ+EYkfUKwl/cbKW6ecoF6gnaM/cqQdP8Kqn+mTkylc6I6o
         /eNLkougzb8s7JqKpUjdrxtErKA41l6kj7nL+UUyE69wnoQJ7MLs+0CXLtiItMwhoyro
         4BAgaSQwDAQq9kSoQRjsLICjQ5/6HSwupDYmOknzMU1UGbUt2avt/umkyfD/1eU9Thpl
         NOwCGZyWLZvSK/nc2Mhc/XiXrzJn35mvwK7JFEOD9TMMg3MLwdHwknIV34veDdAaV6QU
         uS5WGaT1/409ZVnFm73dX1y+iclSL2AmhyF5HIq4wSpIT9kDAiwHn98mur0NKyXU+Hoa
         tWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373052; x=1751977852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5G5J3LAQCME/FJ/aVZc/0ZWGlfQeuCDS4lOhsOKRFGs=;
        b=F1Z9L+TxxFwVGJqqaEMh79jHY3XJmt/Ma2NouC6dTIDh1HZs69WbE+4GmUK3PjdGit
         u1XyWOetwjpMjnhdSnL8C7abEGnciJd8ChEQvm4nGdiDgafJqzn/MQolQ2UVZwNX9exZ
         jUoI4t8jLibZ/q5nJRBfhJqovgexce+0XQb9QyL8EhgEgcEZVETFkS4RzdW+hBs8X35w
         ozDc+6ktA/XivDpmNrtoJcOzZ2TtaxE3xeeAycsjhXCh3VzPVx4tAUsMvww82PNJ3nIK
         kfl3jk9yZgdostalBSmBVkCfXGZNiN/T+Nh0Sv0MkDu8U1OvOilpipONUaYUiO6dgv/W
         ANBg==
X-Forwarded-Encrypted: i=1; AJvYcCULWT8PohQH2GNLhHO6xcCjU5p7Qj5Bd2KouNru3GLmYDHZyCrcLgs3h8up97AV9SJ6cCWp/swXG8NgoPb3zdI0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdf1ZpT/E7Kc3ELeneg80nm1rOCHa/SFRUpE6CjyAjFVlQaauR
	H70SpngLeKye1w8OOvCsoDYx2IcECNKbfC6OkGnPltdCOy7ASql8JTl3gmeMtlXepA==
X-Gm-Gg: ASbGncsUMwmPADNJ0xunNSLcMua4pgPZkY2THNoFmSu5Kga3zhp+fXEFZczAZGrWVzZ
	7VyFCdlmOpY6UxdbU8ExjJexuS24Bp5BMI+4OuqWTOHrOfeR+v9mnmmMbKLg3LwBYU+o8QZRTNt
	gLz6WuvasZWTFlHuVJVZN/Bi1iTqCGg3K/K43dAHeELMnvCJaDEuD/mszTJeZ0tYh5e0v2ilhjO
	y404uR3nMyWSjhXb2NG3EZkjAKPFka3gncNrREudEYi/D1q9n2GBzV9COWq9huiyn95jD+VyYxw
	lPN1EHOEKniFhXWt24TbS5TJQ1+vuoB8I08EsA3BazU8vcY1NlzZEdyfUMeuMuQe8cCSxLVwM4x
	cFeCTPWexR/oBaBhtFLRb
X-Google-Smtp-Source: AGHT+IGYS+ky70yGGbfgecWTu3WMn+4HvkqtKADO91HI0LqScQKuEGTHZn38lZjYqivfuwsxMW7HzQ==
X-Received: by 2002:a17:902:ce89:b0:235:f10a:ad0 with SMTP id d9443c01a7336-23c601a7645mr2227915ad.28.1751373051941;
        Tue, 01 Jul 2025 05:30:51 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da818sm9319671a12.61.2025.07.01.05.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:30:51 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:30:42 +0000
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
Subject: Re: [PATCH v7 02/28] iommufd/viommu: Explicitly define vdev->virt_id
Message-ID: <aGPU8qgfsa816eQ1@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7a558bfcdce5c2ea0d53b0c9c382f944df33ce.1750966133.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_053052_933609_9F0FC8B5 
X-CRM114-Status: GOOD (  21.48  )
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

On Thu, Jun 26, 2025 at 12:34:33PM -0700, Nicolin Chen wrote:
> The "id" is too genernal to get its meaning easily. Rename it explicitly to
> "virt_id" and update the kdocs for readability. No functional changes.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 7 ++++++-
>  drivers/iommu/iommufd/driver.c          | 2 +-
>  drivers/iommu/iommufd/viommu.c          | 4 ++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4f5e8cd99c96..09f895638f68 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -634,7 +634,12 @@ struct iommufd_vdevice {
>  	struct iommufd_object obj;
>  	struct iommufd_viommu *viommu;
>  	struct device *dev;
> -	u64 id; /* per-vIOMMU virtual ID */
> +
> +	/*
> +	 * Virtual device ID per vIOMMU, e.g. vSID of ARM SMMUv3, vDeviceID of
> +	 * AMD IOMMU, and vRID of a nested Intel VT-d to a Context Table
> +	 */
> +	u64 virt_id;
>  };
>  
>  #ifdef CONFIG_IOMMUFD_TEST
> diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
> index 2fee399a148e..887719016804 100644
> --- a/drivers/iommu/iommufd/driver.c
> +++ b/drivers/iommu/iommufd/driver.c
> @@ -30,7 +30,7 @@ int iommufd_viommu_get_vdev_id(struct iommufd_viommu *viommu,
>  	xa_lock(&viommu->vdevs);
>  	xa_for_each(&viommu->vdevs, index, vdev) {
>  		if (vdev->dev == dev) {
> -			*vdev_id = vdev->id;
> +			*vdev_id = vdev->virt_id;
>  			rc = 0;
>  			break;
>  		}
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 25ac08fbb52a..bc8796e6684e 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -111,7 +111,7 @@ void iommufd_vdevice_destroy(struct iommufd_object *obj)
>  	struct iommufd_viommu *viommu = vdev->viommu;
>  
>  	/* xa_cmpxchg is okay to fail if alloc failed xa_cmpxchg previously */
> -	xa_cmpxchg(&viommu->vdevs, vdev->id, vdev, NULL, GFP_KERNEL);
> +	xa_cmpxchg(&viommu->vdevs, vdev->virt_id, vdev, NULL, GFP_KERNEL);
>  	refcount_dec(&viommu->obj.users);
>  	put_device(vdev->dev);
>  }
> @@ -150,7 +150,7 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_idev;
>  	}
>  
> -	vdev->id = virt_id;
> +	vdev->virt_id = virt_id;
>  	vdev->dev = idev->dev;
>  	get_device(idev->dev);
>  	vdev->viommu = viommu;

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

