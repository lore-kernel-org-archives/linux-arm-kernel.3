Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE45CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2l4mkkLLimCM4pi/KAoPVgTmhgqbCjkATKF284xpI8=; b=UGQUBYGM/tYBOhPkdM5MZ64NZO
	jL+GiqxUWrQ+qeBo0xS7dT9Y2z6AM7nw0iYzuElI3RziWZcJN3z1apu42mAF5fMUV6yq5f3Iw+SeX
	Ozb/ve7b+aeHFJDgLAHwafQxLCc6ZWqXctns9+AagRdIwuQ5Ab+c8v1O//xIShpDbLj7+qu4gMAaX
	0Xxwo+iTXoWUDeMJ3QH6y8kiEPSyrk8wrXV8ST/rq4u4f2M5K/xrRuXQR6FJJqZATuDtOE5J/ExuN
	MkiuFjFHDjryq6uVKLQkLrGL88J2Fzb7dToP0n+2bY9dNnCCgFTC4nUmCQW0IEeY8Vz3CSbiirIId
	SzaRClvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGZI-0000000Ew29-1NAQ;
	Mon, 15 Jun 2026 23:18:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGZF-0000000Ew1m-0Iqy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:18:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0b1a48855so24435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 16:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781565488; x=1782170288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2l4mkkLLimCM4pi/KAoPVgTmhgqbCjkATKF284xpI8=;
        b=Y5Z0mO4PArYX4TEHmKgBOtHo0NYFPfocBqRM6R9N2j2fPNssC8bUogstu1Jh+RMrvm
         EVuvtQA9RVqps2II64IqGBJ0yfRoQ/1ZsKrcEleRjdGylcRWFk44BNwAB1f0yvuwXHvc
         W6aVnMWZ0DUajRfsfxOEM3dxrtrMVGNPNVLBqnELmVd1vFBhWz3xpgu+e6Q8m3nbIWVK
         aVz7Ul88zvLbJuxafgnreULHPeET7doGd9TpMXrHCL0vrL7eql714ouctCt3EUMGJybu
         MQ3F4DihW3YnmqO7XHyUHPYhvqE7XixZqME2Sy58BdljoiDOWgs5hVQ3YRebRKSbsyO3
         UyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781565488; x=1782170288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2l4mkkLLimCM4pi/KAoPVgTmhgqbCjkATKF284xpI8=;
        b=O4m2KDHsCffeEnZMjrMEgjI4DyFdJuDIeJyJD26ZUu7D3+9D4VoJ+ZcCrkbTbUXwIH
         YHaw0JKVL0H71PgwGGk9YXdwGrjdy0F+/8aV50dU6NdzZVOJmatRP6iMMLnGsVD+lOB0
         bFXl+2LLMcFXh+7P6vryYJCGy//uKWBum88SXLnTSBdyQ+1HoOAZlZCaAoyiXkbl0b7X
         3FFHdTjji5U6/lEiooqfGd3oNg2eUXnJ49I1ZJQydaApeP9cBqTQVel4a8LRNlDg941M
         e5baElq0pyX43whkjBa5oufWUiCC4MZb99yY5hTLoeyrOSCGykhlkk73K0U4TN6mJ+vm
         cmpA==
X-Forwarded-Encrypted: i=1; AFNElJ/vkayuPXgnaEjWeTPcB7As2IGjiUm5A3/eb/i4hWXqheSY6FlGVYptH3ROcZQctT5pHn+tp942a07gtcbWca8C@lists.infradead.org
X-Gm-Message-State: AOJu0YwnVwkjmXtd2onsQXsC9GIDcz5acQ+84rcPjHPZSbZJ1QiysbZG
	UtNN0kyy1tfHVfOrP0XmUAI2j+1bk8ZMR0UDogIhrxHRwpjSwwEDwOpSqyEY8rf65w==
X-Gm-Gg: Acq92OHTHmbG/QpRVNSFZ7FcV+mTrCkDXkkrogd6+Moz2lNsFPMR4sHSEtK+aP9plq0
	l2i3ERhsdVR5m9gDGO8zIaiEOuSnvEZIQZWX9qbzSa/nRVZi23iP6JkLj8oHMGs/B/absiLy3Ho
	lo4hm2mBjvUlvyhEDCVVYU5YUXvXRwcf8RtvACG2S0H8bBUdHZJXqO42O+W6hlRUUjkhUNmQWRM
	qLr75zawXJTdSs4h3t59J9y0/MN0Clr45rVFrd4MMwTfaolSvKr3c9jaO998S5cOLEKKg6LNzx/
	jQDqL5qXnL7KHbvMxicCxkh9RT3KjeAnRkkQMMjQFxu2jV44Q64x6s6HCy4iQUS8mNpfYSZF7mO
	ZauVJHysmBG1OrniSm/wN+2FIsXbnr2tFmOCJtDjK1g7USgsvSW31tR9DVqFyxU2a7HnSLBlpnV
	RqDK1g577UaSGQmJr8MoVMki1dHE/E3poYahc+1g9nE4ST5inivLFyaezT0ngRQpxkRbvIT5g=
X-Received: by 2002:a17:902:ef02:b0:2bf:139c:dcf3 with SMTP id d9443c01a7336-2c69c30a460mr423675ad.19.1781565487498;
        Mon, 15 Jun 2026 16:18:07 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6511sm103213235ad.24.2026.06.15.16.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:18:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:18:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org, Jason Gunthorpe <jgg@nvidia.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Declare eats_s1chk and eats_trans as
 host-endian u64
Message-ID: <ajCIKXu3WXBcvBqr@google.com>
References: <20260615194533.3290010-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615194533.3290010-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_161809_117771_C64A8B4E 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, Jun 15, 2026 at 12:45:33PM -0700, Nicolin Chen wrote:
> arm_smmu_get_ste_update_safe() declares the eats_s1chk and eats_trans
> locals as __le64, but initializes them from FIELD_PREP(), which returns a
> host-endian value, and passes them through cpu_to_le64() at the use sites.
> 
> Sparse reports the following warnings:
> 
> >> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1122:38: sparse: sparse: cast from restricted __le64
>    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1124:33: sparse: sparse: cast from restricted __le64
> 
> Declare both locals as u64 so the type matches FIELD_PREP() and the
> existing cpu_to_le64() at the use sites performs the host-to-little-endian
> conversion. No functional change.
> 
> Fixes: 7cad80048595 ("iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/all/202606151017.QU0evpH9-lkp@intel.com/
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8ce3e801eda3b..4c0f7b17b1f37 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -1240,9 +1240,9 @@ VISIBLE_IF_KUNIT
>  void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
>  				  __le64 *safe_bits)
>  {
> -	const __le64 eats_s1chk =
> +	const u64 eats_s1chk =
>  		FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_S1CHK);
> -	const __le64 eats_trans =
> +	const u64 eats_trans =
>  		FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS);

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

