Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F77AFCB601
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0wMQ/1n9X5j3XgVqCp+O5b7W1hHbkcpIUXjLxrGdB0=; b=UNMKuWuvFhzDO5CaV9FaET7fhY
	wJn06uW2m/C/GxWG+fyXqglwLDI4LlCK0ZpeIzLIIjVc5/GFpdQELbqCO0g/L6XUMQZw4Aj8iXwB3
	J8uAmLg8/CZaDg0XUzGTJdtKgq0szpVsW6I7dnZcwujmAVkNEOikEtpW5t+O/z9KRbiJMuaIMFu3v
	+mv5URgfRwXmPJnPI7m932P7JHVgJgERIGjC/Cf76OS3TuEWV2J/W61MdE0s5CVUIJXp8IPD3rQ/b
	350A+dXnEsU+bnRPFziPj+o9+qYa2Z/eIi/4Kb0XisRw8otNh8auQ1D7yGTIjaw8LToLzX7pdM1DS
	cthcwgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHx-00000003vQm-1Rl8;
	Fri, 06 Mar 2026 14:36:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHf-00000003v35-3eEr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:36:09 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4806b12ad3fso81288045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807764; x=1773412564; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A0wMQ/1n9X5j3XgVqCp+O5b7W1hHbkcpIUXjLxrGdB0=;
        b=zlCil4LhIRKGIjdIwHcfOpV8eiZxTAh6ordduyFEqLaaa153AcI33+SvzAPPO0rn/6
         CU+mlVZuomdWMuLh0fSGInnJaIjwNOMQnnxRZwVFPkl/qXYokL49Nwxld0qUhT4VLo4Q
         +JvheZVdo3ZZbAMLbQAggJknwksO+2CVn70d15pW6mr9Lfskcl7ljYfwId2QweLknddr
         5tIScDvUp9ykRdcyoRbX8cscdKYhfD3WBIALXRE71oh98hqiofBBAgEBFv8gvOseMtwF
         p8t9Dn5NCMchqIymQCSSiS3ezHfPzogmS9rPmsnMNPQTMCPxjhkddEF3VDYk+EcMc0BS
         hl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807764; x=1773412564;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0wMQ/1n9X5j3XgVqCp+O5b7W1hHbkcpIUXjLxrGdB0=;
        b=e92lrSvYlIYmP6mixtc4nKbey6AAyPehsTwVvrgbHJagVHvMxQurooyyLXYuumAs+v
         F5fY/uKqFZdwhWgs90eJR8jK4Evv2tpgI//I/C1ZM0uxq4qsZAt8ACnAYk9CGTlycbVR
         ix/S3DBFqkhjQkIuooa2m/zBBb6eRlwDCJh+CZs+IOWQL2fx5DdXBgTrScCEzOedcWKk
         wAWEKM3GiPO0+82cSkn9AycksNqf+856QxVNCK2pFR3NRkEGAOX3VHO9Y0Ysz4cle7fC
         +Fmh8bExqb2XBWAbucr0vFs2mhCK5QjczjnUtIggxW147vDcQ/MJCLKP0iaO5+W3HVAh
         KK0w==
X-Forwarded-Encrypted: i=1; AJvYcCX3vo3hM98rxCqM47f30tLt8mgEvIhU6BRXzQa2J/ccbMdZObSLIdwmPg+S2Qsz3xta3Xa5mOYwWx4DJvvBwTIA@lists.infradead.org
X-Gm-Message-State: AOJu0YzX7smC2IUEU/f7ZybUjnQNkb+lLytF//9U+wma4s+AFDIs5b94
	5h5w14SmmZ2xgl3/Pkg5G0UudT6ZooPmjT1mD0gclBd/bHCC7s9tBoZhNx4F0KE916MDCT6CjRW
	q+AnlYc7nVZ/odYrrUjKQ9w==
X-Received: from wmbjw5.prod.google.com ([2002:a05:600c:5745:b0:483:6c98:3d2f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1991:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-48526977699mr37901595e9.30.1772807764177;
 Fri, 06 Mar 2026 06:36:04 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:16 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-13-vdonnefort@google.com>
Subject: [PATCH v13 12/32] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20260306_063607_934190_89D42D7F 
X-CRM114-Status: GOOD (  14.47  )
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
index 60492e66a679..d92b615e9246 100644
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


