Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8A6E69E9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2InjsufEFntOTn6gngou7a+5/1DcqO5mqDCh0ChGiQ=; b=NHEr6KaXJoyt/BLwiOCh7U43mz
	BdgQ08I7oSWpW1iiBOmtzf1082GuyelQX4A6iI0/nbGh2Ss5OqBbg7Cv6bJC2zxyL3tKl7mhrOL+X
	6wLWhg/OZYeMsQT82klxtDfZcZqKbneCy+cuvWEtLbxi2BMv8jNaLUJhvVUzMNXlT+O/6Wv9hhP/Z
	RbQ4ZbPeHWc9ThaJZBn2Scha3DXkQoGdOVbxnl3qTeovgqCK6rL5U2dKQWWFL2SkA+hMUts3zztVD
	zTlbSzLHhA8x+lu7Q7CRbKYjFnwv8nLsqc3x+17n0ZLT/4S+dSVRcZfeOLvOLS74ohOtf0o0fQgEd
	k9tJGehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQLh-000000096k1-0zuV;
	Tue, 03 Dec 2024 10:41:45 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHq-000000095YT-0nIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:47 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-aa5462eb32aso188501366b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222264; x=1733827064; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2InjsufEFntOTn6gngou7a+5/1DcqO5mqDCh0ChGiQ=;
        b=v0FZubQlL7sCf5Eai+ZcmiYD6I5OO5V/WimXW7nlfbmTG5G21KEidCrFpchkw3c1WL
         FJh+cvqTdNR9h4XDA9BUG3J3HcSRJpMAuPtMkBZC++oPUls0V4q+oWfIyBXMBL9/e7Gu
         rTGzKQ8TpOE0d2PxzDZ8ZmY/c8P6ZxVR3Bh+sWypyn7qhLp2SLbz5RW5witvuQqZLTjk
         D/qjocbDp6BiUIpg9Ppfph7Sgk4QTEFrpEqYzWZf0W5U21WsMeD1tHHrLQj2G9yh8uxl
         Si7AzE5uv470gNy5Fv20ejoglu4e7mgs0QjUYALetQxdrsIbDf87oLAbGA4pRe/ti6dV
         ZA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222264; x=1733827064;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2InjsufEFntOTn6gngou7a+5/1DcqO5mqDCh0ChGiQ=;
        b=HB2X6ULFyGj1c71ewbO2tAQkotZxcoAmovsWf2dgb0CqEWMznQ/3v8zc+PbZrO657r
         3eeG45RF2lVec5P9/p3It9IRSqRb87Lp2AEF2C6v8YYlZZc85lfiLoBQ36lRl5WNdg6m
         Was4mnplcStWI5ETKZFPcIUjgHEUgGTT+11nM8XB4h3ewvtIgBzNbaaPYFyEVgSmh1gF
         9srXgZ+/HLzfeCumq1LfzU/+h4F/vCgm5Gmp3PIvvMVJKo9g8ymYCH/hDXT5KZqf0/3F
         HjDKLCykfDlKtWszv6Pr3tMLU+nMk8/Wknj2K3G0y8cfsSZXk4VMJWLFSdwQg160Ce2H
         sudw==
X-Forwarded-Encrypted: i=1; AJvYcCXLTklCNPm+r2fASE/2FqanZCVGh/JuDVKFgDM+9Gb7Fl8zfubj5CQg74OEVI3yb/3WMll6OiFH4jMLAtopgMs8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2boojPz+tq6DmWTSNHwHlpTS4flgs8xZVC3LAC7hRNfWz76J3
	IoHYwsRJavabtLH82mkwhlCkwbJJwpDeQ5RWtafLOphVdmju4E7bFkbZZxv7XLZthMcK5YFGM7Y
	ZQjFk0Q==
X-Google-Smtp-Source: AGHT+IHSSZV41AorJLfo/1p2l1Qb/DDlm6YrY9d8yFrAzAEDYWvvckpC9yFrYjhtgszoT38Flr2x4P1q4kIY
X-Received: from edty16.prod.google.com ([2002:aa7:ccd0:0:b0:5d0:adc6:6843])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:274d:b0:5d0:e73c:b7f0
 with SMTP id 4fb4d7f45d1cf-5d10cb99c5dmr1943009a12.28.1733222263766; Tue, 03
 Dec 2024 02:37:43 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:20 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-4-qperret@google.com>
Subject: [PATCH v2 03/18] KVM: arm64: Make hyp_page::order a u8
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
X-CRM114-CacheID: sfid-20241203_023746_225556_E8CE502B 
X-CRM114-Status: GOOD (  14.63  )
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
2.47.0.338.g60cca15819-goog


