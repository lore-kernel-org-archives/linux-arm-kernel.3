Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A2BE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOo9zOgja+2l50u60KiCznyTRqDNBNRMFYvUi6VCovM=; b=o5Xogkox4vvHPYfX2kaun+sFMP
	weJIAxf1zp6e2ea30M0N0a8H0WQ9+AQ3nqeEMHiQdoPGFF7FB6fLagyrGybXpQlTp8/wZURkbLOgf
	TM1rRhP+07ShowhsOc0HRQnYzo7q1984cPVj2+K7GEtdnCeRTEvMElHIBwfjcrMUM9gd9tMl4K1i1
	GGOAV/ciYriKyoJB0tcdYIGkYn0GwMrwJJfPOLPPwtPfYHamnX7+aOWj4bdPBsw6YPbhH9+TcfKEs
	ZShBE4iNGmh4xD1pqW61K4BS1G6Q2ELFjsv5JxY/+L8zWpJ9RjN+9OHcf6Xs60jBSa0zAQu1iRuoW
	6stUNHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z9-0000000BUyl-3JRZ;
	Thu, 19 Feb 2026 15:03:43 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z0-0000000BUmy-3E2i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:36 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b8f816515b0so92879766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513413; x=1772118213; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zOo9zOgja+2l50u60KiCznyTRqDNBNRMFYvUi6VCovM=;
        b=htZIQWo9dgEdqWK5fd+VUfAxCvpmS30PvPukaltQwAuTmT1awcjvRwnCT235m8xVr5
         WYaQ1iAxfla6UVpw0Aycq4OzuQPy5sbUhHigDDFusBn6zKosvWOJPpuieb7gn0EyZJrt
         GV6Vos5BpV9LZ7Kr4eZi60SNUCtrFKqObF6YPew7AJO34TlGTcZn3yE988K6NptbjRia
         C3EYJ9OF86QsIoHsU0t74q5DCzGrCxXEl7pWwxWxWVPYITHMZ8BR6gmvERtH+zwNU/Oq
         98ztUK7olr3q8y8McXNmmHdARH5cuGmF+5hH2smu+wuZ0FalFifqvCi9EW4uP+T1bPp4
         OHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513413; x=1772118213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOo9zOgja+2l50u60KiCznyTRqDNBNRMFYvUi6VCovM=;
        b=FQOHtc3V33UxghwCNDnCa7VTm268OuguoTvb1ooMRa0Ava16DLMGkYXqBdoy6Vgq3+
         OiFsLbhLBLcTCSQdmJNkDn8UZq3V53qz8P60fN1d4VFLSWAfneTdeaf1zPXk0w/X2BHm
         pgauBwxvOAJwjo4xzO0xRDgogfl4EtbyWeX1KeUlq/vyfICq51HocIi9kxL/iZtOV79J
         IamvQcTDDsFUHJet5Ldnl1vixn1DjSCXu7NQxCTkluzq1eyU/6s0LoQFLJC9KPmG/V6s
         uYP5aiiBNZrrYbPw8Q54Qfbm9teRyKjYu295bKOORnpqXJeKyNunF7WgT8kNqM8ZuO/b
         3IiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXckHd5ty1t8BHFdlSQYNikeNNIJwWlLHSWR7JqFKi1ynrWRfUB5AXNxbZYQRCA8U914L7ywdIw/sgXiPtWw0Zt@lists.infradead.org
X-Gm-Message-State: AOJu0YzUUynZnY7C/IJPEiLPhgBq8j98TiUeNaEcbtqCZnEzOIbCzpwe
	TpEulvmJGZgbw+SCI+gI5wkGQiCDTzv7Ya/3k9JXBmqbUL1ChT+aA/uzoMIazeSIDFN6W/9eI/H
	Jeoivob45pSsbn9NXK9ORCg==
X-Received: from ejah20.prod.google.com ([2002:a17:906:1114:b0:b87:1dc5:b346])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a22:b0:b8f:9237:4933 with SMTP id a640c23a62f3a-b8fc3d3f906mr972674366b.64.1771513412467;
 Thu, 19 Feb 2026 07:03:32 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:50 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-14-vdonnefort@google.com>
Subject: [PATCH v12 13/30] tracing: Introduce simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260219_070334_961869_E9A19913 
X-CRM114-Status: GOOD (  26.52  )
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

