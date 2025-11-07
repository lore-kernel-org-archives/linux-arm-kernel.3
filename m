Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD5BCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C27VVD3vAqywTmo/NjVnuVPbtNW3I4H1LRWKbq+VenU=; b=fvj2PINvYw+bP584CdKzRcyW6J
	IfEaSFhOPsj9x3XmWzQKegZUuY0PvFN5GmwB62Nl6FLWhph+VLrB1+m9Lg2jIdK9q0a9oHogTQBO5
	nXmSNiRALZqqCc+kr2HTuDHyxnWdtRxeao3BuHw5kzcnnDxcuHo3mtiCvwhgw2F3ypbqCUdeP4J05
	DebJx/fXBQuqihvtFwyrdm6rPG45gTu6pWP34OXROLFDsIABGgJidiL3BI5jv2U+S75KVv+Zyruy9
	QdYkFGvBSlr/AGI3LDFG/y38ui0VedkzXbjxl0LPB8XKtTnBSektbtrz5pVAW0y8hkFMbdHwShAFy
	tV+tOzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvt-0000000GySa-1yUY;
	Fri, 07 Nov 2025 09:39:01 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvl-0000000GyMS-42V9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:38:55 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-470fd92ad57so6031135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508332; x=1763113132; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C27VVD3vAqywTmo/NjVnuVPbtNW3I4H1LRWKbq+VenU=;
        b=apjpvUR6KgylP6N4aFx3ydhF3lm17Z7wz9AoV8p9KOMaryZeAgkrcg53sZZe0zET2s
         Vuifd6SlgFx78c+cILZ1uWXe4xafd2pR6auJ2a3e/M9/jl3Nm3kJ86aEJueLJO0hrBBf
         q3JsNwxuUuUKgmMDtNoeIvUTsYu9f+/E91rBJOFWwXBu0O74Hf9ls+eFaZGCFwOVo/mN
         Qo30GJxabgdepJbyz7mTs/VyGz6PPTACVBfV+u949pqQ8EPedJCIEM2IT+SUlI2ZlzSe
         lIKqLyqKFMQ9VtsSLfFmgrlzX7fUiHkeT1JqNvrGAy5rSKi/TdVn2hyZZlcdkYa43r4+
         ahtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508332; x=1763113132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C27VVD3vAqywTmo/NjVnuVPbtNW3I4H1LRWKbq+VenU=;
        b=I1X+hWDYaeIdzjB2teCTawm2S1pxznPBg+J4GP6owFT3JF3Qy/gLeGsv8+iw/yGwSy
         VulW/XAsegPXruVxzYSndvly/4jYBf2R+ZVnYviG1uTQp7hSVOks2tV/ZYrpRTkz9GEx
         kgJb96IxfoIGxqesmHRwnOTbduCtLqunGeOw2+Jja82UqxMnTvW2wYYixpepPBVHvS4D
         LsRe6kNSy+WQ8tWNkfbamtEtwl93kc+7ldavzRxOevsw6fUVrcVOaF3My7xOmxQfwfuV
         5NugT4WIpIcO1yZDSqC22ogYMnzSYxS+uSskQ2NP/OhnJ2b4BZ/LQghGqyDN3OhY43mJ
         6Q8w==
X-Forwarded-Encrypted: i=1; AJvYcCUcoiY8brTn/RwPXYImXQHbY00fVWxvREsNlp/T+BRRAzd728RCwDVc1hLahLdsjIWQS//rTHNHqMCSfJnxAeWD@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/OHWZvlvTgf7R6isnSR//sfkzvatTmkDrMqKL1zA0CudBXka
	E45OZRcD3njuv2sGw71avgZMJZNV5R6J2UWvsq5A5b/t5tiZ8dR7AqrOicqdgSLftv5pgRS26sG
	we9fKPzLY+bgWv+q21cnzUg==
X-Google-Smtp-Source: AGHT+IGiQlhEUR6uXQZBOgfev2nnadl/wwtET3p/vSwvp4472FXmHSv/qhH8vVord0fI+bybrIdYpQbMBbA3Mg27
X-Received: from wmbg24.prod.google.com ([2002:a05:600c:a418:b0:46e:5603:f679])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f08:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-4776bc871e1mr20848605e9.2.1762508332036;
 Fri, 07 Nov 2025 01:38:52 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:16 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-5-vdonnefort@google.com>
Subject: [PATCH v8 04/28] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20251107_013854_044378_DAC1390D 
X-CRM114-Status: GOOD (  13.89  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1d300189f261..4cc5da5cdc87 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5347,10 +5347,51 @@ static bool rb_read_remote_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
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
@@ -5503,7 +5544,7 @@ rb_update_iter_read_stamp(struct ring_buffer_iter *iter,
 static struct buffer_page *
 __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	struct buffer_page *new_reader, *prev_reader;
+	struct buffer_page *new_reader, *prev_reader, *prev_head, *new_head, *last;
 
 	if (!rb_read_remote_meta_page(cpu_buffer))
 		return NULL;
@@ -5527,10 +5568,32 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 
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
@@ -6114,7 +6177,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_iter *iter;
 
-	if (!cpumask_test_cpu(cpu, buffer->cpumask) || buffer->remote)
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return NULL;
 
 	iter = kzalloc(sizeof(*iter), flags);
-- 
2.51.2.1041.gc1ab5b90ca-goog


