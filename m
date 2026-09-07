Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989BFC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnZLyq24G74x0BtcmnjsTe1Ba2BrJU0s+mndSt8tbQw=; b=J9SH6lGvhxnKbgQzd11gpXnVjE
	Lt+2+zzoPfY4nVenUHedtXeM6SzSWJszpEvZ+NAjqU9fvzviPcVTLBnT4/IKP9DXRepTrgtcELmg/
	pCs0PxDCjDUXK2O4RR/rrP+0lE+0mMOnOssSSV2SK37vjQLzEkZ09TGThSgK401skB6ZWQzGGz63f
	fIjViUX3b51zRyprF01HAkvsExy7yqDqFn+OOPcfe0+neoF5bwtID28IcSQ1hSRCxcBMLuNihxbTR
	D/6BB+fjJbvxyxsywogcftrmVxivqskdlflFhY96hlMCX+3ezdkzKHLTNnYedYVYg5hHA6cPKD0i9
	iI4M6dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aKI-000000072ln-1rl3;
	Mon, 07 Sep 2026 14:28:02 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3aKF-000000072kc-2s3k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:28:00 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d8dso9993a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 07:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788791278; x=1789396078; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnZLyq24G74x0BtcmnjsTe1Ba2BrJU0s+mndSt8tbQw=;
        b=i14jWIY5WbUqSt2LAv5KT4n6GO+IUQte0pjx2HHKqaJHuKUq9Qc+ru3KVEvW0jsXWq
         qy0nSQuTYED1xL5UfQrPH4MX4H5a/KX9Zb4aVWrnTGFmbPsW6cx0Yo3z18cdeHc/KQiv
         sM0mZuJ7iGrNBtj3nY0ZhADX4g9u5Wa1hqq1nY3aHKQ7I00WOVQVsmbEYwyP4cPXmSnL
         1J60DFXDjQ1pOtNDN03Mt18OMpqrA1eExlHAXP4K6K1/IQHtN0vFV/0CXffcmLrrJpb2
         HQqvbBNcXi3YbJfQ3I1SoRuGBAlSHSErOTYj3s9KkUdadY5qLm9xAoMdLi2/kas3tmFD
         EVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788791278; x=1789396078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rnZLyq24G74x0BtcmnjsTe1Ba2BrJU0s+mndSt8tbQw=;
        b=QxIJ4yx1sl35U7x7JjMqvum5fQdLeoxf3OY/osiqSBjQW6tP4pH/JjIq0VuX3of1ey
         OVrpXoD5cDsNnReBudrIYvAQ8s4RRkF1peUmQglUI3869/KMuPvCFQlgbki0hcjTbJl1
         4o6BapA9nxdMy3Yc0+iFPI3vsvu2fA8WSeLAlz9qJAqXEJdqV78ECmcEOL0qnYFLmA9F
         vrOQw3wt1dM5x6280MBB2Q5lipp0fns33RGVwjnfkNk8sU+z/fSUBT+FiZynIpsYHj/r
         5+eaPlO8pGxnGl6u4T0aHNGyJ66H4g89ULnWduiDOz3ZRjc3SM0/TI8P1Lx2hXbmJ2/s
         aKVw==
X-Forwarded-Encrypted: i=1; AKwUvBxcpVuq8r7MrFs9bhBwGtH0Eh+o+tu+8txrpjg8r15k19lpFlCnD8lsCDnICQrBsVr+2lZdESyLgJhv4xYSUbfH@lists.infradead.org
X-Gm-Message-State: AFuF++nE9EerJVtaV8kfrcWTx98ye8O5Ex3lJLlZcABOcJs/lOzzZ6SR
	COnV5NqdKFon2bh8t9/dGhzxwJ0oxyBgZd/J8AYau/b2L0wteptSooIxzQ6lllATOg==
X-Gm-Gg: AYBFou3fvNk6Q+pk/JeYYlhbl6w24RrSmf+u0Zn1qS9tf+TGS8ObpgDeMqBcAybm3bf
	1gsAqPnabT/uolgVHQnRoGW7aH3//Vd+VOPfhLvbHjgGZQiJFqD7XliXHY+R1cVFRPeIemjhsSQ
	b7FHOArUpmsXBuKeCidB2z8+ngaelRM0ufMlI9OFBteH+yuAB3JjzHs8/URkkRX8dHzF6KQYanz
	uAYonA9+YTJpOLzDHGqQ6evu03NYj0zH/G5308CvgVwNQDWoK+lZCXzP45pMgEkJF5SKhQ6tBWh
	CdWalpZUgOjbz/Mbm2KJMsEPmr08suHIPth0OZ5Zsqso5gATh0QLR22VxAcoY8Qh+YP+N1XDRQa
	aFF3eXpS/aeJ0vzwuzo+tujPCoC6H1sJZr2wcPb/ZbpywtUPElZxXb15d7mcGgvs0gYr/Da8p+b
	F0VpG5irsLKvrGj9/sHT1d1ayCh2Iasu+2Zq27TV5gRdRL74fGbDTmccbo6AnGuOWaah34ptt/j
	ZCmuZrZOpJ6V44=
