Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2262CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U+p93j/YN41MEZx68FsDZhowuKIrUGiMwA9+JFupUA=; b=FNJcrv3i7M/AVo3LhPkWAb2juH
	sDlR7a7B0z4A6jDlLATpWjjs9XEaVKRnnjFSBYpTz0cE340mVaOZRyZ5B6XL7PYJXrWwm673NKH3u
	NPEfoExYNyc7hOxnUoo2gtJBEbAOI183+OXuAwa4dvCa1e2v0S39QpKcd16fMCdwrl1u4NjERg5TU
	UA1Tw4w3/XVbrkbBH41wtNw0F48sNOGJ7GLFx2uUv4zQvLIScxzGGS9pfG2o/UuM8Fh4kt/vIk3Hr
	r+A7OEHTWUWUEAo98E1ds5GQxy9tv7OOnYwBJeYQ267BO/waPa/dMBOP87BM1h3xXynXkSw1x/p75
	bKw7chCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFRj-0000000AstY-3noo;
	Mon, 16 Dec 2024 18:03:55 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMD-0000000Aqu0-477h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:15 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3cdb9d4b1so6005881a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371891; x=1734976691; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9U+p93j/YN41MEZx68FsDZhowuKIrUGiMwA9+JFupUA=;
        b=QcdBiTtRJanKI5x8qkGq9FiAqj23Ovcm9ZgpUxBasAHFywNeOc0bIkBcthlYKn+mQe
         ewkGrJ3NyGOF9Qd7lK0TDzwqIRgZLwrkazcooGZ+PtaNLsBawxD4hkUiLfPenk9n2yH8
         B18U4rwNKl7bIjHTyILH5fUuQhW0M99kBahpQQ9JcDo4oLrP/NEkp3ux2E/lxsChK2X7
         IRSMO1oHoq+OQKQ2zcVFf05VEm6GIb9d8uwq3mhGw0Lt4Zb9i9FWHEXpycfZiMT4dTtu
         7dpdAVXzmv3maniPf8x7cKvJzw/uQ4rhVhGLyRV7E32BQVco5V6BWZrnYMZU2iDKcy5u
         obLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371891; x=1734976691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9U+p93j/YN41MEZx68FsDZhowuKIrUGiMwA9+JFupUA=;
        b=ho/DJP1Y5CMTlzuGxt5ogMJGRb8yEzSVBQKeVAvR68IS+3cRGJgUf/96ovtR0qceUp
         1t9mDAh+4doRpvR7FS7TPLT8D/KVQ2DdvHQorvO7ixlCO6+gvTVf55TR8mpjxMTSjXpZ
         a+3jAQMu6M1hjOKABZwiJ+BS+TunhHPDEXiiGDlKL9JdweuTrMu0qHPOY5Bc9FYnQpLH
         fKxqWjh75FWYusPFYbNOaoJWChYYDu3XqRfKfGo8/Uz3lSQbJAj0aDNyN7SfDmlmCOzD
         Z7yP8CM+szFrX8oEZz7ShnYrfdAQM2av2J9lFNYQ+rKXpCrn+Ghr5KHSPDc7pgm26fqD
         FYtA==
X-Forwarded-Encrypted: i=1; AJvYcCU0NkbJcdCuAj+xXAvuzm1U4TmaK8wawGTjwGTPuATin7l6Q7bEpfBMfe/IPxDWR/2DQDtQ8FVJWwo92uNpToSv@lists.infradead.org
X-Gm-Message-State: AOJu0YwkDIGx3ndrLG7gaFeuCvljemK7YOlsLnpdEdnAYD2q/pf5vvch
	gQG4/QnET4AQcNMKm8q6QaeSPHUVJDnjB7F9wQg5EmXOGAXsIK1j2371kEhTS1Vm66JDGoZmF5a
	jzgnWvw==
X-Google-Smtp-Source: AGHT+IG7st/yyJqIhpv2xQBIuWlDy4uU3mEKGGddfO0WV9zfYHQl4j73x0bTTMfU7vqe5be5/q+MEgxQCPxJ
X-Received: from edbet14.prod.google.com ([2002:a05:6402:378e:b0:5d0:a9a6:5abc])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:354d:b0:5d0:7282:6f22
 with SMTP id 4fb4d7f45d1cf-5d7d56175c1mr253568a12.14.1734371891718; Mon, 16
 Dec 2024 09:58:11 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:48 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-4-qperret@google.com>
