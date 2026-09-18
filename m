Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEB5C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQHF9XEf81bg9pmaUlMXRgBea1BKwvIoqVt8XWGMZc4=; b=UGeOAKF5veF5IEAWAOxfYhgInX
	JFIegYMiCmJxgZpIX1uie0/RarScHFNfY38LGjJCcyr/mxoupmnF7TnytdcDq5JQMNG1jyduqQOAJ
	75yi1M1CTDVTkLvvv/OT3K8qkO1iaH0Cw9Ls2VaEgKiZVqU1PLZfZiHhpTeRHwi6yp26E67tgcMj2
	Et0ABB/14GQwshFE69yTfHGSiOev62QQuqSSQod3m1pFgq48ENRBIu/Fsv7AATA/yq9ipBANvOWfP
	akZieXmZtviQz0zmN09NYbVtbAt6h/QsnXK5vhxCtVf4zEAefWp+Y58zeqstnDOAx05PqtPN87GOT
	jd81vunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bAq-0000000EyN4-1Osg;
	Fri, 18 Sep 2026 16:10:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bAo-0000000EyMn-3qb2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:10:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B889601EF;
	Fri, 18 Sep 2026 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0E91F000FF;
	Fri, 18 Sep 2026 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789747849;
	bh=GQHF9XEf81bg9pmaUlMXRgBea1BKwvIoqVt8XWGMZc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NL6U55JKwzRy3tNxfSVmSbKufqK/IcyzxsUmIgQlgIlaEPuUmII44cmE3XVzOCAPA
	 fTejI+2W9y+5mTLLyh3QkjkzL2EvBlp1SDW517G5W9nM38vNaqVfBsrmhLRz6wp/as
	 7WGLTUY2g8jX5wZuwL7Daj4NeMe0Y0dC5MUMBe6G2kx3cGCdoN02l0WPtObJH1QPRc
	 z5SayATDhZL5oavtPeWy6JlWP3zrXNkl8Lxpf4KX7bWwoaPXo6l9l/uN+nP6OCUD1i
	 UGO/wnQpZjmVqDfJiz2vhxYdedQXD2muIGdnUiRDnaFFDJQksrLx0iRrBLyZYxDkjo
	 PISo8EqyVMUkQ==
Date: Fri, 18 Sep 2026 17:10:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Jack Thomson <jackabt@amazon.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Restore the VM's feature bitmap when
 kvm_setup_vcpu() fails
Message-ID: <aq1VjEOI3yhoFtpq@gremlin>
References: <20260918120553.163139-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918120553.163139-1-fuad.tabba@linux.dev>
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

On Fri, Sep 18, 2026 at 01:05:53PM +0100, Fuad Tabba wrote:
> __kvm_vcpu_set_target() copies the requested features into the VM-wide
> bitmap before kvm_setup_vcpu() runs and doesn't undo it when setup
> fails, so a rejected KVM_ARM_VCPU_INIT leaves the VM recording features
> that were never set up. With HAS_EL2 | HAS_EL2_E2H0 on a host without
> FEAT_NV1, kvm_vcpu_init_nested() returns -EINVAL before it allocates any
> nested stage-2 MMU, and vcpu_has_nv() is then true with
> nested_mmus_size == 0; its -ENOMEM paths do the same on a VM's first
> INIT.

It seems obviously correct (TM) to undo setting the features on error.

>
> Nothing in the tree loads a vCPU whose init failed, so this is latent.
> The pending KVM_PRE_FAULT_MEMORY series for arm64 does, and the second

I think this needs clarification :)

The KVM_PRE_FAULT_MEMORY series doesn't do this, or rather it only exposes the
ability for the pre-existing generic kvm_vcpu_pre_fault_memory() function to be
invoked by setting flags such as to expose pre-faulting as available for arm64.

So something like:

	The upcoming series that enables KVM_PRE_FAULT_MEMORY exposes an
	existing bug in how vCPU initialisation is performed as it allows
	the generic kvm_vcpu_pre_fault_memory() function to be called which
	calls vcpu_load() before the vCPU might be initialised.

For that bit.

> such load NULL-dereferences in get_s2_mmu_nested() under mmu_lock.

Also I think this is a bit unclear, esp. the prior reference to 'second',
not clear what that refers to. I think you should bring in some of the
context you provide under the fold for the patch.

So clarify what you do i.e.:

1. KVM_ARM_VCPU_INIT ioctl with an invalid configuration (HAS_EL2 |
   HAS_EL2_E2H0) - establishes the invalid kvm->arch.vcpu_features and
   doesn't clear down.

2. KVM_PRE_FAULT_MEMORY - This call is benign, but it calls vcpu_put()
   which calls kvm_arch_vcpu_put() and that has:

		if (vcpu_has_nv(vcpu))
			kvm_vcpu_put_hw_mmu(vcpu);

  Since the broken config causes vcpu_has_nv() to return true, incorrectly,
  and causes:

  	vcpu->arch.hw_mmu = NULL;

  To be run even though the vCPU in fact has the canonical MMU...

