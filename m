Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5171CCD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eak/H2RP49+LPFCmwdYPZS6m93vEyNFsDScWb7BTiE0=; b=t00TEU4hVM5fphIT2TffEUqKaF
	Y3DyzZueEk3/NbqpysCk3etl3SenInGmQsPh8RIeMgs85ZiqkEKEU4u46HgWYW2eD+MS6fqJxOb03
	bbt3/NVXN6Fv6za8Nd64RfCDjNUwX5FPcMuJYxCSisBgEsH+o1h1JRqN5mkomAvmt8sGqlUe1+RpJ
	eN+S7fzaiIoCWSjoA0+HtXZlKUjIrcE0RuEKlrBIrxhhp3kz+1aLILh74VsxPLdkrF1ZHmem2cPv1
	ZX+HUIAyodtEqGi6L44/KaIu1RPvLY6C9HoRmGOrzxhsKm1w6NkkhBx0QP/MTlYOzEvzJjTcFcfVV
	jiFl7qaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWYY-00000000paS-1Jor;
	Fri, 05 Jun 2026 15:33:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWYU-00000000pYx-2oBr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:33:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E3D134FE;
	Fri,  5 Jun 2026 08:33:48 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7F0C3F86F;
	Fri,  5 Jun 2026 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780673632; bh=iJk4qjveu3UoNnJ691h+ELzlPLvx6w5PQjerE7+VMUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rcmKxTgw5I4C0CsiJ4siCezSQ+0XGnrijovnLD0FgmitLGGEg4HMlrCtMh/ek4gqi
	 H3NJlux6boKl7w8I7T353PXyeVYPpqtluvaKl165XjqIzO/WrL3jjxkMKtmVtzyFRv
	 vQFMY00/wcnZoyEywrjdv0AuHDHxAWyLm3eLtd+U=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 1/2] KVM: arm64: Replace memslot_is_logging() with kvm_slot_dirty_track_enabled()
Date: Fri,  5 Jun 2026 16:32:47 +0100
Message-ID: <20260605153248.2412064-2-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605153248.2412064-1-weilin.chang@arm.com>
References: <20260605153248.2412064-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_083354_934278_480D9B5F 
X-CRM114-Status: GOOD (  17.03  )
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

When checking whether a memslot has dirty logging enabled, the
KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously we were
using memslot_is_logging() which only tests dirty bitmap and did not
consider dirty ring. This was not detected because
KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP was introduced together with KVM
arm64 dirty ring, and users need to enable it to ensure dirty
information is not lost for the case of VGIC LPI/ITS table changes.

Fix this by using kvm_slot_dirty_track_enabled() instead which checks
KVM_MEM_LOG_DIRTY_PAGES.

Note that memslot_is_logging() also treats a memslot as not logging if
KVM_MEM_READONLY is set, hence a memslot with both dirty logging and
read only would be seen as not logging for memslot_is_logging(), but
logging for kvm_slot_dirty_track_enabled(). This allows a read only
mapping of size > PAGE_SIZE to be built when memslot_is_logging() is
used, leading to a better read performance compared to
kvm_slot_dirty_track_enabled(). However memslots that have both
KVM_MEM_LOG_DIRTY_PAGES and KVM_MEM_READONLY set do not really make
sense as dirty logging is essentially nop for a read only memslot, so
this shouldn't affect real workloads much.

Fixes: 9cb1096f8590 ("KVM: arm64: Enable ring-based dirty memory tracking")
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
It took me a long investigation to acquire the context needed to
understand this change, however the reason for this problem not being
detected is an educated guess. Please let me know if this is wrong or
if there are other issues, thanks!

 arch/arm64/kvm/mmu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4da9281312eb..06c46124d3e7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -161,11 +161,6 @@ static int kvm_mmu_split_huge_pages(struct kvm *kvm, phys_addr_t addr,
 	return ret;
 }
 
-static bool memslot_is_logging(struct kvm_memory_slot *memslot)
-{
-	return memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
-}
-
 /**
  * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
@@ -1748,7 +1743,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
 {
 	short vma_shift;
 
-	if (memslot_is_logging(s2fd->memslot)) {
+	if (kvm_slot_dirty_track_enabled(s2fd->memslot)) {
 		s2vi->max_map_size = PAGE_SIZE;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1953,7 +1948,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	*prot = KVM_PGTABLE_PROT_R;
 
 	if (s2vi->map_writable && (s2vi->device ||
-				   !memslot_is_logging(s2fd->memslot) ||
+				   !kvm_slot_dirty_track_enabled(s2fd->memslot) ||
 				   kvm_is_write_fault(s2fd->vcpu)))
 		*prot |= KVM_PGTABLE_PROT_W;
 
@@ -2084,7 +2079,7 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * and a write fault needs to collapse a block entry into a table.
 	 */
 	memcache = get_mmu_memcache(s2fd->vcpu);
-	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
+	if (!perm_fault || (kvm_slot_dirty_track_enabled(s2fd->memslot) &&
 			    kvm_is_write_fault(s2fd->vcpu))) {
 		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
 		if (ret)
-- 
2.43.0


