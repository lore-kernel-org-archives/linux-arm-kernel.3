Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F8D10ED662
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi9w5d/grTiZ6clrHpDPKVfIRsyLQZCzchiB7v88ePk=; b=d4GlImIOI59LO/Vrh2G/7uqLYe
	Fwoa4JFH7T9TpTfOoTltpc1NJDFabCK2u/TkppVe5PGNvGve/g3mY87dsyOGJ5G8iHkwqIHuyWCb5
	Ebe7aCOvbB/59Z3dqm1kLtYu321M92gXf6dLMRFanPV+hu6Gf8naUWfpPTGKQPAZab61vA2/Pwwn+
	dmq44K1Q2FAeYsQkhlbUt9l4oRELwknmg790asHXpRYAMAsS0sKbqIYL20tt4IGMpHbM4WH7pCrD8
	h0iPihyZ/OGsDjYLJ9zPLkhsYwIlnH/5v6JD4fBXwB0xxF/xcKTJ2Zci/v7cZgJoyRJ/ZFqsLhJf/
	41XrKbtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ue-00000007FJ2-0j7q;
	Fri, 27 Mar 2026 11:36:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UH-00000007F0Z-3NOE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F8F444738;
	Fri, 27 Mar 2026 11:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC6CC2BC9E;
	Fri, 27 Mar 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611385;
	bh=+aeHJ2YQDszoCJhPqw9IaJhiayWdRWxmEzD5vTRGnzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kpaH/UExhWTVaIzuXHpFmdbZNEubYp9O53Z0bdOpN3MaTd/IkdUPN3ACAxbmNW/B0
	 16Oz9OC9+qB6p3kZtNM+AgIO+NxPansej8iyDbfUCgAU4JkrDb2ingJrGtMV31H1II
	 /GZTPHtjRcNMmW/6z5puvfJGjcR7HqAx+mECpcLo4ntlKs6+He7yPRbDZq+p9turOA
	 YVcArahFhb0w8RIPigLp2q2GDxIp3Ks7RdAs9IuSxrshOw0/9Oo5zx6WmIg/2LsAnu
	 x5PVHQf4c9kHubThgQW0WV29G4aLLgPfRsc/+m7YcVanup/jw3zyKeISjaDw89x5cP
	 wrB47P1u278GA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UF-00000006K4a-0DrT;
	Fri, 27 Mar 2026 11:36:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 04/30] KVM: arm64: Isolate mmap_read_lock inside new kvm_s2_fault_get_vma_info() helper
Date: Fri, 27 Mar 2026 11:35:52 +0000
Message-ID: <20260327113618.4051534-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043625_889509_7132C9A4 
X-CRM114-Status: GOOD (  15.41  )
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

From: Fuad Tabba <tabba@google.com>

Extract the VMA lookup and metadata snapshotting logic from
kvm_s2_fault_pin_pfn() into a tightly-scoped sub-helper.

This refactoring structurally fixes a TOCTOU (Time-Of-Check to
Time-Of-Use) vulnerability and Use-After-Free risk involving the vma
pointer. In the previous layout, the mmap_read_lock is taken, the vma is
looked up, and then the lock is dropped before the function continues to
map the PFN. While an explicit vma = NULL safeguard was present, the vma
variable was still lexically in scope for the remainder of the function.

By isolating the locked region into kvm_s2_fault_get_vma_info(), the vma
pointer becomes a local variable strictly confined to that sub-helper.
Because the pointer's scope literally ends when the sub-helper returns,
it is not possible for the subsequent page fault logic in
kvm_s2_fault_pin_pfn() to accidentally access the vanished VMA,
eliminating this bug class by design.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 5079a58b65b14..1f2c2200ccd8d 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1740,7 +1740,7 @@ struct kvm_s2_fault {
 	vm_flags_t vm_flags;
 };
 
-static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
+static int kvm_s2_fault_get_vma_info(struct kvm_s2_fault *fault)
 {
 	struct vm_area_struct *vma;
 	struct kvm *kvm = fault->vcpu->kvm;
@@ -1774,9 +1774,6 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 
 	fault->is_vma_cacheable = kvm_vma_is_cacheable(vma);
 
-	/* Don't use the VMA after the unlock -- it may have vanished */
-	vma = NULL;
-
 	/*
 	 * Read mmu_invalidate_seq so that KVM can detect if the results of
 	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
@@ -1788,6 +1785,17 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 	fault->mmu_seq = kvm->mmu_invalidate_seq;
 	mmap_read_unlock(current->mm);
 
+	return 0;
+}
+
+static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
+{
+	int ret;
+
+	ret = kvm_s2_fault_get_vma_info(fault);
+	if (ret)
+		return ret;
+
 	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
-- 
2.47.3


