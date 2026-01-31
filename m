Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DFDD7976C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBD976xrFPJmXmNtnpgAPvl5e9LpDIznbYBPc6HUC2I=; b=VbNgz2y3DYYG3pf4HWEUYgCv7B
	kuILNlNo7pJWCeUcdGwGk16fxrpS2xR0yp36e3gvHm0bWYU9Uz+UYCRsGK0AHN2i8mrp044iau3C6
	PNTgJGVzXzci0viBrOfKAYVcgx2cQ2LOEZwyxAkoKyr33Pjn+ot+GP0dlIlZAnhr29nNJC/UrmI1H
	4NGeEvwYvnqxSCDCVLZy+u19vJC0LpdBrILvlEL9zL+AipRUoIG22PqIntlBrhUq65rU7rTkpNOxp
	/p0Vx7RKbisywvThSG80KhDPsrTfrG1fpPtQK0NxBYLlEyeVM3a6pIjY4wsq+qvia+9kFOXq/mZFm
	BZt6idbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB3Y-00000002cY2-1Uo8;
	Sat, 31 Jan 2026 13:30:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2c-00000002btN-3dGz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:36 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4804157a3c9so36044835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866172; x=1770470972; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBD976xrFPJmXmNtnpgAPvl5e9LpDIznbYBPc6HUC2I=;
        b=OCdnQyJ9jmJBtbua2hrAbc2aKbGYCGptf2S8YiBTYndEEaIsOjAIdmMkVwzT8hPBaz
         rqpMRjrru0JDc2NoEHns5df9/4h1+oYkIkMcqnG7DMJQ4bb6PlC01nBwGOshio7oDgkJ
         0E6xDfWouyteAY7b9Gtopt8iJv2TWWm2qIcQl7N4tWy7VCaUuEltSecHyCVKCo3Q16ov
         q/7lRDc7AlZNVqfE6TPRCPsQdCzvo0MK69F84oOAkNq/J22/GBEg0Tb+OdfSHxCjaVsb
         ptdn3id+ZRFf4Dr8qvOVioPuCC9y9lF9CZd6aTFquGjRVN9dNduxVnwyUhcxvXk/6hKo
         8GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866172; x=1770470972;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBD976xrFPJmXmNtnpgAPvl5e9LpDIznbYBPc6HUC2I=;
        b=QBuva5EHh/atolQw7RmL2Mzgb6SBH+gkzeH5MCNZ3PXA3WvO9IF+po3bdkO5lBVBt0
         YyvTKf484mCasABCTroayfwfVbBXA8+A1i+Anw/WNdQLbfR5HVqwK/XqQBW7254tW1LV
         7p1W5JQup19CvOv+9KDKIBBuMj4jTPix6JAfuO8NjkyNwQuiyKr9Pb380BUD/B+zFOS2
         X1qulHUHGA5uxkpiTv3scCc4fdkyxqtVBUYfAo9h/dMkl9OGomOZQOy9uRzI1AWIHSye
         3cDm6LW1FBYDo43mh2ePr20KAcsF5Kyd0NOdHrSw/1Zw1oOnZzCgsm28j0MIFeKgeC4t
         qU9A==
X-Forwarded-Encrypted: i=1; AJvYcCVcHzEMNXcZeT9OafjM4z5hnm78C8Ymkv7KfaACS7a739dknPSUC5XsQOlQEXNowvMd4vjC/x9DRWArd6OLCxyp@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf1OmSB72rcKvJt7ZQDy4GNlGqByoW1fvHKDaHepXnvwyHKYyt
	RiIbXSntw7OBE/Dksv3Px63tqOn8J9FHV533ahJMhl7IgtnHG9NinO0b1LFZfaRYe+QZAP9s8+M
	iBl1dxfyqQGPcEdxBmc6OIw==
X-Received: from wmil13.prod.google.com ([2002:a7b:c44d:0:b0:480:4a03:7b60])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1e:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-482db4569b5mr71334045e9.5.1769866172683;
 Sat, 31 Jan 2026 05:29:32 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:30 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-13-vdonnefort@google.com>
Subject: [PATCH v11 12/30] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20260131_052934_939777_F412842F 
X-CRM114-Status: GOOD (  14.39  )
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
index e28cc02d1a70..d604377f2184 100644
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
@@ -436,14 +410,6 @@ static struct buffer_data_page *alloc_cpu_data(int cpu, int order)
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
2.53.0.rc1.225.gd81095ad13-goog


