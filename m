Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A69CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ban7nhZo4CJqKpPDdVZLRncSMRaeOxomE1+tyNWWrJM=; b=FpkU57eD7E7sKA7NmrcCtTRjM2
	qYLrXZ9gMOYtb/O5vkiG1ZUNt03n8pjue16KQVWsa2ZovcD3TKQApoRAgyKPRRoA1kNmdvcr8YmmF
	SnfIF7NTYidBkJy0KBsWAHvaEeTR/aWDW5/4QUEuID6PeiFOFlrVi9l46luH3G2cILPpPkjn7PlPC
	bee2eAQZF6BaI01RDanv2uF16vZE1IWbZjPm3AsmOIBLJY+GOKWx2oxBiHMpVP4HfKBYDROFTixKq
	H43APInPYy624jyaDbxBQtZuVGWIv6uGT5rBjJXlPFPnpd0gkMKnEfMtDJuBjBoTzGD3+t5jiJYYT
	0s9f0GLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEnM-000000016nq-46uI;
	Mon, 28 Sep 2026 17:05:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBEnL-000000016nH-0zqz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:05:40 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d8facae850so1945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790615138; x=1791219938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ban7nhZo4CJqKpPDdVZLRncSMRaeOxomE1+tyNWWrJM=;
        b=OV1H9zuRmT+LwEa6oDYxa8W1jVVQBkkpq1aXyaRFmdkrn/3tC5bcfoY9T0ghFgZ4Rs
         pv8ZGgV53+VjlNfFZ0Dtw3mG6JYNPBy0ZKbTY2xHqAQc0vRMlExt3IHxz6q2lw/2HNI/
         60hVF+Tab6CTjTxrhHsispwEZjw18mssK5HsNmTNKcs3bXCoUlRiTymPhssgw9GqH91D
         VETiOS1SXU8uGiD0mqw9RVVN5uArkbg8voIiIWP6ekfKHfoh+lKio+uXYxAcIGpnTTq6
         2cEZxijkATWuKfSnVAOrPrAB52WxdjgN6PnaEgcqATy0xn1Mc6Vh4nMNE4M3074VdHTf
         ZQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615138; x=1791219938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ban7nhZo4CJqKpPDdVZLRncSMRaeOxomE1+tyNWWrJM=;
        b=qP/gjDHKzzETGmWtUQ+sWu2+G+aho+vpxmwvKRAwZ3tZU2ajvXeFwCoDB9Tzu/Pete
         r1LDGa2K21HOH2L+QH8CBnXZwS7JN/eYoV+Vu7/V1pdtHC5JcSgsm29OR/vkEmZI2J8U
         zn+uLRtl0QMqAfEC/t2yVBL6fnSL10J1QHUXC4qIKmrBp9uQDNEXguozHCoCam7iyws4
         SFiRSHrr02h2B52LtENqsC3Cy4WJVb9/M+liI3ZZfKUVsc0DbHNfalObZNN4PYrDgCar
         L8gSBUhi0n0LCUFWZAIEIEnbMG4rkTmeY50GmWvsz/NXu+eNZG4NqpFwWz5K623a9EjZ
         Pphg==
X-Forwarded-Encrypted: i=1; AKwUvBxEaKPg+/SWNVcqIhqEol2uTIoJ/ngS+uneW7ukA6Fu5nKBj21j4puoFfRR+LD8DD6wWAl1aPn78ebY9Z7meTN4@lists.infradead.org
X-Gm-Message-State: AFq9FYJQsKexkWghSj8HRE5FzDjAhq3aPtvNK+cPv+z3hsT11pG/e0wk
	ogtwWp+RXNb7wUydZD9rqrDSjI9TV92N2cWF8ARj/+xcUw+jOwi/NJnk90Tt3WmrRA==
