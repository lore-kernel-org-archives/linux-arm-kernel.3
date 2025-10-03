Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75A8CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeES3oT5PyEYk0S7oFEzISO9wFmxktxYre//FfeIR3c=; b=dryZCjwlnnrA0ZcBDT+cDuBdgl
	cylfekEzOmS+cSFV9vp4N6/uIELZeKLjkVCLI1ijcn2s+JT8bn6V4ngRKkmYPZv1/gIRyxRO/3nJn
	D0SdXqaXdNg8YKdq5+v2KhaFOMimL0d+ATEOVwMIXJXjoYFwDf8TWPBLlmLWZ/Uwg4b+PyAvBfD92
	TqnnQHfQpjjLNpdYWlEgpyH4wPrDfpUv+FMqfxJD/D+A0zPzTHnovpfwSfeAm17OMcOn7hBU3RaXP
	U61nqjveH8jZTbjdp0we0TRNXM/32sgbD3avAhD1Yy094XNPgGF4KTEsfa0i4rKeZCwfy56LNVD3Q
	mu/js+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g01-0000000CQ7U-3HHm;
	Fri, 03 Oct 2025 13:39:05 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fzy-0000000CQ3l-3t9h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e41c32209so9804335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498741; x=1760103541; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OeES3oT5PyEYk0S7oFEzISO9wFmxktxYre//FfeIR3c=;
        b=xya49Uy38Umz3t20IQ2Nmrfo8WyMvCxKX3lKL1YiUXWf9Yvd8BtQfVrq4yvlcTIX0/
         Mvj+Zf8883rys57r4WlFp8+J02lxLracxSLs6Llm6ubT6fYrqEKmQieOF+25ynm3wl2L
         GX/fctovKCS0W3TLEGNfe9T4DuC6Rr3zmDtM6YVV/ywy/XuuQd7UszrFaBPsfU8oFVGN
         QCoAVnsUdWGevhubhxfOc7+ZZA74BWTW9cl1QM1uM06Rha0a7W//V6wVOc47Fv0vavhY
         L6bfN6geA/STJetKLPHvYQzdb8Q9EJJCP6KFnkxQrQvp0OXrTNeeCWFJpktkjAOMvnI1
         P1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498741; x=1760103541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OeES3oT5PyEYk0S7oFEzISO9wFmxktxYre//FfeIR3c=;
        b=Zc2VkLxXeeZx2mMg1h7CtZL1y2IWUjxv1SUKP953dGba6yQot4enfrtPGbrOJc56GR
         vCFiorN2E/8q4gJ6xT7tnfDmw9x7NjMUb0WzPTYS7NSb2FlidX2cCQJxlgTao3u8Dapm
         O035LWnEUp22h9YLTjUAQW/rcX3qS+YmFxSXJirO5u5WMzaWvn97LXP2JoaRU3a7eg4J
         ZERvsthKpVWVgY90Vj1RCN8Z/pw/smmUezr+eC6YMb2h7W43ZD857sH4Ke/YCOBIV6+H
         neyMrozqOqdIgEeBTSIO2pJVFDkAkuFBKqtvdXjAOAV3BFSDylsyPjCCDAJD6TuhIgVJ
         +4pg==
X-Forwarded-Encrypted: i=1; AJvYcCUlwNSWFHJm3CjUFws+U8F+h3Re5apqsRZZ4hrckil+cC4ltpkGIFfgPMq/yRQEeixWNTC9vP8q6ACSyLejItRo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy4lH4sm8Rh0JSDOu9kCSSrmhcKot6QknMTdlJeN2qmwDsIm+a
	hVyxzFPoLTigxLNFC9L0BQ9b56zOcovoqJXsXLQaqgnhi9DpGMIMBOllkIM6w2TfwjGhFFeUlu3
	Kc4WmL6m7e0lVovu+IeXCeA==
X-Google-Smtp-Source: AGHT+IGobet5rQpznC+XIhmKIJiRNYXHbeaHBHQTmrC1zAJ4pbkMbv8NZ8mLtntgHPeO+O/7sVs17qI0/PPoX2Bh
X-Received: from wmoo17.prod.google.com ([2002:a05:600d:111:b0:46e:1bcf:3f8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8185:b0:468:7a5a:1494 with SMTP id 5b1f17b1804b1-46e710f6c7amr19128115e9.1.1759498740786;
 Fri, 03 Oct 2025 06:39:00 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:01 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-5-vdonnefort@google.com>
Subject: [PATCH v7 04/28] ring-buffer: Add non-consuming read for ring-buffer remotes
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
X-CRM114-CacheID: sfid-20251003_063902_985029_7E6689CC 
X-CRM114-Status: GOOD (  14.29  )
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
index 54f3f47b392b..eb556e691b5e 100644
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
2.51.0.618.g983fd99d29-goog


