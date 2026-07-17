Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9FBC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tm/R+8+SeI3EIiHJjFKMzh728Ajegh5x45TsNe4aXWo=; b=jPgI379ambkI0fyKOSB2tr35t7
	kEIqrhtWBqhj2uQEmn54zGYIgtjeGC7Kg/wHOWRVtJzNN1eSuv3glMCl+Mk++gW89j/b8KewJkeL+
	t0eiqvppFfx47Zn05LeS8uwqB9k3Ku6+0QmMMEL5H3YB4t4uK+qi8mCfqqccOnD0Tx55wpuz8FxW1
	+6/ON7IcLC2+Teo/zxokBrFjyol0dTkR4E1ahft21nxSQ26VeUL6bnaKe4fNN7IfSsMRuBrhrUwfl
	dN0apUw3Rd+ScD7d/QYHCwFiO4qqHWgWL69HTVLKOujjxStekfdcXXTkqgTzdHb0g+Nv9siAzjcbN
	Ye/wygJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEi-00000002Llz-1t99;
	Fri, 17 Jul 2026 13:04:16 +0000
Received: from out-172.mta1.migadu.com ([95.215.58.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiEa-00000002Li4-0uQT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:04:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784293445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tm/R+8+SeI3EIiHJjFKMzh728Ajegh5x45TsNe4aXWo=;
	b=EIdNAbavmrb8hsL8oklMYZ0FDv2qjouLDJOhckDFY72MVYlnR9MO5TvlRGezc+9Twi9Pt9
	YC/3unfpE2iBbjMSUznTLLfeaxOrdchIdRAwZ/jEPCT2sJglIgA1PD+1iZm79bOGCVWJP6
	FAckyQGF/bhUZmvs7toO5zz0XFrCCNI=
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
Subject: [PATCH v5 3/7] KVM: arm64: Top up stage-2 memcache for dirty logging faults
Date: Fri, 17 Jul 2026 14:03:13 +0100
Message-Id: <20260717130317.1953574-4-fuad.tabba@linux.dev>
In-Reply-To: <20260717130317.1953574-1-fuad.tabba@linux.dev>
References: <20260717130317.1953574-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060408_425271_66B8C4D3 
X-CRM114-Status: GOOD (  13.09  )
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

Dirty logging forces new stage-2 mappings to page size but does not
always split an existing block first (eager splitting is best effort
and off by default). A non-write permission fault on such a block, an
instruction fetch, still needs a page-table page to split it, but the
top-up is gated on write faults.

With the cache empty, kvm_mmu_memory_cache_alloc() hits its
guest-triggerable WARN_ON(!nobjs) and falls back to a GFP_ATOMIC
allocation under mmu_lock, with a BUG_ON() if that fails.

Top up the memcache for any permission fault while dirty logging is
active.

Fixes: 6f745f1bb5bf ("KVM: arm64: Convert user_mem_abort() to generic page-table API")
Link: https://lore.kernel.org/all/20260623165634.699011F000E9@smtp.kernel.org/
Signed-off-by: Bradley Morgan <include@grrlz.net>
[tabba: reword the commit message for the generic, non-pKVM failure mode]
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4d7c9bdcef00..74e7e7f7564c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2113,14 +2113,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
 	 * only exception to this is when dirty logging is enabled at runtime
-	 * and a write fault needs to collapse a block entry into a table.
+	 * and a fault needs to collapse a block entry into a table.
 	 * Under pKVM a permission fault can also collapse pages into a block,
 	 * which needs a fresh mapping object, and the hypervisor requires the
 	 * min-pages memcache even when the install allocates nothing.
 	 */
 	memcache = get_mmu_memcache(s2fd->vcpu);
-	if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
-			    kvm_is_write_fault(s2fd->vcpu)) ||
+	if (!perm_fault || memslot_is_logging(s2fd->memslot) ||
 	    is_protected_kvm_enabled()) {
 		ret = topup_mmu_memcache(s2fd->vcpu, memcache);
 		if (ret)
-- 
2.39.5


