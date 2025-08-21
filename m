Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFB0CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TBF5A/91YZzcYTJWeKqOEi+q2cOi1diGR9Op3ftiDk=; b=PA14rSM3G1Tsp8kKzAgTS96PRO
	iA1+BPYEbKA/khK2uYY1TfYBIQDYBTZ2MuN0381VKApcJPq7Wa/XR3S3VdSjDxvOP/4rhzjwyJ5Gn
	issbxoqEyOP9xQdE7ltQpC8JLPtPOh/2WuerYXcqYCptlGXG8xHygF142G5IwnvcDROKQNGXDw6tO
	30ATjvsx/lkj8YuXiScqU4dmkAaehHZ0Yx3Bs7GDmt3rSmmEAxeNmxTb5Q2Cg8pWVqZomjGGkCbPS
	F6fdTZXMrIGUgQ9yX9rvUPGqwp5yvFr+If+YMVnUJbJDaP8fstjErPmbUvNyl1Gq+TeY15P8ot3mo
	u90ijc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up37u-0000000GhHP-2UjS;
	Thu, 21 Aug 2025 11:06:38 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RE-0000000GCcA-09Oc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:25 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b05d8d0so4073545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764062; x=1756368862; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TBF5A/91YZzcYTJWeKqOEi+q2cOi1diGR9Op3ftiDk=;
        b=zyd4e7zJ5Z6KYkNB9S+pLA7IpOj7vrG6j8Lz5mCpgmk1n/GUECMHPS5N5NcCp1+3b3
         whU0dmnKudbPT27d809r8NJyL4qfusyc5EQvSasxzbOo3YllCMBioDWH2KK9IXU4dKGf
         d5cXoUDD16DOLMixoR85ObqeeTCxwE4C79KfPPNQobsGmVCZRDcAAcLYvIaolfeJQnEE
         aUK7RvHqo072//Rp29sXeGnLdgivu5wPSD4XBrza52H39I3fxlmAHaukkustnwX1ZfBO
         d1xzPvD/ZWHVicposPXaYEXrBJ49VNxmlZFKMEzZtxO3rgbsw6vsVpdivu4yNkJ10VKW
         p0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764062; x=1756368862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TBF5A/91YZzcYTJWeKqOEi+q2cOi1diGR9Op3ftiDk=;
        b=qRODGp7m7ELAa5flCt3zfdm9KQ+//WRwgqkaXGDWjPjUslBPrjYq2dmmkuQJfK01CE
         Izd15atpfObxs1C0aC/2yIRh3Td68I5DFBGlZDcTF3Cyzg/JfQXYpYQv2+MwspZykx71
         pXRgdxdam8ToIgGVNhwa5e0ypyYVk4d+I47sd9tizQfLUjPUCi0uMwiY+A0F774oayG2
         qn+jJeWt72J5NNldu5BcoBj5sSmCvEDIhn5+rXh8bTd+8APBwkSmSR+r0xq0g8aqmvUG
         yBa70gcQN43e6EVNvaYwMVzoo7skMvhWI1XGYcUrPqUFuT8lj3AMxBPE+flZm6Eip2Um
         v5rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzpW8S/YUDN8mTqR2UVLMM3MCMXcZCMbCa0pqt2LlPLnbe4Qy+BrTEHwie+mLYlJ//L7h7BI6pwF7fpMIcvxDg@lists.infradead.org
X-Gm-Message-State: AOJu0YzGy37vGObZGUULs64TwlcaMWhga60SUIbA7XuP1VuwOsJA5DXV
	jood6HkaipkERTwF2hBiEx6TDoMspe+vF09f8oCqVGK7fDvSJNwSsI9fE7fbf9sYte6E4BAnSC+
	VcOizC1AHF8YxVD/5phQJYg==
X-Google-Smtp-Source: AGHT+IFdkFpRbxMFks2nYePijUM3BjPUz1erddqr0s/Dj69fxitO7EAj+773cv9BnM8LIrPeUDxGJxcpArjrQqIT
X-Received: from wmbex21.prod.google.com ([2002:a05:600c:8315:b0:458:c0b7:b936])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:458a:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-45b4d85d764mr10152965e9.32.1755764062435;
 Thu, 21 Aug 2025 01:14:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:51 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-4-vdonnefort@google.com>
Subject: [PATCH v6 03/24] tracing: Introduce trace remotes
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
X-CRM114-CacheID: sfid-20250821_011424_114445_8C1B74E6 
X-CRM114-Status: GOOD (  20.75  )
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

