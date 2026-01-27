Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E410D25931
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naGEpDNYDaXGHhJAE4TwVjdVuEzUP3s5tDCBxkUlRGM=; b=KmUwdDRrBs+G3Uidifnl114Ebw
	1Ky8VoDnsRMbpaRSonIBFNHqLkTBXmjkeMuyeEx0Cf4DqMo43X/QVjI9IM/LNRRa8AQ/4EZX4LrVu
	3sjzJTuB4OHBbOwAGSw7Wd/4XM+FVsiNHvrpiPaxCzPvB+hGGqP5wrWA6w+XOxqo0wFD512Fi4kXw
	/yOZ9htpRy5YrlwCHfnInnq1PRPJMeKW7/9BbvjkWTFnXOfSXYvsyYneoVjOsLlj1fJSkak21+TUf
	xZL1hYlQBMOT2t2yxqlDfld/SM8MgEV6VpVyeuMKxwTesJZH4SrxvJxxYqksyocRzb/fyBLFJn102
	ye9Z3iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkksZ-0000000EXMt-16Ga;
	Tue, 27 Jan 2026 15:21:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkksX-0000000EXMH-0NuU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:21:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B518B1596;
	Tue, 27 Jan 2026 07:21:08 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C39643F632;
	Tue, 27 Jan 2026 07:21:13 -0800 (PST)
Date: Tue, 27 Jan 2026 15:21:08 +0000
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 06/20] KVM: arm64: Inherit RESx bits from FGT register
 descriptors
Message-ID: <20260127152108.GA2685766@e124191.cambridge.arm.com>
References: <20260126121655.1641736-1-maz@kernel.org>
 <20260126121655.1641736-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126121655.1641736-7-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_072117_189656_9229B037 
X-CRM114-Status: GOOD (  16.10  )
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

On Mon, Jan 26, 2026 at 12:16:40PM +0000, Marc Zyngier wrote:
> The FGT registers have their computed RESx bits stashed in specific
> descriptors, which we can easily use when computing the masks used
> for the guest.
> 
> This removes a bit of boilerplate code.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/config.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index a907195bd44b6..8d152605999ba 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1344,6 +1344,11 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
>  	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
>  				 require, exclude);
>  
> +	if (r->feat_map.flags & MASKS_POINTER) {
> +		resx.res0 |= r->feat_map.masks->res0;
> +		resx.res1 |= r->feat_map.masks->res1;
> +	}
> +
>  	tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
>  
>  	resx.res0 |= tmp.res0;
> @@ -1424,47 +1429,36 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
>  	switch (reg) {
>  	case HFGRTR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hfgrtr_desc, 0, 0);
> -		resx.res1 |= HFGRTR_EL2_RES1;
>  		break;
>  	case HFGWTR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hfgwtr_desc, 0, 0);
> -		resx.res1 |= HFGWTR_EL2_RES1;
>  		break;
>  	case HFGITR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hfgitr_desc, 0, 0);
> -		resx.res1 |= HFGITR_EL2_RES1;
>  		break;
>  	case HDFGRTR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hdfgrtr_desc, 0, 0);
> -		resx.res1 |= HDFGRTR_EL2_RES1;
>  		break;
>  	case HDFGWTR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hdfgwtr_desc, 0, 0);
> -		resx.res1 |= HDFGWTR_EL2_RES1;
>  		break;
>  	case HAFGRTR_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hafgrtr_desc, 0, 0);
> -		resx.res1 |= HAFGRTR_EL2_RES1;
>  		break;
>  	case HFGRTR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hfgrtr2_desc, 0, 0);
> -		resx.res1 |= HFGRTR2_EL2_RES1;
>  		break;
>  	case HFGWTR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hfgwtr2_desc, 0, 0);
> -		resx.res1 |= HFGWTR2_EL2_RES1;
>  		break;
>  	case HFGITR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hfgitr2_desc, 0, 0);
> -		resx.res1 |= HFGITR2_EL2_RES1;
>  		break;
>  	case HDFGRTR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hdfgrtr2_desc, 0, 0);
> -		resx.res1 |= HDFGRTR2_EL2_RES1;
>  		break;
>  	case HDFGWTR2_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hdfgwtr2_desc, 0, 0);
> -		resx.res1 |= HDFGWTR2_EL2_RES1;
>  		break;
>  	case HCRX_EL2:
>  		resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
> -- 
> 2.47.3
> 

