Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0F7C61DD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRF3HmEVCSbkNryj4HHFEle4K2g8xeVsDlkdo6/RfiQ=; b=jOQd/6rn2r66RFWq0RmVKiiQMi
	BckhIouRrbiSgSPy0UI66TJoa3cRldatsqZ9tZpZeVofsSMZc5Y9iwxlH0NRtWApofo7jTun+5ksq
	/oF2h9em1nV/Hzf5uK+n9k4mKyu3At6emKGfTiofTnuIMxHZsYjkduFwj/Ab9RhSo1KG8rFumb7uY
	/jgKLeLXTHQZ+o37HEgijN5J8gTd+GD/pLwfS0HzVoN72dMzTHTnoiXASbfK8KtjWcvMWMkGvFqn3
	oiy2wQMKoHhQt/4eflMArJ7yc6C1vFEd98Ste/zw9x4uI1U1NSGpbL+bbJVWiycO2oGNQ31A4Jwu9
	vtydlISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZN-00000004uDG-0rGe;
	Thu, 27 Aug 2026 23:31:41 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZ5-00000004u6Z-2wRH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:38 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso660746a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873482; x=1788478282; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRF3HmEVCSbkNryj4HHFEle4K2g8xeVsDlkdo6/RfiQ=;
        b=Xp9Xul93tq1hJWx0lIVeYnkAzPmeEZLltJrW/A3TpCrruOLUqDexT6koltyj3gKw4w
         7B+UYb9LeDSru44DFxG2hkW242z5hKtcMm9DhTf2X4ZtzoIo7Hkf3jtioCDC0NebXPXH
         +k/1LOodR7abO04r6hPFVIAzz+jCgODreWiuf5s3syp4Bkyd8AJwS3H2vBWMm6Iirwpe
         kKgP+wG95o6d6GvjOVCNd92eRNu3W8W8t34aBsnpcmP+RPfKNbF32BKTGyZ+MTfNWkM0
         f6cg+Uwjyk5o6v7XYgRBmiiW8eZh+M4Bq7hH2spS8ogdKeSfZ1O8mr/LlCQ/eBt8h8SB
         X0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873482; x=1788478282;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRF3HmEVCSbkNryj4HHFEle4K2g8xeVsDlkdo6/RfiQ=;
        b=WJoLfhxsuw6d6YBN1UOk5O9bM87/HJQrRmfnAsBdEYp3QCBjwxbVq6SsWu2NZuhgps
         BAlE5FNhBq/iD4LVyZZm9wiXj/ZdO/0f+Li20opIfSkca0Dqq2uedGP+CtuAKv4LfFdZ
         BRng7Mz57DFhGoWvHswtVDACeo+itgj9yAQ752w8pcNYZ2R/8IkFoyPqbxpmpxoEPaai
         cTuYHSwFx44B1uOVLXPD6ozSl1Z1TtOfnqFyOjYC4PPaICfRBvL50HHa2qrJQCAe7hC6
         GHWzoqHQXsp90Avca6jFo7AqJvVrpygOTal8qUXyiFg7cAZlgjJbNZ5G1WEqitOuFn2E
         pZCg==
X-Forwarded-Encrypted: i=1; AHgh+RqdRQn48CApI3nCp7I4+U2zWBSh3tTwXOqHlOkCgLADd3NEWh14anSXnEThvIS7lXRsMefNk7xNYCvShSIhABFh@lists.infradead.org
X-Gm-Message-State: AFuF++laFjTqEzHhsN9ULEt3QvJMnNni9cn5HF1AGQWME7d+6syhRGiz
	XC+tvt/046XsUJFi3y7Hu1+Xo1D9uixcFkwkUsIwtOcrLwZBc/cMWl1me6H+OMoZr/KSJJMMYPj
	nqwjOvLAQ1RXzbA==
X-Received: from dyblf13.prod.google.com ([2002:a05:7301:a0d:b0:315:bf25:ce14])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:94c9:b0:3d1:be60:2816 with SMTP id adf61e73a8af0-3d268cf776bmr3404563637.10.1787873482070;
 Thu, 27 Aug 2026 16:31:22 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:41 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-4-stevensd@google.com>
Subject: [RFC 03/10] fork: refactor vmap stack alloc/free into helpers
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_163123_744756_954D5363 
X-CRM114-Status: GOOD (  16.24  )
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

Prepare for alternate implementations of some functions for reclaimable
stacks by creating helpers for allocating and freeing vmap stacks. Also
reorder some functions to consolidate the functions that will have
alternate implementations.

Signed-off-by: David Stevens <stevensd@google.com>
---
 kernel/fork.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index f0e2e131a9a5..10bd76f6dd20 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -207,11 +207,6 @@ static DEFINE_PER_CPU(struct vm_struct *, cached_stacks[NR_CACHED_STACKS]);
  */
 #define GFP_VMAP_STACK (GFP_KERNEL | __GFP_ZERO | __GFP_SKIP_KASAN)
 
-struct vm_stack {
-	struct rcu_head rcu;
-	struct vm_struct *stack_vm_area;
-};
-
 static struct vm_struct *alloc_thread_stack_node_from_cache(struct task_struct *tsk, int node)
 {
 	struct vm_struct *vm_area;
@@ -272,6 +267,26 @@ static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
 	return false;
 }
 
+static void free_vmap_stack(struct vm_struct *vm_area)
+{
+	vfree(vm_area->addr);
+}
+
+static struct vm_struct *alloc_vmap_stack(int node)
+{
+	void *stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
+				     GFP_VMAP_STACK,
+				     node, __builtin_return_address(0));
+	if (!stack)
+		return NULL;
+	return find_vm_area(stack);
+}
+
+struct vm_stack {
+	struct rcu_head rcu;
+	struct vm_struct *stack_vm_area;
+};
+
 static void thread_stack_free_rcu(struct rcu_head *rh)
 {
 	struct vm_stack *vm_stack = container_of(rh, struct vm_stack, rcu);
@@ -280,7 +295,7 @@ static void thread_stack_free_rcu(struct rcu_head *rh)
 	if (try_release_thread_stack_to_cache(vm_stack->stack_vm_area))
 		return;
 
-	vfree(vm_area->addr);
+	free_vmap_stack(vm_area);
 }
 
 static void thread_stack_delayed_free(struct task_struct *tsk)
@@ -302,7 +317,7 @@ static int free_vm_stack_cache(unsigned int cpu)
 		if (!vm_area)
 			continue;
 
-		vfree(vm_area->addr);
+		free_vmap_stack(vm_area);
 		cached_vm_stack_areas[i] = NULL;
 	}
 
@@ -338,7 +353,7 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 	vm_area = alloc_thread_stack_node_from_cache(tsk, node);
 	if (vm_area) {
 		if (memcg_charge_kernel_stack(vm_area)) {
-			vfree(vm_area->addr);
+			free_vmap_stack(vm_area);
 			return -ENOMEM;
 		}
 
@@ -356,15 +371,13 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 		return 0;
 	}
 
-	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
-				     GFP_VMAP_STACK,
-				     node, __builtin_return_address(0));
-	if (!stack)
+	vm_area = alloc_vmap_stack(node);
+	if (!vm_area)
 		return -ENOMEM;
+	stack = vm_area->addr;
 
-	vm_area = find_vm_area(stack);
 	if (memcg_charge_kernel_stack(vm_area)) {
-		vfree(stack);
+		free_vmap_stack(vm_area);
 		return -ENOMEM;
 	}
 	/*
-- 
2.55.0.897.gb25b4bd76c-goog


