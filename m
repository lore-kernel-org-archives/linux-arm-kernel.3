Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9C5F33A75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uYYrTxgCNY4rMLT4G/7+afDXw0hVwj97ZivhOeoJtQ=; b=Fs3ft/AlIft85LwrvKcJYjryXH
	wTAIKdE2OgizGYNMvTT9PWJEyVYaMxk0keoxJ4O5D3dDabcidsWfjQsVirq7V41tU7TchmnhrLdYX
	qM/phcNVQYpPeFhKeLsiuIr1f34FPiHoUYwGTRoxWJM3r3QaWjIFThwEUsyXy6z1hx9xDp9ekJA5f
	s+PLmbKPyqLYieDq3J93m0tzhUfAUzXbX3Lz2nesIYawcY0g/oqxzO4LjuzMG27TLEXWn53R7lZNa
	EfwmwnGk3aHshYcGBVW6o14ypkNvddPgoNSKJsxwxOTy99WmDqTDDojCLhCKxU0ojWbIsrfYn4zwR
	7bLjRXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9x5-0000000225A-22QT;
	Thu, 05 Mar 2026 14:45:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9x4-0000000221o-0pdq
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 14:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5uYYrTxgCNY4rMLT4G/7+afDXw0hVwj97ZivhOeoJtQ=; b=VHpCA5eC3qGufZwCjgxKbFlGRI
	H8PFOY8uxCRp6swz0vK8gNNMnUOmJLvFv2F5GORF4O3yaOfUXpZboG88clnsS/GiyHorLi8lHHRYd
	WoXHuwUMhvCMbf19cr9AC43btM+0xpZCKGQnO1EQeG/u2R/Apj0a6XIEcymoWwNPJIk/ZN34h8Lyq
	gbuwqdP5md6vNMOZv0ix30Jrj+KDW1LBTxRqnA2IM7b4MbH/7QR3C8T675yk/g9iAthnY3vQNu0H0
	oho9xZsufGqUO2LyiIld0EVJQi0xlSsrNS7dViO++2hRj7re6AbIbMLAO2kGr8nM+tjWQCXGXnUM0
	ICCA/7Jg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9x0-00000006yMB-13sC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:45:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E5D1E42B1B;
	Thu,  5 Mar 2026 14:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E495DC19423;
	Thu,  5 Mar 2026 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721916;
	bh=9bxzJMbzCySm9hHPY4I1q+HVEuSM2S18zUCS/sk+q6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UGQsWi2/DyABwX3oysIJmxpurOnUdKtt/fsrNBmvD8jdUNZEYGs5CIv1tyZC/13Zg
	 88JcX0P1QyM7AvS2aKdAV40tGcbJWPvfumyPg0iGUqhDhjI1LgHiV+TyRa3e96t3gM
	 V2QcB5Ui817jCEsd/yAt0Ty1b1D0uwwxiMRXzfpv7zsVqow+pNWQXSREk6+6EomY7R
	 br2ssv8f4zZ2NeT1zBihsugHHea652bwtfjsP0Chmte2dMCxNHuiyYzSfHptDmL+7f
	 bsF73xRTb4IeTlL9VBr+E7xMaRgimINP8MPNKG9xWaivkvAoiAOfeqy1N2Dc6gEK/4
	 uBvkImavT5dtg==
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
Subject: [PATCH v3 19/36] KVM: arm64: Avoid pointless annotation when mapping host-owned pages
Date: Thu,  5 Mar 2026 14:43:32 +0000
Message-ID: <20260305144351.17071-20-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144518_489951_60D282AA 
X-CRM114-Status: GOOD (  12.83  )
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

When a page is transitioned to host ownership, we can eagerly map it
into the host stage-2 page-table rather than going via the convoluted
step of a faulting annotation to trigger the mapping.

Call host_stage2_idmap_locked() directly when transitioning a page to
be owned by the host.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 28 +++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 0dc1d6fc546c..f673ebe7c888 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -551,23 +551,27 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 {
-	int ret;
+	int ret = -EINVAL;
 
 	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
 
-	ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
-			      addr, size, &host_s2_pool, owner_id);
-	if (ret)
-		return ret;
+	switch (owner_id) {
+	case PKVM_ID_HOST:
+		ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
+		if (!ret)
+			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
+		break;
+	case PKVM_ID_GUEST:
+	case PKVM_ID_HYP:
+		ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
+				      addr, size, &host_s2_pool, owner_id);
+		if (!ret)
+			__host_update_page_state(addr, size, PKVM_NOPAGE);
+		break;
+	}
 
-	/* Don't forget to update the vmemmap tracking for the host */
-	if (owner_id == PKVM_ID_HOST)
-		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
-	else
-		__host_update_page_state(addr, size, PKVM_NOPAGE);
-
-	return 0;
+	return ret;
 }
 
 static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
-- 
2.53.0.473.g4a7958ca14-goog


