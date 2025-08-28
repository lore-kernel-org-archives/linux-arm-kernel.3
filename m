Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E88CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7JaIyagrf5JVviam1SOhX4lrDrgcjZOjGrswLCcS44=; b=1bbMUxtS9Yrl5/gEMCzAsKfv/a
	aOY9uWoPERLeaxc2K8g/0NCWeoScfm8hPrkd+WzPWGzwL5xXYxMKf8AXtMhRL6flnyf2IgKnLOzMi
	qxIKE3zrGan6dUaWnyDvcHMt/dpoQbzSzwok+sy8FSfv/ROeCwZPQ1kgLF4CI1+Fib0UsrMDfCLlR
	Ll1fVg3I2zjNqH1jyttVva0aJtf9t/b8WAEY+RbR3uruAGVGBq9ZulVmPqJ0SdkLNb1RHAfi1j3Qk
	MO7nz0/P94hw7YZRlnQxNb+K25KQT7j3OnEws8qrinW/50aAwiUUmaXvzC80G5uDukC9M7DsilreJ
	Sfp4TOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWU-00000002oPR-1WeK;
	Thu, 28 Aug 2025 18:38:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdaT-00000001uii-0iyJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:26:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB28A4085E;
	Thu, 28 Aug 2025 14:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BB8C4CEF5;
	Thu, 28 Aug 2025 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756391208;
	bh=p5P8kAChBoN4WOlr76oijnY83blpFKG+JTaA6cgwwtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7kEKCt2emu8+T6n7qTfSORifJVoKQh2kg28pFXSWr0eYZyb/w6+Pb4ykjBXYLmm9
	 97jHgUVhwZWTzkgi/woAxVcFRSqNt76KPpYDjEo/EUHeq+X7Or7nKTgZZb078U0ARQ
	 no/xsYpiTG0WZghM96EE7TUKcqUIvqG8ZqxE6LONBXzI1oEaB9ZSsCRi7YWonu52OK
	 mYiGeIi4SmfWeptkTfY28Z5aL5e89Ptp3Wk4NECmiBSY/evwNnIG9qPCfRMJj6YBEZ
	 6xmANqqFEBrWPu+TgH7qlb/qozJe2OIv7rCaHx2IOvLG89vU7gWDeCHQGwDqPHiGPU
	 Ijmj0CkpirSdg==
Date: Thu, 28 Aug 2025 17:26:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "david@redhat.com" <david@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"tabba@google.com" <tabba@google.com>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"will@kernel.org" <will@kernel.org>,
	"vbabka@suse.cz" <vbabka@suse.cz>,
	"Cali, Marco" <xmarcalx@amazon.co.uk>,
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>,
	"Thomson, Jack" <jackabt@amazon.co.uk>,
	"Manwaring, Derek" <derekmn@amazon.com>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
Message-ID: <aLBnHwUN74ErKVjX@kernel.org>
References: <20250828093902.2719-1-roypat@amazon.co.uk>
 <20250828093902.2719-4-roypat@amazon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828093902.2719-4-roypat@amazon.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_072649_254279_C65FF8AE 
X-CRM114-Status: GOOD (  26.40  )
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

On Thu, Aug 28, 2025 at 09:39:19AM +0000, Roy, Patrick wrote:
> Add AS_NO_DIRECT_MAP for mappings where direct map entries of folios are
> set to not present . Currently, mappings that match this description are
> secretmem mappings (memfd_secret()). Later, some guest_memfd
> configurations will also fall into this category.
> 
> Reject this new type of mappings in all locations that currently reject
> secretmem mappings, on the assumption that if secretmem mappings are
> rejected somewhere, it is precisely because of an inability to deal with
> folios without direct map entries, and then make memfd_secret() use
> AS_NO_DIRECT_MAP on its address_space to drop its special
> vma_is_secretmem()/secretmem_mapping() checks.
> 
> This drops a optimization in gup_fast_folio_allowed() where
> secretmem_mapping() was only called if CONFIG_SECRETMEM=y. secretmem is
> enabled by default since commit b758fe6df50d ("mm/secretmem: make it on
> by default"), so the secretmem check did not actually end up elided in
> most cases anymore anyway.
> 
> Use a new flag instead of overloading AS_INACCESSIBLE (which is already
> set by guest_memfd) because not all guest_memfd mappings will end up
> being direct map removed (e.g. in pKVM setups, parts of guest_memfd that
> can be mapped to userspace should also be GUP-able, and generally not
> have restrictions on who can access it).
> 
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---
>  include/linux/pagemap.h   | 16 ++++++++++++++++
>  include/linux/secretmem.h | 18 ------------------
>  lib/buildid.c             |  4 ++--
>  mm/gup.c                  | 14 +++-----------
>  mm/mlock.c                |  2 +-
>  mm/secretmem.c            |  6 +-----
>  6 files changed, 23 insertions(+), 37 deletions(-)
> 
> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index e918f96881f5..0ae1fb057b3d 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -4,28 +4,10 @@
>  
>  #ifdef CONFIG_SECRETMEM
>  
> -extern const struct address_space_operations secretmem_aops;

Please also make secretmem_aops static in mm/secretmem.c

> -static inline bool secretmem_mapping(struct address_space *mapping)
> -{
> -	return mapping->a_ops == &secretmem_aops;
> -}
> -

...

> diff --git a/mm/gup.c b/mm/gup.c
> index adffe663594d..8c988e076e5d 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1234,7 +1234,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
>  	if ((gup_flags & FOLL_SPLIT_PMD) && is_vm_hugetlb_page(vma))
>  		return -EOPNOTSUPP;
>  
> -	if (vma_is_secretmem(vma))
> +	if (vma_is_no_direct_map(vma))
>  		return -EFAULT;
>  
>  	if (write) {
> @@ -2751,7 +2751,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  {
>  	bool reject_file_backed = false;
>  	struct address_space *mapping;
> -	bool check_secretmem = false;
>  	unsigned long mapping_flags;
>  
>  	/*
> @@ -2763,14 +2762,6 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
>  		reject_file_backed = true;
>  
>  	/* We hold a folio reference, so we can safely access folio fields. */
> -
> -	/* secretmem folios are always order-0 folios. */
> -	if (IS_ENABLED(CONFIG_SECRETMEM) && !folio_test_large(folio))
> -		check_secretmem = true;
> -
> -	if (!reject_file_backed && !check_secretmem)
> -		return true;
> -
>  	if (WARN_ON_ONCE(folio_test_slab(folio)))
>  		return false;

There's a check for hugetlb after this and a comment there mentions
secretmem, please update that to "mapping with no direct map" or something
like that.

-- 
Sincerely yours,
Mike.

