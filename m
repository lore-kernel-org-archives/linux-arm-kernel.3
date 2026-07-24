Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17F5C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzVdoK4UkN4wvU8WsKv82P8uCjeb8Sfe3uyjAreWqHc=; b=3hNvgPNR2ddmDEoKQvG1vsXShh
	1RysQwoH0f4G9g5jDP2XN86KnpC77SM9RkZN/cGkphtilrUxblMwtcQe9N3G1FpZqpGBvVY19nlYr
	5xcM+cGnJV98/IwAp3j8n0hPtZKO45lakYhifRGNXOoH4Z/XEgo7imMhIBBcT7lmuXVMR9V61zc9N
	DFqAGH5PmOGaxocEUxcYnfr/33xj8jIEr/o03LTK3bMvrs3oTG+RhyrW4IS674dxfogM2N2xrc1gL
	t+llBDJsKmxhb73zX0jIhemVZ4EeVUEq4o0VjMq1kgkzfKQjVhNr3Mp9G6HexVjPPwZHIuUMUPZSV
	ZSSx/ULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLXG-0000000H9xQ-0lNg;
	Fri, 24 Jul 2026 19:26:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLXD-0000000H9wF-1ERS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:26:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-495509b08ebso275e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784921173; x=1785525973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MzVdoK4UkN4wvU8WsKv82P8uCjeb8Sfe3uyjAreWqHc=;
        b=TprH29B43crAHcZXokl4YXRh62hMQcMj2m+/tZDkrvJmc3tnAvibBharA0uMTVHNam
         DYEJjUEULogRxQxiaHy1opJJZdebfW3T1RcJK2VF4RUIVw7/zCkYU6zKr2kRWTmijYFv
         K8hQfZlw/mxqbVT9HEbQm9q9oqqtOpgkaW/iFm3VIBZMNu723OWIXYL1oap3uTJQwGKG
         jDaehjbNiROfegb6ucuNUwyK5CQIoIXAgAksR69atK4eYOubx/XgJqfMTIzLbMVAWt+I
         uLegEwQNqGnj5LEb6bgYxfT2kH1U8bjSHTGiX413coC2wXpQ74Wx24PPGSo239/tGyyl
         pbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921173; x=1785525973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MzVdoK4UkN4wvU8WsKv82P8uCjeb8Sfe3uyjAreWqHc=;
        b=ML5zZ1rNe/YTn1Wu91MPGTb77QQnkyR5BTh+SHWJkrB1qYhRA1FD9BReZOHQR3NesV
         NQhHOzSKZQkEtcfAx5RhboM/IxVz9fwbJBwcrlGuXG0cmzD2WTgIZriAkmzmKpZcoWtj
         BmhBW/ZLFlRJZ7FwxauPKTfUDsaSvFBQm+EASM2NjxY1r37jXaZ5HZDC9OLVOTyHLueX
         OGMRpEBpivu9ecMdCaH3FnxhfKly7ur5PPaAwVBWOSUqYJ4MWhNW04zxZ+YHGH1B8ijS
         bjcCyhr7QkL0pRpKhYmSrPE09fq2UmYAnm7MaHEWKmPEIKmDuiF5PGUlpnU2gLdvYza7
         Yfng==
X-Forwarded-Encrypted: i=1; AHgh+RqHfj3gthnaPQmfPKrfwW8oyC+6SkhVECP4MJmxuQL7XK/Eo0nBhx97hSfE9XQwDova4sFfaGy4ypEcVZjNvvPl@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXc+jVgST9YPf/6Cjim8Gf9oaX6wmPxWKvCPBnk+1UIHWjap9
	PXQG7laNxnTWVx6dmtX4xZfd9o6Tz0D3Vdswu/ZeQfD3bjVPflr67xM/qmG2/CggVg==
X-Gm-Gg: AR+sD12+BICROBMwPDCZnhZm/iUXB3OppSzTtxNcyIyzwadWTXkxhQRSY/Ht6n6VmtZ
	yUtQmptUF2kAn5FF+YlK1HgIQdWkzfqyFdhE3OaeU8RWiVmhAZ1Q1al89I1RWYEMzCa1h8knV3P
	nbW5gQe8QiZNmb15eOUPutveAKXkwKGHk5E9tQto8pL2XPEFxajBqdHYFu1dYEP2LxrDfczrZuX
	nHdE3SGuB0zg6Kd1oCXdtuJ4WsCcI3U8ZGs7+/UK8gXncu2QWiZ5HHseP59uybCx3zSYbxeKGMm
	EA3B1665AwdakJtsZ9XSQHfs1RgZOI3vNSZ4ltMHkDsumqQoi4UhKG63yrrghkmmNNtMuq5Os0/
	sKynh+F2V0VQ5A9BW4Xw+D0KxNmYq0BkbfQOGj3w6mvuZlGT42bmY2a4ZAwnW+5uiPLYhPcBFY3
	UIsPj6VaVWqTUluzhRvYdhIMGwUcJYakQrWoeCtg==
