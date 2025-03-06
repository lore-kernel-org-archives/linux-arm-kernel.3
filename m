Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BB9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTPitoEhlDo5P7Fhw0/so0kkZd/7LTKjAqNYGdJzP/Q=; b=2iSL8HWRarYIyMDZtzVF7HiyPM
	lBH/M0oCmlOQa6RMQSQbqsUr03z7Dxt083s+PhVUm1eaOJSxJ1JeSf1GNq3B4yQ85efzX0eFWIZPe
	UpqJvs1XBEUnW4TLiodfwGMcFCIq8ZV2yeYyrZqJsnCckIju1fT4qMZSss1hzW4tnwFvd1K8l9XAq
	1cD3gjeGCSS8k1JAW8Gl7RM0S9kbwwOUX3DOhDzc41p4j+1GFncKONIZDz8NGLKMHQNflAvAEW5bP
	o8whphjVuySXhUqfIqMOfdXsLxAntUobhNvWJeicsWIPSiGXD7yJGsW6WYm9lzqPVV/BqLs7deznu
	cuMwOJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqABk-0000000Ataz-3MNh;
	Thu, 06 Mar 2025 12:18:56 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8yK-0000000AiY7-2JLN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:01:01 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-390fd681712so255397f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741258858; x=1741863658; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTPitoEhlDo5P7Fhw0/so0kkZd/7LTKjAqNYGdJzP/Q=;
        b=bpwgbUGqyd2O85Fi/uDLF4A4l3U5bAAx1dzmq6sJlEXKffO2q+4f3TkmxcwmpcIZUS
         lHZYGbs1UY4ZxSe6PxF/d1DZtoanD+1lN8TAKvW2ALGmnt2s3JBxWkOTOVI3L3XUw24h
         m1Q9Z4naFAgTMCAY4gfHs1/b6PfHeS6HzLfuiHJ/R8kfrV+O/wvD3ct4m5ijae1twopM
         TfHhASvhwT4BUKjW5WKoDZU7Dm8KMMRh560p3jlpJElhuoTE258orzO8Rq1a2m0ZC0Qo
         o30CFjW5QveeiYRkMHeD6hXgyxQyBW+otK9GUFc3kV2F+QQYnC3IkXs3ymWm7KTK11ER
         RZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258858; x=1741863658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTPitoEhlDo5P7Fhw0/so0kkZd/7LTKjAqNYGdJzP/Q=;
        b=pT/BEdAhj893gBOlUEgp5L3Xrn/Jt/4ydT7fNWpmzCdpKDuFQOuv4BG2XzxLZA1YED
         gUTDQZRQCH1KD9AUDwEzWXxhEvRMQhVzdn5sPdoGdEOpaN6K6Z+gzZYegL4+gxvrivFG
         CI6qf8CdNXqNj3YJ+ETVoAlJ8JDV5W9I2By37FLd4Ne3bsZhOPHf8eQg/u4dLjd0l7HP
         uYTZ5cxokF1IMYv6Qruxo+/luW/JWW3bCIeOhrgL4HLfimDOnjGAqGKPYwf54vK802/F
         vw3NBkg/3fA7+HF/B9Vx+/qG3G4MXlMLjO5Txwed1p+0/WgjKbPyY6DeFphX1H+4xsW0
         SAWg==
X-Forwarded-Encrypted: i=1; AJvYcCVEC68d+7vFGy2bLPt+/Gj52aECXvi7ELeyfQZ6Sp3tZy3jJtcPjKO1dyF9eqbvkHJ18PqC3LSykTcRYbXJdeCZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwvAST1abVTuWopRa3biYHO2sjT5uWTl7qClDCcfp0j/RRwNxwS
	sqpp8ofwrQQKlLxv0Y1/PLH1w7YZ2oFCiBWYGsrwK4ajm7+hoIhD0gkKcpBuzsm5MSC6MlBUBE5
	8hbIThZlGW2XVGv9HPA==
