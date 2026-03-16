Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0984CF53D7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 17:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0ORKdqRW0mEfmd4VRP/igA0BU9vYKKtq0fYCFbuf90=; b=1cezc8jPb9/6PYNLASJUKHf7uw
	/yPE64ffr/Jrc8nihNevDYZYnu84TGxp/8UvQEepmHw/134Fjwwg6YkQw20ZQsOHn2ztpXJMbAfgb
	dufSDGkPFpdU4S9MdtPLZHvVRWQwm+AeZrtBMoIn9d89yPhOxAS/5e8ZZlpcJhrAe5p9HuATK5Nle
	+NXHBev4xfUiZkzeVdZvYcmWWS9E7YCAN8yr8Y7/3bcIJpLxt7+hbBWrO4stowN88HjByprlxrdUE
	JvSQE3IkkXPJ9p8ykNOm48gQIkR8X7j5qnvoas2Y/Rg+ucyQdCE4ftMWrgqhxnVtxMYPN1sjXAroU
	EYep+wEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqs-00000004Zos-34uo;
	Mon, 16 Mar 2026 17:35:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqq-00000004Zn4-2srZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V0ORKdqRW0mEfmd4VRP/igA0BU9vYKKtq0fYCFbuf90=; b=BLc46fYpO9GstLE+dzUQzHRffw
	8siEO71wuzfz1d62JRySVb36BzMFD/sAYcooQ6BCYmPhef9PTYuSUTyJCSJrAkmQ1TfVl5w+XELw9
	Qj8hM4IBGxhtMD9nZroUbqtNeXuyw8LZ07SVtlQ1uhFL4CpIUqq45d0tDi283TLc9bo/wmmHXdwrg
	WAwUXszXwg8DShmRqOM4j1oS88yG4AzarfPyOTdeNGdxBwaZitfeKMWVOHibvD0UeFzIAA79OgI31
	hsDcb6f5Eds13xHNliS40GQvzefUL4aNwCQZu8pexzwqkuYBOORmapD/0DKdBKhtsHXHL2PvsqMM6
	EaldMAdA==;
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Bqm-00000007LrY-15Nf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 17:35:33 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43b3a675316so1684193f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682530; x=1774287330; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0ORKdqRW0mEfmd4VRP/igA0BU9vYKKtq0fYCFbuf90=;
        b=t/EkMkQxX8DlS51jPAHcN40KV26lvlXrpJ1btrhU4uPEkFJnzrnTbMAiqoRW/HmHVG
         jUg1ZIN2JAnWJQ8VH+HAbR99BVc1ICU+2Kxf9auwXLMfqDpeXCN6OLnMVWnJH1Ocr8tY
         r+rmI6XY7S1EOQYjshEOZKAakkqibWwxSxIRWOZLSYvxvwosJHWH14uRRE2G5Bjk+CKW
         vCwai96knpPr/D+4qXiRL4TcRf01l1ntB7H1QB6n4Mh3tBxC0olxaONd6/gI/fM0cQDp
         l8LcHTx34q59IRKgUraYhHWYXywRarS3+dF49gbiP/+yR/qCQ3HiTX/jtmPl/VnFuPoD
         Rzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682530; x=1774287330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0ORKdqRW0mEfmd4VRP/igA0BU9vYKKtq0fYCFbuf90=;
        b=j8IZatQq0+FlQD11KZXZSySFtsYNadHvm9mKT9TPhTLlLXGaxA8NGHatcTizr9cztM
         YdEr7oxTVoDRKygYipFSs4DI6FELooq8KIgCpleuFT+saqYJsq46ryyNL+s3mcO448Gk
         cIuf2rPxopq9/FckiTP1lKUceixDqmCTkY8NLhXgh/A4VWWHAV0mJ2WdMD3INwT9lUNI
         iWy4TPI46GBTv/mNSITCdxFbDa30oBTpPQ3fdz48AcBm2qtfEgWh6Ru8KGTRq2hFpGrH
         RtZZ3GO8S3xty2lukUyoH6zyGxnumkbO9rQX57/zSF8h6JWW9L44bqSDuedAufS+WrzK
         Wypg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ7m+uvTOjQMxI3kP/5X0idBonrhN9wjM0vxzaYqxTzXLHqOzNZOnyBOrJFiB7PZhJwkOpJ7vMidPg81xowbH5@lists.infradead.org
