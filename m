Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFE1CD37AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 22:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXLiYME2DQTxz2pd/kx7mapaCXMWwSBAZuumfi0p9Io=; b=CBBdEa0mPQPriPcVPaANEgYTTg
	oazMOIlrWkjzyH3d/cYB434zTx0WpoYY1+JJNFdbuVt1nXY69l0VIoe+n9WwgHTLX8mTmDuJ0q7K/
	hPuD8gITlzkTurlCz/R6Iw0R4gdGiNZJ364UfUWi0xujxeqpVNGRtpSV/1TkLm3r3Kzc+VoteGADO
	AT1525JNI+YpXOdT7+pTgkPIQQxxtnCChAVFcJOY4gU8wOuL7JI+5VGcKdznAlJYv2HztZPUUm/Jl
	dXueFdxqiCGRypVO732NF7Hj0wUOGH0aLZY/iEUD4bYgYAAr5ijd09ylSdMGic12UFnWj4fBdpGFB
	PnBzwkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL7Ee-000000053Mt-2OYG;
	Thu, 07 May 2026 22:30:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL7Ec-000000053MM-0ygL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 22:30:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso19175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 15:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778193021; x=1778797821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXLiYME2DQTxz2pd/kx7mapaCXMWwSBAZuumfi0p9Io=;
        b=afsCly6mMnpIKF7/DqT4jtsPA1rvMZ8Ms+eJN99LIUHzpJVyFu6q2FXLta+xHnNw0W
         xJ0DDknBdekC1b75Pxd5FL7/V6T0ZfhecM3+MytiF5Li8pfDOaCM8OqmeFNgPwIFoBAh
         C7KYfmuHOSZ3g6l1iW0GEypFqMLk24KMp/l1EmafzYXw5G+qHkcXHSglihDl8hHAoETH
         oDK1i0qRtNLZWt0wVHPz/Q+u6EQWGqEepVjS+kh0B1Ypn2+A6W/8xcVm1W9DklL8t1yI
         dN+3RvFrTBAA/7c/blZW1LCIDN7n1NjPCYPTou2cZ5gxSLnFdRfcJdTosIATIvbvZts8
         Z70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778193021; x=1778797821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXLiYME2DQTxz2pd/kx7mapaCXMWwSBAZuumfi0p9Io=;
        b=I+foVhzVE5rxCySodzUxOV4gJ+G1DtBBhBuLxqqP3ynEqZMSsIyG41sVzVZwGeF0Se
         wP2lKf0DbF3vTl5VyWCmzYva9fVGRXcNPR4tmFYUyfI/xUefcZ1JobeaURO2pcMBLXTG
         uj+11QzlkXGDnhEg5iSaoEfq/w/Hl2krsaoy04iBVIal8iFvdit2uuSFfBzIG01qL5Sq
         +apyINzkTOM9kkvrczkFOm7xnPrZALo6KaM8vSEsXZvIlrNkNHGbwJx5JHkCzMJ/kxa+
         cxKkugmXEgTJIWIrriQGBouqDbyGC924F/K25I4TmrHW2myikeCYD1BTMAJJsq3JIGJs
         ocHw==
X-Forwarded-Encrypted: i=1; AFNElJ/fSoKtwV5l6viIqNcs27eFg1rlIehI7DBZHyzadWtvjdLDuO7i6I2ahMhtXllPysWvTrWCbr1I02eju0PaCIAn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy82P1h8O7VB72Kf41GTUfx+yh1BlM8lbNzboVvBwT1ue/Yv0gy
	6WIhiWlIVD+29Fc9LWS17F46qOten/eqcCctbIhU+8ksnIZ1If9BN9GUND41BG+woyP+Yxi2emI
	zuj8SNw==
