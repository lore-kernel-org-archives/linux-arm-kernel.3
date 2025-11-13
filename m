Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FB8CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 05:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ta7sr0PTTEzvgb7b4GWZ1P6Da8DksAgzSXe7OlGF+gA=; b=QZ5pvjoe8QDt0lKusFoVGgzl77
	UGimzankGogzNZM8n4dZSYC27PdMkthk/mkxyis5cIfl5MkmdEnugQEX+KW2QMT3uPgQHFXS8E/iR
	BOeNeV9GYDne5LGVAfxnz66NAc/kW70Z2ST83Fk2laHBl2/RSJoob8MXBmyeNcvgQF3BB1nX5JnU0
	IsJwyS1Qn/rN2KIYsg0ry58053rog1lLLBTM1XMIGs6osQp0woOIYcZEx4lSXMn+vA9HGlFp0ZHFf
	6aox4eozbj2KbC2rIG+Jp6WoL87ORExkAZOoFe6OdquFiX7PcD4PGW/OKNOD8aMd8NfeftM6cyr9o
	LW1J5zgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpg-00000009uu0-0Jsl;
	Thu, 13 Nov 2025 05:25:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpe-00000009ut6-14Of
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Nov 2025 05:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ta7sr0PTTEzvgb7b4GWZ1P6Da8DksAgzSXe7OlGF+gA=; b=OKcGDy5HSSRNCsFbzS3bNXI6hO
	Slo+aeFXe0yif6hUG3NDZifUPoAZspkrQFTK3tH5Wv3X1QStQ/WmsFCAIwqr0DREAokGemZwSqQVt
	wnmqoJK4HkqF0OVEITgRC/MNWlfvVcFH5vnmB6b4VqWGvN/ZvotedZtKBLXb2onGIfJ3KceQaCG6X
	HCHBIuB0evHaIRHynfkw3mTyuxEVbtz5Xp2JhrNoHUqelt0xsOd9ENlvqG8dpBoEuB3tW3xrPbVwH
	puFKlVwzrgwmb62k0X0xu66VIqGratNHMK2+E4rN35phzlHT0xUhA7/TLMRd2uo0QEbiC7G8KSIOF
	1IkqeKAA==;
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOxv-0000000H4sL-12fE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:29:50 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-9489c833d89so49303439f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763011512; x=1763616312; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ta7sr0PTTEzvgb7b4GWZ1P6Da8DksAgzSXe7OlGF+gA=;
        b=J/R3YuPsD9XpFWjXbnX4PO5WdkwglX9VhScTNaEqmYkHc/qhkDzbFX7nkIfUrEJcfX
         QSm2el7Pe5CxfejAnO5AYgZhWvO2f7KfjqQKrUmGqVr9FgSw5Ved088SZURdtO+6uVAG
         u9SipfJva+souisntVihTeo10aL0DTfHOXnykWvt3M1jDr4MPmu49tmG0Wb7F5xgyQO/
         O2acbEzcf8tqvtflWb2gjDDjKaQbw9PGXnYz3s0N6sjfXdgFt2+17CEFyCI7BAwWioY1
         tQQGkmC7dK1Z99jTLRfJXmWlc7vj43pww7nrkFRXnZTqo9T/Pwd7k2BEdIsfrWFqa2yS
         hzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763011512; x=1763616312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ta7sr0PTTEzvgb7b4GWZ1P6Da8DksAgzSXe7OlGF+gA=;
        b=HY8ke5IufsiRNKkhKSH70+LGSh9WVIar8mmk2nzEZWiWRrTunyu4pSzFJHTpltmuJ8
         Qz96NCWJQETbZelx2jvMpa5NwZm4jlZC8UBJhYq8XPhDZMXPc4RD8m7M3vD6H8pNMESB
         COGyw+gjaMAHg5lFmWp7z3Pz4mWqChi1BxyXy+Eg2d56nIKmJrrbzBIQnaxoh0V0+nmc
         KBZKEWFdr0y846OZnm9oqoqCqSEoMQrjFfZU0WlhfeU391eyXzhbyjCjuVKX1q/jTk8c
         yuha1ScPJo7KGIUcyMq0V5nXhEeFClN4h+nVxPA6fmN6lX5mF8CqunsexQyQPhnrQgtP
         LvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa+g0qjbpUYJzOQoXLyYuN1zCJ62cwGShSlIknNuYxqm7orZIKcs+a2dwHE5o1sSqmboAd5ToqTfAlbsa7+1yt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8s9t6q9p7MHEmww/avFwCjje88miR9lR5qSEMGGrxHbU3Fbr
	Sg9kSUdjvB/CUyXA6T0UY8Iv1DItCz86is20BxuocqX3pld3nzJpnc+T/AxSJHuZEu5gm7U+mZr
	mUyPwy0nGvA==
