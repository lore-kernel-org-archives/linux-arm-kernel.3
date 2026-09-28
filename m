Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B37ECA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLizaoNOz6hydwy+EEJKSgP0D8TbobflQ2CjOBToA3A=; b=PsZqS4BEUCRy9cpNaG9pw6q1M+
	emB0TB3c5fVkOTBhyDZSuoNeRo0m6LMhIBP0pMbAtf8XPR2xYjYOFuvY42zsWV6o8oaxpuC81Zco8
	Y9KPTlcGGt2/eKw55o5+lsuxT12orhZXzFtXXgSn1E6gXLO1prpq45JLyFv/2tdVK2Qky9NfqSc0+
	zVLnjMTMXLDgfszjgZO9P2djVYg5RkHIUJh4cGzbMa0hb7IxQ1/NJr7Z28/ujaWvZe9S1ih5/knv1
	e97nfq6nVZREA5vclooYxEwNawWaIdr/X3BliDse6R9nx26obiY3hxyLXZYFYsRMyq1t+hSqgfXcd
	g5xpxuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001Cgi-2F0S;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMR-00000001CXx-3WfZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:56 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49ffe287240so16673295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617313; x=1791222113; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLizaoNOz6hydwy+EEJKSgP0D8TbobflQ2CjOBToA3A=;
        b=vNnXurNab3yW22W17T/BqPBLUeX1bf7qDXkJCx+Ny8qVdC6c1r9mC8EeQ58kbHK4tA
         mLhj7lBQmqNX2P4cJ1BRXMJC5loxlVNeem57UkL0F8XHisNbpJYFAQAmKleqzL/aI0p5
         Mg/5aXXyFMhGRCw6CaDKLYqBEuoCyaU1xp5IMcxd/Tb4VmT16CIVJ9MOaI/YKBXCbqGi
         vZX51PFCrcb/+EtRuFXohv5reLNa6xLFVv1+JsT+MJi9pmtZazWkLxn8tcS6/zO6H5eI
         hz7jkl+9IjnnFoF9xn7oqYP2TI5+N+F0Aplle5HkVOn9CKClroNCcMgMaoP+/gL413yD
         9cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617313; x=1791222113;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLizaoNOz6hydwy+EEJKSgP0D8TbobflQ2CjOBToA3A=;
        b=GY5cyCpbMwZ+wJG5qt1FsJiz80JKX8L+lcdJXo58Ulr8fARNwFyR4xbn6o36NhNwcV
         63SlgexS76zVcxgouR+JipV3mfFWKHQqJDPSxkkblRRrAu+s5FWaIUuUCXqbrXYRVru1
         sRv1J7b7KixK/fbIdHpNZDe5oLVPYHRlb679WcTeqvfGlng/iNnpgP2jubXWMMbVYrdH
         yDoa4hysxk/2RfrcfjZwbFRn95ndv1r2U3oSFsltICcSHci8SZ4XB8Alkz48eTRdPMyS
         70lzjyoKo/GBHtfCZOFP25xgcRGfyltMNMMX4bn9r3Wxbn0gAPFywOV+lJPH+PbmqcSw
         M8ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxNmGzOfGKhJ4P+Ea3rUraq/13JBC3vZkMIt6teH5a1H9AR1zV6Za3ekQIw8aNsfhJI7nBwhfdclUCAja2w+Zz@lists.infradead.org
X-Gm-Message-State: AFuF++njIJfJxRlO+EYKgLMRxrSVrGNY1rDul+aidpRzAWb2/z5yZPXr
	m3ElVAlh7nDxR2MGvpnj3ZAi00fU/7/RFDv9vSo3TmBc/BUZnlw9NQu70wGaHmRbdhsqqX0Ta9W
	v+B71U3DV91mjqg==
