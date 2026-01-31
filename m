Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6236D7976B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj+W/fw6jviNtcb7rjWbgliWocDtdFOtxpsoa7nbJ6s=; b=VazQmW6QADzDgb2Ko5YQAb+qCF
	zoum+89MH1AVLkzjHkum+MhD3Nte3wdDBDVREiUYEyRAiCElLkBoJN1e7AmdnfsN9FHENoZDMDzZQ
	2TBiNu6GhA+nKVD2qN+HDxwOu72JoPyJiSDM5xidWKKaZpKLJKBsS8+6E/z8vLRSPAxCuTCLwCo3k
	foej3EyDUyn5vA5BByAFmQQuH2Urr+/l3ve/EptX79y5N8cN0HOxR+qZbbeuj8umOPh9FetBJDmxb
	0eM6B40zuv1/EyefFu/r4J0K/WqI6zlDZfXp+J0B+ddU2sAGPJDE/fouMc+HKDN6/iodZtEpuptdh
	9b+Z49yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2g-00000002bvz-0hz9;
	Sat, 31 Jan 2026 13:29:38 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2V-00000002bpK-33jm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:28 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4806cfffca6so32374425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866165; x=1770470965; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uj+W/fw6jviNtcb7rjWbgliWocDtdFOtxpsoa7nbJ6s=;
        b=mmXKQpXDnMtDC1jSJ1/lU1vZ2uO3WsVh2qkKOyLwZWG2zahZZDMu6AhRb1MrBm13Ao
         EwFkurS3Zcxbczd3cQnzBoBjmI+Rj3YdC8R4+DlwJH3dqDkkrqTym+Vo2/sos+nGWE1L
         01Ju+UtImrfTnwjpLJvr9cx1PnGmrtJr8uJ+ncgzmmTwDjDMuqWMgQppIQBuyoVt1oQ7
         YhMy3jiXPHVBAzNetm8EhzC44DyV3HKlf1wYQszo54/eM0zpVhoq1/ToCRTgiHaM9aSP
         /wD3tYzy1/eY4axWzrX8yu3l5AXxt7jQSjs2tjeqRIko9oPaKi1xu0Wpmtxr+5rySEHf
         TrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866165; x=1770470965;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uj+W/fw6jviNtcb7rjWbgliWocDtdFOtxpsoa7nbJ6s=;
        b=Mi2s5XNjTN9jR4DBpC3HsWVZ0tK7AUTmzVSru9mR3MzMm5BEqzY+mfdKHTgb+WPO9Y
         2vHEGpwpf6G9CCebwp3ZnSbYNCMI8X3DF9jOAhH026QzAidoGo1sT/lp/HBjBM6StV9D
         U/qqJzoqFziCIcYJOchbT24knA/7BMn+d8ZmSjW8bUBSDMACwaldV7YXsfoQxmFrhjwj
         H97D5SDJ2Q6wVY2MyNOje9cJlmXrC8NcY66f6vf5//WbCrGyHgxQyXXdRYmGceCl/b8/
         Gml253iyzumbP3rWThJOZRrMrV4ac7r/Eqs84U3olLQCya2YJM6PBFKnllpzqXi9Lc00
         oXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhPjyQ3PtUVjp8lrHDvIgCVM3A4MLlqRNHNRcXjy4J/st+YF7FJeP3RMvfZGoZfT1vltcRmLnYlv80enPUf/z4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc8UiLyIBoJwJO4uHwwkg7au6TBPFWK4MykF01MXI7sxuPWoG7
	SjJBbWeUjkCxE1voGle1zg69aL2M03NbwA0ijNymYyBorRsOu+ohtcM1ADhr0PPh8dijQRF78QU
	IoaVI2CHOWu5bKrE2SMyoZw==
X-Received: from wmju1.prod.google.com ([2002:a7b:cb01:0:b0:480:6b8b:a7ab])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b42:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-482db49728bmr62880405e9.32.1769866165397;
 Sat, 31 Jan 2026 05:29:25 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:22 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-5-vdonnefort@google.com>
Subject: [PATCH v11 04/30] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20260131_052927_789165_1D632B0A 
X-CRM114-Status: GOOD (  13.64  )
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
index 00754339733d..2d08dd326309 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5365,10 +5365,51 @@ static bool rb_read_remote_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
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
@@ -5521,7 +5562,7 @@ rb_update_iter_read_stamp(struct ring_buffer_iter *iter,
 static struct buffer_page *
 __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 {
-	struct buffer_page *new_reader, *prev_reader;
+	struct buffer_page *new_reader, *prev_reader, *prev_head, *new_head, *last;
 
 	if (!rb_read_remote_meta_page(cpu_buffer))
 		return NULL;
@@ -5545,10 +5586,32 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 
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
@@ -6132,7 +6195,7 @@ ring_buffer_read_start(struct trace_buffer *buffer, int cpu, gfp_t flags)
 	struct ring_buffer_per_cpu *cpu_buffer;
 	struct ring_buffer_iter *iter;
 
-	if (!cpumask_test_cpu(cpu, buffer->cpumask) || buffer->remote)
+	if (!cpumask_test_cpu(cpu, buffer->cpumask))
 		return NULL;
 
 	iter = kzalloc(sizeof(*iter), flags);
-- 
2.53.0.rc1.225.gd81095ad13-goog


