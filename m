Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8028E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWI4BclBEwi8c7CnutzEsogHCRFOOVdxaZjrlfD5DqM=; b=320S6FwV7fCf7aJhiMZw1Hx1zt
	4sQDZy4JCULYOboD+uAHVd1rmbIl5jKfzyoiDIUYUw9WYbs97P5+WFWyt/O/kf12usGouyXiylcox
	iurwCrja9AbNsTEF8+SIeb9lqomEjvbJI+rgFc3LyuOibEmqb9poBX9VuqUF3IcSGXU7tks7/kLEK
	X3ZgtGhC9Pxevsb4l+OP8aunPrWAL6/NLL6GLz5F5hksi3T/Xsx1Tmg1pwpEw0U8RVtPFqc2lLXjd
	zwtH/+wkG/3TrFeLES6BwCp5Vgw3BrNSr9SktolToDc+AJzAjqGCi3HD/s9TtvvlOYSHjOmfENrI/
	hnz9rgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUzh-0000000GHu6-1fS2;
	Wed, 11 Dec 2024 22:15:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUyd-0000000GHls-1Jrk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 22:14:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1750DA41BC0;
	Wed, 11 Dec 2024 22:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0556EC4CED2;
	Wed, 11 Dec 2024 22:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733955278;
	bh=ujediMw0TOstHDqQ4ofl4N4ln4S6/UT8wG3QPLJUwnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvgc3+ykVPQJjeZiDDPCAOUUxdcVCqUGXxD1JCBw8OmFDY6LTvIDIQ2g2Hxunbvtu
	 T0QEPB5173T5k98uaK0WbHFInkcntyKlyr8JFTY3RiRzL9J4cdItxDTvzIqBJ78H9I
	 RSxqtdrVQRAJ4Y86PoFEf+Umjt9OqPPdtz73HTulR3FJeroFE6gRyJyx30Ogk/iz7M
	 StjJi86/QGxuucEJ1l2gcG4LbooKw5Zwb9+1uysOvE7TAVGuyFQVA/EEkvDYTVkU3y
	 6A3cekqTwwNWrzq0JIoZtD06iw8yLKOEJotWpjWdQbxmPof2s2E3NjachGtGX5CEPI
	 YeYl4v+eGLbWw==
Date: Wed, 11 Dec 2024 22:14:32 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v2 4/6] arm64/kvm: Avoid invalid physical addresses to
 signal owner updates
Message-ID: <20241211221431.GG17486@willie-the-truck>
References: <20241205150229.3510177-8-ardb+git@google.com>
 <20241205150229.3510177-12-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205150229.3510177-12-ardb+git@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_141439_497509_A0D7377F 
X-CRM114-Status: GOOD (  27.50  )
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

Hi Ard,

On Thu, Dec 05, 2024 at 04:02:34PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The pKVM stage2 mapping code relies on an invalid physical address to
> signal to the internal API that only the owner_id fields of descriptors
> should be updated, and these are stored in the high bits of invalid
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
> Cc: Quentin Perret <qperret@google.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/kvm/hyp/pgtable.c | 33 ++++++--------------
>  1 file changed, 10 insertions(+), 23 deletions(-)

Sorry that I didn't reply again on v1, but I have an annoying request
that would make this a little easier for me to follow (since I'm tainted
with the pKVM stack in Android that we're gradually landing upstream):

> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 40bd55966540..0569e1d97c38 100644
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

Can you rename this to "annotation", please? We'll eventually land other
types of invalid pte than ownership (e.g. MMIO_GUARD) and, given that
the ownership walker is caught by the 'force_pte' flag, it's a little
more generic.

Again, apologies I didn't ask for this earlier.

Will

