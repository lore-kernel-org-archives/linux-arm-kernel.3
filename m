Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7766FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRrzwoqtDq69fzY2uAOlys9sUNZV01DsfbfPbHPHmEY=; b=QYlSRHzV/HXW7/HrBXJcH/nxhB
	FqKy8QmRWmUgJzuXZhiNCn2JPRNUhIZT/ATk71KRaX15sZXb3CtcKMeVvS4KifNSJhIcuCKvrJ5Jl
	whk84soFlmzMFeS22/Qb6yNEJ4Hf7TpsTugevgWtmuJWOAPwV0vNjOZKoFc+cbFMLAu9/X//99Njh
	QyGhO4n4rnKQOJ7L9XINqVr/kwHF0hzuFyn4JrwG83FZdbnlOPBfySHUkusdsn6cA6L+JdoFhrI+8
	0uqL189LOILcC7L9Caz26uaENOthtk3zOpAr5XmKrkY5ueDTQqy2iMyHI4eeI0AAwRLvVXDp4z4pm
	wGBUZ7rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g09-0000000CQHH-1JCr;
	Fri, 03 Oct 2025 13:39:13 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g02-0000000CQ6P-1r8w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:08 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b4813c6cbeeso180734566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498744; x=1760103544; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sRrzwoqtDq69fzY2uAOlys9sUNZV01DsfbfPbHPHmEY=;
        b=UCPy/958XGqNbYgcVUtqfKzZ7fAQT/AeQvhEfECjq/wAqvc17x+5c1skP3dAF3aaUM
         fti6a+J6CXbuIsEmKoYpsELF5lE6A2sfNThF2iPbzZFEdL2jD2kUtSvR798PfRdSytIF
         umwsTAwOVdoUSWdtfa/BIGiu//2n9BeteWKhDRKRM9CmQ9cReTAT8NAH7vKWDALksHD4
         ZMF5ndOHGszpdoZWxyNwtW+5iYzDhm69QanyVstCF3h7E1EIhtrum2T5OY9HxdYf4nnG
         gclgNqdGWLwpIOa9hh/At/uJzP5ENCnmzy9dfFKbRCAvgt1QkbIbYN3Rmsxeod/w3mKf
         nJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498744; x=1760103544;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRrzwoqtDq69fzY2uAOlys9sUNZV01DsfbfPbHPHmEY=;
        b=TndRmY0j8YChS2VExi2KGi0UDqjqzAMJilmaB7g5FpK6tgDNCBq1BuiexSnqWW+rnB
         EMOmtuYcbkSf6OeOjtPGWtuimEH7KBbvsubLLwzMucG6roCOgXyfRYVzpq4SCusOFA79
         +s9NkcxFaHo4kyoKu4MRDwonOs07ngaHTScutuhutfZ+z13qzj3naDu2/wRL/ByRR0Mt
         mmvYJ5GuC7awjPyzSXCdkODLQCXzvM0DU3GNlZFm5ADTh2IafnKeSDMLtfYBdcOOOll1
         LgxqSOD0vU8HY30EhgohId9KOqaUhLEaLkmxMbaZRbKxxiXdOl3sJhvVFWXXs6Q8i3Ic
         27tw==
X-Forwarded-Encrypted: i=1; AJvYcCWyI/8xmSU+LqqhCH1lqtyCTzw60enC0Qklp1Rm1hkSAgqzN6wEKtKFMzx/EkSuzHwKCcH6wPZeXX6MINEK5jsl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7LDZ3+qF8eEw+t6ZDpmt7wJyRCYRvxEfwkg2JV3AeAxW6tWCz
	IIdrnDqoyxDkVodlEqEfY2FCQ3HFpcJWeReamkymwYWUtMYKDrDbu6Z+SCAa9/wI8GrVwYuRv3g
	T+BHiHGiCk8Kcmpsgb6FlTw==
