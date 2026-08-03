Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54CDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcrHsg0qcfO16N3JWjbmr3Z8a3Wp5JQC0FcWux6rQJw=; b=tXTgB2YnnVLMeF1+1nNxvWumG9
	uKgm0KaSNNFAGHn0yoPdC1wj09EvEMJCgbTiAMzUPdihRYFs9GaUymU9auXsNY+amLYP9M07MwRAu
	G/R7zuEOwgg1OU+/5Yt2n9F+4iBq1Z7n8uNRPuAeki4SBpFda3CwQAp1ebtAEolB2/DEiV9OcBvCF
	ecTHsdvYIzIy6gcPh037dhhKC3NRWVPdkGHuNcKhJEE5GcZg5XGaCOwDITpZzjWI3GY/cAPeU2dyC
	Nr7nGu37Nj52qSNS34B+kDE3+Ho9Mn7QjGE/JTOOzLHLR2DA27QHErhRCM8YVfNYtS0WpfrVSSaqT
	zqDBJTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdK-0000000GmnR-299y;
	Mon, 03 Aug 2026 10:10:58 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdH-0000000Gmlu-2CwO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:10:56 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-47f83450a8eso3283002f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751853; x=1786356653; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcrHsg0qcfO16N3JWjbmr3Z8a3Wp5JQC0FcWux6rQJw=;
        b=oVbW/O3UyBQLQ8etxblLCxFtLeLGpabYxwtExciPnSfsBEXTyh/uja2WeUsGO4CWP8
         nhnUqKqlLghMwxxg+COcaKqSrGeGvgNM15TY5zItKrWQftq9Ge/k4xKNecwvKUvPYxun
         pGbyrc1wxIwGFaYIbhnypwKjT9T8f9+eni0/qn18wN6byLLg6OktaTQaJSl1r1gjAW+h
         DjMiTMqsH7y1BBpYK04jWL4dAEldzG/7oXXjGf8O4GdtL6src9BDJsWw1zo+VXETynRh
         K/8IZ8wriL4/YL9wh5DQpPIcNiGhPLm4zg/OffOYpDeUI/us802EFCLNRKUkV2kDdwyV
         MGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751853; x=1786356653;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcrHsg0qcfO16N3JWjbmr3Z8a3Wp5JQC0FcWux6rQJw=;
        b=dvKMLW6DR5d9kGCi/Dii7peh61usGC5qABcudr4ZLaPEWVsqaDoiRGkU87vqrUuniU
         oN8afhFZoL5X428AAb2xIKy4aEDdXeuIaw6LuSgwdtyJbcvDX6YJbLCVbAmu4rjimTpV
         9rqMtXnw20YTDBBXoUOW1tjBP8vuseTnMzQnd/G+TRbxm5Krd0NXtQf2qJIc8P87mRbH
         7lehQ6k3tS1jgDkNl/K5sgKg152pqiItRyDvjjjNwmJ/6UTbGDgedQzjKaWOKMuMq0Xt
         6QzMvuNoC5voGE9ACcHVpaiZULB/H54Mig39vUyZsy3ys9xbN2bRuvGMb4Hqw0MFehXu
         OJpw==
X-Forwarded-Encrypted: i=1; AHgh+RoJVbkxx9vJvNGsMk19rBFSwcYugvpqv7kJFHHftPQBx3MttdfffMh/aWHhTdurV/7LJ7yf/9VVTCABkEREw+3q@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu6WPfHncVqyGsN5Du8yisHZWof0SX4M0mFFc6gJT+VfGy0CDL
	75oosGYS1eIBi3f2pvFUolC/gLqelwoupEounKwSIMYHgDf56VIz/ZrrVwbYcJDevMik0nBUW4d
	FOQ7HBc5D6OYd7T4BF5D8xA==
X-Received: from wmox20.prod.google.com ([2002:a05:600c:1794:b0:495:5204:e932])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4453:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-4980c649c6emr195270835e9.2.1785751852702;
 Mon, 03 Aug 2026 03:10:52 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:45 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-2-vdonnefort@google.com>
Subject: [PATCH 01/20] KVM: arm64: Prefault host stage-2 entries on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031055_581238_FC1D39BB 
X-CRM114-Status: GOOD (  14.66  )
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

From: Keir Fraser <keirf@google.com>

For the host stage-2 that is idmap, we can avoid lazy-mapping on block
splitting by propagate existing valid mappings to neighbouring entries
of the new table.

Co-developed-by: Quentin Perret <qperret@google.com>
Signed-off-by: Keir Fraser <keirf@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index b74dd5ce1efd..34f78a58cded 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1030,10 +1030,39 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 	return 0;
 }
 
+static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
+{
+	kvm_pte_t block_pte = ctx->old;
+	u64 pa;
+	int i;
+
+	if (!kvm_pte_valid(block_pte))
+		return;
+
+	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
+	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
+		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+
+		/*
+		 * Skip ptes in the range being modified by the caller if we're
+		 * installing last level entries. Otherwise, we need to
+		 * temporarily put in a valid mapping to make sure the
+		 * prefaulting logic is triggered on the next
+		 * stage2_map_walk_leaf(). This adds an unnecessary TLBI as
+		 * we'll presumably re-break the freshly installed block, but
+		 * that should happen very infrequently.
+		 */
+		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
+		    (pa < ctx->addr) || (pa >= ctx->end))
+			*ptep = pte;
+	}
+}
+
 static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 				struct stage2_map_data *data)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
+	struct kvm_pgtable *pgt = data->mmu->pgt;
 	kvm_pte_t *childp, new;
 	int ret;
 
@@ -1051,6 +1080,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!childp)
 		return -ENOMEM;
 
+	if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
+		stage2_map_prefault_idmap(ctx, childp);
+
 	if (!stage2_try_break_pte(ctx, data->mmu)) {
 		mm_ops->put_page(childp);
 		return -EAGAIN;
-- 
2.55.0.508.g3f0d502094-goog