3. KVM_PRE_FAULT_MEMORY again - This time on load there's an issue:

	kvm_vcpu_pre_fault_memory()
	  -> vcpu_load()
	    -> kvm_arch_vcpu_load()

  Which has:

  	if (vcpu_has_nv(vcpu))
		kvm_vcpu_load_hw_mmu(vcpu);

  This leads to this path being taken:

		if (!vcpu->arch.hw_mmu) {
			scoped_guard(write_lock, &vcpu->kvm->mmu_lock)
				vcpu->arch.hw_mmu = get_s2_mmu_nested(vcpu);
		}

  And in get_s2_mmu_nested() it searches through the non-existent nested
  mmus leaving s2_mmu NULL, resulting in a NULL pointer deref on this line:

  	BUG_ON(atomic_read(&s2_mmu->refcnt)); /* We have struct MMUs to spare */

>
> Setup reads the VM-wide bitmap, so the copy can't be deferred; restore
> the previous value instead when kvm_setup_vcpu() fails.
>
> Fixes: 1de10b7d13a97 ("KVM: arm64: Get rid of vCPU-scoped feature bitmap")
> Fixes: 427733579744e ("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler")

Hmm are 2 fixes really needed? It seems to me that commit 427733579744e
("KVM: arm64: Select default PMU in KVM_ARM_VCPU_INIT handler") is the
right one because that added a step _after_ setting the bitmap that can go
wrong.

> Link: https://lore.kernel.org/r/20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org/
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

With the comments re: commit message/fixes tag addressed this seems correct
and a very good spot thanks! We very much need this for the pre fault
functionality.

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> The series' generic kvm_vcpu_pre_fault_memory() calls vcpu_load()
> before any arm64 hook, so there is no arm64 check it can pass through
> first. Reproduced on kvmarm/next plus the series under
> QEMU (-cpu max with an Apple M2 MIDR, which has_nv1() denies;
> kvm-arm.mode=nested): KVM_ARM_VCPU_INIT with HAS_EL2 | HAS_EL2_E2H0
> returns -EINVAL, then KVM_PRE_FAULT_MEMORY twice. The first call loads
> with hw_mmu still the canonical MMU and its vcpu_put() clears hw_mmu;
> the second takes the !hw_mmu path into get_s2_mmu_nested(), whose
> search over nested_mmus_size == 0 leaves s2_mmu NULL for the
> BUG_ON(atomic_read(&s2_mmu->refcnt)):
>
>   Unable to handle kernel NULL pointer dereference at virtual address 0000000000000074
>   Call trace:
>    kvm_vcpu_load_hw_mmu+0x94/0x2c0 (P)
>    kvm_arch_vcpu_load+0x2a8/0x5e8
>    kvm_vcpu_pre_fault_memory+0xa0/0x1b8
>    kvm_vcpu_ioctl+0x40c/0x6d0

I also think you should put the stack trace in the commit message, ideally
decoded via scripts/decode_stacktrace.sh!

>
> The thread dies with mmu_lock held for write and an RCU stall in
> queued_write_lock_slowpath() follows. With the fix both calls return
> -ENOENT and the host is unaffected. Applies unchanged to v7.3-rc3.
>
>  arch/arm64/kvm/arm.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index eaf583b771931..c2eb9b6da80f4 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1685,6 +1685,7 @@ static int kvm_setup_vcpu(struct kvm_vcpu *vcpu)
>  static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  				 const struct kvm_vcpu_init *init)
>  {
> +	DECLARE_BITMAP(old_features, KVM_VCPU_MAX_FEATURES);
>  	unsigned long features = init->features[0];
>  	struct kvm *kvm = vcpu->kvm;
>  	int ret = -EINVAL;
> @@ -1695,11 +1696,17 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
>  	    kvm_vcpu_init_changed(vcpu, init))
>  		goto out_unlock;
>
> +	/* Setup reads the VM-wide bitmap, so undo the copy if setup fails. */
> +	bitmap_copy(old_features, kvm->arch.vcpu_features,
> +		    KVM_VCPU_MAX_FEATURES);
>  	bitmap_copy(kvm->arch.vcpu_features, &features, KVM_VCPU_MAX_FEATURES);
>
>  	ret = kvm_setup_vcpu(vcpu);
> -	if (ret)
> +	if (ret) {
> +		bitmap_copy(kvm->arch.vcpu_features, old_features,
> +			    KVM_VCPU_MAX_FEATURES);
>  		goto out_unlock;
> +	}
>
>  	/* Now we know what it is, we can reset it. */
>  	kvm_reset_vcpu(vcpu);
>
> base-commit: 089e4f3c4862ba3f29dff2361caa8084879194fd
> --
> 2.39.5
>

--
Cheers, Lorenzo

