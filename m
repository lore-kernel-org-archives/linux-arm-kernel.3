Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F18E9A04D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL0TPOU6pA0DbN68Bi4cejGOIyjY/V1Xed0RwQ09VS4=; b=j1o3TCnskNIcNfTggxgGI0v4u5
	p40orVwvu8rebSD7yCYtoDiqSyqN/d/bOrNO4+fY4eFO5XtTuzhkePNLOwHHB3aU2il3wbwjiGlaJ
	jQGSKCLSt4iHHcMrHlRUuCRwbSh7Ajl2Mnbcu5w+mXAo6agEEkldQWfCvJ0kaIA53T03rGpjPesnQ
	E+ToIue6hFhs6h5RYP6j0hLjJZP2G3rbx+QhKm+n0Ztm8ehLnkiQpo3Mm/PUxnuYq/LTAo9n8RVTc
	/nCvcMjcFMMhRtYua0R/Kkk3YbDpWqWwIQ8HkaEG8nr5wXXqkaUJkDV9Hf5dkYf2yBV1vfpbQmI2Z
	SSfIB7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z5-0000000BUrd-0P5y;
	Thu, 19 Feb 2026 15:03:39 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yw-0000000BUhj-41RH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:32 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b8fbf7b70c7so117132866b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513408; x=1772118208; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KL0TPOU6pA0DbN68Bi4cejGOIyjY/V1Xed0RwQ09VS4=;
        b=3c6en63Ca6KmjZ4gZ6yD1l8XXcJzQN2GUN9gyKmMzRMBW/HAjRwTuXfc6cGMr0wwpe
         fnXvdH+KTJOp14LiDHlcMFpLBFAYKpeL4cn9d+NI1nOruOXc1FobVK7l7Ip5AkS+QCH6
         YLLiwfM6MPLoI7jf8QE9LUcKcb73t3w5TPVXXb4avbYqppR/nDzp45xZPfcQBFdDGoN+
         q7kR/RB3P4IoGuTXWEvSOUcRf8SekQCgiWPpRF5zkfuCQ4TrCsz6OVUMtpCJjF5GwXH5
         5W/C5qLpqL8qeBfZv9QoqWPx6LBW7QS2C/cBBLnGwSYr2L34mcmnBGSXqk6EK7ChubAB
         dJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513408; x=1772118208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KL0TPOU6pA0DbN68Bi4cejGOIyjY/V1Xed0RwQ09VS4=;
        b=mdMEn/bwFxsrUa3QZOpJWpYN03xfG6XGrCSm6aWQURw6Ksxk0ofIWid1HnLqpf/VTX
         qgMVgEEmK5N9guivNHy5/E3pRf6Vj8FqUxffgukdX+ui2aR7BzDzFMcGat782OUP+Lw8
         ZIBMxA83LvxxcOhgYD6/ZagYwljF9UX1xDewyX4BDHaaK0Eh0gPadO07iYJDaqldFuAX
         cJ2ZorpQEOW4WDE1nQiUeE1FEhLXzBTtBPVxXuAwDAQMccnWtcrtVxFJkfxfoPvBzROh
         oL93xec8uYGfn90qB4iIdNox6PgZJQuW0QRtbeCqBzjf3SdoT7/nNf03Pqu01H21ny4D
         qCgw==
X-Forwarded-Encrypted: i=1; AJvYcCX71MLI/jqWtndt9YE+yONzveeMK/Cj0BjzPX57LTJKKkNzZ/BftAuR1IoyzXSF7Me/bUbnB70A/NoBGKrFsFqO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0HxJSgTeTlHUzxWhn9I62xJjfIA3J5l0jHvuf1FPGr2UhfcQq
	FN+GijKQiLB7TaIlAeyaaKiq1whTIALfDJj42G+inkRPEu4fqndJaQKCJ4ZZaSG6InybSX6JuCh
	qhxx7cw9estFoycBrKP03vg==
X-Received: from ejef10.prod.google.com ([2002:a17:906:390a:b0:b8f:7abd:6701])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3cd3:b0:b70:b700:df98 with SMTP id a640c23a62f3a-b903da90e2fmr321247366b.5.1771513407792;
 Thu, 19 Feb 2026 07:03:27 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:46 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-10-vdonnefort@google.com>
Subject: [PATCH v12 09/30] tracing: Add events to trace remotes
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
X-CRM114-CacheID: sfid-20260219_070331_104264_D2DB0903 
X-CRM114-Status: GOOD (  26.71  )
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

An event is predefined point in the writer code that allows to log
data. Following the same scheme as kernel events, add remote events,
described to user-space within the events/ tracefs directory found in
the corresponding trace remote.

