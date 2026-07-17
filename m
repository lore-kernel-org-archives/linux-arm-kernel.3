Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEBEC44521
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQfbr1Pd7lVsaw2RzzlCdtntUUL+zBQG5yeNfbLMXec=; b=HI1hXbxm0Z0Nx6azgwJKUO65eI
	RtBFv/nZrdaH0whuPQBIoGaZ7dhgt4OWVddyTL/XuJd4S+fL8QGsZ2lD1sIt2wLyLiBq3ee0lReKF
	S1UQ91AqBh7DDUbe4gW4KHdjjhpLPFdGdVD/sCosV5N5lbyOjowe5H5BSmuJ7v9rIf1Cddx3Sjyh+
	R7OjKdJfEb/H/BPPBNvQMIRJbsfbKdzNLNB3Gg7h4sc7zVHBQh0QTuLm8XHBa7nNJktlAUtEgQY2q
	V5ZW1kvmrFtWG6XP33kOSL8ZicS6JcSd9Mbqrd5LL/D/bDGWMYBFxXPgHz3LLqBl6YF1xLUtt51SR
	gp31+zxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEi-00000002Llj-1WZi;
	Fri, 17 Jul 2026 13:04:16 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEY-00000002Lgf-0RBZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:04:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784293443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQfbr1Pd7lVsaw2RzzlCdtntUUL+zBQG5yeNfbLMXec=;
	b=qIpcuxTaDqo6sQz8/i5CXU/dpCr2ttdwiMxdMha9Lg5rEajvtQvQ6WJQLiBnoEKtAH4r7x
	dAuyhQeNzDPdcY5tBqHqiO1JocEGtwmQAE8aRj4BFUrDpLm16+GHKtAp9kneAPxFrz2ZrV
	IVPaeeXa8W4oLN0N2Fkg11vbF6KdKss=
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
Subject: [PATCH v5 2/7] KVM: arm64: Top up the memcache for pKVM permission faults
Date: Fri, 17 Jul 2026 14:03:12 +0100
Message-Id: <20260717130317.1953574-3-fuad.tabba@linux.dev>
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060406_293863_D745F5D3 
X-CRM114-Status: GOOD (  11.84  )
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

A permission fault normally only relaxes a leaf, so user_mem_abort()
skips the memcache top-up. Under pKVM such a fault can instead collapse
pages into a block. That needs a fresh pkvm_mapping object, and without
it cache->mapping is NULL, so pkvm_pgtable_stage2_map() dereferences NULL
and faults the host under mmu_lock. Staging only the object is not
enough: the hypervisor requires kvm_mmu_cache_min_pages in the memcache
even for the allocation-free install, so under memcache pressure the
collapse returns -ENOMEM and trips the WARN_ON(ret) in
pkvm_pgtable_stage2_map() where a non-pKVM guest succeeds.

Top up the full memcache for pKVM permission faults so both the mapping
object and the min-pages are staged before mmu_lock.

Fixes: db14091d8f75 ("KVM: arm64: Stage-2 huge mappings for np-guests")
Reported-by: Bradley Morgan <include@grrlz.net>
Link: https://lore.kernel.org/all/20260623161545.EA08E1F000E9@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 6c941aaa10c6..4d7c9bdcef00 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2114,10 +2114,14 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * and so normally don't require allocations from the memcache. The
 	 * only exception to this is when dirty logging is enabled at runtime
 	 * and a write fault needs to collapse a block entry into a table.
+	 * Under pKVM a permission fault can also collapse pages into a block,
+	 * which needs a fresh mapping object, and the hypervisor requires the
+	 * min-pages memcache even when the install allocates nothing.
 	 */
 	memcache = get_mmu_memcache(s2fd->vcpu);
 	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
-			    kvm_is_write_fault(s2fd->vcpu))) {
+			    kvm_is_write_fault(s2fd->vcpu)) ||
+	    is_protected_kvm_enabled()) {
 		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
 		if (ret)
 			return ret;
-- 
2.39.5