X-Google-Smtp-Source: AGHT+IHMvk9ultN6RL8YYeEEQa9a2SgSGY279SAAWTq2ofAb1uDKUH6fYPApAnPv5ZmcPZ+gZVtFlIs2gOZI
X-Received: from iopt1.prod.google.com ([2002:a5e:dd01:0:b0:945:af6f:682e])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:8312:b0:948:9ff9:4189
 with SMTP id ca18e2360f4ac-948c46a06f5mr586614639f.19.1763011511803; Wed, 12
 Nov 2025 21:25:11 -0800 (PST)
Date: Thu, 13 Nov 2025 05:24:51 +0000
In-Reply-To: <20251113052452.975081-1-rananta@google.com>
Mime-Version: 1.0
References: <20251113052452.975081-1-rananta@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251113052452.975081-3-rananta@google.com>
Subject: [PATCH 2/3] KVM: arm64: Split kvm_pgtable_stage2_destroy()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042948_231358_555B148D 
X-CRM114-Status: GOOD (  18.35  )
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

Split kvm_pgtable_stage2_destroy() into two:
  - kvm_pgtable_stage2_destroy_range(), that performs the
    page-table walk and free the entries over a range of addresses.
  - kvm_pgtable_stage2_destroy_pgd(), that frees the PGD.

This refactoring enables subsequent patches to free large page-tables
in chunks, calling cond_resched() between each chunk, to yield the
CPU as necessary.

Existing callers of kvm_pgtable_stage2_destroy(), that probably cannot
take advantage of this (such as nVMHE), will continue to function as is.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Suggested-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250820162242.2624752-2-rananta@google.com
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/include/asm/kvm_pgtable.h | 30 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/kvm_pkvm.h    |  4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 25 +++++++++++++++++++----
 arch/arm64/kvm/mmu.c                 | 12 +++++++++--
 arch/arm64/kvm/pkvm.c                | 11 ++++++++--
 5 files changed, 73 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 2888b5d037573..1246216616b51 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -355,6 +355,11 @@ static inline kvm_pte_t *kvm_dereference_pteref(struct kvm_pgtable_walker *walke
 	return pteref;
 }
 
