Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C8CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWhOl0BO9x9ME0YpBU8lqtkNCs3GopTTt9A3OXiCl+k=; b=aj37Ig5a/V5Q34NJb/aJZypJIY
	ZU0SienflB8vN1US+BJ3eleFZD/jgLuzV4lKNrEDzZkrhjXmVwaSc7Ks4L0i4CiA5IYzMF04Q5frQ
	ZKrWefSk5+KmntCc/XJhOgj0Hc4u1ascYl2L5ujjeUjZMYg4/R7vfCcI+okV+/03kOYxrYGLfciNp
	qyvnRwxRnsJCRnIJLyWXYIEt5ZXnzbvNPrYHvePRmaY/rQEBoS14h6COo9/V5+ZS0xcv/2j/jrZQG
	0ujz2PAG2cRhhcgGThv5ClmMnAsNLX3k6CfcktZJmWdNt/VUYjSjo01M9dET60ovdXN5eTMzjFfbH
	zJ57qgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbMq-0000000495e-1CZ4;
	Tue, 29 Sep 2026 17:11:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbMp-0000000495D-0tmG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 17:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eWhOl0BO9x9ME0YpBU8lqtkNCs3GopTTt9A3OXiCl+k=; b=B2ARi8Tpgq5cTfIIqjJVzzhPMM
	H4eDKDUAVyIhUZIHM9uE5rmMbWRfV3fRZ60DRhNxbIlrNsWdU1Z1SMm63w4RqoDah75TGWNcAtAM3
	QNcR/MuDTcrQG7tCIhI/5BFXolse9jtQJZPDEc24RdQOz8I4saVhmbTBIYl2d0hUdfUN8DyiOyDSD
	kRtDa7BrudUOhUSwae+ll4thvLCB8wIn+FyHMvEVlosM1itYw05EyuxPPwwYKHdz8pNzQlwNonm/T
	obIh2k+b8YJEhYUQO/gChJbsSx/VKn64yN0CQ26cG8ck88P5EXvyrC8oPFyVbKnCtcs8IytUWxKvt
	R5eT+jpA==;
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBbMm-00000002tDG-0St8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:11:46 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-93910c9ff1fso454339785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 10:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790701902; x=1791306702; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWhOl0BO9x9ME0YpBU8lqtkNCs3GopTTt9A3OXiCl+k=;
        b=EK/rkyVYAsRi4k7cl6zp8BOUZP/9uQdnwNNwPs1P5NaVfuv/cOHscF2/tM06Zy0bVV
         gvurxvgefRE1c5or884nPPXr7/meXS1o1ae/7hre6BsdUSbdwhnN2dhN0zmnPujPrEIT
         IBbYJMmzDLLtQtAO5ZUlJbOc2M59KEkgsBzIi5p3X4WEnMWsuFtzf38xwvB9OgEID/RC
         o0cLOjcjSFXRcmjb2mUD6Eq/b5rUGoJxw4sry5/ChFt//03v8eOiDthomZHq7FsnQ6lI
         2pXr/eJTD7rLikPc1Gq/kFikubP7b91flbne3YNztPDVRvHJgG11DPy9bkJXOim1ltLA
         /usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790701902; x=1791306702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWhOl0BO9x9ME0YpBU8lqtkNCs3GopTTt9A3OXiCl+k=;
        b=vUxrBBAel9vGUolY+FgFEkca56pHgbmTVTCke/qO0gfq1kdnUj1CkonaTzsVZbYqmY
         3Q5k4baRvx7D9+NxsGXJ6R3o/aJc31asOpG+2p5Q3TIYjEagoyAlfRLjz4laicSvim4J
         Q0MUZkzyjAP8J6rm3L0ruRN3d2KmLU2k4QomVKajLaQuEE5UMgdf85qRVlmGt3bJSO6V
         qpaFAOU7TVCUFPVxEIluEYCduvNfknJCfCnB3ULe7pDycnuJc25Ys/tgsIVBLwwS6A2J
         I+/K3+CaHI2yzfBLQO03rLpCx+XMHgpNgEUfBL4GlGSGG5hpDkD+SdUlfhR9ltzURY0u
         6wGg==
