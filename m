Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BBFD132C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjUYluJ7thLERHfqDAbw880QNuSB0DBGhk0tN16op68=; b=SOQ9gjAt7NZZrnaT3sk3TgMd8i
	2TTF5QmHTwgrTmBgeLHZsGAjGOBvg1hmvTVkx3AHqIvfz+B2YgPaIv0CPbm+8mY4Os1ooNtMnwaE7
	5Os3vkjBvUy6Hs+gJf1BY4iG+H4MX+CozvIGBE18fP8VN88SdPMfxRk1kZByxt67pVUVLEZSHp3vM
	wF63DfCCYaI5TMrpw+sxVqR2g7D318VgFX+ICJsf6nKKn+aWbqk/zDBZnciR12HbQK/vXYQdVSvyD
	bvvfLEbnfohzBlcw71OfuPqt+gYYiRcdPM++YpSveRS54OqqH3M5Qo1Cdd0DRDUSA6PLlB5NkArOe
	0vPcHxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xOs-0000000DvWg-1daV;
	Mon, 04 Nov 2024 13:45:46 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBp-0000000DsHT-0uDD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:18 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30cf121024so7095155276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727135; x=1731331935; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjUYluJ7thLERHfqDAbw880QNuSB0DBGhk0tN16op68=;
        b=V1niZV6VUG5eFTIPrFF0ssdekhORqE4Hno6vH+JWo+2sacYVwiz4TAk4o9iT30MSLX
         xr3bvhW5Io++WuTI4+WEN+vPT5wR/MnGXAUFgumREh3jrq8LLx1YGXPgDAd7G7V1Bntw
         vO//SGyxxP8f6NTqJuDKBCeapB+024yEbUzMa8416ifIKhMRhwAmNtAS1FjBSJlDuSQ2
         I0VsmKgpqC1jRFlApysRwdafGDDflcQ0tMYQxy2Jx0/ipeg9lWu+l0wD+++hRkgRkWwL
         iKewBlDihEbxN+bGASuH+c7oKAk0mDGVwFsvy5kTZMSXn3WfNjZW7kwBX+NR56UALUcP
         DIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727135; x=1731331935;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjUYluJ7thLERHfqDAbw880QNuSB0DBGhk0tN16op68=;
        b=hDQT99Z6MSH4EIUNhgLFgk0gVGSeFjEPKJ+FK3aAn2OybDXdxMrDRE1KuKqg2RRTZq
         BcWsiWMkj6UBxqN08OqAN8mdWVFticlmkSkZN3+SQ0/XqQIKKci3f0jLzQIGMnT54E6O
         bTVtwlAygscF/0aXyPsmONDWkBivJmtkc6rsrmyZBimV/OBLysUHteCi/ltErWG10juT
         1/0bxGLfADoQYYftPC1eTjq4Ts5Jb5pG02N/0tlm3RDRUvtA0uExmPK0rZn/wELlfSR4
         RVkzK7OOPf5Hard06yCCXdE7ABDNSsD8iSN3vfsh3nkBVolyOwnqb7iyoz6IQLG7kMsx
         DuAw==
X-Forwarded-Encrypted: i=1; AJvYcCUQWPXQr5CG65ku3j5Xs0pLIKjCu1qs7f5FhK9MAoOTLQN6mFoZRPE9iSEyUIMSzFuOV0wmTBY1JbU+PyPA5YEO@lists.infradead.org
X-Gm-Message-State: AOJu0YycLvzlwEtoUcaHfVQrLHFqlBIv2/+cdV0Q/8vS87yvq5jS8X4x
	APhirjRm5ir4SGoLS0QrRz2XDZ4gowInFBuhfRslUKq9IUgh3zt6+McbAg5uWDaShF8Bew4M43X
	8QvUC9A==
X-Google-Smtp-Source: AGHT+IGCwsvypUWNk6RlNMRAjdWFDm97ufr3Hg3Q8v/EOjc5GY5BaJQCKOeF2R4oR705NB7B1GCdCKn9Vkg0
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a25:ba0d:0:b0:e28:fb8b:9155 with SMTP id
 3f1490d57ef6-e3087bfc93amr63281276.9.1730727135113; Mon, 04 Nov 2024 05:32:15
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:49 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-4-qperret@google.com>
Subject: [PATCH 03/18] KVM: arm64: Make hyp_page::order a u8
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
X-CRM114-CacheID: sfid-20241104_053217_280393_DE432572 
X-CRM114-Status: GOOD (  14.62  )
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
index 6dfeb000371c..88cb8ff9e769 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -42,8 +42,9 @@ static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
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
2.47.0.163.g1226f6d8fa-goog


