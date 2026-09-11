Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACE1C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUDp2ADO9uV45okQui7zd34Tg8bbsC1Ja6jK0tQWU04=; b=D+e64Xji7eUmTV9GCwFXfrNfEh
	N4sogr7+MBYFOBpH9+yqZ42Hr9A/3CMwPvkwEXomGSs9CMmLVj2jnKHSWt5Q9cCKAYY8QpaNiJd14
	2KxVAYkuw3pdb+2KcV6OhRuSPLTvBW00EEsVkQOdYZU0XFNlEE8BqBqVuIa1mdIKO+nAez/4TgxUB
	J7UnnH7KfBBRSjbP2gcgdpViDZ2NWlahtuDwGL6k1LXDO1NcFyA6/QsGDISJYsygqDlDOWXTdvtCw
	3abn2zF6lFe2tJnIAi4UnvHye7hc5EcJSRkPZ2D7mcaGT5PWidL4F7t4eBhAOvQp3jAafxCizc4nK
	DNxaCUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51er-0000000Gnqo-3z2W;
	Fri, 11 Sep 2026 13:51:13 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ej-0000000Gnlg-0y7R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:06 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49cf5bd2f12so10706665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134663; x=1789739463; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUDp2ADO9uV45okQui7zd34Tg8bbsC1Ja6jK0tQWU04=;
        b=GosRwWDzYTprlE8MAnd2ymnCHpgPhWgbuuQ5nA8bwFgIwFhxfyP9m3/H1r9dO1flie
         NOkB4Wkqx+kr/2hfbBfiBqZD3MGmU1qDXU2Vl+6iUF2IFtBz0onhmHowgFxSD7FycEjS
         CCDW0TCpsDKhryJOB1zmVntkHpFvSSdGgn0awkx+L9JbfaKo1Olpw/66jtq7cPz08vJv
         jlaFaeyPmUTqCXoNKt27ee3PNu4LSkEKq8cDXC9MBlmy45evtPjbNwRelDO9Cjlg3ETp
         tFhTvcUsIkd5Z/33RA2kBJ3np8ycPPtCfuA4xKV7DdsGkiZa+7HnoICZofGRG47KiM8g
         Y+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134663; x=1789739463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUDp2ADO9uV45okQui7zd34Tg8bbsC1Ja6jK0tQWU04=;
        b=L5JolWdU5t/PHTjVs0CEeBAmZy6Y1fy3DlrKnZQ8C2RKwvbWXf9vC4YvCWzav/g3ea
         OJuDUzpFKyu1hqGWjHOPSJccKe5VHyC3NPfYqKhPCDaSoVsmuf04IR0lGnArLeMBbXms
         4p3mb6HtAa5EVB3zglovQSGHuSuq/ZoiY3zZf6SD5DG8DLS8mOfKOZx3iyN2028+MGB6
         2I7mzVvH+deqHe65SDiLopztNbgdEBPjoiAgzpO3/sfRPLK2ftFBBcfvWxMpK1qwHvEw
         nwWLP7M6tkWuMW3il8GS4Hr/0hK++yq2HGMXgF8oKvA87MQioKrjZEJ9Iq2XZMqACfC4
         22lQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+PbMzBjJuA9GdJ6GP+5Vmau3SJVkhqoPaemubANQoDmLneifQ1OyjJoGZyzCOrFuJvyVG9Q5VHmRWBGffDmqh@lists.infradead.org
X-Gm-Message-State: AFuF++ljP0pcT3kAVfgPirgLIcHWtvJLh5/oHP2/5GfkTZh2G0UJLQqr
	2ulcOB+tbgoWRxxivCxXVQjyt0oCQVo57RrMNGgAFpavgBP5BJjD4g7WWewWzyIGemlea+DfeBX
	Cbdmo5rUfK4u192LUWQfPCg==
X-Received: from wmfq21.prod.google.com ([2002:a05:600c:2e55:b0:493:b636:4ee9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16b:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-49e69ffc730mr5158065e9.31.1789134662716;
 Fri, 11 Sep 2026 06:51:02 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:32 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-2-vdonnefort@google.com>
Subject: [PATCH v2 01/22] KVM: arm64: Prefault host stage-2 entries on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Keir Fraser <keirf@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065105_291572_684009BE 
X-CRM114-Status: GOOD (  15.90  )
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
splitting by propagating existing valid mappings to neighbouring entries
of the new table.

Signed-off-by: Keir Fraser <keirf@google.com>
Co-developed-by: Quentin Perret <qperret@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

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
2.55.0.1007.g17ff1f9808-goog


