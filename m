Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5246CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi0tH5n6uBH/soujkHFUk2KURUNoEpOtR8Tl3E0iSbo=; b=VNG7wbSCp7ukHGIF+y2WL84hQn
	bKukWGwRHkVK2xpRODVj9LndgWq65qq1DrOiftM0e/VPyRkKP3m+MeXq9vvPGgB3q8chxB3v2HmXs
	6duqsHpu0YXJNCHTFqqsqXoyHC/A56JGMpp82FanP6W/k06yD3P++H4kOViQO+2vOtR5CshMilWN+
	Qgqg8QhxIGIsiy2i1dOpSX6qPV/xHjdbrEoPnsgGoVQYyVzvfElXCWuJVdvjEciTvyX/ism+4oOxN
	3f+oGArLDyZ+lxky3boH7SwbwDVqhszIboKcdNb1o/Uac+iwMnzZhPi/BMWfGGKbxzxIyzQ9bjQBz
	s+bS4OCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ2J-000000084Z5-07zz;
	Wed, 24 Jun 2026 16:01:11 +0000
Received: from confino.investici.org ([2a11:7980:1::2:0])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQ2C-000000084UL-20nq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 16:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782316855;
	bh=bi0tH5n6uBH/soujkHFUk2KURUNoEpOtR8Tl3E0iSbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lfCl9NvR5B7rPfGorQ2AEVrkopBtTZiGohEo7Tk1h26yjYF9aphdtHTTfKW4lgs11
	 HoF0gQO5yrLO969TXS//t1GPTZvB4wAjP7Ix3Tf8MWrcSJuiYTnAecI9LFFCbjh1fW
	 8536xBhvVsErhkK8MQduDBov/TVMUwGrVrEGx33g=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glmr70Yl9z10v0;
	Wed, 24 Jun 2026 16:00:55 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glmr52j3nz10tb;
	Wed, 24 Jun 2026 16:00:53 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <include@grrlz.net>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] KVM: arm64: top up pKVM mapping cache for permission faults
Date: Wed, 24 Jun 2026 16:00:27 +0000
Message-ID: <20260624160028.15591-3-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624160028.15591-1-include@grrlz.net>
References: <20260624160028.15591-1-include@grrlz.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_090104_685246_BA3193BD 
X-CRM114-Status: GOOD (  16.84  )
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

Permission faults normally only relax an existing leaf, so the fault path
does not top up the memcache.

With pKVM, a permission fault can also replace page mappings with a
PMD mapping. That path needs a fresh pkvm_mapping object, and can
dereference a NULL cache->mapping if the cache was not topped up.

Allocate just that object for pKVM permission faults.

The issue was discovered [1] by Sashiko.

Link: https://lore.kernel.org/all/20260623161545.EA08E1F000E9@smtp.kernel.org/ [1]

Fixes: db14091d8f75 ("KVM: arm64: Stage-2 huge mappings for np-guests")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kvm/mmu.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..3f57f6825a33 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1177,17 +1177,26 @@ void free_hyp_memcache(struct kvm_hyp_memcache *mc)
 	__free_hyp_memcache(mc, hyp_mc_free_fn, kvm_host_va, mc);
 }
 
+static int topup_hyp_memcache_mapping(struct kvm_hyp_memcache *mc)
+{
+	if (mc->mapping)
+		return 0;
+
+	mc->mapping = kzalloc_obj(struct pkvm_mapping,
+				  GFP_KERNEL_ACCOUNT);
+	return mc->mapping ? 0 : -ENOMEM;
+}
+
 int topup_hyp_memcache(struct kvm_hyp_memcache *mc, unsigned long min_pages)
 {
+	int ret;
+
 	if (!is_protected_kvm_enabled())
 		return 0;
 
-	if (!mc->mapping) {
-		mc->mapping = kzalloc_obj(struct pkvm_mapping,
-					  GFP_KERNEL_ACCOUNT);
-		if (!mc->mapping)
-			return -ENOMEM;
-	}
+	ret = topup_hyp_memcache_mapping(mc);
+	if (ret)
+		return ret;
 
 	return __topup_hyp_memcache(mc, min_pages, hyp_mc_alloc_fn,
 				    kvm_host_pa, mc);
@@ -2113,7 +2122,9 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
 	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
+	 * and a write fault needs to collapse a block entry into a table. With
+	 * pKVM, they may still need a fresh mapping object if the fault turns
+	 * page entries into a block entry.
 	 */
 	memcache = get_mmu_memcache(s2fd->vcpu);
 	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
@@ -2121,6 +2132,10 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
 		if (ret)
 			return ret;
+	} else if (is_protected_kvm_enabled()) {
+		ret = topup_hyp_memcache_mapping(memcache);
+		if (ret)
+			return ret;
 	}
 
 	/*
-- 
2.53.0


