Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5427AC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LeP7MeAYKc+4gd66ZIjlck1w7e0lfL9pyApNXhT4Go=; b=NjmAJBKRxCJoH8tqhGgADaPequ
	D2+Lwh21H/BREKDEUzStVtkng438L1gKHT5iVahTIT6UI/llFqjL6t2lC5yq46N4lPPgzuY5j9SMe
	skHVdumwmFiCL5+c1QfH0ODNxazI4N3wsMxyaaxpbJjofy3X6bBV8VU1RA0RJ6Rcj/xN88YTo8OAV
	p3SGEQTAQBo1lUcMZWEGz4Hm8wCzeqBgB5hwF95m8DcGAheq34TXNmEgNWjEiDni2ikK9nGV/TM/r
	T9B+QwNh9OQ/ZfUTVPmttEkdZDWhvBCfAaN3OuHIC7Y6f6JQJp+j9m8i8Qnn9TWT4KogqVeBb1+A8
	KRM7SgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aaF-000000074Wm-3tfN;
	Mon, 07 Sep 2026 14:44:31 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aaD-000000074Vx-02yF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:44:30 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so50745e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 07:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788792267; x=1789397067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LeP7MeAYKc+4gd66ZIjlck1w7e0lfL9pyApNXhT4Go=;
        b=tbEzJoKuRS4XEfAL5/6APVa2OrVa9zFqr5Y26RyLZaw0iv/MWXjTSsDhCkvge5IvOG
         xVFdu+FmcPS60WGgRSs4a00q6aMVKT/dObJi7xPrKWAuq/22vI68k3kHFiicXycmKN9v
         6sU5L+jYUz5fdmcJcqoJvQ7jg6AK013qD+wIHFn21W/PO0XoJBa0Uzt92ID/kYhXtuIa
         /ZcUAMgG2cjW8ATxXNcADgaNbzJfcpGvkaPYoF4t/TBPUx5d40oWKyHravzpTNx4f0Jw
         w59b5UsLqVr/N50tQFXQ3a0lUODuIpJ1hKhqyw9yGp3cqzlvfRQMycEX+gmPf/+u/7J/
         3fQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792267; x=1789397067;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LeP7MeAYKc+4gd66ZIjlck1w7e0lfL9pyApNXhT4Go=;
        b=PeW8B6uvnmvya2hVLceXTKoJot8oP0Eg/sSEGogVgQ+8XbnykmE0TY5DWNCuKMNwzm
         NDceubaUu3zihrKy71XnZf1PbP7O96dsA4mpy3UqAM3Sy9YLyxg5mAs6ZP5KSNgmAmYs
         12U5WNEd6CDAASd9FL+IQIrjXMJ3inrSXPl2DbvfkwYsLfm6Ube9Xx5+7tdh+5/pPyF1
         jrNSPa6OvqR69WWPlN8qDdVoUYynqkC7cHBvWIsylxmANVin7GM+905FbRLTaMlN1Pb1
         bsq7c1itdL4uPDOObFyG8VOFSTD/XgYfEIbvILeSDnBkn4sENQuPXxiyE+vRm7aBl3iy
         47Xg==
X-Forwarded-Encrypted: i=1; AKwUvByDeMiSLpAV4+gKAKc/jwYmUHXCQ++rjRqCqm7CvCRLAMut7nqAZOQI+129LkY0eu+3VlivWX0z7Jc3SzABp2Wa@lists.infradead.org
X-Gm-Message-State: AFuF++kI093O6IaMXYdQ94JMHC22CR7tcD7e0bDOo/TEF5BILYvr+T5P
	YqPz9vj8jx1x26dZieqO70p8O6GvI7olpL55T/sVjKstQ6I7TWMoimS50WpzyhuoPQ==
X-Gm-Gg: AYBFou2aHSXpD5Z0Z0PMJXCOkAXoaI5eaxrLRCUqBPGBZxNHR2TkxpOhfGR/MN0vQoo
	eBCqGuLr13CSWfHQCMedTXz62n1ci8Z1vVO9bUkBNnUyTuKkIVzNF/eBMEmf5R+z5QZWTxhAiRB
	B5zhZ3XRDHzaKGHcGHRP0bmhOr+nJG4+CcvPSthUaIJja89Ca4xu7YVbgYFfUhninbJlh7xPJhP
	SrKnlQvbLbpq0qbq70ExCtlTrutRlNMgT8Re6H1ahcaZawOmU97upfTEqXBaEpqCaL9UJqjrwov
	AM0cqVwKezt6BBe9rAF0tDGENnwTxQ8ND4CCGYwo6/Q1H+9RwVNKxXNkzPzRfFqfeOGzkaEc3/y
	K8bx9XPRUEmUMRETkZ3LLHGuurpwFjrE1Gr5ksu9FT7GlMkFRWyLLFht0ggsxsl9MzKdAqGtR5Z
	D9g6sLckGMJiSd1tAa+eh3n/4w40x9skrmObyLQLdIyxiR6BukWy8DCQ0mKdd4hcRQDMs0o7RBB
	3O7kQCxTVBk/+V9n/1wwbyRhdcHbjdXDzDNXW/v
