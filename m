Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ADDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09J0YSNlS/RD38iZ7EgK8rqCHnRR998neTro1uy3CQ8=; b=Z+DQ4lvLyOTbwVyxvlCayoPqKA
	uVTRpu/O9MrpqxBedScGBBzGmPolqmvDLY9jrrPORHu5my+JXBxazoEM2ST4oS23UPcOLr9utxYhD
	6OzqOIx09V1AW8qGh49K/hMA3RkyQ6xyGhIhjrulVuhJwXNPzHEg2K7sZlYhf/GYuERh7VDnQtLA3
	erJTDFihM7uirqXburb7D03XdF0+HiF2a9+QRCq+DTASo7j6isOhzKi2bRJeAeXUmeNa3gXKV5qAy
	cttHJj0eZasdPMKyKMLIKv/uidkrt6wdsZVMLkdbC8tLoRWD9iB/YABUOYR9Dfhb4lcvFv6/dz4XM
	g/R/8+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHSj-0000000DTRZ-0zJB;
	Thu, 19 Jun 2025 15:46:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDk0-0000000CwJL-2dax
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:47:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2348ac8e0b4so125805ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 04:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750333656; x=1750938456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09J0YSNlS/RD38iZ7EgK8rqCHnRR998neTro1uy3CQ8=;
        b=S5MRL72BhlJKv6jxzbZpaLDYgowifHN6Z5Q9CbMDJpissI2ZrXEMzZAS98YZgk2eqY
         nbYyx8BsDd+udlfMEY+5NA1+zoWKMYVyOpO3ktAwJ8/0mSfLC86r2LTVCbAP6Px/LkMZ
         yKDF3KE+sTEVdqLeeLsjaiusils7TIJqO7r3wxGwEBMw/ro1GYPtqlruYBSXBUSn7eF7
         nZDMA0XyUIW/HY+qDI5nwf2ZPr3uxB6J+Z7uh5nxH35DvNbHM2hs81GNLemyQE4XUBF6
         2MfLXVsugviOjtCPTDuY+PKLQKOGLWvegngGfS+/qKE7hbq09pXAGzZ7gWI16nwwa/am
         hQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333656; x=1750938456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09J0YSNlS/RD38iZ7EgK8rqCHnRR998neTro1uy3CQ8=;
        b=iWWZoJR0+EB4RVKXtwmN/OCreW7ZCa21SQTDSEdz47sZ59rw1kksNzrTlWdKMJ0rqU
         CV085knKbuxz7+wzfTyzhc2xnTdLZr0v30r6uYcALt3689Oh3NIQ/sHgQHADzulmq/5D
         wkWOVR2yukORfrZpnuyrdzmUgFKVThFNvyV3cBULMaZ3KVkuP8/2DgKpglnidblht5JR
         KwVO9QZ/SEMPXrZWzIzRW/79T7xj6VBaI8Tv2Yzoc941xKK481rC0zHnBLUEg22wjqTa
         l3ywmLlOHzU3yuZzceCLNfhICjEjXSjk2Ty+2j9yxsynMmPRY1nCOZdgQ3vjGEa3hzr5
         KOfg==
X-Forwarded-Encrypted: i=1; AJvYcCVrvtiNatTaf68W5+iBFsdpnV4b36May0iAvC3uW9WUgSlPB4/Ky47RMsm+jD18GqKfU6lJJaNHq/kg+8l84Dgv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz94kax/R0vD+T5Q2bAn9gKG1nbWqMSPSF25wvuShRo0xlA4LLz
	GbOIUJTBhawQfebAi61HFA2bbo7rnDc6cvvRuqNFD78w0C0ucRo4kmJB/LsbPTEM+w==
X-Gm-Gg: ASbGncsGeYf/pcGOmspq62NbUFANUqag75g3b9iY9Hh6f04oVh6xiFlDM+DXTEUdOaa
	KRqumSzkNZog1oeUeSi+GeImfE7TIV3/wkwYr2kOruCFZrrOT7E43DzyrtLH/S4rT7eE+X9Fjbw
	j8zPoAus0PJzIqXsmoQ4/VQTkhc7aFeLwYDcEZJopHyi1I5/qqxMQKUUJB7wRMEWypX/+Ub4aEY
	OJ8Ryasbeyn9bU/FNkvW1Zcwh9ug9ZBpTYFT0RfM+tngzYWBA3af8V5UICLXah4C9wSbHZ9NHEj
	rTz5tjNQctFU8WkQPJ7YM/xZUr7P9rhmfCZKEPG8NQ7tNIXnUjgyWPNR0wHWBmDpxmEitN5QD5T
	TjxlqRMgutNakc4ydFvfzb+LQ20LpP0M=
X-Google-Smtp-Source: AGHT+IGbvEiTa5QOLk5NW8yLzYkB32wsjmC6sfvRD4CcA87KLToKCvr4HcCmPmyYeXbSKEiK4HR2MA==
X-Received: by 2002:a17:903:2b03:b0:215:42a3:e844 with SMTP id d9443c01a7336-237ce0478f4mr2445465ad.17.1750333655627;
        Thu, 19 Jun 2025 04:47:35 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23c0c5sm1932766a91.13.2025.06.19.04.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:47:35 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:47:24 +0000
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
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFP4zHIVT6epJeLb@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_044736_688629_381B778E 
X-CRM114-Status: GOOD (  22.45  )
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

On Sat, Jun 14, 2025 at 12:14:45AM -0700, Nicolin Chen wrote:
> This will be used by Tegra241 CMDQV implementation to report a non-default
> HW info data.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 07589350b2a1..c408a035e65d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -721,6 +721,7 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length, u32 *type);
>  	const size_t vsmmu_size;
>  	const enum iommu_viommu_type vsmmu_type;
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 445365ae19e0..1c138aff73d1 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -10,13 +10,17 @@
>  void *arm_smmu_hw_info(struct device *dev, u32 *length, u32 *type)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> +	const struct arm_smmu_impl_ops *impl_ops = master->smmu->impl_ops;
>  	struct iommu_hw_info_arm_smmuv3 *info;
>  	u32 __iomem *base_idr;
>  	unsigned int i;
>  
>  	if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
> -	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3)
> -		return ERR_PTR(-EOPNOTSUPP);
> +	    *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3) {
> +		if (!impl_ops || !impl_ops->hw_info)
> +			return ERR_PTR(-EOPNOTSUPP);
> +		return impl_ops->hw_info(master->smmu, length, type);
> +	}

I'm not sure if I get this right.. if the user (while porting a VMM or
something) mistakenly passes *type == IOMMU_HW_INFO_TYPE_INTEL_VTD here,
they'll get impl-specific info? I agree in that case the impl-specific
driver needs to check the type, but shouldn't we simply return from here
itself if the type isn't arm-smmu-v3?

>  
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info)
> -- 
> 2.43.0
> 

