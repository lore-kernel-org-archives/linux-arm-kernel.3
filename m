Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01680C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se8HA3ODTbyIO4sze9U6Dp/5VUAmMvY5Gsblr6Dfero=; b=nKzxmmFEBWMGmwCr83DR88dlkt
	6O/v5C4wvmkR5Ahxo+QDhoPmDfeA3bXpvI/2PGQ4GfpCjwtKrVT/bcJE58hNl3u7CT4BWk/HXIBfX
	tL83n3iuIh6bFxcqor7u8KHq1lGgGp8p4aLNtgcLy5N90Zm3J4mGEHbcaPfuMevQnIq7bP3BrCNeb
	jiGQTrGkxWwJJQwKQaGLDYCUTxOlwbAiWXAmvA7MWl4q22vNQc6kXqPCQBU4FqVYCA/7g1x99vaD2
	/CQjWjbn0VufbXxDBI/KNPar4ExYzk5Nlj2igUyLenQSjldfmoBFhvxB8u3K9lQfKc2YV/scUOvDB
	Pt7LZD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu723-0000000G2pq-2WrS;
	Wed, 12 Aug 2026 11:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu71p-0000000G2h1-0NB9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:21:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01F161682;
	Wed, 12 Aug 2026 04:21:39 -0700 (PDT)
Received: from e143914.arm.com (e143914.arm.com [10.2.213.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15DEC3F632;
	Wed, 12 Aug 2026 04:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786533702; bh=uc8UMTUcAc8ZS/P+6zbuB/2Y5u+uo+jypF+mtHt96pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ekPfEqaVCpaAXY6MbA6c2uUF2x/vChiTFrl+sZEaEeIKaGHASaoEctkvB7NDS5qAm
	 PQtiEK3PgUp7SvcMdLGsJokNrbEtsEgWJyeH9k95+KVbCPXDpkPgenhfWhcrPuwA++
	 8nnibAEVoFlzWR5a9vd/ZTEhMitRodi1fROi8hCY=
Date: Wed, 12 Aug 2026 12:21:35 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Shen Yongchao <grayhat@foxmail.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Fix life cycle of the nested_mmus array
Message-ID: <anxXP_ZTZb_iKu1w@e143914.arm.com>
References: <20260811122057.754772-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811122057.754772-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_042149_452162_FBE521AA 
X-CRM114-Status: GOOD (  32.93  )
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

Hi,

Small comment / suggestion.

On Tue, Aug 11, 2026 at 01:20:57PM +0100, Marc Zyngier wrote:
> The nested_mmus array holds the shadow page tables that are used when
> a guest is running a nested context. These structures are allocated on
> VCPU_INIT for whole guest, which implies that they may have to be
> relocated as the array grows.
> 
> Should a VCPU_INIT occur whilst a vcpu is actively running an L2 and
> that the allocation requires relocation, that vcpu will still be
> running with a pointer to the previous structure, which will have been
> freed.
> 
> Fix this by turning the array of structures to an array of pointers,
> which is now allocated at VM creation, sized to the absolute maximum
> that KVM can handle.
> 
> In turn, each VCPU_INIT contributes S2_MMU_PER_VCPU to the pool. No
> reallocation is ever performed, and the life cycle of each object is
> much clearer:
> 
> - the nested_mmus array is allocated in kvm_init_nested(), and freed
>   in kvm_arch_destroy_vm()
> 
> - s2_mmu structures are allocated in kvm_vcpu_init_nested(), and freed
>   on kvm_arch_flush_shadow_all()
> 
> Finally, the freeing of vcpu->arch.vncr_array is made consistent
> rather than being done on some failure paths, but not others.
> 
> Fixes: 4f128f8e1aaa ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
> Reported-by: Shen Yongchao <grayhat@foxmail.com>
> Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
> Suggested-by: Karl Mehltretter <kmehltretter@gmail.com>
> Link: https://lore.kernel.org/r/20260803224405.41468-1-kmehltretter@gmail.com
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
> 
> Notes:
>     Sending this as a first class patch, since the other approaches were even
>     uglier than this one. I'm still displeased with kvm_arch_flush_shadow_all(),
>     but that's a step in the direction of tightening it:
> 
>  arch/arm64/include/asm/kvm_host.h   |  2 +-
>  arch/arm64/include/asm/kvm_nested.h |  2 +-
>  arch/arm64/kvm/arm.c                |  8 ++-
>  arch/arm64/kvm/nested.c             | 91 +++++++++++++----------------
>  4 files changed, 49 insertions(+), 54 deletions(-)
> 
[..]
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index 20af94197a8a7..50d6dcc75582c 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -44,11 +44,15 @@ struct vncr_tlb {
>   */
>  #define S2_MMU_PER_VCPU		2
>  
> -void kvm_init_nested(struct kvm *kvm)
> +int kvm_init_nested(struct kvm *kvm)
>  {
> -	kvm->arch.nested_mmus = NULL;
> +	kvm->arch.nested_mmus = kvmalloc_array(KVM_MAX_VCPUS * S2_MMU_PER_VCPU,
> +					       sizeof(struct s2_mmu *),
> +					       GFP_KERNEL_ACCOUNT);
>  	kvm->arch.nested_mmus_size = 0;
>  	atomic_set(&kvm->arch.vncr_tlb_count, 0);
> +
> +	return kvm->arch.nested_mmus ? 0 : -ENOMEM;
>  }
>  
>  static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
> @@ -69,8 +73,7 @@ static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
>  int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
>  {
>  	struct kvm *kvm = vcpu->kvm;
> -	struct kvm_s2_mmu *tmp;
> -	int num_mmus, ret = 0;
> +	int num_mmus;
>  
>  	if (test_bit(KVM_ARM_VCPU_HAS_EL2_E2H0, kvm->arch.vcpu_features) &&
>  	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
> @@ -83,51 +86,40 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
>  	if (!vcpu->arch.ctxt.vncr_array)
>  		return -ENOMEM;
>  
> -	/*
> -	 * Let's treat memory allocation failures as benign: If we fail to
> -	 * allocate anything, return an error and keep the allocated array
> -	 * alive. Userspace may try to recover by initializing the vcpu
> -	 * again, and there is no reason to affect the whole VM for this.
> -	 */
>  	num_mmus = atomic_read(&kvm->online_vcpus) * S2_MMU_PER_VCPU;
>  
>  	if (num_mmus > kvm->arch.nested_mmus_size) {

Sashiko.dev complained about a possible race here, but looking at the
code, it seems incorrect?

Unsure why it didn't e-mail it.
https://sashiko.dev/#/patchset/20260811122057.754772-1-maz%40kernel.org

It seems that this code is serialised / protected by
kvm->arch.config_lock in __kvm_vcpu_set_target() (which is the only
caller of kvm_vcpu_init_nested() via kvm_setup_vcpu())

So maybe a

	lockdep_assert_held(&kvm->arch.config_lock);

makes sense in kvm_vcpu_init_nested()?

Thanks,
Joey