X-Google-Smtp-Source: AGHT+IGUXWWds2ewsHTgFFn05kr5zfhEYrWur6uTyVy86MnDd3O3kJhjbZCZxqlXxu52/kXMpwtMGcq/0xgmj2Uu
X-Received: from ejcd15.prod.google.com ([2002:a17:906:370f:b0:b3d:f163:3222])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9727:b0:b3b:d772:719b with SMTP id a640c23a62f3a-b49c3932abemr367080566b.41.1759498744135;
 Fri, 03 Oct 2025 06:39:04 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:04 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-8-vdonnefort@google.com>
Subject: [PATCH v7 07/28] tracing: Add non-consuming read to trace remotes
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_063906_600983_4BE31BDD 
X-CRM114-Status: GOOD (  20.99  )
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

Allow reading the trace file for trace remotes. This performs a
non-consuming read of the trace buffer.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index abf83ff75df5..c011df20df95 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -18,14 +18,25 @@
 #define TRACEFS_MODE_WRITE	0640
 #define TRACEFS_MODE_READ	0440
 
+enum tri_type {
+	TRI_CONSUMING,
+	TRI_NONCONSUMING,
+};
+
 struct trace_remote_iterator {
 	struct trace_remote		*remote;
 	struct trace_seq		seq;
 	struct delayed_work		poll_work;
 	unsigned long			lost_events;
 	u64				ts;
+	union {
+		struct ring_buffer_iter	**rb_iters;
+		struct ring_buffer_iter *rb_iter;
+	};
 	int				cpu;
 	int				evt_cpu;
+	loff_t				pos;
+	enum tri_type			type;
 };
 
 struct trace_remote {
@@ -36,6 +47,8 @@ struct trace_remote {
 	unsigned long			trace_buffer_size;
 	struct ring_buffer_remote	rb_remote;
 	struct mutex			lock;
+	struct rw_semaphore		reader_lock;
+	struct rw_semaphore		*pcpu_reader_locks;
 	unsigned int			nr_readers;
 	unsigned int			poll_ms;
 	bool				tracing_on;
@@ -225,6 +238,20 @@ static int trace_remote_get(struct trace_remote *remote, int cpu)
 	if (ret)
 		return ret;
 
+	if (cpu != RING_BUFFER_ALL_CPUS && !remote->pcpu_reader_locks) {
+		int lock_cpu;
+
+		remote->pcpu_reader_locks = kcalloc(nr_cpu_ids, sizeof(*remote->pcpu_reader_locks),
+						    GFP_KERNEL);
+		if (!remote->pcpu_reader_locks) {
+			trace_remote_try_unload(remote);
+			return -ENOMEM;
+		}
+
+		for_each_possible_cpu(lock_cpu)
+			init_rwsem(&remote->pcpu_reader_locks[lock_cpu]);
+	}
+
 	remote->nr_readers++;
 
 	return 0;
@@ -239,6 +266,9 @@ static void trace_remote_put(struct trace_remote *remote)
 	if (remote->nr_readers)
 		return;
 
+	kfree(remote->pcpu_reader_locks);
+	remote->pcpu_reader_locks = NULL;
+
 	trace_remote_try_unload(remote);
 }
 
@@ -253,6 +283,48 @@ static void __poll_remote(struct work_struct *work)
 			      msecs_to_jiffies(iter->remote->poll_ms));
 }
 
