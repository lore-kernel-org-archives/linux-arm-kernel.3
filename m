Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D59CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZ4h4JFPJkjPFghLJ0DWNvcvk9w/PFFhb5TesVJy4fY=; b=u0i7NAFwq/2M4BxKdN8pYbGG5c
	vT46WT6R+5AYI5wlediV3dQ8QAB1quW66Fzd6RM7kQ3Sy3tSxOh04rnvqaoeju1L/vS//YteSI41m
	Rhi3N84fBeD7ZtSzrMJ0HaBIrPML62CVhXROgrSFycXDGaxw57SNFTkifXfe0mRZcyVxMANiD22dA
	9OrEbEXwh5GA2fvBYh2bHs4a0Vt6P1Wd6wty6lRsHyxFACLfIBPWu2OvGVfZCPK4VhJW2hpigfJII
	ONsYkaf10wO73bI5+ihESRwogdyFVk1cS3T76jmGFZg8BoY1GBo2g3tn9TrQS7+HVHDwY3vxLf9N1
	N3z9fYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4So-000000084s9-3OzK;
	Thu, 21 May 2026 14:33:30 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Sj-000000084pD-0iPE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:33:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48ff0eb77b5so57290945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374003; x=1779978803; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZ4h4JFPJkjPFghLJ0DWNvcvk9w/PFFhb5TesVJy4fY=;
        b=KCJuGfFYazBTegktvIvAYs2MXVvhXuSg/6ehroVTEh0csp83S8KUmjah8WUbgyukX1
         NsVRgeWxLd0V37hNrKOkFPkWGy7N1Jdmh+E2sqTya8UrWMboGUqfs0bJ6ulL8OgOeuco
         T+aepF4HfHgizEwrzEz9ysyqJG2xAcogmlf9P8Cd4/K7STwjfPFoTRXAhfRsN47NkF7n
         Oi9hkHXIwuWGr+hsTSH+V2WxNWjzb1zoHIfVugwgOcsnIir6a6ZtbZykOFpR3wsZXIeM
         y4f84xN3G1QF4Tpyc4BH9P7V+2lk3ttl+cej0M+F5r+eEgNpE3PWVogy86vwxEWAoYgz
         9+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374003; x=1779978803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZ4h4JFPJkjPFghLJ0DWNvcvk9w/PFFhb5TesVJy4fY=;
        b=VXAAFURydtLmzu+69/qqP+Pbh68dHhvCdJnlIIVjX2RKZf+aC6vZ4i9VgIJ/VG8Ndj
         p87ajYosDS3/WFisorgLRt4OuQQR/eOIgJCyRSukYtXF4CxubawThOBEVDsD/YC8UZTg
         9JMv6IXZbGKf4CG1RNMf4ZpYY4yOlECERuxDO8KXiJLKwMUbtO5RYNFIqxGiEvfXW96H
         ZSwFf9FUfVuF+FHJfS7cIE0guRQikOl/2b55Okpfq04GSq7/08nfT8EFS1GZIn7xRF5i
         W6+s/L/hI4Ogsm9D+7/zOoB4oViTomycsIGi5jgmjT4FUksiijNO/d9iwW0VNyTLw+Gf
         BITQ==
X-Gm-Message-State: AOJu0YyEccDCzMaBRHpNrPRTYmI7+to0YHBBtyviJNGKEFarYnMKAOr2
	NmGOOsv6Au189KI5dFOfPNyf4In7aDMNYg/kWvMBMNehkoRn52yGcDKZ0poj2toxgYGEj6gY4DY
	LKWqDg1h41znZel5DajRJRQ==
X-Received: from wmlz4.prod.google.com ([2002:a05:600c:2204:b0:48f:f301:5115])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a04:b0:48a:97b6:7420 with SMTP id 5b1f17b1804b1-490360e46d3mr43743355e9.24.1779374002345;
 Thu, 21 May 2026 07:33:22 -0700 (PDT)
Date: Thu, 21 May 2026 15:33:16 +0100
In-Reply-To: <20260521143318.1002172-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521143318.1002172-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521143318.1002172-2-vdonnefort@google.com>
Subject: [PATCH v3 1/3] KVM: arm64: Reset page order in pKVM hyp_pool
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073325_223854_166F6C46 
X-CRM114-Status: GOOD (  16.11  )
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

When a VM fails to initialise after its stage-2 hyp_pool has been
initialised, that stage-2 must be torn down entirely. This requires
resetting both the refcount and the order of its pages back to 0.

Currently, reclaim_pgtable_pages() implicitly resets the page order by
allocating the entire pool with order-0 granularity. However, in the VM
initialisation error path, the addresses of the donated memory (the PGD)
are already known, making it unnecessary to iterate over all pages in
the pool.

Since the vmemmap page order is a hyp_pool-specific field, leaving a
non-zero order on hyp_pool destruction is harmless until another pool
attempts to admit the page. Instead of resetting this field during
destruction, reset it during pool initialization in hyp_pool_init().

For 'external' pages, we can't trust the order either as they bypass
hyp_pool_init(). Since we never coalesce them, enforce order-0 to ensure
safe insertion into the pool.

This leaves no vmemmap order users outside of hyp_pool.

Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 25f04629014e..fa447d400b71 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -217,7 +217,6 @@ static void *guest_s2_zalloc_page(void *mc)
 	memset(addr, 0, PAGE_SIZE);
 	p = hyp_virt_to_page(addr);
 	p->refcount = 1;
-	p->order = 0;
 
 	return addr;
 }
@@ -322,7 +321,6 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
 	while (addr) {
 		page = hyp_virt_to_page(addr);
 		page->refcount = 0;
-		page->order = 0;
 		push_hyp_memcache(mc, addr, hyp_virt_to_phys);
 		WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
 		addr = hyp_alloc_pages(&vm->pool, 0);
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index a1eb27a1a747..57f86aa0f82f 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -94,13 +94,22 @@ static void __hyp_attach_page(struct hyp_pool *pool,
 			      struct hyp_page *p)
 {
 	phys_addr_t phys = hyp_page_to_phys(p);
-	u8 order = p->order;
 	struct hyp_page *buddy;
+	bool coalesce = true;
+	u8 order = p->order;
 
-	memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
+	/*
+	 * 'external' pages are never coalesced and their ->order field
+	 * untrusted as they bypass hyp_pool_init(). Enforce order-0.
+	 */
+	if (phys < pool->range_start || phys >= pool->range_end) {
+		order = 0;
+		coalesce = false;
+	}
+
+	memset(hyp_page_to_virt(p), 0, PAGE_SIZE << order);
 
-	/* Skip coalescing for 'external' pages being freed into the pool. */
-	if (phys < pool->range_start || phys >= pool->range_end)
+	if (!coalesce)
 		goto insert;
 
 	/*
@@ -237,8 +246,10 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
 
 	/* Init the vmemmap portion */
 	p = hyp_phys_to_page(phys);
-	for (i = 0; i < nr_pages; i++)
+	for (i = 0; i < nr_pages; i++) {
 		hyp_set_page_refcounted(&p[i]);
+		p[i].order = 0;
+	}
 
 	/* Attach the unused pages to the buddy tree */
 	for (i = reserved_pages; i < nr_pages; i++)
-- 
2.54.0.746.g67dd491aae-goog


