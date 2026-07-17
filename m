Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769D6C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGVeKTTWAc9E9IUshZYvJfmhVmD43mhNRriYPRWPSws=; b=EQmZTTkZS210M2AJzmYvLMTkOg
	Xej4u65DK1hFPYkhbvmtJjv31RY6u3evaJvLjJsFPSh7upnnoTq5zsiaD+NOLi4/FAOZPMmEhZOEB
	lg7Pwpkp4xHpv16BnMa0hv0SAl0TfxwPXmRby0nIp6QDIrdXJ8Ayvt1j7y404/xozu19In7ReFaAR
	FDezbSgXTc7gakPKOqRcQR7v7A+7Uzx3W/TMY2+AA1l6lssAtFnkmkX2NVNppuhLY/cV+2NBSrxGv
	MGVKCWX6FXQ4fYWzQOcAqHL7TT2whbD+EgfJy1W2fmE3G7Y3rSvY505/D6fmLzWEV30ItJoOXt9kB
	AfMqI6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEY-00000002LhF-0kJt;
	Fri, 17 Jul 2026 13:04:06 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEW-00000002LgB-1Lam
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:04:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784293440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nGVeKTTWAc9E9IUshZYvJfmhVmD43mhNRriYPRWPSws=;
	b=bTt1bC3tHPWxJo2efKJyKDuIt3XSi86C7GZICKn3qXE5I7cB/GAaA8VjpnZFgwl6xjOAZV
	uRDQ2pj768cQ0u8loDjVpiWbLRxhY9pu8D90pYSXaPs34u49hU7AY2tb5I4gW/zMuCATcB
	IvUxUdpzsAJoVi65gSAKgaNOobkCcfg=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Dev Jain <dev.jain@arm.com>,
	Bradley Morgan <include@grrlz.net>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] KVM: arm64: Skip cache maintenance for non-cacheable pKVM mappings
Date: Fri, 17 Jul 2026 14:03:11 +0100
Message-Id: <20260717130317.1953574-2-fuad.tabba@linux.dev>
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060404_503544_1335EFE0 
X-CRM114-Status: GOOD (  10.65  )
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

From: Bradley Morgan <include@grrlz.net>

The pKVM flush path walks its own pkvm_mappings list and cleans the
data cache for every mapping, unlike the generic stage-2 walker it
shadows, which skips non-cacheable leaves. Cleaning the cacheable
alias of a non-cacheable mapping is pointless and can corrupt a
device endpoint. Record whether a mapping is non-cacheable in spare
bits of nr_pages and skip cache maintenance for it.

Fixes: e912efed485a ("KVM: arm64: Introduce the EL1 pKVM MMU")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Bradley Morgan <include@grrlz.net>
[tabba: use Marc's anonymous bitfield in place of the open-coded mask and helpers]
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pkvm.h |  5 ++++-
 arch/arm64/kvm/pkvm.c             | 15 +++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 74fedd9c5ff0..57afb07d6b13 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -195,7 +195,10 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
-	u64 nr_pages;
+	struct {
+		u64 nr_pages:48;
+		u64 nc:1;
+	};
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..f70c601dcf4c 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -369,7 +369,7 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
-					mapping->nr_pages);
+					(u64)mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -473,6 +473,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
 	mapping->nr_pages = size / PAGE_SIZE;
+	mapping->nc = !!(prot & (KVM_PGTABLE_PROT_DEVICE | KVM_PGTABLE_PROT_NORMAL_NC));
 	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
@@ -503,7 +504,7 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
 		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
-					mapping->nr_pages);
+					(u64)mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -517,9 +518,11 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 	struct pkvm_mapping *mapping;
 
 	lockdep_assert_held(&kvm->mmu_lock);
-	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
-					  PAGE_SIZE * mapping->nr_pages);
+	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
+		if (!mapping->nc)
+			__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+						  PAGE_SIZE * mapping->nr_pages);
+	}
 
 	return 0;
 }
@@ -537,7 +540,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mapping->nr_pages, mkold);
+					   (u64)mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.39.5


