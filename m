Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A695CCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaTp/V/0VQ5wl0NsKdZIsTivJaVp4Jv+4QO5H0MFmfw=; b=fhD6oqXeiH+z59ZEY1ywGHB3CV
	svr5GkTQDjls1TqDiFF0D0E5a+gsbIwn6aEQbRR5kN1oDvBw3E6qm1puvtQrzJgkmLfS4FLhiTT8h
	Ix0d+Va+7mYn2xvYoVZump26QPdgCOMWdopm+gqFj9hWbRZMQaCc+FlZUDqhvHNX8OynY2M/447LM
	KG/h4jbxnNvEPgTr5rXkG/9hDNhC507uvjTGDt+sMGCe30KA+xGsIhP6yXyu58oMeuRIvWee4oiaA
	YZD5hc5OX0WZYnjIzxx7scAGJQQuzcMfHKXQM4dqATBPSl38m/PEJF+lrvCZfGGF8YQDJeNV8V/bQ
	n/oX1hHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoK-000000057vo-0ujl;
	Tue, 02 Dec 2025 09:36:40 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoF-000000057rX-3c1u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:37 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42e2d6d13d1so1486693f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668194; x=1765272994; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NaTp/V/0VQ5wl0NsKdZIsTivJaVp4Jv+4QO5H0MFmfw=;
        b=iHaVcdU/qhPqo0xev4XDUiFPtG6K9+L4vq51h2zDp8OuduAChNNct9oP9GdCjE98/O
         rL0l2faTnqymiFxDz4NTPz6yeldoe1/LxVCFTFiH8fA+tl7LmmqDuGmLR5c3+KjyGdPx
         VKaHS6ML4lNlQpmCdQgcDa9WhRUHwaT0BUN9zVQORZy9MoiF2uL5ajAdhcPHhdIyvdnU
         UEPXEMRHCK9UUzdkBHMVRM2G2udmjlEjXNQ1Cr6DfHTPYl9bB2luwEd0MOLMRXFs7H4C
         guKKKImfeHcJJZe1eIDDv9AyfCC9ms2KimhTJeU3CjPBHuruxsDhMLFavnAohrtUQmNK
         g1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668194; x=1765272994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NaTp/V/0VQ5wl0NsKdZIsTivJaVp4Jv+4QO5H0MFmfw=;
        b=BeoHB6+rVzdpe99vp7s7qkOzprXtu2XJdGkgfon+wfuC7CTontGNxV+FtRLQLvZgR/
         AnXy1izoeurHBgoYwhWYZVkcS9+b2VqZ1PSjhkU140Gk9QrI5zOmWkH2uy2ncisX2EHk
         XfuOLj1vGqu2V3siBH9Jf7MV8yPbY0FbWbvn0BAtT3N7TXGkemRwz2fLcndaZ/AIMBz3
         O/NGOme4DXTCOun/WNGhhH+eY70NR4zJtkCMKIff9ueCw9Jzge8eTElnYJp7qinBJsMU
         gG0eQh1/LGF06zbCsvpHXG3ntEsZ1yF/ARlmJ9Y1Q5OHAzMCEC7KvvAbZ3dA0oh4Dgcu
         6Rrw==
X-Forwarded-Encrypted: i=1; AJvYcCXeB7/K2YryVAGNppZvdhANw8QcJ2vA8d28cy2VGof4TRtN8c78CoDKWmnVs/0IRUOR/uIHqKdszVjVCFGkwDsp@lists.infradead.org
X-Gm-Message-State: AOJu0YztKdRGAROBycWap5KuWhm2gV865hNZRTBTBJ9OTjsNSBJ55y/1
	BsqUG9g9xPy8gspJuhJJe6pm6VEvu5eEafdn7Rzs2exp0mrVilqfz3vCs5G1yAnqINJsXdYtW/A
	Y/gPkSLN3RNrBrLdD5YDjvw==
X-Google-Smtp-Source: AGHT+IEO0w7C8+uzCJhGJFqeafT3tVd3XPzAjaD/lM28eUt2wOIl7EbpNMo+Y4PRXxdjJMuNc5RxsiVPK9HaRiCy
X-Received: from wruh15.prod.google.com ([2002:a5d:688f:0:b0:42b:3951:1b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5c89:0:b0:42b:5448:7b11 with SMTP id ffacd0b85a97d-42cc1cf3abdmr45886784f8f.33.1764668193695;
 Tue, 02 Dec 2025 01:36:33 -0800 (PST)
Date: Tue,  2 Dec 2025 09:35:55 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-3-vdonnefort@google.com>
Subject: [PATCH v9 02/30] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20251202_013635_916679_43E4F68B 
X-CRM114-Status: GOOD (  15.43  )
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
index 048dde717b94..aeff2ce6231a 100644
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
2.52.0.107.ga0afd4fd5b-goog


