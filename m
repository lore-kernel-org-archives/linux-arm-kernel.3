Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFDDCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24vtXolJgWFlmCc1c2PtYNQB1/b0KRqdJsndd7gSEog=; b=3S6pOzcyyGCZOz770oMUdida6f
	5F1wwGXzbn5RRxmXLDpSgAin1y7VAQSTLfYA870sf5xnf0eux4R3IPYScr6yMOPJN4/IcTgAiIdRl
	ypifFdDv+DmWefGSxjUfv7VY2mKAPl8F9OKW0JECKYVAYGAU21G8oWTrxQunPhiplDJbA/97UXRF+
	UYOh1eXLViMqbRTz6dJD2Gr9NMMJab6CtgPL47PtdDnaHgM6P0//K/AzJzHBomTJgDPtwEJ1J8W6Z
	vpMD9jH4FvVQxmSIxOGFpO8VHUaS5gDfKJc+PBN4OjqMJDn4JKZLBC3daDesNUABwUepjETRmQViF
	qI9iuehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1rO-0000000GUzz-2HaS;
	Thu, 21 Aug 2025 09:45:30 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RR-0000000GCgM-2TIr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0cfbafso4016565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764076; x=1756368876; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=24vtXolJgWFlmCc1c2PtYNQB1/b0KRqdJsndd7gSEog=;
        b=C+JHWypsNqoOzQaKhG/Au6G/J6pmpadq6ClBGJ32SmEfJBfZTvGWcXuQnWMRrMcfOc
         9Gw2EjhXrl/vfLhT3wHR1LufM0PIEwWuYr5xQ/AuXAo7S3OC/UCzkGjnP5PrmvDGPH1a
         P7a254wtSO7ymIG/zNH+R0rhjxbZ+qCB9cxRwFtJE6xlm4L4c1m352SkmagzabMMKHG7
         0q28Zd0B8eTFbr4xL2+ofo8jOUfa38c4YyZLlODtBDnilxFDp/RGoCeQrESj4z5dpqPn
         mxf1NyiWfRhXe4FWF23TppEdfBhwy299rjqeC05ZqKx9gv6eC15xRVdPUieMGyfusDGj
         P+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764076; x=1756368876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24vtXolJgWFlmCc1c2PtYNQB1/b0KRqdJsndd7gSEog=;
        b=k5cqG2KJlmY9Ad1mj8qZegiTx3RRp9WKFb6WtdKOUuQeSuqfpmLJ5VyDjHlHHCEMij
         KmoX8lDSaxJPFINP5RHfMwgYYwToVgq7RxkA5oLi5WUC2pS0+LXD6GiR4S4BlO2yKjTI
         mKiGqmQWKYnxikW5Q07pTVMRJowRZL+BPw+thF3YVYCc0NX7RfBr1bDH5dU9w6cpxGU2
         qXOs00Ln1Xks/fh/Gp9zsv8WKpdXtspE+gDlVOiuXh2wafZGoGshnydWpQ6tWx0Mlitx
         HNRh00ch44YywiYr0LYVPVpSoiD9/aZ4GYfYnc79R+xs0ckq61S1Nlu1GLXRv5JsKFv3
         oSOA==
X-Forwarded-Encrypted: i=1; AJvYcCUvasWbjBv2hwcRQcbhGL5Jj/mgp8Jng/6MyIGakdXv95La6tQGMtz8T72zJ8vwAKMszKSXXTwSxV9uXf/0Gmkn@lists.infradead.org
X-Gm-Message-State: AOJu0YzJnvVZQiEDbMyCeUjIkIyXqNx2DkY9QPZb7nfRXSKUZN5LHiLN
	NcbG8OPQvALkxtQpBYSGyJQU+bXSrute9iguWZ4s8155eZbiqz2odZyT4sw263cykhVoVrlkbFO
	Qh6nWVX71JEnCzPuae4SGqQ==