X-Forwarded-Encrypted: i=1; AKwUvBxkwRPVc34bG9qSgre5ArtKD1UeRJDNZqmVBGx10QVYlHdVD1T9l/KvVYzzN/FzIPpI6vfWzXUO7y4g5CCYKRyG@lists.infradead.org
X-Gm-Message-State: AFuF++k7a8lAjIlfA3zFHvGIcvSx3gWJDsGSfFBxiPAetuUKpvY2k+5s
	QAhOLLOucO4DQn+aleu7LAek6ZKr5U8aRGwSrkza8S8WLoZJHGM88WoKWmoo5uZL8is=
X-Gm-Gg: AYBFou1wAgtEQhl/FU/fjd0mN+Tlo8tsJw9xvP4eHVFNdYVYOoakahRmK2trZ8/AimO
	qFuQo42jcFwy8pYh1C+XRsiosN4iy9aDkbCxF5CbmXVtX7VM95wr8KgD0O7iaHaBFiqUf7wXrVd
	n8aytJWjaGMv7lxxCVWJlGYUEPNCMZPbI0RsIHLbpgTkIWip5u/jJOK8CORDXA9/qcSIvjE4ieZ
	0iMSZFDcRE821mSQnOsbRtaYvNEZqc3qXRUKOHeT3anvgQH9YDyeU0OPBhXhZncng49dnH6S13A
	pVPx1PRmn8tKq8sKEm25M6nhbAbjhN2cOjGATNOMvVTAZLtSw130jZBhTgm9wrs8a4o3ESwaRdl
	GDPPYRDXQdRUnTl6MXu+HtFponmeWfuIHVAIA3rELrOA8IrNLbZQ9UKAdt1cFADquW8NY21rXI+
	TAmcXA57szhTnfGG9rw80JISOzWxYruwbyNISpbwj4UQ2XD4rj/hosDWVTfFe4JmbxMvTH6qq+3
	Efdf3La/BupGa8=
X-Received: by 2002:a05:620a:808c:b0:939:6dea:4f1a with SMTP id af79cd13be357-93c9fa9f5dcmr32032585a.48.1790701901901;
        Tue, 29 Sep 2026 10:11:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f4bfdd4sm16724185a.23.2026.09.29.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:11:41 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 29 Sep 2026 17:07:22 +0000
Subject: [PATCH v6 05/14] ftrace: Mark modules hosting direct-call
 trampolines for Tasks RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rcu-tasks-preempt-qs-v6-5-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
Cc: Boqun Feng <boqun@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 rcu@vger.kernel.org, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790701681; l=7063;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4m3DMCCQmxfOOA6Fvpy5MI/pSHBQI92PlwZVm0x7Dhg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMMoMYZRQwW06l0AxuXntx6A/gYFpIu/nn0GASboMvYOYbCakPG+Ly6xLjVXIW3ZujZlLuhAq2K
 Nwq7u1wj4GQw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_181144_236460_EA8E873F 
X-CRM114-Status: GOOD (  25.68  )
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

An out-of-line direct trampoline registered with register_ftrace_direct()
is kept alive only by Tasks RCU while a task executes it or is preempted
in something it called; ftrace_shutdown()'s synchronize_rcu_tasks() is
what stops rmmod freeing it under such a task.  Where Tasks RCU is built
on reader-marked trampolines, such a trampoline must be a Tasks Trace
reader across its call-out like the ftrace and BPF trampolines are, so
document that in register_ftrace_direct().

That still leaves the few instructions before the reader is entered and
after it is left.  For BPF images those are in dynamically allocated
text that rcu_tasks_trampoline_text() already treats as unmarked
trampoline text, but the in-tree samples (and any similar user) place
their trampolines in module .text.  Add a sticky
module::ftrace_direct_tramp flag (under CONFIG_TASKS_RCU_TRAMPOLINE_READERS,
its only consumer), set by every register/modify path when the direct
address is module text, and have rcu_tasks_trampoline_text() treat a task
interrupted anywhere in such a module as a potential holdout.  Other
modules' text is unaffected.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/module.h |  7 +++++++
 kernel/rcu/tasks.h     | 18 +++++++++++++++---
 kernel/trace/ftrace.c  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..82ca4f774725 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -521,6 +521,13 @@ struct module {
 	unsigned int num_ftrace_callsites;
 	unsigned long *ftrace_callsites;
 #endif
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	/*
+	 * An ftrace direct-call trampoline lives in this module's text; see
+	 * rcu_tasks_trampoline_text().  Sticky once set.
+	 */
+	bool ftrace_direct_tramp;
+#endif
 #ifdef CONFIG_KPROBES
 	void *kprobes_text_start;
 	unsigned int kprobes_text_size;
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 3f127e47ffc2..d3bd06ad362b 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -997,6 +997,8 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  *    deliberately does not ask is_ftrace_trampoline() and friends, since
  *    text being torn down may already be unregistered there);
  *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
