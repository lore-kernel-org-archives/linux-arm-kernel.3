Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829DDC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrWP6Zwi1iKiAKyg1cea1PjFAdTTJFrjdN8oFu8iy90=; b=TQGNXtYsTY0u8+zZko0Q23ZiXa
	90mRZGEh//B9drEOOa3XZBWrSsK7a6QlRXlj7EuAFA5J9ek0HicSHyhbCt2/8kEx7MM09/5gPu/PG
	kYU2U+E2IRZycBPOook9pBzTUWnD7PwUIwiFObS+RYdjE0LVN8VNaL74wIBI/txOOoDyZXdd/Mk1B
	rIxvMC/bPL6h18vFxunAfojbL47ZCLUZCc9guODaw7NmHKeGC0tvltgS4DQ81/GDZOsXwXEuXCrp5
	gqI7nWUlepiRrQ/I71YeoMOx3Q/sF18t7K8TBsEu0hX2BIHKYYHshN5fu2TB/qCZTcWYx1ewY83lu
	IrRgy7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJmu-0000000CHBp-1yFz;
	Tue, 20 May 2025 10:01:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJOy-0000000CDSe-33mr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 09:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RrWP6Zwi1iKiAKyg1cea1PjFAdTTJFrjdN8oFu8iy90=; b=I/poc/vnWqxtwm9ZEgnPrceFSN
	ZAk/q3SDrPptPd8ujbBsybcB6UWYr7Frrq8gQTC6OmTbQn3yJLUCkR5j4xyaJzF9G350MZq1gAuu2
	0R5gVgmjAFue61xMQVXxvyfgm2irtMlBZikuFVWafMjxdrJTh2UN/7NI0Abz/Ea+ZMItaaPhuJf8+
	cMgteRX5znp0IY8gOatCtrqcTX+jjFQPtzyoZwK3nhEjtfbdw9SMHILuAD7x5DUycMyqgHyefuk+I
	FXs4lP8dapMPgs61PqTAW2O3IAjV86uk4BzjjRJEthy6wsHFIN/2XUAA1KfmAa2jrXUFOMO2oD+r2
	p9hYk5qA==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIip-00000000jqh-1kQm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:17 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-442cd12d151so37826975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731193; x=1748335993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrWP6Zwi1iKiAKyg1cea1PjFAdTTJFrjdN8oFu8iy90=;
        b=fEi5aHMlUOHBK8eow82T9a5hbhL1Auf4V1EzLF3hBotqF5IX418cPCGOYFCR4yIVFs
         EsK24p5o5nMG3ucMEYnI26Go0hEXX1MgG64hIHqq7k9KE/XxpyaYvNGM/48nXw3isRf7
         dYI7W5DkksrEUdxk0O/tCF57nXSxuUeiazWChJAl6zMUQIen5osIC8Q7A2bYwzMHGHOW
         O8EnAzmbo+2Tt6m5SbcNLSQMQ20bCn+TfwcvO7qV3MiiVDMJSYaBfDegWA4BmMQ91egI
         szAaQOvuqrtuauOs2EaCzMO0EQHvCkvDP4znzZiqbli+hJAmfzwU5KJViPL5sp4pSQF/
         fbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731193; x=1748335993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrWP6Zwi1iKiAKyg1cea1PjFAdTTJFrjdN8oFu8iy90=;
        b=Zu17gfHavekx5JyJ5Za+car3oRsC62uQQcX8hmLkGWWEPr7ePDktXtWgyO6Vrq8aRD
         bF/PjTcWd81jgfjO5NPsLPr3GHgEvCVT9dyoJEnS9ntj9X4yeTjsaizp0qLuEg2XhgKm
         kz5w6nJBBCcZgAyGbgivnB1ixXXF3f/7502HsbXGPWj8jke0sq+1ZNCYrk/Tw9JfxP1f
         nsaLe79Q6wgFoH5RBqrqv/TyzxMtkHmcXqYsM1R7x1nzx4Y3NV1ItAMvcREnQBJxS1Y8
         UQFlheHoQXcloEG2YOWwW3ElPltTlGVXQJ7WBUuGMQdiG3T/c2rjIgFjMKPL9Mu+qAjo
         synA==
X-Forwarded-Encrypted: i=1; AJvYcCWFmXXL3WzOwQ9H+j/us04Iyz2sHM/CtR+izniod66I7lFL5d355YT6b9sK00FQuP5nC1kJhf0tYgCmZWUmqIXE@lists.infradead.org
X-Gm-Message-State: AOJu0YxfA4cJOI4TelnXTptDlnrWZdwIei1Oxvj+N9hLg04BfXMt3pvK
	5dt0SqY7JBuZcsbHj940Kk0oWxfbx/g2FiBis7xsQTFgG7klrFrfbH1ukqu9EChzp/BW7Y3GSd0
	LrTwhSZ5u/tYqkeXMbhs0ew==
X-Google-Smtp-Source: AGHT+IEhnGx4Z5EioPu9R9SzxcAGfn72t0MQB9mOLaN9BEycLK0Unt6J+YjxJNJg9wU++DwSP7macxTmZ+HqWzf+
X-Received: from wmbep11.prod.google.com ([2002:a05:600c:840b:b0:43c:ef7b:ffac])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3554:b0:442:cd13:f15d with SMTP id 5b1f17b1804b1-442fd67197dmr147790395e9.29.1747731193204;
 Tue, 20 May 2025 01:53:13 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:58 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-8-vdonnefort@google.com>
Subject: [PATCH v5 07/10] KVM: arm64: Convert pkvm_mappings to interval tree
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095316_097463_33F907D5 
X-CRM114-Status: GOOD (  17.29  )
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
index d91bfcf2db56..da75d41c948c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -173,6 +173,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 057874bbe3e1..8a1a2faf66a8 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/interval_tree_generic.h>
 #include <linux/kmemleak.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
@@ -256,80 +257,67 @@ static int __init finalize_pkvm(void)
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
 
+INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
+		     __pkvm_mapping_start, __pkvm_mapping_end, static,
+		     pkvm_mapping);
+
 /*
- * __tmp is updated to rb_next(__tmp) *before* entering the body of the loop to allow freeing
- * of __map inline.
+ * __tmp is updated to iter_first(pkvm_mappings) *before* entering the body of the loop to allow
+ * freeing of __map inline.
  */
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
@@ -357,28 +345,16 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
-		if (WARN_ON(ret))
-			break;
-		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-		kfree(mapping);
-	}
+	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
 
-	return ret;
+	return __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
 }
 
 int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
-- 
2.49.0.1143.g0be31eac6b-goog


