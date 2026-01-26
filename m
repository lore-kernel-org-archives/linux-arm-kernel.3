Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA43CF65D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDghCh0fr0GDHLlC3mDjOKrkpIDo4KOlE5bpU6iht6g=; b=j03a/PlmhLD9oWsdD4WYPfeqsf
	6R4GlNBiVwWG00avjtFGdGrmiKYblap+S/3A71sqrBLUYg2f1WTmZXD/N74RWGfIGF3Z1WvRCQbRO
	9Ap8BKWEIBUpaXqFIUT0RWam2MEic2JjAZFyJvkwlZcYAzzoUhHgODrhQfpZtShfv/KQjXMrGlG2+
	Hh4eGfQ/YCefY+RFPScn/ixfBzvIQzkSVS3/2ZBp4Pq46iqGbUg7VmXhHulLSYNdwMno/j3Ghk0bw
	h1BA0sUGx/pdaWmf8GYvQ2MBkLUs2T3DJ9SRkKCXnOht0uuXPVegpmZ2Ko8Uy2ZIRqoV+atcIEJVz
	2vX35GHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5I-0000000CJQz-0M6z;
	Mon, 26 Jan 2026 10:44:40 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK58-0000000CJJC-1Ro0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4802bb29400so77855845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424268; x=1770029068; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WDghCh0fr0GDHLlC3mDjOKrkpIDo4KOlE5bpU6iht6g=;
        b=Y413RNgHXc0EC2c9Y5cIacsv787Va7wGTILmzmQe9n7uQSD+sle/3Qfb+5MGrhoaZa
         YG9CU5RYEPSC74BtZM/Mpbedzz4TF3cWkMBrsHE83l3/T0w6XNbEeoO+gwOvjFG+NSmY
         822Xa3ASQzL3qYLVSlD2V3ix9BRGvz5+PAiLgcd0wOOq+LIEz/P58kdEaC+tUVddj5r5
         0rxvk3AL0VadXr1lp3moBlteZsspxIIvG+SwjcAeU3cFo83opO4DeD0hNtHRJzduwwlI
         a549sJtuHlPrtRswLxU86rc2Y692DykUy3t4e8iR6ovX5TnQhuGdx9AFLsRLAvRUhSwD
         gQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424268; x=1770029068;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDghCh0fr0GDHLlC3mDjOKrkpIDo4KOlE5bpU6iht6g=;
        b=mEVepYfpJ3Qy0DLmo5QWQcnoW1kJ9agDR5+pB9mdiOn6nXg+ziKfwynTSqCfdz5QBP
         jSBsH9r/UbDJ3imKEUkNnbHarnQ0EmMBH7jHuQJsq6i5HFJt9ELHMJTIh1innhnLYRAf
         MKkoEEBC0KRnOj9F9/B87zUmqrz5ZwLcneDtRfpeWduEYIdlkskSf9ebX0F+kjLPWvTl
         XjxcpKo3yEOll0x6qrzjbejtH3pKRJgcZRZtx2/WMe3G/sKf1kR+OuK9aVyVcanm0AY0
         GBCy++GXl1v+VXFB4S/vD9NOWThcMjkKVG+FtCLqqN7UYcvZEW11iNGRin/OQ5mj4+7j
         UFHg==
X-Forwarded-Encrypted: i=1; AJvYcCWWOKXQyaS7dbxod7MBJhtJzDJe/+dJ6kn8WhYCryqmBBOK6mQLkFXqcg8GJGyb7/enxkDWVeVF6bZN3xQsR08M@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg/8X0l7soNdu7JbzBJsjWwGiQfevcnYM9M42s+io3l3ISzlnN
	GJEfwtIYmAhVMkJg67t6TDvzDSgtXvvzpABxCM22zvJLALYWb1Fr3weuUa9EcPgw3Hsl9orwM21
	5o8yXxl9t6Jx01xu27yxOVw==
X-Received: from wmcq10.prod.google.com ([2002:a05:600c:c10a:b0:477:aa9e:db24])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8905:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-4805d9664a3mr42612985e9.5.1769424267888;
 Mon, 26 Jan 2026 02:44:27 -0800 (PST)
Date: Mon, 26 Jan 2026 10:43:51 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-3-vdonnefort@google.com>
Subject: [PATCH v10 02/30] ring-buffer: Store bpage pointers into subbuf_ids
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
X-CRM114-CacheID: sfid-20260126_024430_411434_83020628 
X-CRM114-Status: GOOD (  15.52  )
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
index 1187d632dd5d..a5d11487337e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -554,7 +554,7 @@ struct ring_buffer_per_cpu {
 	unsigned int			mapped;
 	unsigned int			user_mapped;	/* user space mapping */
 	struct mutex			mapping_lock;
-	unsigned long			*subbuf_ids;	/* ID to subbuf VA */
+	struct buffer_page		**subbuf_ids;	/* ID to subbuf VA */
 	struct trace_buffer_meta	*meta_page;
 	struct ring_buffer_cpu_meta	*ring_meta;
 
@@ -7013,7 +7013,7 @@ static void rb_free_meta_page(struct ring_buffer_per_cpu *cpu_buffer)
 }
 
 static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
-				   unsigned long *subbuf_ids)
+				   struct buffer_page **subbuf_ids)
 {
 	struct trace_buffer_meta *meta = cpu_buffer->meta_page;
 	unsigned int nr_subbufs = cpu_buffer->nr_pages + 1;
@@ -7022,7 +7022,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 	int id = 0;
 
 	id = rb_page_id(cpu_buffer, cpu_buffer->reader_page, id);
-	subbuf_ids[id++] = (unsigned long)cpu_buffer->reader_page->page;
+	subbuf_ids[id++] = cpu_buffer->reader_page;
 	cnt++;
 
 	first_subbuf = subbuf = rb_set_head_page(cpu_buffer);
@@ -7032,7 +7032,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 		if (WARN_ON(id >= nr_subbufs))
 			break;
 
-		subbuf_ids[id] = (unsigned long)subbuf->page;
+		subbuf_ids[id] = subbuf;
 
 		rb_inc_page(&subbuf);
 		id++;
@@ -7041,7 +7041,7 @@ static void rb_setup_ids_meta_page(struct ring_buffer_per_cpu *cpu_buffer,
 
 	WARN_ON(cnt != nr_subbufs);
 
-	/* install subbuf ID to kern VA translation */
+	/* install subbuf ID to bpage translation */
 	cpu_buffer->subbuf_ids = subbuf_ids;
 
 	meta->meta_struct_len = sizeof(*meta);
@@ -7197,13 +7197,15 @@ static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
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
@@ -7230,7 +7232,8 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		    struct vm_area_struct *vma)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
-	unsigned long flags, *subbuf_ids;
+	struct buffer_page **subbuf_ids;
+	unsigned long flags;
 	int err;
 
 	if (!cpumask_test_cpu(cpu, buffer->cpumask))
@@ -7254,7 +7257,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 	if (err)
 		return err;
 
-	/* subbuf_ids include the reader while nr_pages does not */
+	/* subbuf_ids includes the reader while nr_pages does not */
 	subbuf_ids = kcalloc(cpu_buffer->nr_pages + 1, sizeof(*subbuf_ids), GFP_KERNEL);
 	if (!subbuf_ids) {
 		rb_free_meta_page(cpu_buffer);
-- 
2.52.0.457.g6b5491de43-goog


