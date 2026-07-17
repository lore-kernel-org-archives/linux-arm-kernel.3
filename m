Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A64C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VImkqaBVxIups1vL1ulSnRZBEUIJVUK8xJrNhCCDu1A=; b=3IOiSWXyy6otdmSwoh4TseOJ6a
	i7odoAS0C85HCovZhl4KMAikc1JZP1LOZkWyi/Ni7LEjQusxf9WQvn/5pC+OWXVX+Yt4leNSX6jx4
	K8bfiEoX/ab1fn386yjc+sFNe1tTiz4Sfl0Dd07o0mJ97wbrAb0RpA5ez5xNtHM6gWk+3doWjNsNc
	OyBynsxaqPwux4bYV1xcR2Oy0B5CZp9XW5Xj3xmQ8rmGF+4+l6KUaFkyiIshyksxdDtIoY9hnJOzX
	74bQNrpNhxYsSCMQxY6GSsG2yxwlHZaBMoiHD0kV7f52ERyHc4HubuHGFH/cud+/qq7BbCBPJzGAa
	oaD/LZ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiJX-00000002Mxu-1RQe;
	Fri, 17 Jul 2026 13:09:15 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiJQ-00000002MuC-3agh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 13:09:09 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-4744b72f90bso4296816f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784293747; x=1784898547; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VImkqaBVxIups1vL1ulSnRZBEUIJVUK8xJrNhCCDu1A=;
        b=dtVGDWpwmmId1x1OuUFhXskQEqdFXG+dDqbT86zMZs0cycCHk5ykzo+eoWFyIsWl0y
         bf/IfqBRWoNVM3fxWjp9yBn6CU44Rf+D4YiDt3Di+RMEAHImsfbofl09CiPGaxcyoBtS
         i0LCnHKSi7wIK9lPg4GxMvG7V8A97x367iFFisk5ypr4WQg625jsoHsmEuYBTIOEgZPS
         Y4o5iT5H6uGM09t26TPS5muMQH9EOApqHi0DNiVooYKbkley6x3bFgzVJkw4CLXsEX8r
         FFjvkt/5RVOdEvJiSZ0Hi3xZPZfyLQjK7mogwqImT7u9UKJjnMKj3kOzz6kZzTIcoe2T
         d1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293747; x=1784898547;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VImkqaBVxIups1vL1ulSnRZBEUIJVUK8xJrNhCCDu1A=;
        b=HdE6bbJzMIreWhePaFwcvQyQbC0QKFsPgJKVscVOnOuuz1H+0pbvqzqamY2LUZI9uy
         vO0xm9JnbxUxWHocxuFNVU81a8hh9occkjMri8NOxnj+CpGdwvgVioeAwVHuYVGzMjum
         V0VG9OoGSmjPD0KkRWYy7BicnKbxz0CNW0Nny0vXX+CY3wcDdEPr+16hs4tWUtz6x7Hp
         lR2/nQYVkrZiWHbt2l9Fz52d0JLC+/7bdxvYi4rugGOopW6qtvTiyHYC+hp9O+gTjfpL
         CS1C6meAzpDnOuubqZlGKamwSiR1qLFqprzVGPpIjNKLoQqz3gUxgaLkqlh00Oi1U7Fa
         EpPg==
X-Forwarded-Encrypted: i=1; AHgh+RoFK2fDd0c2MrxMGnX8bQUy7MECi8MOqpyQAjmLEkEsRS/mqKcinBvkGny3okX9CCgOp2hbxsM+RKCzbbSgVpCP@lists.infradead.org
X-Gm-Message-State: AOJu0YzuTIJv0OXO2Zmli/GpFccE6WnP9hrpmexwcYNgANZrKYhB0XGk
	c6qANJR0YqRWvo/UUDlspzOSsJ5aoqiaRVairkhXBOJcy9T3KmoL7ACCddX/uQTFACEOeg0/fJv
	VSA5c9QMPfbN7zw==
X-Received: from wrpk9.prod.google.com ([2002:adf:f5c9:0:b0:460:d09:f6ad])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25f0:b0:476:dd2b:611 with SMTP id ffacd0b85a97d-47f623049e7mr3779169f8f.3.1784293746031;
 Fri, 17 Jul 2026 06:09:06 -0700 (PDT)