Add a simple implementation of the kernel ring-buffer. This intends to
be used later by ring-buffer remotes such as the pKVM hypervisor, hence
the need for a cut down version (write only) without any dependency.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/simple_ring_buffer.h b/include/linux/simple_ring_buffer.h
new file mode 100644
index 000000000000..2c4c0ae336bc
--- /dev/null
+++ b/include/linux/simple_ring_buffer.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_SIMPLE_RING_BUFFER_H
+#define _LINUX_SIMPLE_RING_BUFFER_H
+
+#include <linux/list.h>
+#include <linux/ring_buffer.h>
+#include <linux/ring_buffer_types.h>
+#include <linux/types.h>
+
+/*
+ * Ideally those struct would stay private but the caller needs to know
+ * the allocation size for simple_ring_buffer_init().
+ */
+struct simple_buffer_page {
+	struct list_head	link;
+	struct buffer_data_page	*page;
+	u64			entries;
+	u32			write;
+	u32			id;
+};
+
+struct simple_rb_per_cpu {
+	struct simple_buffer_page	*tail_page;
+	struct simple_buffer_page	*reader_page;
+	struct simple_buffer_page	*head_page;
+	struct simple_buffer_page	*bpages;
+	struct trace_buffer_meta	*meta;
+	u32				nr_pages;
+
+#define SIMPLE_RB_UNAVAILABLE	0
+#define SIMPLE_RB_READY		1
+#define SIMPLE_RB_WRITING	2
+	u32				status;
+
+	u64				last_overrun;
+	u64				write_stamp;
+
+	struct simple_rb_cbs		*cbs;
+};
+
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc);
+
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer);
+
+void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned long length,
+				 u64 timestamp);
+
+void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer);
+
+int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable);
+
+int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
+
+int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
+
+#endif
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 384dd36c8e29..edbdd7b38f61 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1284,4 +1284,7 @@ source "kernel/trace/rv/Kconfig"
 config TRACE_REMOTE
 	bool
 
+config SIMPLE_RING_BUFFER
+	bool
+
 endif # FTRACE
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 318923ce39f5..2e39b09398b3 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -129,4 +129,5 @@ obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 obj-$(CONFIG_RV) += rv/
 
 obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
+obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
 libftrace-y := ftrace.o
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
new file mode 100644
index 000000000000..15df9781411b
--- /dev/null
+++ b/kernel/trace/simple_ring_buffer.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 - Google LLC
+ * Author: Vincent Donnefort <vdonnefort@google.com>
+ */
+
+#include <linux/atomic.h>
+#include <linux/simple_ring_buffer.h>
+
+#include <asm/barrier.h>
+#include <asm/local.h>
+
+enum simple_rb_link_type {
+	SIMPLE_RB_LINK_NORMAL		= 0,
+	SIMPLE_RB_LINK_HEAD		= 1,
+	SIMPLE_RB_LINK_HEAD_MOVING
+};
+
+#define SIMPLE_RB_LINK_MASK ~(SIMPLE_RB_LINK_HEAD | SIMPLE_RB_LINK_HEAD_MOVING)
+
+static void simple_bpage_set_head_link(struct simple_buffer_page *bpage)
+{
+	unsigned long link = (unsigned long)bpage->link.next;
+
+	link &= SIMPLE_RB_LINK_MASK;
+	link |= SIMPLE_RB_LINK_HEAD;
+
+	/*
+	 * Paired with simple_rb_find_head() to order access between the head
+	 * link and overrun. It ensures we always report an up-to-date value
+	 * after swapping the reader page.
+	 */
+	smp_store_release(&bpage->link.next, (struct list_head *)link);
+}
+
+static bool simple_bpage_unset_head_link(struct simple_buffer_page *bpage,
+					 struct simple_buffer_page *dst,
+					 enum simple_rb_link_type new_type)
+{
+	unsigned long *link = (unsigned long *)(&bpage->link.next);
+	unsigned long old = (*link & SIMPLE_RB_LINK_MASK) | SIMPLE_RB_LINK_HEAD;
+	unsigned long new = (unsigned long)(&dst->link) | new_type;
+
+	return try_cmpxchg(link, &old, new);
+}
+
+static void simple_bpage_set_normal_link(struct simple_buffer_page *bpage)
+{
+	unsigned long link = (unsigned long)bpage->link.next;
+
+	WRITE_ONCE(bpage->link.next, (struct list_head *)(link & SIMPLE_RB_LINK_MASK));
+}
+
+static struct simple_buffer_page *simple_bpage_from_link(struct list_head *link)
+{
+	unsigned long ptr = (unsigned long)link & SIMPLE_RB_LINK_MASK;
+
+	return container_of((struct list_head *)ptr, struct simple_buffer_page, link);
+}
+
+static struct simple_buffer_page *simple_bpage_next_page(struct simple_buffer_page *bpage)
+{
+	return simple_bpage_from_link(bpage->link.next);
+}
+
+static void simple_bpage_reset(struct simple_buffer_page *bpage)
+{
+	bpage->write = 0;
+	bpage->entries = 0;
+
+	local_set(&bpage->page->commit, 0);
+}
+
+static void simple_bpage_init(struct simple_buffer_page *bpage, unsigned long page)
+{
+	INIT_LIST_HEAD(&bpage->link);
+	bpage->page = (struct buffer_data_page *)page;
+
+	simple_bpage_reset(bpage);
+}
+
+#define simple_rb_meta_inc(__meta, __inc)		\
+	WRITE_ONCE((__meta), (__meta + __inc))
+
+static bool simple_rb_loaded(struct simple_rb_per_cpu *cpu_buffer)
+{
+	return !!cpu_buffer->bpages;
+}
+
+static int simple_rb_find_head(struct simple_rb_per_cpu *cpu_buffer)
+{
+	int retry = cpu_buffer->nr_pages * 2;
+	struct simple_buffer_page *head;
+
+	head = cpu_buffer->head_page;
+
+	while (retry--) {
+		unsigned long link;
+
+spin:
+		/* See smp_store_release in simple_bpage_set_head_link() */
+		link = (unsigned long)smp_load_acquire(&head->link.prev->next);
+
+		switch (link & ~SIMPLE_RB_LINK_MASK) {
+		/* Found the head */
+		case SIMPLE_RB_LINK_HEAD:
+			cpu_buffer->head_page = head;
+			return 0;
+		/* The writer caught the head, we can spin, that won't be long */
+		case SIMPLE_RB_LINK_HEAD_MOVING:
+			goto spin;
+		}
+
+		head = simple_bpage_next_page(head);
+	}
+
+	return -EBUSY;
+}
+
+/**
+ * simple_ring_buffer_swap_reader_page - Swap ring-buffer head with the reader
+ * @cpu_buffer: A simple_rb_per_cpu
+ *
+ * This function enables consuming reading. It ensures the current head page will not be overwritten
+ * and can be safely read.
+ *
+ * Returns 0 on success, -ENODEV if @cpu_buffer was unloaded or -EBUSY if we failed to catch the
+ * head page.
+ */
+int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer)
+{
+	struct simple_buffer_page *last, *head, *reader;
+	unsigned long overrun;
+	int retry = 8;
+	int ret;
+
+	if (!simple_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	reader = cpu_buffer->reader_page;
+
+	do {
+		/* Run after the writer to find the head */
+		ret = simple_rb_find_head(cpu_buffer);
+		if (ret)
+			return ret;
+
+		head = cpu_buffer->head_page;
+
+		/* Connect the reader page around the header page */
+		reader->link.next = head->link.next;
+		reader->link.prev = head->link.prev;
+
+		/* The last page before the head */
+		last = simple_bpage_from_link(head->link.prev);
+
+		/* The reader page points to the new header page */
+		simple_bpage_set_head_link(reader);
+
+		overrun = cpu_buffer->meta->overrun;
+	} while (!simple_bpage_unset_head_link(last, reader, SIMPLE_RB_LINK_NORMAL) && retry--);
+
+	if (!retry)
+		return -EINVAL;
+
+	cpu_buffer->head_page = simple_bpage_from_link(reader->link.next);
+	cpu_buffer->head_page->link.prev = &reader->link;
+	cpu_buffer->reader_page = head;
+	cpu_buffer->meta->reader.lost_events = overrun - cpu_buffer->last_overrun;
+	cpu_buffer->meta->reader.id = cpu_buffer->reader_page->id;
+	cpu_buffer->last_overrun = overrun;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_swap_reader_page);
+
+static struct simple_buffer_page *simple_rb_move_tail(struct simple_rb_per_cpu *cpu_buffer)
+{
+	struct simple_buffer_page *tail, *new_tail;
+
+	tail = cpu_buffer->tail_page;
+	new_tail = simple_bpage_next_page(tail);
+
+	if (simple_bpage_unset_head_link(tail, new_tail, SIMPLE_RB_LINK_HEAD_MOVING)) {
+		/*
+		 * Oh no! we've caught the head. There is none anymore and
+		 * swap_reader will spin until we set the new one. Overrun must
+		 * be written first, to make sure we report the correct number
+		 * of lost events.
+		 */
+		simple_rb_meta_inc(cpu_buffer->meta->overrun, new_tail->entries);
+		simple_rb_meta_inc(cpu_buffer->meta->pages_lost, 1);
+
+		simple_bpage_set_head_link(new_tail);
+		simple_bpage_set_normal_link(tail);
+	}
+
+	simple_bpage_reset(new_tail);
+	cpu_buffer->tail_page = new_tail;
+
+	simple_rb_meta_inc(cpu_buffer->meta->pages_touched, 1);
+
+	return new_tail;
+}
+
+static unsigned long rb_event_size(unsigned long length)
+{
+	struct ring_buffer_event *event;
+
+	return length + RB_EVNT_HDR_SIZE + sizeof(event->array[0]);
+}
+
+static struct ring_buffer_event *
+rb_event_add_ts_extend(struct ring_buffer_event *event, u64 delta)
+{
+	event->type_len = RINGBUF_TYPE_TIME_EXTEND;
+	event->time_delta = delta & TS_MASK;
+	event->array[0] = delta >> TS_SHIFT;
+
+	return (struct ring_buffer_event *)((unsigned long)event + 8);
+}
+
+static struct ring_buffer_event *
+simple_rb_reserve_next(struct simple_rb_per_cpu *cpu_buffer, unsigned long length, u64 timestamp)
+{
+	unsigned long ts_ext_size = 0, event_size = rb_event_size(length);
+	struct simple_buffer_page *tail = cpu_buffer->tail_page;
+	struct ring_buffer_event *event;
+	u32 write, prev_write;
+	u64 time_delta;
+
+	time_delta = timestamp - cpu_buffer->write_stamp;
+
+	if (test_time_stamp(time_delta))
+		ts_ext_size = 8;
+
+	prev_write = tail->write;
+	write = prev_write + event_size + ts_ext_size;
+
+	if (unlikely(write > (PAGE_SIZE - BUF_PAGE_HDR_SIZE)))
+		tail = simple_rb_move_tail(cpu_buffer);
+
+	if (!tail->entries) {
+		tail->page->time_stamp = timestamp;
+		time_delta = 0;
+		ts_ext_size = 0;
+		write = event_size;
+		prev_write = 0;
+	}
+
+	tail->write = write;
+	tail->entries++;
+
+	cpu_buffer->write_stamp = timestamp;
+
+	event = (struct ring_buffer_event *)(tail->page->data + prev_write);
+	if (ts_ext_size) {
+		event = rb_event_add_ts_extend(event, time_delta);
+		time_delta = 0;
+	}
+
+	event->type_len = 0;
+	event->time_delta = time_delta;
+	event->array[0] = event_size - RB_EVNT_HDR_SIZE;
+
+	return event;
+}
+
+/**
+ * simple_ring_buffer_reserve - Reserve an entry in @cpu_buffer
+ * @cpu_buffer:	A simple_rb_per_cpu
+ * @length:	Size of the entry in bytes
+ * @timestamp:	Timestamp of the entry
+ *
+ * Returns the address of the entry where to write data or NULL
+ */
+void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned long length,
+				 u64 timestamp)
+{
+	struct ring_buffer_event *rb_event;
+
+	if (cmpxchg(&cpu_buffer->status, SIMPLE_RB_READY, SIMPLE_RB_WRITING) != SIMPLE_RB_READY)
+		return NULL;
+
+	rb_event = simple_rb_reserve_next(cpu_buffer, length, timestamp);
+
+	return &rb_event->array[1];
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_reserve);
+
+/**
+ * simple_ring_buffer_commit - Commit the entry reserved with simple_ring_buffer_reserve()
+ * @cpu_buffer:	The simple_rb_per_cpu where the entry has been reserved
+ */
+void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer)
+{
+	local_set(&cpu_buffer->tail_page->page->commit,
+		  cpu_buffer->tail_page->write);
+	simple_rb_meta_inc(cpu_buffer->meta->entries, 1);
+
+	/*
+	 * Paired with simple_rb_enable_tracing() to ensure data is
+	 * written to the ring-buffer before teardown.
+	 */
+	smp_store_release(&cpu_buffer->status, SIMPLE_RB_READY);
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_commit);
+
+static u32 simple_rb_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
+{
+	u32 prev_status;
+
+	if (enable)
+		return cmpxchg(&cpu_buffer->status, SIMPLE_RB_UNAVAILABLE, SIMPLE_RB_READY);
+
+	/* Wait for the buffer to be released */
+	do {
+		prev_status = cmpxchg_acquire(&cpu_buffer->status,
+					      SIMPLE_RB_READY,
+					      SIMPLE_RB_UNAVAILABLE);
+	} while (prev_status == SIMPLE_RB_WRITING);
+
+	return prev_status;
+}
+
+/**
+ * simple_ring_buffer_reset - Reset @cpu_buffer
+ * @cpu_buffer: A simple_rb_per_cpu
+ *
+ * This will not clear the content of the data, only reset counters and pointers
+ *
+ * Returns 0 on success or -ENODEV if @cpu_buffer was unloaded.
+ */
+int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
+{
+	struct simple_buffer_page *bpage;
+	u32 prev_status;
+	int ret;
+
+	if (!simple_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	prev_status = simple_rb_enable_tracing(cpu_buffer, false);
+
+	ret = simple_rb_find_head(cpu_buffer);
+	if (ret)
+		return ret;
+
+	bpage = cpu_buffer->tail_page = cpu_buffer->head_page;
+	do {
+		simple_bpage_reset(bpage);
+		bpage = simple_bpage_next_page(bpage);
+	} while (bpage != cpu_buffer->head_page);
+
+	simple_bpage_reset(cpu_buffer->reader_page);
+
+	cpu_buffer->last_overrun = 0;
+	cpu_buffer->write_stamp = 0;
+
+	cpu_buffer->meta->reader.read = 0;
+	cpu_buffer->meta->reader.lost_events = 0;
+	cpu_buffer->meta->entries = 0;
+	cpu_buffer->meta->overrun = 0;
+	cpu_buffer->meta->read = 0;
+	cpu_buffer->meta->pages_lost = 0;
+	cpu_buffer->meta->pages_touched = 0;
+
+	if (prev_status == SIMPLE_RB_READY)
+		simple_rb_enable_tracing(cpu_buffer, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_reset);
+
+/**
+ * simple_ring_buffer_init - Init @cpu_buffer based on @desc
+ * @cpu_buffer:	A simple_rb_per_cpu buffer to init, allocated by the caller.
+ * @bpages:	Array of simple_buffer_pages, with as many elements as @desc->nr_page_va
+ * @desc:	A ring_buffer_desc
+ *
+ * Returns 0 on success or -EINVAL if the content of @desc is invalid
+ */
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc)
+{
+	struct simple_buffer_page *bpage = bpages;
+	int i;
+
+	/* At least 1 reader page and two pages in the ring-buffer */
+	if (desc->nr_page_va < 3)
+		return -EINVAL;
+
+	memset(cpu_buffer, 0, sizeof(*cpu_buffer));
+
+	cpu_buffer->bpages = bpages;
+
+	cpu_buffer->meta = (void *)desc->meta_va;
+	memset(cpu_buffer->meta, 0, sizeof(*cpu_buffer->meta));
+	cpu_buffer->meta->meta_page_size = PAGE_SIZE;
+	cpu_buffer->meta->nr_subbufs = cpu_buffer->nr_pages;
+
+	/* The reader page is not part of the ring initially */
+	simple_bpage_init(bpage, desc->page_va[0]);
+	bpage->id = 0;
+
+	cpu_buffer->nr_pages = 1;
+
+	cpu_buffer->reader_page = bpage;
+	cpu_buffer->tail_page = bpage + 1;
+	cpu_buffer->head_page = bpage + 1;
+
+	for (i = 1; i < desc->nr_page_va; i++) {
+		simple_bpage_init(++bpage, desc->page_va[i]);
+
+		bpage->link.next = &(bpage + 1)->link;
+		bpage->link.prev = &(bpage - 1)->link;
+		bpage->id = i;
+
+		cpu_buffer->nr_pages = i + 1;
+	}
+
+	/* Close the ring */
+	bpage->link.next = &cpu_buffer->tail_page->link;
+	cpu_buffer->tail_page->link.prev = &bpage->link;
+
+	/* The last init'ed page points to the head page */
+	simple_bpage_set_head_link(bpage);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_init);
+
+/**
+ * simple_ring_buffer_unload - Prepare @cpu_buffer for deletion
+ * @cpu_buffer:	A simple_rb_per_cpu that will be deleted.
+ */
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	if (!simple_rb_loaded(cpu_buffer))
+		return;
+
+	simple_rb_enable_tracing(cpu_buffer, false);
+
+	cpu_buffer->bpages = NULL;
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
+
+/**
+ * simple_ring_buffer_enable_tracing - Enable or disable writing to @cpu_buffer
+ * @cpu_buffer: A simple_rb_per_cpu
+ * @enable:	True to enable tracing, False to disable it
+ *
+ * Returns 0 on success or -ENODEV if @cpu_buffer was unloaded
+ */
+int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
+{
+	if (!simple_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	simple_rb_enable_tracing(cpu_buffer, enable);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_enable_tracing);
-- 
2.53.0.335.g19a08e0c02-goog


