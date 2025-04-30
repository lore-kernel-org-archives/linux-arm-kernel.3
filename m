Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E44DC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVawBlGLpoSzo0dY08dmSMH05U/ahZ0t0/eytQcNdTQ=; b=EYOTimxlO9hgPTQDEcUVjjLmEG
	ykm/+QS3OOxBLUZmdwGKij4+yp+CE/9zArj06sg5e7XS4xoSb+vc2EHhGSIPcgazOOfRDdaIIByTP
	nli+78Sz4aN9rT0Kv4l6u7fFeRlbJBa4uKTaiJokMoDF6Pr8LnYgfzYrHpTUVUfZwMou8CgpnudR/
	GzYKNTeCbF5pVTPuik0op4J+R8thZOcCe3L3Zk/hmHiWtmFOSZfsIbP+t5IF/wmq71IYryBRliedN
	bD2gt7lOlalJ/EKffDLVY5h+pTdAj8mLO1ZAH1tYJ/reD18lsAO6p8OV9tMs0cWj5E7XNAFzDVDvw
	bqMaJO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAFZ7-0000000E8Rv-2vRn;
	Wed, 30 Apr 2025 22:06:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAFXB-0000000E8I1-3qcK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 22:04:07 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2264c9d0295so20535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746050645; x=1746655445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FVawBlGLpoSzo0dY08dmSMH05U/ahZ0t0/eytQcNdTQ=;
        b=P95YJXcGaE1ZSfdCLnvMdCOmPDI6Z7iOL1Q5V6vRhlDeXPeylNzgjo+S3gWHWOhnL4
         IvVmrgICdzAQThxCO7y9LpAUWXJwAopzTPELK33FfKbzEsLoprACue1riewU047nSqXy
         DzkvX6AeFhrxw4KEGvAbHBGL8jy6eszMnHS/4bAsXDZfUvbI4/9pdmGyCusaskqek2lS
         sxsbGqnymR/2+eGag5UA3nJC8a6t7iDrt7+/bENbJyUMjk6rEfqCw+9KtplKoEB+SAnZ
         Xo5l7oFQfbMTrjLjGij2HyUFR8m8fIdv0dIWNumq6WDTmNpwHp7ViKARvPtOK4zweiem
         izhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050645; x=1746655445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVawBlGLpoSzo0dY08dmSMH05U/ahZ0t0/eytQcNdTQ=;
        b=wKxRQQSKqdv4oE+H1Mw6q0FmPQFdF6pBKSnJv8v470wKpNajKf1Oxaio6ngYAUogXz
         oIEZuRLnA3g2FJmhZ7NHtyIaKbnGwDkVH8qPZEDXlss+ry4rbY7oFa/ciPUCX85dFInT
         e2FjNhT/8Kzcd+qwL6dkOHHfrxnhv86BOk+GExak8fvTgTTT319vtOX7F3J715t3cYVa
         yEd7/WlirtqlNajqvFJMtp3v5bfzSULvQFuNrdn1zxI+1zIdRN8KLvHTxyR0KnIxhZIL
         IvI4H4W0tdDbA7zFGQNAhGVEQml5Pot1HdZlECtxSsv7+y/XO/VEm2360VG8zp5xPaoD
         F21g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5yYMJaO2fcOEz9eied1go6NOobLTmvjAp8wdxKu/n2dQh6AwmBjQCtz9Y3SSXcFS3V7grktM7dg6ucZqwKpf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0AEX5dl8VJ4Kfk0bC9RGiusxGRIX5GL7/LpnAv/rOSBIsUDwq
	cS8TJbMVqxmaMwUn+XbOJj1lsPUljVEVA8PIrda5wOzvyjiPsQSEfeBHL5mamQ==
X-Gm-Gg: ASbGncsRw9+jh2BZFVFQFICA6Add90XuSjyI0OJtIOj3hOf2DnZNzdIcd9B5vFv3Ada
	PnjnXVOGRnKAQBIpWL/r+VgYfU8H1VAYuWPyVQs/BzLVjtJnSj1c+YcZhMqCA/4VNY8k7cH+KrQ
	UKIfEYO5qZX+mRiJTJ8reF8LBw0e8ZRGqEIoe1zyKGAimIEb1UiJvQX/5vtr4Pek8EjrI67Jh7J
	iMuY8GObWkPsSAC+IE1dEjHmpAuym6UhffUmI0XWxoNnexCsel+gozqXO8M3HPJXxFC7PZTgCk0
	6919M9rEJPlf/y2VH0GHicZ0I28wf1EJ866PYaBRX4ZQ1O/6+EG/j9CbyN5kzfyNhfmNpshP
