Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C414C88E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/UyVFH1eJeaIvyHBxmk+soLwxzPqsgvrdFkmaPkpfI=; b=zyJrUagT+BX9JikANkIoeS2I35
	Feh+cgsJXX8l8RuU9ADsZBK0NiOC3Bbo2Wa790YNCYhjToQtohMd9QnHrwrE8YMzBP7/hmMYkYBz+
	pVEJX3sG03Savco7LRkIOJ7xwp6npI2lXlsnZPV/M6tb7DVR/YGtnh1e9nhw+o6sErAqJC8ENLQMI
	zEEHIFzMZv5vhxk1DwQ2qmKSbl9Y6KudwE+RD/pej3GcgxU7wcOIDevcqifxCGE8w74ZJm1G5Jd+w
	Cfq+oP7bqeq05A6GDzsM/G/ttRPVPK+t7PBLo/6mkFakwHcpzEEo6BUY3uLSP4uLstbOQ9VhO9iYc
	wQbnGe8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51es-0000000Gnr3-0JWm;
	Fri, 11 Sep 2026 13:51:14 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51ek-0000000Gnlu-1DWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:08 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49cd55ee2f7so8893245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134664; x=1789739464; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/UyVFH1eJeaIvyHBxmk+soLwxzPqsgvrdFkmaPkpfI=;
        b=tLBE0R2fsXU4kvk8kEaUfsJPTwNKlqbl7Ve1+p/BmiVhgcf6/t3yWsmD8XPiAtdJeq
         Okm6fwcgk9cnyzJE3/Kx6OivXlqCIUKfymkNuXpxt3GBBtylLVEEtroE1jCF9wYjpoX4
         0IgsjWb4PL+6dD0LJXPKwU3MXmZGvNH/hG2OHJR6cCz87ciIz3oyhfBoMqvax6y9/NKo
         61LAKrOr/IZ5oEz8u5qIfuC1eN5iY32VtrnoHl09UPhPTOMLunkFDbMCnkEo30MCUoMR
         nDCMA8flSa69NSQhVVSx9x7JHbWwVOQhfgvxrgSfFUlEpNYLCBZmDS+Fg1MOA1oksGxr
         wLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134664; x=1789739464;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/UyVFH1eJeaIvyHBxmk+soLwxzPqsgvrdFkmaPkpfI=;
        b=G8CJU6LIqAId2fvf/fNxpTGgLA6CTuB/rWMEvPL8PtKnvpw1ihWuUOoderp84GQGoy
         qZg6FRjJIe/vqM1z0HHfVEnLK5vd5fzTQtsn9A/KXCVFg3sXexTBuD8sDw6SQA5gcivY
         rvmmoyXP5IoFAo9JIQRBEEO9lKmcWFkmCwpSnj8xIyeSRi/K16L+bUZX9Q98M+ySyTYw
         FarXqBYTUY1S+ceoSH4h5SjTeIJcGezpGrqbIVa9KxRg0xExQxqApvtC8RnLlGxylX6E
         1tr06UEjOHO/qJXmQaeFnKzsU0R9UHEtCC+2Zqtih3JbTBigK7SAxqMqOfkwNI/D6Dz+
         vOPA==
X-Forwarded-Encrypted: i=1; AKwUvBwT0+NTkAXC0QD6/s6AxHernfhRK8/nlnDQMN5XU/LhQqqfgBVFoqzl5gU74Q1txwV4kKjmVY+c6fgSPQXDvbOJ@lists.infradead.org
X-Gm-Message-State: AFuF++kkuj5gmZ9mzUEwJSIsMcpGTfRXtyktmXiQYvTp1QHy7r067NwQ
	1qtQwwRCLtwJUGlBGaOR1hDAN5yzuYqQzcqX49jzbl+lyGI0ZurGLUwdvaOA9f74GaTUwwMEidQ
	ymC84JTWlV3zvdfQw8jGGWQ==
X-Received: from wmbje22.prod.google.com ([2002:a05:600c:1f96:b0:49d:c0e:4350])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3104:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49e6188899fmr53302515e9.3.1789134663691;
 Fri, 11 Sep 2026 06:51:03 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:33 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-3-vdonnefort@google.com>
Subject: [PATCH v2 02/22] KVM: arm64: Propagate host stage-2 annotated entries
 on block split
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065106_345608_83C45B57 
X-CRM114-Status: GOOD (  13.55  )
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

Propagate ownership refcounts for invalid stage-2 entries mapped on
block split. This intends to allow splitting host stage-2 blocks while
keeping existing page ownership and metadata annotations.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 34f78a58cded..0ca157ecee64 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1033,15 +1033,28 @@ static int stage2_map_walk_table_pre(const struct kvm_pgtable_visit_ctx *ctx,
 static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, kvm_pte_t *ptep)
 {
 	kvm_pte_t block_pte = ctx->old;
+	bool counted, valid;
 	u64 pa;
 	int i;
 
-	if (!kvm_pte_valid(block_pte))
+	counted = stage2_pte_is_counted(block_pte);
+	valid = kvm_pte_valid(block_pte);
+
+	if (!valid && !counted)
+		return;
+
+	/*
+	 * Shared walks not supported: cannot rollback refcounts on break
+	 * failure.
+	 */
+	if (counted && WARN_ON_ONCE(kvm_pgtable_walk_shared(ctx)))
 		return;
 
 	pa = ALIGN_DOWN(ctx->addr, kvm_granule_size(ctx->level));
 	for (i = 0; i < PTRS_PER_PTE; ++i, ++ptep, pa += kvm_granule_size(ctx->level + 1)) {
-		kvm_pte_t pte = kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1);
+		kvm_pte_t pte = valid ?
+			kvm_init_valid_leaf_pte(pa, block_pte, ctx->level + 1) :
+			block_pte;
 
 		/*
 		 * Skip ptes in the range being modified by the caller if we're
@@ -1053,8 +1066,11 @@ static void stage2_map_prefault_idmap(const struct kvm_pgtable_visit_ctx *ctx, k
 		 * that should happen very infrequently.
 		 */
 		if ((ctx->level < (KVM_PGTABLE_LAST_LEVEL - 1)) ||
-		    (pa < ctx->addr) || (pa >= ctx->end))
+		    (pa < ctx->addr) || (pa >= ctx->end)) {
 			*ptep = pte;
+			if (counted)
+				ctx->mm_ops->get_page(ptep);
+		}
 	}
 }
 
-- 
2.55.0.1007.g17ff1f9808-goog


