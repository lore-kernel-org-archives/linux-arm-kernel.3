Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9305EF4180F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1WvucEqcVYrADrijLBtCoRpo6zZxMCkzMNXu+AcfQA=; b=J6hHI5MKrd376CbAagBinJRrTd
	mAanNUcTallt7yUL7J0bGU7cDQDUyWGEfXTKmgf43gMElsOxz28HE+4bw8K902jU//RNFgzE9vpfw
	H4BamV38OGjK/wGJekotrx4ekxqjWzay/m9PTr+ZPaL1S9u03VPeWnj0uEA/a3nyVKjPdgqmZws29
	g1cXqY1EH1BZfl7uOWLG2m4y5MDuksvao4wUf77QYFeRfuAsS0qyDc66fMSRET42d7jADnBzPCgvA
	cFgzU5K0Ffr2+q119A7hitFxlzM7+OIUWPwgbnLvIZ4wcr7/Y3zs/9rrCfmFukhOxnPa7S/VDYRWc
	ndTVne8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdR5-00000007hII-0Hxf;
	Mon, 09 Mar 2026 16:26:27 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQs-00000007gyQ-2vKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:16 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-66142e57280so5459957a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073572; x=1773678372; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1WvucEqcVYrADrijLBtCoRpo6zZxMCkzMNXu+AcfQA=;
        b=KwoxM7np9PYXWE/tzQ6L3qyJoxdwBQbryr8/M6Wq7XcJVwEqaWi6wwCOKLdtl2crQH
         f9gFlH3XLjTB60RRdRwsY0DQos5h2+kxBSc3/yG9vdMSCrvxexYH4tIONqnHIjbbQ+wg
         chjGOZ/n4m725aF4HLXvJMDH4qmKu8mRBnE4LpevrJdkSl1JCpz8tytwy0ZWbD2cTdEH
         R/y0GEy8bcwB93vRkt8yaq+teBxHVip0ZRP5u+kVFVs3QGLJdjHQBcNVTfNFSgqXKiSw
         e78EKbnHrvTagq3UqKYdci2KPuPKRYphBfAEQ8i+kHYGhbP7jFAOsUVuUf7uGCyY2FxJ
         FsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073572; x=1773678372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F1WvucEqcVYrADrijLBtCoRpo6zZxMCkzMNXu+AcfQA=;
        b=FQ7etdYslHZfMX5Sezf5+upuTPSNLZVMJS4GeJxFkv/0Qm4jPfCxQt0tfMmE+vmLJK
         BrOYZ6Lwo+OAUGVotq+QBoxR3G96tqqog0gVZBeu7/tYWVA+smIWYv2GGq+JiUGcrdH7
         lkAPwtds8AB2QE8Z+5SRw7iNsg7m9B1Wv0W5yurTZS57c+p95bhHuNIRrhy63Ih4JxKa
         0Ows2KKijvOJFSDcUMf8mQYSc+ZTSSFWoMF3gpCH4fLJOAOllggHLi2J8qD8iY7ZnwrX
         f1u9bQ9YI9t6Gwz2vvAAjtxLQkag+F4KyxycJYs3tykkPfh3QpXUaFSONHJy5R9W2h2U
         DmTw==
X-Forwarded-Encrypted: i=1; AJvYcCXzHKjEnclHApXiPA7OTnenNbQwIKAFu+I0Mj9mjxOH7jfA986KiWIbiIqAikkFR0T/wcsCiFBoyQyQXjusa//O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9xaaLaOXEFq1MsdnaSSa03OIJohx6UASuI5NnNV2JczWe6FFH
	+3IWV2TEZtzvAUsc7Mg61KunG6Ayc1Injh26N1f+OtYOic85c7XwYSdQJPW5ygYeQSDbx493zG8
	u4wOUImtlfloJrHGkQAWV7w==
X-Received: from edsa2.prod.google.com ([2002:aa7:d742:0:b0:660:9db7:cfda])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1d48:b0:65b:f20d:763d with SMTP id 4fb4d7f45d1cf-6619d485125mr6333847a12.9.1773073571936;
 Mon, 09 Mar 2026 09:26:11 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:24:58 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-13-vdonnefort@google.com>
Subject: [PATCH v14 12/30] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20260309_092614_795529_A20ABEC6 
X-CRM114-Status: GOOD (  15.02  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
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
index 605142e06863..96e0d80d492b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2008 Steven Rostedt <srostedt@redhat.com>
  */
+#include <linux/ring_buffer_types.h>
 #include <linux/sched/isolation.h>
 #include <linux/trace_recursion.h>
 #include <linux/trace_events.h>
@@ -157,23 +158,6 @@ int ring_buffer_print_entry_header(struct trace_seq *s)
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
 
@@ -316,10 +300,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
 #define for_each_online_buffer_cpu(buffer, cpu)		\
 	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
 
-#define TS_SHIFT	27
-#define TS_MASK		((1ULL << TS_SHIFT) - 1)
-#define TS_DELTA_TEST	(~TS_MASK)
-
 static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 {
 	u64 ts;
@@ -338,12 +318,6 @@ static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 
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
@@ -437,14 +411,6 @@ static struct buffer_data_page *alloc_cpu_data(int cpu, int order)
 	return dpage;
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
2.53.0.473.g4a7958ca14-goog


