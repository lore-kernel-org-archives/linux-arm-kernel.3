Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231E9C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FpdytHdhxDISqer6403yWjEFqnIJW3e2H1iU7+f5M0=; b=Pjkl7EaZ3f9/+mcQI4auCbky8a
	LIum2FmpRdfHrG9Vse4SecsyOKEpNJ9JacLGMC1u6sPy54eSIiP3iUe1bnY7FFX7E1SS+TGFOZ4gF
	J1f5XYYYJyAkdBIHRv2vP/6u8YmcIU8zQ61sDS89zJwuItxgTN/L6nUukMFZ/jvME4p76V8YXoz3R
	FKd++PQ4oavEvP+dB1LnioeslKRbprtqGYkeGzTumL/EukNZ+O2YKAbijWqc/zh9dMS48eJZAq545
	LOFfd6c6J4bscCBEASgKkuqkNB5eTGnflhLND5ArAPogUzJSupANfLYFPyJsMVmafOHe2qYcPoWbM
	aMAzERzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy3Q-0000000Esf0-3uwH;
	Thu, 23 Jul 2026 18:21:56 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmy3K-0000000Esd1-3Myj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 18:21:52 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-49559af7b97so6981825e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784830908; x=1785435708; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FpdytHdhxDISqer6403yWjEFqnIJW3e2H1iU7+f5M0=;
        b=WuW2KgH6FtLNrguOZjPce/ohPS0XvLF5kiqbmgibkifVa26lHREz+rZb4KtuOzXncu
         BTcHcx6ti7yf0OlM4dY4UfV0t5U79co/JmIUUWNBsSFUvYNOV/rob9PIrgVNEUNwCOMi
         CVRx5+USg6YAv7e1ObO+eO7hE474OqEyTl6t9JFdHQhXNfnE28DquY+cRhvZ9PjP33yP
         gmBUZDu8APy8sIEnWw1w8B8Jyx8cEBtVsCRU1X4PiXLCAm0H0zWp6O0GVa9WL/aszxZC
         Ru62shXXhQCG5xpGUVPmUJAzbXJRXEauaqMEqpwwQU3RlaZxVPbjoDIBHCrfNFCE2S1R
         IQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784830908; x=1785435708;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FpdytHdhxDISqer6403yWjEFqnIJW3e2H1iU7+f5M0=;
        b=eUgh4OX9YSQCXeWbFzyNPv+v6ta7uXCHAZXkuahlyXVqf7W8mQ/c/cjXpuxdfXBqJu
         UbqHlHKuxKHDT2WGwhl0r1qQqlhRyZws7IFuP5xrN4JEZ8x8VMVNdVf0f94I4R/bTAAh
         D+qhN3exYCcioqToILF6J1gU59ztZcUjEBRcmDJyqUqtOf/SmfLnE4ASK9mH2UIvM7oR
         uEFfhQuiZbuczHrbsUaP7Rqsake04H3Oyt9DK6oHkvoYPbSWnq/M8++4Elb1JHR1worO
         XCoRmiKtQb92plnOEVagmk0/AIt/Hike37lG7+h+hp8KLebFVH7GqfgV1YiD2rYVP4X8
         D7Eg==
X-Forwarded-Encrypted: i=1; AHgh+RruJb2aGbaVe2KOTYrLNea4w4z4QHYt++IvsCEgsEL3I7IBJHBwH1baceOHRpN6uHMrxfl8Muv94077HNge/jNX@lists.infradead.org
X-Gm-Message-State: AOJu0YzwEsieGJR5pgCRWawRuQFLM/+1wohHSy3yhE65WwzgMWZ1d2cP
	8+z5GVLdEuzgsD82Ak/2yOj2XKDdsQPA//IrAZ45AVs6XdmzBhIma3M397iPAIhH0WDsVLbMwT7
	x7FwyKKmoKadguw==
X-Received: from wmbgw6.prod.google.com ([2002:a05:600c:8506:b0:495:4855:c65d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:21c3:b0:493:f6e6:ce2a with SMTP id 5b1f17b1804b1-49573cbe93emr35666835e9.2.1784830908237;
 Thu, 23 Jul 2026 11:21:48 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:21:39 +0000
In-Reply-To: <20260723182140.4025575-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260723182140.4025575-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260723182140.4025575-2-smostafa@google.com>
Subject: [RFC PATCH v2 1/2] KVM: arm64: Add stage2_clean_old_pte()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_112150_869488_301E248E 
X-CRM114-Status: GOOD (  17.81  )
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
	2) Install the new PTE

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
so that can be called from BBML3.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 67 ++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..d670da8882a5 100644
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