Remote events are expected to be described during the trace remote
registration.

Add also a .enable_event callback for trace_remote to toggle the event
logging, if supported.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 090c58b7d92b..fcd1d46ea466 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -5,6 +5,7 @@
 
 #include <linux/dcache.h>
 #include <linux/ring_buffer.h>
+#include <linux/trace_remote_event.h>
 
 /**
  * struct trace_remote_callbacks - Callbacks used by Tracefs to control the remote
@@ -23,6 +24,8 @@
  * @reset:		Called on `echo 0 > trace`. It is expected from the
  *			remote to reset all ring-buffer pages.
  *			new reader-page from the @cpu ring-buffer.
+ * @enable_event:	Called on events/event_name/enable. It is expected from
+ *			the remote to allow the writing event @id.
  */
 struct trace_remote_callbacks {
 	int	(*init)(struct dentry *d, void *priv);
@@ -31,9 +34,11 @@ struct trace_remote_callbacks {
 	int	(*enable_tracing)(bool enable, void *priv);
 	int	(*swap_reader_page)(unsigned int cpu, void *priv);
 	int	(*reset)(unsigned int cpu, void *priv);
+	int	(*enable_event)(unsigned short id, bool enable, void *priv);
 };
 
-int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv);
+int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv,
+			  struct remote_event *events, size_t nr_events);
 
 int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size, size_t buffer_size,
 			      const struct cpumask *cpumask);
diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
new file mode 100644
index 000000000000..a4449008a075
--- /dev/null
+++ b/include/linux/trace_remote_event.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_TRACE_REMOTE_EVENTS_H
+#define _LINUX_TRACE_REMOTE_EVENTS_H
+
+struct trace_remote;
+struct trace_event_fields;
+
+struct remote_event_hdr {
+	unsigned short	id;
+};
+
+#define REMOTE_EVENT_NAME_MAX 30
+struct remote_event {
+	char				name[REMOTE_EVENT_NAME_MAX];
+	unsigned short			id;
+	bool				enabled;
+	struct trace_remote		*remote;
+	struct trace_event_fields	*fields;
+	char				*print_fmt;
+	void				(*print)(void *evt, struct trace_seq *seq);
+};
+#endif
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 4e2f9259c814..7dde7143aa20 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -31,6 +31,7 @@ struct trace_remote_iterator {
 	u64				ts;
 	struct ring_buffer_iter		*rb_iter;
 	struct ring_buffer_iter		**rb_iters;
+	struct remote_event_hdr		*evt;
 	int				cpu;
 	int				evt_cpu;
 	loff_t				pos;
@@ -42,6 +43,10 @@ struct trace_remote {
 	void				*priv;
 	struct trace_buffer		*trace_buffer;
 	struct trace_buffer_desc	*trace_buffer_desc;
+	struct dentry			*dentry;
+	struct eventfs_inode		*eventfs;
+	struct remote_event		*events;
+	unsigned long			nr_events;
 	unsigned long			trace_buffer_size;
 	struct ring_buffer_remote	rb_remote;
 	struct mutex			lock;
@@ -168,7 +173,8 @@ static void trace_remote_reset(struct trace_remote *remote, int cpu)
 static ssize_t
 tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
 {
-	struct trace_remote *remote = filp->private_data;
+	struct seq_file *seq = filp->private_data;
+	struct trace_remote *remote = seq->private;
 	unsigned long val;
 	int ret;
 
@@ -197,7 +203,8 @@ DEFINE_SHOW_STORE_ATTRIBUTE(tracing_on);
 static ssize_t buffer_size_kb_write(struct file *filp, const char __user *ubuf, size_t cnt,
 				    loff_t *ppos)
 {
-	struct trace_remote *remote = filp->private_data;
+	struct seq_file *seq = filp->private_data;
+	struct trace_remote *remote = seq->private;
 	unsigned long val;
 	int ret;
 
@@ -484,16 +491,19 @@ __peek_event(struct trace_remote_iterator *iter, int cpu, u64 *ts, unsigned long
 static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 {
 	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
+	struct ring_buffer_event *rb_evt;
 	int cpu = iter->cpu;
 
 	if (cpu != RING_BUFFER_ALL_CPUS) {
 		if (ring_buffer_empty_cpu(trace_buffer, cpu))
 			return false;
 
-		if (!__peek_event(iter, cpu, &iter->ts, &iter->lost_events))
+		rb_evt = __peek_event(iter, cpu, &iter->ts, &iter->lost_events);
+		if (!rb_evt)
 			return false;
 
 		iter->evt_cpu = cpu;
+		iter->evt = ring_buffer_event_data(rb_evt);
 		return true;
 	}
 
@@ -505,7 +515,8 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 		if (ring_buffer_empty_cpu(trace_buffer, cpu))
 			continue;
 
-		if (!__peek_event(iter, cpu, &ts, &lost_events))
+		rb_evt = __peek_event(iter, cpu, &ts, &lost_events);
+		if (!rb_evt)
 			continue;
 
 		if (ts >= iter->ts)
@@ -513,6 +524,7 @@ static bool trace_remote_iter_read_event(struct trace_remote_iterator *iter)
 
 		iter->ts = ts;
 		iter->evt_cpu = cpu;
+		iter->evt = ring_buffer_event_data(rb_evt);
 		iter->lost_events = lost_events;
 	}
 
@@ -533,8 +545,11 @@ static void trace_remote_iter_move(struct trace_remote_iterator *iter)
 	}
 }
 
+static struct remote_event *trace_remote_find_event(struct trace_remote *remote, unsigned short id);
+
 static int trace_remote_iter_print_event(struct trace_remote_iterator *iter)
 {
+	struct remote_event *evt;
 	unsigned long usecs_rem;
 	u64 ts = iter->ts;
 
@@ -548,6 +563,12 @@ static int trace_remote_iter_print_event(struct trace_remote_iterator *iter)
 	trace_seq_printf(&iter->seq, "[%03d]\t%5llu.%06lu: ", iter->evt_cpu,
 			 ts, usecs_rem);
 
+	evt = trace_remote_find_event(iter->remote, iter->evt->id);
+	if (!evt)
+		trace_seq_printf(&iter->seq, "UNKNOWN id=%d\n", iter->evt->id);
+	else
+		evt->print(iter->evt, &iter->seq);
+
 	return trace_seq_has_overflowed(&iter->seq) ? -EOVERFLOW : 0;
 }
 
@@ -829,6 +850,8 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 			goto err;
 	}
 
+	remote->dentry = remote_d;
+
 	return 0;
 
 err:
@@ -842,6 +865,9 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	return -ENOMEM;
 }
 
+static int trace_remote_register_events(const char *remote_name, struct trace_remote *remote,
+					struct remote_event *events, size_t nr_events);
+
 /**
  * trace_remote_register() - Register a Tracefs remote
  * @name:	Name of the remote, used for the Tracefs remotes/ directory.
@@ -860,7 +886,8 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
  *
  * Return: 0 on success, negative error code on failure.
  */
-int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
+int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv,
+			  struct remote_event *events, size_t nr_events)
 {
 	struct trace_remote *remote;
 	int ret;
@@ -881,6 +908,13 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
+	ret = trace_remote_register_events(name, remote, events, nr_events);
+	if (ret) {
+		pr_err("Failed to register events for trace remote '%s' (%d)\n",
+		       name, ret);
+		return ret;
+	}
+
 	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
 	if (ret)
 		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
@@ -976,3 +1010,223 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(trace_remote_alloc_buffer);
+
+static int
+trace_remote_enable_event(struct trace_remote *remote, struct remote_event *evt, bool enable)
+{
+	int ret;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (evt->enabled == enable)
+		return 0;
+
+	ret = remote->cbs->enable_event(evt->id, enable, remote->priv);
+	if (ret)
+		return ret;
+
+	evt->enabled = enable;
+
+	return 0;
+}
+
+static int remote_event_enable_show(struct seq_file *s, void *unused)
+{
+	struct remote_event *evt = s->private;
+
+	seq_printf(s, "%d\n", evt->enabled);
+
+	return 0;
+}
+
+static ssize_t remote_event_enable_write(struct file *filp, const char __user *ubuf,
+					 size_t count, loff_t *ppos)
+{
+	struct seq_file *seq = filp->private_data;
+	struct remote_event *evt = seq->private;
+	struct trace_remote *remote = evt->remote;
+	u8 enable;
+	int ret;
+
+	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&remote->lock);
+
+	ret = trace_remote_enable_event(remote, evt, enable);
+	if (ret)
+		return ret;
+
+	return count;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(remote_event_enable);
+
+static int remote_event_id_show(struct seq_file *s, void *unused)
+{
+	struct remote_event *evt = s->private;
+
+	seq_printf(s, "%d\n", evt->id);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(remote_event_id);
+
+static int remote_event_format_show(struct seq_file *s, void *unused)
+{
+	size_t offset = sizeof(struct remote_event_hdr);
+	struct remote_event *evt = s->private;
+	struct trace_event_fields *field;
+
+	seq_printf(s, "name: %s\n", evt->name);
+	seq_printf(s, "ID: %d\n", evt->id);
+	seq_puts(s,
+		 "format:\n\tfield:unsigned short common_type;\toffset:0;\tsize:2;\tsigned:0;\n\n");
+
+	field = &evt->fields[0];
+	while (field->name) {
+		seq_printf(s, "\tfield:%s %s;\toffset:%zu;\tsize:%u;\tsigned:%d;\n",
+			   field->type, field->name, offset, field->size,
+			   field->is_signed);
+		offset += field->size;
+		field++;
+	}
+
+	if (field != &evt->fields[0])
+		seq_puts(s, "\n");
+
+	seq_printf(s, "print fmt: %s\n", evt->print_fmt);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(remote_event_format);
+
+static int remote_event_callback(const char *name, umode_t *mode, void **data,
+				 const struct file_operations **fops)
+{
+	if (!strcmp(name, "enable")) {
+		*mode = TRACEFS_MODE_WRITE;
+		*fops = &remote_event_enable_fops;
+		return 1;
+	}
+
+	if (!strcmp(name, "id")) {
+		*mode = TRACEFS_MODE_READ;
+		*fops = &remote_event_id_fops;
+		return 1;
+	}
+
+	if (!strcmp(name, "format")) {
+		*mode = TRACEFS_MODE_READ;
+		*fops = &remote_event_format_fops;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int trace_remote_init_eventfs(const char *remote_name, struct trace_remote *remote,
+				     struct remote_event *evt)
+{
+	struct eventfs_inode *eventfs = remote->eventfs;
+	static struct eventfs_entry entries[] = {
+		{
+			.name		= "enable",
+			.callback	= remote_event_callback,
+		}, {
+			.name		= "id",
+			.callback	= remote_event_callback,
+		}, {
+			.name		= "format",
+			.callback	= remote_event_callback,
+		}
+	};
+	bool eventfs_create = false;
+
+	if (!eventfs) {
+		eventfs = eventfs_create_events_dir("events", remote->dentry, NULL, 0, NULL);
+		if (IS_ERR(eventfs))
+			return PTR_ERR(eventfs);
+
+		/*
+		 * Create similar hierarchy as local events even if a single system is supported at
+		 * the moment
+		 */
+		eventfs = eventfs_create_dir(remote_name, eventfs, NULL, 0, NULL);
+		if (IS_ERR(eventfs))
+			return PTR_ERR(eventfs);
+
+		remote->eventfs = eventfs;
+		eventfs_create = true;
+	}
+
+	eventfs = eventfs_create_dir(evt->name, eventfs, entries, ARRAY_SIZE(entries), evt);
+	if (IS_ERR(eventfs)) {
+		if (eventfs_create) {
+			eventfs_remove_events_dir(remote->eventfs);
+			remote->eventfs = NULL;
+		}
+		return PTR_ERR(eventfs);
+	}
+
+	return 0;
+}
+
+static int trace_remote_attach_events(struct trace_remote *remote, struct remote_event *events,
+				      size_t nr_events)
+{
+	int i;
+
+	for (i = 0; i < nr_events; i++) {
+		struct remote_event *evt = &events[i];
+
+		if (evt->remote)
+			return -EEXIST;
+
+		evt->remote = remote;
+
+		/* We need events to be sorted for efficient lookup */
+		if (i && evt->id <= events[i - 1].id)
+			return -EINVAL;
+	}
+
+	remote->events = events;
+	remote->nr_events = nr_events;
+
+	return 0;
+}
+
+static int trace_remote_register_events(const char *remote_name, struct trace_remote *remote,
+					struct remote_event *events, size_t nr_events)
+{
+	int i, ret;
+
+	ret = trace_remote_attach_events(remote, events, nr_events);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_events; i++) {
+		struct remote_event *evt = &events[i];
+
+		ret = trace_remote_init_eventfs(remote_name, remote, evt);
+		if (ret)
+			pr_warn("Failed to init eventfs for event '%s' (%d)",
+				evt->name, ret);
+	}
+
+	return 0;
+}
+
+static int __cmp_events(const void *key, const void *data)
+{
+	const struct remote_event *evt = data;
+	int id = (int)((long)key);
+
+	return id - (int)evt->id;
+}
+
+static struct remote_event *trace_remote_find_event(struct trace_remote *remote, unsigned short id)
+{
+	return bsearch((const void *)(unsigned long)id, remote->events, remote->nr_events,
+		       sizeof(*remote->events), __cmp_events);
+}
-- 
2.53.0.335.g19a08e0c02-goog


