Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46940C636A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58ql4pD+Z1ZvJgYSvHP0ncPZg8Urocw/9ieGpsLGS8I=; b=Hq6PutDTJNC2yc45BU9DjXgOaR
	UK7QjOoRNT5Q9/3ymkZUe7HU0y7eCBTh4l+5zy90SJvF5vlZRu4SBxjR0RN0BiOtB2HMubXWM6lYM
	62NAZvuQ7Spm3dmJnzDU9vEG2dAvhopwPilAFmgc/lWXI3UjTUAi7Aw5voDZJiOeRVhQ+69Mv7jYJ
	GMQTHUO9UAAZE+1J9wXcpsTzanTQntVJcm3QuFLSLEFkUsS0uZXv8a1GVXfmfRgqPv/D/X+yNuaPj
	SJ4wIGBi9NJmE7MgdYGq4ro7BZPGAhP/W9uc9VgX6E2IPTpWgDSc6yim2uJ8kSqiLS3R/Gf4rzgtc
	D+uzciJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuA9y-0000000GjqI-2Shd;
	Sun, 22 Feb 2026 14:10:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuA9w-0000000Gjq2-30rk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 14:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A60F60126;
	Sun, 22 Feb 2026 14:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94F2C116D0;
	Sun, 22 Feb 2026 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771769406;
	bh=GzGBdumzFByqwyBN2Z2Udld9QqwV3INwp0JJWAxH/Tg=;
	h=From:To:Cc:Subject:Date:From;
	b=cWooMs2NiwU5gR6QCG+4GrymmX9RweYEt6BspOKQQC5RXmiice7ZQyj1ZGNBFZrpi
	 mJvPfILRDAZHdGQxEli2QzPfO8G2Ze9kvWkMbOpzRLzMLRCJL7f7/y7rvFQKqbU827
	 kEiAA6RgRVTAbJ1fDssSg0dmFbgvCacuua1m6MziU30eKXkzgTnJFkQNRysWIMPYiE
	 2ORx+XP30qFHwwIlbH0kX334539xDAYXh/y7JxwyG+Oy/OksEeaHrck8aO00RRKpx4
	 378mVmCWd1zn+I3ApCYTUW4W/L0g4wntaekz2/Bwxt360L32Xypy9c2HpuI3z8EYhk
	 9HqWSvZwaKa7w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vuA9s-0000000CmBl-1WA5;
	Sun, 22 Feb 2026 14:10:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Quentin Perret <qperret@google.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix protected mode handling of pages larger than 4kB
Date: Sun, 22 Feb 2026 14:10:00 +0000
Message-ID: <20260222141000.3084258-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, will@kernel.org, tabba@google.com, vdonnefort@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Since 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings"),
pKVM tracks the memory that has been mapped into a guest in a
side data structure. Crucially, it uses it to find out whether
a page has already been mapped, and therefore refuses to map it
twice. So far, so good.

However, this very patch completely breaks non-4kB page support,
with guests being unable to boot. The most obvious symptom is that
we take the same fault repeatedly, and not making forward progress.
A quick investigation shows that this is because of the above
rejection code.

As it turns out, there are multiple issues at play:

- while the HPFAR_EL2 register gives you the faulting IPA minus
  the bottom 12 bits, it will still give you the extra bits that
  are part of the page offset for anything larger than 4kB,
  even for a level-3 mapping

- pkvm_kvm_pgtable_stage2_map() assumes that the address passed
  as a parameter is aligned to the size of the intended mapping

- the faulting address is only aligned for a non-page mapping

When the planets are suitably aligned (pun intended), the guest
faults a page by accessing it past the bottom 4kB, and extra bits
get set in the HPFAR_EL2 register. If this results in a page mapping
(which is likely with large granule sizes), nothing aligns it further
down, and pkvm_mapping_iter_first() finds an intersection that
doesn't really exist. We assume this is a spurious fault and return
-EAGAIN. And again.

This doesn't hit outside of the protected code, as the page table
code always aligns the IPA down to a page boundary, hiding the issue
for everyone else.

Fix it by always forcing the alignment on vma_pagesize, irrespective
of the value of vma_pagesize.

Fixes: 3669ddd8fa8b5 ("KVM: arm64: Add a range to pkvm_mappings")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/mmu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8c5d259810b2f..aa587f2e28264 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1753,14 +1753,12 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	}
 
 	/*
-	 * Both the canonical IPA and fault IPA must be hugepage-aligned to
-	 * ensure we find the right PFN and lay down the mapping in the right
-	 * place.
+	 * Both the canonical IPA and fault IPA must be aligned to the
+	 * mapping size to ensure we find the right PFN and lay down the
+	 * mapping in the right place.
 	 */
-	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
-		fault_ipa &= ~(vma_pagesize - 1);
-		ipa &= ~(vma_pagesize - 1);
-	}
+	fault_ipa &= ~(vma_pagesize - 1);
+	ipa &= ~(vma_pagesize - 1);
 
 	gfn = ipa >> PAGE_SHIFT;
 	mte_allowed = kvm_vma_mte_allowed(vma);
-- 
2.47.3


