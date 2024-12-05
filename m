Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AF5E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1unPXMZbH7h5cW8eJggnz5tqss4o788EkVvHmHsyGXk=; b=HX76LI8xLINw6Y//PCEmNlmUW8
	CJW5zS6n8mASt/f1u2wWggWzhe3zPGxCfB/fYPVGyoZmHbmjGuCGhV8ouWDXAD74UDsxGfc3faA2M
	rWoVnovgrFYDqMAqvx7VGOIWfgEFo2y+f0aj0tNGGeKaYvEZ0rFzUpxSqoQ+U8bBu4jmf+O7JHQ9C
	7F8xz1X59zh4X2RypVVFfVVqabYcf6u0uUTUkqrdMiAgcmy6a6iDyctgf7CqiCMz6J5SUMnO17QuJ
	ge3JbIkct4j0676DG8sclt4cw/Uskl4WBgj4Y3e+agc+IFSX1zzQUIqqP0tTNHU44L6OOE+CIxxFn
	HIMSMKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGND-0000000H5Wc-3cT5;
	Thu, 05 Dec 2024 18:14:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGMA-0000000H5QN-43tn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:13:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4349fb56260so8755925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733422420; x=1734027220; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1unPXMZbH7h5cW8eJggnz5tqss4o788EkVvHmHsyGXk=;
        b=YoAE0amXQaHD2KpyeTB3HPKQbJFddrRigrJLz1ScekU6Q1bzqEYUEhmpeIZ/PutmKH
         5H2Aew2Qlyq+JeXwkCWY4LdO+/ymFd+X4hqib/GGw9fsXL06oquiGdLGcmvgHRI/Euaj
         UE8vchMDw86+GCqwa5RLWIkmW3Y/dbZz2yiQD0RxPGNw/LSUEg12MgQejxKYafdC1y3R
         Tex29FBbJEXT+zcC2OqiKPL34ADjXNqBmwtO9J3F8OXpaNauMH5htYiKUq2DrpbDc/H0
         nB6FqKlH1k7h33L5Pnr9CRVjVIkvaU+o+GUKugWErITlNVY9E2CMFMCK003lGlRlzGIx
         XL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733422420; x=1734027220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1unPXMZbH7h5cW8eJggnz5tqss4o788EkVvHmHsyGXk=;
        b=SXfP8wUauAFw39GIZubNHJ1rveeWeuAB7O1S5Pt70PIz4QIu9fJ1B0Wg91mFSsHKj6
         NUQbu60McDtN+CnaqhFBr+JLQJbY0hR0LKSOS7XFKs77gY4cUqFX8ITPH85C73RwEiDF
         ktRFYoKFcwbs3028lND1YNEoXcvBWfP9X89s4i+ynZAcFtoPMrHcYb6onNbImoySVxt1
         A2kPgCHsL6bRqCCXbmcnvzrTdCeEE2Hk+TtoVzzJP8OBnm8+YfnkYDrE50GzD6IT1g8R
         vQ/z2FTqFNKEsnBAJ6CUA9sIPFwNv1ryUxvZlSGvResOu4evLB5FVnCfqogQMCDfGGhM
         gE6g==
X-Forwarded-Encrypted: i=1; AJvYcCWM9w+LcP+OsgmunVNwhoIt0dYKbtUvTXH6BGhTMi7aD+3bXnxCGol5gC2zaq/QvtEisnHo0cdqlCNna9th7vVb@lists.infradead.org
X-Gm-Message-State: AOJu0YzP3bsoKK2rnmuPURXQMcHcmp8N8++0zBZ5ZSRwHKGMgF1vYh9i
	TVFiBdLKcPqE0R1lV5KAVHCUHNqSW998wTvqreifFdJsiHqUd1TzLZNDECWgHK0=
X-Gm-Gg: ASbGncsRIKC5hQ4QMB1wQ9soXQruJKR3KL3XMYLHtkEbRrdTcwRKjRCFfkdJ4xwTlKE
	6x9mlLF90j6e0BrFUneBM4b5qbZ9bk6tVlmN4qODG4ArdKfymDRxo+OCPJS+HHJuVrh7Dnj20ME
	KM6FGJuKl5l5enA2OpAjv7+yCsQeAy9hQiqRINTLRCZV2D9Ylb6lrFqBiva/FnJRW+awNVXS7gU
	0oRLDGYO/xjrqgOJ+vVRsM35R/jNUvhegXTpVEZvPaesSBk