X-Received: from wmnb21.prod.google.com ([2002:a05:600c:6d5:b0:49f:e43f:afd1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c5:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49fe66c8623mr231494305e9.1.1790617313066;
 Mon, 28 Sep 2026 10:41:53 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:12 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-6-smostafa@google.com>
Subject: [RFC PATCH 05/15] sched/task_stack: Add helpers for stack high/low
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
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104155_909792_31C0E35B 
X-CRM114-Status: GOOD (  17.80  )
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

Soon, memory mapped for a kernel stack can be less than THREAD_SIZE.
However, many parts of the kernel assume it is.
Add new helpers for the kernel stack that can be called regardless of
CONFIG_STACK_GROWSUP or the kernel stack size:
- task_stack_low(): Lowest usable address on the stack.
- task_stack_high(): Highest usable address on the stack.
- task_stack_size(): The size of a task kernel stack, it is still
  THREAD_SIZE at the moment but that will change soon.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/sched/task_stack.h | 56 ++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index 1fab7e9043a3..4a808f9c4631 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -13,6 +13,8 @@
 
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 
+static __always_inline void *task_stack_low(const struct task_struct *task);
+
 /*
  * When accessing the stack of a non-current task that might exit, use
  * try_get_task_stack() instead.  task_stack_page will return a pointer
@@ -30,7 +32,7 @@ static __always_inline unsigned long *end_of_stack(const struct task_struct *tas
 #ifdef CONFIG_STACK_GROWSUP
 	return (unsigned long *)((unsigned long)task->stack + THREAD_SIZE) - 1;
 #else
-	return task->stack;
+	return task_stack_low(task);
 #endif
 }
 
@@ -64,6 +66,53 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
 
 #endif
 
+/*
+ * Kernel stack layout, higher addresses at the top. task_stack_page() is
+ * the start of the THREAD_SIZE area, task_stack_low() => task_stack_high()
+ * is the usable stack.
+ *
+ * Case 1) Stack grows down: Only the top task_stack_size() bytes are mapped:
+ *
+ *   +-------------+ <- task_stack_high() = task_stack_page() + THREAD_SIZE
+ *   |    stack    |
+ *   |      |      |    task_stack_size() bytes
+ *   |      v      |
+ *   +-------------+ <- task_stack_low() = end_of_stack() (*)
+ *   |   may be    |
+ *   |  unmapped   |    THREAD_SIZE - task_stack_size() bytes
+ *   +-------------+ <- task_stack_page()
+ *
+ *   (*) Depending on CONFIG_THREAD_INFO_IN_TASK, end_of_stack() might be just
+ *       above it.
+ *
+ * Case 2) Stack grows up (CONFIG_STACK_GROWSUP): The whole area is used.
+ * No support for partially mapped stacks.
+ *
+ *   +-------------+ <- task_stack_high() = task_stack_page() + THREAD_SIZE
+ *   |      ^      |    end_of_stack() is the last unsigned long below it
+ *   |      |      |
+ *   |    stack    |    THREAD_SIZE bytes
+ *   +-------------+ <- task_stack_low() = task_stack_page()
+ */
+static __always_inline unsigned long task_stack_size(const struct task_struct *task)
+{
+	return THREAD_SIZE;
+}
+
+static __always_inline void *task_stack_low(const struct task_struct *task)
+{
+#if defined(CONFIG_STACK_GROWSUP)
+	return task_stack_page(task);
+#else
+	return task_stack_page(task) + THREAD_SIZE - task_stack_size(task);
+#endif
+}
+
+static __always_inline void *task_stack_high(const struct task_struct *task)
+{
+	return task_stack_low(task) + task_stack_size(task);
+}
+
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 static inline void *try_get_task_stack(struct task_struct *tsk)
 {
@@ -88,10 +137,11 @@ void exit_task_stack_account(struct task_struct *tsk);
 
 static inline int object_is_on_stack(const void *obj)
 {
-	void *stack = task_stack_page(current);
+	void *stack_base = task_stack_low(current);
+	void *stack_end = task_stack_high(current);
 
 	obj = kasan_reset_tag(obj);
-	return (obj >= stack) && (obj < (stack + THREAD_SIZE));
+	return (obj >= stack_base) && (obj < stack_end);
 }
 
 extern void thread_stack_cache_init(void);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


