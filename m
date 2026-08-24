Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF68C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRd3nAZ/IAGc/XV72YoIVwNp+sB1Vr1EJbegUfNq6tE=; b=JOU+iwy6vuQi1Usqn7K0Jc+KOF
	kkXEPs8/ubCZpztQGi1wvCnFD6uTjgNWpFmL3oGftXMIvL7EeIbrv+dSkOzO+e64UBxEwMySJzU9K
	8q9uidgZ+1UGv+m3yIyWuIzHupMPO6GlywD5GjCnQb2y0+rXjvItADCUvgVmDb33QRsh+6O/7/NRw
	2aV60rVyHULKnjEipXXH6ODxQE/XSZctH/zU8nu2sO2SSNvltD+l9OUsSebVjX+R9oKCt5/WGlEAY
	67t8vOMzNz82uWz7lurmeUYVyPf0AjpmLF9EGyb24LYIJIUR1dJ6Nv5LMyWKhOivwVy8M93kCY6Uk
	ghtEkvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUWX-0000000GgBr-0I6n;
	Mon, 24 Aug 2026 13:15:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUWV-0000000GgBk-2UUJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:15:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C2BE42A17;
	Mon, 24 Aug 2026 13:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A4F1F000E9;
	Mon, 24 Aug 2026 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787577335;
	bh=lRd3nAZ/IAGc/XV72YoIVwNp+sB1Vr1EJbegUfNq6tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRRv2nWF8/4N4nY0TflgH7iRoCmfGjPZxowmeTFtuBU3RSCqG15I4QBz7uB8k8PUK
	 45pWyaXKSaAv/gOR3OZLA+miHJurTairAmXz6ZrYR/7BmdxnaizEcMSIJJLN8Ljhtx
	 vfgHr32IQ2IFi/v+dYxQdlMj13AyJQQm6C70J8N1RKTsropumZBPYL4yrB+mgPFWIb
	 7XLmlzhcOvZQaBqox3fJjPQp62pCf0aBDBwSlob4nVRZqVPaY+gGkvcnrvKFHuJzmD
	 RINHZ2nTTgMEaAFam/IJY+n5q0OulU+REB6H7Tsv7U5b4DQQOegkBl9hMoInGhqp1C
	 +lrPP7VUZWtUw==
Date: Mon, 24 Aug 2026 14:15:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] KVM: arm64: Fix spurious warn, null ptr deref on
 S2 teardown race
Message-ID: <aoxD4omq8gKYdFKL@gremlin>
References: <20260822-kvm-arm-nested-virt-fix-v2-0-ac4059a0eaa6@kernel.org>
 <87tsolnuh0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsolnuh0.wl-maz@kernel.org>
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

On Sun, Aug 23, 2026 at 08:53:31AM +0100, Marc Zyngier wrote:
> On Sat, 22 Aug 2026 18:46:52 +0100,
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> wrote:
> >
> > When GFNs are invalidated in L0 an MMU notifier triggers
> > kvm_unmap_gfn_range() which tears down all of the stage 2 shadow page
> > tables for nested guests via kvm_nested_s2_unmap().
> >
> > To avoid lockup, the kvm->mmu_lock is dropped while doing this and the task
> > rescheduled once for each block of physical address space (32 MiB for 16
> > KiB page size), with the lock being reacquired once the task is scheduled
> > again.
> >
> > This results in a potential race between this L0 tear down and tear down of
> > the guest itself in kvm_flush_shadow_all(), a race which has been observed
> > on real hardware.
> >
> > When this race occurs it causes an invalid kernel warning when the PGT of a
> > nested MMU is cleared by kvm_flush_shadow_all() ->
> > kvm_arch_flush_shadow_all() -> kvm_free_stage2_pgd().
> >
> > Patch 1 fixes this by having stage2_apply_range() no longer return an error
> > when it has experienced a benign race with pgt teardown when it drops the
> > lock.
> >
> > Patch 2 addresses something more serious - bad timing can turn this spurious
> > warning into a NULL pointer dereference.
> >
> > kvm_arch_flush_shadow_all() calls kvm_uninit_stage2_mmu() which calls
> > kvm_free_stage2_pgd() on the canonical kvm->arch.mmu for that guest's S2
> > mappings, making it NULL.
> >
> > This is problematic if it happens before stage2_apply_range() reacquires
> > the kvm->mmu_lock, as it ultimately returns to kvm_nested_s2_unmap() which
> > dereferences kvm->arch.mmu.pgt with the mmu lock held under the incorrect
> > assumption that it means it's valid, resulting in a NULL pointer
> > dereference.
> >
> > Fix that by checking if kvm->arch.mmu.pgt is NULL before dereferencing it
> > in kvm_nested_s2_unmap() and kvm_nested_s2_wp().
>
> With the commit message for patch #1 trimmed to something that fits on
> a couple of standard terminal screens ;-) :

Haha sure will put it on a diet and respin :)

>
> Reviewed-by: Marc Zyngier <maz@kernel.org>

Thanks!

>
> 	M.
>
> --
> Jazz isn't dead. It just smells funny.

--
Cheers, Lorenzo