X-Google-Smtp-Source: AGHT+IHAfe25Nzx29A/y2LL6JJzOD7A+0ndWQGxZWD3Px5TYNBB/VZ64SUhiRwSLkKQTuJ5qsZUG1SQClaOlNRTi
X-Received: from wmnn26-n2.prod.google.com ([2002:a05:600d:15a:20b0:459:d639:5949])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b4b:b0:45b:47e1:f5ff with SMTP id 5b1f17b1804b1-45b4d85e112mr9547115e9.35.1755764075850;
 Thu, 21 Aug 2025 01:14:35 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:58 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-11-vdonnefort@google.com>
Subject: [PATCH v6 10/24] tracing: Introduce simple_ring_buffer
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
X-CRM114-CacheID: sfid-20250821_011437_632053_33102A68 
X-CRM114-Status: GOOD (  24.45  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/simple_ring_buffer.h b/include/linux/simple_ring_buffer.h
new file mode 100644
index 000000000000..d6761dc2f404
--- /dev/null
+++ b/include/linux/simple_ring_buffer.h
@@ -0,0 +1,50 @@
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
+ * Ideally those struct would stay private but the caller needs to know how big they are to allocate
+ * the memory for simple_ring_buffer_init().
+ */
+struct simple_buffer_page {
+	struct list_head	list;
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
+void *simple_ring_buffer_reserve(struct simple_rb_per_cpu *cpu_buffer, unsigned long length,
+				 u64 timestamp);
+void simple_ring_buffer_commit(struct simple_rb_per_cpu *cpu_buffer);
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer);
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc);
+int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable);
+int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
+int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
+#endif
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 99af56d39eaf..918afcc1fcaf 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1241,4 +1241,7 @@ source "kernel/trace/rv/Kconfig"
 config TRACE_REMOTE
 	bool
 
+config SIMPLE_RING_BUFFER
+	bool
+
 endif # FTRACE
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index 6dab341acc46..03d7d80a9436 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -111,4 +111,5 @@ obj-$(CONFIG_TRACEPOINT_BENCHMARK) += trace_benchmark.o
 obj-$(CONFIG_RV) += rv/
 
 obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
+obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
 libftrace-y := ftrace.o
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
new file mode 100644
index 000000000000..3efdb895d77a
--- /dev/null
+++ b/kernel/trace/simple_ring_buffer.c
@@ -0,0 +1,360 @@
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
+#define SIMPLE_RB_LINK_HEAD	1UL
+#define SIMPLE_RB_LINK_MASK	~SIMPLE_RB_LINK_HEAD
+
+static void simple_bpage_set_head_link(struct simple_buffer_page *bpage)
+{
+	unsigned long link = (unsigned long)bpage->list.next;
+
+	link &= SIMPLE_RB_LINK_MASK;
+	link |= SIMPLE_RB_LINK_HEAD;
+
+	/*
+	 * Paired with simple_bpage_is_head() to order access between the head link and overrun. It
+	 * ensures we always report an up-to-date value after swapping the reader page.
+	 */
+	smp_store_release(&bpage->list.next, (struct list_head *)link);
+}
+
+static bool simple_bpage_is_head(struct simple_buffer_page *bpage)
+{
+	unsigned long link = (unsigned long)smp_load_acquire(&bpage->list.prev->next);
+
+	return link & SIMPLE_RB_LINK_HEAD;
+}
+
+static bool simple_bpage_unset_head_link(struct simple_buffer_page *bpage,
+					 struct simple_buffer_page *dst)
+{
+	unsigned long *link = (unsigned long *)(&bpage->list.next);
+	unsigned long old = (*link & SIMPLE_RB_LINK_MASK) | SIMPLE_RB_LINK_HEAD;
+	unsigned long new = (unsigned long)(&dst->list);
+
+	return try_cmpxchg(link, &old, new);
+}
+
+static struct simple_buffer_page *simple_bpage_from_link(struct list_head *list)
+{
+	unsigned long ptr = (unsigned long)list & SIMPLE_RB_LINK_MASK;
+
+	return container_of((struct list_head *)ptr, struct simple_buffer_page, list);
+}
+
+static struct simple_buffer_page *simple_bpage_next_page(struct simple_buffer_page *bpage)
+{
+	return simple_bpage_from_link(bpage->list.next);
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
+	INIT_LIST_HEAD(&bpage->list);
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
+int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer)
+{
+	struct simple_buffer_page *last, *head, *reader;
+	unsigned long overrun;
+
+	if (!simple_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	head = cpu_buffer->head_page;
+	reader = cpu_buffer->reader_page;
+
+	do {
+		/* Run after the writer to find the head */
+		if (!simple_bpage_is_head(head))
+			head = simple_bpage_next_page(head);
+
+		/* Connect the reader page around the header page */
+		reader->list.next = head->list.next;
+		reader->list.prev = head->list.prev;
+
+		/* The last page before the head */
+		last = simple_bpage_from_link(head->list.prev);
+
+		/* The reader page points to the new header page */
+		simple_bpage_set_head_link(reader);
+
+		overrun = cpu_buffer->meta->overrun;
+	} while (!simple_bpage_unset_head_link(last, reader));
+
+	cpu_buffer->head_page = simple_bpage_from_link(reader->list.next);
+	cpu_buffer->head_page->list.prev = &reader->list;
+	cpu_buffer->reader_page = head;
+	cpu_buffer->meta->reader.lost_events = overrun - cpu_buffer->last_overrun;
+	cpu_buffer->meta->reader.id = cpu_buffer->reader_page->id;
+	cpu_buffer->last_overrun = overrun;
+
+	return 0;
+}
+
+static struct simple_buffer_page *simple_rb_move_tail(struct simple_rb_per_cpu *cpu_buffer)
+{
+	struct simple_buffer_page *tail, *new_tail;
+
+	tail = cpu_buffer->tail_page;
+	new_tail = simple_bpage_next_page(tail);
+
+	if (simple_bpage_unset_head_link(tail, new_tail)) {
+		/*
+		 * Oh no! we've caught the head. There is none anymore and swap_reader will spin
+		 * until we set the new one. Overrun must be written first, to make sure we report
+		 * the correct number of lost events.
+		 */
+		simple_rb_meta_inc(cpu_buffer->meta->overrun, new_tail->entries);
+		simple_rb_meta_inc(cpu_buffer->meta->pages_lost, 1);
+
+		simple_bpage_set_head_link(new_tail);
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
+
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
+int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
+{
+	struct simple_buffer_page *bpage;
+	u32 prev_status;
+
+	if (!simple_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	prev_status = simple_rb_enable_tracing(cpu_buffer, false);
+
+	while (!simple_bpage_is_head(cpu_buffer->head_page))
+		cpu_buffer->head_page = simple_bpage_next_page(cpu_buffer->head_page);
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
+
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc)
+{
+	struct simple_buffer_page *bpage = bpages;
+	int i;
+
+	/* At least 1 reader page and one head */
+	if (desc->nr_page_va < 2)
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
+		bpage->list.next = &(bpage + 1)->list;
+		bpage->list.prev = &(bpage - 1)->list;
+		bpage->id = i;
+
+		cpu_buffer->nr_pages = i + 1;
+	}
+
+	/* Close the ring */
+	bpage->list.next = &cpu_buffer->tail_page->list;
+	cpu_buffer->tail_page->list.prev = &bpage->list;
+
+	/* The last init'ed page points to the head page */
+	simple_bpage_set_head_link(bpage);
+
+	return 0;
+}
+
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	if (!simple_rb_loaded(cpu_buffer))
+		return;
+
+	simple_rb_enable_tracing(cpu_buffer, false);
+
+	cpu_buffer->bpages = 0;
+}
+
+int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
+{
+	if (!simple_rb_loaded(cpu_buffer))
+		return -ENODEV;
+
+	simple_rb_enable_tracing(cpu_buffer, enable);
+
+	return 0;
+}
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


