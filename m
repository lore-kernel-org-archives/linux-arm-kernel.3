Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F822606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nl8UlJ2O;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=elH7mX4H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nt+81HHtiHnBiA7pn+cJHgsmdV5CCfFRd8Ev2wKd/3g=; b=Nl8UlJ2OuPp4LOZRz3+MdWrgHt
	3G4bNT4ZabUjMIw+ZwxMUdpx2KmBsY/O+zsmeV/fn0leA6BZCskLErl0R9nTlZOr+YTyhffzRlEvi
	0eFaQttsqMizz55rqre3cBx3Si5Uggr1ozmQZ4L16V1XlC2FOEIrTcjb9VAGoeyMs6E9/9OPa7PPi
	YR7CbuoZkuQrSmV4uow9sTZkCkBXBKtWkKM1raMtWfoJmYB883FjAG6mmOxQIGf0Awtk3RG8+QT1Z
	ru/9ma6yU4tDJx4jF0eWdEwxGe8iQjNgrl2qVMEIEvRLH+Dm385XOVLalH54FPBz5UckRfzV7CohV
	vDBP0oTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfkZ-00000006OxN-2gPs;
	Wed, 04 Nov 2026 18:30:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfkY-00000006OxB-1Cep
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:30:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9581A60A8D;
	Wed,  4 Nov 2026 18:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7D71F00919;
	Wed,  4 Nov 2026 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793817017;
	bh=Nt+81HHtiHnBiA7pn+cJHgsmdV5CCfFRd8Ev2wKd/3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=elH7mX4HK4EFG5r7P1A8+P4wn8bxjv1UqwezlkDMypNqjhfjhbPvSHKQCg32lP213
	 XfkMyjQKgQNxm0d5+g6Mct7o3aNxE6vlHgDxthdoXT20nPwMP5YaOU4xw/rUlQya+J
	 HZjXPIGPh3zgPuwLTgx5neURh0la1TP6CPCBsCaIOeLviJZCqR/5BIWL7eB81ANC1J
	 xIGPhyqvEDP4YyEd95zYj+tVFLfiAfYwFxWFBMBck3jJaIJIQFDdDQd2TyE66HfFsA
	 wAogChq8x0fzjQg6+WcCOxvQcflDvxNjSUgIKuQ56cg7R0BVqiFqx53YOCp4Y2vSQ+
	 MkGbdydfuhL+w==
Date: Wed, 4 Nov 2026 10:30:15 -0800
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the
 walk stopped
Message-ID: <aut5t605onnuBWfk@kernel.org>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-2-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124451.2148724-2-fuad.tabba@linux.dev>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fuad,

On Wed, Nov 04, 2026 at 12:44:50PM +0000, Fuad Tabba wrote:
> +u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> +				     u64 addr, u64 size)

Returning a signed value here would be a good idea so you can percolate
walk failures back up to the caller. Since that WARN_ON() below may as
well be a BUG_ON() in hyp code.

Otherwise, rest looks good.

Thanks,
Oliver

>  {
>  	struct kvm_pgtable_walker walker = {
>  		.cb	= stage2_free_walker,
>  		.flags	= KVM_PGTABLE_WALK_LEAF |
>  			  KVM_PGTABLE_WALK_TABLE_POST,
>  	};
> +	struct kvm_pgtable_walk_data data = {
> +		.walker	= &walker,
> +		.start	= addr,
> +		.addr	= addr,
> +		.end	= addr + size,
> +	};
>  
> -	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
> +	if (WARN_ON(_kvm_pgtable_walk(pgt, &data)))
> +		return addr + size;
> +
> +	return data.addr;
>  }
>  
>  void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1db10d8d6db73..4f1adadeffb8b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1011,8 +1011,8 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
>  
>  	do {
>  		next = stage2_range_addr_end(addr, end);
> -		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
> -							     next - addr);
> +		next = KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr, next - addr);
> +		next = min(next, end);
>  		if (next != end)
>  			cond_resched();
>  	} while (addr = next, addr != end);
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 016997288fd23..f21c3326dda68 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -499,14 +499,14 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
>  	return 0;
>  }
>  
> -void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> -					u64 addr, u64 size)
> +u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
> +				      u64 addr, u64 size)
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	pkvm_handle_t handle = kvm->arch.pkvm.handle;
>  
>  	if (!handle)
> -		return;
> +		return addr + size;
>  
>  	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
>  		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
> @@ -517,6 +517,8 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
>  	else
>  		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> +
> +	return addr + size;
>  }
>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 

