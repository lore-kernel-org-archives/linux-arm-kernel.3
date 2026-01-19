Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B8CCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMzwb/1ivNB/sTSdIep+A97Ple7BnHBrff/sahGD9Yw=; b=af7V2ZRDb1c1v+GI4an4BP4ecc
	W+K1TzLp1gAh6gVtx03yrckvduD4mPVJP0H4OAtm5IEs9c7xEcxGJF3J9zBNCnmLEml6un9xc7+cr
	cJG49xri8lQCXyzcKawA3nkziwvVUhASdl2wNIR6XpE96Ks2zDgEN+21cjTfItFa98tBI7XnB1aNg
	IKoVDKetskf9LFCJAz8RRLfB7O/lkOiOs5xo+X38Nfx4wkgfbBdnobqW197BqbWQy3FOXzzlDeTi/
	o05rRX9Qr11jgWvrvevWWL5kX6O9wC1IQR3upk2cD9XRJVOvULaydRJuMj4nuTmkXyTmjPyQj9HfE
	2atDIuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwN-00000001pVX-2V5N;
	Mon, 19 Jan 2026 10:56:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmwM-00000001pUK-1jEg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D659C60152;
	Mon, 19 Jan 2026 10:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4987C116C6;
	Mon, 19 Jan 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820217;
	bh=6Rc/EPRN8QwqVJ8wI+PIZHJXX/E5p4bCZQ/EQLewt1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQf6LQQLaH9Gl1wOUT9xouTaeXbzRJr9FHhuFl6A53fXnldlqv4e+SUibkes+bIJc
	 t1DdueONzcA16h/TX1F2X5HWLO2J0ZxYaec0FkwSzsJdyXNozGrjP9Ag/OFBxafz4o
	 mns0xHuXa7waNR74my852EK0RqWj9Ybd9i/QEu68wJqbXf4jzTRinlpdAkD+bvaJlz
	 8atrTJmQmnHk/ABDOJm7KSrQ5IZ4IS7C5IpRORdAN+/lq1tec/LIOAzg6+/fqpvCIw
	 gwK45cdndTGIvh0cDRpGsM63bcarFIudHm7hAPS7UB0ITBfoCxAAsnbFJVa+2k39Ea
	 YLh0MYk/gNTCg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vhmwJ-00000003YVK-3Vi1;
	Mon, 19 Jan 2026 10:56:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 5/6] KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
Date: Mon, 19 Jan 2026 10:56:50 +0000
Message-ID: <20260119105651.255693-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119105651.255693-1-maz@kernel.org>
References: <20260119105651.255693-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
some cleanup for stage2_has_fwb(), whic doesn't need to take the
pgt as a parameter anymore.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h |  7 ++-----
 arch/arm64/kvm/hyp/pgtable.c         | 17 +++++++----------
 2 files changed, 9 insertions(+), 15 deletions(-)

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
index 07561a227f75e..3c2f7967fdc03 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -631,12 +631,9 @@ u64 kvm_get_vtcr(u64 mmfr0, u64 mmfr1, u32 phys_shift)
 	return vtcr;
 }
 
-static bool stage2_has_fwb(struct kvm_pgtable *pgt)
+static bool stage2_has_fwb(void)
 {
-	if (!cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
-		return false;
-
-	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
+	return cpus_have_final_cap(ARM64_HAS_STAGE2_FWB);
 }
 
 void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
@@ -664,10 +661,10 @@ void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
 		kvm_pte_t __attr;					\
 		if((pgt)->flags & KVM_PGTABLE_S2_AS_S1)			\
 			__attr = PAGE_S2_MEMATTR(AS_S1,			\
-						 stage2_has_fwb(pgt));	\
+						 stage2_has_fwb());	\
 		else							\
 			__attr = PAGE_S2_MEMATTR(attr,			\
-						 stage2_has_fwb(pgt));	\
+						 stage2_has_fwb());	\
 									\
 		__attr;							\
 	})
@@ -879,7 +876,7 @@ static bool stage2_unmap_defer_tlb_flush(struct kvm_pgtable *pgt)
 	 * system supporting FWB as the optimization is entirely
 	 * pointless when the unmap walker needs to perform CMOs.
 	 */
-	return system_supports_tlb_range() && stage2_has_fwb(pgt);
+	return system_supports_tlb_range() && stage2_has_fwb();
 }
 
 static void stage2_unmap_put_pte(const struct kvm_pgtable_visit_ctx *ctx,
@@ -1167,7 +1164,7 @@ static int stage2_unmap_walker(const struct kvm_pgtable_visit_ctx *ctx,
 		if (mm_ops->page_count(childp) != 1)
 			return 0;
 	} else if (stage2_pte_cacheable(pgt, ctx->old)) {
-		need_flush = !stage2_has_fwb(pgt);
+		need_flush = !stage2_has_fwb();
 	}
 
 	/*
@@ -1397,7 +1394,7 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 		.arg	= pgt,
 	};
 
-	if (stage2_has_fwb(pgt))
+	if (stage2_has_fwb())
 		return 0;
 
 	return kvm_pgtable_walk(pgt, addr, size, &walker);
-- 
2.47.3


