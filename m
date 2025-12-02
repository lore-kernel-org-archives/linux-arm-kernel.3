Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED7ECFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmnmPnoKS58rysqE29lUfzlQEDVMTKJ+Y24/6OpLVn4=; b=mhXVj5Z0Ol4UwlUk1neV2IPW/U
	rg04sUUNuEzAgf0UwdVngXi+MlCKAjzB/ZwLIT05vodycd0Loj/TjGqY+iOv4UkGsOy4OjhrM6h4X
	mre0V0+j70GFOeQAGNImPUVgmS4p1HC5VuzTxRpPAf1pR9SRh6g386/yHhaXlpA9Phjn2vBZO2Pqv
	+Oz5PQryKTTpfOk5SjnBnRh662Gz1rtVZPstwmbpCbm7EHersRVJF3ujcSI9RFsjsUH4Ag8GuY3/x
	enizLB1jrmuwF0WAOGS79WwypqHezSF5DyLaBnVE48SzZFxAgi24TyOLhmptUw5oB7OtZKsB0soye
	FBX66RqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoL-000000057wy-0nHE;
	Tue, 02 Dec 2025 09:36:41 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoH-000000057sP-1udW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:38 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so35930905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668195; x=1765272995; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmnmPnoKS58rysqE29lUfzlQEDVMTKJ+Y24/6OpLVn4=;
        b=aPs/oAmoLvPUV64yO1KwMOBqugDWhuTlK04W6GGG3dQDHTe8SL430ElaUXjPRojkWI
         bzLdiKRMceE3xB7NBFS0mY/wCNRnSbvSAR6NKnJnamATqAi8USFuqnD+LPvQltr39DGd
         FFaDvhT8W5VbfRFeZgnVBNfyxmCzK3GiUv5UKBXxS3qa1MQqzTSqm0HLr76GTR72Ko6A
         3kGwOz1NyKCd22WKM8RtS4Lu98FRvpWtAs3s4ArPZQwdVYq4T4vapQc0v518NGl6L6AX
         SOvu12PO3U3gHDNYtf+RIVTHS23djGvuamwuFwNoIB1zkHc7WOOXThS+1X30ud5eT6Ac
         z9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668195; x=1765272995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmnmPnoKS58rysqE29lUfzlQEDVMTKJ+Y24/6OpLVn4=;
        b=FaheWDfYQnux8sOaYV+1ifZ2in67pwbxpykiay25FQbtkjGGg9FW/+W0kIgJaukh3x
         MDbtR9JeQbeHW5DxpSOZHerF+OsWpLSXTY7qivj2YtYoNyzGuVIjikOmheDrNAF1kxCK
         mGQpQkUFNoviuADi6L8we4GNmfjL9WmFMvU+V6X8a0RgAQh66DgzZ6XFrD3rKJbHHX2+
         SENw+gDcmmPl5XK07acIEK6SgRo6qPUTd7DNCXykk7F6aHRK40RNmM/HeP07sxgdCucv
         eucm1/QrpVpDwURggZXVIkOVxKC0u+n9lCDYLmxNzSiOxWHwGAz0Rbe8qWCd1Z4m8r/9
         VorQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwjsgYXbBV8vE/4ZEuQIV+0j/uHEQtZ+pANDeuIIffanSX4N1h3JH6qGzM30wsRH0eAmqIPqca0HEZzpr/zWuo@lists.infradead.org
X-Gm-Message-State: AOJu0YyfYlF5GoAcRVYT858gpsHmAGQp7EvZiEnv5nN8+EDkDNNmW6vp
	pSldQ/acXuBnKlMGwXzLvUQxkOpNqY0TtpSq8ReGmpLsxuc4EIIpS5c+wlziVTMoYWPKG/0K0sx
	+QY9RN9X7rFDjT1AycTe6Cg==
X-Google-Smtp-Source: AGHT+IHxpU2RjXgPE3dFyHp+bs/wQ2ZJ3c3K0tGZhcA9ODepkf14EOjrYCgHkcicrP7QgAeOjeYJEOgEjUddT/jk
X-Received: from wmdn1.prod.google.com ([2002:a05:600c:2941:b0:477:103e:8e30])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f0f:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-477c0165bb8mr406176625e9.3.1764668195451;
 Tue, 02 Dec 2025 01:36:35 -0800 (PST)
Date: Tue,  2 Dec 2025 09:35:57 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-5-vdonnefort@google.com>
Subject: [PATCH v9 04/30] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20251202_013637_542829_E0FB89CC 
X-CRM114-Status: GOOD (  14.13  )
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
index 9c6c8e206e04..cb674a9fc359 100644
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
2.52.0.107.ga0afd4fd5b-goog


