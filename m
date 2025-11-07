Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEDECCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ce/zCDzb2G2ckswnrXnLfB3O70YfrWa+rKSIYEMNvwM=; b=D+O45kx5lrP2pA5R147//47Cdf
	drXQBsIDgCd54V7Z+/FBWmG0VN4D+ZqQ6RlWr6qT5yfjGxrKliCq0pE8KMvIQQMhjZkADpQ+qCoGg
	3ja+QQRlREqLDEKUlRmUWk2iXwGRxm68ACrBY4ox7d88+onefdFIqCUID/fsYoEuEYRWw5hvjuUKg
	IzYR7hdo9Ut0PrSWK6fYenrSDE1RYOce0FRGMo6x/42T4KyXrgWIfI70Zx4ssZm2/QiNP4Cj5xPge
	n0dE6bAtp6VVzeyg4geTIXThlUKCrJ+bMENcn5z8YWnfbjJ/+t/Paqj2EjIAXhYXt4vUN9/mzbNb1
	wP+S2OAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIwS-0000000Gz5N-0VSu;
	Fri, 07 Nov 2025 09:39:36 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIvy-0000000GyYq-2FK5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:39:08 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4776079ada3so4795955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 01:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762508345; x=1763113145; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce/zCDzb2G2ckswnrXnLfB3O70YfrWa+rKSIYEMNvwM=;
        b=zA8zSKwhxLUJP3e1177RWyLGSI+MpczKpXBzCGpYeyulJPWCE/tHrxmjqeX2r2oene
         zu0ZGqCFVXwJX+Y0Bkk7XYBo6Lv14xcop/mDAaNUe6Wkkb2ncutElAWNjZN3tMH03DcD
         9meqX5i3WqEgKs1BuRmUr5mGPIMzIFvH0wMaXk4CIyTboPn+qRf0Ndg5BFBKbrw07fXP
         GuLuY05a0+N1kY6tM5zPB/DT2HhKLLtbmoVWgv64lk415L41Wwcuwolo96YywfC8Gd2t
         ULqIlOIGu8ZLGBKm7gf45OUzIrVGYsV6TkDfJ+Hnz0nuX9/BDoTAJBbw4yAw28swLDeQ
         ktHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762508345; x=1763113145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce/zCDzb2G2ckswnrXnLfB3O70YfrWa+rKSIYEMNvwM=;
        b=lEEIseUmnxcf5suMGG2u8o3gt5Kx5Itu6neoTG0KbZfKcIrvIEU2v+03837ijla/4V
         ATXFL6CNXFhadRFdmNHwO19YWzUVBiFYL7uZjj0954p+rIXZzmklaOvvl3wSzW4TrRST
         ivcFH9qBFNTwkC/YmaSQx/UmKvixiyHM7QdHFYeqwJDf6d/4Klx6py3CPhKl9VXxfAOT
         /NZXjFdXbcdLLKYfJ/B2QXVihUyXrtQk8TBb3Lqy7Am3tLbiCUn4t2lxyieyftLt9Hns
         tmjYUq4MzNBmXACKapN5G+i90TwWc6GnJ1oK2z3OzwM5qTN50EwEQnquGyEA+hGFV7oV
         3XbA==
X-Forwarded-Encrypted: i=1; AJvYcCVbvKWb/AKFrr1/1zNmhb+1MNELiP8af7B1hJ7wVgRRrk/tu2cuuR6kTeF5cw22WuWy7z7AOeCGr8wMchMax9av@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyejl3OPQS/MnCPlD0a+vHy0VXB0dUkNrUy9xRcPy6n9sMza5l
	ZNOZmGjYoBpStklLyj9OkzBvP94PbYoziXDnIhqPmFqVv39cmJga3oJsV2ehEeyiszyUMx11MOF
	1jaGxfLrq4Pjtez38YaVgrg==
X-Google-Smtp-Source: AGHT+IHH6KySUg+bVxUdc2Vx4JCZPm6fDNIkH+y4qKSJ90mdCNMhcU8xm4yct+fqYgyGXkQZSGI0QTJtlUIwPdd8
X-Received: from wmof18.prod.google.com ([2002:a05:600c:44d2:b0:46e:2eb4:38d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1381:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-4776bcc5191mr24288135e9.34.1762508344724;
 Fri, 07 Nov 2025 01:39:04 -0800 (PST)
Date: Fri,  7 Nov 2025 09:38:29 +0000
In-Reply-To: <20251107093840.3779150-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251107093840.3779150-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107093840.3779150-18-vdonnefort@google.com>
Subject: [PATCH v8 17/28] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20251107_013906_613423_2CB4A731 
X-CRM114-Status: GOOD (  15.83  )
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
2.51.2.1041.gc1ab5b90ca-goog


