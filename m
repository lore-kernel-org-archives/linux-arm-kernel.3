Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D773C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sts3k8S/JL66rJ24fFiDhVPJbMR9OVDJbVTiN/eWqHU=; b=k/3RmwrZJ78UHsoGKNPa9WBQmp
	X7KFPNmERiJgXkXPCqfYyu4bMYABAZxpuN1MJiugWBBmDycBRZRCeYTKW2Teo+sbWe0tu1EbFFYnh
	rvsvbmPukekr1s3xQ3+E0BN3ZDv5y48Px1hN6alfClBN7s05xwYj9ftDRUrPJre6qsln0N6EXJUp0
	7J0UyQDm1eX9aNg9pkyGBH8B/gXvguC9Bep6HqBipmxMksEaM4URMZPzbT/nWyxhpZ17NTlmd0aM5
	DICr9Q5Nm5m79GOEU/lQj1M2buAw+0Wa2ANix/uXQwLEKhkz6FLzQ1Qm3AHuJwvIfjjnrT5YBwlFU
	1gH/UaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvcr-00000003bOv-1Yfm;
	Fri, 16 May 2025 14:01:25 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIz-00000003Xp6-0lNo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:54 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3a0b589a2c6so1012359f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402851; x=1748007651; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sts3k8S/JL66rJ24fFiDhVPJbMR9OVDJbVTiN/eWqHU=;
        b=B7uq2YWdf5RyTfxMmYpYeso6+thkDCdc4/mzE52xO0s6IkGB4KdXtmh5YSalM6yHVz
         4NzeXygg7wZYuydW+RTTJWn/MD+VpuTkMquYiSiPz/8kA2mzGYKJ5U+rU7AK4sOvJQ7R
         RwoyQhfB822EJDhA9upLnCEGwm7f3ozZScc/Losytfsmu5EDHugEj9TLmfMNTS7B/m9w
         hxBlHoDONzRB4Do/OHRR1//OgpDSj1i2EZ2nVMUrRz6KTLEDUWhqZk7KkDzUsJ7ATuul
         2PcwZVbBcEcdT1AatGzrNm25qvg0bxeG4otAYU1OSxaYCVuxtLAzxEARxDpJsQmAygDs
         sFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402851; x=1748007651;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sts3k8S/JL66rJ24fFiDhVPJbMR9OVDJbVTiN/eWqHU=;
        b=clcxn4xgtLzLLz6QVlbsXS2hhALqZjzlNvM4tbSdW4B+EeH6Ae/GRNawT14JLFboQ6
         vwKQgM2cJrRA/ZMuIzpQQjdR5bFa/3pu8aTfg8TC45+2myuc4wZpFE3Sy8WK05JkK2gO
         5N8hJzo+R2XnxKfEsSic5w6vqNK1ZUzJMqVlPA9yzEtI2tfL0psnKxFdBunIWmdNOtu1
         CdihtACoUkY6BAi1dceJ7GUAf4/H0lAuw8HI1GzvWxUWb0xolX7GfMZHUiNfTDEKZ2In
         bDgeDVQ0ADPs1wSCDpxxBfC+0Pw8PfU/k+B3TA+zfhK7nIeoNazQHy82+WJBXpruvKGK
         dyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm5YKpOmQjluRXR9pTHMvGr8teLor099Pz2ZUgG2iR523SDfP85Sb0pCQf4BT28uXlNDzZTYMdw7flwke3oU8i@lists.infradead.org
X-Gm-Message-State: AOJu0YwSHSGuXYtYE6bw8eAwsOki6qXLcStUaI6q21OyrOnLZQfCZ8HK
	48JWJeD612i6+EXytVtW76+be95DAcHz7aHSiwZgEE9owSffTSFlZmkDtqx/kOOl82OmCITI1E6
	1oQeLLB2RfSwxKD92FtjI9g==
X-Google-Smtp-Source: AGHT+IGnqfA97BVbR/Mi8Ve40w0dtCeOsw/hPCYSNZEP3cEaZDO8G74lb40v8p70u0x6PTZ1uUBUClqeLpxaBluT
X-Received: from wrf23.prod.google.com ([2002:a05:6000:43d7:b0:3a2:78c:3f3c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f53:0:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-3a35fe6777dmr2300705f8f.24.1747402851035;
 Fri, 16 May 2025 06:40:51 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:15 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-10-vdonnefort@google.com>
Subject: [PATCH v5 09/25] ring-buffer: Export buffer_data_page and macros
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
X-CRM114-CacheID: sfid-20250516_064053_227579_D992706C 
X-CRM114-Status: GOOD (  14.60  )
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
index 8f94ccf3f55e..91c69945a0fa 100644
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
2.49.0.1101.gccaa498523-goog


