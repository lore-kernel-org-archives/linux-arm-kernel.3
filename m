Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEC2CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAVmqlcZ2Z9Lg1Mm4jdT1/XrqkH6zmj7M8ZuRWP5AwA=; b=am+QvQYjzL1mGfslGGQZFfWKDl
	GwvdIJaVs/AhZyLkVczB/Ry8mnbfZA6n5035cz+OkO6NJ1Hb5401aFx6p3ifQ20wfSqWlX3KU0IbI
	c+GpnwZgBWANVLUmDWobyd6EMez0bb9y7vOfXq4PREP7YV+yccxWXBNIPN2qXpSbBd+WpR/IjLtIh
	gdl7HxRkQc8vfSWCQFm7Aimp17vQBoMMJlHm1NSpWIxuQBFMRZiCsIchmzWFzFFidCclRDd4dtGRe
	fwtx0WAlcY8Ibq2l//G4MNbks+aY/OSFjmblvrMLfciM6j5okBs5p0FRCIenRNwhRh6HtMdGaop9W
	zboqSD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Xe-00000007Rro-0mpy;
	Thu, 21 May 2026 10:22:14 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0XY-00000007RoL-2tfj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:22:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fea6292a5so27943165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779358926; x=1779963726; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bAVmqlcZ2Z9Lg1Mm4jdT1/XrqkH6zmj7M8ZuRWP5AwA=;
        b=NMhgwx3BWLCDoaxQhkC7ihQ7qE/K+7Oj88uin9LI3/yNdR52VoDYywe5rTIsBUHLzb
         cFUnC4vrQFBmCs8WESTZo28tm8Sc7On21ygSuRpLwE/LEIhmNh1Q2e6j4iUYPXwJaPQx
         sTMeiEil4byiBJB9JCz/dEi0n8UCG6+in8O3JFUYab5s5JHAcCH2s6q2QMyfOtW2MUhU
         ZeMfdnyh2vOXYwdiZ8pQ57zFn4DIjvjRp0Lq7G7uhFapjDf85oEYZnEAorGtfXZctgcN
         Ab8429yjyEhCnS1vyjAtKBh13pbTRPXsIsmlaIeAo45tLkBa+HVARNzhqBRKusWDfw3e
         NslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358926; x=1779963726;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAVmqlcZ2Z9Lg1Mm4jdT1/XrqkH6zmj7M8ZuRWP5AwA=;
        b=J/ro5FppWPUEBdrIYKWN2Bc9qscWWXOW4V5xXgLVopYgrkTObdqR1vgYuo5mrQn5JN
         mVZbFoN84dkfg//UkcYPdYBtS7dHGlenruAN3bjZeWadtfoXoYarginP6/2yE7hCjwwu
         CBv/jjUcAEVhUutKVEQrWu7glBSKCPcNd05KXWcOpi9OJZkHqyqIh5iiAJ7To/KLgldr
         sAYSPgmSqwPQ/fxFxDYRRB90zylDfMMjhXmZMORvpbJc2okc13H8xfG3Vkm5xlMEUbAW
         dv3IU+HLdd+Mtv3Kn0xlLf5MZ5Ww51LtQTzDZ1CaCxxdGdS6z1tPHA75ybN1fPZLkWdT
         jz8w==
X-Gm-Message-State: AOJu0Yz/bv4tOR8N9uvx+fgF988fdHg5LpoApUXutPOyRrGcGhfYYhmC
	WSu8U9AkQHGd/TsotVrU5S3O+lgoQQHK4GQOYn7tBAl8BJD0K123w45B5swBmybk6wvpsPQ/IKb
	KgMQGgbUXBqtc/gg5qnmhIQ==
X-Received: from wmlz4.prod.google.com ([2002:a05:600c:2204:b0:48f:f301:5115])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c105:b0:48e:5990:9698 with SMTP id 5b1f17b1804b1-490360a5f3amr25133725e9.24.1779358926161;
 Thu, 21 May 2026 03:22:06 -0700 (PDT)
Date: Thu, 21 May 2026 11:21:47 +0100
In-Reply-To: <20260521102149.804874-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521102149.804874-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521102149.804874-2-vdonnefort@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Reset page order in pKVM hyp_pool_init
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_032208_750666_199F122C 
X-CRM114-Status: GOOD (  14.13  )
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
Note that pages added to the pool outside of the initial pool range
(e.g., via guest_s2_zalloc_page()) must still have their order managed
manually.

While at it, add a WARN_ON() in the hyp_pool attach path to catch
unexpected page orders that exceed the pool's max_order.

Fixes: 256b4668cd89 ("KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and initialization")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 25f04629014e..89eb20d4fee4 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -322,7 +322,6 @@ void reclaim_pgtable_pages(struct pkvm_hyp_vm *vm, struct kvm_hyp_memcache *mc)
 	while (addr) {
 		page = hyp_virt_to_page(addr);
 		page->refcount = 0;
-		page->order = 0;
 		push_hyp_memcache(mc, addr, hyp_virt_to_phys);
 		WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(addr), 1));
 		addr = hyp_alloc_pages(&vm->pool, 0);
diff --git a/arch/arm64/kvm/hyp/nvhe/page_alloc.c b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
index a1eb27a1a747..c3b3dc5a8ea7 100644
--- a/arch/arm64/kvm/hyp/nvhe/page_alloc.c
+++ b/arch/arm64/kvm/hyp/nvhe/page_alloc.c
@@ -97,6 +97,8 @@ static void __hyp_attach_page(struct hyp_pool *pool,
 	u8 order = p->order;
 	struct hyp_page *buddy;
 
+	WARN_ON(p->order > pool->max_order);
+
 	memset(hyp_page_to_virt(p), 0, PAGE_SIZE << p->order);
 
 	/* Skip coalescing for 'external' pages being freed into the pool. */
@@ -237,8 +239,10 @@ int hyp_pool_init(struct hyp_pool *pool, u64 pfn, unsigned int nr_pages,
 
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


