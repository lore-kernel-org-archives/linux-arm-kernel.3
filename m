Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC08C5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lEgYKKEkha5zVelFKuaU6d4W/gqiYgaF9FnZq2+a+Sk=; b=Ja+zcoUW+2zAq3jVoeaSfxejyq
	Dhq+eNCFCZJu73k0pnp/dNc54IMpZv0ZUHXS35giB4PWZrIu8pafkhmpYwDMfuvPweHvXT0SjZ10D
	YA3DXUkLga4N68zGZMqk6WSIZZURWdHagHKWeP6bjk9EYpPMcG6Qc0Y8V3OLQn01zRB/vbQs8eQq/
	Os/Ue6Wyth+od1k2N3Jt1vz7+gJcEYXYPgRNBQQoYbyEnCnr1XkSW6IxuBXOtvgn7O1+QbvmlFKqk
	3V+VjFnthVwnoAyzpfjmk6SbxKgYNBKf6zkPRgm8Kqi8WTueoy60sU/oU+84zY1vQecP6pDSkPtbZ
	7wOblH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUjp-0000000GhTN-3X1a;
	Mon, 24 Aug 2026 13:29:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUjp-0000000GhTH-1e4Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:29:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 711D5600E2;
	Mon, 24 Aug 2026 13:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 072771F000E9;
	Mon, 24 Aug 2026 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787578160;
	bh=lEgYKKEkha5zVelFKuaU6d4W/gqiYgaF9FnZq2+a+Sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/oshU4Il1Bt2lQkvGtNOAp6PSQO58YZxwo/DMx+p9l1JiOviAMbhb8tc9egUBgiS
	 NVKQzJ3MihmJvtgtMMoaVv0AXT/GFQAmRkQKcbLeKUmw/QWJvG0pwFAnfWIReBGuXu
	 vdYeViL60lKXaV8vyoONOrDUG11QfUevJffrwTG17JQly1GKZ8lYrTwdJRgJmqCuds
	 sBCSM6CvNZfuXDU8V+kphQWICyI0aF8ujjIiGTKZMI0lSHitlvAyIj/1ulOBAB8+tY
	 I4wQtbS3snLfcQJnvzDoqqFVXOTTErOS11hpSnhdcrAHxh3z6/97zsLgGlBe12kInT
	 oOqOSPA3jCsiA==
Date: Mon, 24 Aug 2026 14:29:14 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yao Yuan <yaoyuan@linux.alibaba.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Christoffer Dall <christoffer.dall@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix spurious warning for benign stage
 2 teardown race
Message-ID: <aoxETjo-1vbTuLuZ@gremlin>
References: <20260822-kvm-arm-nested-virt-fix-v2-0-ac4059a0eaa6@kernel.org>
 <20260822-kvm-arm-nested-virt-fix-v2-1-ac4059a0eaa6@kernel.org>
 <dycpfrkpphjy5xnb57t2zvdmlpkx76lbow7w23l3d2fwgbfjjj@lbk4uh7awc2p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dycpfrkpphjy5xnb57t2zvdmlpkx76lbow7w23l3d2fwgbfjjj@lbk4uh7awc2p>
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

On Sun, Aug 23, 2026 at 01:38:18PM +0800, Yao Yuan wrote:
> On Sat, Aug 22, 2026 at 06:46:53PM +0800, Lorenzo Stoakes (ARM) wrote:
> > A batch of kernel warnings were triggered in the L0 host kernel when using
> > kvmtool to experiment with nested virtualisation.
>
> ...
>
> > Fixes: ec14c272408a ("KVM: arm64: nv: Unmap/flush shadow stage 2 page tables")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  arch/arm64/kvm/mmu.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 74e7e7f7564c..31e049ded093 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -59,19 +59,25 @@ static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
> >   * long will also starve other vCPUs. We have to also make sure that the page
> >   * tables are not freed while we released the lock.
> >   */
> > -static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
> > +static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
> >  			      phys_addr_t end,
> >  			      int (*fn)(struct kvm_pgtable *, u64, u64),
> >  			      bool resched)
> >  {
> >  	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
> > +	phys_addr_t addr = start;
> >  	int ret;
> >  	u64 next;
> >
> >  	do {
> >  		struct kvm_pgtable *pgt = mmu->pgt;
> > +		/*
> > +		 * We may be raced on PGT teardown when we release the
> > +		 * kvm->mmu_lock. That's fine as the PGT is legitimately no
> > +		 * longer present.
> > +		 */
> >  		if (!pgt)
> > -			return -EINVAL;
> > +			return resched && addr > start ? 0 : -EINVAL;
>
> Hi,
>
> I can understand the addr checking makes sure only return 0
> when the mmu_lock is dropped at least once and get pgt =
> NULL, may a variable like drop_lock = true when
> cond_resched_rwlock_write(&kvm->mmu_lock) happens can have
> better readability, but depends on you and others' opinion.

Yeah good point, also the condition is resched && next != end, so this was far
too forgiving already :)

So perhaps:

static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t start,
			      phys_addr_t end,
			      int (*fn)(struct kvm_pgtable *, u64, u64),
			      bool resched)
{
	...
	bool lock_dropped = false;
	...
	do {
		...
		if (!pgt)
			return lock_dropped ? 0 : -EINVAL;
		...
		if (resched && next != end) {
			cond_resched_rwlock_write(&kvm->mmu_lock);
			lock_dropped = true;
		}
	} while (...);
	...
}

That keeps it simple and clear and we don't try to infer anything too
complicated from the state just 'the lock was dropped'.

>
> Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

Thanks :)


>
> >
> >  		next = stage2_range_addr_end(addr, end);
> >  		ret = fn(pgt, addr, next - addr);
> >
> > --
> > 2.55.0

--
Cheers, Lorenzo

