Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C760A2610
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ygXt/5P9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muxb5d4o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUDDCCeo/xzsRa4qQI+rhPZ7oVj1XJXfhtbwBRYdfes=; b=ygXt/5P99Wu3WDabM6eaKFhR84
	LKyzkb8UKleXIuApy+R5T2fgD99xv/WiiV9nZ5fgetC41CF81o2JHVXKU5ffUecxYmCq4mPOPtPDV
	zbs86pvjpJps6GJde3KMeRcSfvkNrDPNvjc4Gn0NH+dKvbX8m5wEpnr5QfrpqACzoaTLO3pboEiq1
	QoNQIyrKeD4I0oXtNAXofpOS8uJBOR78Lyk+cXYAqcPKfldBWot2bPwwRGfNqGDTHXIrRM763N4m8
	Zng5m4HJLt1cvrutSI2a/PEQXq+urBWAaQNUrBybVGJVPn7ClbDhrfCZ6Uhe1lj1HQ7KfAqH/llwQ
	ZXCRs5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8U1-00000009bf3-3nJl;
	Tue, 20 Oct 2026 11:58:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8U0-00000009bdS-2TBE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:58:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58DD543459;
	Tue, 20 Oct 2026 11:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA76E1F000C6;
	Tue, 20 Oct 2026 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497500;
	bh=wUDDCCeo/xzsRa4qQI+rhPZ7oVj1XJXfhtbwBRYdfes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=muxb5d4o2qlr8O9BcDWx2nvGEWrRVgRounbDRnVYUFFXnBbWIu0Zy7ynHugFphuVm
	 yqzEEN5rGnb95iZxl5u0HHDmktwC89C/65jsjdSb52v0EKM2qFi+7rfvF8VSmixm7m
	 gi6pqYU2wLrZkIZTqpa8flBZdL8niOugsTzf0981BAbrWy370EE42BXQ9kOdN3BOxu
	 Wqm86rZBgDQ97v0cXOApZyKN3VSfXikRPc7orwxUbx2GtjDS98ayOWkHciHhz045gt
	 iK9RU9kpusVv/lWplJtJBwxFrK6CuOdZ5tv237FMsknk+qYaCHOpdLNJtL3ngR0Idb
	 xgu8N5g7I052Q==
Date: Tue, 20 Oct 2026 12:58:13 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Price <steven.price@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, David Hildenbrand <david@kernel.org>, 
	Fuad Tabba <tabba@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
Message-ID: <atdWIpk9Qh8ngs-Y@gremlin>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-3-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019132103.3836646-3-fuad.tabba@linux.dev>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 02:21:02PM +0100, Fuad Tabba wrote:
> When KVM_ARM_MTE_COPY_TAGS copies tags into a page, it marks the page as
> tagged. For a hugetlb folio the flag covers every page in the folio. If
> the folio wasn't tagged yet, its other pages are marked as tagged with
> their previous owner's tags still in place. The stage-2 fault path then
> maps them into the guest without clearing them. The ioctl's read side
> also copies them out to the VMM.
>
> Clear the whole folio on its first tagging, before copying in this
> page's tags.
>
> Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Logic LGTM, with some nits below:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/kvm/guest.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index b01d6622b8720..cda655fbff657 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1012,6 +1012,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		void *maddr;
>  		unsigned long num_tags;
>  		struct folio *folio;
> +		unsigned long i;
>
>  		if (!page) {
>  			ret = -EFAULT;
> @@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  			/*
>  			 * Only locking to serialise with a concurrent
>  			 * __set_ptes() in the VMM but still overriding the
> -			 * tags, hence ignoring the return value.
> +			 * tags. A hugetlb folio is marked tagged as a whole,
> +			 * so its first tagging clears every page.
>  			 */
> -			if (folio_test_hugetlb(folio))
> -				folio_try_hugetlb_mte_tagging(folio);
> -			else
> +			if (!folio_test_hugetlb(folio))
>  				try_page_mte_tagging(page);
> +			else if (folio_try_hugetlb_mte_tagging(folio))

Slightly awkward logic, testing a negative then the negative of the negative
(i.e. else) plus folio_try_hugetlb_mte_tagging(), makes it a little harder to
understand.

With mte_clear_folio_tags() you can make life simpler:

	if (folio_test_hugetlb(folio)) {
		if (folio_try_hugetlb_mte_tagging(folio))
			mte_clear_folio_tags(folio);
	} else {
		try_page_mte_tagging(page);
	}

> +				for (i = 0; i < folio_nr_pages(folio); i++)
> +					mte_clear_page_tags(page_address(folio_page(folio, i)));

As above, similar comment to 1/3 re: mte_clear_folio_tags(). Would be less churn also.

>  			num_tags = mte_copy_tags_from_user(maddr, tags,
>  							MTE_GRANULES_PER_PAGE);
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

