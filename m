Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E7F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkbvvW52oR8I84ICN4AIyYbjZTh5VzFbArrMM81tTB8=; b=Rs8EcfwsYxNncEzhQfi6w/027d
	dkI2a1oRzvhuT0jmzURh5/CbTktj7MyCzUT2uGliQCnPfe5NqQo+wiu7ZaZc0Y2pAZ84uO63rgked
	Mo7W0OlwaiKHfx41nm9vQBD8py+TmYxxTGeQQWRAWZ1l2oHOPRkfoBZB/Q1hTHa1kFRLvbY+Jarc4
	fRcQVcGw9UDcZPh23tERy0qkwnmx9rTL0pRaxWvrJBfvyOF+0b5rmy4gGAOVTpn6jjJpAo+JdkMad
	RsdYYSdk9fV98m+VJxhpIKgq5sd96Rzi+7Wc6r5mjLsDC6DsbNDnRH/uS22Q1Y8niySS0hhxpxePs
	VnmGsghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wc-000000021UJ-3atx;
	Thu, 05 Mar 2026 14:44:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wa-000000021Rs-3pbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F508408D6;
	Thu,  5 Mar 2026 14:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9E0C19423;
	Thu,  5 Mar 2026 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721892;
	bh=ymiT3xOnZ1uOf4S00Qh/7obaHGTSID16nCj585hzndw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M8lNF1NDh9tzvdNevNdIFprfWcXj4N/xjcF9D8Sfo5+ayGVxHyC5QjO8+J4nghibm
	 ixcNpdw1XyWPJTbQkVbgn4inErcMyPJpd9+liaTzBK4gKwJ1kBqxubd47paSJXbpRe
	 t69z+GGj73pZbDeiMUMk66MxKJIfhq8Qhsr09zRTwYCKp+Tq1lZrvaST2xFTw39Ta+
	 5HwaX6NZLouXzzY2rlvw/3oNqumONFCcKEK20XJuHRwMFSUeFXDn+Nr3ILtt/Qu7W1
	 cKdan2OEDXk9ApSjssOAuwdGp65xd2RnaCXTgmaOz5hSA5SiPCW3Wy+cr8UPVi19k0
	 SK5v398UU2+dA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 12/36] KVM: arm64: Hook up donation hypercall to pkvm_pgtable_stage2_map()
Date: Thu,  5 Mar 2026 14:43:25 +0000
Message-ID: <20260305144351.17071-13-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064452_995280_A1AA6ADD 
X-CRM114-Status: GOOD (  15.21  )
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

Mapping pages into a protected guest requires the donation of memory
from the host.

Extend pkvm_pgtable_stage2_map() to issue a donate hypercall when the
target VM is protected. Since the hypercall only handles a single page,
the splitting logic used for the share path is not required.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/pkvm.c | 58 ++++++++++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index a39dacd1d617..1814e17d600e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -373,31 +373,55 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	struct kvm_hyp_memcache *cache = mc;
 	u64 gfn = addr >> PAGE_SHIFT;
 	u64 pfn = phys >> PAGE_SHIFT;
+	u64 end = addr + size;
 	int ret;
 
-	if (size != PAGE_SIZE && size != PMD_SIZE)
-		return -EINVAL;
-
 	lockdep_assert_held_write(&kvm->mmu_lock);
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
 
-	/*
-	 * Calling stage2_map() on top of existing mappings is either happening because of a race
-	 * with another vCPU, or because we're changing between page and block mappings. As per
-	 * user_mem_abort(), same-size permission faults are handled in the relax_perms() path.
-	 */
-	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, addr + size - 1);
-	if (mapping) {
-		if (size == (mapping->nr_pages * PAGE_SIZE))
+	if (kvm_vm_is_protected(kvm)) {
+		/* Protected VMs are mapped using RWX page-granular mappings */
+		if (WARN_ON_ONCE(size != PAGE_SIZE))
+			return -EINVAL;
+
+		if (WARN_ON_ONCE(prot != KVM_PGTABLE_PROT_RWX))
+			return -EINVAL;
+
+		/*
+		 * We raced with another vCPU.
+		 */
+		if (mapping)
 			return -EAGAIN;
 
-		/* Remove _any_ pkvm_mapping overlapping with the range, bigger or smaller. */
-		ret = __pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
-		if (ret)
-			return ret;
-		mapping = NULL;
+		ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn);
+	} else {
+		if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
+			return -EINVAL;
+
+		/*
+		 * We either raced with another vCPU or we're changing between
+		 * page and block mappings. As per user_mem_abort(), same-size
+		 * permission faults are handled in the relax_perms() path.
+		 */
+		if (mapping) {
+			if (size == (mapping->nr_pages * PAGE_SIZE))
+				return -EAGAIN;
+
+			/*
+			 * Remove _any_ pkvm_mapping overlapping with the range,
+			 * bigger or smaller.
+			 */
+			ret = __pkvm_pgtable_stage2_unshare(pgt, addr, end);
+			if (ret)
+				return ret;
+
+			mapping = NULL;
+		}
+
+		ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn,
+					size / PAGE_SIZE, prot);
 	}
 
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, size / PAGE_SIZE, prot);
 	if (WARN_ON(ret))
 		return ret;
 
-- 
2.53.0.473.g4a7958ca14-goog