Subject: [PATCH v3 03/18] KVM: arm64: Make hyp_page::order a u8
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_095814_018664_9518F86C 
X-CRM114-Status: GOOD (  14.23  )
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

We don't need 16 bits to store the hyp page order, and we'll need some
bits to store page ownership data soon, so let's reduce the order
member.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/gfp.h    |  6 +++---
 arch/arm64/kvm/hyp/include/nvhe/memory.h |  5 +++--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c     | 14 +++++++-------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
index 97c527ef53c2..f1725bad6331 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
@@ -7,7 +7,7 @@
 #include <nvhe/memory.h>
 #include <nvhe/spinlock.h>
 
-#define HYP_NO_ORDER	USHRT_MAX
+#define HYP_NO_ORDER	0xff
 
 struct hyp_pool {
 	/*
@@ -19,11 +19,11 @@ struct hyp_pool {
 	struct list_head free_area[NR_PAGE_ORDERS];
 	phys_addr_t range_start;
 	phys_addr_t range_end;
-	unsigned short max_order;
+	u8 max_order;
 };
 
 /* Allocation */
-void *hyp_alloc_pages(struct hyp_pool *pool, unsigned short order);
+void *hyp_alloc_pages(struct hyp_pool *pool, u8 order);
 void hyp_split_page(struct hyp_page *page);
 void hyp_get_page(struct hyp_pool *pool, void *addr);
 void hyp_put_page(struct hyp_pool *pool, void *addr);
diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index c84b24234ac7..45b8d1840aa4 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -41,8 +41,9 @@ static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
 }
 
 struct hyp_page {
-	unsigned short refcount;
-	unsigned short order;
+	u16 refcount;
+	u8 order;
+	u8 reserved;
 };
 
 extern u64 __hyp_vmemmap;
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index e691290d3765..a1eb27a1a747 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -32,7 +32,7 @@ u64 __hyp_vmemmap;
  */
 static struct hyp_page *__find_buddy_nocheck(struct hyp_pool *pool,
 					     struct hyp_page *p,
-					     unsigned short order)
+					     u8 order)
 {
 	phys_addr_t addr = hyp_page_to_phys(p);
 
@@ -51,7 +51,7 @@ static struct hyp_page *__find_buddy_nocheck(struct hyp_pool *pool,
 /* Find a buddy page currently available for allocation */
 static struct hyp_page *__find_buddy_avail(struct hyp_pool *pool,
 					   struct hyp_page *p,
-					   unsigned short order)
+					   u8 order)
 {
 	struct hyp_page *buddy = __find_buddy_nocheck(pool, p, order);
 
@@ -94,7 +94,7 @@ static void __hyp_attach_page(struct hyp_pool *pool,
 			      struct hyp_page *p)
 {
 	phys_addr_t phys = hyp_page_to_phys(p);
-	unsigned short order = p->order;
+	u8 order = p->order;
 	struct hyp_page *buddy;
 
 	memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
@@ -129,7 +129,7 @@ static void __hyp_attach_page(struct hyp_pool *pool,
 
 static struct hyp_page *__hyp_extract_page(struct hyp_pool *pool,
 					   struct hyp_page *p,
-					   unsigned short order)
+					   u8 order)
 {
 	struct hyp_page *buddy;
 
@@ -183,7 +183,7 @@ void hyp_get_page(struct hyp_pool *pool, void *addr)
 
 void hyp_split_page(struct hyp_page *p)
 {
-	unsigned short order = p->order;
+	u8 order = p->order;
 	unsigned int i;
 
 	p->order = 0;
@@ -195,10 +195,10 @@ void hyp_split_page(struct hyp_page *p)
 	}
 }
 
-void *hyp_alloc_pages(struct hyp_pool *pool, unsigned short order)
+void *hyp_alloc_pages(struct hyp_pool *pool, u8 order)
 {
-	unsigned short i = order;
 	struct hyp_page *p;
+	u8 i = order;
 
 	hyp_spin_lock(&pool->lock);
 
-- 
2.47.1.613.gc27f4b7a9f-goog


