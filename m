Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19EDCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTLUdDr7rhfaLhCvrgm+quO9P8A4imXJ7Ipa0t0cs/s=; b=rynIJzLOuO01f5fA7Hl+MJprhp
	kqtGP8Huhp0yU8xYb0TSP1lHkXZtzHCAKYsf6de81RJHTawSgYKCvW+0V0BayBbe4XzW6+JdAf6TM
	VLUxyYCQF9M4E4IaRSTaYwVsavV6FjMDdeMMsa88jEE/la+2R92oKSFq652tZPWF7vaRQgj5XADi3
	yXvJWWB/44YTi5Ja7gtuhPAFpOH3nG2aJTn9MV+OBxTv8BmXCCSqVX+rHSRgA72eDUFz31imDE1Bv
	G4TCw9V7q8tU6YpT7kDgiiN84RYFi9oqyG5tAf+IZgTLAT7yS/4FAKajYWpDFL+H83u7ysvLOrWwf
	P7rPAXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfLb-0000000EP9e-32Gb;
	Wed, 03 Jun 2026 06:45:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfLZ-0000000EP8e-2bvz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 06:45:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C83D60218;
	Wed,  3 Jun 2026 06:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042161F00893;
	Wed,  3 Jun 2026 06:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469100;
	bh=iTLUdDr7rhfaLhCvrgm+quO9P8A4imXJ7Ipa0t0cs/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L9yaNg8XpN9Ca4wKpFXg8n6/BMSZM5Ui0s/uLMhC88fnGB2SPh8eL7ETi15uUU/Jn
	 Gexrze8xT4TXlXkChMCRI2CgGdAhC5XjoiOvix4yRKHgc3C3xQWiPYSGs0MwC1rQVT
	 ESq0tZR74gp5RaoQPt+qoCCy6t594DowVAD7C236qPeAQVI7arQuMt63vfy5Vl7und
	 8ucrPeH/eG1QSyvvoINpSJqACRR3c0Tqa7mo69KYThd6Ywvf4PbNeGmVzA/lX/Dklv
	 F8HIC8O8haPoHO2TN8Ydkb9h6qJMFPZkFkdlNthhXeS6KDJkioSAXAc50hsvPCKE7+
	 6Fin0w0mwUVTA==
Date: Tue, 2 Jun 2026 23:44:58 -0700
From: Oliver Upton <oupton@kernel.org>
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, joey.gouly@arm.com, seiden@linux.ibm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Take the SRCU lock for page table walks in
 fault injection and AT emulation
Message-ID: <ah_Nal3ai65tgt-z@kernel.org>
References: <ah7_BAAzHggzdZeI@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah7_BAAzHggzdZeI@v4bel>
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

Hi Hyunwoo,

On Wed, Jun 03, 2026 at 01:04:20AM +0900, Hyunwoo Kim wrote:
> inject_abt64() rewalks the guest stage-1 page tables via
> __kvm_find_s1_desc_level() when injecting an abort for a failed S1PTW, and
> __kvm_at_s12() calls kvm_walk_nested_s2() to perform the stage-2
> translation. Both walks reference kvm->memslots through kvm_read_guest(),
> which reads the descriptors, and __kvm_at_swap_desc(), which updates the
> access flag, so they must run while holding the kvm->srcu read lock.
> __kvm_at_swap_desc() asserts srcu_read_lock_held() on entry, and the other
> callers of these walks, handle_at_slow(), kvm_translate_vncr() and
> kvm_handle_guest_abort(), take the lock before calling them.
> 
> inject_abt64() is reached from the SEA and size fault injection paths,
> which run before kvm_handle_guest_abort() takes the lock, and
> __kvm_at_s12() does not hold the lock across the stage-2 walk. Take the
> kvm->srcu read lock with guard(srcu) in both places so that it is held for
> the duration of the walk.

Just state the expectation that srcu is held rather than giving the
play by play. Perhaps:

  walk_s1() and kvm_walk_nested_s2() expect to be called while holding
  kvm->srcu to guard against memslot changes. While this is generally
  the case, __kvm_at_s12() and __kvm_find_s1_desc_level() call into the
  respective walkers without taking kvm->srcu.

  Fix by acquiring kvm->srcu prior to the table walk in both instances.

> Cc: stable@vger.kernel.org
> Fixes: 50f77dc87f13 ("KVM: arm64: Populate level on S1PTW SEA injection")
> Fixes: be04cebf3e78 ("KVM: arm64: nv: Add emulation of AT S12E{0,1}{R,W}")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>

I'd prefer if we scoped the critical section to only the relevant calls
to the software table walk, like below.

-- 
Thanks,
Oliver

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 9f8f0ae8e86e..889c2c15d7bd 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1569,7 +1569,8 @@ int __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	/* Do the stage-2 translation */
 	ipa = (par & GENMASK_ULL(47, 12)) | (vaddr & GENMASK_ULL(11, 0));
 	out.esr = 0;
-	ret = kvm_walk_nested_s2(vcpu, ipa, &out);
+	scoped_guard(srcu, &vcpu->kvm->srcu)
+		ret = kvm_walk_nested_s2(vcpu, ipa, &out);
 	if (ret < 0)
 		return ret;
 
@@ -1665,7 +1666,8 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
 	}
 
 	/* Walk the guest's PT, looking for a match along the way */
-	ret = walk_s1(vcpu, &wi, &wr, va);
+	scoped_guard(srcu, &vcpu->kvm->srcu)
+		ret = walk_s1(vcpu, &wi, &wr, va);
 	switch (ret) {
 	case -EINTR:
 		/* We interrupted the walk on a match, return the level */

