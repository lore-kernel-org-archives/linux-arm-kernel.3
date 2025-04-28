Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518ABC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTPDgyBQFtwamlv7MOGnKiNXfQ7Dnv+t8g+TQ5a6GG8=; b=Hum+5it62kLVx7dxF8EurqSJ96
	xIVmDnYmVuddfnztgVTb5o5CahcD3DkPd82Hxu6lHBzHI1kavZOHKshBM6XYJJ/d0NFTfXdKp/yof
	Co6MZIGMYxCM+z665iAvyvTSPmYEShnjRWbtMdAnKMn899pLxgxIZUJ4UgDloqt1md+4yvReDyQiW
	+fky/222kYBBFJRh+LM2YL6VG11fgOH/BfOqVI0db4EHeA8DGbxLuo1xnwuWbIxWlW/PUBYh4PVmW
	ceGuOdxndRa4BfYhBLr7Lm0KWlWwFMy5uGAN+dl1t276NJMX4QMR3BPah0BCiERqvocApb+gba7I6
	tKhUyG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VeB-00000007YRp-0ihm;
	Mon, 28 Apr 2025 21:04:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VcA-00000007Y2L-3eHQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 21:02:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2263428c8baso14115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 14:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745874130; x=1746478930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTPDgyBQFtwamlv7MOGnKiNXfQ7Dnv+t8g+TQ5a6GG8=;
        b=NKaBLhIE0FwmEuSJX3lkxqspRVcoOoZZhxkO6Bqe5tRtqF7CsGvZCX/24MBFnB11xz
         RgLvkKkYSjpZrbownmZOiPOi/X479pCae+8xDH2h/2/eQoAaIbjN2T6AutfxZuk6cwav
         ZPhzQSrP400b4SiylmVBrUvB2Whlp6oipOOwsCMXkTo/LuNYAMwdpJ/m7Wozi1t3kBpd
         CRfJESYcUauNYlETssLZzCXs0sX3wVRLVZlFxowOxK8Ae0Dk2FMfgYZS7FMTiqz7vvxa
         MBId8eUP2deiEsKUAkYs8tlGYLeNz4Jg0z8FtYgpFSl6B++uCAht6+zo40X+IrxvXRFT
         +j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745874130; x=1746478930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTPDgyBQFtwamlv7MOGnKiNXfQ7Dnv+t8g+TQ5a6GG8=;
        b=WqBafCwXFaOyhyWesg+A7QJd8P2SfakeZf+/V7XTb9uhYhf6pJqePh46FjsO9zIuap
         aePN1EXPYlhjDGuhYTBh6DIDnvGaPU0NYRTubBogDZPkwohXdWwDWwRzcozrhPnZhkUG
         8UdygO+YlwARDazaQxzXous01n1pSiCdapUW+WGCpG3S14dtS7+Hv1WmCmqAWaqLj4to
         F3HXCj0uMcG7ANCTZsaR2BSK5eaS2c2iHnFXtQegDqHi5oWoMqJ8jimDSRcUqUralwUB
         Y/Bn9dH/TlbPYI2fjFiKfCMpkh9kzOPVJBrJrbWbUZTEaBYo2Wm5rYjAFSxOrYJ36+JU
         FtPw==
X-Forwarded-Encrypted: i=1; AJvYcCWYfv9S2FczBQQJ3RU477bINrxJauiN6qS1MdtiGVeAzwuHNYr84ZtCDMpg+Gnf7MyxnTtfQyBsLB0daN4udlSr@lists.infradead.org
X-Gm-Message-State: AOJu0YxFy9g3tidjEnjsqM9LRNupI4QGsIRCxRRYRekn6CGO7akouIxp
	fiIsUKUPbA/V8JvAVe1zJuwPs93E3BHTBdMoiQRwThsYWo9rBOXFFvBeoDfarg==
X-Gm-Gg: ASbGncvz95V4znR+cqtnvy/T8f89nY2SusZHoXBUrPKAMCvfVyVJcfcumK41982BxZt
	kTPEk6WIrPZj0S9HjWkt3St+Z47WwaPrYP9CKpotvCjeiMa/5orRAzyUZt3facTul4JmyK6FWoQ
	XMj4VIOJ5aHYFB3VsndF3CoO/aoYXPFqPzmDIEEpfirvOqkhUBF3y128AxmzzoxjcxYQbUFAsiH
	QIkezBLZYQ6KRolVCKhruAPRSMdF77C8o1vKUB356ItuTedhzrXV/9lW6QcvHoSpBO6XjczaREX
	ApbIIYMGv9XmwWtUh+3H02MTb+GprC5nb6xXK1MsEi4C3AToYUMvbi1fh1Ii/6Qz964BMqqEUcX
	uDsBLZ5k=
X-Google-Smtp-Source: AGHT+IGSuMnWnZQ91ixDrXUdSEwCsKBdyqU3BwTCUj27r44/z7SX9aXDHYQTjWFgiPOhsJhMa9YvFg==
X-Received: by 2002:a17:903:124d:b0:223:37ec:63be with SMTP id d9443c01a7336-22de6c49626mr781305ad.4.1745874129655;
        Mon, 28 Apr 2025 14:02:09 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a3casm8778803b3a.96.2025.04.28.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:02:09 -0700 (PDT)