A trace remote relies on ring-buffer remotes to read and control
compatible tracing buffers, written by entity such as firmware or
hypervisor.

Add a Tracefs directory remotes/ that contains all instances of trace
remotes. Each instance follows the same hierarchy as any other to ease
the support by existing user-space tools.

This currently does not provide any event support, which will come
later.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
new file mode 100644
index 000000000000..de043a6f2fe0
--- /dev/null
+++ b/include/linux/trace_remote.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_TRACE_REMOTE_H
+#define _LINUX_TRACE_REMOTE_H
+
+#include <linux/ring_buffer.h>
+
+struct trace_remote_callbacks {
+	struct trace_buffer_desc *
+		(*load_trace_buffer)(unsigned long size, void *priv);
+	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
+	int	(*enable_tracing)(bool enable, void *priv);
+	int	(*swap_reader_page)(unsigned int cpu, void *priv);
+};
+
+int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
+int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t size,
+			      const struct cpumask *cpumask);
+void trace_remote_free_buffer(struct trace_buffer_desc *desc);
+
+#endif
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index d2c79da81e4f..99af56d39eaf 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1238,4 +1238,7 @@ config HIST_TRIGGERS_DEBUG
 
 source "kernel/trace/rv/Kconfig"
 
+config TRACE_REMOTE
+	bool
+
 endif # FTRACE
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index dcb4e02afc5f..6dab341acc46 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -110,4 +110,5 @@ obj-$(CONFIG_FPROBE_EVENTS) += trace_fprobe.o
 obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 obj-$(CONFIG_RV) += rv/
 
+obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
 libftrace-y := ftrace.o
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 4283ed4e8f59..b4654ff1b07c 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8939,7 +8939,7 @@ static struct dentry *tracing_dentry_percpu(struct trace_array *tr, int cpu)
 	return tr->percpu_dir;
 }
 