X-Gm-Gg: Acq92OGla2A0M+eihMh8XqtmWbQRJXa6NNtfPEHIJ4HOq5qC3xxiTPdx1so6PoP3fKM
	7JpMhNG5jH0yeBThzOBTEtFD2Qy0n76gNXLD76SjJ/q8nc971blGHJqNABlor0We63wwRG8NrFh
	WnAFkF/76EFh+p24xvQwq3nanf8cRE2aygGvh2juziu2q3nI/qpY7VMBd2K1kr7AgGfZHnNM8nv
	a8663+RJJktZfKGjh6ts+0WvXGI+Eg4An+7VkKQT8J3YtkP2YCL7+qIWKOWmqSDhf3wF+JhMB8r
	TqDAJjIDG0gFENevjnuMzjjzNRrU+YnGOWsjGTinCFUakPfdu8fmvWkyE1x3F/GxXYSZKjQheOj
	JfkMjL6tPjeJjZ0FW5c5kvbwUBtjt+z6o54EQmMsAjfee3pkuOQcIDwoZmP57JS06nQlrIhHzv0
	tsseO6il3KoAs8InxRPJrjcExFDOzINBy/MoxjVQZRGVoD5aDk0u2E6WXbgJZLrT9pFZcV
X-Received: by 2002:a17:902:d50d:b0:2b2:5931:5950 with SMTP id d9443c01a7336-2bae9e68566mr1529465ad.16.1778193020571;
        Thu, 07 May 2026 15:30:20 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae788e042sm7614555ad.79.2026.05.07.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 15:30:19 -0700 (PDT)
Date: Thu, 7 May 2026 22:30:14 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Enable Hardware Access and
 Hardware Dirty bits
Message-ID: <af0SdkjQOZxnnaQb@google.com>
References: <20260503135413.1108138-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503135413.1108138-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_153022_281904_27D51C8A 
X-CRM114-Status: GOOD (  21.35  )
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

On Sun, May 03, 2026 at 06:54:12AM -0700, Nicolin Chen wrote:
> HTTU is introduced by utilizing the Dirty Bit Modifier (DBM) in the PTE.
> When kernel maps a clean but writable page, it will set PTE_READONLY and
> PTE_DBM (aka PTE_WRITE) at the same time. When a write occurs, an HTTU-
> capable MMU will automatically clear the PTE_RDONLY bit without software
> intervention.
> 
> On the other hand, SMMU has the same HTTU feature, yet it is not enabled
> in the SVA CD. As a result, SMMU will not clear the PTE_RDONLY bit while
> sharing the CPU page table, resulting in unnecessary stalls.
> 
> Thus, enable CTXDESC_CD_0_TCR_HA and CTXDESC_CD_0_TCR_HD in the SVA CD.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> index f1f8e01a7e914..1ed8a6f29dc44 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
> @@ -92,6 +92,16 @@ void arm_smmu_make_sva_cd(struct arm_smmu_cd *target,
>  
>  		target->data[1] = cpu_to_le64(virt_to_phys(mm->pgd) &
>  					      CTXDESC_CD_1_TTB0_MASK);
> +
> +		/*
> +		 * Enable Hardware Access and Dirty updates (DBM) if supported.
> +		 * This is safe to enable by default, as PTE_WRITE and PTE_DBM
> +		 * share the same bit.
> +		 */
> +		if (master->smmu->features & ARM_SMMU_FEAT_HA)
> +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HA);
> +		if (master->smmu->features & ARM_SMMU_FEAT_HD)
> +			target->data[0] |= cpu_to_le64(CTXDESC_CD_0_TCR_HD);

IIUC, we should be setting these if IO_PGTABLE_QUIRK_ARM_HD is present?

I think the driver maintains a clear distinction between HW capability 
(FEAT_HA/HD) and feature enablement (IO_PGTABLE_QUIRK_ARM_HD). 

We set IO_PGTABLE_QUIRK_ARM_HD during S1 domain finalize if 
IOMMU_HWPT_ALLOC_DIRTY_TRACKING flag is passed. Hence, we should check
for that flag OR IO_PGTABLE_QUIRK_ARM_HD before enabling these in CD..

Thanks,
Praan