X-Gm-Gg: AYBFou3s6K938J5/FIJsEeZ6Ey26PCsWqZo9xBtmb8ndBTa6wZ6zjtJshdGfya+3VW0
	A4YjvLUrI/Zhgq1bZ8B4zsCUM3mQZ8V9t4muL/sSKlIUlGljAFqKnAmWtdWDNrnAFmpcOBpnOND
	vRbXwlJeeuVYUtSnQXukfnVa5xdEHOhEGMo3E+Wg79h6DRjyLdwdDLk//jYd5aN6JWQjDxOgmks
	NHiCZCp4J9alwgi6BUGa4djI2+D3vIe2ar7csyhBKtugSFo78cVogM8pG1f6JUHTK4txESFQA5s
	kdddyAC2aC5Vvd8f++duHPB8irTkRQ8JPUi1UKjeTsdMbf1K4yYZYWmZeGwEYbemdWEmYWIlgS3
	FJbGo2TV9Qn1aXxuOT+YMpLXP9u+GIru6sDcFbaPPKJtHPKsYsxT6VvCQR6lCHoakEo+AmSLKWu
	bJrp3YwfXFlqW5NrQMPzD1eTEA6iy6KGr0tfSZRzE/mXQ3FxxCvpfFleFrkUwCvPmjDbz7mhGh0
	pBx2+v/nwZz35jqiPPYPq0VRwSnUGBHrKJZ
X-Received: by 2002:a17:903:1aa3:b0:2d5:db38:800f with SMTP id d9443c01a7336-2dfa6227507mr8287085ad.14.1790615137568;
        Mon, 28 Sep 2026 10:05:37 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142b00dsm45359075ad.49.2026.09.28.10.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:05:37 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:05:29 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v7 7/9] iommu/arm-smmu-v3: Populate the tlbi at the top
 of the call chain
Message-ID: <arqeWXL1jhz9R9-j@google.com>
References: <0-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
 <7-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v7-e84261bbe7cd+2ea80b-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_100539_289517_9202D2FE 
X-CRM114-Status: GOOD (  23.04  )
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

On Mon, Sep 21, 2026 at 08:55:15PM -0300, Jason Gunthorpe wrote:
> Each of these have their own unique situation, populate the tlbi right at
> the top and pass it into arm_smmu_domain_inv_range(). They will diverge
> further when the iommupt invalidation scheme is introduced.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 21 ++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 54 ++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 15 ++++--
>  3 files changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index 2f76f649dcf1a5..faeec656da9e7f 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -140,16 +140,19 @@ static void arm_smmu_mm_arch_invalidate_secondary_tlbs(struct mmu_notifier *mn,
>  {
>  	struct arm_smmu_domain *smmu_domain =
>  		container_of(mn, struct arm_smmu_domain, mmu_notifier);
> -	size_t size;
> +	struct arm_smmu_tlbi tlbi = {
> +		.tgsz_lg2 = smmu_domain->tgsz_lg2,
> +		.iova = start,
> +		/*
> +		 * The mm_types defines vm_end as the first byte after the end
> +		 * address, different from IOMMU subsystem using the last
> +		 * address of an address range.
> +		 */
> +		.size = end - start,
> +		.iopte_size = PAGE_SIZE,
> +	};
>  
> -	/*
> -	 * The mm_types defines vm_end as the first byte after the end address,
> -	 * different from IOMMU subsystem using the last address of an address
> -	 * range. So do a simple translation here by calculating size correctly.
> -	 */
> -	size = end - start;
> -
> -	arm_smmu_domain_inv_range(smmu_domain, start, size, PAGE_SIZE, false);
> +	arm_smmu_domain_tlbi(&tlbi, smmu_domain);
>  }
>  
>  static void arm_smmu_mm_release(struct mmu_notifier *mn, struct mm_struct *mm)
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b7c9cd074924e4..4062ef2e13fe30 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2801,25 +2801,13 @@ static void arm_smmu_domain_tlbi_inv(struct arm_smmu_tlbi *tlbi,
>  	}
>  }
>  
> -void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
> -			       unsigned long iova, size_t size,
> -			       unsigned int granule, bool leaf)
> +void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
> +			  struct arm_smmu_domain *smmu_domain)

A caller re-using the tlbi would overflow the 2-entry range.cmds[], since
num_cmds is never reset or checked. Should we sanity check num_cmds here?

Otherwise,

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

