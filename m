Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA22606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PFhTmFz/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zd+Vs3ar
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUALFoCPuP4ag/Wm4Tjk9NReNJDOBGhLi2LnL7PxTOU=; b=PFhTmFz/4zt8u53Q1B9iQjWrrT
	6MtWGMMcrTwvbT4JvZzOpuc81tofmcOCh6nER2JQBHqJdGq48uI38ahUjM2jqRan/qaB0FvMKXNLP
	Xh2vipeRARjeSOmsURy+khQjy2GNoJDDSdhsaLm9L/cMs7DPt94CcAvKaM2mg22x+9CbB0t2M/L52
	qby6IbDWY08Bf+sKoE0Kc5uYZkhGYVEsY64FUxpsKdJ5eVYvdgd1UbyYDAlIsCafYuwBzQ83CGuQT
	6VANyui3BrgX5AHsPA5+3B9VmGOj8bpqVeht8fyX0MmsnYgSbj67jseVsYNH/KvIa1Lm3CSkxqsrz
	irNJqEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Ou-00000009awv-14t2;
	Tue, 20 Oct 2026 11:53:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Os-00000009awd-3j4e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:53:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56EC660142;
	Tue, 20 Oct 2026 11:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B9F1F000C5;
	Tue, 20 Oct 2026 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497182;
	bh=RUALFoCPuP4ag/Wm4Tjk9NReNJDOBGhLi2LnL7PxTOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zd+Vs3arajwy5+WYD3opiB8R/t/y46x74me9H0tC1BGifbOJmn88NfzmfaqKDZUd4
	 j26wSB6R1aWrD3VYYBKd5/jmlYe7tCEDsTxnmkzRnq8QRw31nuxmU/4SFX912KrfId
	 9ih5O9VeW7igCxlpsg6/Ll4WWo2hzVj4FonYaRvAQODRnyPJHCp3+xrq83sllTOWXI
	 IDzmDheO2Yyve6GD2lwlMOaAWdQ8UF3fbkNnCqccUvfnT47+T7CCsys3P79oCwyhJw
	 JsaJ3GsV1i3NXaSOLRH6Z7hSsHNWKgJNKtJgbGXNtLf5bdYhlWJPrCcVzyKFD7xjmI
	 OeKsHNeVVcB+A==
Date: Tue, 20 Oct 2026 12:52:54 +0100
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
Subject: Re: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
Message-ID: <atdUzfOA1Obd7Mir@gremlin>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019132103.3836646-2-fuad.tabba@linux.dev>
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

hugetlb strikes again... :) the mm part of me apologises ;)

On Mon, Oct 19, 2026 at 02:21:01PM +0100, Fuad Tabba wrote:
> sanitise_mte_tags() clears the tags of the pages about to be mapped at
> stage-2 before marking them tagged. For a hugetlb folio the flag covers
> every page in the folio, but the loop only covers the mapping being
> installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
> sizes, and for any size under dirty logging. The first fault then marks
> the whole folio after clearing only its own piece, and the rest keeps
> its previous owner's tags for the guest to read.

I'm guessing the folio size is always >= size here?

>
> Clear the whole folio, as mte_sync_tags() does.
>
> Fixes: 25c17c4b55def ("hugetlb: arm64: add mte support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Some nits below but generally looks sensible to me so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/kvm/mmu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ba86450fe4af..48a08b608ea72 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1514,7 +1514,8 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
>  	if (folio_test_hugetlb(folio)) {
>  		/* Hugetlb has MTE flags set on head page only */

Is this comment redundant now?

>  		if (folio_try_hugetlb_mte_tagging(folio)) {
> -			for (i = 0; i < nr_pages; i++, page++)
> +			page = folio_page(folio, 0);
> +			for (i = 0; i < folio_nr_pages(folio); i++, page++)

I know it's a stable fix, but the fact that this pattern exists in multiple
places really argues for a mte_clear_folio_tags(), which would make this
trivially:

	mte_clear_folio_tags(folio);

And avoid the re-use of page etc.

It's not a huge change and makes the next patch in the series simpler too so
arguably could be part of the series?

>  				mte_clear_page_tags(page_address(page));
>  			folio_set_hugetlb_mte_tagged(folio);
>  		}
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

