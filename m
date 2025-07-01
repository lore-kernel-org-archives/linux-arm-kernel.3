Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D328C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7vYU5IpUGkedTKGsOw7fqDjAvdD4uWcycZwbigztzQ=; b=NuudhEz40QpZrv1LVfbS4iUTkE
	HrSXLxdpogBKy7UvuA6FCptgPiOthlDGzYDSKueVopXBOXeaK5w14JjDL7fyWhoPJpzz94Zrr/9u8
	y5VepAu24IrCVb3VExJdhyKDzgrWhg00FQrNI80YoBZ3xvIx0oOPDr2tCzDKuYLY6eS63ru8UzwEi
	kvpo6rdZFzNfZmCN0mdgJaaLwKHrkgolelDZfpolj7ZcGUUQvNnBz1XzORJdn0dDAWvqAta7WMZQU
	nZZynwlu5V2Wql65VldjnDYTEolR5pkvRe+R9c1kuAzYmqfX4z7/xxrjGK0W0bB/I3UIqPmK9XJaD
	jPs8pz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbMY-00000005Ze2-1uFf;
	Tue, 01 Jul 2025 13:49:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa2D-00000005EDd-0Vj4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:24:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235e389599fso205285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751372663; x=1751977463; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7vYU5IpUGkedTKGsOw7fqDjAvdD4uWcycZwbigztzQ=;
        b=iE+tSJVznf0TBtqQjt0dxsWwGzhSrnALuNG0l1/pn6g9zk2ZrQtn+61Ps3ha+jR8oT
         pKF44ktLJB+m/MqrnQRz0UnBNcqTLGFxkFwLbMaB1IE1a6XPjVj5jpgkQrK83EVNCZsp
         FubGf+qS0f5nfr+ulMNG3d4qa9V4j3tQcn+4mbyCGnF0mqxpg3ptDx45Mv/RFMz2lYc5
         +pgqYj6BGfTT2xmcpTHjUFfnJoKKJ1ALXyClLF3G0idwE0eoyMV0jW3/Zz8Di7+M3lJL
         58k9r3JY/58GFdrzh04oxc0DHT4ef4ar5lCqsXbyoFDfdnTqMiocKblBGFPX1QepnTgK
         cs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372663; x=1751977463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7vYU5IpUGkedTKGsOw7fqDjAvdD4uWcycZwbigztzQ=;
        b=XfWqeoi2X2QXXpgCAyHkRHB6ADTYIjNhr7C/blVC+LnVPuHguPaAFV3t6dO1AX8I9G
         DC699WUDZ/9XZXsnmme9MVwBcMT165J5w9DfXMh2B8qBNI+zjD3Jh/DPuKNx0TH6MZFZ
         F/o3oodhwnlw2bA7W/VPlBad2x5TprxDlyOPLkk0vO/7xs316BPOWMNm+ud7lkFJ2b38
         krA55FJkAE1m49t4cI9FQll4CcdRB/IvOu7cql6b2TYsqfXGHeBDDgmV1/loZHwfWzfV
         c5/X7VUZ0xhdWA4EyV3u68+F8zMof8JVHc/TH8J8AyifqMKeQDUbVjbAP/wtty5er5gx
         TcMA==
X-Forwarded-Encrypted: i=1; AJvYcCXGGB+B6Ynui9NXCKNSIxGBRWRfzda6UNwuVE+pxP260TEzT+o3ZOEHX0VT0rZAU4Tfk4x2k0BN3IAk8jadxb0d@lists.infradead.org
X-Gm-Message-State: AOJu0YwUG1psMCbIORelOFXj3aon4ZTNMECFZ5PSTDMzTCRu0bluhBxY
	8cezsDdn76T5NMiD1qGfqcCGkLg5f6NcYWDeWoLhLLEKDBWFmRalADDKFwYu57A4gg==
X-Gm-Gg: ASbGncvbTB+vWqne8/0RKZLfa24mShTAmyx9e+1hjbVk/ezBKkM6ODE28Gdg1TSPXji
	WrPmO2rdpAb/QCuamtO4kTU677mOxDu8jZDbx6JM/jOTE0r5kQP5Ygulj1jUrOXuXIQ5WcOwazN
	nhJqqKAJwpHGEt6br2XsA7RfKOI+UZrTE10uCE+Lf79LSNsRfiXkbgGG7Rz74kCRPPXq3byEt8r
	V+5nX3McBQsexlQyfcfRSVnkzcRkRJ4rWvk4ZRNUg6m/9rqH5E2sRQYb8oHx3vgeyfg8v4m64dc
	b/pNWvw0OtAWItzqLCPTr32gos492yMg24NIKHfHkJliLHp1BGN7maSxsv8HnL3fTEU2gcLnPXb
	t1IqLv8Hhq2fpKwD1MG1S
X-Google-Smtp-Source: AGHT+IH4JQ2MdaL4TQHuSEKzEVU+2Jy2z1P1pCYvzTGLNdSVTsldrYDv/hBtBO4QCMRhsGfAvLyPYg==
X-Received: by 2002:a17:902:e54e:b0:235:e1e4:efc4 with SMTP id d9443c01a7336-23c60105131mr2451315ad.14.1751372662789;
        Tue, 01 Jul 2025 05:24:22 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5437b40sm15776317a91.37.2025.07.01.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:24:21 -0700 (PDT)
Date: Tue, 1 Jul 2025 12:24:07 +0000
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
Subject: Re: [PATCH v7 23/28] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aGPTZ3uHRIIRMF4c@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <205f234c05d6b09de52124a72a6978b74d832cfb.1750966133.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <205f234c05d6b09de52124a72a6978b74d832cfb.1750966133.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_052425_165948_89FCBFC5 
X-CRM114-Status: GOOD (  21.59  )
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

On Thu, Jun 26, 2025 at 12:34:54PM -0700, Nicolin Chen wrote:
> This will be used by Tegra241 CMDQV implementation to report a non-default
> HW info data.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h         | 7 +++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 8 ++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 07589350b2a1..836d5556008e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -721,6 +721,13 @@ struct arm_smmu_impl_ops {
>  	int (*init_structures)(struct arm_smmu_device *smmu);
>  	struct arm_smmu_cmdq *(*get_secondary_cmdq)(
>  		struct arm_smmu_device *smmu, struct arm_smmu_cmdq_ent *ent);
> +	/*
> +	 * An implementation should define its own type other than the default
> +	 * IOMMU_HW_INFO_TYPE_ARM_SMMUV3. And it must validate the input @type
> +	 * to return its own structure.
> +	 */
> +	void *(*hw_info)(struct arm_smmu_device *smmu, u32 *length,
> +			 enum iommu_hw_info_type *type);

Thanks for adding the comment, this looks good.

>  	const size_t vsmmu_size;
>  	const enum iommu_viommu_type vsmmu_type;
>  	int (*vsmmu_init)(struct arm_vsmmu *vsmmu,
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> index 2ab1c6cf4aac..1cf9646e776f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
> @@ -11,13 +11,17 @@ void *arm_smmu_hw_info(struct device *dev, u32 *length,
>  		       enum iommu_hw_info_type *type)
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
>  
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
>  	if (!info)

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