+static inline kvm_pte_t *kvm_dereference_pteref_raw(kvm_pteref_t pteref)
+{
+	return pteref;
+}
+
 static inline int kvm_pgtable_walk_begin(struct kvm_pgtable_walker *walker)
 {
 	/*
@@ -384,6 +389,11 @@ static inline kvm_pte_t *kvm_dereference_pteref(struct kvm_pgtable_walker *walke
 	return rcu_dereference_check(pteref, !(walker->flags & KVM_PGTABLE_WALK_SHARED));
 }
 
+static inline kvm_pte_t *kvm_dereference_pteref_raw(kvm_pteref_t pteref)
+{
+	return rcu_dereference_raw(pteref);
+}
+
 static inline int kvm_pgtable_walk_begin(struct kvm_pgtable_walker *walker)
 {
 	if (walker->flags & KVM_PGTABLE_WALK_SHARED)
@@ -551,6 +561,26 @@ static inline int kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2
  */
 void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
 
+/**
+ * kvm_pgtable_stage2_destroy_range() - Destroy the unlinked range of addresses.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
+ * @addr:      Intermediate physical address at which to place the mapping.
+ * @size:      Size of the mapping.
+ *
+ * The page-table is assumed to be unreachable by any hardware walkers prior
+ * to freeing and therefore no TLB invalidation is performed.
+ */
+void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+					u64 addr, u64 size);
+
+/**
+ * kvm_pgtable_stage2_destroy_pgd() - Destroy the PGD of guest stage-2 page-table.
+ * @pgt:       Page-table structure initialised by kvm_pgtable_stage2_init*().
+ *
+ * It is assumed that the rest of the page-table is freed before this operation.
+ */
+void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
+
 /**
  * kvm_pgtable_stage2_free_unlinked() - Free an unlinked stage-2 paging structure.
  * @mm_ops:	Memory management callbacks.
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 08be89c95466e..0aecd4ac5f45d 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -180,7 +180,9 @@ struct pkvm_mapping {
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops);
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
+void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+					u64 addr, u64 size);
+void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 			    enum kvm_pgtable_prot prot, void *mc,
 			    enum kvm_pgtable_walk_flags flags);
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 6d6a23f7dedb6..0882896dbf8f2 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1577,21 +1577,38 @@ static int stage2_free_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	}
 }
 
-void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				       u64 addr, u64 size)
 {
-	size_t pgd_sz;
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
 
-	WARN_ON(kvm_pgtable_walk(pgt, 0, BIT(pgt->ia_bits), &walker));
+	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
+}
+
+void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
+{
+	size_t pgd_sz;
+
 	pgd_sz = kvm_pgd_pages(pgt->ia_bits, pgt->start_level) * PAGE_SIZE;
-	pgt->mm_ops->free_pages_exact(kvm_dereference_pteref(&walker, pgt->pgd), pgd_sz);
+
+	/*
+	 * Since the pgtable is unlinked at this point, and not shared with
+	 * other walkers, safely deference pgd with kvm_dereference_pteref_raw()
+	 */
+	pgt->mm_ops->free_pages_exact(kvm_dereference_pteref_raw(pgt->pgd), pgd_sz);
 	pgt->pgd = NULL;
 }
 
+void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	kvm_pgtable_stage2_destroy_range(pgt, 0, BIT(pgt->ia_bits));
+	kvm_pgtable_stage2_destroy_pgd(pgt);
+}
+
 void kvm_pgtable_stage2_free_unlinked(struct kvm_pgtable_mm_ops *mm_ops, void *pgtable, s8 level)
 {
 	kvm_pteref_t ptep = (kvm_pteref_t)pgtable;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 7cc964af8d305..c2bc1eba032cd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -904,6 +904,14 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
 	return 0;
 }
 
+static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
+
+	KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, 0, BIT(ia_bits));
+	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
+}
+
 /**
  * kvm_init_stage2_mmu - Initialise a S2 MMU structure
  * @kvm:	The pointer to the KVM structure
@@ -980,7 +988,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 	return 0;
 
 out_destroy_pgtable:
-	KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+	kvm_stage2_destroy(pgt);
 out_free_pgtable:
 	kfree(pgt);
 	return err;
@@ -1081,7 +1089,7 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy)(pgt);
+		kvm_stage2_destroy(pgt);
 		kfree(pgt);
 	}
 }
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 24f0f8a8c943c..d7a0f69a99821 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -344,9 +344,16 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+					u64 addr, u64 size)
 {
-	__pkvm_pgtable_stage2_unmap(pgt, 0, ~(0ULL));
+	__pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+}
+
+void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
+{
+	/* Expected to be called after all pKVM mappings have been released. */
+	WARN_ON_ONCE(!RB_EMPTY_ROOT(&pgt->pkvm_mappings.rb_root));
 }
 
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
-- 
2.51.2.1041.gc1ab5b90ca-goog


