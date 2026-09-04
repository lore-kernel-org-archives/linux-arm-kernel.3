Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A3C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ul9UGPOILM7B5DmFYUwOQNUEy1YqQtqP63zgojN5NOI=; b=ks866RuHrFcauRV0hUwkq8LdVw
	daSIJ69x75kL/uriIlwhiCL4Z2G2oUG++6mKOz6d/cKQszfZNkdg4TmC0LEArMSGmC/KKQO8lEKeJ
	rp1Wv52/xeypPJMpDYf23j13pWaVYQnB5qlgrlC831Jvg/2obonxAkabldQwvUF38VWFK8BkVpwee
	KUTuZYiC474xswdLchG+KfwXVmB6CT4Z+e2Qn/xNRMDDt3TPg4mPKk4q3/YchgSbrSegspklMtI0r
	6Xot25OgqPOs0PF1WloNmhJHzBEwp8usV7V1Jn8xA2ZWtNuV8caH+JOJiwM0NJ8MqkDnlXfvvHQ/O
	ZK3tiuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U08-00000002Dtb-2gsS;
	Fri, 04 Sep 2026 13:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U03-00000002DpX-2Tqm
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Sep 2026 13:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ul9UGPOILM7B5DmFYUwOQNUEy1YqQtqP63zgojN5NOI=; b=Xp5vFFgEBT3Amp+cVXIi+NCO92
	UNw/GR48n605oxMUIxpjSybeoIB848Y9xhNvWa9Ghsv0LQ4HbebiYRvKBPjcAgx0oskx/IliTNZNU
	bsF9BoO+ckrp6/j4sabtHQwbVYV+enDpJszSWhr+k8viAB8qKeadH5x5SyPSBYWWjkabyJxGkL4su
	UDhE3PbIjP41w7H+EipGIlvirpZUVdnopS27XO3zQ31SiZTctXprBO6+bztwSo6rfWt9uSVlNmnaS
	9MEWIu3ECFIi8UhXJGlWYRc753L3i9FOt/qD4EEcGdK76AzhxkddPrr2QL7gQAOjrvAshCLSLKPvw
	xNbar3NA==;
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2U00-0000000E8Uo-1WYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:30:34 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-495569acf8dso6729965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788528630; x=1789133430; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul9UGPOILM7B5DmFYUwOQNUEy1YqQtqP63zgojN5NOI=;
        b=lfWzpm6Ev5QQcWvE2GJCYuDW0jywRyDVZHqstIWfO/iKaXIZ+RdBUhEoiT27FJ+1xJ
         sYqyX4D1hYKjeaYVHHuz1WCCdglAzB/M5JbDmpnsumPjc3c9MN+TxWy2iNVet+XOMB7y
         O3s6TZWXJruoubFyKNoMmbtC2LxXIsNfWTMz8jFehyB+4laffIl5imYde1tNE5W1QJto
         Ja01hLPdOWeOqWFEO9vA5TYXIr1xdeAc9p+0iieph48scWx+A335qvFJdoClQh7XOr0/
         FnveSlLMQuG+2KXeUXRVkTUfcd3BE4unXtxTKr2DkwauX1jRDFruEFiqYi4F9bYblpl2
         6zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788528630; x=1789133430;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ul9UGPOILM7B5DmFYUwOQNUEy1YqQtqP63zgojN5NOI=;
        b=UTjsPbJWlATQHqsaYjF4x9cf5cEvDOLxrcKFjuvEK3cvN0yzO0ucwDCJxcJ5VHnhoC
         dlc48w5ck1X0zNFUp8n7DP8CZMMt4JZgZ/T/CwVd2sDr3PLvLO9DCRs6E5YAuuhm5UvN
         JqFczJ0UgB9scxEHuMR2tAkwn2T2d9GvsVDDaEMU8U3MKzAsRX82sBwdwi3h/Qb39o3w
         oNdZQAoDMgxmwmuUaSWwI4plFdSnEeMfIe5v4c4UGfPvs9Z0eyib4Zh7r9ns+dd+G/YR
         qzEZ2Db+tUfpF2Txv4iuYdoTkE45ekEbuKr0wa+pfgDfgDXqBDpwDa5Twp8ePtuZuzGq
         xX0g==
X-Forwarded-Encrypted: i=1; AKwUvBzAprLVzHBEj1MsxeWeOJIBPXwmX9Ls/8mG7wsvvkttfg6qWO2kxDdtytniefmPL7TSAwyQcyDPr3BlPjhgizcI@lists.infradead.org
X-Gm-Message-State: AFuF++niRdPDfLXwfkin6/KBrpQ3iESNPixncpSec2Z3mLj08XGGgjM8
	aUthmP3XLbJwO1kyxrUcCYM4ifkOyEXnFpEhLZClvzrg+pizRT4OdLdPPdZWTiFWTzbETcLrF7U
	W7/TgmhPGcuM8yg==
X-Received: from wmco24.prod.google.com ([2002:a05:600c:a318:b0:495:6d55:63ba])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00a:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49cf81f6736mr102706005e9.6.1788528628939;
 Fri, 04 Sep 2026 06:30:28 -0700 (PDT)
Date: Fri,  4 Sep 2026 13:28:54 +0000
In-Reply-To: <20260904132855.638117-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260904132855.638117-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904132855.638117-2-smostafa@google.com>
Subject: [PATCH v3 1/2] KVM: arm64: Add stage2_clean_old_pte()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, seiden@linux.ibm.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com, 
	tabba@google.com, sebastianene@google.com, keirf@google.com, 
	qperret@google.com, linu.cherian@arm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_143032_600539_A74B7E51 
X-CRM114-Status: GOOD (  15.55  )
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

Move step #2 and #3 from stage2_try_break_pte() to a new helper
stage2_clean_old_pte() so it can be re-used by BBML3.

No functional change.

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
2.55.0.979.g7e5102b832-goog