X-Received: by 2002:a05:600c:4583:b0:493:aca0:32e2 with SMTP id 5b1f17b1804b1-496b4cf6c36mr246435e9.4.1784921172928;
        Fri, 24 Jul 2026 12:26:12 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed5f93sm11566705e9.1.2026.07.24.12.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:26:12 -0700 (PDT)
Date: Fri, 24 Jul 2026 19:26:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 4/7] iommu/arm-smmu-v3: Remove io-pgtable-arm from sva.c
Message-ID: <amO8UPHuxrvoiXq7@google.com>
References: <0-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
 <4-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v1-807e2d1a5efb+e1-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_122615_349202_83EA9FB3 
X-CRM114-Status: GOOD (  17.83  )
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

On Mon, Jul 06, 2026 at 01:29:10PM -0300, Jason Gunthorpe wrote:
> This is only being used to get some STE constants. Put local
> constants along side the register definitions instead.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 13 ++++++-------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     |  7 +++++++
>  2 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index 0e670c92469b2f..f82a513ede09c9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -11,7 +11,6 @@
>  #include <kunit/visibility.h>
>  
>  #include "arm-smmu-v3.h"
> -#include "../../io-pgtable-arm.h"
>  
>  static void __maybe_unused
>  arm_smmu_update_s1_domain_cd_entry(struct arm_smmu_domain *smmu_domain)
> @@ -41,10 +40,10 @@ static u64 page_size_to_cd(void)
>  	static_assert(PAGE_SIZE == SZ_4K || PAGE_SIZE == SZ_16K ||
>  		      PAGE_SIZE == SZ_64K);
>  	if (PAGE_SIZE == SZ_64K)
> -		return ARM_LPAE_TCR_TG0_64K;
> +		return ARM_SMMU_TCR_TG0_64K;
>  	if (PAGE_SIZE == SZ_16K)
> -		return ARM_LPAE_TCR_TG0_16K;
> -	return ARM_LPAE_TCR_TG0_4K;
> +		return ARM_SMMU_TCR_TG0_16K;
> +	return ARM_SMMU_TCR_TG0_4K;
>  }
>  
>  VISIBLE_IF_KUNIT
> @@ -85,10 +84,10 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
>  				   64ULL - vabits_actual) |
>  			FIELD_PREP(CTXDESC_CD_0_TCR_TG0, page_size_to_cd()) |
>  			FIELD_PREP(CTXDESC_CD_0_TCR_IRGN0,
> -				   ARM_LPAE_TCR_RGN_WBWA) |
> +				   ARM_SMMU_TCR_RGN_WBWA) |
>  			FIELD_PREP(CTXDESC_CD_0_TCR_ORGN0,
> -				   ARM_LPAE_TCR_RGN_WBWA) |
> -			FIELD_PREP(CTXDESC_CD_0_TCR_SH0, ARM_LPAE_TCR_SH_IS));
> +				   ARM_SMMU_TCR_RGN_WBWA) |
> +			FIELD_PREP(CTXDESC_CD_0_TCR_SH0, ARM_SMMU_TCR_SH_IS));
>  
>  		target->data[1] = cpu_to_le64(virt_to_phys(mm->pgd) &
>  					      CTXDESC_CD_1_TTB0_MASK);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 95186cf84e9abb..99ca96db0d0401 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -203,6 +203,13 @@ struct arm_vsmmu;
>  #define Q_MAX_SZ_SHIFT			(PAGE_SHIFT + MAX_PAGE_ORDER)
>  #endif
>  
> +/* Constants used for CD TCR and STE VTCR fields */
> +#define ARM_SMMU_TCR_TG0_4K	0
> +#define ARM_SMMU_TCR_TG0_64K	1
> +#define ARM_SMMU_TCR_TG0_16K	2
> +#define ARM_SMMU_TCR_RGN_WBWA	1
> +#define ARM_SMMU_TCR_SH_IS	3

Can the driver use the ones in generic_pt/armv.h instead of
re-defining them?

Thanks,
Mostafa

> +
>  /*
>   * Stream table.
>   *
> -- 
> 2.43.0
> 

