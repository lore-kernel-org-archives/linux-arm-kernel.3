Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C383C3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=; b=YPh2g8+hfdqZG5CmiDZ/K4WFlN
	DiOjCVdaNerjdrDKJMv5vMLMwwpCqsC362oDanRP2cqA1Trv/+b4cxVfDZKnviPp/y3uJKrCCx3O2
	ggRLxkkGrK5xgb55KkyZNuukZ7TboVmpWDbV/v0klGadj0TeTIEtVTT6KCmUitK+PqFoFBpRCSgSo
	flgJ+hz2Rkh5qveL5HRu1Bt/ErJ+dVV1Fmf1dXmjq3AQrOH8ih3FuCRgktyS/VY7ZQNjGmibkYRdU
	vUXejFmGpLoJiasB3cajzCTR7ji9SLNm42FvgUd5PcASIX8KrkVGjbWoFzAEr4zAgsp8It4k/OSG5
	lwGEGRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Uf5-00000007PAh-1ofw;
	Mon, 28 Apr 2025 20:01:07 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Tem-00000007HCc-1908
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 18:56:45 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2240aad70f2so35095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745866603; x=1746471403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=;
        b=0O67zFFYp/n0llxWo4mM3QszQAGJDxAY0lwr8sAlmtpnLeRAMtkDk93PMpWPdpQlv+
         EHAcdd+ldO1O8+P7UK5ehpQt0F0jNwcnLNH6e58HDLdcihxwaln2rEKy1WxGwpNhFO9h
         yoCeD1FURPPYgMOCUbA9F+Btvfk+aRcRiqIPr/jTBsBsnnvYs2ri5Xa/KcnjNDtTelOM
         22lz+TSio3REFMpLxKfBjVXuHtC87V16/6bAWohmlG1YoR7E2c2T8G5cPDtgLFbksgkC
         iJaxNJk5mXzQm0SfgbAHfaELDCAgtz0a/ptH+4d/2dfR1JtMXAYS//2UNUfqxNSh2OC2
         Kc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745866603; x=1746471403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUeOpwsZ3bAk2qBL8+dBV7f0gHVviZTQa3DepiItlZA=;
        b=NxpPxcVRQOWqoYMmZ2D7vlHIb03yy0zWTBYe6BrLv/hI78GGLy7x3zQbWuH1M+XI6V
         s+Jicj5my86WYlPuefasxV578K2rkm233aqmPZZsx3c/9wroJraUGuluKkt37EsCf4RB
         FwETWUb/wPyHMi9eF/zanDtsi4Kj9BVjrnI3E8cqfQY3WX4Os8F8OwYpaCOu+lCBMzYj
         PuqBMeICZg3CRZUgivP+d/WFGoBNzDRMHhrsI3v3YbXH1XsOUj/iM4i9Em87TXTN4SOy
         AAlHhYU6mM5a6gOMbZWDMT7xLhokFxIpcQoJrZl4uhOpp8vSFdyfip/PkHYoFC3d2tfN
         984A==
X-Forwarded-Encrypted: i=1; AJvYcCURtHxRnn2rM0x+/I4OB4d8aBCYSRgHMtcUqDVRXK8y8Xozd5OdmxaAmAWvhJ8QFbBTIAQTAkJTLI55l7sozTjc@lists.infradead.org
X-Gm-Message-State: AOJu0YwPPNvCUhDexnG8ztBsjmtvPUzOji8VndlD7ltkb8Z+w2YKeIIO
	lmfndzvWWMoCzL0aWbtLlGyProt2wSfABaUNoX8Ljn11FNeoQ51hcozsiaMBlQ==
X-Gm-Gg: ASbGnctqkeKAHQ19LT27tWQYYpaVMJcE6dNPihPaLj60EFa9g7dY/DwxcgB4sAMPK/e
	a/Sc2vRO4MAAdfdqcNn6n76rgIr49xIGcV/X+q9PP1PuMt6ur28VmyNuz7QBjMToz+VrQnvomjf
	mEWrI4vzraaYrDGnijd5SGJt1KEsADnblj5wjx5jVde5d4roMc6Vj+yJj+3yylD60cuGnpAFhKM
	yIi/x++PAo7zUF26IJHMKwdY0Er87sKMyw+y/029RaYMW/iqtbC0qbgGBLj5qSrP0jbttql/G/E
	cCmg2ppNaZYaPYM5Jke43UgHL5v0FvOetwn+qjMnvo07mrm5PF+R90c596GEMRSRD2Mnvlfm
