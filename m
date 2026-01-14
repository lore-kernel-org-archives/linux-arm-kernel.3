Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89310D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCxOk+iywvSu8+CpqcXhukbgVIWbwqBDGWYpBD4H77A=; b=d+Kb7d+tVcOaE5ryjy5J4S1R6I
	vgkKmmhOJlisuZ4/bh5YmANz7f0saajjwcFTYLHaVVFcM4xfphW21e3idz++hf9N/Hsjk8GWirsn/
	qjRfoH2jFPMA/4iBUK99XRrwIWkiLFitUg3vnA/xuKBPLfo4PWF1iQP8Ez6w+APK2o79N7tJpkUlr
	rsr9zsG+9RFlCKkHvV9HnPsVNJtC7HoxcYg6GvlADH2jGXbZdUEYbZLdQwlDVwrmhnI9BHYtl15F7
	7wzVOR9YgdbUY/NZIlOY7cz8AgelBkXAUjfEpTzNigRtxVeJi4ZZuugapc7sXa0xFs/2GkK1qFjm8
	OUfS80sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg38V-00000009mKV-16jz;
	Wed, 14 Jan 2026 15:50:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg38S-00000009mJj-3jGL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:50:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a35ae38bdfso73325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768405816; x=1769010616; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCxOk+iywvSu8+CpqcXhukbgVIWbwqBDGWYpBD4H77A=;
        b=VhhUyygOcemMV/+WAXVa7C/tRpGbcAEkU3dr1U/h+U3og8xf7IIRcE3n0JaKV1VCs7
         iTiGqTUnPrLL12VFK0T9Fej2qHv5EcxZmcfFRgLSGzIcviranO7nwQQfLItfOr9pzZwf
         vXcib55qKKI36W9MM24vjCAiawU+pvLLoJPsIMbIlcMr23KtT/MBXwDR6C/WdfeVxDtz
         lYJEUpRkpsT0JbbTFaIP3cuTcK89ti1VbPYHdv5cvKfAbBdRyBlFWGQOyHkNURi3JP/l
         FC3UyoRLUyb9tk3NKwVoc/n0gCfagYzM709VUuKjLei4JLoxDsY71vMdnHu8GsXweZCh
         qdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405816; x=1769010616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCxOk+iywvSu8+CpqcXhukbgVIWbwqBDGWYpBD4H77A=;
        b=NuqqQCSmW+aLJwYVXNcFdG+8Q9X5iAAKvEg3ahlUi5T7V4OGVI6XibXcwr7Pt3u8zP
         Ee4rLphsK4rGJ9SAyCTUHzF0NoB8repEAIpn0Clz4wTOBww2/mECFb78acYNv8O+pLsK
         gI15Qg5ciKnaxBCgulvRGrE5IxxG6h4iKzrvOnU6zEp2GNYIy/PTK14MDp1SvAw/1pp7
         SYY67g/KJumpYGaMJx5N1WaoMJuNwofWiBfUcnK42RqBqRqnc9kA6nE1caR+a8qoMQCh
         /FcQ/PFcnqh+WvVdnn/psa7GyFibpbeECQ7LxvjQATRDRYRq6ehJXciQWZ7rEaA2/3EF
         l92g==
X-Forwarded-Encrypted: i=1; AJvYcCXIXyl55ao/n2e/FHJFvH7QYJP1BagksB0mDKhS7pPHrCn2NeHvD9TiG3EsWiIYh4oHfp4rBtjjFAOsjUm12Z9I@lists.infradead.org
X-Gm-Message-State: AOJu0YyX1GP5QDG3peYwDmNBeZBHSYSJu1+E/+51RYs6lKO8nhzmgwy6
	dD/3N6WeorQfCWkZ9RPyzfiM+DkS3D6tT8BLyBEQMKU4oTt9RZleApZjGELqP6rzJQ==
X-Gm-Gg: AY/fxX4KJ07l7gq3/3OZ/6Pg7H4TMmWwS2tIm0IKiEl4dN4KJzyzwiJE5jZntgGn0T4
	K9PHizt77ZG/bbQXVx1+ZCPAlT9xgRbukJFGROkG/29HOtZYD7e0twTINLXQRgIXDMZ6LfHTQ3G
	AgHXeuFalyEuHMEKgelKnzUmwEmOMpvtXWmsHrAtBR68zoWyWMd3vpmKv5Oym1UiE9GSBUUI1IV
	mXy43HWmDSbbKSYNNJNhjQ/RCjIClq25lxtdYben+RcvIjZb1Fgvh92gG/inMQ3ev//GRYhFOEg
	NOEnu+MCA6olsubWue+y2SFwhJeW1OEGtt/oYMN1HZCICJ/Vq2bQjD73I5L4gIIYWt5rYSqNLZH
	x6RC8Bg4zgo7GA/Q2mjWaiyTVADYhsLGCKz/arQvx3pJpA1hGOJzNS2di4F+QsZHCXlE8GTFICg
	RePFS1GsldrZGpV6H/OPt5JlNLLd07TO9RJMU6N6foO6WqLQju
X-Received: by 2002:a17:902:e549:b0:294:f745:fe7b with SMTP id d9443c01a7336-2a599a25a6bmr3059615ad.6.1768405815639;
        Wed, 14 Jan 2026 07:50:15 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm2370400a91.13.2026.01.14.07.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:50:15 -0800 (PST)
Date: Wed, 14 Jan 2026 15:50:09 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jgg@nvidia.com, robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	xueshuai@linux.alibaba.com, smostafa@google.com
Subject: Re: [PATCH rc v6 2/4] iommu/arm-smmu-v3: Mark STE MEV safe when
 computing the update sequence
Message-ID: <aWe7MaEiGY_uOY4a@google.com>
References: <cover.1768248467.git.nicolinc@nvidia.com>
 <f560881df101d76de95c942cdbeab149eae3d581.1768248467.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f560881df101d76de95c942cdbeab149eae3d581.1768248467.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_075016_930546_09B4D419 
X-CRM114-Status: GOOD (  21.88  )
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

On Mon, Jan 12, 2026 at 12:20:15PM -0800, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Nested CD tables set the MEV bit to try to reduce multi-fault spamming on
> the hypervisor. Since MEV is in STE word 1 this causes a breaking update
> sequence that is not required and impacts real workloads.
> 
> For the purposes of STE updates the value of MEV doesn't matter, if it is
> set/cleared early or late it just results in a change to the fault reports
> that must be supported by the kernel anyhow. The spec says:
> 
>  Note: Software must expect, and be able to deal with, coalesced fault
>  records even when MEV == 0.
> 
> So mark STE MEV safe when computing the update sequence, to avoid creating
> a breaking update.
> 
> Fixes: da0c56520e88 ("iommu/arm-smmu-v3: Set MEV bit in nested STE for DoS mitigations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 390446d259ab..ccd6357fa5a8 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1086,6 +1086,16 @@ VISIBLE_IF_KUNIT
>  void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
>  				  __le64 *safe_bits)
>  {
> +	/*
> +	 * MEV does not meaningfully impact the operation of the HW, it only
> +	 * changes how many fault events are generated, thus we can relax it
> +	 * when computing the ordering. The spec notes the device can act like
> +	 * MEV=1 anyhow:
> +	 *
> +	 *  Note: Software must expect, and be able to deal with, coalesced
> +	 *  fault records even when MEV == 0.
> +	 */
> +	safe_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_update_safe);
>  
> -- 
> 2.43.0
> 

