Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD5FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eT2u2uECc/JyT//Y0MUNfLJ3f6c5Vk9vkYH8un7LuaA=; b=Ax3VlXt0H2NZ+TsrNclNSS57Kn
	QvOsokGbvI3Rv02UsUzyD46iGPRLD0I34ew5RZtjp7kFtsxLmxPAQUMaunrmBOKjrZdZV2Ryb4ofx
	nyn1tMgaDzKDCYtJ29lkU1eCQt6Vx79bvVPmNiTxS4GOl2UT+SApo9JrIyhLoRo4G2Cl8U4j6nsWA
	nGTXfx7dhU7uRWfe00kxvj6jHpJMb39VUAkvwlFO0sZxiebBkEc/EDva/g4s6ule6G1q7zLFApZHS
	DznDL0Jz0nlpAgT91UhyjlRjkI5owe2oDEGqEWwwO66qVIUVZZZ0/BPejbfSjPKEbl1xD2SQO7cEH
	8bgGDKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4FN-0000000EsnM-3qKG;
	Tue, 07 Jul 2026 11:45:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4FL-0000000Esmw-24k6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:45:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so34645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783424749; x=1784029549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eT2u2uECc/JyT//Y0MUNfLJ3f6c5Vk9vkYH8un7LuaA=;
        b=uNUfIoypdtkEM3y3IUbXXSpHHuZJf4mqsT8Es7HXJMj/xFsLY3FS9n3MwwhLBA08aW
         OMagK5X5tw9tLb/iy/KDDC+QI7m98II1df6sJUxYpe+HCQRdHgHKA7PYPyEpbOcEAW5b
         nnX9BnRghU3YMlxSyCyRYz0eZjlsAmvA2D2aLDeXdWWHasCF+tUIKwLfDCdebFuToOeX
         1bmJY43aY32DDdRqmQurKMq1sd8uqY1VRTjCp+xId0yYmzH2qGDSOr6iSi6Uha1rkvuQ
         29AeUsEaxBvUJuogwYxqpIueJ06bEqiPwkTkSFnKw8U0M7M0uMoG5UnDZjCfvo+j8Kyl
         Gufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783424749; x=1784029549;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eT2u2uECc/JyT//Y0MUNfLJ3f6c5Vk9vkYH8un7LuaA=;
        b=fB06AKFz8LPgmWDQwOG6DkTJ+eIFJKeukrqZ8BDi8rQZOqRaXUwW9lxIm1oHyRwAvs
         JyNqra9131JxT/uTEF5mdxRjMi3wC3BB4GTy667RrAkjv5wkxQp120FYS9vnpQsUh/Dq
         OmSkX3hrNiaERRn7pNdNe9LA30vVKdOMFFgkYUz181FIiDIyo6ZQ72YDNJuSl0vE9/2T
         GkfW5wy0lWhWnsnwf9K/2LDHzn2EMhxT0lVFVBYrBgefjWuAzZBithjkuTGXFmpfcY/w
         xG9ShfCfWo9O3ySfEp1vtsqV3luKBaAUsVPij6taEmfPvDzeoOTlkz/NZaEoGkSG6mDo
         DylQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUf4Pznt0aHeuGbfkkBqrX5rQbQ6Gpqq6PoBo/iWrfWDK1n0A+05s/Rgnywyb/KvAqhuX4DU9Tvh7KY1idpO4P@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpj3TAoRFZJCOM6A3pFb2Pi81oFw0fbywDtcpybMSVPuvkUk/C
	P1MJiXFINyjJL0Q7wYKHECgrRNT5ASwz/YeDr2I0ULwW6GH/688r1lc0KJrQMD9I6A==
X-Gm-Gg: AfdE7cn9lq1PdNXCqLe9gZmMAvt3KN4T/wAT25kuaNWvm03ctMPnumTR/tL/iHbKQf1
	OLtuPW+b3WOBbAdFsFjFX+m9Q4oy/0swi2px0z8nrhVva/MlSsXyjonb+xxj6PY6oyIORw2VYHr
	jv3TA3Hcxk6rg3w5xSgRJfvktkvaRB5G9laA0MXWDrlRY447DXaiOaVYoItqqq3mQ/UYaNr6vMQ
	v0+5BPAA83z5+6R9Bj89hUaUX+j/OIOL6zWRp0GNYgtwEdF9zSXozd5+8UQ9FEka4WKDC1GyZJV
	wHVLSJCyl75DVz6Tl4fw+z5NSXt+BQgsd/KZTbF+/YwxEWSlgSyYiFefbeIPaHwPTmu7OaIlLoG
	5d508g5wma9pzzTrt0wAWw94kYtZUAdLLL0zkLMawHuBgbcMsoOSJPNkDqbKVJwKzD1ILwV5Jzd
	sUh9MWR7qmThIltk4w+NPbN/qOpkrEqjaZFeKRtc6a8RkpAo9O
X-Received: by 2002:a05:600d:8654:20b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-493e15301b5mr647595e9.7.1783424749113;
        Tue, 07 Jul 2026 04:45:49 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c9faesm37268395e9.1.2026.07.07.04.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 04:45:47 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:45:40 +0000
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
Subject: Re: [PATCH v2 3/8] iommu/arm-smmu-v3: Optimize range invalidation
 for latency
Message-ID: <akzm5BoV0rToJ7ij@google.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_044551_564693_B5296E55 
X-CRM114-Status: GOOD (  43.91  )
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

