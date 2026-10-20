Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA404606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W3Vp42yC;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVOMiTJs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKWmJgLEWxzvGFYBH7caDkZqJJLLMNe4m0yrs2VTkfw=; b=W3Vp42yCIJ6RA3mLuEjUkHgykw
	WdBWGLiKWDtwpeXIoYBwhrRXx9I1KV5jHyx6L59vUEY5aw80Dzu8iSE4t0PIl8TfflqYYYMprIrEW
	alScCgS81mos6wZ7YR/gbzmZSUsfh5JI6wO9Yo/OrY4x5pttXakCHD6xgBg/owQunFZR3d8NZyU05
	UXw/RKMbfnZoAxUTNkeUhupsoplcr8aazwKIvLjqkx6AMKa/UOfxOs2eDk74eRKA9OwIUjhsr+Gxn
	aq+EWOoPgCgEtEoUHiWYRoIEzwjGcl7q2JDJGiFSIDutB0nuNZ6RE5yAdjcckM0DiLaFSYGjrkDYf
	hHhzI5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8jK-00000009dxJ-3PvR;
	Tue, 20 Oct 2026 12:14:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8jJ-00000009dwv-27PP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 12:14:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8987360A65;
	Tue, 20 Oct 2026 12:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46CD1F000C9;
	Tue, 20 Oct 2026 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792498448;
	bh=dKWmJgLEWxzvGFYBH7caDkZqJJLLMNe4m0yrs2VTkfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EVOMiTJsZ+bQ2IrY4bPM+M+hVd2hhFQQ9aVfFMY0JgfnRA2l29X+k+VIf+MGSOuKu
	 27oIPN65A5V42ZMY+dH6zH0ezrpezSTg/l37aPFH9ChezKOmfSnhaFSKj1156XdpbY
	 TyXC8/cYJqvdoYVP/+/QQNWOegZMbPzj/SOIU8fQG5bsNZMMwVQB/0xkPVUno3ZGrT
	 gDUEwXNAZFfmwbq3W+RP3x2b36GOO/2cwJkbwis7WsA9ToGDsIVXfGGxZPVCDjFbEi
	 NlyV+/Ipn9tQLVj/6zT5HUfdC3716FdDdKNvZsQtBjAiWn8z6HiaJ8/aOtoMVxIrnx
	 3xOyC5lQnZmOQ==
Date: Tue, 20 Oct 2026 13:14:01 +0100
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
Subject: Re: [PATCH 3/3] KVM: arm64: Sanitise MTE tags when a permission
 fault installs a mapping
Message-ID: <atdXdtXXTH-6DWVt@gremlin>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-4-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019132103.3836646-4-fuad.tabba@linux.dev>
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

On Mon, Oct 19, 2026 at 02:21:03PM +0100, Fuad Tabba wrote:
> The stage-2 fault path sanitises MTE tags only on translation faults, as
> a permission fault normally just relaxes an existing leaf. However, when
> the page is backed by a THP, a permission fault at page granule installs
> a block whose other pages may never have been mapped or sanitised. Once
> dirty logging is off, a guest write to a page mapped read-only during
> logging installs the block, and the guest can read the tags those pages'
> previous owners left.
>
> Sanitise whenever the fault path calls kvm_pgtable_stage2_map() rather
> than relaxing permissions. If the VMM replaces the VMA after the guest
> takes a permission fault but before vma_lookup(), that path would map
> and sanitise memory from the new VMA without checking it. Run the
> VM_MTE_ALLOWED check in kvm_s2_fault_compute_prot() on permission
> faults too.
>
> Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")

Yikes! It goes quite far back :)

> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Nits below, but with those addressed LGTM and:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/kvm/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 48a08b608ea72..208fcae80f67f 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2005,7 +2005,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>  	if (s2fd->nested)
>  		*prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
>
> -	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
> +	if (!s2vi->map_non_cacheable && kvm_has_mte(kvm)) {

OK so doing this check on permission faults too.

>  		/* Check the VMM hasn't introduced a new disallowed VMA */
>  		if (!s2vi->mte_allowed)
>  			return -EFAULT;
> @@ -2060,7 +2060,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  		}
>  	}
>
> -	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
> +	if (mapping_size != perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))

So 'translation fault or permission fault if this will install a mapping' rather
than 'translation fault' alone right?

Just after this code you have:

	if (mapping_size == perm_fault_granule) {
		...
	} else {
		...
	}

So you could put

		if (!s2vi->map_non_cacheable && kvm_has_mte(kvm))
			sanitise_mte_tags(kvm, pfn, mapping_size);

In the else branch? Seems neater and clearer.

Also I wonder if the !s2vi->map_non_cacheable && kvm_has_mte(kvm) check could be
abstracted?

E.g.:

static bool is_mte_fault(const struct kvm *kvm,
		         const struct kvm_s2_fault_vma_info *s2vi)
{
	return !s2vi->map_non_cacheable && kvm_has_mte(kvm);
}

Then could be:

	if (is_mte_fault(kvm, s2vi))
		sanitise_mte_tags(kvm, pfn, mapping_size);

>  		sanitise_mte_tags(kvm, pfn, mapping_size);
>
>  	/*
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