X-Google-Smtp-Source: AGHT+IGd4hYbbWLBFZpJCFZt3J+kQFvNTF3X43diXZZjefIRoFc4WvBq3IOD+DnYRjbMCinfwG1ReQ==
X-Received: by 2002:a17:903:17c3:b0:21f:9f4:4a03 with SMTP id d9443c01a7336-22e07a8ada1mr325415ad.21.1746050644476;
        Wed, 30 Apr 2025 15:04:04 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5104cd5sm127537775ad.199.2025.04.30.15.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:04:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 22:03:53 +0000
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
Subject: Re: [PATCH v2 22/22] iommu/tegra241-cmdqv: Add
 IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV support
Message-ID: <aBKeSeuPvTruzchM@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <a7db1d2fe5dd43ac7ac075df662f3ab743ac6aa2.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7db1d2fe5dd43ac7ac075df662f3ab743ac6aa2.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_150405_949784_491A3AA4 
X-CRM114-Status: GOOD (  23.44  )
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

On Fri, Apr 25, 2025 at 10:58:17PM -0700, Nicolin Chen wrote:
> Add a new vEVENTQ type for VINTFs that are assigned to the user space.
> Simply report the two 64-bit LVCMDQ_ERR_MAPs register values.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

> ---
>  include/uapi/linux/iommufd.h                  | 15 +++++++++++++
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    | 22 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/include/uapi/linux/iommufd.h b/include/uapi/linux/iommufd.h
> index d69e7c1d39ea..d814b0f61fad 100644
> --- a/include/uapi/linux/iommufd.h
> +++ b/include/uapi/linux/iommufd.h
> @@ -1113,10 +1113,12 @@ struct iommufd_vevent_header {
>   * enum iommu_veventq_type - Virtual Event Queue Type
>   * @IOMMU_VEVENTQ_TYPE_DEFAULT: Reserved for future use
>   * @IOMMU_VEVENTQ_TYPE_ARM_SMMUV3: ARM SMMUv3 Virtual Event Queue
> + * @IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV: NVIDIA Tegra241 CMDQV Extension IRQ
>   */
>  enum iommu_veventq_type {
>  	IOMMU_VEVENTQ_TYPE_DEFAULT = 0,
>  	IOMMU_VEVENTQ_TYPE_ARM_SMMUV3 = 1,
> +	IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV = 2,
>  };
>  
>  /**
> @@ -1140,6 +1142,19 @@ struct iommu_vevent_arm_smmuv3 {
>  	__aligned_le64 evt[4];
>  };
>  
> +/**
> + * struct iommu_vevent_tegra241_cmdqv - Tegra241 CMDQV IRQ
> + *                                      (IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV)
> + * @lvcmdq_err_map: 128-bit logical vcmdq error map, little-endian.
> + *                  (Refer to register LVCMDQ_ERR_MAPs per VINTF )
> + *
> + * The 128-bit register value from HW exclusively reflect the error bits for a
> + * Virtual Interface represented by a vIOMMU object. Read and report directly.
> + */
> +struct iommu_vevent_tegra241_cmdqv {
> +	__aligned_le64 lvcmdq_err_map[2];
> +};
> +
>  /**
>   * struct iommu_veventq_alloc - ioctl(IOMMU_VEVENTQ_ALLOC)
>   * @size: sizeof(struct iommu_veventq_alloc)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index 88e2b6506b3a..d8830b526601 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -292,6 +292,20 @@ static inline int vcmdq_write_config(struct tegra241_vcmdq *vcmdq, u32 regval)
>  
>  /* ISR Functions */
>  
> +static void tegra241_vintf_user_handle_error(struct tegra241_vintf *vintf)
> +{
> +	struct iommufd_viommu *viommu = &vintf->vsmmu.core;
> +	struct iommu_vevent_tegra241_cmdqv vevent_data;
> +	int i;
> +
> +	for (i = 0; i < LVCMDQ_ERR_MAP_NUM_64; i++)
> +		vevent_data.lvcmdq_err_map[i] =
> +			readq_relaxed(REG_VINTF(vintf, LVCMDQ_ERR_MAP_64(i)));
> +
> +	iommufd_viommu_report_event(viommu, IOMMU_VEVENTQ_TYPE_TEGRA241_CMDQV,
> +				    &vevent_data, sizeof(vevent_data));
> +}
> +
>  static void tegra241_vintf0_handle_error(struct tegra241_vintf *vintf)
>  {
>  	int i;
> @@ -337,6 +351,14 @@ static irqreturn_t tegra241_cmdqv_isr(int irq, void *devid)
>  		vintf_map &= ~BIT_ULL(0);
>  	}
>  
> +	/* Handle other user VINTFs and their LVCMDQs */
> +	while (vintf_map) {
> +		unsigned long idx = __ffs64(vintf_map);
> +
> +		tegra241_vintf_user_handle_error(cmdqv->vintfs[idx]);
> +		vintf_map &= ~BIT_ULL(idx);
> +	}
> +
>  	return IRQ_HANDLED;
>  }
>  
> -- 
> 2.43.0
> 