+ *  - the text of a module that hosts an out-of-line ftrace direct-call
+ *    trampoline (see ftrace_direct_mark_module());
  *  - the bytes after a kprobe that a pending jump optimization is about to
  *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
  *
@@ -1005,12 +1007,22 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  */
 bool rcu_tasks_trampoline_text(unsigned long ip)
 {
+	bool ret = true;
+
 	if (core_kernel_text(ip))
 		return arch_rcu_tasks_trampoline_text(ip) ||
 		       kprobe_in_optimized_region(ip);
-	if (is_module_text_address(ip))
-		return kprobe_in_optimized_region(ip);
-	return true;
+
+#ifdef CONFIG_MODULES
+	scoped_guard(rcu) {
+		struct module *mod = __module_text_address(ip);
+
+		if (mod)
+			ret = READ_ONCE(mod->ftrace_direct_tramp) ||
+			      kprobe_in_optimized_region(ip);
+	}
+#endif
+	return ret;
 }
 NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..f69f71591358 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6076,6 +6076,29 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->trampoline = 0;
 }
 
+/*
+ * A direct trampoline may live in module text rather than in dynamically
+ * allocated text that rcu_tasks_trampoline_text() recognises on its own (see
+ * samples/ftrace/ftrace-direct*.c).  The trampoline itself must be a Tasks
+ * Trace reader across its call-out (see register_ftrace_direct()); marking the
+ * owning module here covers the instructions before it enters that reader and
+ * after it leaves it, where a task interrupted in the module's text must not be
+ * counted as Tasks-RCU quiescent, so that ftrace_shutdown()'s
+ * synchronize_rcu_tasks() still keeps the module text from being freed under
+ * it.
+ */
+static void ftrace_direct_mark_module(unsigned long addr)
+{
+#if defined(CONFIG_MODULES) && defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS)
+	struct module *mod;
+
+	guard(rcu)();
+	mod = __module_text_address(addr);
+	if (mod)
+		WRITE_ONCE(mod->ftrace_direct_tramp, true);
+#endif
+}
+
 /**
  * register_ftrace_direct - Call a custom trampoline directly
  * for multiple functions registered in @ops
@@ -6090,6 +6113,17 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
  * and save the parameters of the function being traced, and restore them
  * (or inject new ones if needed), before returning.
  *
+ * Nothing but Tasks RCU keeps the trampoline at @addr alive while a task is
+ * executing it or is preempted in something it called.  On architectures that
+ * select HAVE_RCU_TRAMPOLINE_READERS, Tasks RCU only waits for such a task if
+ * it is a Tasks Trace RCU reader, so the trampoline must enter one
+ * (rcu_read_lock_trace() or an assembly equivalent) before calling out and
+ * leave it before returning, just as that option requires of the in-kernel
+ * ftrace and BPF trampolines.  The few instructions before and after are
+ * covered by the irq-exit check: automatically for trampolines outside kernel
+ * and module text (e.g. BPF images), and via ftrace_direct_mark_module() for
+ * trampolines in module text.
+ *
  * Returns:
  *  0 on success
  *  -EINVAL  - The @ops object was already registered with this call or
@@ -6169,6 +6203,7 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->flags |= MULTI_FLAGS;
 	ops->trampoline = FTRACE_REGS_ADDR;
 	ops->direct_call = addr;
+	ftrace_direct_mark_module(addr);
 
 	err = register_ftrace_function_nolock(ops);
 	if (err)
@@ -6237,6 +6272,8 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	lockdep_assert_held_once(&direct_mutex);
 
+	ftrace_direct_mark_module(addr);
+
 	/* Enable the tmp_ops to have the same functions as the direct ops */
 	ftrace_ops_init(&tmp_ops);
 	tmp_ops.func_hash = ops->func_hash;
@@ -6419,6 +6456,7 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
 			if (__ftrace_lookup_ip(direct_functions, entry->ip))
 				goto out_unlock;
+			ftrace_direct_mark_module(entry->direct);
 		}
 	}
 
@@ -6702,6 +6740,7 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
 			tmp = __ftrace_lookup_ip(direct_hash, entry->ip);
 			if (!tmp)
 				continue;
+			ftrace_direct_mark_module(entry->direct);
 			tmp->direct = entry->direct;
 		}
 	}

-- 
2.55.0


