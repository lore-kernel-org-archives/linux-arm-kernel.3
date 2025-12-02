Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C134FCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RtoQQKvZqv4xwY++1uskqrXtrGNBBDBwX6nETm2Mts=; b=NhfQ/GL9IVhoXHFjee55DA7dFL
	HFzPwBSnmA/jqZJrosFatBHtIjZJ5iI7Y96r9arSZiTdw+pjjbQdSqH5/Io0AWRenh3cl/w25Ujd6
	MRRf4i6q5F5dQBpiGSNWfn4I4vPEDfS31Sn6cA+XuiqB8bSeITnUsdFwCfACtI47lP2gBA4heORg2
	t04URkAECz8oe2bhcHj12klVB/XQ4M/s7HHH2MlnObizoLkPkH8x6m8pDJq08SNVn5b4TnSaK3o21
	FQgLpts/GB0IQivbJdBSeLYH4g1O+TCiIAsJ1NSIbm/3rOTbqpOTu9vF4OWvrI4t460vSMA/2Knrc
	HYCChi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoS-0000000589M-3tjG;
	Tue, 02 Dec 2025 09:36:48 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoO-0000000580U-3Nko
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779393221aso28967135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668203; x=1765273003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RtoQQKvZqv4xwY++1uskqrXtrGNBBDBwX6nETm2Mts=;
        b=l4hiNWi9RUxXt92VG1SBRk5JXuqc07ROR6YXCTIjWgxr9S65WL6RClXCJnZ86HAEFX
         65rbxH03V+Pdwox/RgA1SKUnuBxhgkfwkwPiWXLyIXYFYyplZjFKBlcBW79Qu0sFL+eG
         sQYMwOpIirUQUrvojnIY+8oHtX6fzRhTNYKDp27mlGc8/q3plXaqtFd33Q9USeKNvY0G
         4Pm+AfG/SHfgGR1pPMTYDhgkE8KwELCWfG9jic4FDzBWoBUOxgyC0uVBRHFjc4HyPQBQ
         9x1qxUesBIb05vFOz6L70U2GtTH6LVu48eJ/ynDL2QpWTJ12TAgJF8Tb06/XBcKbmZwN
         sLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668203; x=1765273003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RtoQQKvZqv4xwY++1uskqrXtrGNBBDBwX6nETm2Mts=;
        b=V2NJCgsl1MmjsclIBhE0itepri75UlQG8s93VClTPs704ePhy3c8k3jr8CmKugb6wn
         GsHG4YseIM2X9YK234gj7oCMVp0O6+V7bqYfjSCAdV0CqRJLkShYashwvmIcI3zt+Deg
         JYpoaC+S3aeZFs4bxSQQkHE4W7T7hwUpZGg2wYQgFkSl2KK0sXogYdxlcdPc9Xcuw612
         yvAO+bPWO6Ov0e8+TY9CvNrAyjNjnlyTDoVp+1XJnwIFGvq/dCaJ6JKv4W1NNj4oqvCq
         +p+b3r6Vlnxj7wiEA2eDYQdhUSffUObO5BDpgUcjJeUgV3apuGP8xTB3GaIoJVTtsIBg
         ZLRA==
X-Forwarded-Encrypted: i=1; AJvYcCVmMx3uvXAHH6a/X/VQMgeSnNWflvBaIBoE5b2qh2jEd/YPet+xifNR07xb1qQI/HTdNfjnYAVBP7ijRBCFLW+X@lists.infradead.org
X-Gm-Message-State: AOJu0YwtFOQTh5uSmsQ/YXF83oT5MN9SgB998Hm6I3pMLouMkDsZ9NCy
	TI+VobmW3Y2o53hv+v5ZT4Bd7BB5xwsMSo27YM60X6ij4W3HG1fupIsjqy2Ei11NJj0l+9/qfiS
	b2C0b035OY2+SkPSab0+sTw==
X-Google-Smtp-Source: AGHT+IGUcFqotkZnIoQBBM1OMHuVXqQ+7PlebBHwvLOhTIEZw+4qCWorheTb8bRwyZqPz9VQr+j6/1h9iGZ0AV13
X-Received: from wrmr16.prod.google.com ([2002:adf:e690:0:b0:427:8af:f179])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a08:b0:477:7b16:5fa6 with SMTP id 5b1f17b1804b1-477c0162e8emr419428785e9.3.1764668203047;
 Tue, 02 Dec 2025 01:36:43 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:05 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-13-vdonnefort@google.com>
Subject: [PATCH v9 12/30] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20251202_013644_877922_13EC08EF 
X-CRM114-Status: GOOD (  14.95  )
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
index 9f28e7b3058c..7a1a8d5f3a25 100644
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
2.52.0.107.ga0afd4fd5b-goog


