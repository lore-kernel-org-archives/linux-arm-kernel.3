Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C30D79771
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1mZ+ZNkONBjyfcjUN3hF7cGlkHOrtSmM6+OwF5eQuA=; b=ZUXOYMkpTCO0wQWqlbbdjvwx1B
	WKb/8uVL7RUQFqKjdfGLphq3+wzkxx4zf/mgBy/o5UQXGwXsOepP7D0xfhsfAkaL3362fCRQ1zoHD
	N7JJnfXcv3qUbFkuZwm1ktEu5lLtgFmAQeJADRElFO4mMGAGNJ6FzGRTxLqNo1wOSRHdZhlmLtkZ3
	u0U4noUgZvew3o5eM9E4ySUykA5i8UP0oGRqo/f+c9bThUmLv7UH+oxR3w7BgNDKxE6rcjN+gZXyM
	m7TFubtv8gsbz4r+xuoFRN9Hw27jEN5DJFu5tHXkgCf13C1Qmg+wQLYx/LeRLWBxiUowe0ko6IuLP
	hOtrSjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB3Z-00000002cZx-3Tzs;
	Sat, 31 Jan 2026 13:30:33 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmB2h-00000002bvu-2mlW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 13:29:40 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-432db1a9589so1952189f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 05:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769866177; x=1770470977; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1mZ+ZNkONBjyfcjUN3hF7cGlkHOrtSmM6+OwF5eQuA=;
        b=p7kb453XIxzknPJQ8d8diC7Ka1LapSAYl1fIMahfrqWHDQm39ZktYm4CrB8/R0xNJ2
         WQ7BbZxmaa16uQxw3pjNGqMr51jUvj38UJJTiccZUcp4l5imZ7mm9Tpa7G5TnmTA85k7
         c4z1hRA9t89AcjyDRUkAH1GMn6r+rS2I7Jbi5v/DNphz1w4m8238ZNSaCpTtb79/uhxs
         Eojs30vPrWQ0tN70OlxEzzUZjmoyTBT10sgy2STLs8FfJSCS/SebrZeiJF+AhcF0fa4p
         kmT9qNBLQNQUts9efOBdGEe/X/1jYAgkwmRQTTKvtlbH2jOKc0NI6knCp/OuRrWfiBKh
         uCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769866177; x=1770470977;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1mZ+ZNkONBjyfcjUN3hF7cGlkHOrtSmM6+OwF5eQuA=;
        b=PbEZOYfECUhw4IEJAItfp0jC9zIHCDi2fW3L8rS205M4vxM5IF60HVdh1EvtQte3SK
         4FtRH2Pf2BPk/ewWNDyeUnmAQTNIE9i2IO5UxyIiqx09zuU1VTYprPaXcnNjp0l9JQRu
         a7QZ2X05Do7h4vFrG/QiqCpuLFGa3+4JUM8oODYjhO79BzG9AubtmM/hFKH2Ep+pb0Ra
         yxFBwVwNJkY58fCuM7SJiAaYwMxxu6nh4blFWsymlEUix/lFkOv/OOI5c6wTZha3xvgQ
         uyUNrzQJzoC74StfmRPpiBIgvilobbD1QTECqa6ddUxZlxj+l4sNMO0GCu8MgcSeKAys
         J6kw==
X-Forwarded-Encrypted: i=1; AJvYcCWKUVrqN2macbrJjY4bmFEN1xh7Vk0BIQAoPkewrrN/mHHj7FZU77t745XRC6ptazEJ53Eib5yhQxH75ou9BVnk@lists.infradead.org
X-Gm-Message-State: AOJu0YwXeync9O0FmQv2VelR4YwJCoDrmMaKNZhFaJPZ4gKefP1v1GQY
	nfg10+C4wQKwYB5geDLn5AY7sGRoKKyhvc0enfFnMX9O2B4UMnXO6GkkJ4+TO6lxCirnITQgbRi
	i9OSAYnOqBLuME7L/uS3mgg==
X-Received: from wrbek14.prod.google.com ([2002:a05:6000:220e:b0:435:f777:d162])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:3103:b0:435:dbbe:1130 with SMTP id ffacd0b85a97d-435f3a6ca95mr9449773f8f.11.1769866177281;
 Sat, 31 Jan 2026 05:29:37 -0800 (PST)
Date: Sat, 31 Jan 2026 13:28:35 +0000
In-Reply-To: <20260131132848.254084-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260131132848.254084-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131132848.254084-18-vdonnefort@google.com>
Subject: [PATCH v11 17/30] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260131_052939_742624_511F3F2E 
X-CRM114-Status: GOOD (  16.07  )
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

Add load/unload callback used for each admitted page in the ring-buffer.
This will be later useful for the pKVM hypervisor which uses a different
VA space and need to dynamically map/unmap the ring-buffer pages.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/simple_ring_buffer.h b/include/linux/simple_ring_buffer.h
index 2c4c0ae336bc..21aec556293e 100644
--- a/include/linux/simple_ring_buffer.h
+++ b/include/linux/simple_ring_buffer.h
@@ -54,4 +54,12 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
 
 int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
 
+int simple_ring_buffer_init_mm(struct simple_rb_per_cpu *cpu_buffer,
+			       struct simple_buffer_page *bpages,
+			       const struct ring_buffer_desc *desc,
+			       void *(*load_page)(unsigned long va),
+			       void (*unload_page)(void *va));
+
+void simple_ring_buffer_unload_mm(struct simple_rb_per_cpu *cpu_buffer,
+				  void (*unload_page)(void *));
 #endif
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 88afd28ffef7..2adfeb5a8f4d 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -71,7 +71,7 @@ static void simple_bpage_reset(struct simple_buffer_page *bpage)
 	local_set(&bpage->page->commit, 0);
 }
 
