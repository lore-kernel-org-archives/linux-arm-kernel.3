Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C93EC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l7sH1g5b7MpFTAKIwgcg969poSDjgkc3BaR0DDvsW0=; b=xLAlZHJVkBZOiFOzROC/R7KjLK
	KQyxUGdbyoj7uJD/HGvt2Mn5YnIr+WMZHvaK9jHfQuFt9jjWv7fUmTELw/LIfVpOOW1NP/IWwTY5S
	LXnJ8htSa9RTeSwecNk5sZp+KnjW4HddHDFt1Ef2ohiOHk6cUirdNcbu+wb4EXOqoiqYkS9EekUuh
	iWxi1SE0dO0NOq5oXJBcnVPNuanxATWi1EVYqOpufAxCm6Hd9MLhAwnMkh8uhHVRFi7IO9OAf5jW8
	w+ZWb22xWwQ0h4Yl7IkB3vwIBdi0A02qc4VhOL0tJGQFEHcLxe/eBkYp48a7WaUsb5F5P3MM2z/sL
	SIZXkQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFver-00000003bcH-0JPK;
	Fri, 16 May 2025 14:03:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJ0-00000003Xpm-3STf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:56 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a0b9bbfb0fso1475189f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402853; x=1748007653; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3l7sH1g5b7MpFTAKIwgcg969poSDjgkc3BaR0DDvsW0=;
        b=IxR6hOp1QDivZqP/37iSHCOs5lb4p6cLu0uj0SzVgYa+TubN5Jr9TkT/lyMXPhdutX
         eD/orkDJp4rM8/bFPFzo8zay3/Cop/si6e+swlnXoscXxh6EWqnnazJ2Du7MGs2dcaWK
         oPnRdt0EWxxScPUrZ0dinZwqopRzXG25/HlCxf6PY4DIwil8lA8W5QJUYcWlLv+fKOaH
         Yb5JLhXMVOXqPXOVqGNOd5VKqbfi18cPmBE1wVnEcQCKCO4d3+NVI7Ok8u+LxWNjBmeR
         6KE5gVB2EG6JQ/ZkoiTKPtUux0A1bKgVDDEUtIcv+3FY7GlEfAikPxHdK/siOble+AZT
         Hd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402853; x=1748007653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3l7sH1g5b7MpFTAKIwgcg969poSDjgkc3BaR0DDvsW0=;
        b=shAsCqdQIr6Ut447rT/OCONKJ5aQPK/27TBYPf4oHncwulLOpDq7xhHHLE7UiQV7XH
         nBif/7jxTyaPpgEOhQi4kKxlvQB0+pgjULIeOwOqrTwlQ1bWiNbnkvrYbHT8Sr4F9x5+
         lkhyReSxMz7zCcmFWcIyR3SGOwaUF7UT4ce4ZfPQcWlKtU/E47iKqGeGloNPCg9gCcmD
         oNX8fnC4y+WK2UE+1P5uuWDGJUSIc0T4TNMPMlIXcBz7YsoRvuSSXGGnF8HvqqC9xD+u
         rO+i77aWUHOYl+5yKIhJGdAYwt+fpuKIY/+b++4fXozQMMQV1guPKK4rmLFOeWjFnn6t
         C2rA==
X-Forwarded-Encrypted: i=1; AJvYcCVCmuhkCy/v6Q154qix1bCpj1YQQ26iHfl95NaOJBtr/6OgIAtWVKNhxDHvA6iU/3CSbS1AWywhThAJiY9lSeWx@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqLPIz+LBWA2nu8H0iNfk1mNWh+xepN/qqOhu7G4Chijt9TBo
	qY860ZpTARMtf+KkY2z1uu40Ik4mudUvFkw3AJC3K3FlfhruDzrk0//MS2UJeOXk6focTxm2qyA
	pOXMEL9A/zTc69ytpzrHoZg==
X-Google-Smtp-Source: AGHT+IHSvXG31EJosFyPI0TXKjX99Gq2NrFMKey/ycQIzUi0T4UYVrMK+GRbmIiPzSgqGaMAJo8P9eavP89YX9yc
X-Received: from wmpz15.prod.google.com ([2002:a05:600c:a0f:b0:442:f984:ed5e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2012:b0:3a0:b58c:dd8 with SMTP id ffacd0b85a97d-3a35c82fa3bmr3176886f8f.30.1747402852922;
 Fri, 16 May 2025 06:40:52 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:16 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-11-vdonnefort@google.com>
Subject: [PATCH v5 10/25] tracing: Introduce simple_ring_buffer
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064054_876681_A5D3E6E7 
X-CRM114-Status: GOOD (  23.83  )
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
index 2fcc86c7fe7e..407cb05cc8a0 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1218,4 +1218,7 @@ source "kernel/trace/rv/Kconfig"
 config TRACE_REMOTE
 	bool
 
+config SIMPLE_RING_BUFFER
+	bool
+
 endif # FTRACE
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index b8204ae93744..cece10b1f97c 100644
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
2.49.0.1101.gccaa498523-goog


