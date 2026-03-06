Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006AFF5141C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Jbx9+EVK6y4U1OT7nCohIUASMhFn/GxeOgFoW/iLRw=; b=gE46y5eQcMhF06nxfoCLtUtq7W
	6XDDpFKz5rkTWaBtmrX1YwuVF4d+2qSzMMP3DkfP0qhojZgcV2ynak9O4jDa7HJFyiye0TIqOv27E
	4cN020z7Evs3NJYnZa3SaQcrzJ3ATeQGgbADa0g7ky3m8j5bnSqn/zWpHES6WGgIFun3VVIayNisn
	GxMhwZsuE4CqHiHOMB1Mbf8q82kyk5T56uxErxab3UXWcUgL3MZRxLjbVjDtSM4TZiB04br2ogLfd
	3oTvLbBOm/ACI8nm9jZ4a3z0oXz6+hlRBLHhK/ZIkrtJRX6p2fWXte+8eXKdLVkvpmrRmpwRO6I6k
	1kcaHZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHY-00000003uzh-1mCf;
	Fri, 06 Mar 2026 14:36:00 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyWHU-00000003uwn-1zpl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:35:57 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4836abfc742so76466565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772807754; x=1773412554; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jbx9+EVK6y4U1OT7nCohIUASMhFn/GxeOgFoW/iLRw=;
        b=DvaUaMRwD5v0V4vMsaYaC+gpwyRLvovleCdLyH100zrn5CIQXSoOT1Oa9xLd+oXURb
         FbQVpN198Fd1V39BVvpwiL/L6jxsBKTuUYByY73ALbchjIsvy6X2ZhjIX5J15hkNdXfJ
         wFRxEFZzDTPD2SrlfZ8qYuji1So/3xjZIZQSgX4Ek/2csA9H7C2dwOnpz8mV4hynX12X
         D8eNDHUMwBTs67QXh4+D3pA12qC86NJeEixN3g9aJ3HSOdzLyXUtro9GLOrxO6QoIs+p
         w0broALZnU/ooXT2thJjMQESX8RcnbqzK9+3Pgv8Y1Uk8uFCWTbX9fVHRvtiHkOeEbyb
         bb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807754; x=1773412554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jbx9+EVK6y4U1OT7nCohIUASMhFn/GxeOgFoW/iLRw=;
        b=icleDaNtx4B9/QgPHm6cFCf8KOWsT9kZNg5X2aVSl2qK17QLU0oikVrva2XnKGRLtY
         C2RgrslqWUPRgyTD8kehEu80/tZ0B0kR0Kq3eq7atT/SCbes4VMXFmi2/vk6eYiBEeiO
         EoB8Y76zTzGXEj6v0nu2sWLazmu+n06G5OeO8NVT/vNKNZ1f578qH0QkUcS4J3YkLYqP
         skhviEW9jlENRUyBpb1J2/DTEJ9XJqcGmJ8uKBMHwMzB2O1knwKGDEW8xA96kqm7YIOP
         1aqTJVXyZIeB3lAacl+c45W1bwILL5RB/GH7xsMUtlR9TQlpW1uRXe30HcLLFAwxF28b
         HJcw==
X-Forwarded-Encrypted: i=1; AJvYcCUiESWSD8Z4lZSEglXqFzuw6g2Sr8M60Dxw3kiA3WcZ0yCGQmAv1AvoZfYV19HCE9FgD7HEN7sMUTbk5fatmJmQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxOTnuUR8JcoJgitoPgYiIGepyCfZAS4e+rRP4d2ernDQwoWUk8
	9vWkqRS09JUxvO5tJ+vkbv+QUZACIqC3xCtc81+8CpkiSZ0SnErUehY5SjA4q7fmLjFC/8/dZPR
	9atRHZ+0BS2uuiVoGb2+KnA==
X-Received: from wmbjt23.prod.google.com ([2002:a05:600c:5697:b0:483:2c43:9664])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3488:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-48526923bc7mr37026555e9.9.1772807753846;
 Fri, 06 Mar 2026 06:35:53 -0800 (PST)
Date: Fri,  6 Mar 2026 14:35:06 +0000
In-Reply-To: <20260306143536.339777-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260306143536.339777-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306143536.339777-3-vdonnefort@google.com>
Subject: [PATCH v13 02/32] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20260306_063556_532327_40D22230 
X-CRM114-Status: GOOD (  14.72  )
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

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 1b8be41faa78..45ec49d6c81d 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -555,7 +555,7 @@ struct ring_buffer_per_cpu {
 	unsigned int			mapped;
 	unsigned int			user_mapped;	/* user space mapping */
 	struct mutex			mapping_lock;
-	unsigned long			*subbuf_ids;	/* ID to subbuf VA */
+	struct buffer_page		**subbuf_ids;	/* ID to subbuf VA */
 	struct trace_buffer_meta	*meta_page;
 	struct ring_buffer_cpu_meta	*ring_meta;
 
@@ -7036,7 +7036,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7045,7 +7045,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7055,7 +7055,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7064,7 +7064,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7220,13 +7220,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
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
@@ -7253,7 +7255,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7277,7 +7280,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.53.0.473.g4a7958ca14-goog


