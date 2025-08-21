Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117FECA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFT6WngKMwHZUnIYZ6NFySqzw0d5WuAMHkLFTx3V41Q=; b=HkbezAVGVDTK07k7fkPC38fJ3n
	wveVnw+dXlMnoVm8dQ5xIhobh4rT13UK7IhUbwHIULEPRVGX3YJ903BYDtkAzPCIZ9VaW6xle3oHB
	2fD3AWsCkdyAEesddExy4enVKwY/Y0T5nEnGV+Y0qZiZLOGRR/KcbDXQxxfiJ306lrnzDu5QTHb20
	GrN1ECR+cLe1M4o6KjTsxnXNj8Nz5AjDet8C9zN9jYcC0onEWJxWiwUGdKR3mRKXt6AVXnSVGrZ7Z
	+9EznEOn3yAFvsr8X08LmlCV4r6RcVHNvSdLdMfWpxSoOcz44DvzoJdXywTAI6ua/L1NNfQz3m3GT
	FIqpPigg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1zA-0000000GWMG-0DVn;
	Thu, 21 Aug 2025 09:53:32 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0RT-0000000GCgl-2o9R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:14:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1ac1bf0dso4185105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 01:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755764078; x=1756368878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFT6WngKMwHZUnIYZ6NFySqzw0d5WuAMHkLFTx3V41Q=;
        b=eFLsz0NbcLrAYTQWz0PfTDDyPt/F4LhtsK5NOT6soD4k4wgUj+TZs0pL4f7zu+3LfC
         yI74CU65mtsNGPbXI505uTvwRbT+ASqlz3bSRK1dTo1JDACg7m8tWQ291OVTizjjBHer
         iUdxJHQ979yme3L8/HLji0+5Imm5yJVwq+7MWAH9yYabAqofwtjFZ/sZmH7hevrfDxNk
         60vJoXAc1A3F62cKR2KhrLYDc1Vpcx9mvwJMFizJHAgGdcq7CDUNMwCgn+Yj5iGdgLfV
         vwpP74cKKt3eEP1YfGt48r9mlVcM8vtSLB8d2HqnkUcDMgQhSDrCsar926U1IN+s4BSQ
         v0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764078; x=1756368878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFT6WngKMwHZUnIYZ6NFySqzw0d5WuAMHkLFTx3V41Q=;
        b=G9sFfxf3vYsIsj5horH5SHBaZO+hrgQkTVDQasMCJ9mfOHHtGrEBz4BjpuyM+4vmDp
         66S0w6w8hbNreMthZa64GQq7iZuYY8eNKWKFMu6L0B47h8DaUzw/0DcKjUFncRhU7JxF
         gQYIAEWPdZj+otAVPGtdMAbiAhUycfszkONjK2hADDQU7J9rI0rwQ/YgVBVokSJLyeKv
         PonJ2bOIhlpVpThcysNoNUGEj6xRxAqvh7SJi8gql9nbJS6gGQXLKN76OvZ2WqYBG3a3
         Wc0moKpdctPT/nXOaj47MocQQV+j1QM2NbhhOLCB1We3mAIedKOZjr8aF5BhUMzC7ePp
         9n8g==
X-Forwarded-Encrypted: i=1; AJvYcCVbHyQ1axTMzdxHA9Ib3/Hju1IWPeaoh6/gBtcU4Sd4pAD8TarJ5b0mLr8uhicyf4enOFqxlh1UBbsEwFqku4o7@lists.infradead.org
X-Gm-Message-State: AOJu0YyLj0kVvIZpE51N0NX/trGkJ+40SDv97WVG1OlcYuZQKxccfY5I
	3FmQbUKzvNkmCm6JbBIkOKrW+ANsfqmrrF8WsFqktZqmD7nqrtFSoW5/+kDXwjhOBv159aKe/mf
	BvQ7SCgTohUr23vrKb1KfGw==
X-Google-Smtp-Source: AGHT+IFAQlXPyTnG3JiChKe5DFLBDr2rP8AXh2IodHFt8ePrOH2SUaDoS3AE4kl8mvBz78HTv39+GgQn9/pGZ7FM
X-Received: from wmti5.prod.google.com ([2002:a05:600c:8b85:b0:458:715c:51a1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4710:b0:456:189e:223a with SMTP id 5b1f17b1804b1-45b4d9ea7c9mr10900275e9.10.1755764078269;
 Thu, 21 Aug 2025 01:14:38 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:14:01 +0100
In-Reply-To: <20250821081412.1008261-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250821081412.1008261-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250821081412.1008261-14-vdonnefort@google.com>
Subject: [PATCH v6 13/24] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20250821_011439_707580_6AF629F7 
X-CRM114-Status: GOOD (  16.30  )
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
index d6761dc2f404..e74707f10b93 100644
--- a/include/linux/simple_ring_buffer.h
+++ b/include/linux/simple_ring_buffer.h
@@ -47,4 +47,12 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable);
 int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
 int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
+
+int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer,
+			      struct simple_buffer_page *bpages,
+			      const struct ring_buffer_desc *desc,
+			      void *(*load_page)(unsigned long va),
+			      void (*unload_page)(void *va));
+void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
+				 void (*unload_page)(void *));
 #endif
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 3efdb895d77a..56b4701979ba 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -64,7 +64,7 @@ static void simple_bpage_reset(struct simple_buffer_page *bpage)
 	local_set(&bpage->page->commit, 0);
 }
 
-static void simple_bpage_init(struct simple_buffer_page *bpage, unsigned long page)
+static void simple_bpage_init(struct simple_buffer_page *bpage, void *page)
 {
 	INIT_LIST_HEAD(&bpage->list);
 	bpage->page = (struct buffer_data_page *)page;
@@ -290,10 +290,15 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
 	return 0;
 }
 
-int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
-			    const struct ring_buffer_desc *desc)
+int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer,
+			      struct simple_buffer_page *bpages,
+			      const struct ring_buffer_desc *desc,
+			      void *(*load_page)(unsigned long va),
+			      void (*unload_page)(void *va))
 {
 	struct simple_buffer_page *bpage = bpages;
+	int ret = 0;
+	void *page;
 	int i;
 
 	/* At least 1 reader page and one head */
@@ -302,15 +307,22 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 
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
@@ -320,7 +332,13 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
 
 		bpage->list.next = &(bpage + 1)->list;
 		bpage->list.prev = &(bpage - 1)->list;
@@ -329,6 +347,14 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
 	bpage->list.next = &cpu_buffer->tail_page->list;
 	cpu_buffer->tail_page->list.prev = &bpage->list;
@@ -336,19 +362,46 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 	/* The last init'ed page points to the head page */
 	simple_bpage_set_head_link(bpage);
 
+	cpu_buffer->bpages = bpages;
+
 	return 0;
 }
 
-void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+static void *__load_page(unsigned long page)
 {
+	return (void *)page;
+}
+
+static void __unload_page(void *page) { }
+
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc)
+{
+	return __simple_ring_buffer_init(cpu_buffer, bpages, desc, __load_page, __unload_page);
+}
+
+void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
+				 void (*unload_page)(void *))
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
 	cpu_buffer->bpages = 0;
 }
 
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	return __simple_ring_buffer_unload(cpu_buffer, __unload_page);
+}
+
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
 {
 	if (!simple_rb_loaded(cpu_buffer))
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


