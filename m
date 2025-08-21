Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CB6CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lidjLhay00eIJzNqp9y3fdvOXQROgJQ6gBPaAYL/6So=; b=JkeQPI7sHwDXUkewqJxmyvNrz4
	owzvxn51FBxpg1DoA19FfVQZpApFYkeELi1DpPO/zpKqLSJcOdxMxlquMubRi9NWs5EvdNWuLTeoc
	hKXSXjSznnTvbw+1YpN4FJn6TgEtVy5vHbWEpouz4eeXlAkdyXTbNxmAcCRB6vLXocV/a7NBud7Tb
	4NRoKGsv9H+ph2iwhekddbzNN8rgZhQQZCYrjSoAaREwek4HoOYtK57xPNwKFX4vFa3asx4nYdW3C
	gSwfLosjDNU/h8/IDnFXuQeKBRTvZDA2Qv8/nXnFJsMzdBTKKiVuaCzLJAQZMkTQX7gCi+471ziJS
	as+b/Wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3NS-0000000Gk7A-1zsU;
	Thu, 21 Aug 2025 11:22:42 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RP-0000000GCfh-1rVq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:36 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b00149cso2854635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764073; x=1756368873; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lidjLhay00eIJzNqp9y3fdvOXQROgJQ6gBPaAYL/6So=;
        b=ukhitYtIYLl/XOeqTCySZU16uSr03xnkGEXb2E7zBnBGLmjJrGIx52pCIqHG8hRhFh
         +38iHO8klba6rkWDJep0069Mg6MSnzJvmJct4IcnNy55jS3M/8OWRSHhLwvq/Sqt6Wbi
         QraN0WKas0klWJV4y+xyWGXMUW2evdrUAMT7FLPBo3noiM8Akxd32fmhG7usMTL7AOyl
         sh0x8EM6ghnSNGGwDT6zDtX6w0LzbafDubZr9AP5aqfCsIbR4AYiBYzx3df7mJzt1OZp
         L+oNjYpxMO8fR1jStsH0u30dxU+KjZ61HHU3BWwvPwUcfZrhdsikjzsoJjKrCz3QxNEq
         bZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764073; x=1756368873;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lidjLhay00eIJzNqp9y3fdvOXQROgJQ6gBPaAYL/6So=;
        b=G4IECKuA3xWffwcAhFICi9bvrVg7UjR3epf1WGOfpCxD1LnT7zUvUh3rhP8HGHBUM5
         SelyRZBP5QC4I8eFzPQhDmq35ijxlzthzfmCD2gxuFlPgVFdcNa0DIGK7j44cRn1SFKE
         JdU1TiMHzO+JnPHiwBkDH6lq0THKy+aibgAfqH/LAhdW3zm8ao/yNzc4Vpx5eDF4H7oU
         JOcRS17G8RWU2mUiElKwJ67l5NpjfXtkMkxwknLimEyZL6NSjOHjtriePPfUMcPypYuc
         r/kr2zDlMfm9AcK6kI3FMimaX3EGgXUG+yVo1D99zZXJHrMgxL3tj5rU8DDA52DnmxhD
         aoww==
X-Forwarded-Encrypted: i=1; AJvYcCXp820M1AbCxMODsiZdhguiYJxcaMkiCkK0zOgjl3RsqBG8A5CA6x9Jb6UzHmyLQpdsb4tTZJ+6DhWrjKhFPin6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdrw2epK1B5lLZ7NMc0xBDKd6x7+y2G19bqFTKXUW5gmYxG3pq
	A0Lv/xF+HE7mi7As43XZ89T32v74uFz02BDwwXpcJHuTidSp1SVAjcCUxEw0a6F2YWqmFheQ09l
	9kRtJhD5iBiUJYv62n28ndg==
X-Google-Smtp-Source: AGHT+IGUYeZjzebzCwGkqmxmIs4OLf1N4Wtv2KCQU5S608mV1VSpQPSnOJrtt34tlE8F6oeRRBN+N84WhKQvWceN
X-Received: from wmbex21.prod.google.com ([2002:a05:600c:8315:b0:458:c0b7:b936])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b56:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-45b4e4f5719mr10261825e9.8.1755764073268;
 Thu, 21 Aug 2025 01:14:33 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:13:57 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-10-vdonnefort@google.com>
Subject: [PATCH v6 09/24] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20250821_011435_482228_340526D4 
X-CRM114-Status: GOOD (  15.22  )
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
index 17f77653b926..c7405b5e55a7 100644
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
2.51.0.rc2.233.g662b1ed5c5-goog


