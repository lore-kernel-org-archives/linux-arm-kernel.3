Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC8BC88E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pTg2vf1jjIMBVtegu9b0KSVQwmbhLOaMelrOQMA6JM=; b=mZbl0VYlBREJDigUR3kurkADuq
	IvhCU+rnw8KqtHdH5qNh1F389ctr63W0gdijNr2SwWV7lvRoOqrCca7BD6mvJTahaEK4YFpplY/ts
	PPGd4oy10teTSMDm1C2Rzg1TFWYrH8wl/RO16ZOIDQzfpS116Xhpj718GKUsVasZwa0Gnmx0ZNgPt
	4CyhM2+IF9AxswF6ToF4LDyDU5bGFnlXA5FNtdYcPfv0oTAMG5WHSO57IYJbw3mEW27kjbD8KJvdP
	Ztv4nTJk4tQ7B/A5TUIFbma9KLmOy+FXKRRYJh1wrwYZkVHDj+liFROsNnYhJT2NaiItF1UJGCfqR
	YZXHVl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51fR-0000000GoPJ-0tu9;
	Fri, 11 Sep 2026 13:51:49 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51f2-0000000Go10-3sip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:27 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-6a6108d2987so1003966a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134682; x=1789739482; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pTg2vf1jjIMBVtegu9b0KSVQwmbhLOaMelrOQMA6JM=;
        b=Ztm3k3Iq9qGY6+e3Oe9uDKF4ykBQpOz9X4ofq90sVZ7R9XUFgMGuPrbDy1pokzXF+/
         LwWT4ej96QZ1ocg7wX4I5NN4gXOeM5nme14WxM4WIFxWvubsV5UBDhmkuqs/uzyvdSWK
         cUGBrbuLG1B/FqX+u5ZmgCDCVOuXJE84CtQW7E1s4zxuOeay016cT4eIbiSK6JzTHaO0
         qqZZUdlrq4vroErOK+Tb20D2fZ2V1AUphlzkHtIpouAnhqwHwJKhpcBqC6/ifdbL/+2O
         aICMGSvsI9h1KlJP3taMQq5xO2m2YrjV1nyOScjQSBh1eynEX3KMVJ5hgkcn867HjSbe
         mQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134682; x=1789739482;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pTg2vf1jjIMBVtegu9b0KSVQwmbhLOaMelrOQMA6JM=;
        b=IaR3P7lXkCXS3xRGW8spLZqy0DJJpq/aUbDl0rzsprL+1jutfFovkyvnMixRvxRQce
         C337KCfd5xKnbeGv6gsweAxxsu2wyJr2JkrPpKGMAb1reP4hnFvF9X0uieKmEObVqo6D
         wtfj/Wcx3Bv105jmDRIYOvVd/FD8B1MDbh7Di+bHZKQlEfSABm0c+WCOQt1x6xQAkjLQ
         LT1HCIlbXf9uwWH++M4syWN/ip8ddwXK9QuJ29sa0Gnck+drYo2DucTGdY4zDxozQ8zr
         12kDbNh4OvPUOCUBnfGFDWkRDZz79PqwNPL+SnX/ANfz/hcKo0/dGQuhHSeOo9QKrZwU
         1pVg==
X-Forwarded-Encrypted: i=1; AKwUvBxOFBzszNvZH4gLYwsxoKSUOSa0V3fdn6OLGhgk6WLjYiJg2GAluT4bwkj5nXPFy5Iu8j8XGIlsPO6kct5r3Xc/@lists.infradead.org
X-Gm-Message-State: AFuF++mDEAABhTrbtY4nsD5pHTiifS3tYEpRG3iayCV1LAfdfUcV9bPS
	lLGYhhcuHSvotku1SB5e9vG3CzB/+DniEA8qR+0d2+LRLLTf/FuJqEn1N45B1QpnPcy51SHZUeL
	ZqGuTLUsTD6uTfH3jrR9c3g==
X-Received: from edad9.prod.google.com ([2002:a05:6402:4009:b0:6a7:e6d1:c763])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3889:b0:6a9:a5e7:f8be with SMTP id 4fb4d7f45d1cf-6a9b5655206mr1868948a12.5.1789134681903;
 Fri, 11 Sep 2026 06:51:21 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:48 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-18-vdonnefort@google.com>
Subject: [PATCH v2 17/22] KVM: arm64: Introduce kvm_pgtable_stage2_table_install()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065125_022081_636A6578 
X-CRM114-Status: GOOD (  18.04  )
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

The existing kvm_pgtable_stage2_split() is unfit for pKVM: it relies on
kvm_mmu_memory_cache which pKVM doesn't use and has no easy way to
handle pKVM-specific annotations.

