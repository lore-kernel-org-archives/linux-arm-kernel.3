Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF9EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vr/FgvFNVbQZ7k5DS6nasPQDgYDiYgKZ1Y+SWdSiMz0=; b=1Xs5eGuikIL59RsDflcb/gSjXA
	RzgT5FzT3sSPM97jWHruqJMKZY21U/hDVfku8i9l2RHjM9WLyWh5x5bcwZ8Yhd+euoscL/PhQWlLo
	ylwqozHMblbd+ZSJ5JaRW9WjxA4h36uilWK8migE5ds1+yYnsulucggEjVC1T2IKXgAWofOi3ye1t
	YOh8UqCADjeYRc4ylnHVj9hdhU7g1laaZwTCMx4KJBBplQ9t9apvMigJiTuXn6HlqMSDTi+5bzYev
	IAhMFWikGWZkaK2Pq7vZAixlYcHPClnNe5KBWo4457FivIKCEeWna8TuS/nJdF8CFpIC1xoe1zGRE
	dtJ2LzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo9-0000000Bpdn-2rjf;
	Tue, 14 Jul 2026 12:00:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbo0-0000000BpYW-2WlY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:00:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCEDF1477;
	Tue, 14 Jul 2026 05:00:03 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99ACC3F93E;
	Tue, 14 Jul 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784030408; bh=0sHCsiFR68L+YiQqudbh7dXb+D2OosNbQD6DJoCp7Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YjU4N3bdOSPXXEn2diDSlkjIBmOqSHXjvjYKDQy7IeV2AUTdV2OGKfEkPD6GjhDR9
	 /fzMnKugMlyxjJaUaPQn2Qhgz28K/JqqRc9O4z6+niQRI05C8pkW5nSN+QyswWwrHI
	 IrXqcKGSeh38bjN9L5YgE5OiTQoVx3tK7uopgpVI=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Sebastian Ene <sebastianene@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v4 3/6] KVM: arm64: nv: Add nested revmap broken tracepoint
Date: Tue, 14 Jul 2026 12:59:22 +0100
Message-ID: <20260714115926.2044757-4-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714115926.2044757-1-weilin.chang@arm.com>
References: <20260714115926.2044757-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_050008_746984_4E33470D 
X-CRM114-Status: GOOD (  11.44  )
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

Add a tracepoint to track when a nested reverse map becomes broken. This
makes it easier to detect NV performance degradation caused by full
shadow stage-2 unmaps.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/nested.c    |  7 ++++++-
 arch/arm64/kvm/trace_arm.h | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 065823e415ce..22f8a1daca93 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -17,6 +17,7 @@
 #include <asm/sysreg.h>
 
 #include "sys_regs.h"
+#include "trace.h"
 
 struct vncr_tlb {
 	/* The guest's VNCR_EL2 */
@@ -916,8 +917,12 @@ void kvm_record_nested_revmap(gpa_t canonical_ipa, struct kvm_s2_mmu *mmu,
 
 	mas_set_range(&mas_rmap, canonical_ipa, canonical_ipa_end);
 	if (mas_store_gfp(&mas_rmap, xa_mk_value(new_entry),
-			  GFP_NOWAIT | __GFP_ACCOUNT))
+			  GFP_NOWAIT | __GFP_ACCOUNT)) {
+		trace_kvm_nested_revmap_broken(mmu - mmu->arch->nested_mmus,
+					       canonical_ipa, canonical_ipa_end,
+					       nested_ipa, new_entry);
 		mmu->nested_revmap_broken = true;
+	}
 unlock:
 	mtree_unlock(revmap_mt);
 }
diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
index 9c60f6465c78..0db90068ff63 100644
--- a/arch/arm64/kvm/trace_arm.h
+++ b/arch/arm64/kvm/trace_arm.h
@@ -415,6 +415,33 @@ TRACE_EVENT(kvm_forward_sysreg_trap,
 		      sys_reg_Op2(__entry->sysreg))
 );
 
+TRACE_EVENT(kvm_nested_revmap_broken,
+	    TP_PROTO(int mmu_idx, unsigned long canonical_ipa,
+		     unsigned long canonical_ipa_end, unsigned long nested_ipa,
+		     unsigned long revmap_entry),
+	    TP_ARGS(mmu_idx, canonical_ipa, canonical_ipa_end, nested_ipa, revmap_entry),
+
+	    TP_STRUCT__entry(
+		__field(int,			mmu_idx)
+		__field(unsigned long,		canonical_ipa)
+		__field(unsigned long,		nested_ipa)
+		__field(size_t,			size)
+		__field(unsigned long,		revmap_entry)
+	    ),
+
+	    TP_fast_assign(
+		__entry->mmu_idx = mmu_idx;
+		__entry->canonical_ipa = canonical_ipa;
+		__entry->nested_ipa = nested_ipa;
+		__entry->size = canonical_ipa_end - canonical_ipa + 1;
+		__entry->revmap_entry = revmap_entry;
+	    ),
+
+	    TP_printk("mmu idx: %d, cipa: 0x%016lx, nipa: 0x%016lx, size: 0x%016lx, entry: %016lx",
+		      __entry->mmu_idx, __entry->canonical_ipa, __entry->nested_ipa,
+		      __entry->size, __entry->revmap_entry)
+);
+
 #endif /* _TRACE_ARM_ARM64_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
-- 
2.43.0