-static void simple_bpage_init(struct simple_buffer_page *bpage, unsigned long page)
+static void simple_bpage_init(struct simple_buffer_page *bpage, void *page)
 {
 	INIT_LIST_HEAD(&bpage->link);
 	bpage->page = (struct buffer_data_page *)page;
@@ -376,19 +376,15 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_reset);
 
-/**
- * simple_ring_buffer_init - Init @cpu_buffer based on @desc
- *
- * @cpu_buffer:	A simple_rb_per_cpu buffer to init, allocated by the caller.
- * @bpages:	Array of simple_buffer_pages, with as many elements as @desc->nr_page_va
- * @desc:	A ring_buffer_desc
- *
- * Returns: 0 on success or -EINVAL if the content of @desc is invalid
- */
-int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
-			    const struct ring_buffer_desc *desc)
+int simple_ring_buffer_init_mm(struct simple_rb_per_cpu *cpu_buffer,
+			       struct simple_buffer_page *bpages,
+			       const struct ring_buffer_desc *desc,
+			       void *(*load_page)(unsigned long va),
+			       void (*unload_page)(void *va))
 {
 	struct simple_buffer_page *bpage = bpages;
+	int ret = 0;
+	void *page;
 	int i;
 
 	/* At least 1 reader page and two pages in the ring-buffer */
@@ -397,15 +393,22 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 
 	memset(cpu_buffer, 0, sizeof(*cpu_buffer));
 
-	cpu_buffer->bpages = bpages;
+	cpu_buffer->meta = load_page(desc->meta_va);
+	if (!cpu_buffer->meta)
+		return -EINVAL;
 
-	cpu_buffer->meta = (void *)desc->meta_va;
 	memset(cpu_buffer->meta, 0, sizeof(*cpu_buffer->meta));
 	cpu_buffer->meta->meta_page_size = PAGE_SIZE;
 	cpu_buffer->meta->nr_subbufs = cpu_buffer->nr_pages;
 
 	/* The reader page is not part of the ring initially */
-	simple_bpage_init(bpage, desc->page_va[0]);
+	page = load_page(desc->page_va[0]);
+	if (!page) {
+		unload_page(cpu_buffer->meta);
+		return -EINVAL;
+	}
+
+	simple_bpage_init(bpage, page);
 	bpage->id = 0;
 
 	cpu_buffer->nr_pages = 1;
@@ -415,7 +418,13 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 	cpu_buffer->head_page = bpage + 1;
 
 	for (i = 1; i < desc->nr_page_va; i++) {
-		simple_bpage_init(++bpage, desc->page_va[i]);
+		page = load_page(desc->page_va[i]);
+		if (!page) {
+			ret = -EINVAL;
+			break;
+		}
+
+		simple_bpage_init(++bpage, page);
 
 		bpage->link.next = &(bpage + 1)->link;
 		bpage->link.prev = &(bpage - 1)->link;
@@ -424,6 +433,14 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 		cpu_buffer->nr_pages = i + 1;
 	}
 
+	if (ret) {
+		for (i--; i >= 0; i--)
+			unload_page((void *)desc->page_va[i]);
+		unload_page(cpu_buffer->meta);
+
+		return ret;
+	}
+
 	/* Close the ring */
 	bpage->link.next = &cpu_buffer->tail_page->link;
 	cpu_buffer->tail_page->link.prev = &bpage->link;
@@ -431,25 +448,50 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 	/* The last init'ed page points to the head page */
 	simple_bpage_set_head_link(bpage);
 
+	cpu_buffer->bpages = bpages;
+
 	return 0;
 }
-EXPORT_SYMBOL_GPL(simple_ring_buffer_init);
+
+static void *__load_page(unsigned long page)
+{
+	return (void *)page;
+}
+
+static void __unload_page(void *page) { }
 
 /**
- * simple_ring_buffer_unload - Prepare @cpu_buffer for deletion
+ * simple_ring_buffer_init - Init @cpu_buffer based on @desc
  *
- * @cpu_buffer:	A simple_rb_per_cpu that will be deleted.
+ * @cpu_buffer:	A simple_rb_per_cpu buffer to init, allocated by the caller.
+ * @bpages:	Array of simple_buffer_pages, with as many elements as @desc->nr_page_va
+ * @desc:	A ring_buffer_desc
+ *
+ * Returns: 0 on success or -EINVAL if the content of @desc is invalid
  */
-void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc)
 {
+	return simple_ring_buffer_init_mm(cpu_buffer, bpages, desc, __load_page, __unload_page);
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_init);
+
+void simple_ring_buffer_unload_mm(struct simple_rb_per_cpu *cpu_buffer,
+				  void (*unload_page)(void *))
+{
+	int p;
+
 	if (!simple_rb_loaded(cpu_buffer))
 		return;
 
 	simple_rb_enable_tracing(cpu_buffer, false);
 
+	unload_page(cpu_buffer->meta);
+	for (p = 0; p < cpu_buffer->nr_pages; p++)
+		unload_page(cpu_buffer->bpages[p].page);
+
 	cpu_buffer->bpages = NULL;
 }
-EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
 
 /**
  * simple_ring_buffer_enable_tracing - Enable or disable writing to @cpu_buffer
@@ -459,6 +501,12 @@ EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
  *
  * Returns 0 on success or -ENODEV if @cpu_buffer was unloaded
  */
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	return simple_ring_buffer_unload_mm(cpu_buffer, __unload_page);
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
+
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
 {
 	if (!simple_rb_loaded(cpu_buffer))
-- 
2.53.0.rc1.225.gd81095ad13-goog


