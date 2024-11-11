Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619E4D3ABD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hitbiip927ZlE1N1pRkjC+rwZzAGGedEv6fqaAmsc8U=; b=zNuClMZg99sqqjQLumVkTe8rcH
	FJbC5oCIUx7TnKjz+Mb38RtlA2jbWLfBRsB9VZythPp2B/7tRpDsQrGYF3N0sA1ihdTCslrMFTafa
	22fbPITU/al/x7+6JvezKTvPY0tJIY/CdshNuyM5+SclNViS3Jges7/dJMw/33k5YpQpaILeafQZZ
	YjVGPa3vRFb0eM6CMatlnsUKLgk32Es+7wcV6ytOO8dFNFC8lk57vxpFSd0AVr2WMRglhUmLOz/zw
	ep8xAGFSBlqGzVGk/NDQXwx93alCzuqgMbSHYWztg3hEO1aIe1G5YpJf2sHGMZHNx337QslaPvmtp
	o8tBKBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYE6-00000000iuB-0JCO;
	Mon, 11 Nov 2024 17:29:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYCJ-00000000ido-33YT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 17:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A09595C5B98;
	Mon, 11 Nov 2024 17:26:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17564C4CED4;
	Mon, 11 Nov 2024 17:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731346050;
	bh=yPHiLObYI0GzgVmZx9V+BDXuqHJOKGxIwZ+zr2HX6/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVN2h6VpNWM0AL02RbIg+71VTiLluRhqUEJ1eJf91KNAB+zyRt+qD//VjALzkACGh
	 DB674Tlwe22MmS3iYBIHShc8TS/jZfJqEt/wWFHidvkzkqVudoShq52ExK4eA5ijoG
	 aDOH08410gLq1DsLVjDoywPUwSn3Hf8zuKkumkkuSmD4Lf2pV4GmlmWXgxSzn1yjzh
	 j5Tb9ynIjBkQv44WVsRaTtnP4r8+hzQ1dY+1h3KGf4AaqUb94ipEMGGcnJDFUSMa7p
	 XkcVFA36MZ/RNlSsmvr130ZVkAMW6DYqMEbx+E2HPCJZ+f5s+v6m4BeajXvPl+hd8t
	 +yClzXB/DdmYw==
Date: Mon, 11 Nov 2024 17:27:25 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 4/6] arm64/kvm: Avoid invalid physical addresses to
 signal owner updates
Message-ID: <20241111172725.GA20336@willie-the-truck>
References: <20241111083544.1845845-8-ardb+git@google.com>
 <20241111083544.1845845-12-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111083544.1845845-12-ardb+git@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_092731_876985_1D5F6DCC 
X-CRM114-Status: GOOD (  31.96  )
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

On Mon, Nov 11, 2024 at 09:35:48AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The pKVM stage2 mapping code relies on an invalid physical address to
> signal to the internal API that only the owner_id fields of descriptors
> should be updated, which are stored in the high bits of invalid
> descriptors covering memory that has been donated to protected guests,
> and is therefore unmapped from the host stage-2 page tables.
> 
> Given that these invalid PAs are never stored into the descriptors, it
> is better to rely on an explicit flag, to clarify the API and to avoid
> confusion regarding whether or not the output address of a descriptor
> can ever be invalid to begin with (which is not the case with LPA2).
> 
> That removes a dependency on the logic that reasons about the maximum PA
> range, which differs on LPA2 capable CPUs based on whether LPA2 is
> enabled or not, and will be further clarified in subsequent patches.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kvm/hyp/pgtable.c | 37 ++++++++------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index b11bcebac908..4bf618b2cba7 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -35,14 +35,6 @@ static bool kvm_pgtable_walk_skip_cmo(const struct kvm_pgtable_visit_ctx *ctx)
>  	return unlikely(ctx->flags & KVM_PGTABLE_WALK_SKIP_CMO);
>  }
>  
> -static bool kvm_phys_is_valid(u64 phys)
> -{
> -	u64 parange_max = kvm_get_parange_max();
> -	u8 shift = id_aa64mmfr0_parange_to_phys_shift(parange_max);
> -
> -	return phys < BIT(shift);
> -}
> -
>  static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx, u64 phys)
>  {
>  	u64 granule = kvm_granule_size(ctx->level);
> @@ -53,7 +45,7 @@ static bool kvm_block_mapping_supported(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (granule > (ctx->end - ctx->addr))
>  		return false;
>  
> -	if (kvm_phys_is_valid(phys) && !IS_ALIGNED(phys, granule))
> +	if (!IS_ALIGNED(phys, granule))
>  		return false;
>  
>  	return IS_ALIGNED(ctx->addr, granule);
> @@ -587,6 +579,9 @@ struct stage2_map_data {
>  
>  	/* Force mappings to page granularity */
>  	bool				force_pte;
> +
> +	/* Walk should update owner_id only */
> +	bool				owner_update;
>  };
>  
>  u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
> @@ -885,18 +880,7 @@ static u64 stage2_map_walker_phys_addr(const struct kvm_pgtable_visit_ctx *ctx,
>  {
>  	u64 phys = data->phys;
>  
> -	/*
> -	 * Stage-2 walks to update ownership data are communicated to the map
> -	 * walker using an invalid PA. Avoid offsetting an already invalid PA,
> -	 * which could overflow and make the address valid again.
> -	 */
> -	if (!kvm_phys_is_valid(phys))
> -		return phys;
> -
> -	/*
> -	 * Otherwise, work out the correct PA based on how far the walk has
> -	 * gotten.
> -	 */
> +	/* Work out the correct PA based on how far the walk has gotten */
>  	return phys + (ctx->addr - ctx->start);
>  }
>  
> @@ -908,6 +892,13 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
>  	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
>  		return false;
>  
> +	/*
> +	 * Pass a value that is aligned to any block size when updating
> +	 * only the owner_id on invalid mappings.
> +	 */
> +	if (data->owner_update)
> +		phys = 0;
> +

Hmm, isn't this a change in behaviour? Previously we would always store
the owner annotations at the leaf, but now this will take place at a
higher-level. I think that probably goes horribly wrong if we later
try to change the owner for a sub-range; the block will be replaced with
a table and the old ownership information will be lost rather than
propagated to the leaves.

In other words, I think we should return false here.

Will

