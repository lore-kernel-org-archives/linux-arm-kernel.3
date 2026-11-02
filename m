Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A34606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r38NsmEf;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fq3z+0eX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y32iSmbGTz0E5oS/dG/Labo61odv+YKvBCl04GBQBAY=; b=r38NsmEfR904KH+uHufGOI1GGO
	GN4v3l9HDUsIJHkcnFzDbpbeOqB1SOXXk2S4G+159iPg+xkzC6qJP2c5k5sHo9gL4wFLbyaJqfXBq
	FvRAgWRVfy6Ll20hA83z9F7muVW8tdltV5Hz5vuUrdAi9pgfpvSryGKIGXZupgZy4jZAr3UF+PYRv
	CFHZ94Zom9NxIXdSZ6Xo37Zzt6O8QNR9iUB3BWyW8t44cHlwRmdl1C2H4vNs0jQfGkTkdi3E51XK+
	YRWBrMsBUEl87y0bvGVGVbVBn0Akfe7CwZIfrPl8tO0NvNW+l34PT8UvvEgwSQY1m2lHO8REI84+i
	7eyzT31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsZD-0000000GhJc-36q2;
	Mon, 02 Nov 2026 13:59:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsZC-0000000GhJW-33u5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:59:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A943416C7;
	Mon,  2 Nov 2026 13:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457AE1F00A1B;
	Mon,  2 Nov 2026 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627958;
	bh=y32iSmbGTz0E5oS/dG/Labo61odv+YKvBCl04GBQBAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fq3z+0eX2Nm7fuJd+Ec4cgfwePS9nUUASThOtzzNdjBM9nuO5IQr3yXgk8tYA91ov
	 1BGJexP0cdOBJZHAClFKi3SUVj3rUy3KBiKeIvw796BP2cbTKFDR6jshBmqPWJzovD
	 4g1dpUuPn5YMWQ60JuBL64Mf4kdUPp7SlldDaRDf4UL1AXBDoFnyS65JUgLQtC58DI
	 lOJ8cKDr/co8RYH3lCJLqRuFuAjqwMTMK0mLKOfW7FNQr6m2bhWhrIKlk4wdAGZVq7
	 AaWwrU4vfvpkgGFtnsET4uYAXNTdHUKIOV7+0oCa9/dVWkijs0pkeg2jN3zNAJQ6Hd
	 9QaCpev1uG/MA==
Date: Mon, 2 Nov 2026 13:59:12 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault
 IPA
Message-ID: <auiXMN5td-2QlDkd@willie-the-truck>
References: <20261102094748.2638468-2-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102094748.2638468-2-ardb+git@google.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 10:47:49AM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> When a stage-2 permission fault doesn't report its IPA in HPFAR_EL2,
> __get_fault_info() recovers it with an AT S1E1R/S1E1A on FAR_EL2. If that
> fails, kvm_hyp_handle_memory_fault() goes straight back to the guest, on
> the assumption that the replayed access will either succeed or take a
> fault that the slow path can handle.
> 
> That assumption doesn't hold when the AT fails because its stage-1 walk
> takes a stage-2 fault on one of the guest's page-table pages, while the
> guest still holds a cached translation for the faulting VA. The guest
> doesn't walk its page tables, so it never takes the S1PTW fault that
> would let the slow path fix things up. It takes the same permission fault
> again, the AT fails again, and the vCPU livelocks in the world switch.
> 
> This was observed on Apple M2, which has no hardware Access flag
> management at stage 2, and no DIC, so execute permission is granted
> lazily and the first instruction fetch from a page takes a permission
> fault. With DAMON_STAT enabled (CONFIG_DAMON_STAT_ENABLED_DEFAULT=y),
> kdamond keeps sampling guest memory, and damon_pmdp_mkold() ages a whole
> PMD at a time through mmu_notifier_clear_young(). With THP-backed guest
> memory, kvm_age_gfn() therefore clears the stage-2 AF of 32MB of guest
> pages at once, without TLB invalidation. When that covers both freshly
> loaded code and the page-table page that maps it, the first instruction
> fetch from that code livelocks, and the vCPU only ever recovers when its
> thread happens to be moved to another CPU. In all 52 instrumented
> occurrences, the AT reported a stage-2 Access flag fault on a stage-1
> table walk (PAR_EL1.{S,PTW} = {1,1}, FST = Access flag fault, level 3),
> while an AT S12E1R on the same VA succeeded. With DAMON_STAT disabled,
> the AT didn't fail once in 210 boots. Nothing in this is specific to
> nested virtualisation, nor to instruction fetches: a write to a
> read-only memslot hit it too.
> 
> A stage-1 fault can lead to the same livelock. A guest that ages its own
> page tables without invalidating the TLB, as MGLRU does through
> ptep_test_and_clear_young(), can keep using a cached translation while
> the descriptor in memory has its Access flag clear. If such an access
> takes a stage-2 permission fault (lazy execute permission, or dirty
> logging), the AT reports a stage-1 Access flag fault (PAR_EL1.S = 0),
> which the guest never takes either, as it doesn't walk its page tables.
> This hasn't been observed, but it is why the invalidation below is done
> whenever the AT fails, rather than only when PAR_EL1.PTW reports a
> stage-2 fault on the walk. A guest that merely races with its own
> page-table updates isn't harmed by it: at worst, it takes a translation
> fault that it was allowed to take anyway.
> 
> Invalidate this VMID's TLB entries on the local CPU before replaying the
> access, so that the guest has to walk its page tables and takes the
> fault that the AT ran into: either a stage-2 fault on the page-table
> page, with a valid HPFAR_EL2, which the slow path resolves, or a stage-1
> fault, which the guest resolves itself. In all instrumented cases, the
> next exit was an S1PTW Access flag fault on the page-table page. This
> only happens when the AT fails, so the cost is negligible.
> 
> With this change, an EL2 UEFI guest that livelocked in 27 out of 210
> boots didn't hang once in 420 boots.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: Fuad Tabba <fuad.tabba@linux.dev>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Steffen Eiden <seiden@linux.ibm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Zenghui Yu <yuzenghui@huawei.com>
> 
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index e0c55644224c..4ba61b71d511 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -843,8 +843,21 @@ static inline bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
>  static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
>  					       u64 *exit_code)
>  {
> -	if (!__populate_fault_info(vcpu))
> +	if (!__populate_fault_info(vcpu)) {

Presumably we need a barrier (DSB?) here, to ensure that the TLBI happens
after the AT instruction?

> +		/*
> +		 * The AT couldn't resolve the IPA, typically because its
> +		 * stage-1 walk took a stage-2 fault, such as an Access flag
> +		 * fault on an aged page-table page. If the guest still has a
> +		 * cached translation for the VA, it won't take that fault
> +		 * itself, and would replay the same permission fault forever.
> +		 * Drop this VMID's TLB entries on this CPU, so that the replay
> +		 * walks the page tables and faults with a valid HPFAR_EL2.
> +		 */
> +		__tlbi(vmalls12e1);

Can we get away with an ALLE1 here, or do we really need to blow away the
whole lot?

Will