+static int __alloc_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
+{
+	bool once = false;
+
+	if (cpu != RING_BUFFER_ALL_CPUS) {
+		iter->rb_iter = ring_buffer_read_start(iter->remote->trace_buffer, cpu, GFP_KERNEL);
+
+		return iter->rb_iter ? 0 : -ENOMEM;
+	}
+
+	iter->rb_iters = kcalloc(nr_cpu_ids, sizeof(*iter->rb_iters), GFP_KERNEL);
+	if (!iter->rb_iters)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		iter->rb_iters[cpu] = ring_buffer_read_start(iter->remote->trace_buffer, cpu,
+							     GFP_KERNEL);
+		if (iter->rb_iters[cpu])
+			once = true;
+	}
+
+	return once ? 0 : -ENOMEM;
+}
+
+static void __free_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
+{
+	if (!iter->rb_iter)
+		return;
+
+	if (cpu != RING_BUFFER_ALL_CPUS) {
+		ring_buffer_read_finish(iter->rb_iter);
+		return;
+	}
+
+	for_each_possible_cpu(cpu) {
+		if (iter->rb_iters[cpu])
+			ring_buffer_read_finish(iter->rb_iters[cpu]);
+	}
+
+	kfree(iter->rb_iters);
+}
+
 static struct trace_remote_iterator
 *trace_remote_iter(struct trace_remote *remote, int cpu, enum tri_type type)
 {
@@ -261,6 +333,8 @@ static struct trace_remote_iterator
 
 	lockdep_assert_held(&remote->lock);
 
+	if (type == TRI_NONCONSUMING && !trace_remote_loaded(remote))
+		return NULL;
 
 	ret = trace_remote_get(remote, cpu);
 	if (ret)
@@ -275,9 +349,21 @@ static struct trace_remote_iterator
 	if (iter) {
 		iter->remote = remote;
 		iter->cpu = cpu;
+		iter->type = type;
 		trace_seq_init(&iter->seq);
-		INIT_DELAYED_WORK(&iter->poll_work, __poll_remote);
-		schedule_delayed_work(&iter->poll_work, msecs_to_jiffies(remote->poll_ms));
+
+		switch (type) {
+		case TRI_CONSUMING:
+			INIT_DELAYED_WORK(&iter->poll_work, __poll_remote);
+			schedule_delayed_work(&iter->poll_work, msecs_to_jiffies(remote->poll_ms));
+			break;
+		case TRI_NONCONSUMING:
+			ret = __alloc_ring_buffer_iter(iter, cpu);
+			break;
+		}
+
+		if (ret)
+			goto err;
 
 		return iter;
 	}
@@ -301,10 +387,100 @@ static void trace_remote_iter_free(struct trace_remote_iterator *iter)
 
 	lockdep_assert_held(&remote->lock);
 
+	switch (iter->type) {
+	case TRI_CONSUMING:
+		cancel_delayed_work_sync(&iter->poll_work);
+		break;
+	case TRI_NONCONSUMING:
+		__free_ring_buffer_iter(iter, iter->cpu);
+		break;
+	}
+
 	kfree(iter);
 	trace_remote_put(remote);
 }
 
