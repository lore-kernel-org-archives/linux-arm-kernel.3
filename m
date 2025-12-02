Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8181DCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RUUJZsquxOXeuP2Pg9tN94A9Yt3ERqnIi7HwVBkSP8=; b=zfg8L/I4i6hhUfA3DhhUnS6MzS
	WwcSGssT1+4IB8FpxhaR84lP0tMhtdSItCmI46PBZxBKYkAbgos8qTWkJolJf41f2JZu202POV0f/
	I3xugn489QPY4zZuvTeyVm6sh/H3rWdmZM9ITtj5s4EFK6a0ET+m4u+HwRjpzsz2hyvCzjCBjpwvR
	GjafkvkHRYSLcgH1Skzy7HyGy7Tbf/VnktlT2bOZqdvm5BTsvcZcA7K1HwHsWlc7lwuLQRIO8yHLS
	M1PvYrERI2Fcjd+DYLLK4DO8ktQ9xpWCC89NhDWWfyzNgyucusPS5IE6I6PCnsSNUe0vNTpGkFZkd
	q/zBVM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMom-000000058aG-1rcb;
	Tue, 02 Dec 2025 09:37:08 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoU-0000000588l-1B7o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:52 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b2b9c7ab6so2687159f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668208; x=1765273008; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RUUJZsquxOXeuP2Pg9tN94A9Yt3ERqnIi7HwVBkSP8=;
        b=k/SDQIkbcDvVNgd8Au5hKaAzB8ez6nVMl4aJhCRquhS6ICrbTvqlhIBLWsR6ATCo9C
         DRI9gN4sysN4BT3kybZj3EG6ISNgWvm5/EEDYuFGgLOSuK+Sh8qX4nH2/yvln1hnn4PM
         /+v5y/0ZlCQY7F79VhjXueL2AtGdRElsFwfapXRD7r2fVetv9JGAmnU8b+QY/6E8xr6H
         e6vVZYipuHAbRsk2gLRru1TJzOyewRYQWOazuV7swQ5/sSDB1thZbgW2ujjlqOry7n9s
         +7FYRWxhE3QZegpAGwxXED+haaRPSXTZba+T8j3pY0scQ/9IbHOUi98Fu3n4VIEyiAtf
         ifvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668208; x=1765273008;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RUUJZsquxOXeuP2Pg9tN94A9Yt3ERqnIi7HwVBkSP8=;
        b=NTCjVc/bmKMcaBkr5NhbNkrAwo+420LaTfxAIuWuAfZsVAV9AGIHtYV7CbBr5RbadQ
         rXKT9ftmdc6URha2oetyjPWVUZFDBM0P9iW1+TtoMyx3TQ2GdHlI0MFKuK+QPBHdGC6i
         iTjl2/Nn4Y8ZJmA8SLaCCgBFYDsaH4Fho3sJd9qRnhYe/PdAoN8JSv+67dpzuh1HxdmY
         wQWWpAfKS2q9NbtqurFUG75pa4C8RCRQfu0ttatdD32FS6nZrJuSVSbV0q5eobEX/ht5
         EKPRzCAJ/+DSaQhiKvFZkRJStGWR0G6PLl4P7lqib+O7k7hOOvurcvLvZkjAg/XgY92l
         Df9A==
X-Forwarded-Encrypted: i=1; AJvYcCWwr72oj69nXLzWPHEs4+VR2nvwtRa0r7UyMc5rKO6+Fep16xNtN5qckr3QPLAeWO86pjy4V7pn25GVL6sQB3XQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yye++88sjsz64F1kIblc38x453DjjptWsBmNu2ctmO6Y2rB70fu
	yRuYK10A3I+FhokEzoEDh9pPoSsQqlQEEYR1A+i7LV2EM2jHi6ZiQxu/o1wH6KQrofWMyJSXQHx
	q9ME3SULi2yuXbRWijfK3wA==
X-Google-Smtp-Source: AGHT+IHrDFtedTZyVUtzkJIFrMPO8omRoplTv7/BRs17/UOxsotOGE3hdr1vCHsHZRUxhF+2MMzcvl4M8NrwuY1C
X-Received: from wmjq21.prod.google.com ([2002:a7b:ce95:0:b0:477:63d9:f561])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c25:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-477c114ed70mr572321915e9.24.1764668208094;
 Tue, 02 Dec 2025 01:36:48 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:10 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-18-vdonnefort@google.com>
Subject: [PATCH v9 17/30] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20251202_013650_463399_B9B61B22 
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
index f324df2f875b..ecd0e988c699 100644
--- a/include/linux/simple_ring_buffer.h
+++ b/include/linux/simple_ring_buffer.h
@@ -110,4 +110,11 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
  */
 int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
 
+int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer,
+			      struct simple_buffer_page *bpages,
+			      const struct ring_buffer_desc *desc,
+			      void *(*load_page)(unsigned long va),
+			      void (*unload_page)(void *va));
+void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
+				 void (*unload_page)(void *));
 #endif
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index 1d1f40c8c6d8..f01386975266 100644
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
@@ -342,10 +342,15 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_reset);
 
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
 
 	/* At least 1 reader page and two pages in the ring-buffer */
@@ -354,15 +359,22 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 
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
@@ -372,7 +384,13 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
@@ -381,6 +399,14 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
@@ -388,21 +414,48 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 	/* The last init'ed page points to the head page */
 	simple_bpage_set_head_link(bpage);
 
+	cpu_buffer->bpages = bpages;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_init);
 
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
 	cpu_buffer->bpages = NULL;
 }
 EXPORT_SYMBOL_GPL(simple_ring_buffer_unload);
 
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	return __simple_ring_buffer_unload(cpu_buffer, __unload_page);
+}
+
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
 {
 	if (!simple_rb_loaded(cpu_buffer))
-- 
2.52.0.107.ga0afd4fd5b-goog


