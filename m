Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C2CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykRZt4psK54fzec+OCYqwqliJC1dewmuT/merLHMNBI=; b=PUFEw7169YayjtdJQHz3CCCZdk
	1y97e+msr0OvAVMVLuWNzLHZir3L0LEApxF+p9jb8y2HTROgReY4OKgryU44SYK0kjh+Hv++dattx
	R3LPJqHqPbYVEuxa/YY19qYK8ruuKJP481cxSv5mHxKRXYw3kbftNoCur8h4BV+mRkjscLjATRYFs
	ALvjAoI/gQ+4hoEzfjwUlT8MWtWUt/UqXLOxw/rh+Bj7MZBYppJAjNCt7gH3RSPVSaICPY7qamzpD
	VX70P6+6wKh3AgTx6wegQ39yRXGH171FHZO2A+zRBh0fIGT6KlK1zsBfq3ey4esy2+YP3DFt6g045
	aSuwTpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0G-0000000CQT4-2STy;
	Fri, 03 Oct 2025 13:39:20 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g06-0000000CQB2-1e6j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:11 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3ee10a24246so1315691f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498748; x=1760103548; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykRZt4psK54fzec+OCYqwqliJC1dewmuT/merLHMNBI=;
        b=pIRbLKkrk/ORuCv30wB5G/BSmphf3xzcOpchrK5Gmaiz3gVS9CPXX1ps6/VZMfJ09q
         loGFZKOSHoRI+uA6tP11d4RNWetDWAmhcBoMTF3VXvKCN3z9tuP/jEigTl/OBQ7+bjwg
         rR/wzuSPodVTYUvFaY9Kxx9T0NjEhCb2zaxKHaGdGMIDuW6aCPVdIa8SWcMGLIsE6fdF
         xH09rpQdjzi0k3QbDAHqqNGIWzyY+uwuS30ZJXVNHQvuO/xfV8/n1mD/02d2HospITWq
         WA6x5G9j0QIv9wO+naKEReQGKlnWM3nMHpY1uRpsgE3E2Va2KXcP7BCZHlNQYPtD2RgF
         IABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498748; x=1760103548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykRZt4psK54fzec+OCYqwqliJC1dewmuT/merLHMNBI=;
        b=adM88m5yuTVsasx9OjvGU7qTS1Oek97zQOK31P9QcDJpB7KQWtRZ9reIa2cB1vJzzI
         dqwlgNzOyrF0pMaA59XcdwhaUaWeWt0nN4cHWhuVOGCaGV8sP06AAqz1Yb76HeO/mvg1
         8SZ+GOGG/Rox+XYkpVwfUEKB64m+2mO24PaoKkanFGwqKPm6lpT05SEhwjrutMQF5TKq
         IpP2oeTaOs5SCYMxzTWHUtcGJIg6puUAskgnqcBtGMHfEh10H0PXXt1WODxoNgUy2SHI
         XKe7+bCF79Eo+AvqH6Y+ozVhb/EHds0Wh8AicwQJrJK4wEvEZN055yvWoVHD2S3Sxcmy
         T3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWtwMD32ufmmY0F1NOXzKFNnZOL33hb04T1ysRb4t8VRckwYy8tq9GecXYwpNZRSOXRbok8UjFQlQ9qv/LrDu8a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/mSKds3Ubiw4GbSpsjGP1Qqta4Fumr6S6+o+PmBfIdl3X/iEI
	qmeXvQrasMkzPvthZl7TMKJyccnFoEp+cXfPLvt+HLa/EqVAOw6vR45DihjgKJ4bD6yc+AOL/Jg
	g1E1+WNiDlrXVuxsuCw7CSQ==
X-Google-Smtp-Source: AGHT+IHeEJIiFICQ+unjZAp8uVzxbLqoVsWl8IqXt+7TMHnizGTo35OB5M9RkcuE2jC1IdoxNGX9ssBAd8G8PduC
X-Received: from wmaw22.prod.google.com ([2002:a05:600c:6d56:b0:45d:e232:8a3d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348b:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-46e71109e9bmr21805095e9.9.1759498748266;
 Fri, 03 Oct 2025 06:39:08 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:09 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-13-vdonnefort@google.com>
Subject: [PATCH v7 12/28] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20251003_063910_494498_3A235D7B 
X-CRM114-Status: GOOD (  15.11  )
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
index a26a6f537f87..06aae6a2a308 100644
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
2.51.0.618.g983fd99d29-goog


