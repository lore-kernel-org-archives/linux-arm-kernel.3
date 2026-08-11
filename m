Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327E0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8oJSUuk7JJQu3+NU37IHhP1ZiUl6l3cGNRnaEM5rSc=; b=SZ3mmmvalwZd8sanQFEbNrClCH
	huxELnsC87GlZg7kL8visDOqWsEKu9nj4+6Hf9JLG3yDwnpOxTIxDXZcK89S3NLsG5FyM2funmdYs
	QRRlqN+I2INBYQOmN/2cGQVJVZbi9dS+OUbx50iSW8akg2D96j5dT8Ju/v5Wg0mVTRKYIPeubtPdw
	OymQsvuW0BvucVRb8wJt5aNQZ4RWV5ej2UJRpNODHO0iFYiOzt0c4UvGfxdj+V9C5Oewj1kZOwBy5
	Qk+cgcmdJ/yBDR5xRpAtTLHGDRiYridMzwSBm7NkHgJGY2S7KAavc6MaNo6SidSR6iYR/NbGXU+wS
	QTxwUUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtocf-0000000EMUg-2ShJ;
	Tue, 11 Aug 2026 15:42:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtocd-0000000EMU5-2yx2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:42:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26D1D1516;
	Tue, 11 Aug 2026 08:42:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 238EC3F632;
	Tue, 11 Aug 2026 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786462954; bh=N3qnRTjJztvg5epuOANhnoAI4KJvsaIW+sRapJAXN0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=am/mA1sK5zKjfitH7cRbZ87H8alzpMUQI8+jwTsN4PE48jXctVfydgElUScpeO1vs
	 IA80CRzE5RJn8gXG/Utun8MLlkKfIN7KX/969mbtdhU6KQffIXWp+B1Imv4mGyOkfF
	 8epE3AiaUl1z/9uja+Du7UQunHcap01bytZVtlU4=
Date: Tue, 11 Aug 2026 16:42:28 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 29/45] KVM: arm64: CCA: Support runtime faulting of
 memory
Message-ID: <antC5JOxDPs7i876@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-30-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803134403.80630-30-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_084235_838544_44A906B7 
X-CRM114-Status: GOOD (  20.35  )
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

On Mon, Aug 03, 2026 at 02:43:45PM +0100, Steven Price wrote:
> At runtime if the realm guest accesses memory which hasn't yet been
> mapped then KVM needs to either populate the region or fault the guest.
> 
> For memory in the lower (protected) region of IPA a fresh page is
> provided to the RMM which will zero the contents. For memory in the
> upper (shared) region of IPA, the memory from the memslot is mapped
> into the realm VM non secure.

Is this still true with in-place guestmem conversion?

> @@ -1693,7 +1709,14 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  	kvm_fault_lock(kvm);
>  	if (mmu_invalidate_retry(kvm, mmu_seq)) {
>  		ret = -EAGAIN;
> -		goto out_unlock;
> +		goto out_release_page;
> +	}
> +
> +	if (kvm_is_realm(kvm)) {
> +		prot &= ~KVM_PGTABLE_PROT_X;
> +		ret = realm_map_ipa(kvm, s2fd->fault_ipa, pfn,
> +				    PAGE_SIZE, prot, memcache);
> +		goto out_release_page;
>  	}

[...]

> +int realm_map_ipa(struct kvm *kvm, phys_addr_t ipa,
> +		  kvm_pfn_t pfn, unsigned long map_size,
> +		  enum kvm_pgtable_prot prot,
> +		  struct kvm_mmu_memory_cache *memcache)
> +{
> +	struct realm *realm = &kvm->arch.realm;
> +
> +	ipa = ALIGN_DOWN(ipa, map_size);
> +	if (!kvm_realm_is_private_address(realm, ipa)) {
> +		return realm_map_non_secure(kvm, ipa, pfn, map_size, prot,
> +					    memcache);
> +	}
> +
> +	/* It's impossible to map protected pages read-only. */
> +	if (WARN_ON(!(prot & KVM_PGTABLE_PROT_W)))
> +		return -EFAULT;
> +	return realm_map_protected(kvm, ipa, pfn, map_size, memcache);
> +}

I was trying to understand (with the help of some LLMs) to understand
whether we can end up on the do_gpf() path as a result of VMM actions.
The above kvm_realm_is_private_address() only checks for the IPA but
does not check against guestmem if the page is truly private. I probably
miss something but the scenario would be something like:

1. VMM creates the gmem region with GUEST_MEMFD_FLAG_MMAP |
   GUEST_MEMFD_FLAG_INIT_SHARED, mmap()able and GUP-pinnable

2. VMM starts an O_DIRECT write() from that mapping; the block layer
   FOLL_PINs the shared folio

3. VMM runs a vCPU so the realm touches the protected-IPA alias of the
   same gfn. gmem_abort() delegates the pinned, still-shared page to
   the RMM

4. The in-flight I/O then reads the now-Realm page from the kernel
   linear map. That access takes a GPF at EL1, so do_gpf() ->
   die_kernel_fault()

x86, IIUC, also checks kvm_gmem_is_private(). They also have
kvm_arch_gmem_make_private() triggered on the kvm_gmem_get_pfn() path
but I got lost in the call sites, not sure whether that's strictly
needed if we check both private IPA and kvm_gmem_is_private().

-- 
Catalin

