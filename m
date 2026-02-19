Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3971E9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJWFRtBApZCpkTiQfcHr+n+DXKxoodOPjTOPKitJmqA=; b=fKSo9Ou5Knqp3P95ckprQ3DVMl
	LCfjhnyixKdQrPa8pqSdGhJ3CMF6aLncocWXG+cZnqgNA0p/qokRVPllDYxFdv8LUZMCOoiUgoaAK
	PvNy5LXWYM5DdExLqU9hn7U0mi+CC6Yu9+anVXiqZ9OR+X8/yD1e4TTsTzEgmfi7D4riIAsKHB9+N
	+kdzKC40aJIMpT7eeA6VMBwXk1xX4HKujwo4lKMb24DiQ7xu0l6CiYFEa9gMVxM+c1mDboMO13MJK
	FYd8gQdNDNDkz/baEwvmJsavo5ZddqDuHusKqi5jY9Lq+LOTBIUQ+STsujfvvx2K3dF9ah7BFSz70
	JAyWNdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yv-0000000BUib-3tH9;
	Thu, 19 Feb 2026 15:03:29 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Yr-0000000BUer-2v1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:26 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso7001255e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513403; x=1772118203; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJWFRtBApZCpkTiQfcHr+n+DXKxoodOPjTOPKitJmqA=;
        b=wrwMn4MZNZKWfyhoq4CAynIrzckOnHPPq17gqeN/3vh3llQljxR6bxkkUsCh/7JyB9
         4WUpob0mTEoz1qYyA0JOxgIJzhj5wc09hwOYfwBLlTCxMQl5bDrz3Sb/eYCXV3ol/K2q
         RveVfCC2JDVIEe0SLnCO0M64nXYaGZfs1OwP055ZR5JxqE/HmwtFQA0Q2IXnDvPCGGhN
         AMmJU8WKiWRFeI5nsVguYn0bMU6gDwmFiS+ByZezxTuBPCxeFdv7hcdYpKvhLW4mI1xQ
         /YmjW6XmTAmTNbehQZb59n+E9pnNm3WdMz6nvq19BxQCwvvE39syYkH2vt/jS1TYBEvA
         oLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513403; x=1772118203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJWFRtBApZCpkTiQfcHr+n+DXKxoodOPjTOPKitJmqA=;
        b=exbmb8NQoDU2uU3BrfwOEkelutsWG5E4xRYsisesDvt3y8DsajsZaetuT7K+XMFUk4
         XkW0lASXnq5JdL4pR2toaTiUR5KaS8GnmwydG9Y3uluBAye7JbDcM3eiJKX8bJ71M20Q
         g/ph7VlHQEYyvooDTUBmYLqM2G0Hd3WBnAKf3ooIf4YxMQ+O/wz1s5I4pFjENGj80PQb
         Uq4GYJZn0dlMIm6txHptpyUtKFjiDUX/H0yG/VtXXk3ufHBLk30+xKChSMmFR9xcscky
         o9XtgayCPsclTkhzpo7mmW26DIJSNKUmvHoCW05nuyqRgXATOZgP3a/fLASgyKHOIFOX
         tM9w==
X-Forwarded-Encrypted: i=1; AJvYcCVDsnAVKcnkhnlvSTE2vBw9YvXTVZKqMKeBclyQd8PTquJPAVQzoxgLLPoyTtiFzvNBwW8cvv2jbvRjPF3Bb7vH@lists.infradead.org
X-Gm-Message-State: AOJu0YzjRM+YxjiGzoD57gHOryGndSk8tkMhkbN7a/KjFgY9ZZa6wO1o
	/oeqGdNvb5OrP5IKdZb7qZTusvcOrGQ7QpM7ex2y3efXjUqeQe/dzWG0f7O/S6sf7b+7XvRbW6f
	a53QUavOMCdOAVLAOLp1ytQ==
