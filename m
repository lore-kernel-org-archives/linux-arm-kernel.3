Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32CFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lQEJoOrOtFhLM0V6NW85dekf5jRkM+x/j5FFakF4z0=; b=XS+yVfn+kdAYF9Ee2Y5/Gk6YnN
	NdliCWBVifXAi9s0NvLINF6SwrHZUCUff5syRSXoc7REZsYQUBEmfPNMKQ1jliVVXB5UbgCBQPBHy
	OEaUPDs5W5oNCfsXQv3IdM3oRCAwtqXaK+VqdlJXxfz9vxE518AAVvqAZjBkKQquiFSX7kxr3/xrQ
	q2m5NW0IB10Fusn0ZC0Ga29A+yybUIFztd8s4rk7+eF1z0SBF2gjPvHvWF2bPN5Thwk5e/VyJjvf0
	VBdOME5TTme6jgSjcS6zoS52yoph4BY2m9bkZp2PW14VszV2dr9XKNsekMH9GEfrNpr37bmSDMJ2E
	AgsXB8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV2w-00000008P4O-0sGv;
	Wed, 08 Jan 2025 12:20:26 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVm-00000008H0H-0Wij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:11 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-385ded5e92aso3307890f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336767; x=1736941567; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lQEJoOrOtFhLM0V6NW85dekf5jRkM+x/j5FFakF4z0=;
        b=oAEsu7vBLmy0gBoAefBdikizq1a+U+kRaauC+Y6hw+aF1lBAX6CknEpDP0hhXEPJ98
         qbcRmS+mR3YjuiSbYmFoIC36APPQ1elZcL0cs/vOAccP6u3K4ljuQY02TdaI2V5LQWtt
         VdN92aYD4Ime+VtDeTAlDiy1kG4q/uYljH0UzORghjKyAgJyUUMwEMQ/2vfk+bLIbZHR
         bi4R4xrcy1iHFxp+ASKLH45ke8biFOrJ2gpbHfpRaatz6QL94v1pimDokRC6HmLaYq7z
         /AqqLdjc21++jmLv/1KD0Ek5qF0BlupwkS4F7aDHpIhpCEl1yy30BRcDJS16djsBcBuW
         UQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336767; x=1736941567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lQEJoOrOtFhLM0V6NW85dekf5jRkM+x/j5FFakF4z0=;
        b=eV6FrhEww5Nf1UFGGPgR4skhX9u5a2+Kwa9iUdGpFXDvOgY8clK2a2CrOhRHJfrdVq
         XqbDcVa/yiTMkEO/cA6003HDeZlp2lkJOmvdNgoWhmlwzR0RoOPrK6j13kqGIux2B7J5
         7AAsifX3s2jny7GIxFJVa4bjkIV7IU9jPVkciHqTkLi+hsi+feBBafC9kGbvbp2+31B5
         6GZLlfuSKfku+YeFOtAAbACGXLEvkiXkjWDcn49u34shG4Cb+6CFZ2K0Vjh+lVV3Z6lz
         80Ra6vU17Pt+lEh4xW/VNtngL8Lgj5PYIJ79luBbBq+xCpVY1BMI7C+xb41FAvvKaAXy
         TLow==
X-Forwarded-Encrypted: i=1; AJvYcCWGZofgt0hN75tnJMWmZmswhiMy0TF+xgKi9OjFl/hPqQsghwFTfGnIYHYoU9/BFAgqafLmPwln5SNuVjNURa+W@lists.infradead.org
X-Gm-Message-State: AOJu0YxkCLM4q82ug67ty4Ewg6CZmctJtoZeJLcVVDcOE6SgSKNI+Yc5
	dSdhE37eW5LAc5fCMwsrtibOTh4KjcCHXa7RN1wzzur5/ZYWzqJlY3W1jKrHVH/D40ZKl1Uos/b
	6rslH4mlCKl7cWKnp0Q==
X-Google-Smtp-Source: AGHT+IH9nVUXukGdhao/KGMQEQ2ZZRu7hj12bJxObkGyvYkwyEhx99i/TvuPbWjySunFSoVAevMNDD+4C2F0t7to
X-Received: from wmbez12.prod.google.com ([2002:a05:600c:83cc:b0:436:7123:f80a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47c5:0:b0:386:1cd3:8a09 with SMTP id ffacd0b85a97d-38a872d2addmr1799776f8f.1.1736336767575;
 Wed, 08 Jan 2025 03:46:07 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:27 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-4-vdonnefort@google.com>
Subject: [PATCH v2 03/12] ring-buffer: Expose buffer_data_page material
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
X-CRM114-CacheID: sfid-20250108_034610_162247_E54AC846 
X-CRM114-Status: GOOD (  13.79  )
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

In preparation for allowing the write of ring-buffer compliant pages
outside of ring_buffer.c, move to the header, struct buffer_data_page and
timestamp encoding functions into the publicly available ring_buffer.h.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index 61e785adc011..a80057371da4 100644
--- a/include/linux/ring_buffer.h
+++ b/include/linux/ring_buffer.h
@@ -3,8 +3,10 @@
 #define _LINUX_RING_BUFFER_H
 
 #include <linux/mm.h>
-#include <linux/seq_file.h>
 #include <linux/poll.h>
+#include <linux/seq_file.h>
+
+#include <asm/local.h>
 
 #include <uapi/linux/trace_mmap.h>
 
@@ -20,6 +22,8 @@ struct ring_buffer_event {
 	u32		array[];
 };
 
+#define RB_EVNT_HDR_SIZE (offsetof(struct ring_buffer_event, array))
+
 /**
  * enum ring_buffer_type - internal ring buffer types
  *
@@ -61,11 +65,50 @@ enum ring_buffer_type {
 	RINGBUF_TYPE_TIME_STAMP,
 };
 
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
 unsigned ring_buffer_event_length(struct ring_buffer_event *event);
 void *ring_buffer_event_data(struct ring_buffer_event *event);
 u64 ring_buffer_event_time_stamp(struct trace_buffer *buffer,
 				 struct ring_buffer_event *event);
 
+#define BUF_PAGE_HDR_SIZE offsetof(struct buffer_data_page, data)
+
+/* Max payload is BUF_PAGE_SIZE - header (8bytes) */
+#define BUF_MAX_DATA_SIZE (BUF_PAGE_SIZE - (sizeof(u32) * 2))
+
+#define BUF_PAGE_SIZE (PAGE_SIZE - BUF_PAGE_HDR_SIZE)
+
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
+
 /*
  * ring_buffer_discard_commit will remove an event that has not
  *   been committed yet. If this is used, then ring_buffer_unlock_commit
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 3d5d32ecd3fa..0e5e9272debf 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -152,23 +152,6 @@ int ring_buffer_print_entry_header(struct trace_seq *s)
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
 
@@ -311,10 +294,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
 #define for_each_online_buffer_cpu(buffer, cpu)		\
 	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
 
-#define TS_SHIFT	27
-#define TS_MASK		((1ULL << TS_SHIFT) - 1)
-#define TS_DELTA_TEST	(~TS_MASK)
-
 static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 {
 	u64 ts;
@@ -333,12 +312,6 @@ static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 
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
@@ -397,14 +370,6 @@ static void free_buffer_page(struct buffer_page *bpage)
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
2.47.1.613.gc27f4b7a9f-goog