X-Google-Smtp-Source: AGHT+IEn9NdqisiZUEFudVyDLIBAx0JrxSAXK9s59PU8BubuekqQOaQAsWfs78yrsnFIaEMxYjdNjg==
X-Received: by 2002:a17:903:2447:b0:223:5182:6246 with SMTP id d9443c01a7336-22de6ecc0acmr313105ad.23.1745866602737;
        Mon, 28 Apr 2025 11:56:42 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm86915695ad.76.2025.04.28.11.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:56:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:56:31 +0000
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
Subject: Re: [PATCH v2 06/22] iommufd/selftest: Support user_data in
 mock_viommu_alloc
Message-ID: <aA_PX5k_haI3RwoN@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <786cd49df9fb437790b7dba53165e4316747913b.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <786cd49df9fb437790b7dba53165e4316747913b.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_115644_304326_CDB55BD5 
X-CRM114-Status: GOOD (  20.69  )
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

On Fri, Apr 25, 2025 at 10:58:01PM -0700, Nicolin Chen wrote:
> Add a simple user_data for an input-to-output loopback test.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_test.h | 13 +++++++++++++
>  drivers/iommu/iommufd/selftest.c     | 19 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_test.h b/drivers/iommu/iommufd/iommufd_test.h
> index 1cd7e8394129..fbf9ecb35a13 100644
> --- a/drivers/iommu/iommufd/iommufd_test.h
> +++ b/drivers/iommu/iommufd/iommufd_test.h
> @@ -227,6 +227,19 @@ struct iommu_hwpt_invalidate_selftest {
>  
>  #define IOMMU_VIOMMU_TYPE_SELFTEST 0xdeadbeef
>  
> +/**
> + * struct iommu_viommu_selftest - vIOMMU data for Mock driver
> + *                                (IOMMU_VIOMMU_TYPE_SELFTEST)
> + * @in_data: Input random data from user space
> + * @out_data: Output data (matching @in_data) to user space
> + *
> + * Simply set @out_data=@in_data for a loopback test
> + */
> +struct iommu_viommu_selftest {
> +	__u32 in_data;
> +	__u32 out_data;
> +};
> +
>  /* Should not be equal to any defined value in enum iommu_viommu_invalidate_data_type */
>  #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST 0xdeadbeef
>  #define IOMMU_VIOMMU_INVALIDATE_DATA_SELFTEST_INVALID 0xdadbeef
> diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> index 8b8ba4fb91cd..b04bd2fbc53d 100644
> --- a/drivers/iommu/iommufd/selftest.c
> +++ b/drivers/iommu/iommufd/selftest.c
> @@ -740,16 +740,35 @@ mock_viommu_alloc(struct device *dev, struct iommu_domain *domain,
>  {
>  	struct mock_iommu_device *mock_iommu =
>  		iommu_get_iommu_dev(dev, struct mock_iommu_device, iommu_dev);
> +	struct iommu_viommu_selftest data;
>  	struct mock_viommu *mock_viommu;
> +	int rc;
>  
>  	if (viommu_type != IOMMU_VIOMMU_TYPE_SELFTEST)
>  		return ERR_PTR(-EOPNOTSUPP);
>  
> +	if (user_data) {
> +		rc = iommu_copy_struct_from_user(
> +			&data, user_data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
> +		if (rc)
> +			return ERR_PTR(rc);
> +	}
> +
>  	mock_viommu = iommufd_viommu_alloc(ictx, struct mock_viommu, core,
>  					   &mock_viommu_ops);
>  	if (IS_ERR(mock_viommu))
>  		return ERR_CAST(mock_viommu);
>  
> +	if (user_data) {
> +		data.out_data = data.in_data;
> +		rc = iommu_copy_struct_to_user(
> +			user_data, &data, IOMMU_VIOMMU_TYPE_SELFTEST, out_data);
> +		if (rc) {
> +			iommufd_struct_destroy(ictx, mock_viommu, core);
> +			return ERR_PTR(rc);
> +		}
> +	}
> +
>  	refcount_inc(&mock_iommu->users);
>  	return &mock_viommu->core;
>  }

Builds fine for me.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