X-Received: from wmqf8.prod.google.com ([2002:a05:600c:4e88:b0:483:509d:729b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a51:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-4839e6682a2mr43557455e9.29.1771513402562;
 Thu, 19 Feb 2026 07:03:22 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:41 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-5-vdonnefort@google.com>
Subject: [PATCH v12 04/30] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20260219_070325_765499_81A14F78 
X-CRM114-Status: GOOD (  14.26  )
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

Hopefully, the remote will only swap pages on the kernel instruction (via
the swap_reader_page() callback). This means we know at what point the
ring-buffer geometry has changed. It is therefore possible to rearrange
the kernel view of that ring-buffer to allow non-consuming read.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index cd9e686b212f..e36e70e2c998 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5383,10 +5383,51 @@ static bool rb_read_remote_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 	return rb_num_of_entries(cpu_buffer);
 }
 
+static void rb_update_remote_head(struct ring_buffer_per_cpu *cpu_buffer)
+{
+	struct buffer_page *next, *orig;
+	int retry = 3;
+
+	orig = next = cpu_buffer->head_page;
+	rb_inc_page(&next);
+
+	/* Run after the writer */
+	while (cpu_buffer->head_page->page->time_stamp > next->page->time_stamp) {
+		rb_inc_page(&next);
+
+		rb_list_head_clear(cpu_buffer->head_page->list.prev);
+		rb_inc_page(&cpu_buffer->head_page);
+		rb_set_list_to_head(cpu_buffer->head_page->list.prev);
+
+		if (cpu_buffer->head_page == orig) {
+			if (WARN_ON_ONCE(!(--retry)))
+				return;
+		}
+	}
+
+	orig = cpu_buffer->commit_page = cpu_buffer->head_page;
+	retry = 3;
+
+	while (cpu_buffer->commit_page->page->time_stamp < next->page->time_stamp) {
+		rb_inc_page(&next);
+		rb_inc_page(&cpu_buffer->commit_page);
+
+		if (cpu_buffer->commit_page == orig) {
+			if (WARN_ON_ONCE(!(--retry)))
+				return;
+		}
+	}
+}
+
 static void rb_iter_reset(struct ring_buffer_iter *iter)
 {
 	struct ring_buffer_per_cpu *cpu_buffer = iter->cpu_buffer;
 
+	if (cpu_buffer->remote) {
+		rb_read_remote_meta_page(cpu_buffer);
+		rb_update_remote_head(cpu_buffer);
+	}
+
 	/* Iterator usage is expected to have record disabled */
 	iter->head_page = cpu_buffer->reader_page;
 	iter->head = cpu_buffer->reader_page->read;
@@ -5539,7 +5580,7 @@ rb_update_iter_read_stamp(struct ring_buffer_iter *iter,
 static struct buffer_page *
 __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	struct buffer_page *new_reader, *prev_reader;
+	struct buffer_page *new_reader, *prev_reader, *prev_head, *new_head, *last;
 
 	if (!rb_read_remote_meta_page(cpu_buffer))
 		return NULL;
@@ -5563,10 +5604,32 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 
 	WARN_ON_ONCE(prev_reader == new_reader);
 
-	cpu_buffer->reader_page->page = new_reader->page;
-	cpu_buffer->reader_page->id = new_reader->id;
-	cpu_buffer->reader_page->read = 0;
-	cpu_buffer->read_stamp = cpu_buffer->reader_page->page->time_stamp;
+	prev_head = new_reader;  /* New reader was also the previous head */
+	new_head = prev_head;
+	rb_inc_page(&new_head);
+	last = prev_head;
+	rb_dec_page(&last);
+
+	/* Clear the old HEAD flag */
+	rb_list_head_clear(cpu_buffer->head_page->list.prev);
+
+	prev_reader->list.next = prev_head->list.next;
+	prev_reader->list.prev = prev_head->list.prev;
+
+	/* Swap prev_reader with new_reader */
+	last->list.next = &prev_reader->list;
+	new_head->list.prev = &prev_reader->list;
+
+	new_reader->list.prev = &new_reader->list;
+	new_reader->list.next = &new_head->list;
+
+	/* Reactivate the HEAD flag */
+	rb_set_list_to_head(&last->list);
+
+	cpu_buffer->head_page = new_head;
+	cpu_buffer->reader_page = new_reader;
+	cpu_buffer->pages = &new_head->list;
+	cpu_buffer->read_stamp = new_reader->page->time_stamp;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
 
 	return rb_page_size(cpu_buffer->reader_page) ? cpu_buffer->reader_page : NULL;
@@ -6150,7 +6213,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_iter *iter;
 
-	if (!cpumask_test_cpu(cpu, buffer->cpumask) || buffer->remote)
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return NULL;
 
 	iter = kzalloc(sizeof(*iter), flags);
-- 
2.53.0.335.g19a08e0c02-goog