+static void trace_remote_iter_read_start(struct trace_remote_iterator *iter)
+{
+	struct trace_remote *remote = iter->remote;
+	int cpu = iter->cpu;
+
+	/* Acquire global reader lock */
+	if (cpu == RING_BUFFER_ALL_CPUS && iter->type == TRI_CONSUMING)
+		down_write(&remote->reader_lock);
+	else
+		down_read(&remote->reader_lock);
+
+	if (cpu == RING_BUFFER_ALL_CPUS)
+		return;
+
+	/*
+	 * No need for the remote lock here, iter holds a reference on
+	 * remote->nr_readers
+	 */
+
+	/* Get the per-CPU one */
+	if (WARN_ON_ONCE(!remote->pcpu_reader_locks))
+		return;
+
+	if (iter->type == TRI_CONSUMING)
+		down_write(&remote->pcpu_reader_locks[cpu]);
+	else
+		down_read(&remote->pcpu_reader_locks[cpu]);
+}
+
+static void trace_remote_iter_read_finished(struct trace_remote_iterator *iter)
+{
+	struct trace_remote *remote = iter->remote;
+	int cpu = iter->cpu;
+
+	/* Release per-CPU reader lock */
+	if (cpu != RING_BUFFER_ALL_CPUS) {
+		/*
+		 * No need for the remote lock here, iter holds a reference on
+		 * remote->nr_readers
+		 */
+		if (iter->type == TRI_CONSUMING)
+			up_write(&remote->pcpu_reader_locks[cpu]);
+		else
+			up_read(&remote->pcpu_reader_locks[cpu]);
+	}
+
+	/* Release global reader lock */
+	if (cpu == RING_BUFFER_ALL_CPUS && iter->type == TRI_CONSUMING)
+		up_write(&remote->reader_lock);
+	else
+		up_read(&remote->reader_lock);
+}
+
+static struct ring_buffer_iter *__get_rb_iter(struct trace_remote_iterator *iter, int cpu)
+{
+	return iter->cpu != RING_BUFFER_ALL_CPUS ? iter->rb_iter : iter->rb_iters[cpu];
+}
+
+static struct ring_buffer_event *
+__peek_event(struct trace_remote_iterator *iter, int cpu, u64 *ts, unsigned long *lost_events)
+{
+	struct ring_buffer_event *rb_evt;
+	struct ring_buffer_iter *rb_iter;
+
+	switch (iter->type) {
+	case TRI_CONSUMING:
+		return ring_buffer_peek(iter->remote->trace_buffer, cpu, ts, lost_events);
+	case TRI_NONCONSUMING:
+		rb_iter = __get_rb_iter(iter, cpu);
+		rb_evt = ring_buffer_iter_peek(rb_iter, ts);
+		if (!rb_evt)
+			return NULL;
+
+		*lost_events = ring_buffer_iter_dropped(rb_iter);
+
+		return rb_evt;
+	}
+
+	return NULL;
+}
+
 static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 {
 	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
@@ -314,7 +490,7 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 		if (ring_buffer_empty_cpu(trace_buffer, cpu))
 			return false;
 
-		if (!ring_buffer_peek(trace_buffer, cpu, &iter->ts, &iter->lost_events))
+		if (!__peek_event(iter, cpu, &iter->ts, &iter->lost_events))
 			return false;
 
 		iter->evt_cpu = cpu;
@@ -329,7 +505,7 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 		if (ring_buffer_empty_cpu(trace_buffer, cpu))
 			continue;
 
-		if (!ring_buffer_peek(trace_buffer, cpu, &ts, &lost_events))
+		if (!__peek_event(iter, cpu, &ts, &lost_events))
 			continue;
 
 		if (ts >= iter->ts)
@@ -343,7 +519,21 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 	return iter->ts != U64_MAX;
 }
 
