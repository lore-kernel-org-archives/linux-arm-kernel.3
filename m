Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF93CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RH6hoqk7EsLMc9nVwpPE+90gab30BNeM/1qTHEr8Y8=; b=D28kuroC4pJHh2qYtcvYpWgcl8
	dfTONowMZZbD+qxYJS3Nd16pnMfWIPSCpziWO1JUGuRoG4Qmes7s6Hinrsqpw8yRKdT8phv16CaPv
	bubd/Ke8EgPaZRX7luh71WHvQkcoVj3YXWYkEsbxU1TOjPCjKqFbF2G2bWljh8lWVmV+30j8PpyG5
	Ja/FFbSz33IiyA6RSGhd5+KSTIaHi36QsPc3Yj25kOdaKy1sFUayLsvCxu9PLI06f07tk4Ezu2GSQ
	gyBVaOfnQe6lv0a1LAdl3MDJTxFrYW+jDOb48aAsWCUR+67CDRA5BunWh0ivr7s98hkJ2E4yoGD1l
	0FOqMbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFNh-00000001DP4-3VNd;
	Mon, 28 Sep 2026 17:43:13 +0000
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMc-00000001Chq-1qAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:42:08 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-4870142fd5cso1672792f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617324; x=1791222124; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RH6hoqk7EsLMc9nVwpPE+90gab30BNeM/1qTHEr8Y8=;
        b=PEKR2uyegVfKaIwWeGpZ9AfmjdhNbWMg96bfwkArgSOxF/f6q9aG26NuBmnaInvjKF
         IbOySxmje/Ng16ae6fD+uPJXNsm00wo3/YXVTIgpz3PPbvck9tcPpbceZ1ARdf8fT2fC
         AnEQKm3BZ2CD14mNgjVGcaLCQnDR6iLba7KGgywEfviM8TF/Qo5x36Qcr7FDmkzG4cXh
         yK59fnVa7VrhdsgRVNp5m0+gq/wSi+8VGuFUTYOj7XDptihOdmijF3v4v16N6RsB3+dG
         QwOg5yamQfv0fq6ylTfKBnsCUwflsBw2BCnbu8mzfxJH4R6IMrBnAcZJft4SV2WxoCEV
         RzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617324; x=1791222124;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7RH6hoqk7EsLMc9nVwpPE+90gab30BNeM/1qTHEr8Y8=;
        b=VLePsStRq9Esrp7/pfN3TUEMQn2qR7nupNrRz65o+9Gsz0wRA5J0SrG6dx4hbYd4G0
         TfC8DuejkuILfeLjJ53kHCHiPCEYu0CaImc/eTlqg646JQXIEdT7OPL06yTLTbI/WIrZ
         1ffhjrH8o2xWLJymHQtADoc93oWKl0zCNxdOfl5E4q6K381N5JhPJNHXsOKbhNI+zEC7
         xPuRlYB+FBsQUY88dbEqWI7stIg7WjLLl8tv1CvfYC0dd2QliLUIvRnCqSXoTJtEkpUv
         Ebsl9w+3tUEUObtaITvZpeVZ5wpqOqoJh3U13o8ZmkfsdsVkBBUEiV6FlYAltCS6IFhc
         pNNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkKfWqTssi2NutwldPojwHCpCVjbqUHIopIKAPcHNEMRG12fNPw7n/Kl/iiNl/rACquV6SYoUMXtYDs9YuLliA@lists.infradead.org
X-Gm-Message-State: AFuF++kAILEDTlCoC7PKoBtCG7NKfvrf66fy/odCYV8/I/ce+JgVQWBq
	6zLaoPv7edc77yCoPN1XfIcDIwiRDxMVUWbjopMQk12TZwNqQE+7bUxpiljP8uB+SkaqjiEq+Td
	t/yHLlio8a19TTA==
X-Received: from wmon22.prod.google.com ([2002:a05:600c:4656:b0:49e:7ce3:41f9])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a15:b0:49f:e444:cc4c with SMTP id 5b1f17b1804b1-49ff06bdb00mr183042675e9.12.1790617324124;
 Mon, 28 Sep 2026 10:42:04 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:20 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-14-smostafa@google.com>
Subject: [RFC PATCH 13/15] fork: Implement partial VMAP stack allocation
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Linus Walleij <linus.walleij@linaro.org>, David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104206_619552_8775B5B3 
X-CRM114-Status: GOOD (  17.98  )
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

When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, architectures can
allocate a VMAP stack that is smaller than the full THREAD_SIZE.