Date: Fri, 17 Jul 2026 13:08:59 +0000
In-Reply-To: <20260717130901.2239134-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260717130901.2239134-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260717130901.2239134-2-smostafa@google.com>
Subject: [RFC PATCH 1/2] KVM: arm64: Add stage2_clean_old_pte()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_060908_910832_1800E436 
X-CRM114-Status: GOOD (  17.01  )
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

At the moment, the pgtable code rely on BBM in SW which looks like:
Break: stage2_try_break_pte()
	1) Break PTE and lock it
	2) TLBI
	3) Put the ref on the old PTE

Make: stage2_make_pte()
	1) Get a ref on the new PTE
	2) Install the live PTE

With BBML3, the sequence will look as
	1) Get ref on the new PTE
	2) Install new PTE
	3) TLBI
	4) Put the ref on the old PTE

Which requires moving step #2 #3 from the break function to the make
function, although it is possible to do that for SW BBM also, that
means the stage2_try_break_pte() did not fully break the PTE as it
is referenced in TLBs, although that works it seems fragile.

Instead, move this logic to a new function stage2_clean_old_pte()
that can be called from BBML3.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 67 ++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 91a7dfad6686..127b7f9541b1 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -810,39 +810,10 @@ static bool stage2_try_set_pte(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_
 	return cmpxchg(ctx->ptep, ctx->old, new) == ctx->old;
 }
 
-/**
- * stage2_try_break_pte() - Invalidates a pte according to the
- *			    'break-before-make' requirements of the
- *			    architecture.
- *
- * @ctx: context of the visited pte.
- * @mmu: stage-2 mmu
- *
- * Returns: true if the pte was successfully broken.
- *
- * If the removed pte was valid, performs the necessary serialization and TLB
- * invalidation for the old value. For counted ptes, drops the reference count
- * on the containing table page.
- */
-static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
+static void stage2_clean_old_pte(const struct kvm_pgtable_visit_ctx *ctx,
 				 struct kvm_s2_mmu *mmu)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
-	kvm_pte_t locked_pte;
-
-	if (stage2_pte_is_locked(ctx->old)) {
-		/*
-		 * Should never occur if this walker has exclusive access to the
-		 * page tables.
-		 */
-		WARN_ON(!kvm_pgtable_walk_shared(ctx));
-		return false;
-	}
-
-	locked_pte = FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK,
-				KVM_INVALID_PTE_TYPE_LOCKED);
-	if (!stage2_try_set_pte(ctx, locked_pte))
-		return false;
 
 	if (!kvm_pgtable_walk_skip_bbm_tlbi(ctx)) {
 		/*
@@ -862,6 +833,42 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 
 	if (stage2_pte_is_counted(ctx->old))
 		mm_ops->put_page(ctx->ptep);
+}
+
+/**
+ * stage2_try_break_pte() - Invalidates a pte according to the
+ *			    'break-before-make' requirements of the
+ *			    architecture.
+ *
+ * @ctx: context of the visited pte.
+ * @mmu: stage-2 mmu
+ *
+ * Returns: true if the pte was successfully broken.
+ *
+ * If the removed pte was valid, performs the necessary serialization and TLB
+ * invalidation for the old value. For counted ptes, drops the reference count
+ * on the containing table page.
+ */
+static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
+				 struct kvm_s2_mmu *mmu)
+{
+	kvm_pte_t locked_pte;
+
+	if (stage2_pte_is_locked(ctx->old)) {
+		/*
+		 * Should never occur if this walker has exclusive access to the
+		 * page tables.
+		 */
+		WARN_ON(!kvm_pgtable_walk_shared(ctx));
+		return false;
+	}
+
+	locked_pte = FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK,
+				KVM_INVALID_PTE_TYPE_LOCKED);
+	if (!stage2_try_set_pte(ctx, locked_pte))
+		return false;
+
+	stage2_clean_old_pte(ctx, mmu);
 
 	return true;
 }
-- 
2.55.0.229.g6434b31f56-goog


