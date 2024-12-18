Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9B9E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PduJERFrled8xtlVt7hkNZd8foU0YkZ4d2iWPXC2aQE=; b=q0e80VdG/4fkz4og8HgdZZjjGn
	NBJKWLQDFGPVt89/hY8auFg8VM7Z1Usj4iwqAyziKvviImd/9h2AZV/7f13xfJMXO375ncz18yYl3
	rtHiHqIQNr7WTCvOjXO292R9+IzjNSno68ZtFe9W1pQgIz4kZB8+QBVw4RARPfw1j+4OB0r2/aDXE
	0iFROV+P8ZsD6oRtDXvyIsNUk5mx7inxhEY3ODD511TRbstEyKwFhT5cY4mrM46fn36TE/OKmPx0J
	VQgcgBQKQQjo1jwvfUlJOxnIRZuzH/BOPKdGI/wzP+eVzZ42+bjj02JrFd4zVkW9jbC2AR17hPcLe
	LnsLayKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzzA-0000000HZIZ-46wk;
	Wed, 18 Dec 2024 19:45:33 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzuw-0000000HYIx-37k3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:11 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aabf8e856e2so336966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550869; x=1735155669; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PduJERFrled8xtlVt7hkNZd8foU0YkZ4d2iWPXC2aQE=;
        b=xTUpOZg16RrY6Nt2Imar0KnZfADdQqd5noH2wM06XwBnm5X5YIfDF33RA+IxkRAfaL
         0nnK03RdXNyiveSkQUcrsXJnEk/aw1zAhR2BC1g4lbKzsh4JtD73FFQyKVkqIa9WIOoQ
         v6fA+0RUPp4t45yBDRjYPIm+SLndmGeLgoFKF6udvhumKvjEY1PBPAjxbEAhWWLFMYXz
         c06H7k17FdQ9Ooh1V3BaXDAN6c8rsKkXWRVvGA2CW0/W71/ijjsYYTguiiz7wu9FWe3Z
         r6xhBWtodmdYBNRnQLKgKJHhRk1xAa8gOwqF+WNXTQPDTLYrBwwv3AAZ5a3Csusiu98K
         M/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550869; x=1735155669;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PduJERFrled8xtlVt7hkNZd8foU0YkZ4d2iWPXC2aQE=;
        b=TQxeW48Df0XU5T0e+UbObxIBiIImIcZAdfE78KQLIeL+xpCc4dRyHDhnf9q4b60VJh
         0gKeyP1HKjRwJoW79Dsh9hR0ooKEdboTcS0d1N0jXNWRX/XBOvmU3+miHptfTmz6rlFK
         bu42rzilzhTAM5MfwElmsE/2QUumG14cdFp0czvvxC//jVU3qbePnrt5nXLVDiW6+ngi
         jXcYQyfHQxNOdtWDfvHlAmNVUFnrNMLaaz6uekxjkhxd2Il6rLwwHmkWjjXR13N9U1mz
         +9fyVE5sxJG6UHepZVZmmSilV49PKynqYk6Qa/RsIEEJRGrpnLmBuflGGc4UJW0dwYeA
         wNSA==
X-Forwarded-Encrypted: i=1; AJvYcCXkSE/PmlQ4Y1ZFPaqrOVtQVclEPS01Sw3Sgr9XplTuRUstzbpFUGJ++uWs8N6iHOaQnI8m+Uyi23LhW83QZlOy@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe+O/o4+N82hDWZLDBE8ywrBtKwvlmCNZASWfukjrjfl86jPc/
	NzzUCLtL98Gz0R5VyChWk6Z3CFzO5DtcBjGmJGJtAz68yHc4tQo22sI+d1r74gVX4dKEQ7vYO7C
	kM38qNQ==
X-Google-Smtp-Source: AGHT+IEzfg77HHE0CyOw+rv8bE4cFPV2J1IBhBkYsKjKqKS35RJU0YPOC+Z6JqMb76N1ZMGCOQXv2II72IZa
X-Received: from ejdq18.prod.google.com ([2002:a17:906:3892:b0:aa6:9198:7599])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:c10d:b0:aa6:66eb:9c06
 with SMTP id a640c23a62f3a-aabf471913emr432721066b.5.1734550869004; Wed, 18
 Dec 2024 11:41:09 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:44 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-4-qperret@google.com>
Subject: [PATCH v4 03/18] KVM: arm64: Make hyp_page::order a u8
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
X-CRM114-CacheID: sfid-20241218_114110_780777_4C2C2F52 
X-CRM114-Status: GOOD (  14.42  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/gfp.h    |  6 +++---
 arch/arm64/kvm/hyp/include/nvhe/memory.h |  5 +++--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c     | 14 +++++++-------
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
index 97c527ef53c2..3766333bace9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
@@ -7,7 +7,7 @@
 #include <nvhe/memory.h>
 #include <nvhe/spinlock.h>
 
-#define HYP_NO_ORDER	USHRT_MAX
+#define HYP_NO_ORDER	((u8)(~0))
 
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
index 0964c461da92..8f2b42bcc8e1 100644
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