This introduces arch abstraction arch_vm_stack_pages() which defaults
to THREAD_SIZE / PAGE_SIZE.
During stack allocation, the kernel will map only the requested number
of pages at the top of the THREAD_SIZE virtual area (as the stack
grows down), leaving the bottom unmapped. This saves memory while
retaining the same virtual alignment and guard page overflow detection
characteristics.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[Rebased, used vm_area->nr_pages directly in one instance]
[Depends on !PREEMPT_RT]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Fix races around accounting]
[Use GFP_ATOMIC when executing in the scheduler]
[Depend on INIT_STACK_ALL_* config]
[Fix bugs in some error paths and edge cases]
[Don't cache partially faulted stacks]
[Added out-var to tell if address is on target stack]
Signed-off-by: David Stevens <stevensd@google.com>
[Remove dynamic stack related code, and update commit message]
[Fix memory leak in error path of alloc_vmap_stack()] and use
 VM_UNINITIALIZED before installing the pages]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/thread_info.h |  8 +++++
 kernel/fork.c               | 68 +++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/include/linux/thread_info.h b/include/linux/thread_info.h
index 307b8390fc67..8f052ec82402 100644
--- a/include/linux/thread_info.h
+++ b/include/linux/thread_info.h
@@ -92,6 +92,14 @@ static inline long set_restart_fn(struct restart_block *restart,
 #define THREAD_ALIGN	THREAD_SIZE
 #endif
 
+/*
+ * Arch selecting CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE should override this
+ * with kernel stack size.
+ */
+#ifndef arch_vm_stack_pages
+#define arch_vm_stack_pages()	(THREAD_SIZE / PAGE_SIZE)
+#endif
+
 #define THREADINFO_GFP		(GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_SKIP_KASAN)
 
 /*
diff --git a/kernel/fork.c b/kernel/fork.c
index ca8e68882316..66fbad3d4cbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -119,6 +119,8 @@
 
 /* For dup_mmap(). */
 #include "../mm/internal.h"
+/* For clear_vm_uninitialized_flag(). */
+#include "../mm/vmalloc.h"
 
 #include <trace/events/sched.h>
 
@@ -272,6 +274,71 @@ static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
 	return false;
 }
 
+#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
+static struct vm_struct *alloc_vmap_stack(int node)
+{
+	gfp_t gfp = GFP_VMAP_STACK;
+	unsigned long addr, end;
+	struct vm_struct *vm_area;
+	int err, i;
+
+	vm_area = get_vm_area_node(THREAD_SIZE, THREAD_ALIGN,
+				   VM_MAP | VM_UNINITIALIZED, node, gfp,
+				   __builtin_return_address(0));
+	if (!vm_area)
+		return NULL;
+
+	vm_area->pages = kmalloc_node(sizeof(void *) * (THREAD_SIZE >> PAGE_SHIFT),
+				      gfp, node);
+	if (!vm_area->pages)
+		goto cleanup_err;
+
+	for (i = 0; i < arch_vm_stack_pages(); i++) {
+		vm_area->pages[i] = alloc_pages_node(node, gfp, 0);
+		if (!vm_area->pages[i])
+			goto cleanup_err;
+		vm_area->nr_pages++;
+		mod_lruvec_page_state(vm_area->pages[i], NR_VMALLOC, 1);
+	}
+
+	end = (unsigned long)kasan_reset_tag(vm_area->addr) + THREAD_SIZE;
+	addr = end - (arch_vm_stack_pages() * PAGE_SIZE);
+
+	err = vmap_pages_range(addr, end, PAGE_KERNEL, vm_area->pages, PAGE_SHIFT);
+	if (err)
+		goto cleanup_err;
+
+	clear_vm_uninitialized_flag(vm_area);
+	return vm_area;
+
+cleanup_err:
+	remove_vm_area(vm_area->addr);
+	if (vm_area->pages) {
+		for (i = 0; i < vm_area->nr_pages; i++) {
+			mod_lruvec_page_state(vm_area->pages[i], NR_VMALLOC, -1);
+			__free_page(vm_area->pages[i]);
+		}
+		kfree(vm_area->pages);
+	}
+	kfree(vm_area);
+	return NULL;
+}
+
+static void free_vmap_stack(struct vm_struct *vm_area)
+{
+	int i;
+
+	remove_vm_area(vm_area->addr);
+
+	for (i = 0; i < vm_area->nr_pages; i++) {
+		mod_lruvec_page_state(vm_area->pages[i], NR_VMALLOC, -1);
+		__free_page(vm_area->pages[i]);
+	}
+
+	kfree(vm_area->pages);
+	kfree(vm_area);
+}
+#else
 static inline struct vm_struct *alloc_vmap_stack(int node)
 {
 	void *stack;
@@ -286,6 +353,7 @@ static inline void free_vmap_stack(struct vm_struct *vm_area)
 {
 	vfree(vm_area->addr);
 }
+#endif /* CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE */
 
 static void thread_stack_free_work(struct work_struct *work)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


