Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1DEF33A92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScN1NtxqIf/BVWk6GfS8Edcv4lujSSl4suwU/Na612k=; b=yZ2fNeg5N6YhwBYIxKCupTgF06
	wKELSnzAabLhfTyqWzh5ptV7QVtG2ztXwlqbU5A3JQIYEU9go/sQAEqeY4FxA+UPrs4YSjqq9x2e3
	iOH+VgX3SaDxYK0SeAdZxcHhXwwfjGF8qehjsUlBlriogfGZXzVjU1dKZ1BOorn9uibg/tzIHp4Go
	HiRtz6VLzscUPb4B1f9+y4sS25hiIOiGYKZinQfOhIARJp6yi99gmnqi0KnEkO9MVWSzZmAluTNXl
	qvZMxhNLlv3fIk0KOVGgafcFehiDiMimW3xA+qFhh1GUegjXBHCIpArKnjrwr3X6TMGVGCLTUM+bM
	fBF6ovqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHd-00000003v37-0ORf;
	Fri, 06 Mar 2026 14:36:05 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHW-00000003uxT-2Pvn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:35:59 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48071615686so79867315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807756; x=1773412556; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ScN1NtxqIf/BVWk6GfS8Edcv4lujSSl4suwU/Na612k=;
        b=mRnyUgEYVjDrF1qx8+4IFgIuB+is8iC36uoAyBUfnLAEXPSly/IdBRmIeiOiG2RWX3
         XYweZcXvLYECNkU6J7FuEYUgarY6Amf4Nb2NLeexrFLvrj8bup/NVJOBecioHVNGF3Ht
         l3tZ3Ojq/aG5QmqIFz4Oti4IIESRa+emoNy1ZBGMwr485rrh8O62liT3Kg9zzRY76ddT
         aDqcVlArSUy7RUvdF3EDyaoxgkcnXs9XKga3I8LZKqk6npHbatBIMwujnr+I1igOLhkU
         mRHCHbRHDPA6W55H1S/eahZD/rphfysNodcTZMw3JlzEoJcPiMUnLFeOipcjfECW+d3l
         IDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807756; x=1773412556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ScN1NtxqIf/BVWk6GfS8Edcv4lujSSl4suwU/Na612k=;
        b=QKTJpCHTHaTQzdvBiEsSRErqCbpx+gS4K9ki4o4O8CJFeHkoeWv7cu38aHY3h5heRL
         nfvhtsVs1xrs14z8PK4wrJoITQ6jA7rKZ8gFvnkdwXIowe2Du2MavhQ0QDDEvh5N6zNt
         xnaU7geSNKSkc/KrhPuee8Zx/dK6SEhg+jiasmtUiOI+VymIcDSYYLjWjIs/WTKdTO33
         yUGPmpWD0lc5nGVPArfdG/RPOn4vYXwOVOAUSdrF2p2YLrxD1GqogVAzdRbDEyPsFBqz
         sVuH+R3i/xZJelTwHlnwUpMgLCBKJVtxKPqqd1FZb2CeunoAsY8rLG8zs2DmEeDp11vP
         Cybw==
X-Forwarded-Encrypted: i=1; AJvYcCUx3hQqB8xbNqhEZBso3tRLYAZXSj8BDaByqStkn0YCA3LZbmzwVAqD56m2dJkG4asxxNyEhqtEbQbb+A0YUAHy@lists.infradead.org
X-Gm-Message-State: AOJu0YwlaAToIFFTX7ZUPamKoQbiPImXzTb+v95i2z/2WjSOH8R8728A
	y17BjeICpLQv+8VlxVWATBNWTEO4DS6k8F7H832/3lIqSLIq9YKPF5cHvID8MvvWxs5Yd7srk9G
	VMb6QzQnAbTJ0UhrIcXw5QA==
X-Received: from wmcu23.prod.google.com ([2002:a7b:c057:0:b0:483:2758:404d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b5b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48526927a4dmr39013355e9.15.1772807756248;
 Fri, 06 Mar 2026 06:35:56 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:08 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-5-vdonnefort@google.com>
Subject: [PATCH v13 04/32] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20260306_063558_641310_4467C251 
X-CRM114-Status: GOOD (  13.72  )
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
index da0cd8e82105..115435f2e8b9 100644
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


