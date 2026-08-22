Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7964C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ6C0Isq4P3g9HCeDb2DCK4xJJyRP1XpM/O6f7kjrf0=; b=q1/3TAgyS1YvzRoOmPPVrUizlh
	Mj2Oz4LZw8KU5clfaX5b3RcvSS0LdFk1azE7GFgyemwiPwRI+mft7Z21KTZJRE3l5ChyuvB/68qB9
	YYGEeKtKsqW0EMKpuiG096FXgh+86JpdUEfzS244w3zasMJKO22ovQLutjokZXpyC0U1IcjMkw14/
	IeWjlIpFLWyLo9B5ejrMWG8X+ZFB3GVoPPLEz14xm7AlPgn/6ooZ8El8adJLgWYW0oXT3ZfOk1/JK
	9dpK3lXEIv1OxWO/EM1jlGK/+kuyPMsDn3vac3fmDIGmUZ7UhXd9+1YOSvebCrSS46OM4n2Eo8ElQ
	HMGQYxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmg7-0000000EaaO-2OxW;
	Sat, 22 Aug 2026 14:26:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmg6-0000000EaaF-1VfS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 14:26:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD89243CAD;
	Sat, 22 Aug 2026 14:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB771F000E9;
	Sat, 22 Aug 2026 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787408793;
	bh=EZ6C0Isq4P3g9HCeDb2DCK4xJJyRP1XpM/O6f7kjrf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FuKRZhu3u7sHEKjTJsJSyY192beLDzTRq2ZCTupKepDO7+Pqmz67aqtuhRIdme8fX
	 goDZEVsdTyzm1PRecpMxydmcOr7Z1k3d8jda7PS/XtOROWbYelZe26m5xwsWl+TMbJ
	 1bbMfV3KKRpJJQzMz2YOpAyXXRKepZ2IEL6VS3G7eEYs11d/jRE4gBp+PhkqSewbuX
	 YAsQz1oFUjtgXpkzkVflCU/JZUVNw6Qq3NVCdlIDA7sE8dwYKOzKB13NVaoI3zigVt
	 qgjhwIXUUT/xU76BkjdMLv+zWx3aZLSeXoXmP8EOWL+Q1r3Ie4GHs7wirI4CC+fNi5
	 WzYmQYmX+3dLg==
Date: Sat, 22 Aug 2026 15:26:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jintack Lim <jintack.lim@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: nv: Fix null ptr deref in
 kvm_nested_s2_unmap() on S2 teardown
Message-ID: <aomxdiB1gXnUZAz5@gremlin>
References: <20260812-kvm-arm-nested-virt-fix-v1-0-4ad883f1b6a5@kernel.org>
 <20260812-kvm-arm-nested-virt-fix-v1-2-4ad883f1b6a5@kernel.org>
 <86y0dy4nm3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0dy4nm3.wl-maz@kernel.org>
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

On Sat, Aug 22, 2026 at 08:32:04AM +0100, Marc Zyngier wrote:
> On Wed, 12 Aug 2026 14:31:21 +0100,
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> >
> > Commit 7270cc9157f4 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU
> > notifiers") introduced VNCR_EL2 invalidation in kvm_nested_s2_unmap().
> >
> > However at the point of this being performed concurrent stage 2 teardown of
> > a nested guest can cause kvm->arch.mmu.pgt to be set to NULL.
> >
> > This happens in kvm_flush_shadow_all() -> kvm_arch_flush_shadow_all() ->
> > kvm_free_stage2_pgd() and is performed under the kvm->mmu_lock.
> >
> > Commit ec14c272408a ("KVM: arm64: nv: Unmap/flush shadow stage 2 page
> > tables") introduced the teardown of the entire nested MMU range, which then
> > invokes stage2_apply_range() with resched=true:
> >
> > mmu_notifier_invalidate_range_start()
> >   -> ... -> kvm_mmu_notifier_invalidate_range_start()
> >     -> kvm_mmu_unmap_gfn_range()
> >       -> kvm_unmap_gfn_range()
> >         -> kvm_nested_s2_unmap()
> >           -> kvm_stage2_unmap_range()
> >             -> __unmap_stage2_range()
> >                 -> stage2_apply_range()
> >
> > This means that stage2_apply_range() can drop the kvm->mmu_lock and thus
> > concurrent progress can be made in lockstep with
> > kvm_arch_flush_shadow_all().
> >
> > If kvm_arch_flush_shadow_all() advances ahead of stage2_apply_range() and
> > completes its operation it guarantees a NULL pointer deref.
> >
> > Since kvm_free_stage2_pgd() is performed under the kvm->mmu_lock this will
> > either be observed NULL or not and serialised against
> > kvm_free_stage2_pgd().
> >
> > Resolve the issue by explicitly checking for a NULL value. Since this
> > shouldn't be possible if blocking is not allowed, raise a warning if it is
> > ever NULL in this case.
> >
> > Fixes: 7270cc9157f4 ("KVM: arm64: nv: Handle VNCR_EL2 invalidation from MMU notifiers")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  arch/arm64/kvm/nested.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
> > index 17123f0b6dab..9fc0b1696dcb 100644
> > --- a/arch/arm64/kvm/nested.c
> > +++ b/arch/arm64/kvm/nested.c
> > @@ -1295,7 +1295,11 @@ void kvm_nested_s2_unmap(struct kvm *kvm, bool may_block)
> >  			kvm_stage2_unmap_range(mmu, 0, kvm_phys_size(mmu), may_block);
> >  	}
> >
> > -	kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
> > +	/* NULL pgt should only be possible if raced when mmu_lock dropped. */
> > +	if (kvm->arch.mmu.pgt)
> > +		kvm_invalidate_vncr_ipa(kvm, 0, BIT(kvm->arch.mmu.pgt->ia_bits));
> > +	else
> > +		WARN_ON(!may_block);
>
> I don't think the WARN_ON() should be here. We already have one at the
> iterator level, which will fire in the same conditions.

Ack, was an abundance of caution, will take out on respin.

>
> Thanks,
>
> 	M.
>
> --
> Without deviation from the norm, progress is not possible.

--
Cheers, Lorenzo