X-Google-Smtp-Source: AGHT+IEQXtW78/QgWwghNEF6Ze5xCQXvF/c8p86Yy8JUgqzhZp0+q+YljOi0jNJBtHSuvG1B9ZTMgCSQ9MCrQG8P
X-Received: from wmpz20.prod.google.com ([2002:a05:600c:a14:b0:43b:d6ca:6dd3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1fa9:b0:391:c42:dbc with SMTP id ffacd0b85a97d-3911f72608amr6177818f8f.8.1741258858144;
 Thu, 06 Mar 2025 03:00:58 -0800 (PST)
Date: Thu,  6 Mar 2025 11:00:35 +0000
In-Reply-To: <20250306110038.3733649-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250306110038.3733649-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250306110038.3733649-7-vdonnefort@google.com>
Subject: [PATCH v2 6/9] KVM: arm64: Convert pkvm_mappings to interval tree
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_030100_596991_2BC3C59A 
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

From: Quentin Perret <qperret@google.com>

In preparation for supporting stage-2 huge mappings for np-guest, let's
convert pgt.pkvm_mappings to an interval tree.

No functional change intended.

Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 6b9d274052c7..1b43bcd2a679 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -413,7 +413,7 @@ static inline bool kvm_pgtable_walk_lock_held(void)
  */
 struct kvm_pgtable {
 	union {
-		struct rb_root					pkvm_mappings;
+		struct rb_root_cached				pkvm_mappings;
 		struct {
 			u32					ia_bits;
 			s8					start_level;
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index eb65f12e81d9..f0d52efb858e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -166,6 +166,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 2eb1cc30124e..da637c565ac9 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/interval_tree_generic.h>
 #include <linux/kmemleak.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
@@ -270,80 +271,63 @@ static int __init finalize_pkvm(void)
 }
 device_initcall_sync(finalize_pkvm);
 
-static int cmp_mappings(struct rb_node *node, const struct rb_node *parent)
+static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 {
-	struct pkvm_mapping *a = rb_entry(node, struct pkvm_mapping, node);
-	struct pkvm_mapping *b = rb_entry(parent, struct pkvm_mapping, node);
-
-	if (a->gfn < b->gfn)
-		return -1;
-	if (a->gfn > b->gfn)
-		return 1;
-	return 0;
+	return m->gfn * PAGE_SIZE;
 }
 
-static struct rb_node *find_first_mapping_node(struct rb_root *root, u64 gfn)
+static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	struct rb_node *node = root->rb_node, *prev = NULL;
-	struct pkvm_mapping *mapping;
-
-	while (node) {
-		mapping = rb_entry(node, struct pkvm_mapping, node);
-		if (mapping->gfn == gfn)
-			return node;
-		prev = node;
-		node = (gfn < mapping->gfn) ? node->rb_left : node->rb_right;
-	}
-
-	return prev;
+	return (m->gfn + 1) * PAGE_SIZE - 1;
 }
 
-/*
- * __tmp is updated to rb_next(__tmp) *before* entering the body of the loop to allow freeing
- * of __map inline.
- */
+INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
+		     __pkvm_mapping_start, __pkvm_mapping_end, static,
+		     pkvm_mapping);
+
 #define for_each_mapping_in_range_safe(__pgt, __start, __end, __map)				\
-	for (struct rb_node *__tmp = find_first_mapping_node(&(__pgt)->pkvm_mappings,		\
-							     ((__start) >> PAGE_SHIFT));	\
+	for (struct pkvm_mapping *__tmp = pkvm_mapping_iter_first(&(__pgt)->pkvm_mappings,	\
+								  __start, __end - 1);		\
 	     __tmp && ({									\
-				__map = rb_entry(__tmp, struct pkvm_mapping, node);		\
-				__tmp = rb_next(__tmp);						\
+				__map = __tmp;							\
+				__tmp = pkvm_mapping_iter_next(__map, __start, __end - 1);	\
 				true;								\
 		       });									\
-	    )											\
-		if (__map->gfn < ((__start) >> PAGE_SHIFT))					\
-			continue;								\
-		else if (__map->gfn >= ((__end) >> PAGE_SHIFT))					\
-			break;									\
-		else
+	    )
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops)
 {
-	pgt->pkvm_mappings	= RB_ROOT;
+	pgt->pkvm_mappings	= RB_ROOT_CACHED;
 	pgt->mmu		= mmu;
 
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 end)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
 	struct pkvm_mapping *mapping;
-	struct rb_node *node;
+	int ret;
 
 	if (!handle)
-		return;
+		return 0;
 
-	node = rb_first(&pgt->pkvm_mappings);
-	while (node) {
-		mapping = rb_entry(node, struct pkvm_mapping, node);
-		kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
-		node = rb_next(node);
-		rb_erase(&mapping->node, &pgt->pkvm_mappings);
+	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		if (WARN_ON(ret))
+			return ret;
+		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
 		kfree(mapping);
 	}
+
+	return 0;
+}
+
+void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	__pkvm_pgtable_stage2_unmap(pgt, 0, ~(0ULL));
 }
 
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
@@ -371,28 +355,16 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	swap(mapping, cache->mapping);
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
-	WARN_ON(rb_find_add(&mapping->node, &pgt->pkvm_mappings, cmp_mappings));
+	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
 }
 
 int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
-	pkvm_handle_t handle = kvm->arch.pkvm.handle;
-	struct pkvm_mapping *mapping;
-	int ret = 0;
+	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
-	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
-		if (WARN_ON(ret))
-			break;
-		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-		kfree(mapping);
-	}
-
-	return ret;
+	return __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
 }
 
 int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
-- 
2.48.1.711.g2feabab25a-goog