X-Received: by 2002:a05:600c:c3cb:20b0:499:a6a5:a687 with SMTP id 5b1f17b1804b1-49d00ab6427mr1494785e9.0.1788792266833;
        Mon, 07 Sep 2026 07:44:26 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm25224381f8f.2.2026.09.07.07.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:44:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:44:22 +0000
From: Mostafa Saleh <smostafa@google.com>
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
	Pranjal Shrivastava <praan@google.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v5 9/9] iommu/arm-smmu-v3: Support the DS expansion of
 RIL's SCALE
Message-ID: <ap7Nxijs1xq7RRs_@google.com>
References: <0-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <9-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_074429_078689_2052D069 
X-CRM114-Status: GOOD (  25.64  )
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

On Tue, Sep 01, 2026 at 02:49:58PM -0300, Jason Gunthorpe wrote:
> If DS is supported then SCALE can go up to 39. Compute a scale max that is
> compatible for the entire invs list.

I see in some places scale is still assumed to 32 as in:
- arm_smmu_ril_init_end
- arm_smmu_tlbi_calc_range

Would those need to be updated also?

Thanks,
Mostafa

> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 15 ++++++++++++---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  2 ++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index b99229a5bbacca..2a159be751891e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1060,9 +1060,16 @@ static void arm_smmu_invs_update_caps(struct arm_smmu_invs *invs,
>  		invs->has_ats = true;
>  
>  	if (inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> +		unsigned int scale_max;
> +
>  		invs->has_range_inv = true;
>  		if (inv->smmu->options & ARM_SMMU_OPT_FULL_CONT_RIL)
>  			invs->has_full_cont_ril = true;
> +
> +		scale_max = (inv->smmu->features & ARM_SMMU_FEAT_DS) ? 39 : 31;
> +		if (!invs->range_inv_scale_max ||
> +		    scale_max < invs->range_inv_scale_max)
> +			invs->range_inv_scale_max = scale_max;
>  	}
>  }
>  
> @@ -2625,7 +2632,8 @@ static unsigned int arm_smmu_compute_ttl(u8 leaf_bitmap, u8 table_bitmap,
>   * covered by one command.
>   */
>  static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
> -				     bool single_ril)
> +				     bool single_ril,
> +				     unsigned int scale_max)
>  {
>  	u8 tgsz_lg2 = tlbi->tgsz_lg2;
>  	unsigned int ttl = arm_smmu_compute_ttl(
> @@ -2647,7 +2655,7 @@ static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
>  	 * address beyond alignment to tg (so long as TTL=0).
>  	 */
>  	first.scale = fls64((num_tg - 1) / 32);
> -	if (first.scale > 31) {
> +	if (first.scale > scale_max) {
>  		/* Range too large for a single command do full invalidation */
>  		tlbi->range.use_full_inv = true;
>  		return;
> @@ -2917,7 +2925,8 @@ void arm_smmu_domain_tlbi(struct arm_smmu_tlbi *tlbi,
>  			arm_smmu_tlbi_calc_range(
>  				tlbi,
>  				smmu_domain->stage == ARM_SMMU_DOMAIN_SVA &&
> -					invs->has_full_cont_ril);
> +					invs->has_full_cont_ril,
> +				invs->range_inv_scale_max);
>  		}
>  	}
>  
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 6582203eb7425f..8b251a188810c9 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -760,6 +760,7 @@ static inline bool arm_smmu_inv_is_ats(const struct arm_smmu_inv *inv)
>   * @has_ats: flag if the array contains an INV_TYPE_ATS or INV_TYPE_ATS_FULL
>   * @has_range_inv: flag if any entry's SMMU supports range invalidation
>   * @has_full_cont_ril: flag if any entry's SMMU requires the CONT RIL workaround
> + * @range_inv_scale_max: max SCALE usable by all range-capable SMMUs
>   * @rcu: rcu head for kfree_rcu()
>   * @inv: flexible invalidation array
>   *
> @@ -791,6 +792,7 @@ struct arm_smmu_invs {
>  	bool has_ats;
>  	bool has_range_inv;
>  	bool has_full_cont_ril;
> +	u8 range_inv_scale_max;
>  	struct rcu_head rcu;
>  	struct arm_smmu_inv inv[] __counted_by(max_invs);
>  };
> -- 
> 2.43.0
> 

