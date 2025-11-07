Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D41CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rgw5xcElE8xbfMxk4XfNC90+k3Bbs57tvUPtv7wwrm4=; b=SC2u0Lbi6MABoL1or7q69XZ9Tj
	wrY2MoJdKReTMaA3htvWVWSKdrYGb+kKVTlucSvocmADBtQkEfXpLzWEIPwu8E/FQnLwYv2e1FxhT
	JmNsJnnXAWbso/3IoQ+y2lCjcihvrkC+GuKJoEqg2wizD8qjgs6aEUIdXA4NhanfNenTmJks7pKpG
	NlPgNwNuyj4gDv+3sTLh+Jk+EyYL3vxk7aU/NKk0GtXugCldUcTBiFycFtV6mOZjV8bqxrZlGwftG
	VVRuiEXZrJ5EJOO/M8I8QQostTJKx7+3z6UhzzsKSPacf5L4nYIFEfACyA1S+gRqit+g6qM4rSyWn
	w1NgrR4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwE-0000000GypD-1Kkm;
	Fri, 07 Nov 2025 09:39:22 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvt-0000000GyR0-1hKx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:02 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-475dabb63f2so2588415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508340; x=1763113140; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rgw5xcElE8xbfMxk4XfNC90+k3Bbs57tvUPtv7wwrm4=;
        b=2QP38yPjErKch/P8YLadRdxKdqi2HKGB3QRCZu4xOJ5db7a3a6mGL/O6E7ViRhHnBo
         UITCjjKt9CUK0LiLed4Vjp5QWWyWUx0Lwu2Zfw5kThrKtw9FBGejZ11uAO2nrkVFvxJQ
         43biMKPLCBmlXEOdwYO8lkV8+7OAo22jTdQXvGPVqQ3kjz8fb/QIxCxCD9V3dQcMkyrZ
         xQIahH9QTFZ953axJICtRjTfo38dH6RhPi/oZITD9eSVhLZBz7wvDYTdIUhny93y84ht
         5mYQtxQaOVpL9z/Oonz87vG20onoxI6ovz2bH5qgVQhVJYWH9Kuu/RXE06hp7b+sGzPi
         7k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508340; x=1763113140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rgw5xcElE8xbfMxk4XfNC90+k3Bbs57tvUPtv7wwrm4=;
        b=AsWgHwea162naYzi9zbzGmmfkP5Y9vg6tylYoCQTfslsC0xT+0tFEKJWwrd6iQBTJR
         z0dHbh0hCLEQpczAbdFmUfzOppT+/r85jReYLRNJeURs+ObHJIYriHjmWeAjToMdjJL1
         K8CaogUqAr2wUlGtxaM30xtwlNmCTsBs8lq0GINmkjWkNn5J4y/Hc766SJzA9cnfNdRR
         m/auJD4uJHwVddekmPfvWS+CNZiADpIvPC7DyVdIlvCUbPVMMHVTuE23gXafvjVNoPkg
         aZrKM7S1iCKUx1XIKKrNJvwxgL3Tr5AU27FisnO5PD+8ORB3ttv/TzoynlWQC9oIXk2x
         WqQw==
X-Forwarded-Encrypted: i=1; AJvYcCXFwbyw33C9hVYbEULIhKp93xfqfLT9KlGonOOpEKIyUamdQOcX7QHNCmocr1SKGHqHKDvK7cFrOFsYG7KX+KI7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywte+tlCOzc9IdPuEqPXIhzCs26PLXx1I/e+mv8WRt2m5p1IccK
	pqTjZBeziQJc0QAXjrFSklWFy9MjSxVz3xmNOfeTrY1N9MV5LOPWBQZ7oNZNeXmO3wlxD01VTjU
	rp7RDiLvdR+8BJgpqKBWCKA==
X-Google-Smtp-Source: AGHT+IGzpEKGlvdqnVA4OQ2DzHhBl+PUvu9fL2YcqmScAvttQ6S+PEAeuUHE8+kan3CeRRr5cSqqjY/5fBkD1tZM
X-Received: from wmjq17.prod.google.com ([2002:a7b:ce91:0:b0:477:122d:f740])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6289:b0:477:3543:3a3b with SMTP id 5b1f17b1804b1-4776bcb20a4mr20810655e9.6.1762508339806;
 Fri, 07 Nov 2025 01:38:59 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:24 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-13-vdonnefort@google.com>
Subject: [PATCH v8 12/28] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20251107_013901_485127_CA1A752F 
X-CRM114-Status: GOOD (  14.71  )
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