Add the pgtable helper kvm_pgtable_stage2_table_install() so pKVM can
handle block splitting in mem_protect.c. That helper can take a table
either populated with kvm_pgtable_stage2_create_unlinked() or one filled
with annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 12 ++++
 arch/arm64/kvm/hyp/pgtable.c         | 85 ++++++++++++++++++++++++----
 2 files changed, 86 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 41a8687938eb..24d6e05d8050 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -827,6 +827,18 @@ int kvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size);
 int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 			     struct kvm_mmu_memory_cache *mc);
 
+/**
+ * kvm_pgtable_stage2_table_install() - Replace a stage-2 leaf entry with a table.
+ * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_create_unlinked().
+ * @addr:	Address identifying the leaf entry to replace.
+ * @size:	Size of the block to replace.
+ * @tab:	Pointer to the pre-allocated table to install.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, u64 addr, u64 size,
+				     kvm_pte_t *table);
+
 /**
  * kvm_pgtable_walk() - Walk a page-table.
  * @pgt:	Page-table structure initialised by kvm_pgtable_*_init().
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c4ebae0544d4..6c85af51002d 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1533,18 +1533,38 @@ static int stage2_block_get_nr_page_tables(s8 level)
 	};
 }
 
+static int stage2_table_install(const struct kvm_pgtable_visit_ctx *ctx,
+				struct kvm_s2_mmu *mmu,
+				kvm_pte_t *table)
+{
+	kvm_pte_t new;
+
+	if (!stage2_try_break_pte(ctx, mmu))
+		return -EAGAIN;
+
+	/*
+	 * Note, the contents of the page table are guaranteed to be made
+	 * visible before the new PTE is assigned because stage2_make_pte()
+	 * writes the PTE using smp_store_release().
+	 */
+	new = kvm_init_table_pte(table, ctx->mm_ops);
+	stage2_make_pte(ctx, new);
+	return 0;
+}
+
 static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 			       enum kvm_pgtable_walk_flags visit)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 	struct kvm_mmu_memory_cache *mc = ctx->arg;
-	struct kvm_s2_mmu *mmu;
-	kvm_pte_t pte = ctx->old, new, *childp;
+	kvm_pte_t pte = ctx->old, *childp;
 	enum kvm_pgtable_prot prot;
+	struct kvm_s2_mmu *mmu;
 	s8 level = ctx->level;
 	bool force_pte;
 	int nr_pages;
 	u64 phys;
+	int ret;
 
 	/* No huge-pages exist at the last level */
 	if (level == KVM_PGTABLE_LAST_LEVEL)
@@ -1586,18 +1606,12 @@ static int stage2_split_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (IS_ERR(childp))
 		return PTR_ERR(childp);
 
-	if (!stage2_try_break_pte(ctx, mmu)) {
+	ret = stage2_table_install(ctx, mmu, childp);
+	if (ret) {
 		kvm_pgtable_stage2_free_unlinked(mm_ops, childp, level);
-		return -EAGAIN;
+		return ret;
 	}
 
-	/*
-	 * Note, the contents of the page table are guaranteed to be made
-	 * visible before the new PTE is assigned because stage2_make_pte()
-	 * writes the PTE using smp_store_release().
-	 */
-	new = kvm_init_table_pte(childp, mm_ops);
-	stage2_make_pte(ctx, new);
 	return 0;
 }
 
@@ -1616,6 +1630,55 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	return ret;
 }
 
+struct stage2_table_install_data {
+	struct kvm_s2_mmu	*mmu;
+	kvm_pte_t		*table;
+};
+
+static int stage2_table_install_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				       enum kvm_pgtable_walk_flags visit)
+{
+	struct stage2_table_install_data *data = ctx->arg;
+	struct kvm_s2_mmu *mmu = data->mmu;
+	kvm_pte_t *childp = data->table;
+
+	if (ctx->level == KVM_PGTABLE_LAST_LEVEL)
+		return -EINVAL;
+
+	if (ctx->addr != ctx->start ||
+	    ctx->end != ctx->addr + kvm_granule_size(ctx->level))
+		return -EINVAL;
+
+	/*
+	 * On success, return a positive value to prevent descending into the
+	 * new table.
+	 */
+	return stage2_table_install(ctx, mmu, childp) ?: 1;
+}
+
+int kvm_pgtable_stage2_table_install(struct kvm_pgtable *pgt, u64 addr, u64 size, kvm_pte_t *table)
+{
+	struct stage2_table_install_data data = {
+		.mmu	= pgt->mmu,
+		.table	= table,
+	};
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_table_install_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg	= &data,
+	};
+	int ret;
+
+	ret = kvm_pgtable_walk(pgt, addr, size, &walker);
+	if (ret < 0)
+		return ret;
+	if (!ret)
+		return -EINVAL;
+
+	dsb(ishst);
+	return 0;
+}
+
 int __kvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			      struct kvm_pgtable_mm_ops *mm_ops,
 			      enum kvm_pgtable_stage2_flags flags,
-- 
2.55.0.1007.g17ff1f9808-goog