X-Gm-Message-State: AOJu0YyoTUAN4a3uZnSVeg5Uxw3B0WqAVcA+h2IBWq8bUI1iBQm3Yuzf
	+HunwEJDVM+fsHO02Aj6MPmyLI8KdRKkz9U5jnnsE1G3FHXoPOZygEpsvkxhq6tXXwZ3m4L9Pzh
	pgg==
X-Received: from wmtf12.prod.google.com ([2002:a05:600c:8b4c:b0:483:6fe1:c054])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46d2:b0:485:3a03:ced1
 with SMTP id 5b1f17b1804b1-4855672737fmr240611635e9.28.1773682530109; Mon, 16
 Mar 2026 10:35:30 -0700 (PDT)
Date: Mon, 16 Mar 2026 17:35:23 +0000
In-Reply-To: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
Mime-Version: 1.0
References: <20260316-tabba-el2_guard-v1-0-456875a2c6db@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260316-tabba-el2_guard-v1-2-456875a2c6db@google.com>
Subject: [PATCH 02/10] KVM: arm64: Use guard(hyp_spinlock) in page_alloc.c
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <linux-arm-kernel@lists.infradead.org>, 
	"KERNEL VIRTUAL MACHINE FOR ARM64 KVM/arm64" <kvmarm@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_173532_358098_086B144A 
X-CRM114-Status: GOOD (  12.22  )
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

Migrate the manual hyp_spin_lock() and hyp_spin_unlock() calls in
hyp_put_page, hyp_get_page, and hyp_alloc_pages to use the new
guard(hyp_spinlock) macro.

This eliminates the need for manual unlock calls on return paths.
Specifically, in hyp_alloc_pages, this simplifies the early return
error path by removing the manual unlock and resolving single-line
curly brace styling, reducing the potential for future lock-leak
regressions.

Change-Id: I37bb8236dbfff9b58bda0937a78d2057036599b4
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/page_alloc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index a1eb27a1a747..f43d8ad507e9 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -167,18 +167,16 @@ void hyp_put_page(struct hyp_pool *pool, void *addr)
 {
 	struct hyp_page *p = hyp_virt_to_page(addr);
 
-	hyp_spin_lock(&pool->lock);
+	guard(hyp_spinlock)(&pool->lock);
 	__hyp_put_page(pool, p);
-	hyp_spin_unlock(&pool->lock);
 }
 
 void hyp_get_page(struct hyp_pool *pool, void *addr)
 {
 	struct hyp_page *p = hyp_virt_to_page(addr);
 
-	hyp_spin_lock(&pool->lock);
+	guard(hyp_spinlock)(&pool->lock);
 	hyp_page_ref_inc(p);
-	hyp_spin_unlock(&pool->lock);
 }
 
 void hyp_split_page(struct hyp_page *p)
@@ -200,22 +198,19 @@ void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
 	struct hyp_page *p;
 	u8 i = order;
 
-	hyp_spin_lock(&pool->lock);
+	guard(hyp_spinlock)(&pool->lock);
 
 	/* Look for a high-enough-order page */
 	while (i <= pool->max_order && list_empty(&pool->free_area[i]))
 		i++;
-	if (i > pool->max_order) {
-		hyp_spin_unlock(&pool->lock);
+	if (i > pool->max_order)
 		return NULL;
-	}
 
 	/* Extract it from the tree at the right order */
 	p = node_to_page(pool->free_area[i].next);
 	p = __hyp_extract_page(pool, p, order);
 
 	hyp_set_page_refcounted(p);
-	hyp_spin_unlock(&pool->lock);
 
 	return hyp_page_to_virt(p);
 }

-- 
2.53.0.851.ga537e3e6e9-goog


