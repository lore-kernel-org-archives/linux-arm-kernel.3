Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB478F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7sVpz3MVsXj7CM/t7DtIsR+dSxsITBD3+AtJrGnMJ8=; b=ctMgN4uxZlZsl86UMKrz3LswE7
	DeHQ8dfqxRnBEi+PDNifE1FiaimrqPF35C2vg0C+14ix5Cdt/Sj9szjZ+X2yPIxklrW06CzqbRaui
	zxXeGFuNeLfooEVEduQwF5fcgd/qskWicyYPtAvPdqgmB2AbIOJqF01gYHXcIrIuonfdFNiJERpsR
	NexW/SayA2N0TEpu4sc5AyzEkUBdIggR3IS2y718dNYqNKR2/MO5jD6PjuHMlMNXd/INqPC7DS+mu
	i+B/exolAGPR/Mc8zJ3TciEqc0ZuAWgbNRmz8yewHDdHmWfPLKeE14JEihoDcahrhTVp/+SPJkSEP
	+ajSs0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQp-00000007gw6-35Rq;
	Mon, 09 Mar 2026 16:26:11 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQk-00000007gpv-2ifk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:07 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-485397788b3so16163305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073564; x=1773678364; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v7sVpz3MVsXj7CM/t7DtIsR+dSxsITBD3+AtJrGnMJ8=;
        b=XMhDpFji0MYS/LBpIxya8DUO2ib9ADcfbmWDHkIsEGbxAb28oEnkIIB3qQdIq7d/jW
         f87/fUT86nSTGkCRFInb/y4X1XyW3iv6Lf+adRmbTRbOyzxDy90C7JwIof0Pgioe7ZWN
         eMod6kwzdiK1PtGqJn7XCuZNajFrxvwSyoKSzvPmEEIKRzEBojrG+65B2oqF8jpRqHh1
         JNQOWm10HceCYSGVFVTdq2wSKFXpd3TndBSP2HqqGuZSKOkCg+kJtIxC6zrDeFnUnucx
         l0Mmu4wDUWHUTGeN9cpbSJR7ZeLc1ukhFx+0YP7ZOD9mjwAEpYmAqmA5xDY9t847zUXF
         vPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073564; x=1773678364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7sVpz3MVsXj7CM/t7DtIsR+dSxsITBD3+AtJrGnMJ8=;
        b=afmaLZT4e8rW1QBHwjQ1eOvJPwDq3B80uO6K1on02IGPUkafsO/d+NMIKrLKBxoY3F
         lc0Qm8dt8jNk493HHmK0YMTNxtQFispHrxWDzr4uV+ef0NceMBIi+vGag+YugUSVl7KC
         SAgSWsUYVmUzN4L5aiwdAgljKPb6n32lbfpEWd5yKr4HeMNLGxL/mF1yZ694DRRx4ZId
         TuibnwzYcx8Sp0vn3+BDCDb1xZzPIeecPYoGuJ1gOSKBtLfZmcaxq/GqoLRbhW2HsapN
         rXxtymyHA4GXKNXZaApLY69gwzn9WAN0pDYrDc6BZsObu7wG+c2uULYP7jA/c/BzP/Y7
         rxUg==
X-Forwarded-Encrypted: i=1; AJvYcCUFqcxCnp7Rs5VItjwLew4SO7y03vIF7iQwZsvK6SGhgsJeOVIo3FhBwg8sjH/zcuL+utDsG+K9CklXCHFQIalL@lists.infradead.org
X-Gm-Message-State: AOJu0YzT6XiDR+mzA8rIdYpXJdmB2MxT6bL7xUSblRoK83nhA7sWCpwV
	BKpGFX6/OL6IEL3NWwUHRY1wmMpV+Qgm/XnDGuXB1A5LqyAR0Y+cHmVuiSTCNGQ1kEgHpBDY7P3
	UOd8kwZAGGXXE/3/dWb81cQ==
X-Received: from wmj24.prod.google.com ([2002:a05:600c:258:b0:485:3890:399c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0c:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-48526923b61mr193565395e9.10.1773073564338;
 Mon, 09 Mar 2026 09:26:04 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:24:50 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-5-vdonnefort@google.com>
Subject: [PATCH v14 04/30] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20260309_092606_703211_182CC5B6 
X-CRM114-Status: GOOD (  14.35  )
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
index 88218377fa29..fb39dd43e00b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5388,10 +5388,51 @@ static bool rb_read_remote_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
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
@@ -5544,7 +5585,7 @@ rb_update_iter_read_stamp(struct ring_buffer_iter *iter,
 static struct buffer_page *
 __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	struct buffer_page *new_reader, *prev_reader;
+	struct buffer_page *new_reader, *prev_reader, *prev_head, *new_head, *last;
 
 	if (!rb_read_remote_meta_page(cpu_buffer))
 		return NULL;
@@ -5568,10 +5609,32 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 
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
@@ -6155,7 +6218,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_iter *iter;
 
-	if (!cpumask_test_cpu(cpu, buffer->cpumask) || buffer->remote)
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return NULL;
 
 	iter = kzalloc_obj(*iter, flags);
-- 
2.53.0.473.g4a7958ca14-goog