X-Received: by 2002:aa7:d8d6:0:b0:6a6:6ded:b4b6 with SMTP id 4fb4d7f45d1cf-6a7f689d0femr62895a12.13.1788791277097;
        Mon, 07 Sep 2026 07:27:57 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5497cbsm483138266b.34.2026.09.07.07.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:27:56 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:27:52 +0000
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
Subject: Re: [PATCH v5 6/9] iommu/arm-smmu-v3: Precompute the invalidation
 commands
Message-ID: <ap7J6NKXgWhiwXgL@google.com>
References: <0-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
 <6-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6-v5-b810cf379bfc+13d738-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_072759_785758_0E09D0D6 
X-CRM114-Status: GOOD (  41.66  )
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

On Tue, Sep 01, 2026 at 02:49:55PM -0300, Jason Gunthorpe wrote:
> Store the required cmd data in the tlbi and just copy it out when
> processing each item in the invs list. The cmd form only depends on
> if the instance supports RIL or not, otherwise it is always the same.
> 
> This avoids redundant calculations for each invs entry.

As I mentioned on v2, I don’t see a value for this without smmu
sharing over the same domain, as this just adds extra complexity IMHO,
but that's up to Robin and Will.

Thanks,
Mostafa

> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 141 +++++++++++---------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  12 +-
>  2 files changed, 91 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 68dd7b69392737..883dfc584ed6c6 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2506,14 +2506,12 @@ static struct arm_smmu_ril_range arm_smmu_ril_init_end(u64 last_tg, u64 num_tg)
>  	return ril;
>  }
>  
> -static void arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
> -					struct arm_smmu_cmdq_batch *cmds,
> -					struct arm_smmu_cmd *ref_cmd,
> -					bool leaf_only,
> +static void arm_smmu_tlbi_add_range_cmd(struct arm_smmu_tlbi *tlbi,
>  					const struct arm_smmu_ril_range *ril,
>  					u8 ttl, u8 tg_enc)
>  {
> -	struct arm_smmu_cmd cmd;
> +	struct arm_smmu_cmd *cmd =
> +		&tlbi->range.cmds[tlbi->range.num_cmds++];
>  	unsigned int tgsz_lg2 = tg_enc * 2 + 10;
>  	u64 iova = ril->start_tg << tgsz_lg2;
>  	unsigned int num = ril->num - 1;
> @@ -2542,18 +2540,16 @@ static void arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
>  	if (!num && !ril->scale && !ttl)
>  		tg_enc = 0;
>  
> -	cmd.data[0] = ref_cmd->data[0] | FIELD_PREP(CMDQ_TLBI_0_NUM, num) |
> -		      FIELD_PREP(CMDQ_TLBI_0_SCALE, ril->scale);
> -	cmd.data[1] = ref_cmd->data[1] |
> -		      FIELD_PREP(CMDQ_TLBI_1_LEAF, leaf_only) |
> -		      FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> -		      FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) | iova;
> -	arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, &cmd);
> +	cmd->data[0] = FIELD_PREP(CMDQ_TLBI_0_NUM, num) |
> +		       FIELD_PREP(CMDQ_TLBI_0_SCALE, ril->scale);
> +	cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
> +		       FIELD_PREP(CMDQ_TLBI_1_TTL, ttl) |
> +		       FIELD_PREP(CMDQ_TLBI_1_TG, tg_enc) | iova;
>  }
>  
>  /*
> - * Issue up to two range TLBI commands covering [iova, iova+size). Returns true
> - * if successful, false if the range is too large to fit into RIL commands.
> + * Generate up to two range TLBI command payloads covering [iova, iova+size).
> + * Sets use_full_inv if the range is too large to represent.
>   *
>   * Normally the first RIL is the largest representable span which does not
>   * exceed the requested range. If necessary, the second RIL is the smallest
> @@ -2561,14 +2557,12 @@ static void arm_smmu_cmdq_batch_add_ril(struct arm_smmu_device *smmu,
>   * excess coverage from the second RIL overlaps the first instead of exceeding
>   * the requested range.
>   *
> - * If a SVA is being invalidated and the SMMU has the ARM_SMMU_OPT_FULL_CONT_RIL
> - * errata this produces only a single RIL and overinvalidates to ensure any
> - * potential CONT is covered with a single RIL.
> + * For SVA on an invs containing an SMMU with ARM_SMMU_OPT_FULL_CONT_RIL,
> + * produce only a single RIL and overinvalidate so any potential CONT is
> + * covered by one command.
>   */
> -static bool arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
> -					  struct arm_smmu_cmdq_batch *cmds,
> -					  struct arm_smmu_cmd *cmd,
> -					  struct arm_smmu_tlbi *tlbi)
> +static void arm_smmu_tlbi_calc_range(struct arm_smmu_tlbi *tlbi,
> +				     bool single_ril)
>  {
>  	u8 tgsz_lg2 = tlbi->tgsz_lg2;
>  	struct arm_smmu_ril_range first = { .start_tg = tlbi->iova >>
> @@ -2579,9 +2573,6 @@ static bool arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  	struct arm_smmu_ril_range trail;
>  	u8 ttl = 0;
>  
> -	if (!tlbi->size)
> -		return false;
> -
>  	/*
>  	 * Determine what level the granule is at. For non-leaf, both
>  	 * io-pgtable and SVA pass a nominal last-level granule because they
> @@ -2602,10 +2593,11 @@ static bool arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  	first.scale = fls64((num_tg - 1) / 32);
>  	if (first.scale > 31) {
>  		/* Range too large for a single command do full invalidation */
> -		return false;
> +		tlbi->range.use_full_inv = true;
> +		return;
>  	}
>  
> -	if (tlbi->has_cont && (smmu->options & ARM_SMMU_OPT_FULL_CONT_RIL)) {
> +	if (single_ril) {
>  		/*
>  		 * Produce a single invalidation by rounding up and disabling
>  		 * the trailer.
> @@ -2621,40 +2613,27 @@ static bool arm_smmu_cmdq_batch_add_range(struct arm_smmu_device *smmu,
>  		trail = arm_smmu_ril_init_end(
>  			last_tg, num_tg - ((u64)first.num << first.scale));
>  	}
> -	arm_smmu_cmdq_batch_add_ril(smmu, cmds, cmd, tlbi->leaf_only, &first,
> -				    ttl, tg_enc);
> +	arm_smmu_tlbi_add_range_cmd(tlbi, &first, ttl, tg_enc);
>  
>  	if (trail.num)
> -		arm_smmu_cmdq_batch_add_ril(smmu, cmds, cmd, tlbi->leaf_only,
> -					    &trail, ttl, tg_enc);
> -	return true;
> +		arm_smmu_tlbi_add_range_cmd(tlbi, &trail, ttl, tg_enc);
>  }
>  
>  /*
>   * One TLBI command per IOTLB entry, assuming the entries are all at least
> - * iopte_granule sized. Returns false if too many commands would be needed which
> - * indicates too high a latency. The threshold is similar to MAX_DVM_OPS in
> - * arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
> + * iopte_granule sized. Sets use_full_inv if too many commands would be needed
> + * which indicates too high a latency. The threshold is similar to MAX_DVM_OPS
> + * in arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
>   */
> -static bool arm_smmu_cmdq_batch_add_single(struct arm_smmu_device *smmu,
> -					   struct arm_smmu_cmdq_batch *cmds,
> -					   struct arm_smmu_cmd *cmd,
> -					   struct arm_smmu_tlbi *tlbi)
> +static void arm_smmu_tlbi_calc_single(struct arm_smmu_tlbi *tlbi)
>  {
>  	unsigned long num_ops = tlbi->size / tlbi->iopte_size;
> -	unsigned long iova = tlbi->iova;
> -	unsigned long i;
>  
> -	if (!num_ops || num_ops > 512)
> -		return false;
> -
> -	for (i = 0; i < num_ops; i++) {
> -		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
> -			       (iova & ~GENMASK_U64(11, 0));
> -		arm_smmu_cmdq_batch_add_cmd_p(smmu, cmds, cmd);
> -		iova += tlbi->iopte_size;
> +	if (!num_ops || num_ops > 512) {
> +		tlbi->single.use_full_inv = true;
> +		return;
>  	}
> -	return true;
> +	tlbi->single.num = num_ops;
>  }
>  
>  static void arm_smmu_inv_all_cmd(struct arm_smmu_inv *inv,
> @@ -2674,16 +2653,37 @@ static bool arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
>  				       struct arm_smmu_cmd *cmd,
>  				       struct arm_smmu_tlbi *tlbi)
>  {
> +	u64 iova = tlbi->iova;
> +	unsigned int i;
> +
>  	if (inv->smmu->features & ARM_SMMU_FEAT_RANGE_INV) {
> -		if (arm_smmu_cmdq_batch_add_range(inv->smmu, cmds, cmd, tlbi))
> -			return false;
> -	} else {
> -		if (arm_smmu_cmdq_batch_add_single(inv->smmu, cmds, cmd, tlbi))
> -			return false;
> +		if (tlbi->range.use_full_inv) {
> +			arm_smmu_inv_all_cmd(inv, cmds, cmd);
> +			return true;
> +		}
> +		for (i = 0; i < tlbi->range.num_cmds; i++) {
> +			struct arm_smmu_cmd range_cmd = tlbi->range.cmds[i];
> +
> +			range_cmd.data[0] |= cmd->data[0];
> +			range_cmd.data[1] |= cmd->data[1];
> +			arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds,
> +						      &range_cmd);
> +		}
> +		return false;
>  	}
>  
> -	arm_smmu_inv_all_cmd(inv, cmds, cmd);
> -	return true;
> +	if (tlbi->single.use_full_inv) {
> +		arm_smmu_inv_all_cmd(inv, cmds, cmd);
> +		return true;
> +	}
> +
> +	for (i = 0; i < tlbi->single.num; i++) {
> +		cmd->data[1] = FIELD_PREP(CMDQ_TLBI_1_LEAF, tlbi->leaf_only) |
> +			       (iova & ~GENMASK_U64(11, 0));
> +		iova += tlbi->iopte_size;
> +		arm_smmu_cmdq_batch_add_cmd_p(inv->smmu, cmds, cmd);
> +	}
> +	return false;
>  }
>  
>  static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
> @@ -2702,8 +2702,8 @@ static inline bool arm_smmu_invs_end_batch(struct arm_smmu_inv *cur,
>  	return false;
>  }
>  
> -static void __arm_smmu_domain_inv_range(struct arm_smmu_tlbi *tlbi,
> -					struct arm_smmu_invs *invs)
> +static void arm_smmu_domain_tlbi_inv(struct arm_smmu_tlbi *tlbi,
> +				     struct arm_smmu_invs *invs)
>  {
>  	struct arm_smmu_inv *used_s12_vmall = NULL;
>  	struct arm_smmu_cmdq_batch cmds = {};
> @@ -2798,11 +2798,17 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  		.iova = iova,
>  		.size = size,
>  		.iopte_size = granule,
> -		.has_cont = smmu_domain->stage == ARM_SMMU_DOMAIN_SVA,
>  		.leaf_only = leaf,
>  	};
>  	struct arm_smmu_invs *invs;
>  
> +	if (!size || size == SIZE_MAX) {
> +		tlbi.single.use_full_inv = true;
> +		tlbi.range.use_full_inv = true;
> +	} else {
> +		arm_smmu_tlbi_calc_single(&tlbi);
> +	}
> +
>  	/*
>  	 * An invalidation request must follow some IOPTE change and then load
>  	 * an invalidation array. In the meantime, a domain attachment mutates
> @@ -2833,6 +2839,19 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  	rcu_read_lock();
>  	invs = rcu_dereference(smmu_domain->invs);
>  
> +	/*
> +	 * Only precalculate RIL if it will be used, invs generation ensures
> +	 * this matches the instances used for invalidation.
> +	 */
> +	if (invs->has_range_inv) {
> +		if (!tlbi.range.use_full_inv) {
> +			arm_smmu_tlbi_calc_range(
> +				&tlbi,
> +				smmu_domain->stage == ARM_SMMU_DOMAIN_SVA &&
> +					invs->has_full_cont_ril);
> +		}
> +	}
> +
>  	/*
>  	 * Avoid locking unless ATS is being used. No ATC invalidation can be
>  	 * going on after a domain is detached.
> @@ -2841,10 +2860,10 @@ void arm_smmu_domain_inv_range(struct arm_smmu_domain *smmu_domain,
>  		unsigned long flags;
>  
>  		read_lock_irqsave(&invs->rwlock, flags);
> -		__arm_smmu_domain_inv_range(&tlbi, invs);
> +		arm_smmu_domain_tlbi_inv(&tlbi, invs);
>  		read_unlock_irqrestore(&invs->rwlock, flags);
>  	} else {
> -		__arm_smmu_domain_inv_range(&tlbi, invs);
> +		arm_smmu_domain_tlbi_inv(&tlbi, invs);
>  	}
>  
>  	rcu_read_unlock();
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index 4b9f04825eefa2..33ef99775aea87 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -815,8 +815,18 @@ struct arm_smmu_tlbi {
>  	unsigned int iopte_size;
>  	/* Base Translation Granule of the page table */
>  	u8 tgsz_lg2;
> -	bool has_cont;
>  	bool leaf_only;
> +
> +	struct {
> +		bool use_full_inv;
> +		u16 num;
> +	} single;
> +
> +	struct {
> +		bool use_full_inv;
> +		u8 num_cmds;
> +		struct arm_smmu_cmd cmds[2];
> +	} range;
>  };
>  
>  struct arm_smmu_evtq {
> -- 
> 2.43.0
> 

