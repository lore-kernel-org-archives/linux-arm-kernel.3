Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13262D778B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TLFN4riCcqXZkp92Q66t46OcbVEJsrrLmZNN8b9T4w=; b=AZntZ0QzJp6eipe6Di3RndZMm7
	vQyeVFYFE2wU02kObPvWUQgkbBMfNeqGoJK+xKmpKxBaeRB6IJG2chU1hSmGZT+k5j9aUJ4EfVVxO
	FqFcnCkvQ5gHn7vv8YL/dfzRgWIaTNItBW4Oh5QURFFkRD35IXBOsFcgtHLHCMJtkwThp9ifxpewC
	Nnf72sA22GZ5qyvtnElgaLIe0B/OZz86dsLconGUiWUz/bfpCtxUAOk9TYhLns4FpPDt3ainhE3V9
	DDxiHrcojQ5euIl+hHYY0WZ4HNEs36q6pUwqGXSeNuC/PLjslqd/Mhd2GQ+CRGYOKgaZUz5QlphC6
	wGU+QoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeI-00000009O2s-1ej7;
	Fri, 23 Jan 2026 19:16:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeB-00000009Nzf-3Ha2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C44E4407B;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF54C2BCB0;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195803;
	bh=SCVycz0ZO5P/i92rYNjTN7t6tRCsvv/79dcDHaL+Sdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAZeuFdQnyOloHnDJx1XJwxnAIomurEvtVDyNyFsg2WdGCrBVgA/+IPvT+FSkoXPs
	 t0e5RyOBFPvy/Mj60a1Un9CL2Kd3VxeFOqot7g3DHJfaFtyY61vIZW3gfAYB9XNvfX
	 nk01pfZyqbsNwOMZ6JS8VnCpzFHA6zXUy4oNfEsFe4ZhO+iGZUOObnoQPK6QQN3Af5
	 DoI26PwoUeb3kskc2eu37FW5v14xpq0v/9VYaRa/nYSepJ3anOr/pRaC1+4Gsac6zH
	 hoDIwwdp2yksnIYCA6CBZaJKduhCI1ibsS3IDais/dMqVlYO+YHDdoKbVEIM6ebkqR
	 CXXlJ7wUd8QJA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vjMe9-00000005A2V-2Agh;
	Fri, 23 Jan 2026 19:16:41 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v2 4/5] KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
Date: Fri, 23 Jan 2026 19:16:36 +0000
Message-ID: <20260123191637.715429-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123191637.715429-1-maz@kernel.org>
References: <20260123191637.715429-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com, alexandru.elisei@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_111643_866365_552FBEFB 
X-CRM114-Status: GOOD (  16.07  )
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

Nobody is using this flag anymore, so remove it. This allows
some cleanup by removing stage2_has_fwb(), which is can be replaced
by a direct check on the capability.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h |  7 ++-----
 arch/arm64/kvm/hyp/pgtable.c         | 21 ++++++---------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 9ce51a637da0a..2198b62428832 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -229,15 +229,12 @@ struct kvm_pgtable_mm_ops {
 
 /**
  * enum kvm_pgtable_stage2_flags - Stage-2 page-table flags.
- * @KVM_PGTABLE_S2_NOFWB:	Don't enforce Normal-WB even if the CPUs have
- *				ARM64_HAS_STAGE2_FWB.
  * @KVM_PGTABLE_S2_IDMAP:	Only use identity mappings.
  * @KVM_PGTABLE_S2_AS_S1:	Final memory attributes are that of Stage-1.
  */
 enum kvm_pgtable_stage2_flags {
-	KVM_PGTABLE_S2_NOFWB			= BIT(0),
-	KVM_PGTABLE_S2_IDMAP			= BIT(1),
-	KVM_PGTABLE_S2_AS_S1			= BIT(2),
+	KVM_PGTABLE_S2_IDMAP			= BIT(0),
+	KVM_PGTABLE_S2_AS_S1			= BIT(1),
 };
 
 /**
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c52a24c15ff28..00e33a16494bd 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -631,14 +631,6 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
 	return vtcr;
 }
 
-static bool stage2_has_fwb(struct kvm_pgtable *pgt)
-{
-	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
-		return false;
-
-	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
-}
-
 void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 				phys_addr_t addr, size_t size)
 {
@@ -661,14 +653,13 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 
 #define KVM_S2_MEMATTR(pgt, attr)					\
 	({								\
+		bool __fwb = cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);	\
 		kvm_pte_t __attr;					\
 									\
 		if ((pgt)->flags & KVM_PGTABLE_S2_AS_S1)		\
-			__attr = PAGE_S2_MEMATTR(AS_S1,			\
-						 stage2_has_fwb(pgt));	\
+			__attr = PAGE_S2_MEMATTR(AS_S1,	__fwb);		\
 		else							\
-			__attr = PAGE_S2_MEMATTR(attr,			\
-						 stage2_has_fwb(pgt));	\
+			__attr = PAGE_S2_MEMATTR(attr, __fwb);		\
 									\
 		__attr;							\
 	})
@@ -880,7 +871,7 @@ static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
 	 * system supporting FWB as the optimization is entirely
 	 * pointless when the unmap walker needs to perform CMOs.
 	 */
-	return system_supports_tlb_range() && stage2_has_fwb(pgt);
+	return system_supports_tlb_range() && cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
 }
 
 static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
@@ -1160,7 +1151,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 		if (mm_ops->page_count(childp) != 1)
 			return 0;
 	} else if (stage2_pte_cacheable(pgt, ctx->old)) {
-		need_flush = !stage2_has_fwb(pgt);
+		need_flush = !cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
 	}
 
 	/*
@@ -1390,7 +1381,7 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 		.arg	= pgt,
 	};
 
-	if (stage2_has_fwb(pgt))
+	if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
 		return 0;
 
 	return kvm_pgtable_walk(pgt, addr, size, &walker);
-- 
2.47.3