-static int trace_remote_iter_print(struct trace_remote_iterator *iter)
+static void trace_remote_iter_move(struct trace_remote_iterator *iter)
+{
+	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
+
+	switch (iter->type) {
+	case TRI_CONSUMING:
+		ring_buffer_consume(trace_buffer, iter->evt_cpu, NULL, NULL);
+		break;
+	case TRI_NONCONSUMING:
+		ring_buffer_iter_advance(__get_rb_iter(iter, iter->evt_cpu));
+		break;
+	}
+}
+
+static int trace_remote_iter_print_event(struct trace_remote_iterator *iter)
 {
 	unsigned long usecs_rem;
 	u64 ts = iter->ts;
@@ -371,7 +561,11 @@ static int trace_pipe_open(struct inode *inode, struct file *filp)
 		cpu = (long)inode->i_cdev - 1;
 
 	guard(mutex)(&remote->lock);
-	iter = trace_remote_iter(remote, cpu);
+
+	iter = trace_remote_iter(remote, cpu, TRI_CONSUMING);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
 	filp->private_data = iter;
 
 	return IS_ERR(iter) ? PTR_ERR(iter) : 0;
@@ -406,7 +600,8 @@ static ssize_t trace_pipe_read(struct file *filp, char __user *ubuf, size_t cnt,
 	if (ret < 0)
 		return ret;
 
-	while (trace_remote_iter_next(iter)) {
+	trace_remote_iter_read_start(iter);
+
 	while (trace_remote_iter_read_event(iter)) {
 		int prev_len = iter->seq.seq.len;
 
@@ -415,9 +610,11 @@ static ssize_t trace_pipe_read(struct file *filp, char __user *ubuf, size_t cnt,
 			break;
 		}
 
-		ring_buffer_consume(trace_buffer, iter->evt_cpu, NULL, NULL);
+		trace_remote_iter_move(iter);
 	}
 
+	trace_remote_iter_read_finished(iter);
+
 	goto copy_to_user;
 }
 
@@ -427,6 +624,119 @@ static const struct file_operations trace_pipe_fops = {
 	.release	= trace_pipe_release,
 };
 
+static void *trace_seq_start(struct seq_file *m, loff_t *pos)
+{
+	struct trace_remote_iterator *iter = m->private;
+	loff_t i = *pos;
+
+	if (!iter)
+		return NULL;
+
+	if (iter->pos <= *pos) {
+		do {
+			if (!trace_remote_iter_read_event(iter))
+				return NULL;
+
+			trace_remote_iter_move(iter);
+			iter->pos++;
+		} while (i--);
+	}
+
+	return iter;
+}
+
+static void *trace_seq_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	struct trace_remote_iterator *iter = m->private;
+
+	++*pos;
+
+	if (!iter || !trace_remote_iter_read_event(iter))
+		return NULL;
+
+	trace_remote_iter_move(iter);
+	iter->pos++;
+
+	return iter;
+}
+
+static int trace_seq_show(struct seq_file *m, void *v)
+{
+	struct trace_remote_iterator *iter = v;
+
+	trace_seq_init(&iter->seq);
+
+	if (trace_remote_iter_print_event(iter)) {
+		seq_printf(m, "[EVENT %d PRINT TOO BIG]\n", iter->evt->id);
+		return 0;
+	}
+
+	return trace_print_seq(m, &iter->seq);
+}
+
+static void trace_seq_stop(struct seq_file *s, void *v) { }
+
+static const struct seq_operations trace_seq_ops = {
+	.start		= trace_seq_start,
+	.next		= trace_seq_next,
+	.show		= trace_seq_show,
+	.stop		= trace_seq_stop,
+};
+
+static int trace_open(struct inode *inode, struct file *filp)
+{
+	struct trace_remote *remote = inode->i_private;
+	struct trace_remote_iterator *iter = NULL;
+	int cpu = RING_BUFFER_ALL_CPUS;
+	int ret;
+
+	if (!(filp->f_mode & FMODE_READ))
+		return 0;
+
+	if (inode->i_cdev)
+		cpu = (long)inode->i_cdev - 1;
+
+	guard(mutex)(&remote->lock);
+
+	iter = trace_remote_iter(remote, cpu, TRI_NONCONSUMING);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	ret = seq_open(filp, &trace_seq_ops);
+	if (ret) {
+		trace_remote_iter_free(iter);
+		return ret;
+	}
+
+	if (iter)
+		trace_remote_iter_read_start(iter);
+
+	((struct seq_file *)filp->private_data)->private = (void *)iter;
+
+	return 0;
+}
+
+static int trace_release(struct inode *inode, struct file *filp)
+{
+	struct trace_remote_iterator *iter;
+
+	if (!(filp->f_mode & FMODE_READ))
+		return 0;
+
+	iter = ((struct seq_file *)filp->private_data)->private;
+	seq_release(inode, filp);
+
+	if (!iter)
+		return 0;
+
+	guard(mutex)(&iter->remote->lock);
+
+	trace_remote_iter_read_finished(iter);
+	trace_remote_iter_free(iter);
+
+	return 0;
+}
+
 static ssize_t trace_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
 {
 	struct inode *inode = file_inode(filp);
@@ -444,7 +754,11 @@ static ssize_t trace_write(struct file *filp, const char __user *ubuf, size_t cn
 }
 
 static const struct file_operations trace_fops = {
+	.open		= trace_open,
 	.write		= trace_write,
+	.read		= seq_read,
+	.read_iter	= seq_read_iter,
+	.release	= trace_release,
 };
 
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
@@ -533,6 +847,7 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 	remote->trace_buffer_size = 7 << 10;
 	remote->poll_ms = 100;
 	mutex_init(&remote->lock);
+	init_rwsem(&remote->reader_lock);
 
 	if (trace_remote_init_tracefs(name, remote)) {
 		kfree(remote);
-- 
2.51.0.618.g983fd99d29-goog


