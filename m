Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0788DCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc6LimOXID+Bku1FEoRJ/EirmTeTKYklVJFEb8YK50Y=; b=u+qwUtII4BQpGyxUWbWkfk+W7b
	wUJnx7Bo5J6RL9oQ94bCtBm6Mn8yeE1YHuYV2+x9ny318RLLifho+AZykU82hegxYJjjULkBOLcDP
	BCkGeJjwu4qlsqSQ2wAKOVmx1mCdjKjykKAjTQ7jziUOdPQ5kGTRHXnxzZBmZsxNaSaAwl7gQGm00
	WPtkMLBdoX+TFxM9Lx5fs6trc9v30c5oQzZMdPs2EUfcSXhap45RTzwYbRmnEK+eYcw4CJNlRx+Ww
	qC1kqjdBxkKgBBYqnHi78ANvD5ajLxI5y8qhy7c0Y+mA8BswUgT+Gkk8+qdlqJKYtkzlFxjBpwU62
	zI+K/iyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fzz-0000000CQ4x-2Ogd;
	Fri, 03 Oct 2025 13:39:03 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fzx-0000000CQ37-11Ud
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:02 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3ee1365964cso1750321f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498739; x=1760103539; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bc6LimOXID+Bku1FEoRJ/EirmTeTKYklVJFEb8YK50Y=;
        b=nCzxZVzZz5Zy+emtm12pi/TIOboCpQwNXi17kC0g8fiFskFLc8UZZI2HggQlvQlMqY
         yiQWCnwy7X/+duALMfKxUjcGjTw3OsUpLEEIr2owYfxGuIY5v6OSuejqjquJQx+VpFvf
         IHuzidE59vWDcbAIUaaGMm9lcjpSx9HCEaG2ndVJ3LbjDElacoX0j/pJZYhwi79RWqHY
         5aSE/2YCwk+9O1AOP5ECtKuzdEYdu66aHG7w2pS1ENtXwGVp+PRTHjBl5EF0a9VQ+khu
         0ZKDEQ5L2eNoWIRdfO/hsepLiIwoprWlLmN3+2fkU524+OHPUcMBVtlx2HN+CSQMg/UN
         b8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498739; x=1760103539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bc6LimOXID+Bku1FEoRJ/EirmTeTKYklVJFEb8YK50Y=;
        b=UO6rUZHeamzQFHpZtdNJDAky9YeogKbA1iuJsj8IVuSWyo0qdLzrrvCw4uKjGH9u4b
         pBS3CNm+KVZVju0NpIr9hSzjq7UiNY52NNf6GN1GpJ2axzyUgGxIz+AMVgfmJl0DAl+7
         UmUYh/6Lwv21YyzylWDK9slLL062cFggFdqaxNxweoRmT0W02hpkWmtI7f9t/WY3oXeC
         4XmBtErkPnj784ycmNJpn7aBSLg/90FgNEy/5dIpiGfGKkjmYKv3i2FS5JA7i6ypI5ca
         U9VQvLFXFQ9HXkz7gPnbZOYX+tGyvKkyU+HhhKaKKRk/0zbv3BJi4cbYish9Hv3rznr9
         crzA==
X-Forwarded-Encrypted: i=1; AJvYcCXlor+94rXaAZKL76Pa+g60aIlZ/SpDPYhRxIAks0UMBwHnopQ9CjuZddOeXf3c9bN85QOS+0o0kJfbS96+oEgw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0EW4eaUQPuuKm6Eek18mAjrWPe8HlpZZabf8iQgdHoqpmUEWW
	Sh9nGsnHAzzJ9ZCVUmDbe5s7m9Effk/gc/yjlMDRXNUOilGGct+M6hvEVIg/kV8eFtiCtWNWDdH
	BxpBVm8WaAfOR6gLgpaG7Hg==
X-Google-Smtp-Source: AGHT+IFA6VPDBbC1e+6gIWe9mwwubSc0dOt0/SMKjx4g1e9RJBwOm822bx7bReAGfXOd+prKSqJyKXuvGPwSOwjw
X-Received: from wmbjv25.prod.google.com ([2002:a05:600c:5719:b0:46e:2640:aa83])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-46e7110adfcmr22140975e9.12.1759498738728;
 Fri, 03 Oct 2025 06:38:58 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:37:59 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-3-vdonnefort@google.com>
Subject: [PATCH v7 02/28] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20251003_063901_301927_8BCE511F 
X-CRM114-Status: GOOD (  15.60  )
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

The subbuf_ids field allows to point to a specific page from the
ring-buffer based on its ID. As a preparation or the upcoming
ring-buffer remote support, point this array to the buffer_page instead
of the buffer_data_page.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 2c157cb86989..e5846f8f3c07 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -519,7 +519,7 @@ struct ring_buffer_per_cpu {
 	unsigned int			mapped;
 	unsigned int			user_mapped;	/* user space mapping */
 	struct mutex			mapping_lock;
-	unsigned long			*subbuf_ids;	/* ID to subbuf VA */
+	struct buffer_page		**subbuf_ids;	/* ID to subbuf VA */
 	struct trace_buffer_meta	*meta_page;
 	struct ring_buffer_cpu_meta	*ring_meta;
 
@@ -7002,7 +7002,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7011,7 +7011,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7021,7 +7021,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7030,7 +7030,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7186,13 +7186,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
 	}
 
 	while (p < nr_pages) {
+		struct buffer_page *subbuf;
 		struct page *page;
 		int off = 0;
 
 		if (WARN_ON_ONCE(s >= nr_subbufs))
 			return -EINVAL;
 
-		page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
+		subbuf = cpu_buffer->subbuf_ids[s];
+		page = virt_to_page((void *)subbuf->page);
 
 		for (; off < (1 << (subbuf_order)); off++, page++) {
 			if (p >= nr_pages)
@@ -7219,7 +7221,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7243,7 +7246,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.51.0.618.g983fd99d29-goog