-static struct dentry *
+struct dentry *
 trace_create_cpu_file(const char *name, umode_t mode, struct dentry *parent,
 		      void *data, long cpu, const struct file_operations *fops)
 {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 1dbf1d3cf2f1..56fc8f109e65 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -672,6 +672,12 @@ struct dentry *trace_create_file(const char *name,
 				 struct dentry *parent,
 				 void *data,
 				 const struct file_operations *fops);
+struct dentry *trace_create_cpu_file(const char *name,
+				     umode_t mode,
+				     struct dentry *parent,
+				     void *data,
+				     long cpu,
+				     const struct file_operations *fops);
 
 
 /**
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
new file mode 100644
index 000000000000..1a4786b7970c
--- /dev/null
+++ b/kernel/trace/trace_remote.c
@@ -0,0 +1,518 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 - Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/kstrtox.h>
+#include <linux/lockdep.h>
+#include <linux/mutex.h>
+#include <linux/tracefs.h>
+#include <linux/trace_remote.h>
+#include <linux/trace_seq.h>
+#include <linux/types.h>
+
+#include "trace.h"
+
+#define TRACEFS_DIR		"remotes"
+#define TRACEFS_MODE_WRITE	0640
+#define TRACEFS_MODE_READ	0440
+
+struct trace_remote_iterator {
+	struct trace_remote		*remote;
+	struct trace_seq		seq;
+	struct delayed_work		poll_work;
+	unsigned long			lost_events;
+	u64				ts;
+	int				cpu;
+	int				evt_cpu;
+};
+
+struct trace_remote {
+	struct trace_remote_callbacks	*cbs;
+	void				*priv;
+	struct trace_buffer		*trace_buffer;
+	struct trace_buffer_desc	*trace_buffer_desc;
+	unsigned long			trace_buffer_size;
+	struct ring_buffer_remote	rb_remote;
+	struct mutex			lock;
+	unsigned int			nr_readers;
+	unsigned int			poll_ms;
+	bool				tracing_on;
+};
+
+static bool trace_remote_loaded(struct trace_remote *remote)
+{
+	return remote->trace_buffer;
+}
+
+static int trace_remote_load(struct trace_remote *remote)
+{
+	struct ring_buffer_remote *rb_remote = &remote->rb_remote;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (trace_remote_loaded(remote))
+		return 0;
+
+	remote->trace_buffer_desc = remote->cbs->load_trace_buffer(remote->trace_buffer_size,
+								   remote->priv);
+	if (IS_ERR(remote->trace_buffer_desc))
+		return PTR_ERR(remote->trace_buffer_desc);
+
+	rb_remote->desc = remote->trace_buffer_desc;
+	rb_remote->swap_reader_page = remote->cbs->swap_reader_page;
+	rb_remote->priv = remote->priv;
+	remote->trace_buffer = ring_buffer_remote(rb_remote);
+	if (!remote->trace_buffer) {
+		remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void trace_remote_try_unload(struct trace_remote *remote)
+{
+	lockdep_assert_held(&remote->lock);
+
+	if (!trace_remote_loaded(remote))
+		return;
+
+	/* The buffer is being read or writable */
+	if (remote->nr_readers || remote->tracing_on)
+		return;
+
+	/* The buffer has readable data */
+	if (!ring_buffer_empty(remote->trace_buffer))
+		return;
+
+	ring_buffer_free(remote->trace_buffer);
+	remote->trace_buffer = NULL;
+	remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
+}
+
+static int trace_remote_enable_tracing(struct trace_remote *remote)
+{
+	int ret;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (remote->tracing_on)
+		return 0;
+
+	ret = trace_remote_load(remote);
+	if (ret)
+		return ret;
+
+	ret = remote->cbs->enable_tracing(true, remote->priv);
+	if (ret) {
+		trace_remote_try_unload(remote);
+		return ret;
+	}
+
+	remote->tracing_on = true;
+
+	return 0;
+}
+
+static int trace_remote_disable_tracing(struct trace_remote *remote)
+{
+	int ret;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (!remote->tracing_on)
+		return 0;
+
+	ret = remote->cbs->enable_tracing(false, remote->priv);
+	if (ret)
+		return ret;
+
+	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
+	remote->tracing_on = false;
+	trace_remote_try_unload(remote);
+
+	return 0;
+}
+
+static ssize_t
+tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct trace_remote *remote = filp->private_data;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&remote->lock);
+
+	ret = val ? trace_remote_enable_tracing(remote) : trace_remote_disable_tracing(remote);
+	if (ret)
+		return ret;
+
+	return cnt;
+}
+static int tracing_on_show(struct seq_file *s, void *unused)
+{
+	struct trace_remote *remote = s->private;
+
+	seq_printf(s, "%d\n", remote->tracing_on);
+
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(tracing_on);
+
+static ssize_t buffer_size_kb_write(struct file *filp, const char __user *ubuf, size_t cnt,
+				    loff_t *ppos)
+{
+	struct trace_remote *remote = filp->private_data;
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	if (ret)
+		return ret;
+
+	/* KiB to Bytes */
+	if (!val || check_shl_overflow(val, 10, &val))
+		return -EINVAL;
+
+	guard(mutex)(&remote->lock);
+
+	remote->trace_buffer_size = val;
+
+	return cnt;
+}
+
+static int buffer_size_kb_show(struct seq_file *s, void *unused)
+{
+	struct trace_remote *remote = s->private;
+
+	seq_printf(s, "%lu (%s)\n", remote->trace_buffer_size >> 10,
+		   trace_remote_loaded(remote) ? "loaded" : "unloaded");
+
+	return 0;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(buffer_size_kb);
+
+static void __poll_remote(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct trace_remote_iterator *iter;
+
+	iter = container_of(dwork, struct trace_remote_iterator, poll_work);
+	ring_buffer_poll_remote(iter->remote->trace_buffer, iter->cpu);
+	schedule_delayed_work((struct delayed_work *)work,
+			      msecs_to_jiffies(iter->remote->poll_ms));
+}
+
+static struct trace_remote_iterator *trace_remote_iter(struct trace_remote *remote, int cpu)
+{
+	struct trace_remote_iterator *iter;
+	int ret;
+
+	if (remote->nr_readers == ULONG_MAX)
+		return ERR_PTR(-EBUSY);
+
+	ret = trace_remote_load(remote);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* Test the CPU */
+	ret = ring_buffer_poll_remote(remote->trace_buffer, cpu);
+	if (ret)
+		goto err;
+
+	iter = kzalloc(sizeof(*iter), GFP_KERNEL);
+	if (iter) {
+		remote->nr_readers++;
+
+		iter->remote = remote;
+		iter->cpu = cpu;
+		trace_seq_init(&iter->seq);
+		INIT_DELAYED_WORK(&iter->poll_work, __poll_remote);
+		schedule_delayed_work(&iter->poll_work, msecs_to_jiffies(remote->poll_ms));
+
+		return iter;
+	}
+	ret = -ENOMEM;
+
+err:
+	trace_remote_try_unload(remote);
+
+	return ERR_PTR(ret);
+}
+
+static bool trace_remote_iter_next(struct trace_remote_iterator *iter)
+{
+	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
+	int cpu = iter->cpu;
+
+	if (cpu != RING_BUFFER_ALL_CPUS) {
+		if (ring_buffer_empty_cpu(trace_buffer, cpu))
+			return false;
+
+		if (!ring_buffer_peek(trace_buffer, cpu, &iter->ts, &iter->lost_events))
+			return false;
+
+		iter->evt_cpu = cpu;
+		return true;
+	}
+
+	iter->ts = U64_MAX;
+	for_each_possible_cpu(cpu) {
+		unsigned long lost_events;
+		u64 ts;
+
+		if (ring_buffer_empty_cpu(trace_buffer, cpu))
+			continue;
+
+		if (!ring_buffer_peek(trace_buffer, cpu, &ts, &lost_events))
+			continue;
+
+		if (ts >= iter->ts)
+			continue;
+
+		iter->ts = ts;
+		iter->evt_cpu = cpu;
+		iter->lost_events = lost_events;
+	}
+
+	return iter->ts != U64_MAX;
+}
+
+static int trace_remote_iter_print(struct trace_remote_iterator *iter)
+{
+	unsigned long usecs_rem;
+	u64 ts = iter->ts;
+
+	if (iter->lost_events)
+		trace_seq_printf(&iter->seq, "CPU:%d [LOST %lu EVENTS]\n",
+				 iter->evt_cpu, iter->lost_events);
+
+	do_div(ts, 1000);
+	usecs_rem = do_div(ts, USEC_PER_SEC);
+
+	trace_seq_printf(&iter->seq, "[%03d]\t%5llu.%06lu: ", iter->evt_cpu,
+			 ts, usecs_rem);
+
+	return trace_seq_has_overflowed(&iter->seq) ? -EOVERFLOW : 0;
+}
+
+static int trace_pipe_open(struct inode *inode, struct file *filp)
+{
+	struct trace_remote *remote = inode->i_private;
+	struct trace_remote_iterator *iter;
+	int cpu = RING_BUFFER_ALL_CPUS;
+
+	if (inode->i_cdev)
+		cpu = (long)inode->i_cdev - 1;
+
+	guard(mutex)(&remote->lock);
+	iter = trace_remote_iter(remote, cpu);
+	filp->private_data = iter;
+
+	return IS_ERR(iter) ? PTR_ERR(iter) : 0;
+}
+
+static int trace_pipe_release(struct inode *inode, struct file *filp)
+{
+	struct trace_remote_iterator *iter = filp->private_data;
+	struct trace_remote *remote = iter->remote;
+
+	guard(mutex)(&remote->lock);
+
+	cancel_delayed_work_sync(&iter->poll_work);
+	remote->nr_readers--;
+	trace_remote_try_unload(remote);
+	kfree(iter);
+
+	return 0;
+}
+
+static ssize_t trace_pipe_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct trace_remote_iterator *iter = filp->private_data;
+	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
+	int ret;
+
+copy_to_user:
+	ret = trace_seq_to_user(&iter->seq, ubuf, cnt);
+	if (ret != -EBUSY)
+		return ret;
+
+	trace_seq_init(&iter->seq);
+
+	ret = ring_buffer_wait(trace_buffer, iter->cpu, 0, NULL, NULL);
+	if (ret < 0)
+		return ret;
+
+	while (trace_remote_iter_next(iter)) {
+		int prev_len = iter->seq.seq.len;
+
+		if (trace_remote_iter_print(iter)) {
+			iter->seq.seq.len = prev_len;
+			break;
+		}
+
+		ring_buffer_consume(trace_buffer, iter->evt_cpu, NULL, NULL);
+	}
+
+	goto copy_to_user;
+}
+
+static const struct file_operations trace_pipe_fops = {
+	.open		= trace_pipe_open,
+	.read		= trace_pipe_read,
+	.release	= trace_pipe_release,
+};
+
+static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
+{
+	struct dentry *remote_d, *percpu_d;
+	static struct dentry *root;
+	static DEFINE_MUTEX(lock);
+	bool root_inited = false;
+	int cpu;
+
+	guard(mutex)(&lock);
+
+	if (!root) {
+		root = tracefs_create_dir(TRACEFS_DIR, NULL);
+		if (!root) {
+			pr_err("Failed to create tracefs dir "TRACEFS_DIR"\n");
+			goto err;
+		}
+		root_inited = true;
+	}
+
+	remote_d = tracefs_create_dir(name, root);
+	if (!remote_d) {
+		pr_err("Failed to create tracefs dir "TRACEFS_DIR"%s/\n", name);
+		goto err;
+	}
+
+	if (!trace_create_file("tracing_on", TRACEFS_MODE_WRITE, remote_d, remote,
+			       &tracing_on_fops) ||
+	    !trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
+			       &buffer_size_kb_fops) ||
+	    !trace_create_file("trace_pipe", TRACEFS_MODE_READ, remote_d, remote,
+			       &trace_pipe_fops))
+		goto err;
+
+	percpu_d = tracefs_create_dir("per_cpu", remote_d);
+	if (!percpu_d) {
+		pr_err("Failed to create tracefs dir "TRACEFS_DIR"%s/per_cpu/\n", name);
+		goto err;
+	}
+
+	for_each_possible_cpu(cpu) {
+		struct dentry *cpu_d;
+		char cpu_name[16];
+
+		snprintf(cpu_name, sizeof(cpu_name), "cpu%d", cpu);
+		cpu_d = tracefs_create_dir(cpu_name, percpu_d);
+		if (!cpu_d) {
+			pr_err("Failed to create tracefs dir "TRACEFS_DIR"%s/percpu/cpu%d\n",
+			       name, cpu);
+			goto err;
+		}
+
+		if (!trace_create_cpu_file("trace_pipe", TRACEFS_MODE_READ, cpu_d, remote, cpu,
+					   &trace_pipe_fops))
+			goto err;
+	}
+
+	return 0;
+
+err:
+	if (root_inited) {
+		tracefs_remove(root);
+		root = NULL;
+	} else {
+		tracefs_remove(remote_d);
+	}
+
+	return -ENOMEM;
+}
+
+int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
+{
+	struct trace_remote *remote;
+
+	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
+	if (!remote)
+		return -ENOMEM;
+
+	remote->cbs = cbs;
+	remote->priv = priv;
+	remote->trace_buffer_size = 7 << 10;
+	remote->poll_ms = 100;
+	mutex_init(&remote->lock);
+
+	if (trace_remote_init_tracefs(name, remote)) {
+		kfree(remote);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+void trace_remote_free_buffer(struct trace_buffer_desc *desc)
+{
+	struct ring_buffer_desc *rb_desc;
+	int cpu;
+
+	for_each_ring_buffer_desc(rb_desc, cpu, desc) {
+		unsigned int id;
+
+		free_page(rb_desc->meta_va);
+
+		for (id = 0; id < rb_desc->nr_page_va; id++)
+			free_page(rb_desc->page_va[id]);
+	}
+}
+
+int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t size,
+			      const struct cpumask *cpumask)
+{
+	int nr_pages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
+	struct ring_buffer_desc *rb_desc;
+	int cpu;
+
+	desc->nr_cpus = 0;
+	desc->struct_len = offsetof(struct trace_buffer_desc, __data);
+
+	rb_desc = (struct ring_buffer_desc *)&desc->__data[0];
+
+	for_each_cpu(cpu, cpumask) {
+		unsigned int id;
+
+		rb_desc->cpu = cpu;
+		rb_desc->nr_page_va = 0;
+		rb_desc->meta_va = (unsigned long)__get_free_page(GFP_KERNEL);
+		if (!rb_desc->meta_va)
+			goto err;
+
+		for (id = 0; id < nr_pages; id++) {
+			rb_desc->page_va[id] = (unsigned long)__get_free_page(GFP_KERNEL);
+			if (!rb_desc->page_va[id])
+				goto err;
+
+			rb_desc->nr_page_va++;
+		}
+		desc->nr_cpus++;
+		desc->struct_len += offsetof(struct ring_buffer_desc, page_va);
+		desc->struct_len += sizeof(rb_desc->page_va[0]) * rb_desc->nr_page_va;
+		rb_desc = __next_ring_buffer_desc(rb_desc);
+	}
+
+	return 0;
+
+err:
+	trace_remote_free_buffer(desc);
+	return -ENOMEM;
+}
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