X-Google-Smtp-Source: AGHT+IHKsHgIdjWajIbHdYgI8g5SeKEyxiZvjxt64/im4qNjm8LREHx8tkyIsq6B6xmkfdQuB8t1Ng==
X-Received: by 2002:a05:600c:1d21:b0:434:9cc4:5139 with SMTP id 5b1f17b1804b1-434ddeb0492mr3060455e9.17.1733422420375;
        Thu, 05 Dec 2024 10:13:40 -0800 (PST)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113458sm32078165e9.27.2024.12.05.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:13:39 -0800 (PST)
Date: Thu, 5 Dec 2024 18:14:04 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, joro@8bytes.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, joey.gouly@arm.com, ryan.roberts@arm.com,
	broonie@kernel.org
Subject: Re: [PATCH 1/2] iommu/arm-smmu-v3: Document SVA interaction with new
 pagetable features
Message-ID: <20241205181404.GB664340@myrica>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_101343_056007_F68349D1 
X-CRM114-Status: GOOD (  29.33  )
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

On Thu, Dec 05, 2024 at 01:48:09PM +0000, Robin Murphy wrote:
> Process pagetables may now be using new permission-indirection-based
> features which an SMMU may not understand when given such a table for
> SVA. Although SMMUv3.4 does add its own S1PIE feature, realistically
> we're still going to have to cope with feature mismatches between CPUs
> and SMMUs, so let's start simple and essentially just document the
> expectations for what falls out as-is. Although it seems unlikely for
> SVA applications to also depend on memory-hardening features, or
> vice-versa,

Hard to predict, but SVA could be indirectly enabled by some common
library: for example a libcrypto plugin that shares the address space with
an accelerator when one is available (see uadk_engine). I'm not familiar
with the POE use-cases, but I guess a common library could also enable
those memory-hardening features, such that unsuspecting applications have
everything enabled.

> the relative lifecycles make it tricky to enforce mutual
> exclusivity. Thankfully our PIE index allocation makes it relatively
> benign for an SMMU to keep interpreting them as direct permissions, the
> only real implication is that an SVA application cannot harden itself
> against its own devices with these features. Thus, inform the user about
> that just in case they have other expectations.
> 
> Also we don't (yet) support LPA2, so deny SVA entirely if we're going to
> misunderstand the pagetable format altogether.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index 1d3e71569775..9ba596430e7c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -112,6 +112,15 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
>  	 * from the current CPU register
>  	 */
>  	target->data[3] = cpu_to_le64(read_sysreg(mair_el1));
> +
> +	/*
> +	 * Note that we don't bother with S1PIE on the SMMU, we just rely on
> +	 * our default encoding scheme matching direct permissions anyway.
> +	 * SMMU has no notion of S1POE nor GCS, so make sure that is clear if
> +	 * either is enabled for CPUs, just in case anyone imagines otherwise.
> +	 */
> +	if (system_supports_poe() || system_supports_gcs())
> +		dev_warn_once(master->smmu->dev, "SVA devices ignore permission overlays and GCS\n");

If POE tightens the page permissions, enabling SVA on top lets the
application easily bypass the POE protection. Could we actually return
false in arm_smmu_sva_supported() instead of displaying a warning that
likely no one will notice?

I guess enforcing !(SVA & POE) on an address space would be too much work?

Thanks,
Jean

>  }
>  EXPORT_SYMBOL_IF_KUNIT(arm_smmu_make_sva_cd);
>  
> @@ -206,8 +215,12 @@ bool arm_smmu_sva_supported(struct arm_smmu_device *smmu)
>  	unsigned long asid_bits;
>  	u32 feat_mask = ARM_SMMU_FEAT_COHERENCY;
>  
> -	if (vabits_actual == 52)
> +	if (vabits_actual == 52) {
> +		/* We don't support LPA2 */
> +		if (PAGE_SIZE != SZ_64K)
> +			return false;
>  		feat_mask |= ARM_SMMU_FEAT_VAX;
> +	}
>  
>  	if ((smmu->features & feat_mask) != feat_mask)
>  		return false;
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

