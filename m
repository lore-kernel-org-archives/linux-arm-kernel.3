Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B16CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvBqSXhSd0+ciY4t6uSyUxq+YGf55pIi3P3ho2un0FY=; b=xaxyXq0Qemn4Xvlrs9qSl1HMgC
	CP5miV1kzCs6YZ5hEQ3sYFu73tBiSSRAqku7F32qSbufoeIyH3OrKMwFoPEv+7c+eka+Zp/PADdR/
	HJaMGk44Famh+jLOMYb6AEV97Pz/Yr941UeNJXCaWQoCQbtUkqV4eAnEvKgbJVSSV5IyQfoYf78OS
	/49RJ114Pe4cxD+tUawCPTLRfLvqpQ7DL3qeUOBkrkeboPELNCRFGliqITbyVhq2Vg+gfCKE6+Sds
	C/l3gSszFrcQ2TnCXYqQLbH+uR6E7BayiWCjz6Z0qwArPlhkMfiR+w2OO+bVtc0Aeq0hTDosxHpYK
	MPziTgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcv4-000000045CE-0jbB;
	Mon, 08 Jun 2026 16:33:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcv3-000000045C7-1VSv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:33:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB6F060098;
	Mon,  8 Jun 2026 16:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6411B1F00893;
	Mon,  8 Jun 2026 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780936424;
	bh=IvBqSXhSd0+ciY4t6uSyUxq+YGf55pIi3P3ho2un0FY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lk9Z4YocwsJ6/Lori8Zu06XkPFHAr+wuediCAZhdXunEpVhN+HkMFp+DF2an6tK+k
	 5QrEervLDBN/4F+qxGk3DXJ8jb5EG8wQjjrz7GPkkXDar1LikvH6jMLoir8x4WKwjB
	 9GBInAU4XfCeebAYA1GI1/CeTDWOa9REaCp3JojCjFfeix1yRIgCn2f1FJ6fBtvAPo
	 bcAIlnoHxlyraPq4iPG241VyQat3Udacw2BG+xRjfCM8nqlyK7e+Yy5WigpLhNhSC3
	 RG9OpQzgWv5L9Hgkz3cQZS7UTO7FN4o2E0xW5iZzS8pFS5d102JEdzurf51Zo2lvlO
	 s3fbvfeqbMPNw==
Date: Mon, 8 Jun 2026 09:33:43 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Add kvm_for_each_vncr_tlb() helper
Message-ID: <aibu532apl5w0lXU@kernel.org>
References: <20260607175745.297793-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607175745.297793-1-maz@kernel.org>
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

Hey Marc,

Especially since this is a stable-worthy fix, it might be worth calling
out the bug in the shortlog, e.g.

  KVM: arm64: nv: Avoid dereferencing NULL VNCR pseudo-TLB

On Sun, Jun 07, 2026 at 06:57:45PM +0100, Marc Zyngier wrote:
> VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions,
> and either can race against a vcpu not being onlined yet (no pseudo-TLB
> allocated). Similarly, the TLB might be invalid, and the invalidation
> should be skipped in this case.
> 
> Both kvm_invalidate_vncr_ipa() and kvm_invalidate_vncr_va() are
> expected to perform the same checks, except that the latter doesn't
> check for the allocation and blindly dereferences the pointer.
> 
> Solve this by introducing a new iterator built on top of the usual
> kvm_for_each_vcpu() that checks for both of the above conditions,
> and convert the two users to it.
> 
> Reported-by: Hyunwoo Kim <imv4bel@gmail.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/aiUvSbrWndQeUPc8@v4bel
> Fixes: 4ffa72ad8f37 ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
> Cc: stable@vger.kernel.org

Looks good

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver

> ---
>  arch/arm64/kvm/nested.c | 36 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> index f8d3f3a723282..690b8e8564166 100644
> --- a/arch/arm64/kvm/nested.c
> +++ b/arch/arm64/kvm/nested.c
> @@ -908,9 +908,21 @@ static void invalidate_vncr(struct vncr_tlb *vt)
>  		clear_fixmap(vncr_fixmap(vt->cpu));
>  }
>  
> +/*
> + * VNCR TLB invalidation occurs from MMU notifiers or TLBI instructions, and
> + * either can race against a vcpu not being onlined yet (no pseudo-TLB
> + * allocated). Similarly, the TLB might be invalid.  Skip those, as they
> + * obviously don't participate in the invalidation at this stage.
> + */
> +#define kvm_for_each_vncr_tlb(idx, vcpup, tlbp, kvm)	\
> +	kvm_for_each_vcpu(idx, vcpup, kvm)		\
> +		if (((tlbp) = vcpup->arch.vncr_tlb) &&	\
> +		    (tlbp)->valid)
> +
>  static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
>  {
>  	struct kvm_vcpu *vcpu;
> +	struct vncr_tlb *vt;
>  	unsigned long i;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
> @@ -918,24 +930,9 @@ static void kvm_invalidate_vncr_ipa(struct kvm *kvm, u64 start, u64 end)
>  	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, NV_frac, NV2_ONLY))
>  		return;
>  
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
> +	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
>  		u64 ipa_start, ipa_end, ipa_size;
>  
> -		/*
> -		 * Careful here: We end-up here from an MMU notifier,
> -		 * and this can race against a vcpu not being onlined
> -		 * yet, without the pseudo-TLB being allocated.
> -		 *
> -		 * Skip those, as they obviously don't participate in
> -		 * the invalidation at this stage.
> -		 */
> -		if (!vt)
> -			continue;
> -
> -		if (!vt->valid)
> -			continue;
> -
>  		ipa_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
>  							    vt->wr.level));
>  		ipa_start = vt->wr.pa & ~(ipa_size - 1);
> @@ -965,17 +962,14 @@ static void invalidate_vncr_va(struct kvm *kvm,
>  			       struct s1e2_tlbi_scope *scope)
>  {
>  	struct kvm_vcpu *vcpu;
> +	struct vncr_tlb *vt;
>  	unsigned long i;
>  
>  	lockdep_assert_held_write(&kvm->mmu_lock);
>  
> -	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
> +	kvm_for_each_vncr_tlb(i, vcpu, vt, kvm) {
>  		u64 va_start, va_end, va_size;
>  
> -		if (!vt->valid)
> -			continue;
> -
>  		va_size = ttl_to_size(pgshift_level_to_ttl(vt->wi.pgshift,
>  							   vt->wr.level));
>  		va_start = vt->gva & ~(va_size - 1);
> -- 
> 2.47.3
> 

