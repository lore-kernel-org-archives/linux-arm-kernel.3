Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8265EE9A050
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9+ARIgqsEga7ypKxJEyYbrKnJKwPy+BmaCOQYOBhWM=; b=jAfGxlolCYb1aNjU506Idc0KRo
	2exlLG9xwVvJIeP+RR9bmyvThwtP2GRTLgfGWhVxigKEamvcIIA2Xu0UN23U/KN8YVlyAWhQxCjKn
	LtCrHG6B+VmWFFqQKFaSt0cwUHkkzSt23E9s/y9fjqm7DCl49EEHUtxoU2nI2j1pLe+zXIhIHTmDM
	Hx1vvy12ahgiVTZ5q0JJ30OVeTjzYhhZHdgFSITKhDKJTvyAyndy9B+y4mNktISXshaz5O+CfthxS
	GzlObeee7xImc4KXsEaSsHFPcfOsQU3/3OGS0g7TQlkQR/V/jL4/2eonqtXWtNKuj/bxWmit2YZQb
	TNDm3f7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZY-0000000BVS4-3eLP;
	Thu, 19 Feb 2026 15:04:08 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Z7-0000000BUrm-1922
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:46 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-65c13e2123dso1007008a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513419; x=1772118219; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9+ARIgqsEga7ypKxJEyYbrKnJKwPy+BmaCOQYOBhWM=;
        b=g+a7j/OfuZj+8lZGHode9rPVnUeI1NPq5mpuv4+LbHCcQThHfVuNTUKrmr1nRuLFVp
         vX1pkzOdqx1N4W+KKUmeFIXEltBvYn0bbqY5UHMYmVJk3qgyjqS0NMMRzFto2tAFZORk
         5nOuVF6KC4uodaIqdNYoJCQIugLNXY7MoJCDtX/Y2Fjf7HNrWCzZa/CgEVmn68OwzsE6
         +Jz2W8BT2i4DpjJBRO+ZmwMOqd2kj2qnvLt6zj/9xkCIpYD3rN8ubzYsW70kaBNXOxvL
         Qjw8M06XkGvIU9NIcHXphKCJgdsMaP68Z3ifaoETsL9DM7YFLd9SvWAjYgo4B33m3BsB
         oJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513419; x=1772118219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9+ARIgqsEga7ypKxJEyYbrKnJKwPy+BmaCOQYOBhWM=;
        b=u2LEpk8C9tMDdF4dvMxcS8AwLJlIo/SmAbFOu2i7zHJH3pKP0uHfvDhzXVbb9cfBCW
         4zBAZWm8yOBpJ+cyI75wUngqN9gX10NCirb7jCeMLCrqzEAbooaRfrFOB/bK7SsnWV3m
         CDSKRvXb7m5mSIZzlmb9Zq7NznTFPHR4G627Z6G9ynAD8b4qOAaFGI8v6n/xY0m3toxx
         vCh+xZoiH2BXTTvKA0USrFBqZhZ5w1ARss543YsHOGcOjpNrwTFLjGqRZL7rJeq15/zD
         Wxygc9sP0/6pbJeRsJ34OU6Hi+VTeIjcOP2xGAKXg7NIn+bdDG9ssjSj6nqZg5smh8rg
         x3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt+2HXO4iXYwJug+kqo0eVEhveyN432IAzL6G4Zq2FvKGKMrxOyB7q+e27O+bY4JT495mAGiODXOlUJ8qI7S/P@lists.infradead.org
X-Gm-Message-State: AOJu0Yyol7+9E2MuAhEAfniYBqNj/DxCuERjTqfw1JusKkM3+TntezZY
	d/ZzDJbZRk4Ar0b8gM7ar8aF2Ry9TiI0xEeqT+zMzJ2llGYzORc0fEl2z1Pi/tiKqppxPoBoQoC
	hO0q0MWQGdJUq9go7j4b2Cg==
X-Received: from edzd2.prod.google.com ([2002:a05:6402:8c2:b0:65a:3686:71b9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5188:b0:659:329a:bc10 with SMTP id 4fb4d7f45d1cf-65bc7a7622bmr9740227a12.18.1771513418420;
 Thu, 19 Feb 2026 07:03:38 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:54 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-18-vdonnefort@google.com>
Subject: [PATCH v12 17/30] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260219_070343_400253_A90102C5 
X-CRM114-Status: GOOD (  16.71  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
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
index 15df9781411b..02af2297ae5a 100644
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
@@ -372,18 +372,15 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_reset);
 
-/**
- * simple_ring_buffer_init - Init @cpu_buffer based on @desc
- * @cpu_buffer:	A simple_rb_per_cpu buffer to init, allocated by the caller.
- * @bpages:	Array of simple_buffer_pages, with as many elements as @desc->nr_page_va
- * @desc:	A ring_buffer_desc
- *
- * Returns 0 on success or -EINVAL if the content of @desc is invalid
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
@@ -392,15 +389,22 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 
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
@@ -410,7 +414,13 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
@@ -419,6 +429,14 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
@@ -426,23 +444,58 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
- * @cpu_buffer:	A simple_rb_per_cpu that will be deleted.
+ * simple_ring_buffer_init - Init @cpu_buffer based on @desc
+ * @cpu_buffer:	A simple_rb_per_cpu buffer to init, allocated by the caller.
+ * @bpages:	Array of simple_buffer_pages, with as many elements as @desc->nr_page_va
+ * @desc:	A ring_buffer_desc
+ *
+ * Returns 0 on success or -EINVAL if the content of @desc is invalid
  */
-void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc)
+{
+	return simple_ring_buffer_init_mm(cpu_buffer, bpages, desc, __load_page, __unload_page);
+}
+EXPORT_SYMBOL_GPL(simple_ring_buffer_init);
+
+void simple_ring_buffer_unload_mm(struct simple_rb_per_cpu *cpu_buffer,
+				  void (*unload_page)(void *))
 {
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
+
+/**
+ * simple_ring_buffer_unload - Prepare @cpu_buffer for deletion
+ * @cpu_buffer:	A simple_rb_per_cpu that will be deleted.
+ */
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	return simple_ring_buffer_unload_mm(cpu_buffer, __unload_page);
+}
 EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
 
 /**
-- 
2.53.0.335.g19a08e0c02-goog


