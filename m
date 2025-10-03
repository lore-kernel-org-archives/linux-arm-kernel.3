Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781CACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cusWrm7Pe7Vzh2zNqiDKt7LKbdzyFf6LREbhhod2FBw=; b=buuz6uZXUNWv0zyggqIxjDJLEr
	DSPH5H7FcAPF0wXAGfkM5xwSVDrtpHR9CxHubK9o60Ne2HJBPFc3rJQhP2EdlYzTydQ+6d0LFmEF/
	WTWMr6fb3tVARUv1wVmuufkooNbYIBH5wkw8f1Jpedd278WUl7M4B/t2ewk0n+GbVChdl2tRotmEU
	4I6cL2D4CxtiwVCc2LvCYvlvI4OcHXyZZC1rVySrFtKX3EY1jfqATxaLLmCddGqVkfEVn7p2Wza0U
	bYZDwSRV1giyQZgyje6jKl7KGcmrg93KJVyWrc2IWmoKcKKgEyhPmsqVLddy/IuFyjMDT0QdvfAPs
	s/yGv3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0V-0000000CQot-0GXp;
	Fri, 03 Oct 2025 13:39:35 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4g0B-0000000CQIc-3Ptv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:39:18 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3f44000639fso1382779f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759498753; x=1760103553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cusWrm7Pe7Vzh2zNqiDKt7LKbdzyFf6LREbhhod2FBw=;
        b=WUG8aTA47Z+nv0aCm3zTXTKrOlfc2Q+aD3S/0eYmLbk0S2RhpKjWIYwb0eXKEnBZDM
         XBbdIwxoLWQdg6okFNEJ1ZPH4uPpNzz+pSsCtQ0wo76a71xhqTpM7SFB3O9KURPW50TO
         WyzH73PwlVxL4EjkQeU4x/IWp8pRCJQwd4HwSdSfFY5qyDN/HCAI4aqmcLUSX3Kko5Wx
         1iFVh6cVS5fWBva44mt4eBWiO3+UJ2Rk+86w207YXaeuc9tehX9cItagp/ey7jXmFhwd
         P4RuRoZSxrahT2yqwB70htz4T8r8DccqNj+WQ/ztuYiwUJ67yJxS6zwVKXPksaKRmWl8
         iGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759498753; x=1760103553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cusWrm7Pe7Vzh2zNqiDKt7LKbdzyFf6LREbhhod2FBw=;
        b=INokJwY6NzzWN+qR5STcq4uj6t27YoPXef0T1ZziE2Xjs+3LkCznZXRBevZP3bLfth
         BF9KPDNHRQ14WA2OX4k1HZegNUApw2W4Mi6QLWaWJKLv3MPchl2e5br3afJx8kAHGKby
         aoT/bSt1Z4T0dHOYkDrU2FVf7qOhKQyBNSAQEraXg8M/cyS4XGQ04T+C8BwlM4PAnlpU
         2rI57DHPhepZPap4AqBwU4IJrkkh1b+TUfYsG41/9Zr17Xe5G7+TiuYTzRwlf2OOJHow
         pmK6OYdrTUmsDEhtHuju7pL/MBkkmfIwMFnDMYZ/5oY5bW0L5cnnehmysEyz5i7kt79Z
         JJhw==
X-Forwarded-Encrypted: i=1; AJvYcCVaB09V+m7lxxuHCH/y6BYMij5sE5PZKEHSDvD0igh6lNUL4ufKkW8/xBAgTxrgjcvfzWEmpKbN/BZYneAbqy1s@lists.infradead.org
X-Gm-Message-State: AOJu0Yze4CNiiANS/nvbob0icJgleV/u4vprF61cDB8SDKSHrRS5iIdv
	dlgp8XUX80cwQ3LGS2qstsaIYdr5WFwZgXflMYbQKR13xIba42CeU58I+0+exsmimAbW9/Uo905
	kwN4pyu1jzyL8uD5QgdF5MA==
X-Google-Smtp-Source: AGHT+IF6GiKCqwKfjKEeuxZgNsXAZSGVRxvCwcB1YwHTIPjTMo5AijDWEtVQrQi9EZhBvqgSIyLZKQ4QheeyH+xU
X-Received: from wmby13.prod.google.com ([2002:a05:600c:c04d:b0:46e:3771:b9c9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:18a9:b0:404:ac77:6598 with SMTP id ffacd0b85a97d-4256713ac9dmr2185339f8f.11.1759498753278;
 Fri, 03 Oct 2025 06:39:13 -0700 (PDT)
Date: Fri,  3 Oct 2025 14:38:14 +0100
In-Reply-To: <20251003133825.2068970-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251003133825.2068970-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251003133825.2068970-18-vdonnefort@google.com>
Subject: [PATCH v7 17/28] tracing: load/unload page callbacks for simple_ring_buffer
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
X-CRM114-CacheID: sfid-20251003_063916_016611_E70F33C1 
X-CRM114-Status: GOOD (  16.18  )
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
index 20e3cd6071a2..c2ec6017c37c 100644
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
@@ -338,10 +338,15 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
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
 
 	/* At least 1 reader page and two pages in the ring-buffer */
@@ -350,15 +355,22 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 
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
@@ -368,7 +380,13 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
@@ -377,6 +395,14 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
@@ -384,19 +410,46 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
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
 	cpu_buffer->bpages = NULL;
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
2.51.0.618.g983fd99d29-goog