Date: Mon, 28 Apr 2025 21:01:58 +0000
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
Subject: Re: [PATCH v2 09/22] iommufd/viommu: Introduce IOMMUFD_OBJ_VCMDQ and
 its related struct
Message-ID: <aA_sxstJRbG1znKs@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <8bab0069503fa21b48298ed2ffe29a06963f71f5.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bab0069503fa21b48298ed2ffe29a06963f71f5.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_140210_908617_1B25876C 
X-CRM114-Status: GOOD (  24.25  )
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

On Fri, Apr 25, 2025 at 10:58:04PM -0700, Nicolin Chen wrote:
> Add a new IOMMUFD_OBJ_VCMDQ with an iommufd_vcmdq structure, representing
> a command queue type of physical HW passed to a user space VM. This vCMDQ
> object, is a subset of vIOMMU resources of a physical IOMMU's, such as:
>  - NVIDIA's virtual command queue
>  - AMD vIOMMU's command buffer
> 
> Inroduce a struct iommufd_vcmdq and its allocator iommufd_vcmdq_alloc().
> Also add a pair of viommu ops for iommufd to forward user space ioctls to
> IOMMU drivers.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  include/linux/iommufd.h | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/include/linux/iommufd.h b/include/linux/iommufd.h
> index ef0d3c4765cf..e91381aaec5a 100644
> --- a/include/linux/iommufd.h
> +++ b/include/linux/iommufd.h
> @@ -37,6 +37,7 @@ enum iommufd_object_type {
>  	IOMMUFD_OBJ_VIOMMU,
>  	IOMMUFD_OBJ_VDEVICE,
>  	IOMMUFD_OBJ_VEVENTQ,
> +	IOMMUFD_OBJ_VCMDQ,
>  #ifdef CONFIG_IOMMUFD_TEST
>  	IOMMUFD_OBJ_SELFTEST,
>  #endif
> @@ -112,6 +113,14 @@ struct iommufd_vdevice {
>  	u64 id; /* per-vIOMMU virtual ID */
>  };
>  
> +struct iommufd_vcmdq {
> +	struct iommufd_object obj;
> +	struct iommufd_ctx *ictx;
> +	struct iommufd_viommu *viommu;
> +	dma_addr_t addr;
> +	size_t length;
> +};
> +
>  /**
>   * struct iommufd_viommu_ops - vIOMMU specific operations
>   * @destroy: Clean up all driver-specific parts of an iommufd_viommu. The memory
> @@ -135,6 +144,13 @@ struct iommufd_vdevice {
>   * @vdevice_destroy: Clean up all driver-specific parts of an iommufd_vdevice.
>   *                   The memory of the vDEVICE will be free-ed by iommufd core
>   *                   after calling this op
> + * @vcmdq_alloc: Allocate a @type of iommufd_vcmdq as a user space command queue
> + *               for a @viommu. @index carries the logical vcmdq ID (for a multi-
> + *               queue case); @addr carries the guest physical base address of
> + *               the queue memory; @length carries the size of the queue memory
> + * @vcmdq_destroy: Clean up all driver-specific parts of an iommufd_vcmdq. The
> + *                 memory of the iommufd_vcmdq will be free-ed by iommufd core
> + *                 after calling this op
>   */
>  struct iommufd_viommu_ops {
>  	void (*destroy)(struct iommufd_viommu *viommu);
> @@ -147,6 +163,10 @@ struct iommufd_viommu_ops {
>  						 struct device *dev,
>  						 u64 virt_id);
>  	void (*vdevice_destroy)(struct iommufd_vdevice *vdev);
> +	struct iommufd_vcmdq *(*vcmdq_alloc)(struct iommufd_viommu *viommu,
> +					     unsigned int type, u32 index,
> +					     dma_addr_t addr, size_t length);
> +	void (*vcmdq_destroy)(struct iommufd_vcmdq *vcmdq);
>  };
>  
>  #if IS_ENABLED(CONFIG_IOMMUFD)
> @@ -286,6 +306,21 @@ static inline int iommufd_viommu_report_event(struct iommufd_viommu *viommu,
>  		ret;                                                           \
>  	})
>  
> +#define iommufd_vcmdq_alloc(viommu, drv_struct, member)                        \
> +	({                                                                     \
> +		drv_struct *ret;                                               \
> +									       \
> +		static_assert(__same_type(struct iommufd_viommu, *viommu));    \
> +		static_assert(__same_type(struct iommufd_vcmdq,                \
> +					  ((drv_struct *)NULL)->member));      \
> +		static_assert(offsetof(drv_struct, member.obj) == 0);          \
> +		ret = (drv_struct *)_iommufd_object_alloc(                     \
> +			viommu->ictx, sizeof(drv_struct), IOMMUFD_OBJ_VCMDQ);  \
> +		if (!IS_ERR(ret))                                              \
> +			ret->member.viommu = viommu;                           \
> +		ret;                                                           \
> +	})
> +
>  /* Helper for IOMMU driver to destroy structures created by allocators above */
>  #define iommufd_struct_destroy(ictx, drv_struct, member)                       \
>  	({                                                                     \
> -- 
> 2.43.0
> 