In preparation for allowing the writing of ring-buffer compliant pages
outside of ring_buffer.c, move buffer_data_page and timestamps encoding
macros into the publicly available ring_buffer_types.h.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/ring_buffer_types.h b/include/linux/ring_buffer_types.h
new file mode 100644
index 000000000000..54577021a49d
--- /dev/null
+++ b/include/linux/ring_buffer_types.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_RING_BUFFER_TYPES_H
+#define _LINUX_RING_BUFFER_TYPES_H
+
+#include <asm/local.h>
+
+#define TS_SHIFT        27
+#define TS_MASK         ((1ULL << TS_SHIFT) - 1)
+#define TS_DELTA_TEST   (~TS_MASK)
+
+/*
+ * We need to fit the time_stamp delta into 27 bits.
+ */
+static inline bool test_time_stamp(u64 delta)
+{
+	return !!(delta & TS_DELTA_TEST);
+}
+
+#define BUF_PAGE_HDR_SIZE offsetof(struct buffer_data_page, data)
+
+#define RB_EVNT_HDR_SIZE (offsetof(struct ring_buffer_event, array))
+#define RB_ALIGNMENT		4U
+#define RB_MAX_SMALL_DATA	(RB_ALIGNMENT * RINGBUF_TYPE_DATA_TYPE_LEN_MAX)
+#define RB_EVNT_MIN_SIZE	8U	/* two 32bit words */
+
+#ifndef CONFIG_HAVE_64BIT_ALIGNED_ACCESS
+# define RB_FORCE_8BYTE_ALIGNMENT	0
+# define RB_ARCH_ALIGNMENT		RB_ALIGNMENT
+#else
+# define RB_FORCE_8BYTE_ALIGNMENT	1
+# define RB_ARCH_ALIGNMENT		8U
+#endif
+
+#define RB_ALIGN_DATA		__aligned(RB_ARCH_ALIGNMENT)
+
+struct buffer_data_page {
+	u64		 time_stamp;	/* page time stamp */
+	local_t		 commit;	/* write committed index */
+	unsigned char	 data[] RB_ALIGN_DATA;	/* data of buffer page */
+};
+#endif
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 41975b92a960..f823d51b7b98 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2008 Steven Rostedt <srostedt@redhat.com>
  */
+#include <linux/ring_buffer_types.h>
 #include <linux/trace_recursion.h>
 #include <linux/trace_events.h>
 #include <linux/ring_buffer.h>
@@ -156,23 +157,6 @@ int ring_buffer_print_entry_header(struct trace_seq *s)
 /* Used for individual buffers (after the counter) */
 #define RB_BUFFER_OFF		(1 << 20)
 
-#define BUF_PAGE_HDR_SIZE offsetof(struct buffer_data_page, data)
-
-#define RB_EVNT_HDR_SIZE (offsetof(struct ring_buffer_event, array))
-#define RB_ALIGNMENT		4U
-#define RB_MAX_SMALL_DATA	(RB_ALIGNMENT * RINGBUF_TYPE_DATA_TYPE_LEN_MAX)
-#define RB_EVNT_MIN_SIZE	8U	/* two 32bit words */
-
-#ifndef CONFIG_HAVE_64BIT_ALIGNED_ACCESS
-# define RB_FORCE_8BYTE_ALIGNMENT	0
-# define RB_ARCH_ALIGNMENT		RB_ALIGNMENT
-#else
-# define RB_FORCE_8BYTE_ALIGNMENT	1
-# define RB_ARCH_ALIGNMENT		8U
-#endif
-
-#define RB_ALIGN_DATA		__aligned(RB_ARCH_ALIGNMENT)
-
 /* define RINGBUF_TYPE_DATA for 'case RINGBUF_TYPE_DATA:' */
 #define RINGBUF_TYPE_DATA 0 ... RINGBUF_TYPE_DATA_TYPE_LEN_MAX
 
@@ -315,10 +299,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
 #define for_each_online_buffer_cpu(buffer, cpu)		\
 	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
 
-#define TS_SHIFT	27
-#define TS_MASK		((1ULL << TS_SHIFT) - 1)
-#define TS_DELTA_TEST	(~TS_MASK)
-
 static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 {
 	u64 ts;
@@ -337,12 +317,6 @@ static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 
 #define RB_MISSED_MASK		(3 << 30)
 
-struct buffer_data_page {
-	u64		 time_stamp;	/* page time stamp */
-	local_t		 commit;	/* write committed index */
-	unsigned char	 data[] RB_ALIGN_DATA;	/* data of buffer page */
-};
-
 struct buffer_data_read_page {
 	unsigned		order;	/* order of the page */
 	struct buffer_data_page	*data;	/* actual data, stored in this page */
@@ -401,14 +375,6 @@ static void free_buffer_page(struct buffer_page *bpage)
 	kfree(bpage);
 }
 
-/*
- * We need to fit the time_stamp delta into 27 bits.
- */
-static inline bool test_time_stamp(u64 delta)
-{
-	return !!(delta & TS_DELTA_TEST);
-}
-
 struct rb_irq_work {
 	struct irq_work			work;
 	wait_queue_head_t		waiters;
-- 
2.51.2.1041.gc1ab5b90ca-goog


