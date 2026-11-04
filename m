Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A8F606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vtteTcxp;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QylGKXh7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AOH3Su8TZJSoK9UPHpeuwIAfG494iGEabcz+aB8amog=; b=vtteTcxpdtLsT6
	efHmvZXeuqz8zEIN0bsKOVc9gfO+M70djU6jb5B/iW75EMmBiZhvpHleMXRW180mkIUEUD9ffFf+J
	KkN6nZ6wGmHncP+t79xpjdByniusvxHY6QoNOxn7mGIL8ofRPmqRPFlEDzYJieCl9JVUbQmRNhZ1J
	sj8RVawo8/DYrei+Nu1ADV2nPkfZh8+zv4o5JiSywkkj+BSU+megsZLBhmsqJXe6Vmkjs8sYkPmt/
	tP9p+efN9NlaJ33QCpNqIdD1EX+e/SxJ4PicdoRkiiMDoumLg0REGkDfhoe1raORU2fEo9XU0RZYJ
	dNhXiEh2+5gbyeYlmbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaMO-00000005MnL-0w2A;
	Wed, 04 Nov 2026 12:45:00 +0000
Received: from out-148.mta1.migadu.com ([95.215.58.148] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaMI-00000005Mkk-43RS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:44:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=MxRHPNAABvoNmLp9OTJVcSokfGwwqtsziGyV/1PffQk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793796293; v=1; x=1794401093;
 b=QylGKXh7uruaLMMEMoxZ64DR/6WRHSeRr9NW0qyTOuBE10TrPTF2dySKAaKqBH8OXK9T5lgW
 JuVyld+yb+3T7O/1JiDm1nj1jAxQHg1Yx+8Ir/sF6OYZ8nchI3kbHqN0Ed71GeYVXqwp3PGSJvU
 Px8botegn2j4AGcqtjnNkmgM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fec1c38f76d92ee4;
	Wed, 04 Nov 2026 12:44:53 +0000
X-Mizu-Trace-ID: fec1c38f76d92ee4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the walk stopped
Date: Wed,  4 Nov 2026 12:44:50 +0000
Message-ID: <20261104124451.2148724-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104124451.2148724-1-fuad.tabba@linux.dev>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_044456_928511_F83EDBC8 
X-CRM114-Status: GOOD (  15.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
destroying the stage-2 page-tables"), kvm_stage2_destroy() walks the
IPA space one block-sized chunk at a time. The walker steps over an
invalid entry in one go, but the next walk starts at the following
chunk, so an invalid entry larger than a chunk is visited once for every
chunk it covers. Destroying a VM with a 52-bit IPA then takes 2^27 walks
with 16K pages (2^22 with 4K), however little it maps.

Have kvm_pgtable_stage2_destroy_range() return the address its walk
reached, which kvm_pgtable_walk() doesn't expose, and resume from there.
pkvm_pgtable_stage2_destroy_range() returns the end of its range, and
EL2's kvm_pgtable_stage2_destroy() ignores the value.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pgtable.h |  8 ++++++--
 arch/arm64/include/asm/kvm_pkvm.h    |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c         | 15 ++++++++++++---
 arch/arm64/kvm/mmu.c                 |  4 ++--
 arch/arm64/kvm/pkvm.c                |  8 +++++---
 5 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1c9c57cd6ae40..20b988e99e074 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -599,9 +599,13 @@ void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
  *
  * The page-table is assumed to be unreachable by any hardware walkers prior
  * to freeing and therefore no TLB invalidation is performed.
+ *
+ * Return: the address the walk reached, which can be past @addr + @size
+ * when the range ends within a block or an invalid entry, or @addr + @size
+ * if the walk fails.
  */
-void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size);
+u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				     u64 addr, u64 size);
 
 /**
  * kvm_pgtable_stage2_destroy_pgd() - Destroy the PGD of guest stage-2 page-table.
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fd042d2b54624..731632aa24520 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -349,8 +349,8 @@ int __pkvm_handle_smccc_req(struct arm_smccc_res *res);
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops);
-void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size);
+u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				      u64 addr, u64 size);
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 			    enum kvm_pgtable_prot prot, void *mc,
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837b184d3..6bb1c0beb4dcc 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1653,16 +1653,25 @@ static int stage2_free_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	}
 }
 
-void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-				       u64 addr, u64 size)
+u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				     u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
+	struct kvm_pgtable_walk_data data = {
+		.walker	= &walker,
+		.start	= addr,
+		.addr	= addr,
+		.end	= addr + size,
+	};
 
-	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
+	if (WARN_ON(_kvm_pgtable_walk(pgt, &data)))
+		return addr + size;
+
+	return data.addr;
 }
 
 void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db73..4f1adadeffb8b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1011,8 +1011,8 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
 
 	do {
 		next = stage2_range_addr_end(addr, end);
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
-							     next - addr);
+		next = KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr, next - addr);
+		next = min(next, end);
 		if (next != end)
 			cond_resched();
 	} while (addr = next, addr != end);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..f21c3326dda68 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -499,14 +499,14 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size)
+u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				      u64 addr, u64 size)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
 
 	if (!handle)
-		return;
+		return addr + size;
 
 	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
@@ -517,6 +517,8 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
 	else
 		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
+
+	return addr + size;
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.47.3


