Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C747BC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0lEPcVl31Ep+ZkAHQCvo9hIAtaxt0RYlv/tYPLRXN4=; b=gnErjUzQh06pD3nCG0GWjo4L0+
	jdkpcNZDGKHTu6rY1+NbeGqpQW4uC29wQdiNTCf3yk7lg4a6jnCMGcHvleJt/NK1Z+NeAwBqvLA1w
	uM4mPUXT5RdY8CwaQdlSh2Mb5tAhRUzfLbKPZ+vCjOiR7ScaLOs6YSd2voEBHb9oRnJBRC9osNRaU
	ZDR7ljSF4SyYuU7KLfA8lzO5ZUcxU2pCwnxhVkFd3PrAjzU7r+KrjRLW4xh4/QMD2U+nWtZ4MgCrx
	VRGkIaVkD2QfaDw1M3PWQQxtiC4nuN453xfmeedy5sRfDpSHK8syg6KuMoU+K5mBwHp9va2wJ8qvb
	/xlPK8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhW-0000000DXqy-27H1;
	Tue, 06 May 2025 22:23:46 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLTS-0000000Cjsd-3Z4y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:48:55 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so31967725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 09:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550133; x=1747154933; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0lEPcVl31Ep+ZkAHQCvo9hIAtaxt0RYlv/tYPLRXN4=;
        b=xiEqlWUPeTzdO8rL1DOcsHMl2Vfqd7CnVZ4KwAoB+xZwesX09LIEoMeO7lxIXlCNnd
         JgFR24hbI4S+ijn3LEWCAgQvlV1IVbBV2Ss3aCQ4rPgL2rKFy3gMzb+lDrX4jBZqtF7z
         KuWKqv7Gyo3U6oI84WK38cPRUwvSxBDD3t8zuXiYC/DOUuS5pg3jVKztJD1K4msV+Yv3
         ltrAAQ3To87iGPnHKLYQ1Tp5wJYCnfOshQRCjspTkZ8llKXkRDqQwlcZwl9rLTDrtF33
         PCrDLfAxq02nvWluJsl4/WHvaQUe2ezCDEw/4fpNjmiCWSvi7/nvyJpON01M8TSEnsm5
         iQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550133; x=1747154933;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0lEPcVl31Ep+ZkAHQCvo9hIAtaxt0RYlv/tYPLRXN4=;
        b=lBugp7yRSnBxpcl3Z+wm8EYmm/Gd5c1OWDhmf1KruAncCzEKgHuyJ4l9pRUppRGmyr
         cg7CPm+PZmUeRRdT18IyLxwW14dO9jFsCbgeYxWU0QkK66qmR2CfE0e9NivZcd35+mSL
         HKTgW+oT5du7ZPvSm7tsQG0ciCnNf+sZmsECsPynrI1EZMlqqH7o4FoCcXTzQlzrJqNg
         V6szPt1PsLuzy396i2lYscfA1J2hwUTbRvm9+H4iUbs/kGbwft//0oDl+2R4Dd9enQQw
         5TNsw+SK6vNinGz95FHGQFses81J+fkeUUdkT6xhyZgghnYMi1jKSMLKzh05LlQS3r2f
         /Ugg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7X0ooCI340XxO8ex1r5tov/nbFshhqOwxVknt78he+1qOOR9PukuVfN7HujAeWJujVPAt9FngWuOguQQYfcj@lists.infradead.org
X-Gm-Message-State: AOJu0YzbbFm1USkyUgZjgSuXQukLVpPVsYkkYp2WbdO0vHb3EB/HNmVn
	kb+RantLtODwK2770ZzDNwewcCgynIac95lY9gl+7tTXgSV1j765DIUL3oXoFuRjjjVYBwm+QA9
	jZq+ym7RFzxl7EdfX+g==
X-Google-Smtp-Source: AGHT+IGq1vAJ+GKWhJtsv/JkxJGIe/fYEg66JYCRx2JA9lFVNOYu2CXLapcz44nyPnWBPM6MV8fK/V35DhKZhEiX
X-Received: from wmbfp20.prod.google.com ([2002:a05:600c:6994:b0:43c:f5b8:aad0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4c:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-441d04f45b7mr38855715e9.4.1746550133269;
 Tue, 06 May 2025 09:48:53 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:04 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-9-vdonnefort@google.com>
Subject: [PATCH v4 08/24] ring-buffer: Expose buffer_data_page material
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
X-CRM114-CacheID: sfid-20250506_094854_888315_182753CD 
X-CRM114-Status: GOOD (  12.50  )
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
outside of ring_buffer.c, move buffer_data_page and timestamps
encoding functions into the publicly available ring_buffer.h.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
index c0c7f8a0dcb3..c26fba4a643c 100644
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
 
@@ -61,11 +63,46 @@ enum ring_buffer_type {
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
+
 /*
  * ring_buffer_discard_commit will remove an event that has not
  *   been committed yet. If this is used, then ring_buffer_unlock_commit
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index cff1e700d4b7..e99e8d4ab615 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -156,23 +156,6 @@ int ring_buffer_print_entry_header(struct trace_seq *s)
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
 
@@ -315,10 +298,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
 #define for_each_online_buffer_cpu(buffer, cpu)		\
 	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
 
-#define TS_SHIFT	27
-#define TS_MASK		((1ULL << TS_SHIFT) - 1)
-#define TS_DELTA_TEST	(~TS_MASK)
-
 static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 {
 	u64 ts;
@@ -337,12 +316,6 @@ static u64 rb_event_time_stamp(struct ring_buffer_event *event)
 
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
@@ -401,14 +374,6 @@ static void free_buffer_page(struct buffer_page *bpage)
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
2.49.0.967.g6a0df3ecc3-goog


