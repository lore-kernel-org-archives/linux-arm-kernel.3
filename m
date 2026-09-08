Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A79C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFmPExN49W4LxltEC5wNkCXW8bsWlpX87tLZS67TYVo=; b=tJMDVlyxleg9wSHuU52cymK4iW
	hpUIwe0Pf7rvpvUXeCgLUoi9/Dc4KrWK48dykroakw2didXOnvMMni53PEcDfbnVz8YYVFd8Sfjzz
	F5/No6XFNr8QBq6ZJcxxu1JCthxt0NJvgK5mV5q5c1HQOnlBugkKFiWg3vnyb1JzrnooJnT/AHwCV
	gp/PAk2rkhVR7iZ/LBppmR0y8oUquzHTiVvj1Oq8XxFuGSGuVd02zwSERhK0MeI8j9GvnQOGkIOkt
	ajAcBoeL9R9D2sGlL2uJ/mtUqXscQeIIlYRR9Bj0R2pqBxpL5n0TRvx7hz4MDpJ+L+XRW5llrg9V6
	KYvP1Tvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfp-00000008qYV-1UGK;
	Tue, 08 Sep 2026 11:07:33 +0000
Received: from out-97.mta0.migadu.com ([2001:41d0:1004:224b::61] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tfm-00000008qWi-1CAE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 11:07:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7bNXYL8yUcqTH70nhL/AuRr3pORuUPvFqJ6xx9nB3rY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788865648; v=1; x=1789470448;
 b=LZjw2NbugqnYGVCacADZeG65gwnpjhnxo6xTX4MLAiDbDtkzcw6shcHmuIQT2//PDYfxh6fP
 Yup2NQHhBKJzo6168eWCWjcYXng/uXtilm8kz3F7QaBc5Pv9e9iUZFNzBZwpkil9CADhrgCxwLP
 L+DHz1bzpTm6yLen09gZdN3U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 50cb0b689ffa052e;
	Tue, 08 Sep 2026 11:07:27 +0000
X-Mizu-Trace-ID: 50cb0b689ffa052e
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Quentin Perret <qperret@google.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] KVM: arm64: Match hyp text by physical address in fix_host_ownership()
Date: Tue,  8 Sep 2026 12:07:11 +0100
Message-Id: <20260908110713.1540304-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260908110713.1540304-1-fuad.tabba@linux.dev>
References: <20260908110713.1540304-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_040730_469015_F9675529 
X-CRM114-Status: GOOD (  15.57  )
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

On a non-hVHE host, fix_host_ownership_walker()'s test for PAGE_HYP_EXEC
never matches: KVM_PGTABLE_PROT_UX is cleared at map time and only PX is
reported on read-back. Hyp text is therefore donated rather than left
read-only in the host stage-2, and the instruction dump in
nvhe_hyp_panic_handler() reads a page the host has no access to.

Match the text by physical address instead, in a helper a later patch
reuses. A test on the permissions would leave any other executable
mapping host-readable too.

Fixes: 80cbfd7174f31 ("KVM: arm64: Honor UX/PX attributes for EL2 S1 mappings")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 1 +
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 8 ++++++++
 arch/arm64/kvm/hyp/nvhe/setup.c               | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 29935c7da1dec..cab27f7bd423a 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -52,6 +52,7 @@ int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
+bool addr_is_hyp_text(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id);
 int kvm_host_prepare_stage2(void *pgt_pool_base);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 39aa8911f62c1..d026f446bd8ef 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -450,6 +450,14 @@ bool addr_is_memory(phys_addr_t phys)
 	return !!find_mem_range(phys, &range);
 }
 
+bool addr_is_hyp_text(phys_addr_t phys)
+{
+	phys_addr_t start = ALIGN_DOWN(__hyp_pa(__hyp_text_start), PAGE_SIZE);
+	phys_addr_t end = PAGE_ALIGN(__hyp_pa(__hyp_text_end));
+
+	return phys >= start && phys < end;
+}
+
 static bool is_in_mem_range(u64 addr, struct kvm_mem_range *range)
 {
 	return range->start <= addr && addr < range->end;
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 362f2891cb32e..bb667cd7080b4 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -217,7 +217,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	case PKVM_PAGE_OWNED:
 		set_hyp_state(page, PKVM_PAGE_OWNED);
 		/* hyp text is RO in the host stage-2 to be inspected on panic. */
-		if (prot == PAGE_HYP_EXEC) {
+		if (addr_is_hyp_text(phys)) {
 			set_host_state(page, PKVM_NOPAGE);
 			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
 		} else {
-- 
2.39.5


