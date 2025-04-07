Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4808C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn2+9t0uAQKpI1fkyan9GnXZ5cSx0o5ImJw1jjfzG1Q=; b=2iS88Ms0ni5EPwxgy8Fd5empLE
	v9t8q4hU1yC1Fzok2Z82jYZY5nB1Kni35OkOV/vGVD4LV1EIEEwsQrI3xvB8PFXhTterXWd6uEQ/a
	LIf1h2KfomBOWuRXNVROxMhU6FIg6hB+WC2yTGQxd0JQ69X4JFaxMZjaQrD4nUYmtyHjY+Jc7yjL4
	gtM2ZRUM8wYyT8xxMqNNSlnWFE0Yh1xcMSRkE5z8lvPMLrXG6IkgkagdODSjoYnQAIlTv24GNZXmB
	3Yey7jgC0i2+VFPqu+pc2oWFtNRzl/662kd4pDAT7ARqo+kMFtos2JMqR4GWWdxVEv7A0a30fuxaN
	H3c0LxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i1m-0000000H33B-0g24;
	Mon, 07 Apr 2025 08:40:22 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpY-0000000GzzI-1zLp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:46 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so26774315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014462; x=1744619262; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn2+9t0uAQKpI1fkyan9GnXZ5cSx0o5ImJw1jjfzG1Q=;
        b=w2gRodb/iI6yS+nxzNL72S5gd8HWFEyMwBukxWStsUnCg82W6/90yVngQ2yKZr48KO
         iyF4zQVbKYoleryrm1xJsffVHhr58h9KnCH1VVfxN7Y66PNwuuXGtgJGXeMpQ3W6zZel
         bUHrcptnosdftYEmzulbC47PnbJ14QjhM6N4wAyrrhu0C6oiXrM6/hJwxgO8NU1XhBw9
         Ff9zZS5Ckmv29lgjPD7ZHZLcQ7NcKeiQs2bWkWS7SqwE3u6qNKqck4DSGiengpcPZhYJ
         yH5VfX9yzRHdAvSFomW+BS2NqRqr7TJ/7KaYhNakmkaS1n6fW2Nb09NrjCMjWoXkzKHN
         tshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014462; x=1744619262;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dn2+9t0uAQKpI1fkyan9GnXZ5cSx0o5ImJw1jjfzG1Q=;
        b=UQyNhZZ8EF45T9FOkUs3CYcIp2HQcvQqCgHDZ8zQJbnLZdzbk6tC05n/Mh++EnvHTP
         nwuGHPaSRT8+wp+TOw0xNLgGh7Zd9i7mM8un5OMbKLi3cjG0yd103kiZscgHIQnzC86j
         KSPSHXUjbqE2uc2iLTY7ZuBlKG+l/9tKgGxqgDWxiylwk2EmDierQPxAUIf3n/v2g7nx
         LDJeivyS2MZ6UZpDG7KoC2z2FH5np1PIKJ5Vsg0MdNNdVJtIm6F5COhpmm3QY7OdjWfz
         LoqKqWKNi20dEWnwSRr0N++3yqBpNXyQuea+2Y1tN5LsB9GY4d/EqTi/omulQbkPvAf1
         nAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoWOnZfAfegP5l34RQjhNCsynWdvBfuLzteACXdN3CRY2RSj+Qm+QVY6ry4Ts1BlY4zSdm03e8L3Hy5nL/Rang@lists.infradead.org
X-Gm-Message-State: AOJu0YwfENhBorhqkvBaCxXWdu9XztOzIBG4uZVv455f2Mt95Fk4o+gE
	uZrSLVteN998eTUq2gQge9oC53C5FlGaLSsCGHY6RkyqUevTdZGHQ7Kor4cJAHJTSy5OQK+Ngbj
	opq7Nx871GHoeb2iJjA==
X-Google-Smtp-Source: AGHT+IFH0OnDZAaSWobuiBXuiNQxhoTA3QsgR8zVSGSxr9+9Oz0U++p2AfoPpuIvPTFDemadwn2KX0LUc5hW26aG
X-Received: from wmsd5.prod.google.com ([2002:a05:600c:3ac5:b0:43c:fce2:1db2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c88:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43ee06985d4mr60562095e9.18.1744014462409;
 Mon, 07 Apr 2025 01:27:42 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:27:03 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-7-vdonnefort@google.com>
Subject: [PATCH v3 6/9] KVM: arm64: Convert pkvm_mappings to interval tree
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012744_527630_51044C8F 
X-CRM114-Status: GOOD (  17.04  )
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
index abd693ce5b93..5276e64f814e 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -167,6 +167,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 419902faaf69..08fbe79dd1e4 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/interval_tree_generic.h>
 #include <linux/kmemleak.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
@@ -273,80 +274,63 @@ static int __init finalize_pkvm(void)
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
@@ -374,28 +358,16 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
2.49.0.504.g3bcea36a83-goog