On Mon, Jul 06, 2026 at 01:26:40PM -0300, Jason Gunthorpe wrote:
> The server IOMMU drivers focus on invalidation latency by default,
> over-invalidating if necessary, to round the invalidation range up to a
> single command. I think this represents a trade off for DMA non-FQ and SVA
> where stalling the operation is overall worse than re-loading the IOTLB.
> 
> For instance AMD and VT-d both round the range up to the largest aligned
> power of two and invalidate that. This causes over-invalidation but that
> is preferred on real HW over trying to issue a number of smaller
> range invalidations.
> 
> Only if a para-virtualizating hypervisor is detected do they switch to
> using more accurate invalidation. This also triggers using
> iommu_iotlb_gather_is_disjoint() (ie PT_FEAT_FLUSH_RANGE_NO_GAPS) to
> remove over invalidation from the gather. A pvIOMMU has a hypervisor that
> will walk the IOPTEs and resync them. Over invalidation, especially
> significant over invalidation, can incur a big latency cost reloading alot
> of page table. x86 IOMMUs have aligned range restrictions so there are
> some pretty nasty corner cases that can trigger huge over invalidation.
> 
> Currently SMMUv3 doesn't support detecting a hypervisor, and it
> unconditionally runs in a NO_GAPS mode. This makes some sense for the
> single invalidation flow where there is little reason to push single
> commands across a gap.
> 
> When we get to RIL hardware, this doesn't look so good. On real HW the
> best option is the same as x86: issue a single RIL per gather and optimize
> for latency. SMMUv3 has a significant advantage as its RIL does not have
> alignment limitations so it's single-command over-invalidation is capped
> at < 1/32 of the gather's size, making it much more suitable for a
> pvIOMMU.
> 
> However even with RIL SMMUv3 still uses NO_GAPS and it breaks down the
> gather into several exactly sized RILs to avoid any over-invalidation,
> costing latency on real HW.
> 
> When the HW has RIL support follow the x86 approach in SMMUv3 and
> calculate a single RIL per gather that will cover the required
> invalidation.
> 
> Calculate the smallest SCALE such that NUM can cover the range to minimize
> over-invalidation. Always use a RIL command if RIL is possible working
> around the spec limitations to form a valid one. If RIL is not possible
> then do full invalidation.
> 

That may be beneficial for servers, but I am not sure about other use
cases, we already know that the invalidated entries are unmapped
and not used. However, over invalidating might impact live DMA which
would be bad for workloads sensitive to translation latency (as
embedded cameras, displays for example). Maybe this can be configured
instead (via cmdline)

> At least one invalidation errata is avoided by 'always use RIL'.
>

Can you please clarify what that means?

> Since the normal path is now the only one with a loop, split them into two
> functions and fold a simplified version of arm_smmu_inv_size_too_big()
> directly into the normal flow in a way that directly limits the number of
> single invalidation commands generated, again focusing on controlling
> latency.
> 
> The end result is any gather is converted into either:
>  - One invalidate all
>  - One range invalidate op
>  - At most 512 single invalidation ops
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 257 ++++++++++++--------
>  1 file changed, 153 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index d22012466e3965..1ad642e09eb92d 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2395,124 +2395,166 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	arm_smmu_domain_inv(smmu_domain);
>  }
>  
[...]
> +	scale = fls64((num_tg - 1) / 32);
> +	if (scale > 31) {
> +		/*
> +		 * Range too large for a single command, use full invalidation.
> +		 */
> +		return false;
> +	}
> +
> +	/* 16K granule TTL=1 is reserved (Section 4.4.1) */
> +	if (tg_lg2 == 14 && ttl == 1)
> +		ttl = 0;
> +
> +	/* Verify address alignment for the TTL hint */
> +	if (ttl && !arm_smmu_ttl_addr_aligned(cur_tg << tg_lg2, tg_lg2, ttl))
> +		ttl = 0;
> +
> +	arm_smmu_cmdq_batch_add_ril(smmu, cmds, cmd, tlbi->leaf_only,
> +				    cur_tg << tg_lg2,
> +				    DIV_ROUND_UP_ULL(num_tg, 1ULL << scale) - 1,
> +				    scale, ttl, tg_enc);
> +	return true;
>  }
>  
> -/* Used by non INV_TYPE_ATS* invalidations */
> -static void arm_smmu_inv_to_cmdq_batch(struct arm_smmu_inv *inv,
> +/*
> + * One TLBI command per IOTLB entry, assuming the entries are all at least
> + * iopte_granule sized. Returns false if too many commands would be needed which
> + * indicates too high a latency. The threshold is similar to MAX_DVM_OPS in
> + * arch/arm64/include/asm/tlbflush.h for the 4k PAGE_SIZE.
> + */
> +static bool arm_smmu_cmdq_batch_add_single(struct arm_smmu_device *smmu,
> +					   struct arm_smmu_cmdq_batch *cmds,
> +					   struct arm_smmu_cmd *cmd,
> +					   struct arm_smmu_tlbi *tlbi)
> +{
> +	unsigned long num_ops = tlbi->size / tlbi->iopte_granule;
> +	unsigned long iova = tlbi->iova;
> +	unsigned long i;
> +
> +	if (!num_ops || num_ops > 512)

Is there a reason that was added instead of keeping the old formula?

Thanks,
Mostafa

