Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D80F41810
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYLWsoQ02WLCqnUt0cBCdmffcm851eUUlDHUboLm26o=; b=s/F2QWElHbpuR4gJHJ5rZ095YT
	rjNliPsk4plNwFrJ+dCiAtWEONJp7j4Cz+2OPKUVO982r8FF0b3D7FjQBlZFKvoSg2HbDFy21oQ+5
	8R3ELwbGBD4SOl5FBKiEq2c8n9ORRhq+V1RVIAC/066EighksJbAjRfT1TD5K+9U2Kwhu04+/DPmC
	UPAqGbJuZuFo41PQZEVhdahROz2cCjWtXO9LMQUEW1//taB8a+jh0ziVejVZqklAXWqmsK31NzHEh
	UDTpM+M5v2qVEIPrOHVvZm/jv0D4ANgEXalZkKHmqRyTqk96EJ7kpPZqoSa95NXk3o+YEiicOjth8
	NUnEB+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdRE-00000007hUp-3H0U;
	Mon, 09 Mar 2026 16:26:36 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdQy-00000007h69-14TA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:26:21 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b9410af72c3so518120466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773073578; x=1773678378; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYLWsoQ02WLCqnUt0cBCdmffcm851eUUlDHUboLm26o=;
        b=P06jVl95x/sNUMFg+Tm9m4U2FD02siPJXjkr0EZICsSSH4kCiM8o/dFa5ofmW2qeMG
         z0cZ6a3H2HvEESZZhRuuJVpaZgcNDZrXo1ea3TehpsewAqmk3lY9pu2CIABlCPeU6IOh
         9UuD6TkcvrDQdTFmrrvR4oMzqm2M34nfmIDJ1kAXG2rI/65mRjPIT0wbeHiCbbFd8E6W
         LkTnVBlT/cA7b0X2Tc4jIM1UQiO+9V9Do4b7VhA+bSYegZJ0jxyAn3Dwo36MeFnVR75r
         SxcP/jdJQKSZCDpDcpi/44EKIzTN/PrlL4KIuQjQ0KRy5SUV2kY7PUOPTsdUo9waYdgB
         yiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073578; x=1773678378;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYLWsoQ02WLCqnUt0cBCdmffcm851eUUlDHUboLm26o=;
        b=LvFWAnfddc9qnmMSwn2eMR5r6HvFtV9CzzzYCQOyBE19mwY5Ezk/UjG2IkAfiE9O0W
         hlnBHj6b+9jynIlHTGmtqb2NKqhNyGa/uhWtCSWDcBB/yBV9i1l7OXcSZashAUqv7P/h
         WLSNTj49m3BQ2PQfmxhl+3/32PE/Ddk21njnDg2+FjbjC22F5jgflSjHPLritA4t2SGk
         xEPs08h51A1yh6v5F2mX8N2kh4IS4ZNnJNG9C94MfTMpc4iADKoS3KzI1qyZ8dMDKE69
         w2aFwi1XjR9ggqmS77JEcbKfKJJOOqcJcghkn4rmODJVNiyLm0SDiVCvzKpcKpqH+lpk
         5nrg==
X-Forwarded-Encrypted: i=1; AJvYcCXqBNXgXBDzo+T1IyxwWs7fJ4m3sfbC1FGxyNtdk6A4z1YkbIQpLW2TUZhF1ubWQCrTrUjz5FsN8m6obGF11Upd@lists.infradead.org
X-Gm-Message-State: AOJu0YyAnpUZwCAZcBOMhyYcmzBdCMs8kacWBLqZhLj1i9vGCsCVXVOJ
	bO+62ABYjNpIldWPxKtlLjjSO8G+UAyaLUaw/WAhueKN2DIbnfhLWg2bk2rdn8z8ezg9Nvwnkhc
	AYo2TQc12Rz0dz1J3oyv57Q==
X-Received: from ejblr4.prod.google.com ([2002:a17:906:fb84:b0:b94:fb7:ac7c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9707:b0:b8a:f3c0:c09 with SMTP id a640c23a62f3a-b942dfc710cmr667325566b.59.1773073577740;
 Mon, 09 Mar 2026 09:26:17 -0700 (PDT)
Date: Mon,  9 Mar 2026 16:25:03 +0000
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260309162516.2623589-18-vdonnefort@google.com>
Subject: [PATCH v14 17/30] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20260309_092620_339689_CE501A7D 
X-CRM114-Status: GOOD (  16.82  )
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
2.53.0.473.g4a7958ca14-goog


